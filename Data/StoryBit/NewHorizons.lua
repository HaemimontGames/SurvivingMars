-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "GeneSelection",
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "BioroboticsWorkshop",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(560013891955, --[[StoryBit NewHorizons Text]] "They claim that their attempts to create new genetically-imprinted talents were all for the better of humankind. The case is controversial, as you could have guessed."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(545703974224, --[[StoryBit NewHorizons Title]] "New Horizons"),
	VoicedText = T(367617246158, --[[voice:narrator]] "We have caught a group of Biorobotics Workshop enthusiasts who experimented on themselves without permission!"),
	group = "Breakthroughs",
	id = "NewHorizons",
	PlaceObj('StoryBitReply', {
		'Text', T(514891317386, --[[StoryBit NewHorizons Text]] "Let’s see how they fare."),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "suffering_colonists",
		'Value', 5,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'VoicedText', T(320092408501, --[[voice:narrator]] "One of the biotech enthusiasts who recently experimented with their genes has acquired a new Trait, but at a cost."),
		'Text', T(672204086906, --[[StoryBit NewHorizons Text]] "<DisplayName> has uncovered a new Trait hidden in the human genome, but the other enthusiasts had suffered severe genetic malformations and their health is quickly deteriorating.\n\n<effect>The Colonist <DisplayName> has become Guru Workaholic. <suffering_colonists> Colonists have gained the Chronic Condition Flaw."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<suffering_colonists>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "ChronicCondition",
					}),
				},
			}),
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Workaholic",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 40,
		'VoicedText', T(406993306152, --[[voice:narrator]] "One of the biotech enthusiasts who recently experimented with their genes has acquired a new Trait, but at a cost."),
		'Text', T(530045683317, --[[StoryBit NewHorizons Text]] "<DisplayName> has uncovered a new Trait hidden in the human genome, but the other enthusiasts had suffered severe genetic malformations and their health is quickly deteriorating.\n\n<effect>The Colonist <DisplayName> has become Guru Enthusiast. <suffering_colonists> Colonists have gained the Chronic Condition Flaw."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<suffering_colonists>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "ChronicCondition",
					}),
				},
			}),
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Enthusiast",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(722727333735, --[[voice:narrator]] "The biotech enthusiasts who wanted to perform genetic experiments on themselves suffered genetic malformations."),
		'Text', T(637847086562, --[[StoryBit NewHorizons Text]] "Their health is quickly deteriorating and we fear the worst scenario.\n\n<effect><suffering_colonists> Colonists have gained the Chronic Condition Flaw."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<suffering_colonists>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "ChronicCondition",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(732562216139, --[[StoryBit NewHorizons Text]] "Immediately stop these experiments! "),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(179481799786, --[[StoryBit NewHorizons Text]] "We will research their idea further!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(261696901616, --[[StoryBit NewHorizons CustomOutcomeText]] 'gain new tech "Gene Forging"'),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "GeneForging",
				'Cost', 10000,
			}),
		},
	}),
})

