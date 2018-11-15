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
			'TechId', "NuclearFusion",
		}),
	},
	ScriptDone = true,
	Text = T{136777362303, --[[StoryBit Prototype_Reactor Text]] "Our recent discovery of the “Nuclear Fusion” technology has inspired our research team and they want to try to build a prototype Fusion Reactor.\n\nThere are some concerns that our other scientific endeavors will suffer due to the distraction and a positive result is not guaranteed."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{11211, --[[StoryBit Prototype_Reactor Title]] "Prototype Reactor"},
	Trigger = "TechResearchedTrigger",
	VoicedText = T{778981811351, --[[voice:narrator]] "Excited and nervous, the group of Scientists in your office can do little to hide their excitement. They want to build a prototype of a new kind of structure. "},
	group = "Buildings",
	id = "Prototype_Reactor",
	PlaceObj('StoryBitParamPercent', {
		'Name', "rp_reduction",
		'Value', -30,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{468804046477, --[[StoryBit Prototype_Reactor Text]] "Let them try!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{611228633076, --[[StoryBit Prototype_Reactor CustomOutcomeText]] "<rp_reduction>% generated research for <sols(duration)> Sols, chance to get a Fusion Reactor prefab"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 60,
		'Enables', {
			"Prototype_Reactor_Success",
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
			"Prototype_Reactor_Fail",
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
		'Text', T{731962048964, --[[StoryBit Prototype_Reactor Text]] "Join the project yourself."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{471714613344, --[[StoryBit Prototype_Reactor CustomOutcomeText]] "<rp_reduction>% research generated for <sols(duration)> Sols,guaranteed Fusion Reactor prefab"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Prototype_Reactor_Success",
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
		'Text', T{435446179228, --[[StoryBit Prototype_Reactor Text]] "Deny the request."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{661103582135, --[[StoryBit Prototype_Reactor CustomOutcomeText]] "<morale_penalty> Morale of all Scientists for <sols(morale_penalty_duration)> Sols"},
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

