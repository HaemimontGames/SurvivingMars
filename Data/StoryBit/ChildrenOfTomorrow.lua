-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/30_playing_children.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "MartianbornIngenuity",
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
				}),
			},
			'Condition', ">=",
			'Amount', 30,
		}),
	},
	ScriptDone = true,
	Text = T{11368, --[[StoryBit ChildrenOfTomorrow Text]] "It’s no surprise that our Martian children behave differently, given the fact that they are raised and educated so differently than the children on Earth."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{245038128609, --[[StoryBit ChildrenOfTomorrow Title]] "Children of Tomorrow"},
	VoicedText = T{356184329450, --[[voice:narrator]] "Our children have become quite strange lately. Organizing in small, eccentric groups, they shun outsiders and immerse in their own distinctive sub-cultures of gestures, expressions and language."},
	group = "Breakthroughs",
	id = "ChildrenOfTomorrow",
	PlaceObj('StoryBitReply', {
		'Text', T{775466350337, --[[StoryBit ChildrenOfTomorrow Text]] "Quite alarming. We must put an end to this, whether they like it or not!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{231493284466, --[[StoryBit ChildrenOfTomorrow CustomOutcomeText]] "prevent the unwanted development"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "conservatives",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "liberals",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_change",
		'Value', 15,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_change_down",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{418427115243, --[[voice:narrator]] "The children aren’t exactly happy that their fun little games has been ended by the stern adults."},
		'Text', T{365875296007, --[[StoryBit ChildrenOfTomorrow Text]] "Without a center point, their eccentricity spins off intro various directions. Many Colonists see this as a bad move, and protest against it, while others approve of your actions.\n\n<effect><conservatives> Colonists gain <morale_change> Morale for <sols(morale_sols)> Sols, while <liberals> Colonists lose <morale_change> Morale for <sols(morale_sols)> Sols."},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', "<conservatives>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_change>",
						'Sols', "<morale_sols>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<liberals>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_change_down>",
						'Sols', "<morale_sols>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{552180212027, --[[StoryBit ChildrenOfTomorrow Text]] "Intriguing! Let’s just sit back and watch the development."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{11369, --[[StoryBit ChildrenOfTomorrow CustomOutcomeText]] "let the children do as they please"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"ChildrenOfTomorrow_TheAdvent1",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{510828586574, --[[StoryBit ChildrenOfTomorrow Text]] "A great subject for research! But let the children do as they will."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{256820641845, --[[StoryBit ChildrenOfTomorrow CustomOutcomeText]] "unlock new tech, let the children do as they please"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"ChildrenOfTomorrow_TheAdvent1",
		},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Amount', 2,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{915327490315, --[[StoryBit ChildrenOfTomorrow Text]] "Encourage the diversification of the different groups."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{741119407366, --[[StoryBit ChildrenOfTomorrow CustomOutcomeText]] "meddle in the children's development"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"ChildrenOfTomorrow_TheAdvent2",
		},
		'Effects', {},
	}),
})

