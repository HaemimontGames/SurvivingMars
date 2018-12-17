-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Image = "UI/Messages/rocket.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(857365435422, --[[StoryBit TheFloorIsLava2 Text]] "The region seems to be formed by a massive eruption or another cataclysmic event, as the very crust of the planet is folded and cracked unlike anything we’ve seen so far. Just below the jagged rocks lie rich ore veins. The expedition starts loading the Rocket when a terrible truth is discovered – the rocket has expended too much fuel to make it back with its cargo!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(633393342047, --[[StoryBit TheFloorIsLava2 Title]] "The Floor is Lava"),
	VoicedText = T(588315332898, --[[voice:narrator]] "After circling around the designated coordinates, the Rocket finds a good spot and lands."),
	group = "Expeditions",
	id = "TheFloorIsLava2",
	PlaceObj('StoryBitReply', {
		'Text', T(123180942234, --[[StoryBit TheFloorIsLava2 Text]] "Throw out the cargo and return!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(764217461614, --[[StoryBit TheFloorIsLava2 CustomOutcomeText]] "the expedition will return"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(740425130913, --[[StoryBit TheFloorIsLava2 Text]] "Try to deliver a portion of the cargo."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(346346941018, --[[StoryBit TheFloorIsLava2 CustomOutcomeText]] "unknown consequences"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(601482353039, --[[voice:narrator]] "On the way home the rocket lost altitude and crashed down."),
		'Text', T(838271915959, --[[StoryBit TheFloorIsLava2 Text]] "Nothing could have survived the titanic explosion!\n\n<effect>The expedition has been lost."),
		'Effects', {
			PlaceObj('KillExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "polymer_scraps",
		'Value', 100000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T(717011337668, --[[voice:narrator]] "The rocket takes off and heads home. Everybody is worried, but the mighty vehicle manages to keep its altitude during the most crucial stage of the flight."),
		'Text', T(679210888942, --[[StoryBit TheFloorIsLava2 Text]] "<effect>The expedition will return with <polymers(polymer_scraps)>."),
		'Effects', {
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 100000,
				'resource', "Polymers",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
})

