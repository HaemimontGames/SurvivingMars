-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Enables = {
		"Boost16_TrainingProgram_Second",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(536086870774, --[[StoryBit Boost16_TrainingProgram Text]] "Best of Best, as the program is being called, wants your input on what specialization field they should concentrate their recruitment efforts."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(126824585435, --[[StoryBit Boost16_TrainingProgram Title]] "Training Program"),
	VoicedText = T(490817964403, --[[voice:narrator]] "With the early phase of our mission showing relative stability and gaining in popularity back on Earth, our sponsor feels we are in a good position to push forward a training program aimed at attracting the best applicants Earth has to offer."),
	group = "Pre-Founder Stage",
	id = "Boost16_TrainingProgram",
	max_reply_id = 5,
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
				time = 1549987800,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550491862,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493173,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551964672,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(952108723900, --[[StoryBit Boost16_TrainingProgram Text]] "We will always need more Scientists."),
		'OutcomeText', "auto",
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 15,
				'Specialization', "scientist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(219508071367, --[[StoryBit Boost16_TrainingProgram Text]] "Qualified Geologists will be vital for resource extraction early on."),
		'OutcomeText', "auto",
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 15,
				'Specialization', "geologist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(291182459649, --[[StoryBit Boost16_TrainingProgram Text]] "We need Botanists to secure the food production of the colony."),
		'OutcomeText', "auto",
		'unique_id', 4,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 15,
				'Specialization', "botanist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(572254383751, --[[StoryBit Boost16_TrainingProgram Text]] "A productive mindset is more important then the exact specialization."),
		'OutcomeText', "auto",
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
		'unique_id', 5,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 15,
				'Trait', "Workaholic",
			}),
		},
	}),
})

