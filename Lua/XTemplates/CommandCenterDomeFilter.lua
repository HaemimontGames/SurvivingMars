-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "CCC",
	id = "CommandCenterDomeFilter",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterButton",
		'RolloverTitle', T{692952504653, --[[XTemplate CommandCenterDomeFilter RolloverTitle]] "Dome"},
		'Margins', box(-12, 0, 0, 20),
		'MinHeight', 106,
		'MaxHeight', 106,
		'OnContextUpdate', function (self, context, ...)
XTextButton.OnContextUpdate(self, context, ...)
self:SetRolloverText(GetDomeFilterRolloverText(self))
self.idDomeName:SetText(context.dome and context.dome:GetDisplayName() or T{596159635934, "Entire Colony"})
local hint_gamepad = T{238409413444, "<ButtonA> Set filter"} .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
		'OnPress', function (self, gamepad)
SpawnDomesPopup(self)
end,
		'Image', "UI/CommonNew/ccc_categories_small_tall.tga",
		'Icon', "UI/Icons/ColonyControlCenter/dome.tga",
		'TextStyle', "CCCDomeFilter",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idDomeName",
			'Margins', box(20, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 150,
			'MaxWidth', 150,
			'HandleMouse', false,
			'TextStyle', "CCCDomeFilter",
			'ContextUpdateOnOpen', true,
			'Translate', true,
			'Shorten', true,
		}),
		}),
})

