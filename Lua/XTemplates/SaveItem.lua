-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "SaveItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'Padding', box(0, 2, 0, 2),
		'HAlign', "right",
		'MaxHeight', 50,
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextFont', "PGListItem",
		'TextColor', RGBA(140, 156, 178, 255),
		'RolloverTextColor', RGBA(255, 255, 255, 255),
		'DisabledTextColor', RGBA(114, 114, 114, 255),
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idValue",
			'Padding', box(0, 2, 0, 2),
			'HAlign', "right",
			'Clip', false,
			'RolloverOnFocus', true,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'TextFont', "PGListItem",
			'TextColor', RGBA(221, 215, 170, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
			'DisabledTextColor', RGBA(114, 114, 114, 255),
			'Translate', true,
			'Shorten', true,
			'TextHAlign', "right",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
return self.enabled and 
			((self.parent.rollover or self.parent.parent:ResolveId("idList").focused_item == self.context.id)
				and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-60, 0, -60, -6),
			'Dock', "box",
			'Visible', false,
			'Image', "UI/Common/bm_buildings_pad.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCorrupted",
			'Margins', box(0, 0, -28, 0),
			'Dock', "right",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 28,
			'MinHeight', 28,
			'MaxWidth', 28,
			'MaxHeight', 28,
			'Visible', false,
			'Image', "UI/Common/mod_problem.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idSynced",
			'Margins', box(5, 0, -33, 0),
			'Dock', "right",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 28,
			'MinHeight', 28,
			'MaxWidth', 28,
			'MaxHeight', 28,
			'Visible', false,
			'Image', "UI/Common/cloud_save_on.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idNotSynced",
			'Margins', box(5, 0, -33, 0),
			'Dock', "right",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 28,
			'MinHeight', 28,
			'MaxWidth', 28,
			'MaxHeight', 28,
			'Visible', false,
			'Image', "UI/Common/cloud_save_off.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idDoNotSync",
			'Margins', box(5, 0, -33, 0),
			'Dock', "right",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 28,
			'MinHeight', 28,
			'MaxWidth', 28,
			'MaxHeight', 28,
			'Visible', false,
			'Image', "UI/Common/cloud_save_no.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		}),
})

