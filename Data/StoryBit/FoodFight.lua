-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{340078552814, --[[StoryBit FoodFight Text]] 'Would you like a diet soda with your triple burger? For free! Your only obligation is to make the colonists eat (and supposedly enjoy) the branded meals.\n\n<if(is_commander("oligarch"))>[<commander_profile>] Reading the fine print, the proposed contract excludes any demands for the quality of the served food.</if>'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{852599856217, --[[StoryBit FoodFight Title]] "Food Fight"},
	VoicedText = T{899341899630, --[[voice:narrator]] "Two of the largest fast food chains have filed simultaneous requests to serve the colonists."},
	group = "Colonists",
	id = "FoodFight",
	PlaceObj('StoryBitParamNumber', {
		'Name', "foodservice_bonus_reject",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "foodservice_penalty_accept",
		'Value', -30,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "food_cost_reduction",
		'Value', -100,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "foodservice_construction_reduction",
		'Value', -100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{772551534327, --[[StoryBit FoodFight Text]] "Mars food will always be Bio and Organic!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{245340088679, --[[StoryBit FoodFight CustomOutcomeText]] "Food service buildings grant more Comfort"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_bonus_reject>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_bonus_reject>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_bonus_reject>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{482974937853, --[[StoryBit FoodFight Text]] "Give the permission to WcRonalds."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{173770897397, --[[StoryBit FoodFight CustomOutcomeText]] "Food import cost greatly reduced"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"FoodFight_FollowUp",
		},
		'Effects', {
			PlaceObj('ModifyCargoPrice', {
				'Cargo', "Food",
				'Percent', "<food_cost_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
				'Sols', 720000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{147867267465, --[[StoryBit FoodFight Text]] "Give the permission to Burglar King."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{341773789732, --[[StoryBit FoodFight CustomOutcomeText]] "free construction of Food service buildings"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"FoodFight_FollowUp",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Diner_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
				'Sols', 720000,
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<foodservice_construction_reduction>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{909197729552, --[[StoryBit FoodFight Text]] "Let them compete, take bids from both!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{166465090294, --[[StoryBit FoodFight CustomOutcomeText]] "get both benefits"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"FoodFight_FollowUp",
		},
		'Effects', {
			PlaceObj('ModifyCargoPrice', {
				'Cargo', "Food",
				'Percent', "<food_cost_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<foodservice_construction_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Diner",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small",
				'Prop', "service_comfort",
				'Amount', "<foodservice_penalty_accept>",
				'Sols', 720000,
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ShopsFood_Small_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<food_cost_reduction>",
			}),
		},
	}),
})

