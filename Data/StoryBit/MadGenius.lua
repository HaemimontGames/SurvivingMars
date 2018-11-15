-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/artificial_intelligence_mystery_02.tga",
	Prerequisites = {
		PlaceObj('HasTrait', {
			'Trait', "Genius",
		}),
	},
	ScriptDone = true,
	Text = T{194441772737, --[[StoryBit MadGenius Text]] 'After several hours, you receive a video message from the confused Genius <DisplayName>:\n\n"I just need some more special bits. The nabblygarbling generator would soon be ready and I can finally gather all the scubblydubs! Here’s the list! Now, go, go, and bring them to me, quickly!"\n\nA list of complex electronic components and machine parts follows.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{507800063616, --[[StoryBit MadGenius Title]] "Sanity Breakdown - Mad Genius"},
	Trigger = "SanityBreakdown",
	VoicedText = T{424456161761, --[[voice:narrator]] "One of the colony’s most prominent thinkers has gone insane, locking themselves up at their home. The neighbors reports sounds of metal clinging, machinery sounds and insane laughter."},
	group = "Sanity Breakdown",
	id = "MadGenius",
	PlaceObj('StoryBitReply', {
		'Text', T{109501165050, --[[StoryBit MadGenius Text]] "Give away the components"},
		'Comment', "",
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "drone_perfabs",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "drone_prefabs_low",
		'Value', 4,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "speed_bonus",
		'Value', 20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{951045166234, --[[voice:narrator]] 'A bit time later, the genius strides out with a proud smile. "Behold my creation!" Behind rolls a clunky jury-rigged Drone with an immense booster on its back.'},
		'Text', T{658812841466, --[[StoryBit MadGenius Text]] 'The moment its creator activates it, the Drone is carried into the air by its rocket booster, swirling uncontrollably. The invention smashes with force against the dome and cracks it.\n\n"Minor setbacks make me hungry", <DisplayName> says, and walks away.\n\n<effect>The Genius <DisplayName> has recovered and gained the Enthusiast trait. A Dome has suffered a fracture.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Enthusiast",
			}),
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Dome",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('CauseFracture', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'VoicedText', T{607450381179, --[[voice:narrator]] "After some time the genius strides out, followed by a strange procession of clunky, jury-rigged drones."},
		'Text', T{279496345272, --[[StoryBit MadGenius Text]] "As the strange machines try to follow their creator, many of them fall apart on the streets. Many colonists giggle and smile as they witness the procession.\n\n<effect>The Genius <DisplayName> has recovered. Gained <drone_perfabs> Drone prefabs."},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('RewardPrefab', {
				'Amount', "<drone_perfabs>",
				'Prefab', "DronePrefab",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'VoicedText', T{477526745117, --[[voice:narrator]] "After some time, the genius is carried out of the residence atop a chair carried by a new, shiny-looking drone."},
		'Text', T{894297181433, --[[StoryBit MadGenius Text]] '"Behold my creation! Don’t worry, it’s normal to be awed by my intellect!" And indeed, the new Drone has many augmentations that make its predecessors look clumsy and old.\n\n<effect>The Genius <DisplayName> has recovered. Gained <drone_prefabs_low> Drone prefabs. All Drones move <speed_bonus>% faster.'},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('RewardPrefab', {
				'Amount', "<drone_prefabs_low>",
				'Prefab', "DronePrefab",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Drone",
				'Prop', "move_speed",
				'Percent', "<speed_bonus>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{968795932224, --[[StoryBit MadGenius Text]] "Sounds dangerous! Apprehend the patient!"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "colonists_injured",
		'Value', 4,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "health_damage",
		'Value', 20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{229089448878, --[[voice:narrator]] "The rescue team broke into the residence of the mad genius and were met with kicking and screaming. After the accident the genius has sworn a bloody vengeance upon you."},
		'Text', T{787022228411, --[[StoryBit MadGenius Text]] "<effect>The Genius <DisplayName> has become a Renegade. <colonists_injured> Colonists have lost <health_damage> Health"},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Renegade",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', "<colonists_injured>",
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Health",
						'Amount', "<health_damage>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{136944907384, --[[voice:narrator]] "The mad genius didn’t resist and was taken away. Several hours later, under the intense care of your team, the dark episode was forgotten."},
		'Text', T{627625906992, --[[StoryBit MadGenius Text]] "<effect>The Genius <DisplayName> has recovered."},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{747109857244, --[[StoryBit MadGenius Text]] "Leave them alone and hope for the best."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 80,
		'VoicedText', T{180823195710, --[[voice:narrator]] "After a couple of hours, the insane genius came to reality – too proud to be ashamed, but nevertheless shaken by the experience."},
		'Text', T{671493750702, --[[StoryBit MadGenius Text]] "<effect>The Genius <DisplayName> has recovered"},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'VoicedText', T{368542079517, --[[voice:narrator]] "A bit later a rocket booster cracks the silence in the dome and something flies out of the window where the mad genius was hiding."},
		'Text', T{832988747639, --[[StoryBit MadGenius Text]] "The flying debris swirls in the air and smashes against the dome wall.\n\n<effect>The Genius <DisplayName> has recovered. A Dome has suffered a fracture."},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Dome",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('CauseFracture', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'VoicedText', T{190277119334, --[[voice:narrator]] "A bit later, the genius strides out with a proud smile, burnt hair and covered in grease head to toe."},
		'Text', T{700776219943, --[[StoryBit MadGenius Text]] "Behind rolls a clunky, jury-rigged drone, hailing its master with cheerful beeping.\n\n<effect>The Genius <DisplayName> has recovered. Gained <drone_prefabs> Drone prefabs"},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('RewardPrefab', {
				'Amount', "<drone_perfabs>",
				'Prefab', "DronePrefab",
			}),
		},
	}),
})

