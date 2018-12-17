-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/09_fireworks.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Max', 80,
		}),
	},
	ScriptDone = true,
	Text = T(784882052902, --[[StoryBit Party Text]] "Small groups of people talk and laugh, while others dance to the groovy music. Someone sees you and the music stops abruptly. Everyone is looking slightly guilty."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(683841873799, --[[StoryBit Party Title]] "Party!"),
	VoicedText = T(949723673521, --[[voice:narrator]] "The door of the command room opens and you’re hit by the loud noise. A party!"),
	group = "Colonists",
	id = "Party",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_bonus",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_bonus",
		'Value', 15,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(446442320434, --[[StoryBit Party Text]] "I expect the maintenance and efficiency reports on my desk by 1100 local time."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(139200594944, --[[StoryBit Party Title]] "Party!"),
		'VoicedText', T(827831603659, --[[voice:narrator]] "Recreation is important, but duties, especially the duties of Mission Control, must never be forgotten."),
		'Text', T(315003773008, --[[StoryBit Party Text]] "Under your harsh gaze, the team cleans up the control room and attend their action stations. You take your seat – there’s work to do.\n\n<effect>+<morale_bonus> Morale for <sols(morale_duration)> Sols for all Colonists"),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_bonus>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(880306212271, --[[StoryBit Party Text]] "What is this, a party? Who gave you permission?"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(877213074013, --[[StoryBit Party Title]] "Party!"),
		'VoicedText', T(224796459286, --[[voice:narrator]] "Your harsh words hit them like a scourge. But they were necessary."),
		'Text', T(123273551090, --[[StoryBit Party Text]] "Mars is like a death-trap, ready to snap shut when you least expect it. Your people need to learn that you will never compromise the safety and success of the colony.\n\n<effect>+<morale_bonus> Morale for <sols(morale_duration)> Sols for all Colonists"),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_bonus>",
						'Sols', "<morale_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(602410299958, --[[StoryBit Party Text]] "Smile and wave, then leave them have it their way."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(877213074013, --[[StoryBit Party Title]] "Party!"),
		'VoicedText', T(757158290187, --[[voice:narrator]] "The Mission Control team had a pretty rough time so far. They earned the right to vent off some steam."),
		'Text', T(556254556363, --[[StoryBit Party Text]] "But you know that Mars is still out there, stalking for a good moment to strike at your colony and take its toll. You leave your people have fun, and you return to your personal control station. Someone has to be on vigil.\n\n<effect>+<comfort_bonus> Comfort for all Colonists"),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_bonus>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(752382845123, --[[StoryBit Party Text]] "The secret booze stash is in this locker."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(250328973952, --[[StoryBit Party Title]] "Party!"),
		'VoicedText', T(921949943478, --[[voice:narrator]] "You have to admit, your team needed to vent off some steam."),
		'Text', T(199287635635, --[[StoryBit Party Text]] 'You join the argument of the Engineers about some nuts and bolts, then discuss the hilariously-crafted fake hypothesis of the Scientists and even taste some of the allegedly "hangover-free" moonshine of the Botanists. Who knows, there might be a grain of truth there - next morning you wake up with a smile and a light heart.\n\n<effect>+<comfort_bonus> Comfort for all Colonists'),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_bonus>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(786481891870, --[[StoryBit Party Text]] "How unprofessional! You call this dancing? Let me show you!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(877213074013, --[[StoryBit Party Title]] "Party!"),
		'VoicedText', T(810989908988, --[[voice:narrator]] "You couldn’t remember the last time you had so much fun!"),
		'Text', T(441726918291, --[[StoryBit Party Text]] "And to be honest, when you wake up in the morning, you couldn’t remember what you did at the party last night. You take the headache as a positive sign while you’re trying to reach your action station. People that see you in the corridors give you warm smiles.\n\n<effect>+<comfort_bonus> Comfort for all Colonists"),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_bonus>",
					}),
				},
			}),
		},
	}),
})

