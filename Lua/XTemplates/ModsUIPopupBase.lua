-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idParentFrame end,
	__is_kind_of = "XContextWindow",
	group = "Mods",
	id = "ModsUIPopupBase",
	PlaceObj('XTemplateWindow', {
		'__class', "XContextWindow",
		'Id', "idPopUp",
		'IdNode', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
local content = self:ResolveId("idContent")
if content then
	content:SetChildrenHandleMouse(false)
end
XContextWindow.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
local content = self:ResolveId("idContent")
if content then
	content:SetChildrenHandleMouse(true)
end
XContextWindow.OnDelete(self, ...)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Background', RGBA(255, 255, 255, 185),
			'HandleMouse', true,
			'FocusedBackground', RGBA(255, 255, 255, 185),
			'Image', "UI/Mods/Circle32Black.tga",
			'ImageScale', point(500, 500),
			'FrameBox', box(15, 15, 15, 15),
			'SqueezeX', false,
			'SqueezeY', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnMouseButtonDown(self, pos, button)",
				'func', function (self, pos, button)
if button == "L" then
	--cancel and close
	ModsUIClosePopup(self)
	return "break"
end
end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idParentFrame",
			'IdNode', false,
			'Margins', box(0, 30, 0, 30),
			'HAlign', "center",
			'VAlign', "center",
			'MaxHeight', 808,
			'HandleMouse', true,
			'Image', "UI/Mods/Circle32White.tga",
			'ImageScale', point(500, 500),
			'FrameBox', box(15, 15, 15, 15),
			'SqueezeX', false,
			'SqueezeY', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
if not GetUIStyleGamepad() then
	self:SetMaxHeight(920)
end
XFrame.Open(self, ...)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "close",
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'__class', "XTextButton",
				'Id', "idClose",
				'IdNode', false,
				'Margins', box(0, 40, 30, 0),
				'Dock', "top",
				'HAlign', "right",
				'VAlign', "center",
				'Background', RGBA(0, 0, 0, 0),
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'OnPressEffect', "close",
				'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
ModsUIClosePopup(dlg)
end,
				'RolloverBackground', RGBA(0, 0, 0, 0),
				'PressedBackground', RGBA(0, 0, 0, 0),
				'Icon', "UI/Mods/x_large.tga",
				'IconRows', 2,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XLabel",
				'Id', "idTitle",
				'Margins', box(20, 20, 0, 0),
				'Dock', "top",
				'FoldWhenHidden', true,
				'TextStyle', "ModsUIPopupTitle",
				'Translate', true,
			}),
			}),
		}),
})

