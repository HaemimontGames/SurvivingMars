-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ExplodeRocket', nil),
	},
	Category = "RocketManualLaunch",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/23_red_alert.tga",
	NotificationText = "",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "AllRockets",
			'Filters', {},
			'Condition', ">=",
			'Amount', 2,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 10,
		}),
	},
	ScriptDone = true,
	Text = T(274578177838, --[[StoryBit RenegadeRocket Text]] "The Rocket has exploded just moments after igniting its engines. Sensor data report all systems were functioning within expected parameters. The evidence points to Renegade sabotage."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(351975135088, --[[StoryBit RenegadeRocket Title]] "Renegades: Sabotage!"),
	Trigger = "RocketManualLaunch",
	VoicedText = T(194912265053, --[[voice:narrator]] "Dozens of red lights and alarms go off. Monitors stay frozen on the massive fireball that was our Rocket a second ago."),
	group = "Rocket",
	id = "RenegadeRocket",
	PlaceObj('StoryBitReply', {
		'Text', T(396137480224, --[[StoryBit RenegadeRocket Text]] "The Renegades went too far this time..."),
	}),
})

