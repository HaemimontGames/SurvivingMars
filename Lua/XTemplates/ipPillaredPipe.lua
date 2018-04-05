-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipPillaredPipe",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "LifeSupportGridElement",
		'__template', "Infopanel",
		'Description', T{313911890683, --[[XTemplate ipPillaredPipe Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__template', "InfopanelButton",
			'RolloverText', T{828236114548, --[[XTemplate ipPillaredPipe RolloverText]] "Destroy this pipe."},
			'RolloverTitle', T{3973, --[[XTemplate ipPillaredPipe RolloverTitle]] "Salvage"},
			'RolloverHintGamepad', T{7657, --[[XTemplate ipPillaredPipe RolloverHintGamepad]] "<ButtonY> Activate"},
			'ContextUpdateOnOpen', false,
			'OnPressParam', "Demolish",
			'Icon', "UI/Icons/IPButtons/salvage_1.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonDown(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonDown(false)
elseif button == "ButtonX" then
	return self:OnButtonDown(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonUp(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonUp(false)
elseif button == "ButtonX" then
	return self:OnButtonUp(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWaterGrid",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionAirGrid",
		}),
		}),
})

