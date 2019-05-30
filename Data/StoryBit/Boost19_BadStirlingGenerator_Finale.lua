-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"Boost19_BadStirlingGenerator_FaultGenerator",
	},
	Effects = {
		PlaceObj('ModifyLabel', {
			'Label', "StirlingGenerator",
			'Prop', "electricity_production",
			'Percent', "<power_boost>",
			'ModifyId', "BadStirlingGenerator",
		}),
	},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "StirlingGeneratorFault",
		}),
	},
	ScriptDone = true,
	Text = T(919504866537, --[[StoryBit Boost19_BadStirlingGenerator_Finale Text]] "After doing extended research on the subject, we not only removed said problems but we actually increased the power efficiency of our Stirling Generators.\n\n<effect>Stirling Generators produce <power_boost>% more power."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T(956664316858, --[[voice:narrator]] "Ultimately the issues caused by the Stirling Generator turned out to be connectivity problems."),
	group = "Pre-Founder Stage",
	id = "Boost19_BadStirlingGenerator_Finale",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549973041,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494090,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "power_boost",
		'Value', 25,
	}),
})

