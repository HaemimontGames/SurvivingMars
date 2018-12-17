-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "TechResearched",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/hints.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Physics",
			'TechId', "TriboelectricScrubbing",
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "scientist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(466520787161, --[[StoryBit Prototype_Scrubber Text]] "Our recent discovery of the “Triboelectric Scrubbing” technology has inspired our research team and they want to try to build a prototype Triboelectric Scrubber.\n\nThere are some concerns that our other scientific endeavors will suffer due to the distraction and a positive result is not guaranteed."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(600841984435, --[[StoryBit Prototype_Scrubber Title]] "Prototype Scrubber"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(185973322594, --[[voice:narrator]] "Excited and nervous, the group of Scientists in your office can do little to hide their excitement. They want to build a prototype of a new kind of structure. "),
	group = "Buildings",
	id = "Prototype_Scrubber",
	PlaceObj('StoryBitParamPercent', {
		'Name', "rp_reduction",
		'Value', -30,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(266006302443, --[[StoryBit Prototype_Scrubber Text]] "Let them try!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(348642220286, --[[StoryBit Prototype_Scrubber CustomOutcomeText]] "<rp_reduction>% generated research for <sols(duration)> Sols, chance to get a Triboelectric Scrubber prefab"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 60,
		'Enables', {
			"Prototype_Scrubber_Success",
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
			"Prototype_Scrubber_Fail",
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
		'Text', T(639837110485, --[[StoryBit Prototype_Scrubber Text]] "Join the project yourself."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(908308697219, --[[StoryBit Prototype_Scrubber CustomOutcomeText]] "<rp_reduction>% research generated for <sols(duration)> Sols,guaranteed Triboelectric Scrubber prefab"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Prototype_Scrubber_Success",
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
		'Text', T(507546853163, --[[StoryBit Prototype_Scrubber Text]] "Deny the request."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(231559946603, --[[StoryBit Prototype_Scrubber CustomOutcomeText]] "<morale_penalty> Morale of all Scientists for <sols(morale_penalty_duration)> Sols"),
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

