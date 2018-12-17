-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "ExperimentalRocketLaunched",
	Disables = {
		"ExperimentalRocket_End_RocketScientist",
		"ExperimentalRocket_End",
	},
	Effects = {
		PlaceObj('EraseObject', nil),
	},
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('IsSupplyPod', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T(158294637830, --[[StoryBit ExperimentalRocket_LaunchFail Text]] "Sadly, the prototype engine had a crucial flaw. Precautions have been taken so this won't happen again. Still, the Rocket and its entire payload have been destroyed.\n\n<effect>Lose 1 Rocket, the payload has been destroyed."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(157487678554, --[[StoryBit ExperimentalRocket_LaunchFail Title]] "Experimental Rocket - Launch Failure"),
	Trigger = "RocketLaunchFromEarth",
	VoicedText = T(588921706704, --[[voice:narrator]] "The rocket launch was a catastrophic failure! A seal in the booster ruptured allowing a jet of pressurized gas into the fuel chamber, ultimately causing a massive explosion! "),
	group = "Rocket",
	id = "ExperimentalRocket_LaunchFail",
	PlaceObj('StoryBitReply', {
		'Text', T(120979156754, --[[StoryBit ExperimentalRocket_LaunchFail Text]] "A tragic loss! The passengers will be commemorated as heroes."),
		'Prerequisite', PlaceObj('IsRocketType', {
			'Type', "Passenger",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(916159646901, --[[StoryBit ExperimentalRocket_LaunchFail Text]] "At least no human lives have been lost..."),
		'Prerequisite', PlaceObj('IsRocketType', {
			'Type', "Passenger",
			'Negate', true,
		}),
		'HideIfDisabled', true,
	}),
})

