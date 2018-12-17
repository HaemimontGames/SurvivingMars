-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "TechResearched",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/hints.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Engineering",
			'TechId', "LowGEngineering",
		}),
		PlaceObj('IsSponsor', {
			'SponsorName', "ISRO",
			'Negate', true,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "scientist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(634794330490, --[[StoryBit Prototype_MediumDome Text]] "Our recent discovery of the “Low-G Engineering” technology has inspired our research team and they want to prototype a Medium Dome.\n\nThere are some concerns that our other scientific endeavors will suffer due to the distraction and a positive result is not guaranteed."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(120968497094, --[[StoryBit Prototype_MediumDome Title]] "Prototype Medium Dome"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(485228194456, --[[voice:narrator]] "Excited and nervous, the group of Scientists in your office can do little to hide their excitement. They want to build a prototype of a new kind of structure. "),
	group = "Buildings",
	id = "Prototype_MediumDome",
	PlaceObj('StoryBitParamPercent', {
		'Name', "rp_reduction",
		'Value', -30,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(353047012109, --[[StoryBit Prototype_MediumDome Text]] "Let them try!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(922275607541, --[[StoryBit Prototype_MediumDome CustomOutcomeText]] "<rp_reduction>% generated research for <sols(duration)> Sols, chance to get a Medium Dome prefab"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 60,
		'Enables', {
			"Prototype_MediumDome_Success",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "ResearchLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ScienceInstitute",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "LowGLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 40,
		'Enables', {
			"Prototype_MediumDome_Fail",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "ResearchLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ScienceInstitute",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "LowGLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(671538603784, --[[StoryBit Prototype_MediumDome Text]] "Join the project yourself."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(823084887974, --[[StoryBit Prototype_MediumDome CustomOutcomeText]] "<rp_reduction>% research generated for <sols(duration)> Sols, guaranteed Medium Dome prefab"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Prototype_MediumDome_Success",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "ResearchLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "ScienceInstitute",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "LowGLab",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_reduction>",
				'Sols', "<duration>",
				'ModifyId', "Prototype",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -5,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(887088589221, --[[StoryBit Prototype_MediumDome Text]] "Deny the request."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(201426212996, --[[StoryBit Prototype_MediumDome CustomOutcomeText]] "<morale_penalty> Morale of all Scientists for <sols(morale_penalty_duration)> Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "scientist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_penalty_duration>",
						'ModifyId', "Prototype",
					}),
				},
			}),
		},
	}),
})

