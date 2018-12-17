-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "scientist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_duration>",
					'ModifyId', "Prototype",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T(833572447036, --[[StoryBit Prototype_MediumDome_Fail Text]] "The endeavor was not entirely without merit. The team is very grateful for the opportunity and all are eager to tackle their next task.\n\n<effect>Scientists have their Morale increased by <morale_boost> for the next <sols(morale_boost_duration)> Sols."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(193309428218, --[[voice:narrator]] "Our Scientists have failed to construct a working Medium Dome prototype."),
	group = "Buildings",
	id = "Prototype_MediumDome_Fail",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 7200000,
	}),
})
