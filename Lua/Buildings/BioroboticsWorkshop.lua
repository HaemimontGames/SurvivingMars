DefineClass.BioroboticsWorkshop = {
	__parents = { "Workshop" },
	
	arm_anim_thread = false,
	arms = false,
}

function BioroboticsWorkshop:Done()
	DeleteThread(self.arm_anim_thread)
	for i = 1, #self.arms do
		if IsValid(self.arms[i]) then
			DoneObject(self.arms[i])
		end
	end
end

function BioroboticsWorkshop:GameInit()
	self.arms = self:GetAttaches("BioroboticsWorkshopArm")
end

function BioroboticsWorkshop:PlayOneAnim()
	for i = #self.arms, 1, -1 do
		local random_index = self:Random(#self.arms-1)+1
		self.arms[i], self.arms[random_index] = self.arms[random_index], self.arms[i]
	end
	local total_time = self:Random(15000) + 3000
	for i = 1, #self.arms do
		Sleep(12667*1.2)
		CreateGameTimeThread( function()
			Sleep(self:Random(total_time))
			if IsValid(self) and IsValid(self.arms[i]) then
				PlayFX("BioroboticsArmMotion", "start", self.arms[i])
				self.arms[i]:SetAnimSpeed(1, self:Random(1500)+500)
				self.arms[i]:PlayState("moving")
				self.arms[i]:SetState("idle")
				PlayFX("BioroboticsArmMotion", "end", self.arms[i])
			end
		end )
	end
	return false
end

function BioroboticsWorkshop:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	
	if working then
		if not IsValidThread(self.arm_anim_thread) then
			for i = 1, #self.arms do
				self.arms[i]:SetAnimSpeed(1, 1000)
			end
			self.arm_anim_thread = CreateGameTimeThread(function(self)
				repeat
					local done = self:PlayOneAnim()
				until done
			end, self)
		end
	else
		if IsValidThread(self.arm_anim_thread) then
			for i = 1, #self.arms do
				self.arms[i]:SetAnimSpeed(1, 0)
			end
			DeleteThread(self.arm_anim_thread)
		end
	end
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = BioroboticsWorkshopArm
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "BioroboticsArmMotion"
end
