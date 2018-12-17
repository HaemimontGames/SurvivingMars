-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "DustStromStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/dust_devil.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 5,
		}),
		PlaceObj('IsSolInRange', {
			'Max', 70,
		}),
	},
	ScriptDone = true,
	Text = T(541207674051, --[[StoryBit Dust_Melancholy Text]] "The sounds of the Dust Storm keep colonists awake at night. Combined with the gloomy sunless daytime sky the conditions have made all colonists weary and irritable."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(754526467674, --[[StoryBit Dust_Melancholy Title]] "Dust Melancholy"),
	Trigger = "DustStorm",
	VoicedText = T(871253857670, --[[voice:narrator]] "The dome resonates with a quiet but never ending howl. You toss and turn in bed but sleep escapes you."),
	group = "Disasters",
	id = "Dust_Melancholy",
	PlaceObj('StoryBitReply', {
		'Text', T(501781221141, --[[StoryBit Dust_Melancholy Text]] "That’s the reality of Mars."),
		'OutcomeText', "custom",
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_penalty",
		'Value', -20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_penalty>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(357812255645, --[[StoryBit Dust_Melancholy Text]] "We can take it easy for a couple of days."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(152333583580, --[[StoryBit Dust_Melancholy CustomOutcomeText]] "<performance_penalty> worker Performance until the Dust Storm is over"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "performance_penalty",
		'Value', -20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Dust_Melancholy_End",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "performance",
				'Amount', "<performance_penalty>",
				'ModifyId', "Dust_Melancholy",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(987920926460, --[[StoryBit Dust_Melancholy Text]] "Let's have a party!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(198656026991, --[[StoryBit Dust_Melancholy CustomOutcomeText]] "unknown consequences"),
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "Spacebar",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(251440213342, --[[voice:narrator]] "The colonists raise yet another toast with full glasses in hand. Even in the most desolate of worlds humans can rely on alcohol to escape their current worries."),
		'Text', T(880024393960, --[[StoryBit Dust_Melancholy Text]] "There was a serious discussion whether alcohol should be allowed in the first Martian colony or not. On the one hand culturally alcohol is widely accepted and considered a normal part of life. On the other alcohol has adverse effects on health and can lead to accidents. \n\nUltimately it was allowed as it was believed that it can be helpful for colonists to feel more at home.\n\n<effect> Several colonists have gained the Alcoholic trait."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', 5,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Alcoholic",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "payment",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(767713630528, --[[StoryBit Dust_Melancholy Text]] "Invest in improving communications with Earth."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(513873753351, --[[StoryBit Dust_Melancholy CustomOutcomeText]] "increases comfort of residences permanently"),
		'Cost', "<payment>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(176486767557, --[[voice:narrator]] "You casually slump down in your favorite armchair and turn on the monitor to watch the latest episode of the trendiest TV show back on Earth."),
		'Text', T(880444940056, --[[StoryBit Dust_Melancholy Text]] "A delay of between 4 to 24 minutes for information traveling between Earth and Mars rules real-time communication right out. However, our new communication satellites guarantee that every colonist has free access to information from Earth at their leisure.\n\n<effect>Service Comfort of residences increased permanently."),
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Apartments",
				'Prop', "service_comfort",
				'Amount', "<comfort_increase>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "LivingQuarters",
				'Prop', "service_comfort",
				'Amount', "<comfort_increase>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "SmartHome",
				'Prop', "service_comfort",
				'Amount', "<comfort_increase>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Arcology",
				'Prop', "service_comfort",
				'Amount', "<comfort_increase>",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_increase",
		'Value', 10,
	}),
})

