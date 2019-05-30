-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Comment = "Test StoryBit",
	Effects = {
		PlaceObj('CreatePlanetaryAnomaly', {
			'id', "LostChild",
			'display_name', T(275086037949, --[[StoryBit ForeignerInAForeignLand display_name]] "Lost Child"),
			'description', T(408305849373, --[[StoryBit ForeignerInAForeignLand description]] "Our satellites have caught an unbelievable sight at this place: a human boy playing on the cold dead surface of Mars."),
			'required_crew', 5,
			'required_crew_specialization', "medic",
			'required_resources', {},
			'associate', true,
			'reward', "custom",
			'outcome_text', T(879555705765, --[[StoryBit ForeignerInAForeignLand outcome_text]] "Unknown"),
		}),
	},
	Enabled = true,
	Enables = {
		"ForeignerInAForeignLand_FollowUp1",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', "<colonists_required>",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
		PlaceObj('AreDomesOpen', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T(811723288081, --[[StoryBit ForeignerInAForeignLand Text]] "On some of them a naked boy can be seen, carelessly jumping around and playing on the very surface of Mars. There is no oxygen mask in view, nor any protection from the impossible Martian cold.\n\nPhysicists are baffled and wildly speculate about optical illusions, atmospheric anomalies and all kind of quantum physics mumbo-jumbo. The truth is, we can never know what this is until we send an expedition.\n\n<effect>A Planetary Anomaly has appeared on the map."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(519050277746, --[[StoryBit ForeignerInAForeignLand Title]] "Foreigner in a Foreign Land"),
	VoicedText = T(330497811494, --[[voice:narrator]] "One of our Sponsor's satellites have made some unbelievable photos on the surface of Mars."),
	group = "Expeditions",
	id = "ForeignerInAForeignLand",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550845385,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1553174774,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "colonists_required",
		'Value', 100,
	}),
})

