-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 3600000,
	Effects = {},
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Breakthroughs",
			'TechId', "ProjectPhoenix",
		}),
	},
	ScriptDone = true,
	Text = T(675174908453, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Text]] "<sleeper_celebrities> Celebrity colonists want to join your colony and receive the benefits of your life-extending medical breakthroughs. Would you accept them?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(594877344423, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Title]] "Sleepers Have Awoken"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(200090128465, --[[voice:narrator]] "A recent medical breakthrough made on Mars has allowed the Eternal Summer company to revive its customers and now they wish to descend from orbit and revel in the new possibilities for better life."),
	group = "Earth",
	id = "TheDoorToSummer_SleepersHaveAwaken",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sleeper_celebrities",
		'Value', 7,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(851654513022, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Text]] "They are welcome!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(877436615221, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken CustomOutcomeText]] "<sleeper_celebrities> Celebrity colonists"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnColonist', {
				'Name', T(671256866065, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Bred Ford"),
				'Gender', "Male",
				'Age', "Senior",
				'Specialization', "medic",
				'Trait1', "Celebrity",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(214884496430, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Clark Jones"),
				'Gender', "Male",
				'Age', "Senior",
				'Trait1', "Celebrity",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(251049263341, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Donald Thomasson"),
				'Gender', "Male",
				'Age', "Senior",
				'Specialization', "scientist",
				'Trait1', "Celebrity",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(784134380724, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "MF-2045"),
				'Gender', "Female",
				'Age', "Senior",
				'Trait1', "Celebrity",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(965851174053, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Terry Leath"),
				'Gender', "Female",
				'Age', "Senior",
				'Trait1', "Celebrity",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(248761478842, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Ned Gilliam"),
				'Gender', "Male",
				'Age', "Senior",
				'Trait1', "Celebrity",
				'Trait2', "Fit",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T(555190058719, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Name]] "Dalt Wisney"),
				'Gender', "Male",
				'Age', "Senior",
				'Trait1', "Celebrity",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(247131150767, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken Text]] "Make them wait for a while"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(424758446569, --[[StoryBit TheDoorToSummer_SleepersHaveAwaken CustomOutcomeText]] "Postpone for 5 Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheDoorToSummer_SleepersHaveAwaken",
		},
		'Effects', {},
	}),
})

