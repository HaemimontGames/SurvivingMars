-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XFrame",
	group = "CCC",
	id = "CommandCenterStatsBox",
	PlaceObj('XTemplateWindow', {
		'__class', "XToggleButton",
		'Padding', box(42, 12, 42, 42),
		'MaxWidth', 530,
		'LayoutMethod', "VList",
		'LayoutVSpacing', -2,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'Image', "UI/CommonNew/ccc_powergrid.tga",
		'FrameBox', box(48, 48, 48, 48),
		'Rows', 2,
		'Columns', 2,
		'ColumnsUse', "abaaa",
		'ToggledBackground', RGBA(255, 255, 255, 255),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idTitle",
			'Margins', box(0, 32, 0, 20),
			'TextStyle', "CCCStatsTitle",
			'Translate', true,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnChange(self, toggled)",
			'func', function (self, toggled)
self:SetRow(toggled and 2 or 1)
end,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
self.idTitle:SetText(value)
end,
	}),
})

