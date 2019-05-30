-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('AddTrait', {
			'Trait', "Guru",
		}),
		PlaceObj('AddTrait', {
			'Trait', "Religious",
		}),
		PlaceObj('AddTrait', {
			'Trait', "Saint",
		}),
	},
	Comment = "using ForEachExecuteEffects >> Colonist, HasTrait >> Religious (negative), AddTrait >> Religious",
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Religious",
					'Negate', true,
				}),
			},
			'RandomPercent', "<new_religious>",
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Religious",
				}),
			},
		}),
	},
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(561444202705, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] 'Mike, the person who has been found as a child roaming the Mars surface without any protective equipment, has grown into a young man. He has learned several languages, but he still claims he lacks the words needed to explain how he survived and what is his connection with some "old ones" he mentions every once and again. Some say he has been raised by aliens, but he disagrees. All the questions, he says, can be answered only in the tongue of the Old Ones, as the language shapes the thought and the thought can change space and time.\n\nEventually, Mike decided that the humankind is hopelessly confused and unhappy, and he tried to establish a new religion which would change the very human nature by teaching the language of the Old Ones. His cult which promotes social libertarianism and some non-mainstream family structures, quickly gathered followers in our colony.\n\nNeedless to say, these ideas put pressure on our community.\n<effect>Some of our Colonists became Religious.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(900575952837, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Title]] "Foreigner in a Foreign Land"),
	Trigger = "ColonistBecameYouth",
	group = "Expeditions",
	id = "ForeignerInAForeignLand_FollowUp2",
	PlaceObj('StoryBitParamPercent', {
		'Name', "new_religious",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "new_saints",
		'Value', 2,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_loss",
		'Value', -40,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "colonists_pissed_1",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "colonists_pissed_2",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "pissed_time",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_gain",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "security_happy",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "happy_time",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(143767476908, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "Mike means only good. Let him do whatever he deems necessary."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(170229833355, --[[StoryBit ForeignerInAForeignLand_FollowUp2 CustomOutcomeText]] "many Religious Colonists lose Morale, a few become Saints"),
		'Comment', "using ForEachExecuteEffects >> Colonist, HasTrait >> Religious, ModifyObject >> base_morale, Parameters",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(764262105297, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "With your permission, Mike establishes the Church of Two Worlds as an official religion. This introduces immense social tension within our colony. Some insist that he and his people should be burned as witches, and others fiercely support him. However, the Old Ones' language really provides some unexplored psycho-kinetic abilities and even though modern science can't explain them, Mike and his people use their powers to help our community.\n\n<effect><colonists_pissed_2>% of Religious Colonists lose <morale_loss> Morale for <sols(pissed_time)> Sols.\n<new_saints> more Colonists have become Saints."),
		'Image', "UI/Messages/Events/10_protest.tga",
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomPercent', "<colonists_pissed_2>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_loss>",
						'Sols', "<pissed_time>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomCount', "<new_saints>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Saint",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(675735846271, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "With your permission, Mike establishes the Church of Two Worlds as an official religion. The Old Ones' language really provides some unexplored psycho-kinetic abilities and even though modern science can't explain them, Mike and his people use their powers to help our community.\n\nHowever, this introduces immense social tension within our colony. Some insist that he and his people should be burned as witches, and others fiercely support him. One day, a mob of angry and confused people attacks him at his house and Mike dies as a martyr. Strangely, the shock of what's done makes everybody sober down and the peace is finally restored.\n\n<effect>Mike is dead.\n<colonists_pissed_1>% of Religious Colonists lose <morale_loss> Morale for <sols(pissed_time)> Sols.\n<new_saints> more Colonists have become Saints."),
		'Image', "UI/Messages/Events/10_protest.tga",
		'Effects', {
			PlaceObj('KillColonist', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomPercent', "<colonists_pissed_2>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_loss>",
						'Sols', "<pissed_time>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomCount', "<new_saints>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Saint",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(744628162387, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "Forbid his new religion, but secretly support him."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(466568906613, --[[StoryBit ForeignerInAForeignLand_FollowUp2 CustomOutcomeText]] "some Religious Colonists lose Morale, a few become Saints"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "politician",
			'CommanderProfile2', "author",
		}),
		'Comment', "",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T(144154828670, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "Mike establishes the Church of Two Worlds as a secret cult and this creates some social tension between his followers and the other members of society. However, the Old Ones' language really provides some unexplored psycho-kinetic abilities and even though modern science can't explain them, Mike and his people use their powers to help our community.\n\n<effect><colonists_pissed_1>% of Religious Colonists lose <morale_loss> Morale for <sols(pissed_time)> Sols.\n<new_saints> more Colonists have become Saints."),
		'Image', "UI/Messages/Events/10_protest.tga",
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomPercent', "<colonists_pissed_1>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_loss>",
						'Sols', "<pissed_time>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'RandomCount', "<new_saints>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Saint",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(193275236198, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "The road to hell is paved with good intentions. Banish Mike to keep the peace."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(880040340421, --[[StoryBit ForeignerInAForeignLand_FollowUp2 CustomOutcomeText]] "Mike is sent to Earth, some Security Officers gain Morale"),
		'Comment', "",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T(465260621163, --[[StoryBit ForeignerInAForeignLand_FollowUp2 Text]] "Mike creates a turmoil back on Earth and saves us the trouble. He introduces whole new concepts and thinking patterns, eventually provoking a social revolution.\n\nHe never finds the time to visit again his home planet Mars.\n\n<effect>Mike leaves Mars.\n<security_happy>% of Security Officers gain <morale_gain> Morale for <sols(happy_time)> Sols."),
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "security",
					}),
				},
				'RandomPercent', "<security_happy>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_gain>",
						'Sols', "<happy_time>",
					}),
				},
			}),
		},
	}),
})

