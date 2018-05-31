-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customMartianUniversity",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MartianUniversity",
		'__template', "InfopanelActiveSection",
		'RolloverText', T{7977, --[[XTemplate customMartianUniversity RolloverText]] "<TrainedRollover>"},
		'RolloverTitle', T{240, --[[XTemplate customMartianUniversity RolloverTitle]] "Specialization"},
		'RolloverHint', T{703125928773, --[[XTemplate customMartianUniversity RolloverHint]] "<left_click> Select specialization<newline><em>Ctrl + <left_click> on specialization</em> Select in all Universities"},
		'RolloverHintGamepad', T{896744390747, --[[XTemplate customMartianUniversity RolloverHintGamepad]] "<ButtonA> Select specialization<newline><em><ButtonX> on specialization</em> Select in all Universities"},
		'UniformRowHeight', true,
		'Title', T{440284296071, --[[XTemplate customMartianUniversity Title]] "Training<right><Specialization>"},
		'Icon', "UI/Icons/Sections/traits.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnActivate(self, context)",
			'parent', function (parent, context) return parent.parent end,
			'func', function (self, context)
OpenInfopanelItems(context, self)
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Dock', "bottom",
			'Text', T{509074303312, --[[XTemplate customMartianUniversity Text]] "Lifetime graduates<right><life_time_trained>"},
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MartianUniversity",
		'__template', "InfopanelSection",
		'Title', T{508811339853, --[[XTemplate customMartianUniversity Title]] "Needed specializations"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{806240447341, --[[XTemplate customMartianUniversity Text]] "<NeededSpecializations>"},
		}),
		}),
})

