
DefineClass.OmegaTelescope = {
	__parents = {"Building", "ElectricityConsumer", "OutsideBuildingWithShifts" },
	
	antenna = false,
	antenna_anim_thread = false,
	antenna_moments_thread = false,
}

function OmegaTelescope:GameInit()
	local antenna = self:GetAttach("RadioDishAntenna")
	if antenna:GetAnim() == EntityStates.idle then
		antenna:SetAnim(1, "workingEnd")
		antenna:SetAnimPhase(1, GetAnimDuration(antenna:GetEntity(), "workingEnd") - 1)
		antenna:SetAnimSpeed(1, 0)
	end
	
	self.antenna = antenna
end

function OmegaTelescope:Done()
	DeleteThread(self.antenna_anim_thread)
end

function OmegaTelescope:UnlockBreakthroughs(count)
	local breakthroughs = self.city:GetUnregisteredBreakthroughs()
	StableShuffle(breakthroughs, self.city:CreateResearchRand("OmegaTelescope"), 100)
	local unlocked = 0
	while unlocked < count do
		local idx = #breakthroughs
		local id = breakthroughs[idx]
		if not id then
			break
		end
		if self.city:SetTechDiscovered(id) then
			unlocked = unlocked + 1
		end
		table.remove(breakthroughs, idx)
	end
	if unlocked > 0 then
		AddOnScreenNotification("MultipleBreakthroughsDiscovered", OpenResearchDialog, { count = count })
	end
end

function OmegaTelescope:RaiseLowerAnim()
	local antenna = self.antenna

	--raise
	PlayFX("AntennaRaise", "start", self)
	local old_phase = antenna:GetAnimPhase()
	antenna:SetAnim(1, "workingStart", const.eDontCrossfade)
	antenna:SetAnimPhase(1, GetAnimDuration(antenna:GetEntity(), "workingStart") - old_phase - 1)
	antenna:SetAnimSpeed(1, 500)
	Sleep(antenna:TimeToAnimEnd())
	PlayFX("AntennaRaise", "end", self)
	
	--wait raised
	Sleep(10000)
	
	--lower
	PlayFX("AntennaRaise", "start", self)
	antenna:SetAnim(1, "workingEnd", const.eDontCrossfade)
	antenna:SetAnimSpeed(1, 500)
	Sleep(antenna:TimeToAnimEnd())
	PlayFX("AntennaRaise", "end", self)
end

GlobalVar("g_OmegaTelescopeBonusGiven", false)
function OmegaTelescope:OnSetWorking(working)
	Building.OnSetWorking(self, working)

	if working and not g_OmegaTelescopeBonusGiven then
		g_OmegaTelescopeBonusGiven = true
		self:UnlockBreakthroughs(const.OmegaTelescopeBreakthroughsCount)
	end
	
	--The animation is as follows: rotate at random angle; raise; wait; lower; repeat...
	if working then
		if IsValidThread(self.antenna_anim_thread) then
			DeleteThread(self.antenna_anim_thread)
		end
		
		self.antenna_anim_thread = CreateGameTimeThread(function(self)
			local antenna = self.antenna
			--Currently lowering (should always be true)
			if antenna:GetAnim() == EntityStates.workingEnd then
				--Not lowered all the way
				if antenna:GetAnimPhase() < GetAnimDuration(antenna:GetEntity(), "workingEnd") - 1 then
					--Then we're interrupting it - play fx
					PlayFX("AntennaRaiseInterrupted", "start", self)
					--Also raise and lower
					self:RaiseLowerAnim()
				end
			end
			
			repeat
				--rotate randomly
				local angle = self:Random(360)
				local angle_delta = (angle <= 180) and angle or (360 - angle)
				local time = angle_delta * 500 --half sec per degree
				antenna:SetAngle(antenna:GetAngle() + angle*60, time)
				Sleep(time)	
			
				--raise and lower the antenna
				self:RaiseLowerAnim()
				
				--repeat
			until not self.working
		end, self)
	else
		--delete old thread
		if IsValidThread(self.antenna_anim_thread) then
			DeleteThread(self.antenna_anim_thread)
		end
		
		--currently raising
		local antenna = self.antenna
		if antenna:GetAnim() == EntityStates.workingStart then
			self.antenna_anim_thread = CreateGameTimeThread(function(self)
				local antenna = self.antenna
				--not raised all the way
				if antenna:GetAnimPhase() < GetAnimDuration(antenna:GetEntity(), "workingStart") - 1 then
					--then we're interrupting it - play fx
					PlayFX("AntennaRaiseInterrupted", "start", self)
				end
				
				--now lower the antenna
				local old_phase = antenna:GetAnimPhase()
				antenna:SetAnim(1, "workingEnd", const.eDontCrossfade)
				antenna:SetAnimPhase(1, GetAnimDuration(antenna:GetEntity(), "workingEnd") - old_phase - 1)
				antenna:SetAnimSpeed(1, 500)
				Sleep(antenna:TimeToAnimEnd())
				PlayFX("AntennaRaise", "end", self)
			end, self)
		else --currently lowering or fully lowered
			--stop rotation
			antenna:SetAngle(antenna:GetVisualAngle())
		end
	end
end

function OmegaTelescope:GetResearchBoostPercent()
	return self.working and const.OmegaTelescopeBoostPercent or 0
end

function GetOmegaTelescope(city)
	city = city or UICity
	local label = city.labels.OmegaTelescope
	return label and label[1]
end

function OmegaTelescopeResearchBoostPercent(city)
	local telescope = GetOmegaTelescope(city)
	return telescope and telescope:GetResearchBoostPercent() or 0
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "OmegaTelescope"
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "AntennaRaise"
	list[#list + 1] = "AntennaRaiseInterrupted"
end
