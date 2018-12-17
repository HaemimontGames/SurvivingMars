-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Comment = "needed trade rocket",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/exploration_2.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Tourist",
				}),
			},
			'Condition', ">=",
			'Amount', 1,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(127208162009, --[[StoryBit ExportWasteRock_SplintersOfMars Text]] "There are several other such items on various online auctions. And there are more than 100, 000 results for people who want to buy Martian rocks."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(232584381635, --[[StoryBit ExportWasteRock_SplintersOfMars Title]] "Splinters of Mars"),
	VoicedText = T(177748562482, --[[voice:narrator]] '"Pristine Martian Rock, verified taken during a vacation on Mars, price $1 million." Amusing and surprisingly – already sold!'),
	group = "Earth",
	id = "ExportWasteRock_SplintersOfMars",
	PlaceObj('StoryBitReply', {
		'Text', T(791857930585, --[[StoryBit ExportWasteRock_SplintersOfMars Text]] "Mars belongs to all humans! Free rocks for everyone!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(795050760492, --[[StoryBit ExportWasteRock_SplintersOfMars CustomOutcomeText]] "export Waste Rock for free, some Colonists become Enthusiasts"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
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
				'RandomPercent', 0,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Enthusiast",
					}),
				},
			}),
			PlaceObj('CallTradeRocket', {
				'rocket_id', "WasteRockRocketFree",
				'display_name', T(11428, --[[StoryBit ExportWasteRock_SplintersOfMars display_name]] "Souvenir Export Rocket"),
				'description', T(11372, --[[StoryBit ExportWasteRock_SplintersOfMars description]] "Exports Waste Rock for free as souvenirs for people on Earth."),
				'travel_time_mars', 300000,
				'travel_time_earth', 300000,
				'fuel_amount', 60000,
				'resource1', "WasteRock",
				'amount1', 200000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(847891050347, --[[StoryBit ExportWasteRock_SplintersOfMars Text]] "Mars is not a commodity!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(772267951330, --[[StoryBit ExportWasteRock_SplintersOfMars CustomOutcomeText]] "don’t export Waste Rock"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(850409744489, --[[StoryBit ExportWasteRock_SplintersOfMars Text]] "We should totally export Martian rocks!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(320920234424, --[[StoryBit ExportWasteRock_SplintersOfMars CustomOutcomeText]] "export Waste Rock for Funding"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('CallTradeRocket', {
				'rocket_id', "WasteRockRocketNormal",
				'display_name', T(11371, --[[StoryBit ExportWasteRock_SplintersOfMars display_name]] "Souvenir Export Rocket"),
				'description', T(11374, --[[StoryBit ExportWasteRock_SplintersOfMars description]] "Exports Waste Rock to sell as souvenirs to Earthlings."),
				'travel_time_mars', 300000,
				'travel_time_earth', 300000,
				'fuel_amount', 60000,
				'resource1', "WasteRock",
				'amount1', 200000,
				'funding_on_mars_launch', 250000000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(765544688260, --[[StoryBit ExportWasteRock_SplintersOfMars Text]] "Why ordinary rocks? Colonists can sign them and we can sell them as souvenirs!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(756401911666, --[[StoryBit ExportWasteRock_SplintersOfMars CustomOutcomeText]] "export Waste Rock for more Funding"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('CallTradeRocket', {
				'rocket_id', "WasteRockRocketExpensive",
				'display_name', T(11371, --[[StoryBit ExportWasteRock_SplintersOfMars display_name]] "Souvenir Export Rocket"),
				'description', T(11376, --[[StoryBit ExportWasteRock_SplintersOfMars description]] "Exports Waste Rock to sell as expensive souvenirs to Earthlings."),
				'travel_time_mars', 300000,
				'travel_time_earth', 300000,
				'fuel_amount', 60000,
				'resource1', "WasteRock",
				'amount1', 200000,
				'funding_on_mars_launch', 750000000,
			}),
		},
	}),
})

