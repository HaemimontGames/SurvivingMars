-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionMine",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Mine",
		'__template', "InfopanelSection",
		'RolloverText', T(604012311372, --[[XTemplate sectionMine RolloverText]] "<UISectionMineRollover>"),
		'Title', T(80, --[[XTemplate sectionMine Title]] "Production"),
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
parent.parent:SetIcon(context:GetResourceProducedIcon())
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(472, --[[XTemplate sectionMine Text]] "Production per Sol<right><resource(PredictedDailyProduction, GetResourceProduced)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(473, --[[XTemplate sectionMine Text]] "Stored <resource(exploitation_resource)><right><resource(GetAmountStored,max_storage,exploitation_resource)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(474, --[[XTemplate sectionMine Text]] "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"),
		}),
		}),
})

