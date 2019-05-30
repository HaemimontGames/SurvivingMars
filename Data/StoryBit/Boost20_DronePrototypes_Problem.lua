-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Enables = {
		"Boost20_DronePrototypes_Finale",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 900000,
	Text = T(706281186253, --[[StoryBit Boost20_DronePrototypes_Problem Text]] "We suspect that bad software from Alpenglow Robotix’s Drones has  propagated to all our Drone Controllers.\n\nAlpenglow Robotix had dropped their usual smug attitude and are apologizing profusely. They assure us that they are fast at work to remedy this."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(875811024973, --[[voice:narrator]] "Our Drones have begun malfunctioning all around at a pace far from normal."),
	group = "Pre-Founder Stage",
	id = "Boost20_DronePrototypes_Problem",
	max_reply_id = 2,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549882743,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549979481,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494341,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(690137564002, --[[StoryBit Boost20_DronePrototypes_Problem Text]] "Urge them to resolve the issues ASAP!"),
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(163705507745, --[[StoryBit Boost20_DronePrototypes_Problem Text]] "Why wait, I know how to fix this."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(908751128433, --[[voice:narrator]] "As all major software problems this one seems to have been caused by a typo."),
		'Text', T(119871411161, --[[StoryBit Boost20_DronePrototypes_Problem Text]] "Sometimes small mistakes lead to big problems. You fix the typo and the division by 0 errors cease. How did this pass through QA at all?\n\n<effect>Drones will no longer critically malfunction."),
		'Disables', {
			"Boost20_DronePrototypes_BreakDrone",
		},
		'Effects', {},
	}),
})

