-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'RandomCount', "<changed_colonists>",
			'Effects', {
				PlaceObj('RemoveAllTraits', nil),
				PlaceObj('AddTrait', {
					'Trait', "Fit",
				}),
				PlaceObj('AddTrait', {
					'Trait', "Composed",
				}),
				PlaceObj('AddTrait', {
					'Trait', "Sexy",
				}),
			},
		}),
	},
	Enables = {
		"BloodMusic_Repeatable",
	},
	InheritsObject = false,
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(551675992984, --[[StoryBit BloodMusic_Repeatable Text]] "Again, they have lost all of their personality and have become more or less the same perfect individual.\n\n<effect><changed_colonists> Colonists have lost their traits and have gained the Perks Composed, Fit and Sexy."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(181012760721, --[[StoryBit BloodMusic_Repeatable Title]] "Blood Music: Metaphase"),
	VoicedText = T(867033361154, --[[voice:narrator]] "More Colonists have been completely re-written!"),
	group = "Breakthroughs",
	id = "BloodMusic_Repeatable",
	PlaceObj('StoryBitParamNumber', {
		'Name', "changed_colonists",
		'Value', 5,
	}),
})

