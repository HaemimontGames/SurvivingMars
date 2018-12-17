-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Enables = {
		"WindsOfChange_2_Typhoon_NaniteStorm",
	},
	Image = "UI/Messages/dust_storm.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(963071336292, --[[StoryBit WindsOfChange_2_Typhoon Text]] "When the first hulls of buildings start disintegrating, the dire truth becomes apparent – these are the rogue nanites that we failed to defeat.\n\n<effect>Nanite Storm incoming! The colony will be hit periodically by Nanite Storms – dust storms that damage buildings and drones."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(373580388122, --[[StoryBit WindsOfChange_2_Typhoon Title]] "Winds of Change: Typhoon"),
	VoicedText = T(406065873087, --[[voice:narrator]] "The skies are darkened by what appears to be a dust storm, but the chemical sensors say otherwise – the thin air is filled with nanoscopic particles of unusual composition."),
	group = "Breakthroughs",
	id = "WindsOfChange_2_Typhoon",
	PlaceObj('StoryBitReply', {
		'Text', T(712123189692, --[[StoryBit WindsOfChange_2_Typhoon Text]] "Find a solution to deactivate them!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(510900267493, --[[voice:narrator]] "The Nanite Storms are awe-inspiring but we still have the chance to stop them before they inflict insurmountable damages upon the Colony."),
		'Text', T(540796414131, --[[StoryBit WindsOfChange_2_Typhoon Text]] '<effect>Research the "Rogue Nanite Deactivation" tech to stop the disaster from happening.'),
		'Enables', {
			"WindsOfChange_ClearSkies",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "RogueNaniteDeactivation",
				'Cost', 25000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(622293419811, --[[StoryBit WindsOfChange_2_Typhoon Text]] "Find a way to control them!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(540194326476, --[[voice:narrator]] "The Nanite Storms are awe-inspiring but we still have the chance to stop them before they inflict insurmountable damages upon the Colony."),
		'Text', T(542013417068, --[[StoryBit WindsOfChange_2_Typhoon Text]] '<effect>Research the "Rogue Nanite Deactivation" to learn how to control the primal might of the disaster and make it stop.'),
		'Enables', {
			"WindsOfChange_NewHorizons",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "RogueNaniteDeactivation",
				'Cost', 40000,
			}),
		},
	}),
})

