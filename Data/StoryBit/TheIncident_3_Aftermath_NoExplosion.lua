-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "FusionReactor",
			'Filters', {},
			'Effects', {
				PlaceObj('SetBuildingEnabledState', nil),
			},
		}),
	},
	Effects = {},
	Enables = {
		"TheIncident_4_TechResearched",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	InheritsObject = false,
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1440000,
	Text = T(167022945938, --[[StoryBit TheIncident_3_Aftermath_NoExplosion Text]] "We held a vigil for the fallen heroes. Their bravery will be remembered!\n\n<sponsor_name> has suspended the construction of any new Fusion Reactors until investigations are complete.\n\n<effect>”The Incident” tech available. Research it to unlock construction of Fusion Reactors once more."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(507050052551, --[[voice:narrator]] "Your desk is covered in aftermath reports and damage assessments. The monitor flashes and almost endless stream of messages – some nervous and grief-stricken, others angry and demanding."),
	group = "Disasters",
	id = "TheIncident_3_Aftermath_NoExplosion",
	PlaceObj('StoryBitReply', {
		'Text', T(300433506007, --[[StoryBit TheIncident_3_Aftermath_NoExplosion Text]] "Stop all Fusion Reactors until we know more!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(526813806751, --[[StoryBit TheIncident_3_Aftermath_NoExplosion CustomOutcomeText]] "No negative effects"),
		'Comment', "no effect to disable construction of Fusion Reactors; No tech implemented",
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(172606002603, --[[StoryBit TheIncident_3_Aftermath_NoExplosion Text]] "Keep the remaining Reactors operational."),
		'OutcomeText', "custom",
		'Comment', "should make sure that Fusion Reactor constructions are on hold in general and resumed in this case",
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_penalty_sols>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "FusionReactor",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Enabled', true,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(763348830377, --[[StoryBit TheIncident_3_Aftermath_NoExplosion Text]] "People need a couple of Sols to process this."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(499492752970, --[[StoryBit TheIncident_3_Aftermath_NoExplosion CustomOutcomeText]] "<morale_penalty_low> Morale for <sols(morale_penalty_sols)> Sols, Fusion Reactors will stop working for <sols(stop_reactors)> Sols only"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_low",
		'Value', -5,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "stop_reactors",
		'Value', 1440000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheIncident_2_RestartReactors",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_low>",
						'Sols', "<morale_penalty_sols>",
					}),
				},
			}),
		},
	}),
})

