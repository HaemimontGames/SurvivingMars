-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ExplodeBuilding', {
			'Radius', 500,
		}),
	},
	Category = "Tick_FounderStageDone",
	Comment = "Casualties do not seem certain",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/13_renegades.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 10,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Spacebar",
			'Conditions', {
				PlaceObj('IsBuildingWorking', nil),
			},
		}),
	},
	ScriptDone = true,
	Text = T(246855400631, --[[StoryBit GripOfLawless Text]] "A bomb has exploded in a Spacebar. There are casualties. \n\nIn light of our recent Renegade problem, this brazen act of violence was the final drop as far as our otherwise peaceful Colonists are concerned.\n\nEveryone is voicing their disdain with the Renegades and demands that we take action. Ruthless action."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(882556361329, --[[StoryBit GripOfLawless Title]] "Renegades: The Grip of the Lawless"),
	VoicedText = T(851083944565, --[[voice:narrator]] "A war between two rival gangs of Renegades has taken a dark turn."),
	group = "Renegades",
	id = "GripOfLawless",
	PlaceObj('StoryBitReply', {
		'Text', T(807674322812, --[[StoryBit GripOfLawless Text]] "So it has come to this - our first executions on another world. Humanity will never change."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(100431729290, --[[StoryBit GripOfLawless CustomOutcomeText]] "Renegades will be executed"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
					}),
				},
				'RandomCount', 2,
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
					}),
				},
				'Effects', {
					PlaceObj('RemoveTrait', {
						'Trait', "Renegade",
					}),
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<sanity>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(556290014724, --[[StoryBit GripOfLawless Text]] "Never! Mars shall not be sullied by capital punishment."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(554867977295, --[[StoryBit GripOfLawless CustomOutcomeText]] "Renegades will be shipped off the colony"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale",
		'Value', -40,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration",
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
						'Amount', "<morale>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
					}),
				},
				'RandomCount', 2,
				'Effects', {
					PlaceObj('EraseColonist', nil),
				},
			}),
		},
	}),
})

