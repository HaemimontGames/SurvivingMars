-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "RocketLandingAttempt",
	Effects = {},
	EnableChance = 30,
	Enabled = true,
	Image = "UI/Messages/Events/21_meteors.tga",
	NotificationText = "",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "AllRockets",
			'Filters', {},
			'Condition', ">=",
			'Amount', 2,
		}),
		PlaceObj('IsSolInRange', {
			'Min', 10,
			'Max', 200,
		}),
		PlaceObj('IsRocketType', {
			'Type', "Cargo",
		}),
		PlaceObj('IsSupplyPod', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T{975948320076, --[[StoryBit BadRocketLanding Text]] "Our <DisplayName> Rocket seems to have suffered a malfunction in her fuel tank. There are worries that the Rocket won’t survive the landing sequence.\n\nIf the Rocket lands successfully we can fix the malfunction with some polymers."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{566155432260, --[[StoryBit BadRocketLanding Title]] "Rocket Malfunction"},
	Trigger = "RocketLandAttempt",
	VoicedText = T{334816819426, --[[voice:narrator]] "The satellite camera shows the rocket you are trying to land in standard Mars orbit. A small jet of liquid is gushing out from the side."},
	group = "Rocket",
	id = "BadRocketLanding",
	PlaceObj('StoryBitReply', {
		'Text', T{277165707548, --[[StoryBit BadRocketLanding Text]] "Attempt the landing with full payload."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{410458673918, --[[StoryBit BadRocketLanding CustomOutcomeText]] "chance that the rocket will explode"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Text', T{107166396798, --[[StoryBit BadRocketLanding Text]] "Unfortunately the malfunction affected our rocket’s landing trajectory and threw her off course resulting in a crash landing. We have lost both the rocket and her cargo."},
		'Effects', {
			PlaceObj('EraseObject', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{453335601416, --[[StoryBit BadRocketLanding Text]] "Jettison the payload, then land."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{293832717522, --[[StoryBit BadRocketLanding CustomOutcomeText]] "safe landing but cargo is lost"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DeleteCargo', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{891532965126, --[[StoryBit BadRocketLanding Text]] "Activate manual control, I can land this one safely."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{896111041996, --[[StoryBit BadRocketLanding CustomOutcomeText]] "rocket will land safely with cargo"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
	}),
})

