-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PickFromLabelEffect', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
		}),
	},
	Effects = {
		PlaceObj('AddTrait', {
			'Trait', "Celebrity",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{817294870240, --[[StoryBit WinterWonderland_SaveKidHero Text]] "Colonist <DisplayName> managed to get to the kid just in time and escape the ravine intact. The entire colony sings high praises of the heroic rescuer.\n\n<effect><DisplayName> has gained the Celebrity trait."},
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Disasters",
	id = "WinterWonderland_SaveKidHero",
})

