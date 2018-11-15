-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/21_meteors.tga",
	Prerequisites = {
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{722758732234, --[[StoryBit TheDoorToSummer Text]] "Fearing that Earth could be destroyed by a cataclysm, the ten richest customers of Eternal Summer have paid for a rocket to host their cryopods. It has launched towards Mars, where they are relying on your colony to resupply the cosmic ark.\n\n<effect>The Eternal Summer rocket will regularly ask for permission to land. If you resupply it, you will receive immediately <funding(eternal_summer_reward)> upon its launch."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{426639709835, --[[StoryBit TheDoorToSummer Title]] "The Door to Summer"},
	VoicedText = T{153472033259, --[[voice:narrator]] "Do you want to live forever? Apparently, the clients of Eternal Summer, a large cryonics company, intend to do so."},
	group = "Earth",
	id = "TheDoorToSummer",
	PlaceObj('StoryBitParamFunding', {
		'Name', "eternal_summer_reward",
		'Value', 150000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "eternal_summer_reward_oligarch",
		'Value', 450000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{125198020241, --[[StoryBit TheDoorToSummer Text]] "Space is a harsh place, and we wouldn’t leave anyone alone."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{109017199317, --[[StoryBit TheDoorToSummer CustomOutcomeText]] "Accept"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "TheDoorToSummer_Refuel",
				'ForcePopup', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{566506681287, --[[StoryBit TheDoorToSummer Text]] "It doesn't sound appealing, sorry."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{377691782663, --[[StoryBit TheDoorToSummer CustomOutcomeText]] "Refuse"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{913123433106, --[[StoryBit TheDoorToSummer Text]] "It will cost them extra, let’s say, triple."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{893389240919, --[[StoryBit TheDoorToSummer CustomOutcomeText]] "Accept and get triple reward"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "TheDoorToSummer_RefuelExpensive",
				'ForcePopup', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{717514215115, --[[StoryBit TheDoorToSummer Text]] "We won’t ask for compensation. We will do it for free."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{482597859689, --[[StoryBit TheDoorToSummer CustomOutcomeText]] "Accept and get no reward"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "TheDoorToSummer_RefuelFree",
				'ForcePopup', false,
			}),
		},
	}),
})

