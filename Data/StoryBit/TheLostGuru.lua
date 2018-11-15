-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/06_space_suit.tga",
	OneTime = false,
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Guru",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Alcoholic",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Celebrity",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Composed",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Coward",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Empath",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Enthusiast",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Extrovert",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Fit",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Gambler",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Gamer",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Genius",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Glutton",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Hippie",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Hypochondriac",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Introvert",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Lazy",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Melancholic",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Nerd",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Religious",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Rugged",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Saint",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Sexy",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Survivor",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Vegan",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Whiner",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Workaholic",
					'Negate', true,
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{434660199285, --[[StoryBit TheLostGuru Text]] "You know about the great potential of <DisplayName>, and this depressive mood doesn’t seem so strange given the circumstances – a Guru without a path, without an insight to pass on. Maybe you could help?\n\n<effect><DisplayName> will get a new Perk, inspired by your advice."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{922487050053, --[[StoryBit TheLostGuru Title]] "The Lost Guru"},
	VoicedText = T{107785705958, --[[voice:narrator]] '"I feel lost, without a purpose." The Colonist in front of you seems to be rather disheartened. "I need your help."'},
	group = "Colonists",
	id = "TheLostGuru",
	PlaceObj('StoryBitReply', {
		'Text', T{740045496909, --[[StoryBit TheLostGuru Text]] "Talent is one part gift and five parts hard work."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{215330790812, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Enthusiast Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Enthusiast",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{819521608655, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Workaholic Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Workaholic",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{148257872720, --[[StoryBit TheLostGuru Text]] "Some say that the meaning of life is to have fun."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{994856464072, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Party Animal Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Extrovert",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{240742285536, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Gamer Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Gamer",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{488271201260, --[[StoryBit TheLostGuru Text]] "People need someone to make them see light in the dark days."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{468208100541, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Rugged Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Rugged",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{641626647140, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Composed Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Composed",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{191277000007, --[[StoryBit TheLostGuru Text]] "Sometimes the answer is inside of us, but we ask for advice instead."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{138246921240, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Hippie Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Hippie",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{531579122366, --[[voice:narrator]] "The guru leaves, immersed in thoughts. Later, you receive a message which warms your heart."},
		'Text', T{970467785283, --[[StoryBit TheLostGuru Text]] '"Thank you, Commander. You made me realize that the answers I was looking for were around me and most importantly – inside of me. I feel complete, as if I’ve found a missing piece of my own self.\n\nYours sincerely, <DisplayName>"\n\n<effect><DisplayName> has gained the Fit Perk.'},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Fit",
			}),
		},
	}),
})

