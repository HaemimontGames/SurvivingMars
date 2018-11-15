-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionResourceProducer",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context:IsKindOf("ResourceProducer") and context:GetResourceProduced() and not context:IsKindOfClasses("Mine", "Farm") end,
		'__template', "InfopanelSection",
		'RolloverText', T{241057577251, --[[XTemplate sectionResourceProducer RolloverText]] "<UISectionResourceProducerRollover>"},
		'OnContextUpdate', function (self, context, ...)
if context.producers then
	for _, pr in ipairs(context.producers) do
		ObjModified(pr)
	end
end
end,
		'Title', T{80, --[[XTemplate sectionResourceProducer Title]] "Production"},
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
parent.parent:SetIcon(context:GetResourceProducedIcon())
end,
		}),
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return context.producers end,
			'__context', function (parent, context, item, i, n) return item end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{466, --[[XTemplate sectionResourceProducer Text]] "Production per Sol (predicted)<right><resource(PredictedDailyProduction, GetResourceProduced)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{478, --[[XTemplate sectionResourceProducer Text]] "Stored <resource(GetResourceProduced)><right><resource(GetAmountStored,max_storage,GetResourceProduced)>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:IsKindOf("ResourceProducer") and context.wasterock_producer end,
			'__template', "InfopanelText",
			'Text', T{474, --[[XTemplate sectionResourceProducer Text]] "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"},
		}),
		}),
})

