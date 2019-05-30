DefineClass.XBlinkingButton =
{
	__parents = {"XTextButton"},
	blinking = false,
	obvious_blink = false,
	blink_time = 800,
}

function XBlinkingButton:OnSetRollover(rollover)
	XTextButton.OnSetRollover(self, rollover)
	local idRollover = rawget(self, "idRollover")
	if self.blinking and idRollover then
		idRollover:SetVisible(true)
		if rollover then
			idRollover:AddInterpolation{
				id = "rollover",
				type = const.intSetAlpha,
				startValue = 128,
				endValue = 255,
				duration = 100,
			}
		else
			idRollover:RemoveModifier("rollover")
			--restore blinking
			self:SetBlinking(self.blinking, self.obvious_blink)
		end
	end
end

function XBlinkingButton:SetBlinking(enabled, obvious)
	self.blinking = enabled
	self:DeleteThread("blink")
	self.obvious_blink = obvious
	local shine_ctrl = self.idRollover
	shine_ctrl:RemoveModifier("shine")
	self:RemoveModifier("zoom")
	shine_ctrl:SetVisible(enabled)
	if enabled then
		self:CreateThread("blink", function()
			if obvious then
				self:AddInterpolation{
					id = "zoom",
					type = const.intRect,
					originalRect = self:CalcZoomedBox(1000),
					originalRectAutoZoom = 1000,
					targetRect = self:CalcZoomedBox(1200),
					targetRectAutoZoom = 1200,
					duration = self.blink_time,
					start = 0,
					flags = const.intfPingPong + const.intfLooping,
				}
			end
			shine_ctrl:AddInterpolation{
				id = "shine",
				type = const.intAlpha,
				startValue = 0,
				endValue = 255,
				duration = self.blink_time,
				start = 0,
				flags = const.intfPingPong + const.intfLooping,
			}
		end)
	end
end

DefineClass.XBlinkingButtonWithRMB = {
	__parents = { "XBlinkingButton" },
	AltPress = true,
}