-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "RocketManualLaunch",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/27_rocket_launch.tga",
	NotificationText = "",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(510881587031, --[[StoryBit RocketLaunchDelayed Text]] "We had to suspend the rocket launch due to suspicious atmospheric patterns. There is nothing wrong with the Rocket and it is now ready for launch again. However people are concerned - after all rockets are our only way back home. "),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(580256524353, --[[StoryBit RocketLaunchDelayed Title]] "Rocket Launch Failed"),
	Trigger = "RocketManualLaunch",
	VoicedText = T(161329772050, --[[voice:narrator]] "Several colonists have gathered to watch the launch. Their anticipation is quickly replaced by concern as the engines remain silent and the Rocket remains firmly on the ground."),
	group = "Rocket",
	id = "RocketLaunchDelayed",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1551087520,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(992957668054, --[[StoryBit RocketLaunchDelayed Text]] "You have my full assurance that everything is going to be alright."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(489829792533, --[[StoryBit RocketLaunchDelayed CustomOutcomeText]] "no negative effects"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "politician",
			'CommanderProfile2', "citymayor",
		}),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(319132709574, --[[StoryBit RocketLaunchDelayed Text]] "Postponing rocket launches is a routine procedure, there's nothing to fear."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(402942012484, --[[StoryBit RocketLaunchDelayed CustomOutcomeText]] "<rocket_scientist_morale> Morale for <sols(rocket_scientist_morale_duration)> Sols"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rocket_scientist_morale",
		'Value', -5,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "rocket_scientist_morale_duration",
		'Value', 1440000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<rocket_scientist_morale>",
						'Sols', "<rocket_scientist_morale_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(12239, --[[StoryBit RocketLaunchDelayed Text]] "We will do an additional maintenance check, just to alleviate the concerns."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(399227795562, --[[StoryBit RocketLaunchDelayed CustomOutcomeText]] "rocket will require <electronics(rocket_maintenance)> for maintenance"),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "rocket_maintenance",
		'Value', 5000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('MalfunctionRocket', {
				'Resource', "Electronics",
				'Amount', "<rocket_maintenance>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(787193286367, --[[StoryBit RocketLaunchDelayed Text]] "If the experts are satisfied, this is good enough for me."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(475359645796, --[[StoryBit RocketLaunchDelayed CustomOutcomeText]] "<morale> Morale for <sols(morale_duration)> Sols"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
		},
	}),
})

