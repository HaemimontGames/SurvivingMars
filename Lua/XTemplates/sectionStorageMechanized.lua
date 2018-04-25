-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionStorageMechanized",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MechanizedDepot",
		'__condition', function (parent, context) return context and (context:DoesAcceptResource("Metals") or context:DoesAcceptResource("Concrete") or context:DoesAcceptResource("Food") or context:DoesAcceptResource("PreciousMetals")) end,
		'__template', "InfopanelSection",
		'RolloverText', T{383278278859, --[[XTemplate sectionStorageMechanized RolloverText]] "Amount stored"},
		'Title', T{815334191366, --[[XTemplate sectionStorageMechanized Title]] "Basic Resources"},
		'Icon', "UI/Icons/Sections/basic.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Concrete") end,
			'__template', "InfopanelText",
			'Text', T{563443366316, --[[XTemplate sectionStorageMechanized Text]] "<resource('Concrete' )><right><concrete(Stored_Concrete, MaxAmount_Concrete)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Food") end,
			'__template', "InfopanelText",
			'Text', T{374291889975, --[[XTemplate sectionStorageMechanized Text]] "<resource('Food' )><right><food(Stored_Food, MaxAmount_Food)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("PreciousMetals") end,
			'__template', "InfopanelText",
			'Text', T{822014935781, --[[XTemplate sectionStorageMechanized Text]] "<resource('PreciousMetals' )><right><preciousmetals(Stored_PreciousMetals, MaxAmount_PreciousMetals)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Metals") end,
			'__template', "InfopanelText",
			'Text', T{266445772015, --[[XTemplate sectionStorageMechanized Text]] "<resource('Metals' )><right><metals(Stored_Metals, MaxAmount_Metals)>"},
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MechanizedDepot",
		'__condition', function (parent, context) return context and (context:DoesAcceptResource("Polymers") or context:DoesAcceptResource("Electronics") or context:DoesAcceptResource("MachineParts") or context:DoesAcceptResource("Fuel") or context:DoesAcceptResource("MysteryResource")) end,
		'__template', "InfopanelSection",
		'RolloverText', T{383278278859, --[[XTemplate sectionStorageMechanized RolloverText]] "Amount stored"},
		'Title', T{108218550068, --[[XTemplate sectionStorageMechanized Title]] "Advanced Resources"},
		'Icon', "UI/Icons/Sections/advanced.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Polymers") end,
			'__template', "InfopanelText",
			'Text', T{506814955999, --[[XTemplate sectionStorageMechanized Text]] "<resource('Polymers' )><right><polymers(Stored_Polymers, MaxAmount_Polymers)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Electronics") end,
			'__template', "InfopanelText",
			'Text', T{602546577533, --[[XTemplate sectionStorageMechanized Text]] "<resource('Electronics' )><right><electronics(Stored_Electronics, MaxAmount_Electronics)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("MachineParts") end,
			'__template', "InfopanelText",
			'Text', T{157477899096, --[[XTemplate sectionStorageMechanized Text]] "<resource('MachineParts' )><right><machineparts(Stored_MachineParts, MaxAmount_MachineParts)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("Fuel") end,
			'__template', "InfopanelText",
			'Text', T{420380322111, --[[XTemplate sectionStorageMechanized Text]] "<resource('Fuel' )><right><fuel(Stored_Fuel, MaxAmount_Fuel)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:DoesAcceptResource("MysteryResource") end,
			'__template', "InfopanelText",
			'Text', T{836452351195, --[[XTemplate sectionStorageMechanized Text]] "<resource('MysteryResource' )><right><mysteryresource(Stored_MysteryResource, MaxAmount_MysteryResource)>"},
		}),
		}),
})

