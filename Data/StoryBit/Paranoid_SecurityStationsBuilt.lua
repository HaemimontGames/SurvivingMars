-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "SecurityStation",
			'Filters', {},
			'Condition', ">=",
			'Amount', "<goal>",
		}),
	},
	ScriptDone = true,
	SuppressTime = 1440000,
	Text = T{343856744885, --[[StoryBit Paranoid_SecurityStationsBuilt Text]] "Was there real reason for concern or where they just paranoid? That you may never know."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{359757367967, --[[voice:narrator]] "Two whole Sols have passed and all our Scientists are safe and sound."},
	group = "Rival Colonies",
	id = "Paranoid_SecurityStationsBuilt",
	PlaceObj('StoryBitParamNumber', {
		'Name', "goal",
		'Value', 3,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{922358460847, --[[StoryBit Paranoid_SecurityStationsBuilt Text]] "At least things are back to as normal as they could be up here."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Disables', {
			"Paranoid_SecurityStationsNotBuilt",
		},
		'Effects', {},
	}),
})

