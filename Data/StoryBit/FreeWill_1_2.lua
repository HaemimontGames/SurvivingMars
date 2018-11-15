-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'RandomCount', "<injured_colonists>",
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Health",
					'Amount', "<injure_damage>",
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<rumor_morale>",
					'Sols', "<rumor_sols>",
				}),
			},
		}),
	},
	Enables = {
		"FreeWill_2",
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{822198918905, --[[StoryBit FreeWill_1_2 Text]] "(minor)<DisplayName> isn’t among the perpetrators, but the pattern remains the same – complete lack of any personal or professional relation between the victims and the attackers. The situation might be getting out of hand.\n\n<effect><injured_colonists> Colonists had lost <injure_damage> Health."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{127044157282, --[[StoryBit FreeWill_1_2 Title]] "Free Will"},
	VoicedText = T{145449575602, --[[voice:narrator]] "Another worrying assault has happened and this time it involves several Arcology residents jumping with their bare fists at unsuspecting Colonists."},
	group = "Breakthroughs",
	id = "FreeWill_1_2",
	PlaceObj('StoryBitParamNumber', {
		'Name', "injured_colonists",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "injure_damage",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rumor_morale",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "rumor_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{386641218678, --[[StoryBit FreeWill_1_2 Text]] "We’re in the dark. We need further research on the subject."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{806145784171, --[[voice:narrator]] "Suspicions and dark rumors spread through the Colony as your team is trying to uncover the truth. People feel threatened – and probably for a reason?"},
		'Text', T{854778756314, --[[StoryBit FreeWill_1_2 Text]] '<effect>All Colonists lose <rumor_morale> Morale for <sols(rumor_sols)> Sols. Research the "Violent Urges" tech to reveal the secret behind the inexplicable crimes.'},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "ViolentUrges",
				'Cost', 8000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{571800315773, --[[StoryBit FreeWill_1_2 Text]] "I think I might have some ideas!"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{700633651186, --[[voice:narrator]] "Suspicions and dark rumors spread through the Colony as your team is trying to uncover the truth. People feel threatened – and probably for a reason?"},
		'Text', T{434566080943, --[[StoryBit FreeWill_1_2 Text]] 'You have some wild theories, and even if they sound crazy, they are still a starting point. Only time would tell if your experience with sci-fi crime fic would come in handy.\n\n<effect>All Colonists lose <rumor_morale> Morale for <sols(rumor_sols)> Sols. Research the "Violent Urges" tech to reveal the secret behind the inexplicable crimes. The tech receives 50% discount.'},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "ViolentUrges",
				'Cost', 4000,
			}),
		},
	}),
})

