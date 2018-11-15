-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/06_space_suit.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Max', 100,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Genius",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{11046, --[[StoryBit OverworkedGenius Text]] "The brilliant <name> admits feeling depressed and burned out lately. They are requesting some time off work, to meditate and seek inspiration in the red wastes outside the Dome."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{329295678391, --[[StoryBit OverworkedGenius Title]] "A Message from a Colonist"},
	VoicedText = T{384407716400, --[[voice:narrator]] "One of our Genius Colonists has come up with an unusual request."},
	group = "Colonists",
	id = "OverworkedGenius",
	PlaceObj('StoryBitParamSols', {
		'Name', "sols",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{584846315916, --[[StoryBit OverworkedGenius Text]] "A Genius is entitled to some eccentricity. Permission granted!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{291045242755, --[[StoryBit OverworkedGenius CustomOutcomeText]] "<DisplayName> will not work for <sols(sols)> Sols"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"OverworkedGenius_RemoveUnableToWork",
		},
		'Effects', {
			PlaceObj('ModifyStatus', {
				'Status', "StatusEffect_UnableToWork",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "health",
		'Value', -10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{284222014860, --[[StoryBit OverworkedGenius Text]] "They signed for this job. Permission denied!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{906508514767, --[[StoryBit OverworkedGenius CustomOutcomeText]] "<DisplayName> will lose Sanity and Morale"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', "<sanity>",
			}),
			PlaceObj('ModifyColonistStat', {
				'Stat', "Health",
				'Amount', "<health>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{285896527041, --[[StoryBit OverworkedGenius Text]] "A Genius is one of our most valuable assets. They have my special dispensation to never work again."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{761487143335, --[[StoryBit OverworkedGenius CustomOutcomeText]] "<DisplayName> will drop off the workforce"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Enables', {},
		'Effects', {
			PlaceObj('ModifyStatus', {
				'Status', "StatusEffect_UnableToWork",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Enables', {
			"OverworkedGenius_GrantTech",
		},
		'Effects', {
			PlaceObj('ModifyStatus', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{585963511109, --[[StoryBit OverworkedGenius Text]] "<DisplayName>, I want tell me about your problems..."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{666641421081, --[[StoryBit OverworkedGenius CustomOutcomeText]] "no consequences"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
})

