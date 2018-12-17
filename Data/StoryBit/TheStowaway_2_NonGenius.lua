-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "FounderRocketLanded",
	CompletionEffects = {},
	Disables = {
		"TheStowaway_1_Genius",
	},
	Effects = {},
	EnableChance = 15,
	Enabled = true,
	Image = "UI/Messages/Events/27_rocket_launch.tga",
	NotificationOnly = false,
	Prerequisites = {},
	ScriptDone = true,
	Text = T(423144915362, --[[StoryBit TheStowaway_2_NonGenius Text]] 'Susie, our little stowaway, visibly around 8 years old, managed to somehow bypass all security measures by sheer luck and sneaked onboard during pre-launch. Scared, but excited, she explains that she wants to live on Mars and begs you to let her stay in the colony.\n\nThis incident was already reported to Earth and her billionaire father has offered a significant reward for her safe return.  Keeping her in the Colony will certainly create a PR and political nightmare.\n\n<if(is_commander("psychologist"))>[<commander_profile>] Interviewing Susie, you spot the telltale signs of unhappy childhood and neglect back home. Perhaps she would be happier here?</if>'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(656027729407, --[[StoryBit TheStowaway_2_NonGenius Title]] "The Stowaway"),
	Trigger = "RocketLanded",
	VoicedText = T(453966578879, --[[voice:narrator]] "A young girl was discovered on board of the Founders' rocket!"),
	group = "Founder Stage",
	id = "TheStowaway_2_NonGenius",
	PlaceObj('StoryBitParamFunding', {
		'Name', "fundingreward",
		'Value', 100000000,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "fundingloss",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(787183055788, --[[StoryBit TheStowaway_2_NonGenius Text]] "Mars is no place for a child. Return her to Earth on the next flight!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(572058567776, --[[StoryBit TheStowaway_2_NonGenius CustomOutcomeText]] "get <funding(fundingreward)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<fundingreward>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(616036590420, --[[StoryBit TheStowaway_2_NonGenius Text]] "She is a true Founder and should stay in the Colony!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(741057048424, --[[StoryBit TheStowaway_2_NonGenius CustomOutcomeText]] "get a child Colonist, lose <fundingloss>% Funding"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('LoseFundingPercent', {
				'Percent', "<fundingloss>",
			}),
			PlaceObj('SpawnColonist', {
				'Gender', "Female",
				'Age', "Child",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(326798191700, --[[StoryBit TheStowaway_2_NonGenius Text]] "Let her stay, I will deal with all consequences myself!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(465596687066, --[[StoryBit TheStowaway_2_NonGenius CustomOutcomeText]] "get a child Colonist"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('SpawnColonist', {
				'Gender', "Female",
				'Age', "Child",
			}),
		},
	}),
})

