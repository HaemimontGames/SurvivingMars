-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('EraseShuttles', nil),
		PlaceObj('UnitAppear', nil),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_duration>",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 120000,
	Text = T(505538847985, --[[StoryBit WinterWonderland_SaveKidShuttle Text]] "The first attempt was a failure and we lost the Shuttle. Luckily the second one was successful and little <DisplayName> is back safe and sound with just a couple of cuts and bruises.\n\n<effect><morale_boost> Morale for <sols(morale_boost_duration)> Sols"),
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Disasters",
	id = "WinterWonderland_SaveKidShuttle",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 3600000,
	}),
})

