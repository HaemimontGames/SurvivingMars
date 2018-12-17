-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(390823695693, --[[StoryBit FoodFight_FollowUp Text]] "No need to read the complaints. You’re looking at the cause right now. There’s a pile of Triple XL Mega-Veggie Burgers on your kitchen table. Untouched. From over a week. And they haven’t rotten. They also neither taste nor smell. You crave the days when you imbibed your tasteless half-liquid protein paste and were naive and happy.\n\nBut the contract is solid. What could be done, you wonder?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(999090658667, --[[StoryBit FoodFight_FollowUp Title]] "Food Fight: Stomach Struggle"),
	VoicedText = T(159415749951, --[[voice:narrator]] "The colonists are extremely unhappy with the quality of food. You have received tons of complaints. Who would have thought that inviting a fast food super-giant would cause super-trouble?"),
	group = "Colonists",
	id = "FoodFight_FollowUp",
	PlaceObj('StoryBitParamNumber', {
		'Name', "foodservice_penalty_removed",
		'Value', 30,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "funding_cost_contract",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "strike_health_loss",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "strike_sanity_loss",
		'Value', -20,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(579693425219, --[[StoryBit FoodFight_FollowUp Text]] "Abandon all hope..."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(438014333607, --[[StoryBit FoodFight_FollowUp CustomOutcomeText]] "several Colonists leave the Colony"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', 5,
				'Effects', {
					PlaceObj('EraseColonist', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(461615843127, --[[StoryBit FoodFight_FollowUp Text]] "Pull some strings to set things right."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(990872705960, --[[StoryBit FoodFight_FollowUp CustomOutcomeText]] "restore Food service quality"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(768436050269, --[[StoryBit FoodFight_FollowUp Text]] "Sign a new contract with better terms."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(281567854400, --[[StoryBit FoodFight_FollowUp CustomOutcomeText]] "restore Food service quality"),
		'Cost', "<funding_cost_contract>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(600126529179, --[[StoryBit FoodFight_FollowUp Text]] "Gather activist support with an online campaign."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(824623181769, --[[StoryBit FoodFight_FollowUp CustomOutcomeText]] "restore Food service quality"),
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 5,
			'Trait', "Celebrity",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(382158245694, --[[StoryBit FoodFight_FollowUp Text]] "Vegan hunger strike!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(437858815261, --[[StoryBit FoodFight_FollowUp CustomOutcomeText]] "Vegans lose Sanity and Health, restore Food service quality"),
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 10,
			'Trait', "Vegan",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_removed>",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Vegan",
					}),
				},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Health",
						'Amount', "<strike_health_loss>",
					}),
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<strike_sanity_loss>",
					}),
				},
			}),
		},
	}),
})

