-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('RemoveTrait', {
					'Trait', "Renegade",
				}),
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_duration>",
					'ModifyId', "RogueDomeFinale",
				}),
			},
		}),
		PlaceObj('SetBuildingRogueState', {
			'RogueState', false,
		}),
	},
	Disables = {
		"TheRogueDome_Dead",
	},
	Effects = {},
	Prerequisites = {
		PlaceObj('CheckAverageComfort', {
			'Amount', 70,
		}),
	},
	ScriptDone = true,
	SuppressTime = 10800000,
	Text = T{699399257349, --[[StoryBit TheRogueDome_Clear Text]] '"All humans on Mars share a common dream - the dream of colonizing a new planet together. Sometimes, mired in our daily problems, we forget this for a while, but ultimately we always remember that this is what brought us here. Fractures and division among ourselves are not part of this dream. If the Martian Republic is to become a reality, it would be a reality that we would create together!"\n\n<effect>We have regained control over rogue Dome. All colonists in the Colony have lost the Renegade trait. All Colonists have increased Morale for the next <sols(morale_boost_duration)> Sols.'},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{184300870505, --[[voice:narrator]] "Our colony is united once again! The rogue dome has rejoined us. Here is a statement from their leaders:"},
	group = "Renegades",
	id = "TheRogueDome_Clear",
	PlaceObj('StoryBitReply', {
		'Text', T{578164752099, --[[StoryBit TheRogueDome_Clear Text]] "We are glad that our brothers and sisters have remembered our common Dream."},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{236710695241, --[[StoryBit TheRogueDome_Clear Text]] "Welcome them, but keep a close watch on this Dome. Next time we will not be so lenient."},
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 20,
	}),
})

