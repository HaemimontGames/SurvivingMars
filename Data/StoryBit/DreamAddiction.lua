-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
			'RandomCount', 10,
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Lazy",
				}),
			},
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "ProjectMorpheus",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T{101350256956, --[[StoryBit DreamAddiction Text]] "Project Morpheus is shaping to be too successful in what it does and many Colonists are losing interest in their non-virtual lives. \n\nThis is directly correlates with the decreasing levels of productivity among heavy users of Project Morpheus.  \n\n<effect>Several colonists have received the Lazy trait"},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{669822850612, --[[StoryBit DreamAddiction Title]] "Dream Addiction"},
	VoicedText = T{496753155915, --[[voice:narrator]] "Medical reports are beginning to reveal a worrisome trend among our Colonists. "},
	group = "Wonders",
	id = "DreamAddiction",
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 18000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{699976954991, --[[StoryBit DreamAddiction Text]] "This is disturbing, we have to stop Project Morpheus and reevaluate."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{971053412630, --[[StoryBit DreamAddiction CustomOutcomeText]] "Project Morpheus is turned off for <sols(duration)> Sols, no more colonists will become Lazy"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "ProjectMorpheus",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{273156705441, --[[StoryBit DreamAddiction Text]] "The positive effects overshadow the negative ones, keep it running!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{332035151153, --[[StoryBit DreamAddiction CustomOutcomeText]] "more Colonists will become Lazy during the next <sols(duration)> Sols"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DreamAddiction_Kill",
			"DreamAddiction_MakeLazy",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{400424381022, --[[StoryBit DreamAddiction Text]] "I can see the underlying reasons for this phenomenon."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{171061332300, --[[StoryBit DreamAddiction CustomOutcomeText]] "resolve the issue now, some Colonists receive a Morale boost"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomPercent', 50,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_boost_duration>",
						'ModifyId', "DreamAddiction",
					}),
				},
			}),
		},
	}),
})

