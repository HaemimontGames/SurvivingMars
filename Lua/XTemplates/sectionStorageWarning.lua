-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionStorageWarning",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return (IsKindOf(context, "WaterStorage") and context.water) or (IsKindOf(context, "AirStorage") and context.air) or (IsKindOf(context, "ElectricityStorage") and context.electricity) end,
		'__condition', function (parent, context) return context end,
		'__template', "InfopanelSection",
		'RolloverText', T(459, --[[XTemplate sectionStorageWarning RolloverText]] "Storage facilities cannot discharge until they are charged with a minimum amount of their stored resource."),
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(ResolveValue(context, "UIDischargeStr") and true)
		end,
		'Title', T(277, --[[XTemplate sectionStorageWarning Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(460, --[[XTemplate sectionStorageWarning Text]] "<UIDischargeStr>"),
		}),
		}),
})

