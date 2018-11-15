-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
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
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "Cure4Cancer",
		}),
	},
	ScriptDone = true,
	Text = T{500948267418, --[[StoryBit Cure4Cancer_NormalOutcome Text]] "A battle in the war against Cancer has been won! Humanity hasn't discovered the cure for the horrific disease yet, but we managed to make progress. Our colonists are proud that we were a part of this initiative.  \n\n<effect>+<morale_boost> Morale for the next <sols(morale_boost_duration)> Sols"},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T{356069116535, --[[voice:narrator]] "Everyone on Mars is standing tall today, filled with great pride. "},
	group = "Sponsor",
	id = "Cure4Cancer_NormalOutcome",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 3600000,
	}),
})

