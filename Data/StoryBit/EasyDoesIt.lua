-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/16_polymer_factory.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "FactoryAutomation",
		}),
		PlaceObj('PickFromLabel', {
			'Label', "FactoryBuildings",
			'Conditions', {
				PlaceObj('IsBuildingWorking', nil),
			},
		}),
	},
	ScriptDone = true,
	Text = T(285306417334, --[[StoryBit EasyDoesIt Text]] "The efficiency report from your <DisplayName> shows that production is way below the expected amount! Obviously, the workers trusted the application of Factory Automation too much to even bother doing their part."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(979863861661, --[[StoryBit EasyDoesIt Title]] "Easy Does It"),
	VoicedText = T(467376302309, --[[voice:narrator]] "Something doesn’t add up with the production data from one of your factories. When you ask the shift manager, your words are met with guilty silence."),
	group = "Breakthroughs",
	id = "EasyDoesIt",
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(393440796235, --[[StoryBit EasyDoesIt Text]] "Not acceptable! The Colony depends on everyone doing their part."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(826846250782, --[[StoryBit EasyDoesIt CustomOutcomeText]] "workers lose <comfort> Comfort and gain <morale> Morale for <sols(morale_sols)> Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachWorker', {
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort>",
					}),
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale>",
						'Sols', "<morale_sols>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(941104990160, --[[StoryBit EasyDoesIt Text]] "No harm done, we can overlook the accident."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(968947900983, --[[StoryBit EasyDoesIt CustomOutcomeText]] "risk the workers to become Lazy"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Effects', {
			PlaceObj('ForEachWorker', {
				'Filters', {},
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Lazy",
					}),
				},
			}),
		},
	}),
})

