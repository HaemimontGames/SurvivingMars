-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XCheckButton",
	group = "Mods",
	id = "ModsUIChecksListItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XCheckButton",
		'Padding', box(20, 7, 20, 7),
		'LayoutHSpacing', 10,
		'Background', RGBA(235, 235, 235, 0),
		'RolloverDrawOnTop', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FocusedBackground', RGBA(235, 235, 235, 255),
		'RolloverBackground', RGBA(235, 235, 235, 255),
		'PressedBackground', RGBA(235, 235, 235, 255),
		'Icon', "UI/Mods/checkbox.tga",
		'IconScale', point(1000, 1000),
		'IconColor', RGBA(255, 255, 255, 255),
		'TextStyle', "ModsUIMsgText",
		'Translate', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		}),
})

