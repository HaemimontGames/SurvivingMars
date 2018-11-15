-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
				}),
			},
			'RandomCount', "<number_of_idiots>",
			'Effects', {
				PlaceObj('EraseColonist', nil),
			},
		}),
		PlaceObj('EraseColonist', nil),
	},
	Effects = {},
	Image = "UI/Messages/Events/20_crashed_rocket.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{886353425035, --[[StoryBit FlatMars_Outcome1 Text]] "There are no survivors amidst the wreckage."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{982181711002, --[[voice:narrator]] "The improvised aircraft lifts off with all the Flat Mars Society members onboard, rapidly loses speed and then quite expectedly comes down crashing."},
	group = "Colonists",
	id = "FlatMars_Outcome1",
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_idiots",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{766156019984, --[[StoryBit FlatMars_Outcome1 Text]] "Proclaim a day of mourning. Their misguided quest for the truth met a tragic end."},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{651753823174, --[[StoryBit FlatMars_Outcome1 Text]] "I guess whoever designed the vehicle got their physics wrong."},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{932584512733, --[[StoryBit FlatMars_Outcome1 Text]] "Were we wrong not to stop them? It is what they wished for."},
	}),
})

