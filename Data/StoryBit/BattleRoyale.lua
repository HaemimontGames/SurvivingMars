-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/29_shuttle.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "VRWorkshop",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">",
			'Amount', 0,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(925112213569, --[[StoryBit BattleRoyale Text]] "Following the hype the game has generated, we have been approached by a major video game publisher with an offer to buy out the rights for the game and sell it commercially."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(175627926040, --[[StoryBit BattleRoyale Title]] "Battle Royale"),
	VoicedText = T(904863988346, --[[voice:narrator]] "A Battle Royale VR game, created solely for recreational purposes by our VR Workshop team, has been leaked to Earth and is quickly becoming a smashing hit. "),
	group = "Buildings",
	id = "BattleRoyale",
	PlaceObj('StoryBitParamSols', {
		'Name', "royalty_period",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "royalty_duration",
		'Value', 36000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "immediate_profit",
		'Value', 150000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(193724989971, --[[StoryBit BattleRoyale Text]] "Sounds like a no-brainer - sell them the rights and get royalties every <sols(royalty_period)> Sols for the next <sols(royalty_duration)> Sols."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BattleRoyale_Royalties",
			"BattleRoyale_Kill",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(366536487420, --[[StoryBit BattleRoyale Text]] "The game was not made with profit in mind. We should formally release it for free."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(841972874775, --[[StoryBit BattleRoyale CustomOutcomeText]] "gain <applicants> Gamer applicants, Gamer colonists get large Morale boost"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicants",
		'Value', 200,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 30,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<applicants>",
				'Trait', "Gamer",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Gamer",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_boost_duration>",
						'ModifyId', "BattleRoyale",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(618247142902, --[[StoryBit BattleRoyale Text]] "We'll publish the game ourselves!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(720608981538, --[[StoryBit BattleRoyale CustomOutcomeText]] "lump sum in profits now and larger royalties every <sols(royalty_period)> Sols for the next <sols(royalty_duration)> Sols"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "paradox",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BattleRoyale_RoyaltiesParadox",
			"BattleRoyale_Kill",
		},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<immediate_profit>",
			}),
		},
	}),
})

