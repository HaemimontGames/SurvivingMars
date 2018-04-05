-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customTriboelectricScrubber",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "TriboelectricScrubber",
		'__template', "InfopanelSection",
		'RolloverText', T{488709956734, --[[XTemplate customTriboelectricScrubber RolloverText]] "Increasing the area of effect will greatly increase the power consumption of the building.<newline><newline>Charging time<right><em><ChargeTime> h<em><newline><left>Service range<right><SelectionRadiusScale> hexes"},
		'RolloverHintGamepad', T{253409130526, --[[XTemplate customTriboelectricScrubber RolloverHintGamepad]] "<LB> / <RB>    decrease / increase service radius"},
		'Title', T{994862568830, --[[XTemplate customTriboelectricScrubber Title]] "Service area"},
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSlider",
			'BindTo', "UIRange",
		}),
		}),
})

