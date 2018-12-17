-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('PayFunding', {
			'Amount', "<amount_1>",
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "DroneHub",
			'Filters', {},
			'Effects', {
				PlaceObj('SetBuildingBreakdownState', {
					'State', "Malfunction",
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "ShuttleHub",
			'Filters', {},
			'Effects', {
				PlaceObj('SetBuildingBreakdownState', {
					'State', "Malfunction",
				}),
			},
		}),
	},
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {
		PlaceObj('PickRocketWithStatus', {
			'Status', "landed",
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<check_funding>",
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Genius",
				}),
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "DroneHub",
			'Filters', {},
			'Condition', ">=",
			'Amount', 2,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "ShuttleHub",
			'Filters', {},
			'Condition', ">=",
			'Amount', 2,
		}),
	},
	ScriptDone = true,
	Text = T(612958777774, --[[StoryBit BadBoyGenius Text]] "All Drone Hubs have ceased functioning! All Shuttle Hubs have malfunctioned! <funding(amount_1)> vanish from the colony's accounts in a blink of an eye and a Rocket is about to lift off without permission.\n\nAmidst the chaos, a video message from a Genius Renegade force plays itself around the colony:\n\n\"So long, suckers! I suggest you get busy and bring your systems back online instead of devising ways to stop me. Trust me, you won't think of anything I haven't before you. Damn, I hate this place!\""),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(584272978675, --[[StoryBit BadBoyGenius Title]] "Renegades: Evil Genius"),
	VoicedText = T(164923329056, --[[voice:narrator]] "Alerts light up across the entire board. Systems fail across the colony."),
	group = "Renegades",
	id = "BadBoyGenius",
	PlaceObj('StoryBitParamFunding', {
		'Name', "check_funding",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "amount_1",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(665026360718, --[[StoryBit BadBoyGenius Text]] "Force lock the controls of the Rocket remotely."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(745120596496, --[[StoryBit BadBoyGenius Text]] "Try to reason with them and promise change."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(664150622088, --[[StoryBit BadBoyGenius Text]] "Threaten to write an op-ed that shapes <DisplayName> as a lowly villain."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(275216911814, --[[StoryBit BadBoyGenius Text]] "Invent a competent lie about a Meteor Storm that will hamper the Rocket take-off."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(830256982571, --[[StoryBit BadBoyGenius Text]] "Contact Earth authorities and delegate the issue to them."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(832539318821, --[[StoryBit BadBoyGenius Text]] "Try to cause a Rocket malfunction remotely."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(778607744764, --[[StoryBit BadBoyGenius Text]] "Warn about possible dire consequences to Earth Ecology if the Rocket gets there."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "ecologist",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(790562983160, --[[StoryBit BadBoyGenius Text]] "Tell <DisplayName> you have seen their medical records and they are unfit for a space trip at this time."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "doctor",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(807811914151, --[[StoryBit BadBoyGenius Text]] "Threaten some friends of <DisplayName> on Mars and Earth."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(845160092671, --[[StoryBit BadBoyGenius Text]] "Try to induce guilt in <DisplayName>."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Success",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "BadBoyGenius_Penalty",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(426568431369, --[[StoryBit BadBoyGenius Text]] "Let them go and don't risk further damage."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('EffectPickRocketWithStatus', {
				'Status', "landed",
			}),
			PlaceObj('ExplodeRocket', nil),
		},
	}),
})

