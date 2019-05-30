-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'RandomPercent', 20,
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_duration>",
					'ModifyId', "MultiplanetSpecies",
				}),
			},
		}),
	},
	Enabled = true,
	Image = "UI/Messages/Events/07_explorer_flag.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"Brazil",
				"IMM",
				"NewArk",
				"SpaceY",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1000,
		}),
	},
	ScriptDone = true,
	Text = T(415338252937, --[[StoryBit MultiplanetSpecies Text]] "As the commander of the Colony, you have been awarded with a lifetime award for your achievements.\n\nSpeech, speech!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(369698469654, --[[StoryBit MultiplanetSpecies Title]] "Multi-planetary Species"),
	VoicedText = T(680814829271, --[[voice:narrator]] "Thanks to your ongoing efforts, humanity's foothold on Mars has been cemented. "),
	group = "Sponsor",
	id = "MultiplanetSpecies",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1552477358,
				user = "Momchil",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(107842659681, --[[StoryBit MultiplanetSpecies Text]] "This honor is not my own. All our brave colonists routinely risk their lives to make our dream a reality."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(838483919945, --[[StoryBit MultiplanetSpecies Text]] "Our success on Mars is a stepping stone on humanity's path towards the Cosmos!"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(657981397745, --[[StoryBit MultiplanetSpecies Text]] "I hope we have the wisdom to avoid the mistakes of the past as we move forward."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(121358935731, --[[StoryBit MultiplanetSpecies Text]] "Human ingenuity knows no bounds. Colonizing Mars is our collective success as a species."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(104549427575, --[[StoryBit MultiplanetSpecies Text]] "Built in the human psyche is that no veil will be left unlifted, no secret will remain unknown. "),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 7200000,
	}),
})

