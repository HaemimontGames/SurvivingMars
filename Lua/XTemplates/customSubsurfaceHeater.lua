-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customSubsurfaceHeater",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SubsurfaceHeater",
		'__template', "InfopanelSection",
		'RolloverText', T(428, --[[XTemplate customSubsurfaceHeater RolloverText]] "Increasing the area of effect will greatly increase the Water consumption of the building.<newline><newline>Service range<right><SelectionRadiusScale> hexes"),
		'RolloverHintGamepad', T(253409130526, --[[XTemplate customSubsurfaceHeater RolloverHintGamepad]] "<LB> / <RB>    change service radius"),
		'Title', T(994862568830, --[[XTemplate customSubsurfaceHeater Title]] "Service area"),
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSlider",
			'BindTo', "UIRange",
		}),
		}),
})

