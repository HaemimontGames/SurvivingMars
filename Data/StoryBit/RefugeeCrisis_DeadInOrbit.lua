-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_penalty>",
					'Sols', "<morale_penalty_sols>",
				}),
			},
		}),
	},
	Effects = {},
	Image = "UI/Messages/Events/21_meteors.tga",
	Prerequisites = {
		PlaceObj('IsAssociatedObject', nil),
	},
	ScriptDone = true,
	Text = T(333254490789, --[[StoryBit RefugeeCrisis_DeadInOrbit Text]] "You waited too long to land the rocket and all of the refugees have died in orbit.\n\n<effect>All Colonists lose <morale_penalty> Morale for <sols(morale_penalty_sols)> Sols."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(210905863744, --[[StoryBit RefugeeCrisis_DeadInOrbit Title]] "Refugee Crisis"),
	Trigger = "RefugeeRocketTimeout",
	VoicedText = T(263123718512, --[[voice:narrator]] "The rocket carrying the refugees still floats in orbit around Mars but all the souls on board have been lost."),
	group = "Earth",
	id = "RefugeeCrisis_DeadInOrbit",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_sols",
		'Value', 14400000,
	}),
})

