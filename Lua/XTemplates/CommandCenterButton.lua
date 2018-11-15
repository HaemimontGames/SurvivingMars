-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "CCC",
	id = "CommandCenterButton",
	PlaceObj('XTemplateWindow', {
		'__class', "XToggleButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "right",
		'Padding', box(12, 12, 12, 12),
		'MinWidth', 240,
		'MinHeight', 66,
		'MaxHeight', 66,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'Image', "UI/CommonNew/ccc_categories_small1.tga",
		'FrameBox', box(35, 30, 30, 30),
		'Rows', 2,
		'Columns', 2,
		'TextStyle', "CCCItem",
		'Translate', true,
		'ColumnsUse', "abaaa",
		'ToggledBackground', RGBA(255, 255, 255, 255),
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnChange(self, toggled)",
			'func', function (self, toggled)
self:SetRow(toggled and 2 or 1)
end,
		}),
		PlaceObj('XTemplateCode', {
			'comment', "adjust icon & label",
			'run', function (self, parent, context)
parent.idIcon:SetImageFit("smallest")
parent.idLabel:SetMargins(box(6,0,0,0))
parent.idLabel:SetHAlign("left")
end,
		}),
		}),
})

