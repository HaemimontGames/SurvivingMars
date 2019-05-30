-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('SpawnColonist', {
			'Name', T(283797260739, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Name]] "Mike Martian"),
			'Gender', "Male",
			'Age', "Child",
			'Trait1', "Martianborn",
			'Trait2', "Survivor",
			'AssociateWithStoryBit', true,
		}),
	},
	Comment = "Using SpawnColonist to add the boy.",
	DetachObj = true,
	Effects = {},
	Image = "UI/Messages/Events/30_playing_children.tga",
	Prerequisites = {
		PlaceObj('IsCustomAnomaly', nil),
	},
	ScriptDone = true,
	Text = T(255967197724, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "The medical team returned with a perfectly healthy boy, about 11 years old. DNA research confirmed he is 100% human and even revealed his origin: it is very probable he was conceived on the board of an early exploration rocket which was considered destroyed, and the crew was missing.\n\nIt is still a mystery how this boy survived on Mars without any protection. He doesn't speak any human language and only smiles and looks around with wide gleaming eyes. He doesn't seem to have ever met other humans before, so we'll need to teach him everything about our culture before we can ask any questions. \n\n<effect>The new Colonist Mike Martian has appeared."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(848713693200, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Title]] "Foreigner in a Foreign Land"),
	Trigger = "RocketLanded",
	group = "Expeditions",
	id = "ForeignerInAForeignLand_FollowUp1",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_gain",
		'Value', 3000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(525673500458, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Let him have a normal childhood. Treat him as any other Martianborn kid."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(899945006672, --[[StoryBit ForeignerInAForeignLand_FollowUp1 CustomOutcomeText]] "wait for the child to grow"),
		'Comment', "The story continues.",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T(706501471789, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Little Mike is an exceptional child. He has trouble understanding basic concepts of money, parenting or death. He perceives the encyclopedia as a work of fiction and nothing can persuade him the knowledge it provides is based on scientific facts. \n\nThere is much to be expected from such kid when he grows up."),
		'Enables', {
			"ForeignerInAForeignLand_FollowUp2",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(604696304276, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Become his tutor and help him unfold his potential."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(529669816760, --[[StoryBit ForeignerInAForeignLand_FollowUp1 CustomOutcomeText]] "wait for the child to grow, while trying to learn something from him"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "psychologist",
			'CommanderProfile2', "doctor",
		}),
		'Comment', "using IsCommander2 to limit the Reply to selected Commander Profiles; use DiscoverTech for unlocking Techs",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Text', T(281455361989, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Little Mike is an exceptional child. He has trouble understanding basic concepts of money, parenting or death. He perceives the encyclopedia as a work of fiction and nothing can persuade him the knowledge it provides is based on scientific facts.\n\nHowever, you learn a lot from his weird perspective and gain ideas which change the very life on Mars.\n\n<effect>A Breakthrough has been revealed."),
		'Enables', {
			"ForeignerInAForeignLand_FollowUp2",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 40,
		'Text', T(246968917126, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Little Mike is an exceptional child. He has trouble understanding basic concepts of money, parenting or death. He perceives the encyclopedia as a work of fiction and nothing can persuade him the knowledge it provides is based on scientific facts.\n\nHowever, you learn a lot from his weird perspective and gain ideas which change the very life on Mars.\n\n<effect>New Techs have been revealed."),
		'Enables', {
			"ForeignerInAForeignLand_FollowUp2",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Biotech",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Social",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(430347420115, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Little Mike is an exceptional child. He has trouble understanding basic concepts of money, parenting or death. He perceives the encyclopedia as a work of fiction and nothing can persuade him the knowledge it provides is based on scientific facts.\n\nHowever, you learn a lot from his weird perspective and gain ideas which change the very life on Mars.\n\n<effect>Gain <research(research_gain)>."),
		'Enables', {
			"ForeignerInAForeignLand_FollowUp2",
		},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<research_gain>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(489912722111, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Gain information using hypnosis and other scientific methods."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(516143339582, --[[StoryBit ForeignerInAForeignLand_FollowUp1 CustomOutcomeText]] "unlock new techs, the child may be traumatized"),
		'Comment', "Gain a reward in Techs (using DiscoverTech), but risk discontinuing the story.",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(817005706347, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "A scientist leads Mike in the lab. Mike trustfully holds her by the hand, smiling wide and looking around with curiosity. She puts him on a bed and places electrodes on his head, strain gauges on his chest and an oximeter on his finger. Then she puts him under hypnosis and starts one of many sessions in which the boy throws himself from one side to another, and sometimes just stops and looks in the camera with wide empty eyes.\n\nThen one day Mike just disappears. No one knows where he has gone, or how he vanished in thin air.\n<effect>New Techs have been revealed."),
		'Enables', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Biotech",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Social",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(875685628588, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "A scientist leads Mike in the lab. Mike trustfully holds her by the hand, smiling wide and looking around with curiosity. She puts him on a bed and places electrodes on his head, strain gauges on his chest and an oximeter on his finger. Then she puts him under hypnosis and starts one of many sessions in which the boy only smiles at her with maddening patience.\n\n<effect>A new Tech has been revealed."),
		'Enables', {
			"ForeignerInAForeignLand_FollowUp2",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Social",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(507709548514, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Send him to Earth. Let our Sponsor handle this."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(103641459076, --[[StoryBit ForeignerInAForeignLand_FollowUp1 CustomOutcomeText]] "gain <research(research_gain)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T(767617644142, --[[StoryBit ForeignerInAForeignLand_FollowUp1 Text]] "Your Sponsor team is intrigued with your discovery. When he grows up, Mike creates a turmoil back on Earth, introducing whole new concepts and thinking patterns. He even starts a new religion in an attempt to change the very basis of human nature. \n\nHe never finds the time to visit his home planet Mars, but our sponsor occasionally sends us the news about him, along with reports about the science advancements they deem useful to us."),
		'Image', "UI/Messages/Events/01_video_call.tga",
		'Enables', {},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<research_gain>",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
})

