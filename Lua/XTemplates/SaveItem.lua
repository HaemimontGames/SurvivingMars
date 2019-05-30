-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "SaveItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'Margins', box(26, 0, 0, 0),
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextStyle', "ListItem3",
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idValue",
			'Padding', box(2, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'Clip', false,
			'RolloverOnFocus', true,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'Translate', true,
			'Shorten', true,
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
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					self:SetTextStyle(self.parent.TextStyle)
					XText.Open(self, ...)
				end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-15, -10, 0, -10),
			'Dock', "box",
			'HAlign', "left",
			'Visible', false,
			'Image', "UI/CommonNew/pg_selection.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCorrupted",
			'Dock', "left",
			'HAlign', "left",
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
			'Margins', box(-28, 0, 0, 0),
			'Dock', "left",
			'HAlign', "left",
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
			'Margins', box(-28, 0, 0, 0),
			'Dock', "left",
			'HAlign', "left",
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
			'Margins', box(-28, 0, 0, 0),
			'Dock', "left",
			'HAlign', "left",
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

