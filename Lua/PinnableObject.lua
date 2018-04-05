--[[@@@
@class PinnableObject
class overview...
--]]

DefineClass.PinnableObject = {
	__parents = { "Object" },
	
	properties = {
		{ template = true, name = T{3459, "Pin Rollover Context"}, id = "pin_rollover_context", category = "Pin",  editor = "text", default = "", },
		{ template = true, name = T{765, "Pin Rollover"}, id = "pin_rollover", category = "Pin",  editor = "text", default = "", translate = true, },
		{ template = true, name = T{3460, "Pin Rollover Hint"}, id = "pin_rollover_hint", category = "Pin",  editor = "text", default = T{7604, "<left_click> Select"}, translate = true, },
		{ template = true, name = T{3461, "Pin Rollover Hint Xbox"}, id = "pin_rollover_hint_xbox", category = "Pin",  editor = "text", default = T{7605, "<ButtonA> View"}, translate = true, },
		{ template = true, name = T{3462, "Pin Summary 1"}, id = "pin_summary1", category = "Pin",  editor = "text", default = "", translate = true, },
		{ template = true, name = T{3465, "Pin Progress Value"}, id = "pin_progress_value", category = "Pin",  editor = "text", default = "", },
		{ template = true, name = T{3466, "Pin Progress Max"}, id = "pin_progress_max", category = "Pin",  editor = "text", default = "", },
		{ template = true, name = T{3467, "Pin on Start"}, id = "pin_on_start", category = "Pin",  editor = "bool", default = false, },
		{ template = true, name = T{3468, "Blink"}, id = "pin_blink", category = "Pin",  editor = "bool", default = false, },
		{ template = true, name = T{3469, "Obvious Blink"}, id = "pin_obvious_blink", category = "Pin",  editor = "bool", default = false, },
	},
	
	is_pinned = false,
	show_pin_toggle = true,
}

GlobalVar("g_PinnedObjs", {})

function PinnableObject:GameInit()
	if self.pin_on_start then
		self:TogglePin()
	end
end

function PinnableObject:Done()
	if self:IsPinned() then
		self:TogglePin()
	end
end

function PinnableObject:GetPinProgress()
	local context = self.pin_rollover_context ~= "" and self:HasMember(self.pin_rollover_context) and self[self.pin_rollover_context] or self
	local max = context:GetProperty(self.pin_progress_max) or 100
	local progress = context:GetProperty(self.pin_progress_value) or 0
	return MulDivRound(progress, 100, max)
end

function PinnableObject:GetPinIcon()
	return self.display_icon
end

function PinnableObject:GetTitle()
	return self:GetDisplayName()
end

function PinnableObject:TogglePin()
	local pins_dlg = OpenXDialog("PinsDlg", GetInGameInterface())
	if self:IsPinned() then
		self.is_pinned = false
		table.remove_entry(g_PinnedObjs, self)
		if pins_dlg then pins_dlg:Unpin(self) end
	else
		assert(IsValid(self), "Pinning an invalid object")
		self.is_pinned = true
		table.insert(g_PinnedObjs, self)
		if pins_dlg then pins_dlg:Pin(self) end
		SortPinnedObjs()
	end
end

function PinnableObject:IsPinned()
	return self.is_pinned
end

function PinnableObject:OnPinClicked(gamepad)
	-- return true to disable the standard select/view funcionality of the pin dialog
end

function OnMsg.LoadGame()
	for i=1,#g_PinnedObjs do
		g_PinnedObjs[i].is_pinned = true
	end
end

function UnpinAll()
	local pins_dlg = OpenXDialog("PinsDlg", GetInGameInterface())
	for i=#g_PinnedObjs,1,-1 do
		local obj = g_PinnedObjs[i]
		obj.is_pinned = false
		g_PinnedObjs[i] = nil
		if pins_dlg then pins_dlg:Unpin(obj) end
	end
end