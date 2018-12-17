-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Tourist",
				}),
			},
			'Condition', ">",
			'Amount', 0,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(906758697847, --[[StoryBit Tourism_MarsorBust Text]] "The tourist wanders away and you can’t resist the urge to come up with a good, inspiring slogan."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(388377822726, --[[StoryBit Tourism_MarsorBust Title]] "Mars or Bust!"),
	VoicedText = T(421044078672, --[[voice:narrator]] 'A jaunty tourist approaches you on the street. "Let me give you a tip – you need a simple tourism campaign and people would be dying to visit Mars. Why don’t you start with a catchy slogan?"'),
	group = "Earth",
	id = "Tourism_MarsorBust",
	PlaceObj('StoryBitParamNumber', {
		'Name', "tourism_applicants_bonus",
		'Value', 50,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(344561667066, --[[StoryBit Tourism_MarsorBust Text]] '"Mars – just add water!"'),
		'OutcomeText', "custom",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(806583175301, --[[StoryBit Tourism_MarsorBust Title]] "Mars or Bust!"),
		'VoicedText', T(243565696205, --[[voice:narrator]] "Unsurprisingly, the new slogan became viral within hours of its release."),
		'Text', T(479155560294, --[[StoryBit Tourism_MarsorBust Text]] "Your e-mail is now clogged with requests to accept various wealthy tourists in the colony, as well as many more who just cannot afford it.\n\n<effect><tourism_applicants_bonus> Tourist applicants available"),
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourism_applicants_bonus>",
				'Trait', "Tourist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(626840039624, --[[StoryBit Tourism_MarsorBust Text]] '"Making Pluto jealous since 2006."'),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(806583175301, --[[StoryBit Tourism_MarsorBust Title]] "Mars or Bust!"),
		'VoicedText', T(243565696205, --[[voice:narrator]] "Unsurprisingly, the new slogan became viral within hours of its release."),
		'Text', T(479155560294, --[[StoryBit Tourism_MarsorBust Text]] "Your e-mail is now clogged with requests to accept various wealthy tourists in the colony, as well as many more who just cannot afford it.\n\n<effect><tourism_applicants_bonus> Tourist applicants available"),
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourism_applicants_bonus>",
				'Trait', "Tourist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(668603556753, --[[StoryBit Tourism_MarsorBust Text]] '"Mars – better than Uranus!"'),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(806583175301, --[[StoryBit Tourism_MarsorBust Title]] "Mars or Bust!"),
		'VoicedText', T(243565696205, --[[voice:narrator]] "Unsurprisingly, the new slogan became viral within hours of its release."),
		'Text', T(479155560294, --[[StoryBit Tourism_MarsorBust Text]] "Your e-mail is now clogged with requests to accept various wealthy tourists in the colony, as well as many more who just cannot afford it.\n\n<effect><tourism_applicants_bonus> Tourist applicants available"),
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourism_applicants_bonus>",
				'Trait', "Tourist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(229696330740, --[[StoryBit Tourism_MarsorBust Text]] "Organize an online competition about the Martian tourism slogan!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(806583175301, --[[StoryBit Tourism_MarsorBust Title]] "Mars or Bust!"),
		'VoicedText', T(358774322916, --[[voice:narrator]] "Maybe it sounded better than it turned out."),
		'Text', T(474544211678, --[[StoryBit Tourism_MarsorBust Text]] 'Within mere hours users from an infamous online image board flooded the campaign with such proposals that you didn’t dare write them in your mission log. After shutting it down, you just chose "Mars – have it your way!" and called it a day.\n\n<effect><tourism_applicants_bonus> Tourist applicants available'),
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourism_applicants_bonus>",
				'Trait', "Tourist",
			}),
		},
	}),
})

