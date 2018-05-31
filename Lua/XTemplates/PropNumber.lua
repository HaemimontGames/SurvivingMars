-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PropNumber",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverOnFocus', true,
		'FXMouseIn', "MenuItemHover",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XScrollThumb",
			'Id', "idSlider",
			'Dock', "right",
			'VAlign', "center",
			'MinWidth', 240,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'Horizontal', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'ZOrder', 0,
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idThumb",
				'Image', "UI/Infopanel/progress_bar_slider.tga",
			}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
self.idSlider:SetBindTo(prop_meta.id)
if prop_meta.step then
	self.idSlider:SetStepSize(prop_meta.step)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "DPadLeft" or shortcut == "DPadRight" or shortcut == "LeftThumbLeft" or shortcut == "LeftThumbRight" then
	local prop_meta = self.context.prop_meta
	if (shortcut == "LeftThumbLeft" or shortcut == "LeftThumbRight") and prop_meta.dpad_only then return end
	local obj = ResolvePropObj(self.context)
	local value = obj[prop_meta.id]
	local step = self.idSlider.StepSize
	value = (shortcut == "DPadLeft" or shortcut == "LeftThumbLeft") and Max(prop_meta.min, value - step) or Min(prop_meta.max, value + step)
	obj:SetProperty(prop_meta.id, value)
	ObjModified(obj)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnXButtonRepeat(self, button, controller_id)",
			'func', function (self, button, controller_id)
self:OnShortcut(XInputShortcut(button, controller_id), "gamepad")
return "break"
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
if GetUIStyleGamepad() then
	self:SetFocus(selected)
end
end,
		}),
		}),
})

