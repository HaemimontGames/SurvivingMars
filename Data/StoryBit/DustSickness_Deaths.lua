-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('CheckDeaths', {
			'ReasonsList', {
				"DustSickness",
			},
			'Sols', 10,
			'Count', 5,
		}),
	},
	ScriptDone = true,
	Text = T(647375229690, --[[StoryBit DustSickness_Deaths Text]] "Complications from the Dust Sickness have resulted in several deaths. Unfortunately the only thing we can do for now is make sure we have enough medical facilities.\n\n<effect><morale_penalty> Morale for <sols(morale_penalty_duration)> Sols"),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "ColonistDied",
	VoicedText = T(910476648346, --[[voice:narrator]] "The mood at the wake is somber and you can’t escape the accusatory looks from some colonists. The Dust Sickness has claimed another life."),
	group = "Disasters",
	id = "DustSickness_Deaths",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "lower_morale_penalty",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_duration",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(879798410528, --[[StoryBit DustSickness_Deaths Text]] "We are all grieving for our lost comrades."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(645207227486, --[[StoryBit DustSickness_Deaths Text]] "A sad day but we have to look to the future."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(380323562379, --[[StoryBit DustSickness_Deaths Text]] "I will make sure that no colonists will ever suffer the same fate!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(287549493472, --[[StoryBit DustSickness_Deaths CustomOutcomeText]] "Morale penalty reduced to <lower_morale_penalty>"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
})

