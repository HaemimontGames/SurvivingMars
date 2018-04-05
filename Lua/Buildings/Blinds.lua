DefineClass.BaseBlinds =
{
	__parents = { "WaypointsObj", "ComponentAttach", "ComponentEx" },
	anim_open = "idleOpened",
	anim_opening = "opening",
	anim_closing = "closing",
	anim_open2 = "idleLit",
	anim_opening2 = false,
	anim_closing2 = false,

	open_counter = 0,
	open_state = "Idle",
	thread = false,
}

function BaseBlinds:Done()
	DeleteThread(self.thread)
end

function BaseBlinds:Open()
	self.open_counter = self.open_counter + 1
	if self.open_state ~= "Open" then
		self.open_state = "Open"
		self:Animate()
	end
end

function BaseBlinds:Open2()
	self.open_counter = self.open_counter + 1
	if self.open_state ~= "Open2" then
		self.open_state = "Open2"
		self:Animate()
	end
end

function BaseBlinds:Close()
	self.open_counter = Max(0, self.open_counter - 1)
	if self.open_counter == 0 then
		self.open_state = "Idle"
		self:Animate()
	end
end

function BaseBlinds:GetOpenState()
	return self.open_state
end

function BaseBlinds:Animate()
	if IsValidThread(self.thread) then
		return
	end
	self.thread = CreateGameTimeThread(self.DoAnimate, self)
end

function BaseBlinds:DoAnimate()
	local anim = self:GetStateText()
	while true do
		if anim == self.anim_open then
			if self.open_state == "Open" then
				break
			end
			if self.anim_closing then
				self:SetStateText(self.anim_closing, const.eDontCrossfade)
				Sleep(self:TimeToAnimEnd())
			end
		elseif anim == self.anim_open2 then
			if self.open_state == "Open2" then
				break
			end
			if self.anim_closing2 then
				self:SetStateText(self.anim_closing2, const.eDontCrossfade)
				Sleep(self:TimeToAnimEnd())
			end
		end
		-- closed
		if self.open_state == "Open" then
			if self.anim_opening then
				self:SetStateText(self.anim_opening, const.eDontCrossfade)
				Sleep(self:TimeToAnimEnd())
			end
			anim = self.anim_open
			if self.open_state == "Open" then
				self:SetStateText(anim, const.eDontCrossfade)
				break
			end
		elseif self.open_state == "Open2" then
			if self.anim_opening2 then
				self:SetStateText(self.anim_opening2, const.eDontCrossfade)
				Sleep(self:TimeToAnimEnd())
			end
			anim = self.anim_open2
			if self.open_state == "Open2" then
				self:SetStateText(anim, const.eDontCrossfade)
				break
			end
		else
			self:SetStateText("idle", const.eDontCrossfade)
			break
		end
	end
	self.thread = false
end
