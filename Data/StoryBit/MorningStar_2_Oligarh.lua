-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{574779205881, --[[voice:narrator]] 'He pulls out a long list, scrambled on a piece of paper. "You know, I can’t grant you ‘world peace’ or ‘end hunger’, but the list is quite impressive, right?"'},
	group = "Default",
	id = "MorningStar_2_Oligarh",
	PlaceObj('StoryBitReply', {
		'Text', T{890069080457, --[[StoryBit MorningStar_2_Oligarh Text]] "Wealth."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{699225613606, --[[StoryBit MorningStar_2_Oligarh CustomOutcomeText]] "<funding(wealthfunding)>"},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "wealthfunding",
		'Value', 2000000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{199634326749, --[[voice:narrator]] '"The choice of kings! Here’s how you could apply for additional funding. It’s a bureaucratic nightmare and it’s no wonder you missed it, but with my suggestions you will surely get what you need."'},
		'Text', T{667145187114, --[[StoryBit MorningStar_2_Oligarh Text]] "<effect>Gain <funding(wealthfunding)>"},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<wealthfunding>",
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_1_Choice",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{810989775301, --[[StoryBit MorningStar_2_Oligarh Text]] "Prosperity."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{902776079446, --[[StoryBit MorningStar_2_Oligarh CustomOutcomeText]] "discover new deposits"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{505057266244, --[[voice:narrator]] '"Give me a lever, eh? If you have ran a secondary diagnostics on your scanners, you would have found this data yourself. Here, you can see obvious chemical traces. I’d check them if I were you."'},
		'Text', T{954272355311, --[[StoryBit MorningStar_2_Oligarh Text]] "<effect>Several new underground deposits have been revealed"},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', nil),
			PlaceObj('SpawnSubsurfaceDeposits', nil),
			PlaceObj('SpawnSubsurfaceDeposits', nil),
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_1_Choice",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{603156362403, --[[StoryBit MorningStar_2_Oligarh Text]] "Happiness."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{629848954365, --[[StoryBit MorningStar_2_Oligarh CustomOutcomeText]] "better Comfort in residences"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "happinesscomfort",
		'Value', 10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{974169866516, --[[voice:narrator]] '"A true leader! I wasn’t wrong about you, Commander!"'},
		'Text', T{457784743426, --[[StoryBit MorningStar_2_Oligarh Text]] '"Your people experience quite the difficulties every day, but they are tough and would rather not talk about it. I heard this and that, so here’s how to improve their lifestyle."\n\nThe list he gives you is impressive, and so easy to implement.\n\n<effect>Comfort in all residences improved by <happinesscomfort>'},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "service_comfort",
				'Amount', "<happinesscomfort>",
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_1_Choice",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "knowledgeresearch1",
		'Value', 200,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "knowledgeresearch",
		'Value', 200,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{875253584085, --[[StoryBit MorningStar_2_Oligarh Text]] "Knowledge."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{426181959367, --[[StoryBit MorningStar_2_Oligarh CustomOutcomeText]] "<research(knowledgeresearch)> per Sol"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{337766628296, --[[voice:narrator]] '"Great choice! Here’s how to improve your analytical methods."'},
		'Text', T{272738533394, --[[StoryBit MorningStar_2_Oligarh Text]] '"Yes, it’s unorthodox, but so is the mystery of science, is it not?"\n\nThe Scientists are puzzled with his suggestions, but when they test run the new method, it provides astonishing results.\n'},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "SponsorResearch",
				'Amount', "<knowledgeresearch1>",
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_1_Choice",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{946489936725, --[[StoryBit MorningStar_2_Oligarh Text]] "On a second thought, I’d rather not."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{671269840703, --[[voice:narrator]] '"You seemed a person who knows better." He walks out of your office. When the door closes, he is nowhere to be found.'},
		'Disables', {
			"MorningStar_4_BigPunishment",
		},
		'Effects', {},
	}),
})

