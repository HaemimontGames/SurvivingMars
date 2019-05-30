-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "HUDButton",
	group = "InGame",
	id = "HUDButtonTemplate",
	PlaceObj('XTemplateWindow', {
		'__class', "HUDButton",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XToggleButton",
			'RolloverTemplate', "Rollover",
			'HAlign', "center",
			'VAlign', "center",
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'FXMouseIn', "UIButtonMouseIn",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'DisabledBackground', RGBA(255, 255, 255, 255),
			'Columns', 2,
			'ColumnsUse', "abaa",
			'ToggledBackground', RGBA(255, 255, 255, 255),
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnChange(self, toggled)",
				'func', function (self, toggled)
					self.Row = toggled and 2 or 1
					self:Invalidate()
				end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Visible', false,
		}),
		}),
})

