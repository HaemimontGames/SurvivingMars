-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('AddTrait', {
			'Trait', "Genius",
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/15_artist.tga",
	Prerequisites = {
		PlaceObj('PickWorker', {
			'ParentBuildingLabel', "ArtWorkshop",
			'WorkerConditions', {},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{583874410580, --[[StoryBit Masterpiece Text]] "The piece impressed their peers so much that they talked the shy creator <DisplayName> into sharing more of their works. What they saw left little doubt in our minds that we have a prodigy on our hands.\n\nAlready making waves on the Earth art scene, offers for the originals are reaching mind-boggling sums.\n\nEffect: <DisplayName> has become a Genius"},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{707548984483, --[[StoryBit Masterpiece Title]] "Cydonia da Vinci"},
	VoicedText = T{350183389237, --[[voice:narrator]] "A rather quiet employee at our Art Workshop blew everyone’s mind when they shared an original work."},
	group = "Buildings",
	id = "Masterpiece",
	PlaceObj('StoryBitReply', {
		'Text', T{315370222735, --[[StoryBit Masterpiece Text]] "Share their work with the world. Let it be seen in galleries on Earth as well!"},
		'OutcomeText', "custom",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', 20,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', 10,
						'Sols', 7200000,
						'ModifyId', "Masterpiece",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{907704905816, --[[StoryBit Masterpiece Text]] "Sell the originals for the benefit of the colony."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{902679316362, --[[StoryBit Masterpiece CustomOutcomeText]] "get Funding for <sols(duration)> Sols"},
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 36000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Masterpiece_KillIn50Sols",
			"Masterpiece_PeriodicFunding",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{563534334966, --[[StoryBit Masterpiece Text]] "Encourage <DisplayName> to experiment in other areas. Imagine the possibilities!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Masterpiece_Research",
		},
		'Effects', {},
	}),
})

