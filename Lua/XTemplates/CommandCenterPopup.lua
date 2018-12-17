-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPopup",
	group = "CCC",
	id = "CommandCenterPopup",
	PlaceObj('XTemplateWindow', {
		'__class', "XPopupList",
		'Id', "idPopup",
		'Margins', box(-12, 0, 0, 0),
		'BorderWidth', 0,
		'Padding', box(32, 32, 32, 42),
		'MinWidth', 190,
		'MinHeight', 80,
		'Background', RGBA(240, 240, 240, 0),
		'FocusedBackground', RGBA(240, 240, 240, 0),
		'AnchorType', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idBackground",
			'ZOrder', 0,
			'Margins', box(-32, -32, -32, -42),
			'Dock', "box",
			'Image', "UI/CommonNew/ccc_pop_up.tga",
			'FrameBox', box(30, 30, 30, 30),
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetTransparencyRecursive(self, value, root, exceptions)",
			'func', function (self, value, root, exceptions)
local no_exceptions = true
for i,exception in ipairs(exceptions) do
	if exception == root then return end
	if exception:IsWithin(root) then
		no_exceptions = false
		break
	end
end

if no_exceptions then
	root:SetTransparency(value)
	return
end

for i,child in ipairs(root) do
	self:SetTransparencyRecursive(value, child, exceptions)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
self:SetTransparencyRecursive(200, GetDialog(self).idContent, {self, self.context})
local content = GetDialog(self):ResolveId("idContent")
content:SetChildrenHandleMouse(false)
content:SetHandleMouse(true)
content.OnMouseButtonDown = function(this, pos, button)
	if button == "L" then
		CommandCenterHidePopup(this)
		return "break"
	end
end
XPopupList.Open(self, ...)

local container = self.idContainer
container:SetLayoutVSpacing(5)
container:ResolveRelativeFocusOrder()
if GetUIStyleGamepad() and #container > 0 then
	container[1]:SetFocus(true)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
self:SetTransparencyRecursive(0, GetDialog(self).idContent, {self, self.context})
local content = GetDialog(self):ResolveId("idContent")
content:SetChildrenHandleMouse(true)
content:SetHandleMouse(false)
content.OnMouseButtonDown = nil
XPopupList.OnDelete(self)
end,
		}),
		}),
})

