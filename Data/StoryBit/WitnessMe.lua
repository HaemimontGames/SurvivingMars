-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/22_collapsing_building.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Rover",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(516741364596, --[[StoryBit WitnessMe Text]] "Clearly, <DisplayName> wants you to name a target."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(655463582971, --[[StoryBit WitnessMe Title]] "Sanity Breakdown - Witness Me!"),
	Trigger = "SanityBreakdown",
	VoicedText = T(447842355156, --[[voice:narrator]] 'After suffering a Sanity breakdown, the victim ran to the hatch of the dome, quickly put on a space suit and hijacked a Rover. "Show me the enemy, Important Joe, and I’ll bring it fury!"'),
	group = "Sanity Breakdown",
	id = "WitnessMe",
	PlaceObj('StoryBitReply', {
		'Text', T(558858165297, --[[StoryBit WitnessMe Text]] "That building, you see it? Charge!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(108811474809, --[[voice:narrator]] '"Witness meeeeee!" With a scream, the poor soul smashes the hijacked Rover into the building.'),
		'Text', T(740107566067, --[[StoryBit WitnessMe Text]] "The cockpit cameras show that the colonist lies on the floor, unconscious. Fortunately, no lives were lost, but the building has been severely damaged. Hours later, the Colonist regains consciousness and is now feeling better, although ashamed.\n\n<effect>A building has been destroyed."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "OutsideBuildings",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('DestroyBuilding', {
						'KillColonists', false,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(684733124592, --[[StoryBit WitnessMe Text]] "That Dome, that’s where they hide!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "crack_amount",
		'Value', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(291041930115, --[[voice:narrator]] '"I live, I die, I live again!" With an ear-piercing war cry, the poor soul smashes the hijacked rover into the dome.'),
		'Text', T(527619615617, --[[StoryBit WitnessMe Text]] "The surface bends in and surrenders under the force of the impact, the air inside leaving with a sinister hissing. Luckily, the colonist inside the rover suffered only a concussion, and is now feeling better, but ashamed.\n\n<effect>A Dome has received <crack_amount> fractures."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Dome",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('CauseFracture', nil),
					PlaceObj('CauseFracture', nil),
					PlaceObj('CauseFracture', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(720607934838, --[[StoryBit WitnessMe Text]] "Listen to my voice, calm down, no need for violence!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(668864756921, --[[voice:narrator]] '"NO! I am awaited in Valhalla!" Laughing maniacally, the Colonist forces the rover into the red desert.'),
		'Text', T(607214014534, --[[StoryBit WitnessMe Text]] "Hours later, you track the Colonist’s whereabouts by the signal beacon of the space suit. There you find <DisplayName> sitting atop the rover’s frozen debris, ashamed of the maniacal behavior, but still fine.\n\n<effect>A Rover has been destroyed."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Rover",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('DestroyVehicle', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(989535518786, --[[voice:narrator]] '"Why won’t you look at me, Important Joe? Why do you deny me?" The poor soul sits, quietly sobbing.'),
		'Text', T(135558955465, --[[StoryBit WitnessMe Text]] "<DisplayName> makes no attempts to resist when you open the Rover’s hatch. Hours later, the Colonist is feeling much better, yet ashamed.\n\n<effect><DisplayName> has been saved."),
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(799351599775, --[[StoryBit WitnessMe Text]] "Think happy thoughts, little Joe!"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(154694661290, --[[voice:narrator]] '"What? Am I denied? No! Noooo!" The colonist makes no attempts to resist when you reach the Rover and open the hatch.'),
		'Text', T(339558921129, --[[StoryBit WitnessMe Text]] "Hours later, under your attentive care, the Colonist comes back to reality and is feeling better, although ashamed.\n\n<effect><DisplayName> has been saved."),
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
})

