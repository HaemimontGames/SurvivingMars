-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
			'RandomCount', "<colonists_lost>",
			'Effects', {
				PlaceObj('KillColonist', nil),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
			'RandomCount', "<colonists_injured>",
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Health",
					'Amount', -50,
					'Reason', T{11383, --[[StoryBit RedMars_3 Reason]] "Terrorist Attack"},
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "InsideBuildings",
			'Filters', {},
			'RandomCount', "<buildings_lost>",
			'Effects', {
				PlaceObj('DestroyBuilding', nil),
			},
		}),
	},
	Image = "UI/Messages/Events/22_collapsing_building.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{902333701631, --[[StoryBit RedMars_3 Text]] "The ground is shaking and the people look in terror and uncertainty towards the horizon as the black columns of smoke quickly rise towards the bleak skies. You don’t need to look there to know what’s going on – the damage and casualty report says everything.\n\nYou can't shake the feeling that this is somehow related to the recent activities of your expedition team.\n\n<effect>The punitive sabotage strike had destroyed <buildings_lost> buildings. <colonists_lost> colonists have died and <colonists_injured> have been injured."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{211680797027, --[[StoryBit RedMars_3 Title]] "Mars in Flames"},
	VoicedText = T{818818581469, --[[voice:narrator]] "Alarms follow the series of explosions throughout the colony."},
	group = "Expeditions",
	id = "RedMars_3",
	PlaceObj('StoryBitParamNumber', {
		'Name', "buildings_lost",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "colonists_lost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "colonists_injured",
		'Value', 35,
	}),
})

