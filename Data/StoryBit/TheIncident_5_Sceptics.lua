-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Image = "UI/Messages/Events/10_protest.tga",
	Prerequisites = {
		PlaceObj('IsBuildingClass', {
			'BuildingClass', {},
			'Template', {
				"FusionReactor",
			},
		}),
	},
	ScriptDone = true,
	Text = T{631045983210, --[[StoryBit TheIncident_5_Sceptics Text]] "The memory of the incident with the Fusion Reactor is still fresh in the minds of some colonists. Fusion sceptics are against any new Fusion Reactors being built and demand that you take decisive action on the matter."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{589142472904, --[[StoryBit TheIncident_5_Sceptics Title]] "Remember The Incident "},
	Trigger = "ConstructionComplete",
	VoicedText = T{281378896809, --[[voice:narrator]] "Angry voices can be heard outside, as the small group of fusion sceptics attempts to push through to your office."},
	group = "Disasters",
	id = "TheIncident_5_Sceptics",
	PlaceObj('StoryBitReply', {
		'Text', T{184814226327, --[[StoryBit TheIncident_5_Sceptics Text]] "We will cancel the construction of the new Fusion Reactor."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Destroy",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{809797776246, --[[StoryBit TheIncident_5_Sceptics Text]] "*lie* We will cancel the construction of the new Fusion Reactor."},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_lie",
		'Value', -10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T{135938674066, --[[StoryBit TheIncident_5_Sceptics Text]] "The fusion sceptics believed your lie for a couple of Sols. However, once the construction of the Fusion Reactor continued the entire colony saw through the deception.\n\n<effect><morale_penalty_lie> Morale loss for all colonists"},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_lie>",
						'ModifyId', "TheIncident",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{591783170242, --[[StoryBit TheIncident_5_Sceptics Text]] "*lie* We will take extra precautions."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{391931230476, --[[StoryBit TheIncident_5_Sceptics CustomOutcomeText]] "<morale_penalty_politician> Morale loss for some Colonists"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_politician",
		'Value', -5,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Filters', {},
				'RandomPercent', 20,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_politician>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{588812606220, --[[StoryBit TheIncident_5_Sceptics Text]] "We will take extra precautions."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{555544953606, --[[StoryBit TheIncident_5_Sceptics CustomOutcomeText]] "<morale_penalty_politician> Morale loss for some Colonists"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Filters', {},
				'RandomPercent', 20,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_politician>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{690820657260, --[[StoryBit TheIncident_5_Sceptics Text]] "Just ignore the sceptics."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{394024335096, --[[StoryBit TheIncident_5_Sceptics CustomOutcomeText]] "<morale_penalty_ignore> Morale loss for some Colonists"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_ignore",
		'Value', -15,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Filters', {},
				'RandomPercent', 20,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_ignore>",
					}),
				},
			}),
		},
	}),
})

