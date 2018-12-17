-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/13_renegades.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 20,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "security",
			'Filters', {},
			'Condition', ">=",
			'Amount', "<casulaties_low>",
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Dome",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(624001901036, --[[StoryBit TurfWars Text]] "We have info that a major move is planned by one of the bigger gangs against their rivals.\n\nLately, a lot of homemade weapons have started circulating the Domes and we fear this will be a bloody showdown. "),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(834958617956, --[[StoryBit TurfWars Title]] "Renegades: Turf Wars"),
	VoicedText = T(284586289332, --[[voice:narrator]] "Our Renegade situation has gotten out of control as of late, with many Renegade colonists joining gangs spread around the Domes, competing for territories."),
	group = "Renegades",
	id = "TurfWars",
	PlaceObj('StoryBitParamNumber', {
		'Name', "casulties_big",
		'Value', 9,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "casulaties_low",
		'Value', 3,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "pay_off",
		'Value', 100000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(112072922378, --[[StoryBit TurfWars Text]] "Let them fight it out. We won't risk the lives of our Officers for this."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(527209052576, --[[voice:narrator]] "The renegades clashed both inside and outside the domes - using melee and ranged weapons of various quality."),
		'Text', T(661039165389, --[[StoryBit TurfWars Text]] "<casulties_big> were dead before the fighting stopped. This will be remembered as a very grim day in our history."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
					}),
				},
				'RandomCount', "<casulties_big>",
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(613046404431, --[[StoryBit TurfWars Text]] "Send in the Officers. We don't need open gang warfare in our fragile habitats."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(625782479070, --[[voice:narrator]] "Our officers tried to stop the clash between the renegade gangs but ended up caught in between."),
		'Text', T(762142562008, --[[StoryBit TurfWars Text]] "After it quickly became apparent that the gang bangers were under equipped and out-classed by the well trained officers, they quickly fled. \n\nSadly, several officers were killed in the incident, as were several renegades."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
					}),
				},
				'RandomCount', "<casulaties_low>",
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "security",
				'Filters', {},
				'RandomCount', "<casulaties_low>",
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(565162592300, --[[StoryBit TurfWars Text]] "Pay off the leaders of the gangs to abandon these plans."),
		'OutcomeText', "custom",
		'Cost', "<pay_off>",
	}),
})

