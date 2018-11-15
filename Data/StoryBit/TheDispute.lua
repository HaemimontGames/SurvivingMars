-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "engineer",
				}),
			},
			'Condition', ">",
			'Amount', 0,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "scientist",
				}),
			},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T{648930562532, --[[StoryBit TheDispute Text]] 'The dispute which profession is more vital for the colonization effort has polarized the Colonists into two different camps.\n\nYou tried to avoid being sucked into the ridiculous debate but were ambushed by representatives of both sides on your way to lunch. \n\nWith your back against the wall they ask: \n\n"In your opinion, Commander, who is more critical for the colony\'s success - the Engineer or the Scientist?"'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{316141391057, --[[StoryBit TheDispute Title]] "The Dispute"},
	VoicedText = T{911940914472, --[[voice:narrator]] "An argument between an Engineer and a Scientist has escalated and is now the talk of the entire Colony."},
	group = "Colonists",
	id = "TheDispute",
	PlaceObj('StoryBitReply', {
		'Text', T{242897715156, --[[StoryBit TheDispute Text]] "The Scientist's work enables the Engineer to do theirs."},
		'CustomOutcomeText', T{273089215767, --[[StoryBit TheDispute CustomOutcomeText]] "Scientists get Morale boost, Engineers lose Morale for <sols(morale_duration)> Sols"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "engineer",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "scientist",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration_short",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{329665217454, --[[StoryBit TheDispute Text]] "The Engineer puts to practice the theories of the Scientist."},
		'CustomOutcomeText', T{538785520203, --[[StoryBit TheDispute CustomOutcomeText]] "Engineers get Morale boost, Scientists lose Morale for <sols(morale_duration)> Sols"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "engineer",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "scientist",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{301306333380, --[[StoryBit TheDispute Text]] "What the... this is ridiculous! Both roles are vital!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "engineer",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_duration_short>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "scientist",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_duration_short>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{122024823332, --[[StoryBit TheDispute Text]] "Engineers and Scientists, like all others on Mars, are parts of a single working system. All our roles are irreplaceable."},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
		'Comment', "no consequences",
	}),
})

