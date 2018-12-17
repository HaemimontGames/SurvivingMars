-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "FusionReactor_Construction",
			'Filters', {},
			'Effects', {
				PlaceObj('SetConstructionSiteState', nil),
			},
		}),
		PlaceObj('LockUnlockBuildingFromBuildMenu', {
			'Building', "FusionReactor",
		}),
	},
	Image = "UI/Messages/Events/10_protest.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "TheIncident",
		}),
	},
	ScriptDone = true,
	Text = T(531431303951, --[[StoryBit TheIncident_4_TechResearched Text]] "The manual adjustments made by the staff at the Fusion Reactor destabilized the system which would have otherwise self-corrected the effects of the Dust Storm.\n\nSome Colonists are unhappy with this findings and remain skeptical about fusion power.\n\n<effect>Fusion Reactors can be built once more."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T(506461182049, --[[voice:narrator]] "All public terminal broadcast as the head of the investigation team reads the report findings out loud. Human error."),
	group = "Disasters",
	id = "TheIncident_4_TechResearched",
	PlaceObj('StoryBitReply', {
		'Text', T(355216690253, --[[StoryBit TheIncident_4_TechResearched Text]] "Close"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Enables', {
			"TheIncident_5_Sceptics",
		},
		'Effects', {},
	}),
})

