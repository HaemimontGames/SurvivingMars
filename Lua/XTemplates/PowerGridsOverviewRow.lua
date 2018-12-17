-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "PowerGridsOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverTitle', "",
		'RolloverHint', T(115984499466, --[[XTemplate PowerGridsOverviewRow RolloverHint]] "<left_click><left_click> Select"),
		'RolloverHintGamepad', T(764097870353, --[[XTemplate PowerGridsOverviewRow RolloverHintGamepad]] "<ButtonA> Select"),
		'Id', "",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTitle",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 250,
			'MaxWidth', 250,
			'TextStyle', "OverviewItemName",
			'Translate', true,
			'Shorten', true,
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idProduction",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 150,
			'MaxWidth', 150,
			'TextStyle', "OverviewItemValue",
			'Translate', true,
			'Text', T(681455976969, --[[XTemplate PowerGridsOverviewRow Text]] "<power(CurrentProduction)>"),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idConsumption",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 150,
			'MaxWidth', 150,
			'TextStyle', "OverviewItemValue",
			'Translate', true,
			'Text', T(861269713460, --[[XTemplate PowerGridsOverviewRow Text]] "<power(CurrentConsumption)>"),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idStoredPower",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 150,
			'MaxWidth', 150,
			'TextStyle', "OverviewItemValue",
			'Translate', true,
			'Text', T(685208892361, --[[XTemplate PowerGridsOverviewRow Text]] "<resource(CurrentStorage, power)>"),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idChange",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 150,
			'MaxWidth', 150,
			'TextStyle', "OverviewItemValue",
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
local delta = context:GetCurrentProduction() - context:GetCurrentConsumption()
if delta < 0 then
	self:SetText(T{11690, "<red><power(delta)></red>", delta = delta})
elseif delta > 0 then
	self:SetText(T{11691, "+<power(delta)>", delta = delta})
else
	self:SetText(T{11692, "<power(delta)>", delta = delta}) --zero
end
end,
			'Translate', true,
			'Text', T(616338099613, --[[XTemplate PowerGridsOverviewRow Text]] "<power(0)>"),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDoubleClick(self, pos, button)",
			'func', function (self, pos, button)
if button == "L" then
	local bld = CommandCenterChooseGridBuilding(self.context)
	ViewObjectMars(bld)
	SelectObj(bld)
	DelayedCall(1, ShowElectricityOverlay)
	CloseCommandCenter()
	return "break"
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		}),
})

