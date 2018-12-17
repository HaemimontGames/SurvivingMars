-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/11_idiot.tga",
	Prerequisites = {
		PlaceObj('HasTrait', {
			'Trait', "Android",
		}),
	},
	ScriptDone = true,
	Text = T(568885974354, --[[StoryBit NutsAndBolts Text]] "<DisplayName> keeps repeating these frustrating words. Over and over. Unrelenting, the biorobot roams the dome and pursues people, screaming after them. Some even fear a violent development."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(440769457923, --[[StoryBit NutsAndBolts Title]] "Sanity Breakdown - Nuts and Bolts"),
	Trigger = "SanityBreakdown",
	VoicedText = T(256568874065, --[[voice:narrator]] '"We are the Blorg. Your biological and technological distinctiveness will be befriended by our own. Resistance is futile." Clearly, the poor biorobot has gone nuts.'),
	group = "Sanity Breakdown",
	id = "NutsAndBolts",
	PlaceObj('StoryBitReply', {
		'Text', T(158145740561, --[[StoryBit NutsAndBolts Text]] "We all have bad moments, be it biorobot or human."),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "robot_morale_up_time",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "robot_morale_up",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "ranting_comfort_down",
		'Value', 30,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "ranting_comfort_down_real",
		'Value', -30,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(424643489576, --[[voice:narrator]] "The biorobot is left unattended. Many colonists file in complaints, but all goes well when their annoying fellow comes back to reality."),
		'Text', T(797751291256, --[[StoryBit NutsAndBolts Text]] "While they admit that <DisplayName> was extremely annoying, the other biorobots in the colony feel grateful that one of their kind was treated like a person, and not a defect object, and was given a chance to find inner strength to get better.\n\n<effect><DisplayName> has recovered. All Colonists lost <ranting_comfort_down> Comfort. All Biorobots gain <robot_morale_up> Morale for <sols(robot_morale_up_time)> Sols."),
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<ranting_comfort_down_real>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Android",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<robot_morale_up>",
						'Sols', "<robot_morale_up_time>",
						'Reason', T(927044366914, --[[StoryBit NutsAndBolts Reason]] "<green>Feels like a Human <opt_amount(amount)> <opt_percent(percent)></green>"),
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(115216975015, --[[StoryBit NutsAndBolts Text]] "Biorobots were created to complement our weaknesses. Reprogram it!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "robot_morale_down",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "robot_morale_down_real",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "robot_morale_down_time",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(844599878295, --[[voice:narrator]] "The biorobot is apprehended and ran through the system, its memory checked and reset."),
		'Text', T(496728739052, --[[StoryBit NutsAndBolts Text]] "Biorobots around the colony admit this was the best decision, but still don’t feel comfortable as one of their kind has just been treated like an object, a tool so to say.\n\n<effect><DisplayName> has lost all Traits. Biorobots lose <robot_morale_down> Morale for <sols(robot_morale_down_time)> Sols."),
		'Effects', {
			PlaceObj('RemoveAllTraits', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Android",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<robot_morale_down_real>",
						'Sols', "<robot_morale_down_time>",
						'Reason', T(234687415326, --[[StoryBit NutsAndBolts Reason]] "<green>Feels like an object <opt_amount(amount)> <opt_percent(percent)></green>"),
					}),
				},
			}),
		},
	}),
})

