-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 180000,
	Effects = {},
	Image = "UI/Messages/Events/24_dome_in_ruins.tga",
	Prerequisites = {
		PlaceObj('IsCustomAnomaly', {
			'id', "MysteriousDomeStructure",
		}),
	},
	ScriptDone = true,
	Text = T(664495958038, --[[StoryBit WindsOfChange_1_Expedition Text]] "After the initial astonishment, the team got to work and found out that construction nanites from our colony are working to break down the rocket to basic molecules. However, the nanites aren’t responding to any deactivation signals."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(784811904584, --[[StoryBit WindsOfChange_1_Expedition Title]] "Winds of Change"),
	Trigger = "ExpeditionSent",
	VoicedText = T(837324179919, --[[voice:narrator]] "As the Rocket lands at the mysterious dome construction site, its surface starts to disintegrate slowly! The expedition team stare at the sight, wordless and disturbed."),
	group = "Breakthroughs",
	id = "WindsOfChange_1_Expedition",
	PlaceObj('StoryBitReply', {
		'Text', T(528222803297, --[[StoryBit WindsOfChange_1_Expedition Text]] "It’s too dangerous, get out of there!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(778085510538, --[[voice:narrator]] "The expedition team quickly blasts off, leaving the rogue nanites to continue their work unabated. "),
		'Text', T(765544160642, --[[StoryBit WindsOfChange_1_Expedition Text]] "The Dome construction site slowly fades from sight as the rocket accelerates up in the skies.\n\n<effect>The expedition team will return shortly."),
		'Enables', {
			"WindsOfChange_2_Typhoon",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(981368154377, --[[StoryBit WindsOfChange_1_Expedition Text]] "We cannot afford a grey goo scenario! Find a way to deactivate them!"),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "critical_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(367477946635, --[[voice:narrator]] "The team starts working frantically, racing against time as the rogue nanites continue their merciless work on the Rocket’s hull."),
		'Text', T(186554687367, --[[StoryBit WindsOfChange_1_Expedition Text]] 'Using the research output of the Colony would help their task immeasurably.\n\n<effect>Finish the "Rogue Nanites Analysis" tech to speed up their deactivation. If the tech is not researched within <sols(critical_sols)> Sols, the team will take off.'),
		'Enables', {
			"WindsOfChange_StalledWind",
			"WindsOfChange_WaitEvacuationOnSite",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "RogueNanitesAnalysis",
				'Cost', 3000,
			}),
			PlaceObj('DelayExpedition', {
				'Time', 7380000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(521426082290, --[[StoryBit WindsOfChange_1_Expedition Text]] "Amazing! Try to stay as much as possible and study them."),
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "bonus_research",
		'Value', 5000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(360930733075, --[[voice:narrator]] "The team leader sends out the RC Explorer. The team races against time as the rogue nanites mercilessly erode the hull of the rover."),
		'Text', T(663882073065, --[[StoryBit WindsOfChange_1_Expedition Text]] "When the risk becomes too high, the Explorer is recalled and barely manages to enter the rocket before it takes off.\n\n<effect>The expedition team will return shortly. You have gained <research(bonus_research)>."),
		'Enables', {
			"WindsOfChange_2_Typhoon",
		},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<bonus_research>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(687088390945, --[[StoryBit WindsOfChange_1_Expedition Text]] "Stay as much as you need to find a way to control them!"),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay_expedition",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(226724631703, --[[voice:narrator]] "The team starts working frantically, racing against time to gather all the information they can."),
		'Text', T(728201607140, --[[StoryBit WindsOfChange_1_Expedition Text]] 'Meanwhile, the rogue nanites outside continue their merciless work to convert the Rocket and the crew inside to basic molecules for their unknown purposes.\n\n<effect>Finish the "Rogue Nanite Analysis" tech to help the on-site team and reduce the risk for their lives.'),
		'Enables', {
			"WindsOfChange_TamedWinds",
			"WindsOfChange_DustInTheWind",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "RogueNanitesAnalysis",
				'Cost', 3000,
			}),
			PlaceObj('DelayExpedition', {
				'Time', 7380000,
			}),
		},
	}),
})

