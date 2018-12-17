-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(11844, 'He grins. "You know, I can’t grant you ‘world peace’ or ‘end hunger’, but the list is quite impressive, right?"'),
	group = "Default",
	id = "MorningStar_1_Choice",
	PlaceObj('StoryBitReply', {
		'Text', T(890069080457, --[[StoryBit MorningStar_1_Choice Text]] "Wealth."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(694338449230, --[[StoryBit MorningStar_1_Choice CustomOutcomeText]] "<funding(wealthfunding)>"),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "wealthfunding",
		'Value', 2000000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(199634326749, --[[voice:narrator]] '"The choice of kings! Here’s how you could apply for additional funding. It’s a bureaucratic nightmare and it’s no wonder you missed it, but with my suggestions you will surely get what you need."'),
		'Text', T(11047, --[[StoryBit MorningStar_1_Choice Text]] "He waves with a smile and leaves your office, without a trace.\n\n<effect>Gain <funding(wealthfunding)>"),
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<wealthfunding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(832861218176, --[[StoryBit MorningStar_1_Choice Text]] "Prosperity."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(970775241881, --[[StoryBit MorningStar_1_Choice CustomOutcomeText]] "discover new deposits"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(505057266244, --[[voice:narrator]] '"Give me a lever, eh? If you have ran a secondary diagnostics on your scanners, you would have found this data yourself. Here, you can see obvious chemical traces. I’d check them if I were you."'),
		'Text', T(11048, --[[StoryBit MorningStar_1_Choice Text]] "He turns with a smile and leaves your office without a trace.\n\n<effect>Several new underground deposits have been revealed"),
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', nil),
			PlaceObj('SpawnSubsurfaceDeposits', nil),
			PlaceObj('SpawnSubsurfaceDeposits', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(146562944805, --[[StoryBit MorningStar_1_Choice Text]] "Happiness."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(940072302892, --[[StoryBit MorningStar_1_Choice CustomOutcomeText]] "better Comfort in residences"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "happinesscomfort",
		'Value', 10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(974169866516, --[[voice:narrator]] '"A true leader! I wasn’t wrong about you, Commander!"'),
		'Text', T(11049, --[[StoryBit MorningStar_1_Choice Text]] '"Your people experience quite the difficulties every day, but they are tough and would rather not talk about it. Here’s how to improve their lifestyle."\n\nThe list he gives you is impressive, and so easy to implement. As he handles it to you, he turns away and disappears without a trance.\n\n<effect>Comfort in all residences improved by <happinesscomfort>'),
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "service_comfort",
				'Amount', "<happinesscomfort>",
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
		'Text', T(120794956328, --[[StoryBit MorningStar_1_Choice Text]] "Knowledge."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(528223058737, --[[StoryBit MorningStar_1_Choice CustomOutcomeText]] "<research(knowledgeresearch)> per Sol"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(337766628296, --[[voice:narrator]] '"Great choice! Here’s how to improve your analytical methods."'),
		'Text', T(11050, --[[StoryBit MorningStar_1_Choice Text]] '"Yes, it’s unorthodox, but so is the mystery of science, is it not?" Then he leaves without a trace.\n\nThe Scientists are puzzled with his suggestions, but when they test run the new method, it provides astonishing results.\n'),
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "SponsorResearch",
				'Amount', "<knowledgeresearch1>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(946489936725, --[[StoryBit MorningStar_1_Choice Text]] "On a second thought, I’d rather not."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(671269840703, --[[voice:narrator]] '"You seemed a person who knows better." He walks out of your office. When the door closes, he is nowhere to be found.'),
		'Disables', {
			"MorningStar_3_SmallPunishment",
		},
		'Effects', {},
	}),
})

