DefineClass.TriboelectricScrubber =
{
	__parents = {"UIRangeBuilding", "ElectricityConsumer", "OutsideBuildingWithShifts"  },

	properties =
	{
		{ template = true, category = "Triboelectric Scrubber", name = T{826, "Charge time"},	id = "charge_time",	editor = "number", default = 2 * const.HourDuration, scale = const.HourDuration, help = "In hours",},
		{ template = true, category = "Triboelectric Scrubber", name = T{827, "Dust to clean"},	id = "dust_clean",	editor = "number", default = 5000, help = "How much dust to clean from buildings in range.",},
		{ template = true, category = "Triboelectric Scrubber", name = T{828, "Sphere Speed"},	id = "sphere_speed",editor = "number", default = 5 * guim, scale = guim, help = "Speed of the sphere movement in m/s",},
	},
	
	charge_thread = false,
	sphere = false,
	move_thread = false,
	charging = false,
	UIRange = 5,
}

function TriboelectricScrubber:GameInit()
	local attaches = self:GetAttaches("TriboelectricScrubberSphere")
	assert(#attaches == 1, "Exactly 1 sphere should be attached to " .. self.class)
	self.sphere = attaches[1]
	self.sphere:Detach()
	self.sphere.owner = self
	self:MoveSphere()
	self:UpdateElectricityConsumption()
end

function TriboelectricScrubber:Done()
	PlayFX("ChargedClean", "end", self.sphere)
	DeleteThread(self.charge_thread)
	DeleteThread(self.move_thread)
	DoneObject(self.sphere)
end

function TriboelectricScrubber:UpdateElectricityConsumption()
	local range = self.UIRange
	local prop_meta = self:GetPropertyMetadata("UIRange")
	local min_range = prop_meta.min
	local template = ClassTemplates.Building[self.template_name]
	self:SetBase("electricity_consumption", MulDivRound(range * range, template.electricity_consumption, min_range * min_range))
end

local l_TriboelectricScrubberQuery =
{
	classes = { "Building", "DustGridElement" },
	area = false,
	arearadius = false,
	exec = false,
}

function TriboelectricScrubber:ForEachBuildingInRange(exec, ...)
	l_TriboelectricScrubberQuery.area = self
	l_TriboelectricScrubberQuery.hexradius = self.UIRange
	l_TriboelectricScrubberQuery.exec = exec
	ForEach(l_TriboelectricScrubberQuery, ...)
	l_TriboelectricScrubberQuery.exec = false
	l_TriboelectricScrubberQuery.area = false
end

function TriboelectricScrubber:OnPostChangeRange()
	self:UpdateElectricityConsumption()
	if self:CanWork() then
		self:ResetCharging()
	else
		self:StopCharging()
	end
	self:MoveSphere()
end

function TriboelectricScrubber:OnSetWorking(working)
	ElectricityConsumer.OnSetWorking(self, working)
	if self:CanWork() then
		self:ResetCharging()
	else
		self:StopCharging()
	end
end

function TriboelectricScrubber:StopCharging()
	if self.charging then
		CreateGameTimeThread(function()
			WaitMsg(self)
			DeleteThread(self.charge_thread)
			self.charge_thread = false
		end)
	else
		DeleteThread(self.charge_thread)
		self.charge_thread = false
	end
end

function TriboelectricScrubber:ResetCharging()
	self:StopCharging()
	self.charge_thread = CreateGameTimeThread(function()
		while IsValid(self) do
			Sleep(self.charge_time)
			self:ChargedClean()
		end
	end)
end

function TriboelectricScrubber:GetDemolishObjs(list)
	Building.GetDemolishObjs(self, list)
	list[#list + 1] = self.sphere or nil
end

function TriboelectricScrubber:ChargedClean()
	self.charging = true
	PlayFX("ChargedClean", "start", self.sphere)
	self.sphere:PlayState("workingStart")
	self.sphere:SetState("workingIdle", const.eDontCrossfade)
	self:ForEachBuildingInRange(function (bld, self)
		if bld ~= self then
			if bld:IsKindOf("DustGridElement") then
				bld:AddDust(-self.dust_clean)
			elseif bld.parent_dome == false then --outside of dome
				bld:AccumulateMaintenancePoints(-self.dust_clean)
			end
			PlayFX("ChargedCleanBuilding", "start", self.sphere, bld)
		end
	end, self)
	Sleep(self.sphere:TimeToAnimEnd())
	self.sphere:PlayState("workingEnd")
	self.sphere:SetState("idle", const.eDontCrossfade)
	PlayFX("ChargedClean", "end", self.sphere)
	self.charging = false
	Msg(self)
end

function TriboelectricScrubber:MoveSphere()
	DeleteThread(self.move_thread)
	self:SetPos(self:GetVisualPos())
	self.move_thread = CreateGameTimeThread(function()
		local min = self:GetSpotBeginIndex("Min")
		local max = self:GetSpotBeginIndex("Max")
		assert(min and max, "Min and Max spots not present for " .. self.class)
		local min_pos = self:GetSpotPos(min)
		local max_pos = self:GetSpotPos(max)
		local len = min_pos:Dist(max_pos)
		local prop = table.find_value(self.properties, "id", "UIRange")
		local pos = min_pos + MulDivTrunc(max_pos - min_pos, self.UIRange - prop.min, prop.max - prop.min)
		local time = MulDivTrunc(pos:Dist(self.sphere:GetPos()), 1000, self.sphere_speed)
		PlayFX("TriboelectricScrubberSphere", "start", self.sphere)
		self.sphere:SetPos(pos, time)
		Sleep(time)
		PlayFX("TriboelectricScrubberSphere", "end", self.sphere)
		self.move_thread = false
	end)
end

function TriboelectricScrubber:SetDust(...)
	if self.sphere then
		self.sphere:SetDust(...)
	end
	ElectricityConsumer.SetDust(self, ...)
end

function TriboelectricScrubber:GetChargeTime()
	return self.charge_time / const.HourDuration
end

DefineClass.TriboelectricScrubberSphere =
{
	__parents = { "Object" },
	
	owner = false,
}

function TriboelectricScrubberSphere:GetSelectionRadiusScale()
	return self.owner and self.owner:GetSelectionRadiusScale() or 0
end

function TriboelectricScrubberSphere:SelectionPropagate()
	return self.owner or self
end