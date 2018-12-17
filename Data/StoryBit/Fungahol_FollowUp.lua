-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Alcoholic",
				}),
			},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_sols>",
				}),
				PlaceObj('ModifyColonistStat', {
					'Stat', "Sanity",
					'Amount', "<sanity>",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T(146666217749, --[[StoryBit Fungahol_FollowUp Text]] "The Colonist smiled shyly, hiccupped, and said: “Well, BUUURP, you need it r-right now?” Seems that your Colonists enjoy quite a bit the new Fungahol you allowed for production.\n\n<effect>Alcoholic Colonists gain +50 Sanity and +10 Morale for 5 Sols."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(172614484358, --[[voice:narrator]] "Today you met a Colonist on the street and asked about their name."),
	group = "Colonists",
	id = "Fungahol_FollowUp",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_sols",
		'Value', 5,
	}),
})

