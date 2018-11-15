-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "FounderRocketLanded",
	CompletionEffects = {},
	Disables = {
		"TheStowaway_2_NonGenius",
	},
	Effects = {},
	EnableChance = 10,
	Enabled = true,
	Image = "UI/Messages/Events/27_rocket_launch.tga",
	NotificationOnly = false,
	Prerequisites = {},
	ScriptDone = true,
	Text = T{194914260658, --[[StoryBit TheStowaway_1_Genius Text]] 'Susie, our little stowaway, visibly around 8 years old, managed to somehow bypass all security measures by sheer luck and sneaked onboard during pre-launch. Scared, but excited, she explains that she wants to live on Mars and begs you to let her stay in the colony.\n\nThis incident was already reported to Earth and her billionaire father has offered a significant reward for her safe return.  Keeping her in the Colony will certainly create a PR and political nightmare.\n\n<if(is_commander("psychologist"))>[<commander_profile>] Interviewing Susie, you discover a huge potential in her and intelligence far beyond what her age would suggest.</if>'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{656027729407, --[[StoryBit TheStowaway_1_Genius Title]] "The Stowaway"},
	Trigger = "RocketLanded",
	VoicedText = T{453966578879, --[[voice:narrator]] "A young girl was discovered on board of the Founders' rocket!"},
	group = "Founder Stage",
	id = "TheStowaway_1_Genius",
	PlaceObj('StoryBitParamFunding', {
		'Name', "fundingreward",
		'Value', 100000000,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "fundingloss",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{787183055788, --[[StoryBit TheStowaway_1_Genius Text]] "Mars is no place for a child. Return her to Earth on the next flight!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{939217727351, --[[StoryBit TheStowaway_1_Genius CustomOutcomeText]] "get <funding(fundingreward)>"},
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
		'Text', T{616036590420, --[[StoryBit TheStowaway_1_Genius Text]] "She is a true Founder and should stay in the Colony!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{213406513448, --[[StoryBit TheStowaway_1_Genius CustomOutcomeText]] "get a child Colonist, lose <fundingloss>% Funding"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheStowaway_3_MakeGenius",
		},
		'Effects', {
			PlaceObj('LoseFundingPercent', {
				'Percent', "<fundingloss>",
			}),
			PlaceObj('SpawnColonist', {
				'Name', T{257928022372, --[[StoryBit TheStowaway_1_Genius Name]] "Susan Zann"},
				'Gender', "Female",
				'Age', "Child",
				'AssociateWithStoryBit', true,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{326798191700, --[[StoryBit TheStowaway_1_Genius Text]] "Let her stay, I will deal with all consequences myself!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{944550211148, --[[StoryBit TheStowaway_1_Genius CustomOutcomeText]] "get a child Colonist"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheStowaway_3_MakeGenius",
		},
		'Effects', {
			PlaceObj('SpawnColonist', {
				'Name', T{292019695018, --[[StoryBit TheStowaway_1_Genius Name]] "Susan Zann"},
				'Gender', "Female",
				'Age', "Child",
				'AssociateWithStoryBit', true,
			}),
		},
	}),
})

