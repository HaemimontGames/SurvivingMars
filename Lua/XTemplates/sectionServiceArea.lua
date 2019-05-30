-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionServiceArea",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context:IsKindOf("DroneHub") or (context:IsKindOf("SupplyRocket") and context.show_service_area) or context:IsKindOf("RCRover") end,
		'__template', "InfopanelSection",
		'RolloverText', T(462868881410, --[[XTemplate sectionServiceArea RolloverText]] "Determines the radius in which the Drones harvest resources or construct, service and clean buildings.<newline><newline>Service range<right><SelectionRadiusScale> hexes<newline><left>Construction sites<right><count(constructions)>"),
		'RolloverHintGamepad', T(253409130526, --[[XTemplate sectionServiceArea RolloverHintGamepad]] "<LB> / <RB>    change service radius"),
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(not context:IsKindOf("SupplyRocket") or context.landed)
		end,
		'Title', T(994862568830, --[[XTemplate sectionServiceArea Title]] "Service area"),
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSlider",
			'BindTo', "UIWorkRadius",
		}),
		}),
})

