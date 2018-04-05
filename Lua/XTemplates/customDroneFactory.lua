-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customDroneFactory",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "DroneFactory",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "make drones",
			'__template', "InfopanelButton",
			'RolloverText', T{644918672836, --[[XTemplate customDroneFactory RolloverText]] "Drone prefabs can be used to order new drones in Drone Hubs. Drone Prefabs cost:<newline><resource(ConstructResource)><right><resource(ConstructDroneCost, ConstructResource)>"},
			'RolloverTitle', T{8645, --[[XTemplate customDroneFactory RolloverTitle]] "Construct Drone Prefab"},
			'RolloverHint', T{6737, --[[XTemplate customDroneFactory RolloverHint]] "<left_click> Construct Drone Prefab<newline><right_click> Cancel Drone Prefab"},
			'RolloverHintGamepad', T{6736, --[[XTemplate customDroneFactory RolloverHintGamepad]] "<ButtonA> Construct Drone Prefab<newline><ButtonX> Cancel Drone Prefab"},
			'OnPressParam', "ConstructDrone",
			'AltPress', true,
			'Icon', "UI/Icons/IPButtons/drone.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "make androids",
			'__condition', function (parent, context) return UICity:IsTechResearched("ThePositronicBrain") end,
			'__template', "InfopanelButton",
			'RolloverText', T{702517856120, --[[XTemplate customDroneFactory RolloverText]] "Construction of a new Biorobot costs:<newline><resource(ConstructResource)><right><resource(ConstructAndroidCost, ConstructResource)>"},
			'RolloverTitle', T{6738, --[[XTemplate customDroneFactory RolloverTitle]] "Construct Biorobot"},
			'RolloverHint', T{354, --[[XTemplate customDroneFactory RolloverHint]] "<left_click> Construct Biorobot<newline><right_click> Cancel Biorobot"},
			'RolloverHintGamepad', T{353, --[[XTemplate customDroneFactory RolloverHintGamepad]] "<ButtonA> Construct Biorobot<newline><ButtonX> Cancel Biorobot"},
			'OnPressParam', "ConstructAndroid",
			'AltPress', true,
			'Icon', "UI/Icons/IPButtons/biorobot.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{408, --[[XTemplate customDroneFactory Title]] "Construction"},
			'Icon', "UI/Icons/Sections/construction.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{410, --[[XTemplate customDroneFactory Text]] "<UIConstructionStatus>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{8646, --[[XTemplate customDroneFactory Text]] "Available Drone Prefabs<right><drone(available_drone_prefabs)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{8539, --[[XTemplate customDroneFactory Text]] "Scheduled Drone Prefabs<right><drone(drones_in_construction)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return UICity:IsTechResearched("ThePositronicBrain") end,
				'__template', "InfopanelText",
				'Text', T{6742, --[[XTemplate customDroneFactory Text]] "Scheduled Biorobots<right><colonist(androids_in_construction)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{693516738839, --[[XTemplate customDroneFactory Text]] "Required <resource(ConstructResource)><right><resource(ConstructResourceAmount, ConstructResourceTotal, ConstructResource)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelProgress",
				'BindTo', "DroneConstructionProgress",
			}),
			}),
		}),
})

