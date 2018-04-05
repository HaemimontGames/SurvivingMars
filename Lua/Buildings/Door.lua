DefineClass.Door =
{
	enum_flags = { efShadow = false, efSunShadow = false },
	__parents = { "Object", "ComponentAttach", "ComponentEx", },

	openingState = "opening",
	closedState = "idle",
	open_counter = 0,

	trace_setcmd = false,
}

function Door:Init()
	self:SetState( self.closedState, const.eDontCrossfade )
end

function Door:Open()
	self.open_counter = self.open_counter + 1
	if self.open_counter == 1 then
		if self:GetStateText() ~= self.openingState then
			self:SetStateText(self.openingState, const.eDontCrossfade)
		elseif IsFlagSet(self:GetAnimFlags(), const.eReverse) then
			self:SetStateText(self.openingState, const.eDontCrossfade + const.eKeepPhase)
		end
	end
end

function Door:Close()
	self.open_counter = Max(0, self.open_counter - 1)
	if self.open_counter == 0 then
		local anim = self:GetStateText()
		if anim == self.openingState then
			if not IsFlagSet(self:GetAnimFlags(), const.eReverse) then
				self:SetStateText(self.openingState, const.eReverse + const.eDontCrossfade + const.eKeepPhase)
			end
		end
	end
end

function Door:TimeToOpen()
	if self.open_counter > 0 then
		local t = self:TimeToAnimEnd()
		if t > 1 then
			return t - 1
		end
	end
	return 0
end

-- older saved game fix
function Door:SetCommand()
end

-----------------------------

DefineClass.DoorWithFX = {
	enum_flags = { efShadow = false, efSunShadow = false },
	__parents = { "Object", "CommandObject", "ComponentAttach", "ComponentEx", },

	openingState = "opening",
	closedState = "idle",
	open_counter = 0,
}

function DoorWithFX:Init()
	self:SetState(self.closedState, const.eDontCrossfade)
end

function DoorWithFX:Open()
	self.open_counter = self.open_counter + 1
	if self.open_counter == 1 then
		self:SetCommand("DoOpen")
	end
end

function DoorWithFX:Close()
	self.open_counter = self.open_counter - 1
	assert(self.open_counter >= 0)
	if self.open_counter == 0 then
		self:SetCommand("DoClose")
	end
end

function DoorWithFX:DoOpen()
	self:PushDestructor(function(self)
		PlayFX("DoorOpen", "end", self)
	end)
	
	PlayFX("DoorOpen", "start", self)
	if self:GetStateText() ~= self.openingState then
		self:SetStateText(self.openingState, const.eDontCrossfade)
	elseif IsFlagSet(self:GetAnimFlags(), const.eReverse) then
		self:SetStateText(self.openingState, const.eDontCrossfade + const.eKeepPhase)
	end
	
	Sleep(self:TimeToAnimEnd())
	self:PopAndCallDestructor()
end

function DoorWithFX:DoClose()
	self:PushDestructor(function(self)
		PlayFX("DoorClose", "end", self)
	end)
	
	PlayFX("DoorClose", "start", self)
	local anim = self:GetStateText()
	if anim == self.openingState then
		if not IsFlagSet(self:GetAnimFlags(), const.eReverse) then
			self:SetStateText(self.openingState, const.eReverse + const.eDontCrossfade + const.eKeepPhase)
		end
	end
	
	Sleep(self:TimeToAnimEnd())
	self:PopAndCallDestructor()
end

function DoorWithFX:TimeToOpen()
	if self.open_counter > 0 then
		local t = self:TimeToAnimEnd()
		if t > 1 then
			return t - 1
		end
	end
	return 0
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "DoorWithFX"
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "DoorOpen"
	list[#list + 1] = "DoorClose"
end
