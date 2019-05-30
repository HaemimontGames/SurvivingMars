DefineClass.TriboelectricScrubberBase =
{
	__parents = { "Object"  },
}

function TriboelectricScrubberBase:OnDestroyed()
	PlayFX("ChargedClean", "end", self.sphere)
	DeleteThread(self.charge_thread)
	DeleteThread(self.move_thread)
end

function TriboelectricScrubberBase:OnSetWorking(working)
	if working then
		self:ResetCharging()
	else
		self:StopCharging()
	end
	self:UpdateSphereRotation()
end

function TriboelectricScrubberBase:GetDemolishObjs(list)
	list[#list + 1] = self.sphere or nil
end

----

DefineClass.TriboelectricScrubber =
{
	__parents = {"RangeElConsumer", "OutsideBuildingWithShifts", "TriboelectricScrubberBase"  },

	properties =
	{
		{ template = true, category = "Triboelectric Scrubber", name = T(826, "Charge time"),	id = "charge_time",	editor = "number", default = 2 * const.HourDuration, scale = const.HourDuration, help = "In hours",},
		{ template = true, category = "Triboelectric Scrubber", name = T(827, "Dust to clean"),	id = "dust_clean",	editor = "number", default = 5000, help = "How much dust to clean from buildings in range.",},
		{ template = true, category = "Triboelectric Scrubber", name = T(828, "Sphere Speed"),	id = "sphere_speed",editor = "number", default = 5 * guim, scale = guim, help = "Speed of the sphere movement in m/s",},
	},
	
	charge_thread = false,
	sphere = false,
	move_thread = false,
	cleaning = false,
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
	self:OnDestroyed()
	DoneObject(self.sphere)
end

function TriboelectricScrubber:ForEachDirtyInRange(exec, ...)
	MapForEach(self, "hex", self.UIRange, "Building", "DustGridElement", "DroneBase", exec, ...)
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

function TriboelectricScrubber:UpdateSphereRotation()
	if self.cleaning then
		return
	end
	
	assert(self.sphere:GetState() == GetStateIdx("idle"))
	self.sphere:SetAnimSpeed(1, self.working and 1000 or 0, 1000)
end

function TriboelectricScrubber:StopCharging()
	if self.cleaning then
		return
	end

	DeleteThread(self.charge_thread)
	self.charge_thread = false
	self:UpdateSphereRotation()
end

function TriboelectricScrubber:ResetCharging()
	if IsValidThread(self.charge_thread) then
		return
	end
	
	self.charge_thread = CreateGameTimeThread(function(self)
		while IsValid(self) and self.working do
			Sleep(self.charge_time)
			self:ChargedClean()
		end
		self.sphere:SetAnimSpeed(1, self.working and 1000 or 0, 1000)
		self.charge_thread = false
	end, self)
end

function TriboelectricScrubber:CleanBuildings()
	if not self.working then
		return
	end
	
	self:ForEachDirtyInRange(function(dirty, self)
		if dirty:IsKindOf("Building") then
			if dirty ~= self then				
				if dirty:IsKindOf("DustGridElement") then
					dirty:AddDust(-self.dust_clean)
				elseif not dirty.parent_dome then --outside of dome
					dirty:AccumulateMaintenancePoints(-self.dust_clean)
				end
			end
		elseif dirty:IsKindOf("DroneBase") then
			dirty:AddDust(-self.dust_clean)
		end
	end, self)
end

function TriboelectricScrubber:ChargedClean()
	PlayFX("ChargedClean", "start", self.sphere)
	self.cleaning = true
	self.sphere:PlayState("workingStart")
	self:CleanBuildings()
	self.sphere:PlayState("workingIdle", const.eDontCrossfade)
	self.sphere:PlayState("workingEnd")
	self.cleaning = false
	self.sphere:SetState("idle", const.eDontCrossfade)
	PlayFX("ChargedClean", "end", self.sphere)
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

function TriboelectricScrubber:SetPalette(...)
	Building.SetPalette(self, ...)
	if self.sphere then
		SetObjectPaletteRecursive(self.sphere, ...)
	end
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