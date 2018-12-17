-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/09_fireworks.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Dome",
			'Conditions', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {},
					'Condition', ">",
					'Amount', 0,
				}),
			},
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', 100000000,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(410008407981, --[[StoryBit RockScape Text]] "They will tour all the different colonies on Mars and have got their own transportation covered. All RockScape's management needs from us is permission to play and to prepare a Dome for the event. "),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(696204225880, --[[StoryBit RockScape Title]] "RockScape"),
	VoicedText = T(228017878512, --[[voice:narrator]] "A famous rock band called RockScape wishes to bring their music to Mars for a live performance."),
	group = "Default",
	id = "RockScape",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "moraleboost_period",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "prepare_dome",
		'Value', 100000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(982876057335, --[[StoryBit RockScape Text]] "Rock'n'Roll, baby!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(335367414277, --[[StoryBit RockScape CustomOutcomeText]] "all Colonists gain <morale_boost> Morale for <sols(moraleboost_period)> Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<moraleboost_period>",
					}),
				},
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "RockScape_CrackedDome",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(906031307867, --[[StoryBit RockScape Text]] "We have enough troubles. Don't rock the boat I say."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(824937946497, --[[StoryBit RockScape Text]] "We will need to prepare a Dome to withstand the noise levels an event like this suggests."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(673706997571, --[[StoryBit RockScape CustomOutcomeText]] "all Colonists gain <morale_boost> Morale for <sols(moraleboost_period)> Sols"),
		'Cost', "<prepare_dome>",
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<moraleboost_period>",
					}),
				},
			}),
			PlaceObj('PayFunding', {
				'Amount', "<prepare_dome>",
			}),
		},
	}),
})

