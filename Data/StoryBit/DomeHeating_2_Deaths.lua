-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyObject', {
			'Prop', "electricity_consumption",
			'ModifyId', "DomeHeating",
		}),
	},
	Disables = {
		"DomeHeating_1_NoDeaths",
	},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
			'RandomCount', "<new_survivors>",
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Survivor",
				}),
			},
		}),
	},
	Prerequisites = {
		PlaceObj('CheckDeaths', {
			'ReasonsList', {
				"StatusEffect_Freezing",
			},
			'Sols', 5,
		}),
	},
	ScriptDone = true,
	SuppressTime = 180000,
	Text = T(682576907182, --[[StoryBit DomeHeating_2_Deaths Text]] "The issue with the heaters of Dome <DisplayName> has taken its toll on our colony. Those who survived must aim to do better when future challenges arise.\n\n<effect>Several colonists have gained the Survivor trait."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "ColdWaveEnded",
	VoicedText = T(673389436622, --[[voice:narrator]] "As the frost outside melts, you hastily assemble your report listing the colonists that perished from the cold."),
	group = "Disasters",
	id = "DomeHeating_2_Deaths",
	PlaceObj('StoryBitParamNumber', {
		'Name', "new_survivors",
		'Value', 5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(301050052839, --[[StoryBit DomeHeating_2_Deaths Text]] "It’s always tough to lose friends and colleagues."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(276306885588, --[[StoryBit DomeHeating_2_Deaths Text]] "We all knew the risks when we decided to come to Mars. It is a harsh environment, but we will tame it."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
})

