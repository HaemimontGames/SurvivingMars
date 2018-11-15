-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RemoveAllTraits', nil),
	},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('AddTrait', {
			'Trait', "Sexy",
		}),
		PlaceObj('AddTrait', {
			'Trait', "Fit",
		}),
		PlaceObj('AddTrait', {
			'Trait', "Composed",
		}),
	},
	Enabled = true,
	Enables = {
		"BloodMusic_1",
		"BloodMusic_Repeatable",
	},
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "ConstructionNanites",
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Biotech",
			'TechId', "StemReconstruction",
		}),
	},
	ScriptDone = true,
	Text = T{107559612687, --[[StoryBit BloodMusic_0 Text]] "<effect><DisplayName> has lost all traits and has gained the Perks Composed, Fit and Sexy."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{589492135895, --[[StoryBit BloodMusic_0 Title]] "Blood Music: Prophase"},
	VoicedText = T{160830422430, --[[voice:narrator]] "A Colonist has somehow been completely changed overnight! Not just their personality, but also their looks and overall health!"},
	group = "Breakthroughs",
	id = "BloodMusic_0",
	PlaceObj('StoryBitReply', {
		'Text', T{448305278287, --[[StoryBit BloodMusic_0 Text]] "Get the research team working on this! "},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{786523522969, --[[voice:narrator]] "Acting quickly, you order the research team to examine the still confused Colonist."},
		'Text', T{760265943078, --[[StoryBit BloodMusic_0 Text]] "<effect>Research the new tech “Anomalous Genome Resequencing” to discover the truth behind the rapid change of <DisplayName>."},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "AnomalousGenomeResequencing",
				'Cost', 10000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{726686457983, --[[StoryBit BloodMusic_0 Text]] "I will research the case myself."},
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "ecologist",
			'CommanderProfile2', "doctor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{442518953786, --[[voice:narrator]] "Acting quickly, you perform some unconventional tests on the still-confused Colonist."},
		'Text', T{554617562285, --[[StoryBit BloodMusic_0 Text]] "<effect>Research the new tech “Anomalous Genome Resequencing” to discover the truth behind the rapid change of <DisplayName>. The new tech has gained 50% progress."},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "AnomalousGenomeResequencing",
				'Cost', 10000,
			}),
		},
	}),
})

