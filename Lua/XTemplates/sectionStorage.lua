-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionStorage",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return (IsKindOf(context, "UniversalStorageDepot") or IsKindOf(context, "MechanizedDepot")) and not context:IsKindOf("SupplyRocket") and not IsKindOf(context, "SpaceElevator") end,
		'__template', "InfopanelSection",
		'RolloverText', T{10461, --[[XTemplate sectionStorage RolloverText]] "Drones and Shuttles will attempt to stockpile at least <DesiredAmountUI> of each resources stored here."},
		'RolloverHint', T{116367034467, --[[XTemplate sectionStorage RolloverHint]] "<left_click> Set Desired Amount <newline><em>Ctrl + <left_click></em> Set Desired Amount in all <display_name_pl>"},
		'RolloverHintGamepad', T{10462, --[[XTemplate sectionStorage RolloverHintGamepad]] "<LB> / <RB>    change desired amount"},
		'Title', T{10463, --[[XTemplate sectionStorage Title]] "Desired Amount <DesiredAmountUI>"},
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSlider",
			'BindTo', "DesiredAmountSlider",
		}),
		}),
	PlaceObj('XTemplateGroup', {
		'__condition', function (parent, context) return (IsKindOf(context, "UniversalStorageDepot") or IsKindOf(context, "MechanizedDepot")) and not context:IsKindOf("SupplyRocket") and not IsKindOf(context, "SpaceElevator") end,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Metals") or context:DoesAcceptResource("Concrete") or context:DoesAcceptResource("Food") or context:DoesAcceptResource("PreciousMetals") end,
			'__template', "InfopanelSection",
			'Title', T{494, --[[XTemplate sectionStorage Title]] "Basic Resources"},
			'Icon', "",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Metals"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Concrete"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Food"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "PreciousMetals"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Polymers") or context:DoesAcceptResource("Electronics") or context:DoesAcceptResource("MachineParts") or context:DoesAcceptResource("Fuel") or context:DoesAcceptResource("MysteryResource") end,
			'__template', "InfopanelSection",
			'Title', T{347750586259, --[[XTemplate sectionStorage Title]] "Advanced Resources"},
			'Icon', "",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Polymers"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Electronics"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "MachineParts"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "Fuel"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return SubContext(context, {res = "MysteryResource"}) end,
			'__template', "sectionStorageRow",
			'Title', T{615073837286, --[[XTemplate sectionStorage Title]] "<resource(res)><right><resource(GetStoredAmount(res),GetMaxStorage(res),res)>"},
			'Icon', "UI/Icons/Sections/workshifts_active.tga",
			'TitleHAlign', "stretch",
		}),
		}),
})

