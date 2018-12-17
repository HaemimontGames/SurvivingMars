-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('KillColonist', nil),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "MetalsExtractor",
			'Filters', {},
			'RandomCount', 1,
			'Effects', {
				PlaceObj('SetBuildingBreakdownState', {
					'State', "Malfunction",
				}),
			},
		}),
	},
	Category = "Tick_FounderStageDone",
	Comment = "Picks random Metals Extractor, not necesarilly the workers' (no suitable effect). Bug: doesn't break building.",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/11_idiot.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 25,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 100,
		}),
		PlaceObj('PickWorker', {
			'ParentBuildingLabel', "MetalsExtractor",
			'WorkerConditions', {
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(250517903053, --[[StoryBit Darwin_TerminalVelocity Text]] "<DisplayName> was ordered to repair a freight elevator. This Colonist's original approach to the problem included standing at the bottom of the elevator shaft and dislodging its steel cable without securing the counterweight on the other side.\n\nThe Martian gravity may be 38% of that of Earth, but 4 tons are still quite a lot.\n\n<effect>A Metals Extractor has malfunctioned. An Idiot Colonist has died."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(862758288735, --[[StoryBit Darwin_TerminalVelocity Title]] "Darwin Award: Terminal Velocity"),
	VoicedText = T(760910696935, --[[voice:narrator]] "There was a bizarre accident in one of our Metals Extractors."),
	group = "Colonists",
	id = "Darwin_TerminalVelocity",
	PlaceObj('StoryBitReply', {
		'Text', T(835836152096, --[[StoryBit Darwin_TerminalVelocity Text]] "This is a tragic event. We should mourn this loss."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(682665022431, --[[StoryBit Darwin_TerminalVelocity CustomOutcomeText]] "some Colonists lose Sanity"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_penalty",
		'Value', -25,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomPercent', 25,
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<sanity_penalty>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(606826495167, --[[StoryBit Darwin_TerminalVelocity Text]] "If you can't be a good example, you'll just serve as a horrible warning."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(176795876856, --[[StoryBit Darwin_TerminalVelocity CustomOutcomeText]] "some Colonists lose Morale for 3 Sols"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomPercent', 10,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', 2160000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "darwin_funding",
		'Value', 200000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(191132131514, --[[StoryBit Darwin_TerminalVelocity Text]] "We need to invest in building an idiot-proof environment."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(911727473410, --[[StoryBit Darwin_TerminalVelocity CustomOutcomeText]] "Idiot Colonists gain very high Morale"),
		'Cost', "<darwin_funding>",
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_gain",
		'Value', 100,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Idiot",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_gain>",
						'Sols', 3600000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(698534514635, --[[StoryBit Darwin_TerminalVelocity Text]] "Start a donations campaign in order to improve job safety."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(413512988876, --[[StoryBit Darwin_TerminalVelocity CustomOutcomeText]] "gain <funding(darwin_funding)> funding"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "citymayor",
			'CommanderProfile2', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<darwin_funding>",
			}),
		},
	}),
})

