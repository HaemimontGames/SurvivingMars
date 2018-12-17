-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/24_dome_in_ruins.tga",
	Prerequisites = {
		PlaceObj('SupplyMissionsEnabled', nil),
		PlaceObj('CheckColonistCount', {
			'Amount', 20,
		}),
	},
	ScriptDone = true,
	Text = T(920606145587, --[[StoryBit RedMars_1 Text]] 'After climbing the slope of a huge crater we have faced an astonishing sight – down below we saw the remains of a facility. Clearly a man-made one. The dust didn’t manage to hide the rocket landing pads, the spherical concrete buildings and – what’s most disturbing – the large port-holes on the ground which resemble rocket silos too much to be sure.\n\n<if(is_commander("politician"))>[<commander_profile>] You\'ve heard rumors about Cold War military projects on Mars. It\'s intriguing, but it can also be quite dangerous.</if>'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(982593047746, --[[StoryBit RedMars_1 Title]] "Red Mars"),
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T(762880757544, --[[voice:narrator]] "The expedition was sent to investigate a spectrographic trace of rich metals deposit, but found something much more interesting – and troubling!"),
	group = "Expeditions",
	id = "RedMars_1",
	PlaceObj('StoryBitReply', {
		'Text', T(313142929429, --[[StoryBit RedMars_1 Text]] "Leave and forget about it."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(562011922315, --[[StoryBit RedMars_1 CustomOutcomeText]] "The expedition will return"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(629772509563, --[[StoryBit RedMars_1 Text]] "Leave the site, but upload its coordinates in the international database."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"RedMars_2",
		},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(739189473025, --[[StoryBit RedMars_1 Text]] "Approach the facilities and investigate."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(403120348851, --[[voice:narrator]] "We approached the mysterious facility with apprehension, but nothing bad happened. It appears that the location has been abandoned decades ago."),
		'Text', T(712762981128, --[[StoryBit RedMars_1 Text]] "The facility has been picked almost clean, but there are still traces of evidence what happened here. People lived here, and research was conducted. The silos are empty, but there are signs that at least two of the five hosted nuclear devices. The labs are the most amazing part of the facility – most of the equipment and the computer systems were too heavy and unwieldy to be moved out of the planet.\n\n<effect>A new Breakthrough tech has become available. The expedition will return shortly."),
		'Enables', {
			"RedMars_3",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
})

