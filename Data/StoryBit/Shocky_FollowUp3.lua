-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('KillColonist', nil),
		PlaceObj('PickFromLabelEffect', {
			'Label', "ResearchLab",
			'Conditions', {},
		}),
		PlaceObj('ForEachWorker', {
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Health",
					'Amount', "<health_penalty>",
				}),
				PlaceObj('ModifyColonistStat', {
					'Stat', "Sanity",
					'Amount', "<sanity_penalty>",
				}),
			},
		}),
		PlaceObj('DestroyBuilding', {
			'KillColonists', false,
		}),
		PlaceObj('DiscoverTech', {
			'Field', "Breakthroughs",
		}),
	},
	Effects = {},
	Image = "UI/Messages/Events/23_red_alert.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{579022087540, --[[StoryBit Shocky_FollowUp3 Text]] "It seems that the “imaginary friend” of the boy wasn’t imaginary at all. While tried to establish contact with the parallel universe where it comes from, our scientists  somehow opened a portal to another dimension. However, it was unstable and horrible creatures have reached from it into our world. In a desperate attempt to save our reality, the head of the science team has opened the oxygen vents and triggered an explosion in the facility.\n\n<effect>A new Breakthrough is available for research. Matthew Gore has perished."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{964276140450, --[[voice:narrator]] "Stranger things happened at the research facility."},
	group = "Colonists",
	id = "Shocky_FollowUp3",
	PlaceObj('StoryBitParamNumber', {
		'Name', "health_penalty",
		'Value', -50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_penalty",
		'Value', -50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_high",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_low",
		'Value', -10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{576250865042, --[[StoryBit Shocky_FollowUp3 Text]] "Science requires sacrifices. We shall name their discoveries after the boy - Matthew Gore!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{721256685409, --[[StoryBit Shocky_FollowUp3 CustomOutcomeText]] "many Colonists lose Morale, unlock some random Techs"},
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
						'Amount', "<morale_penalty_high>",
						'Sols', 3600000,
					}),
				},
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{312733707652, --[[StoryBit Shocky_FollowUp3 Text]] "There was a tragic accident at the Research Lab. We are still investigating the issue."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{867974978322, --[[StoryBit Shocky_FollowUp3 CustomOutcomeText]] "some Colonists lose Morale"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomPercent', 25,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_low>",
						'Sols', 3600000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{543630353174, --[[StoryBit Shocky_FollowUp3 Text]] "Calm down. We will create a special committee to investigate this tragic event."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{621286146570, --[[StoryBit Shocky_FollowUp3 CustomOutcomeText]] "no consequences"},
	}),
})

