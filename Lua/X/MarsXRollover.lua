table.iappend(XRollover.properties, {
	{ category = "Rollover", id = "RolloverTitle", editor = "text", default = "", translate = true, },
	{ category = "Rollover", id = "RolloverDisabledTitle", editor = "text", default = "", translate = true, },
	{ category = "Rollover", id = "RolloverHint", editor = "text", default = "", translate = true, },
	{ category = "Rollover", id = "RolloverHintGamepad", editor = "text", default = "", translate = true, },
})

GenerateGetSetFuncs(XRollover)

function XButton:GetRolloverTitle()
	local enabled = self:GetEnabled()
	local text = self.RolloverTitle or ""
	text = not enabled and self.RolloverDisabledTitle and self.RolloverDisabledTitle ~= "" and self.RolloverDisabledTitle or text
	if text ~= "" then return text end
	local action = self.action
	return action and (not enabled and action.RolloverDisabledTitle ~= "" and action.RolloverDisabledTitle 
							or action.RolloverTitle ~= "" and action.RolloverTitle 
							or action.ActionName) or ""
end

function XButton:GetRolloverHint()
	local enabled = self:GetEnabled()
	local text = enabled and self.RolloverHint or ""
	if text ~= "" then return text end
	local action = self.action
	return enabled and action and action.RolloverHint
end

function XButton:GetRolloverHintGamepad()
	local enabled = self:GetEnabled()
	local text = enabled and self.RolloverHintGamepad or ""
	if text ~= "" then return text end
	local action = self.action
	return enabled and action and action.RolloverHintGamepad
end
