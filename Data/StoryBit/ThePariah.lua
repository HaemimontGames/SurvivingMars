-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Sanity",
					'Amount', "<sanity_damage>",
				}),
			},
		}),
	},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {
		PlaceObj('HasTrait', {
			'Trait', "Empath",
		}),
	},
	ScriptDone = true,
	Text = T(999445241150, --[[StoryBit ThePariah Text]] "Now an entire Dome suffers from depression and project it back towards the Empath, making things even worse. Your head thumps with the pain and despair felt by the empath <DisplayName> while you’re trying to think out a solution to the crisis.\n\n<effect>All colonists lose <sanity_damage> Sanity"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(409146302465, --[[StoryBit ThePariah Title]] "Sanity Breakdown - Negative Feedback"),
	Trigger = "SanityBreakdown",
	VoicedText = T(654809155651, --[[voice:narrator]] "An Empath has suffered a sanity breakdown. Losing control over the darkest emotions, the poor soul projected them towards all people nearby."),
	group = "Sanity Breakdown",
	id = "ThePariah",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_damage",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(448599695472, --[[StoryBit ThePariah Text]] "Let’s pray for the poor soul!"),
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 50,
			'Trait', "Religious",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(761852638863, --[[voice:narrator]] "Unsurprisingly, it worked. When the colonists started praying, they generated a stream of positive emotional energy which rejuvenated the broken, desperate mind of the empath."),
		'Text', T(564902796341, --[[StoryBit ThePariah Text]] "<effect>The empath <DisplayName> has been cured."),
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(456402272262, --[[StoryBit ThePariah Text]] "Attempt to sedate and calm down the empath."),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rescuers_amount",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "insanity_damage",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "insanity_damage_real",
		'Value', -10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 65,
		'VoicedText', T(247607465670, --[[voice:narrator]] "The plan seemed pretty solid. But nothing is ever solid when it concerns an unstable empath."),
		'Text', T(156789159014, --[[StoryBit ThePariah Text]] "The poor soul got scared of the people approaching with needles and projected a stream of the purest fear towards them. Luckily, one of the team managed to reach the trembling empath and to inject the sedative before running away, screaming.\n\n<effect>The empath <DisplayName> has been secured. <rescuers_amount> colonists lose <insanity_damage> Sanity."),
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', "<rescuers_amount>",
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<insanity_damage_real>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "empathy_morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "empathy_morale_up_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 35,
		'VoicedText', T(236068512390, --[[voice:narrator]] "Luckily, the plan worked. Now the Empath sleeps serenely in a comfy bed."),
		'Text', T(234596820137, --[[StoryBit ThePariah Text]] "The Colonists feel the calm projected on a subconscious level and make friendly jokes about the image of their fellow snoring blissfully. And the other Empaths in the colony are grateful for the amount of care you showed during the crisis.\n\n<effect>The empath <DisplayName> has been saved. All Empaths gain <empathy_morale_boost> Morale for <sols(empathy_morale_up_duration)> Sols."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Empath",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<empathy_morale_boost>",
						'Sols', "<empathy_morale_up_duration>",
					}),
				},
			}),
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(163863355694, --[[StoryBit ThePariah Text]] "Expel the empath!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "empathy_morale_penalty",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "empathy_morale_penalty_real",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "empathy_morale_down_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(739899532483, --[[voice:narrator]] "The empath is banished from the colony and will soon leave for Earth. It’s for the good of all, but the other Empaths don’t see it that way."),
		'Text', T(272960218447, --[[StoryBit ThePariah Text]] "This case was a precedent. If it repeats in the future, Empaths will be treated the same, banished and ostracized from their homes. Some of them feel as if they are ticking bombs, threatening the sanity of their fellows, and fear that many Colonists will view them as a threat from now on.\n\n<effect><DisplayName> has left the Colony. All Empaths lose <empathy_morale_penalty>Morale for <empathy_morale_down_duration> Sols."),
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Empath",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<empathy_morale_penalty_real>",
						'Sols', "<empathy_morale_down_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(998194935863, --[[StoryBit ThePariah Text]] "Only Empaths could cure another Empath!"),
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 6,
			'Trait', "Empath",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_up",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_up",
		'Value', 20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(301586354455, --[[voice:narrator]] "The Empaths form a line by holding hands to make their connection stronger and start walking towards their distressed fellow."),
		'Text', T(191922802890, --[[StoryBit ThePariah Text]] "The tension they feel is physically visible, sweat rolling down their faces and bodies shaking with fatigue. One of the Empaths is about to collapse, but then suddenly the injured mind of <DisplayName> comes back to life. <DisplayName> stands up, smiles and hugs the rescue group. They all join hands, smiling, and give a gift to the colony by projecting their shared joy.\n\n<effect>The Empath <DisplayName> has been cured. All Colonists gain <sanity_up> Sanity and <comfort_up> Comfort."),
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
						'Stat', "Sanity",
						'Amount', "<sanity_up>",
					}),
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_up>",
					}),
				},
			}),
		},
	}),
})

