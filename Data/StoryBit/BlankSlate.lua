-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RewardApplicants', {
			'Amount', -20,
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "SpaceRehabilitation",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(465583094158, --[[StoryBit BlankSlate Text]] "People whisper with fear about an applicant who has been subjected to the Space Rehabilitation treatment and suffered a terrible fate, losing all memories and personality traits! Now the Applicants have started resigning from the program, which threatens our public face on Earth.\n\nIt is all a fabrication, but how can we convince the applicants?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(575189948636, --[[StoryBit BlankSlate Title]] "Blank Slate"),
	VoicedText = T(650388033312, --[[voice:narrator]] "A dark rumor is spreading among the applicants who want to join our Colony on Mars."),
	group = "Breakthroughs",
	id = "BlankSlate",
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicants_lost",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_lost",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_down_sols",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(411254030290, --[[StoryBit BlankSlate Text]] "Remind them of their contracts."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(791068462909, --[[StoryBit BlankSlate CustomOutcomeText]] "no Applicants leave the Applicants Pool, all Colonists lose <morale_lost> Morale for <sols(morale_down_sols)> Sols"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "BlueSun",
		}),
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
						'Amount', "<morale_lost>",
						'Sols', "<morale_down_sols>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "financial_cost",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "paid_applicants",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(760594442814, --[[StoryBit BlankSlate Text]] "Financial stimulus for the best!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(560772568652, --[[StoryBit BlankSlate CustomOutcomeText]] "<applicants_lost> will leave but <paid_applicants> Applicants with Perks join the Applicants Pool"),
		'Cost', "<financial_cost>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 5,
				'Trait', "Workaholic",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 5,
				'Trait', "Nerd",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(837120646476, --[[StoryBit BlankSlate Text]] "Attract desperate souls!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(143596743417, --[[StoryBit BlankSlate CustomOutcomeText]] "<applicants_lost> will leave but <idiots_gained> Applicants with Flaws will join the Applicants Pool"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "idiots_gained",
		'Value', 30,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 7,
				'Trait', "Gambler",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 7,
				'Trait', "Alcoholic",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 7,
				'Trait', "Whiner",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 7,
				'Trait', "Lazy",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 2,
				'Trait', "Idiot",
			}),
		},
	}),
})

