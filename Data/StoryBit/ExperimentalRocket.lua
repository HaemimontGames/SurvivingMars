-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/27_rocket_launch.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(262478553203, --[[StoryBit ExperimentalRocket Text]] '<if(is_commander("rocketscientist"))>[<commander_profile>] Testing out the new engine will be a high-stake endeavor. Perhaps it would be wise to keep the payloads minimal until design kinks have been ironed out.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(161497508085, --[[StoryBit ExperimentalRocket Title]] "Experimental Rocket"),
	VoicedText = T(170727039645, --[[voice:narrator]] "A new rocket engine has been developed by our sponsor on Earth.  We have been offered the dubious honor of testing the first prototype."),
	group = "Rocket",
	id = "ExperimentalRocket",
	PlaceObj('StoryBitParamPercent', {
		'Name', "traveltime_decrease",
		'Value', -10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(896864450689, --[[StoryBit ExperimentalRocket Text]] "We accept!"),
		'OutcomeText', "custom",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"ExperimentalRocket_LaunchFail",
			"ExperimentalRocket_End",
		},
		'Effects', {
			PlaceObj('RewardNewRocket', nil),
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeEarthMars",
				'Percent', "<traveltime_decrease>",
				'Description', T(11208, --[[StoryBit ExperimentalRocket Description]] "rocket travel time <traveltime_decrease>%"),
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeMarsEarth",
				'Percent', "<traveltime_decrease>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(439284841942, --[[StoryBit ExperimentalRocket Text]] "Let me have a look at the blueprints"),
		'OutcomeText', "custom",
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"ExperimentalRocket_LaunchFail",
			"ExperimentalRocket_End_RocketScientist",
		},
		'Effects', {
			PlaceObj('RewardNewRocket', nil),
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeEarthMars",
				'Percent', "<traveltime_decrease>",
				'Description', T(867291257749, --[[StoryBit ExperimentalRocket Description]] "rocket travel time permanently decreased by <traveltime_decrease>%"),
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeMarsEarth",
				'Percent', "<traveltime_decrease>",
				'Description', "",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(226537612431, --[[StoryBit ExperimentalRocket Text]] "Sounds too risky"),
	}),
})

