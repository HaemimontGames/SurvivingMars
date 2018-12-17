-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
				}),
			},
			'RandomCount', "<injured_people>",
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Health",
					'Amount', "<health_damage_real>",
				}),
			},
		}),
	},
	Enabled = true,
	Image = "UI/Messages/Events/26_colonist.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(248574161401, --[[StoryBit ViolentDelights Text]] "Running naked with a wrench in hand, <DisplayName> has already managed to injure several people!\n\n<effect><injured_people> Colonists have suffered -<health_damage> Health."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(902697536931, --[[StoryBit ViolentDelights Title]] "Sanity Breakdown - Violent Delights"),
	Trigger = "SanityBreakdown",
	VoicedText = T(239132863586, --[[voice:narrator]] "A Colonist has snapped and has started attacking others around the Dome!"),
	group = "Sanity Breakdown",
	id = "ViolentDelights",
	PlaceObj('StoryBitParamNumber', {
		'Name', "injured_people",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "health_damage",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "health_damage_real",
		'Value', -10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(219605119707, --[[StoryBit ViolentDelights Text]] "Send colonists to take the maniac down!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "injured_rescuers",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rescue_damage",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rescue_damage_real",
		'Value', -20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'VoicedText', T(473717719384, --[[voice:narrator]] "The rescue team was violently attacked by the maniac. After suffering heavy injuries, they managed to pin down the screaming Colonist."),
		'Text', T(905314342251, --[[StoryBit ViolentDelights Text]] "<effect><injured_rescuers> Colonists lost <rescue_damage> Health. The Colonist <DisplayName> is safe."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<injured_rescuers>",
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Health",
						'Amount', "<rescue_damage_real>",
					}),
				},
			}),
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'VoicedText', T(591779137721, --[[voice:narrator]] "The maniac ambushed and violently attacked the rescue team. The furious brawl led to the use of too much force, and regrettably, the crazed Colonist was fatally injured."),
		'Text', T(890881331652, --[[StoryBit ViolentDelights Text]] "<effect><DisplayName> has died. <injured_rescuers> Colonists lost <rescue_damage> Health."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<injured_rescuers>",
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Health",
						'Amount', "<rescue_damage_real>",
					}),
				},
			}),
			PlaceObj('KillColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(259273233119, --[[StoryBit ViolentDelights Text]] "Send Drones to take the maniac down!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "drone_rescuers",
		'Value', 3,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "recovery_time",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(937380619933, --[[voice:narrator]] "The Drones apprehended the maniac, but not without taking damage. Thank the Cosmos that you didn’t send humans!"),
		'Text', T(402859313643, --[[StoryBit ViolentDelights Text]] "The crazed maniac screamed and jumped on top of the first drone, smashing its sensor node with a mighty blow of the wrench. The next drones were met with a furious flurry of blows but eventually the brave little machines managed to pin the maniac to the ground, although with a bit too much force applied by their powerful, yet crude manipulators.\n\n<effect><drone_rescuers> Drones have been destroyed. Colonist <DisplayName> is unable to work for <sols(recovery_time)> Sols."),
		'Enables', {
			"ViolentDelights_FollowRecovery",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Drone",
				'Filters', {},
				'RandomCount', "<drone_rescuers>",
				'Effects', {
					PlaceObj('DestroyVehicle', nil),
				},
			}),
			PlaceObj('ModifyStatus', {
				'Status', "StatusEffect_UnableToWork",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(994045860991, --[[StoryBit ViolentDelights Text]] "Send security Officers to apprehend the maniac!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(213023520034, --[[StoryBit ViolentDelights CustomOutcomeText]] "No negative outcome"),
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 15,
			'Trait', "security",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
})

