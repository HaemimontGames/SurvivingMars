-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 5400000,
	Text = T(168165070059, --[[StoryBit Boost16_TrainingProgram_Second Text]] "It looks like somebody has been keeping the best for last. The final three applications are very impressive. Too bad you have to narrow the list down to one."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(708603597269, --[[voice:narrator]] "A new email pops up on your screen holding the final three applications from the training program."),
	group = "Pre-Founder Stage",
	id = "Boost16_TrainingProgram_Second",
	max_reply_id = 4,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987808,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493325,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(754709139995, --[[StoryBit Boost16_TrainingProgram_Second Text]] "We need the best and brightest!"),
		'OutcomeText', "auto",
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Genius",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(385694273187, --[[StoryBit Boost16_TrainingProgram_Second Text]] "We could use a spiritual leader."),
		'OutcomeText', "auto",
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Saint",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(789084936138, --[[StoryBit Boost16_TrainingProgram_Second Text]] "We need someone who can grab the attention of influencers back on Earth."),
		'OutcomeText', "auto",
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Celebrity",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(535413621460, --[[StoryBit Boost16_TrainingProgram_Second Text]] "Why choose, let's get all three of them on board!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(572594563097, --[[StoryBit Boost16_TrainingProgram_Second CustomOutcomeText]] "1 Genius, 1 Saint, 1 Celebrity Applicants"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "IMM",
		}),
		'unique_id', 4,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Genius",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Saint",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Celebrity",
			}),
		},
	}),
})

