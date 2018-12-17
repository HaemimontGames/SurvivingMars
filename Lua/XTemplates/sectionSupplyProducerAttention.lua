-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionSupplyProducerAttention",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return IsKindOfClasses(context,"WaterProducer", "AirProducer") and context end,
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
self:SetVisible(context and context:IsKindOfClasses("WaterProducer") and context.water:UIShouldShowDemandAttention() or context and context:IsKindOfClasses("AirProducer") and context.air:UIShouldShowDemandAttention() and true)
end,
		'Title', T(310324952912, --[[XTemplate sectionSupplyProducerAttention Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "WaterProducer",
			'__context', function (parent, context) return context.water end,
			'__template', "InfopanelText",
			'Text', T(330979236014, --[[XTemplate sectionSupplyProducerAttention Text]] "Not producing at full capacity due to lack of demand. Can produce <water(current_throttled_production)> more if needed"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "AirProducer",
			'__context', function (parent, context) return context.air end,
			'__template', "InfopanelText",
			'Text', T(809879280014, --[[XTemplate sectionSupplyProducerAttention Text]] "Not producing at full capacity due to lack of demand. Can produce <air(current_throttled_production)> more if needed"),
		}),
		}),
})

