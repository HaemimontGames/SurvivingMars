-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CauseFault', {
			'Grid', "electricity",
		}),
	},
	Category = "Tick_BeforeFounders",
	Effects = {
		PlaceObj('DiscoverTech', {
			'Field', "Storybits",
			'Tech', "StirlingGeneratorFault",
			'Cost', 1000,
		}),
	},
	EnableChance = 40,
	Enabled = true,
	Enables = {
		"Boost19_BadStirlingGenerator_FaultGenerator",
		"Boost19_BadStirlingGenerator_Finale",
	},
	Image = "UI/Messages/hints.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "StirlingGenerator",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">=",
			'Amount', 1,
		}),
		PlaceObj('CanCauseFault', {
			'Grid', "electricity",
		}),
	},
	ScriptDone = true,
	Text = T(342271943630, --[[StoryBit Boost19_BadStirlingGenerator Text]] "The rapid increase of cable faults ever since we turned on our first Stirling Generator connected to the grid, hints at some gross miscalculation stewing from the fringiness of it all.\n\nOur scientists have laid down the research needed to be done to fill in the potholes in the original Stirling Generator designs.\n\nResearch the Stirling Generator Cable Faults tech to fix the issue. Until then, keep in mind that cable faults won't appear when Stirling Generators are turned off."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(269738125235, --[[StoryBit Boost19_BadStirlingGenerator Title]] "Stirling Generator Fault"),
	VoicedText = T(117255713428, --[[voice:narrator]] "Testing fringe technology in a fringe environment is always unpredictable."),
	group = "Pre-Founder Stage",
	id = "Boost19_BadStirlingGenerator",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549880032,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549972891,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494012,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1550752078,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1551965546,
				user = "Radomir",
			},
		},
	}),
})

