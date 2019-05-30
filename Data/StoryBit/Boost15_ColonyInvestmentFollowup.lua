-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ModifyConst', {
			'Const', "ExportPricePreciousMetals",
			'Percent', "<price_increase>",
			'ModifyId', "Colony_Investment",
		}),
	},
	Prerequisites = {
		PlaceObj('CheckResource', {
			'Resource', "PreciousMetals",
			'Amount', 5,
		}),
	},
	ScriptDone = true,
	SuppressTime = 14400000,
	Text = T(342809123576, --[[StoryBit Boost15_ColonyInvestmentFollowup Text]] "Hard to believe that the bailout managed to steer things around so successfully. And judging by the message we received from the board, they may even be more surprised than we are.\n\nOur sponsor clearly expresses happiness with how well their investment is paying off, clearly referencing our Rare Metals exports, and will now offer us a better export price as a show of trust.\n\n<effect>Export price of Rare Metals increased by <price_increase>%"),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(733265179228, --[[voice:narrator]] "You run through the numbers again, then maybe one last time. Yes, things are finally looking up!"),
	group = "Pre-Founder Stage",
	id = "Boost15_ColonyInvestmentFollowup",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491862,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493047,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "price_increase",
		'Value', 15,
	}),
})

