-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PickCargo', {
			'CargoList', {
				"Food",
				"Electronics",
				"Polymers",
				"MachineParts",
			},
		}),
	},
	Category = "Tick",
	Effects = {},
	EnableChance = 25,
	Enabled = true,
	Enables = {},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Min', 10,
			'Max', 50,
		}),
	},
	ScriptDone = true,
	Text = T{253325154971, --[[StoryBit IncreaseResourceCost Text]] "It turns out that even Mars is not beyond the reach of stock market hiccups on our mother planet.\n\n<effect>The import price of <name> will be increased by <price_increase>% in <sols(delay)> Sols."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{612282293862, --[[StoryBit IncreaseResourceCost Title]] "Fickle Economics"},
	VoicedText = T{400822589178, --[[voice:narrator]] "Our sponsor informs us that due to changes in the economic conditions the import price of a key resource will soon be increased."},
	group = "Earth",
	id = "IncreaseResourceCost",
	PlaceObj('StoryBitParamPercent', {
		'Name', "price_increase",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "price_increase_oligarch",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay_politician",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{416767465149, --[[StoryBit IncreaseResourceCost Text]] "Yet Earth may be within our reach as well..."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{348294285589, --[[StoryBit IncreaseResourceCost CustomOutcomeText]] "the price will be increased only by <price_increase_oligarch>%"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"IncreaseResourceCost_Oligarch",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{830906483560, --[[StoryBit IncreaseResourceCost Text]] "I will personally negotiate special terms."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{198747065499, --[[StoryBit IncreaseResourceCost CustomOutcomeText]] "the price increase will happen in <sols(delay_politician)> Sols instead"},
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "politician",
			'CommanderProfile2', "citymayor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"IncreaseResourceCost_Politician",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{409955889619, --[[StoryBit IncreaseResourceCost Text]] "Understood."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"IncreaseResourceCost_Other",
		},
		'Effects', {},
	}),
})

