-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "RocketManualLaunch",
	Effects = {},
	EnableChance = 30,
	Enabled = true,
	Image = "UI/Messages/rocket.tga",
	NotificationText = "",
	OneTime = false,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(944350528421, --[[StoryBit RocketLaunchFailed Text]] "<DisplayName> has failed to launch. We believe the problem lies within the ratio of liquid oxygen to liquid methane. We’ve compensated the issue but it is highly recommended to perform a full maintenance on the Rocket which will cost <machineparts(cost)>."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(748450323950, --[[StoryBit RocketLaunchFailed Title]] "Rocket Launch Failed"),
	Trigger = "RocketManualLaunch",
	VoicedText = T(926337137580, --[[voice:narrator]] "Several Colonists have gathered to watch the launch. Their anticipation is quickly replaced by concern as the engines spit dust and smoke but the Rocket refuses to get off the ground."),
	group = "Rocket",
	id = "RocketLaunchFailed",
	PlaceObj('StoryBitParamResource', {
		'Name', "cost",
		'Value', 5000,
		'Resource', "machineparts",
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(821042326143, --[[StoryBit RocketLaunchFailed Text]] "Perform the maintenance."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('MalfunctionRocket', {
				'Resource', "MachineParts",
				'Amount', "<cost>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(591259837155, --[[StoryBit RocketLaunchFailed Text]] "I think the issue is software-related."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(313874052184, --[[StoryBit RocketLaunchFailed CustomOutcomeText]] "launch without risk of explosion"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(683157016670, --[[StoryBit RocketLaunchFailed Text]] "Launch the Rocket and repair it back on Earth."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(761831927789, --[[StoryBit RocketLaunchFailed CustomOutcomeText]] "we may lose the Rocket"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 80,
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'VoicedText', T(385674223967, --[[voice:narrator]] "The Rocket slowly begins to move towards the sky but something is not right. Just seconds later it is engulfed in flames and a bright fireball lights the sky."),
		'Text', T(947247478640, --[[StoryBit RocketLaunchFailed Text]] "We’ve lost rocket <DisplayName>. Fortunately there was no collateral damage but the entire payload was destroyed.\n\n<effect><morale> Morale for the next <sols(morale_duration)> Sols."),
		'Effects', {
			PlaceObj('ExplodeRocket', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale>",
						'Sols', "<morale_duration>",
						'ModifyId', "RocketLaunchDelay",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration",
		'Value', 3600000,
	}),
})

