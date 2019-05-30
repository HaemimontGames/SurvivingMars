-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customColonyOverviewButtons",
	PlaceObj('XTemplateTemplate', {
		'comment', "resource overview",
		'__template', "InfopanelButton",
		'RolloverText', T(7852, --[[XTemplate customColonyOverviewButtons RolloverText]] "View information about the resources in your Colony."),
		'RolloverTitle', T(692, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "Resources"),
		'OnContextUpdate', function (self, context, ...)
			self:SetIcon(self.context.overview == "ResourceOverview" and "UI/Icons/IPButtons/resources_section_active.tga" or "UI/Icons/IPButtons/resources_section.tga" )
		end,
		'OnPress', function (self, gamepad)
			SetResourceOverviewDlgMode("ResourceOverview")
		end,
		'Icon', "UI/Icons/IPButtons/resources_section.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "colonist overview",
		'__template', "InfopanelButton",
		'RolloverText', T(7854, --[[XTemplate customColonyOverviewButtons RolloverText]] "View information about your Colonists."),
		'RolloverDisabledText', T(396776430312, --[[XTemplate customColonyOverviewButtons RolloverDisabledText]] "There are currently no colonists in this category."),
		'RolloverTitle', T(547, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "Colonists"),
		'OnContextUpdate', function (self, context, ...)
			self:SetIcon(self.context.overview == "ColonistOverview" and "UI/Icons/IPButtons/colonist_section_active.tga" or "UI/Icons/IPButtons/colonist_section.tga" )
		end,
		'OnPress', function (self, gamepad)
			SetResourceOverviewDlgMode("ColonistOverview")
		end,
		'Icon', "UI/Icons/IPButtons/colonist_section.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "traits overview",
		'__template', "InfopanelButton",
		'RolloverText', T(7855, --[[XTemplate customColonyOverviewButtons RolloverText]] "View information about the traits of your Colonists."),
		'RolloverDisabledText', T(596215171316, --[[XTemplate customColonyOverviewButtons RolloverDisabledText]] "There are currently no colonists in this category."),
		'RolloverTitle', T(235, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "Traits"),
		'OnContextUpdate', function (self, context, ...)
			self:SetIcon(self.context.overview == "TraitsOverview" and "UI/Icons/IPButtons/traits_section_active.tga" or "UI/Icons/IPButtons/traits_section.tga" )
		end,
		'OnPress', function (self, gamepad)
			SetResourceOverviewDlgMode("TraitsOverview")
		end,
		'Icon', "UI/Icons/IPButtons/traits_section.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "homeless",
		'__template', "InfopanelButton",
		'RolloverText', T(660999914706, --[[XTemplate customColonyOverviewButtons RolloverText]] "<HomelessRolloverText>"),
		'RolloverDisabledText', T(632550459351, --[[XTemplate customColonyOverviewButtons RolloverDisabledText]] "There are currently no colonists in this category."),
		'RolloverTitle', T(112546540868, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "<HomelessRolloverTitle>"),
		'OnContextUpdate', function (self, context, ...)
			self:SetEnabled(context:GetHomelessBtnEnabled())
		end,
		'OnPress', function (self, gamepad)
			OpenCommandCenter({homeless = true}, "Colonists")
		end,
		'Icon', "UI/Icons/IPButtons/homeless_colonists.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "unemployed",
		'__template', "InfopanelButton",
		'RolloverText', T(890683347390, --[[XTemplate customColonyOverviewButtons RolloverText]] "<UnemployedRolloverText>"),
		'RolloverDisabledText', T(901758528440, --[[XTemplate customColonyOverviewButtons RolloverDisabledText]] "There are currently no colonists in this category."),
		'RolloverTitle', T(494678213027, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "<UnemployedRolloverTitle>"),
		'OnContextUpdate', function (self, context, ...)
			self:SetEnabled(context:GetUnemployedBtnEnabled())
		end,
		'OnPress', function (self, gamepad)
			OpenCommandCenter({unemployed = true}, "Colonists")
		end,
		'Icon', "UI/Icons/IPButtons/unemployed_colonists.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "status",
		'__template', "InfopanelButton",
		'RolloverText', T(814678720193, --[[XTemplate customColonyOverviewButtons RolloverText]] "<ProblematicRolloverText>"),
		'RolloverDisabledText', T(560192517207, --[[XTemplate customColonyOverviewButtons RolloverDisabledText]] "There are currently no colonists in this category."),
		'RolloverTitle', T(235056803468, --[[XTemplate customColonyOverviewButtons RolloverTitle]] "<ProblematicRolloverTitle>"),
		'OnContextUpdate', function (self, context, ...)
			self:SetEnabled(context:GetFirstWithDetrimentalStatusEffect())
		end,
		'OnPress', function (self, gamepad)
			OpenCommandCenter({problematic_colonists = true}, "Colonists")
		end,
		'Icon', "UI/Icons/IPButtons/status_effects.tga",
	}),
})

