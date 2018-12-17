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
		PlaceObj('ForEachExecuteEffects', {
			'Label', "FusionReactor_Construction",
			'Filters', {},
			'Effects', {
				PlaceObj('SetConstructionSiteState', {
					'State', "Disable",
				}),
			},
		}),
		PlaceObj('LockUnlockBuildingFromBuildMenu', {
			'Building', "FusionReactor",
			'Lock', true,
		}),
	},
	Effects = {},
	Enables = {
		"TheIncident_4_TechResearched",
	},
	Image = "UI/Messages/Events/22_collapsing_building.tga",
	InheritsObject = false,
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1440000,
	Text = T(490123810092, --[[StoryBit TheIncident_1_Aftermath_Explosion Text]] "While the initial panic has somewhat subsided, people are still fearful and prefer to remain in their homes. It will take some time until the colony gets back to the normal routine.\n\n<sponsor_name> has suspended the construction of any new Fusion Reactors until investigations are complete.\n\n<effect>”The Incident” tech available. Research it to unlock construction of Fusion Reactors once more."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(507050052551, --[[voice:narrator]] "Your desk is covered in aftermath reports and damage assessments. The monitor flashes and almost endless stream of messages – some nervous and grief-stricken, others angry and demanding."),
	group = "Disasters",
	id = "TheIncident_1_Aftermath_Explosion",
	PlaceObj('StoryBitReply', {
		'Text', T(957445020080, --[[StoryBit TheIncident_1_Aftermath_Explosion Text]] "Stop all Fusion Reactors until we know more!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(392754269962, --[[StoryBit TheIncident_1_Aftermath_Explosion CustomOutcomeText]] "No negative effects"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(775877057703, --[[StoryBit TheIncident_1_Aftermath_Explosion Text]] "Keep the remaining Reactors operational."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(539212245014, --[[StoryBit TheIncident_1_Aftermath_Explosion CustomOutcomeText]] "<morale_penalty> Morale for the next <morale_penalty_sols> Sols"),
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
		'Text', T(538876993454, --[[StoryBit TheIncident_1_Aftermath_Explosion Text]] "People need a couple of Sols to process this."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(259086539552, --[[StoryBit TheIncident_1_Aftermath_Explosion CustomOutcomeText]] "<morale_penalty_low> Morale for <sols(morale_penalty_sols)> Sols, Fusion Reactors will stop working for <sols(stop_reactors)> Sols only"),
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

