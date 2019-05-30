-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RemoveAllTraits', nil),
	},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/11_idiot.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(495540594673, --[[StoryBit RainMan Text]] '<DisplayName> has developed a rare condition known as "savant syndrome". Little is known about its mechanisms and nature. In the current state, <DisplayName> shows an incredible talent for calculations. Sadly, this ability is dormant and it would require a significant effort to be unlocked and put to work. \n\n<if(is_commander("psychologist"))>[<commander_profile>] It’s not unusual for the colonist to be quite unstable and prone to further mental deterioration if exposed to high stress levels.\n\n<effect><DisplayName> has lost all traits and gained the Idiot flaw.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(789049591829, --[[StoryBit RainMan Title]] "Sanity Breakdown - Rain Man"),
	Trigger = "SanityBreakdown",
	VoicedText = T(934853978659, --[[voice:narrator]] "After a hard mental trauma caused by a Sanity breakdown, a Colonist has suffered a complete change of personality."),
	group = "Sanity Breakdown",
	id = "RainMan",
	PlaceObj('StoryBitReply', {
		'Text', T(995221421273, --[[StoryBit RainMan Text]] "Let’s hope for a full recovery in the Sanatorium."),
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "Sanatorium",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Idiot",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'VoicedText', T(123384612441, --[[voice:narrator]] "The savant Colonist sent you a greeting card from the Sanatorium, expressing deepest regards about all the care and the possibility to recover."),
		'Text', T(146911791483, --[[StoryBit RainMan Text]] "<effect>The colonist <DisplayName> has replaced the Idiot trait with Composed."),
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Composed",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(619806117075, --[[StoryBit RainMan Text]] "Make sure <DisplayName> is put to good use."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(365450269929, --[[StoryBit RainMan CustomOutcomeText]] "Gain <research(rp_bonus)> per Sol for <sols(rp_duration)> Sols"),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "rp_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "rp_bonus",
		'Value', 200,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "SponsorResearch",
				'Amount', "<rp_bonus>",
				'Sols', "<rp_duration>",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Idiot",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(818276350671, --[[voice:narrator]] "The health of the savant colonist has deteriorated due to the hard work on complex three-dimensional equations and other tedious tasks."),
		'Text', T(268267596324, --[[StoryBit RainMan Text]] "<effect>The colonist <DisplayName> has gained the Chronic Condition."),
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "SponsorResearch",
				'Amount', "<rp_bonus>",
				'Sols', "<rp_duration>",
			}),
			PlaceObj('AddTrait', {
				'Trait', "ChronicCondition",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Idiot",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(613100878264, --[[StoryBit RainMan Text]] "Poor soul! It must be a terrible experience!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Idiot",
			}),
		},
	}),
})

