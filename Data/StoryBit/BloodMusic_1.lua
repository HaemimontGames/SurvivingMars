-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Storybits",
			'TechId', "AnomalousGenomeResequencing",
		}),
	},
	ScriptDone = true,
	Text = T(444991609261, --[[StoryBit BloodMusic_1 Text]] "They have mutated and have changed their behavior, slowly melding our Colonists into a species of homogenous individuals.\n\nOur research team has discovered the kill-switch mechanism to stop this. What are your orders?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(741520680813, --[[StoryBit BloodMusic_1 Title]] "Blood Music: Telophase"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(233176780135, --[[voice:narrator]] "We have discovered the reason behind the changes that affected our Colonist. Our Construction Nanites!"),
	group = "Breakthroughs",
	id = "BloodMusic_1",
	PlaceObj('StoryBitParamNumber', {
		'Name', "changed_amount",
		'Value', 30,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(206324345051, --[[StoryBit BloodMusic_1 Text]] "Stop this immediately!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(990186850816, --[[StoryBit BloodMusic_1 CustomOutcomeText]] "stop the transformation effects"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Disables', {
			"BloodMusic_Repeatable",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(400410450786, --[[StoryBit BloodMusic_1 Text]] "Probably this is for the better..."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(574433168125, --[[StoryBit BloodMusic_1 CustomOutcomeText]] "allow the effects to continue"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BloodMusic_2",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(730898167631, --[[StoryBit BloodMusic_1 Text]] "One final transformation!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(581167025529, --[[StoryBit BloodMusic_1 CustomOutcomeText]] "<changed_amount> Colonists will be re-written before stopping the effects"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Disables', {
			"BloodMusic_Repeatable",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<changed_amount>",
				'Effects', {
					PlaceObj('RemoveAllTraits', nil),
					PlaceObj('AddTrait', {
						'Trait', "Sexy",
					}),
					PlaceObj('AddTrait', {
						'Trait', "Fit",
					}),
					PlaceObj('AddTrait', {
						'Trait', "Composed",
					}),
				},
			}),
		},
	}),
})

