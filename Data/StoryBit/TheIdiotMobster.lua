-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('CauseFault', {
			'Grid', "water",
		}),
		PlaceObj('KillColonist', nil),
	},
	Enabled = true,
	Enables = {},
	Image = "UI/Messages/Events/11_idiot.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{200476780738, --[[StoryBit TheIdiotMobster Text]] '"If you don\'t want to see the people of this colony left without Water to drink, you must do exactly as I say! First I need a Rocket! Then I need $500 million..."\n\nThe video abruptly ends there.\n\nA team of investigators is sent immediately and they found the following:\n\nThe lifeless body of <DisplayName>, next to a pipe leak. Cause of death - the premature explosion of some poorly made explosive device.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{630508737382, --[[StoryBit TheIdiotMobster Title]] "Renegades: Darwin Nominee"},
	VoicedText = T{383800392456, --[[voice:narrator]] "You receive a video message:"},
	group = "Renegades",
	id = "TheIdiotMobster",
	PlaceObj('StoryBitReply', {
		'Text', T{601436842622, --[[StoryBit TheIdiotMobster Text]] "Carry on..."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {},
	}),
})

