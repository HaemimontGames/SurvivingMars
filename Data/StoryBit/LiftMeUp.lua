-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/rocket.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{186317965668, --[[StoryBit LiftMeUp Text]] "Only through sheer luck the Rocket managed to make an emergency landing on a safe spot, but even now there are no signs that the engine could start working again."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{188954210890, --[[StoryBit LiftMeUp Title]] "Lift Me Up"},
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T{440009087756, --[[voice:narrator]] "During flight to the Anomaly site, the engine stalled and the Rocket began losing altitude."},
	group = "Expeditions",
	id = "LiftMeUp",
	PlaceObj('StoryBitReply', {
		'Text', T{437116028960, --[[StoryBit LiftMeUp Text]] "Abandon the expedition."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{251910959995, --[[StoryBit LiftMeUp CustomOutcomeText]] "the expedition will be lost"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('KillExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{966429692667, --[[StoryBit LiftMeUp Text]] "Send three rescue supply pods with replacement parts."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{474201552955, --[[StoryBit LiftMeUp CustomOutcomeText]] "pay Funding, the expedition will be saved"},
		'Cost', 550000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{628172516220, --[[StoryBit LiftMeUp Text]] "Send me the schematics, and put the expedition team on comm."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{521042853228, --[[StoryBit LiftMeUp CustomOutcomeText]] "the expedition will be saved"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
})

