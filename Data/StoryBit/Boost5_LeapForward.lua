-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/17_omega_telescope.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(641536351314, --[[StoryBit Boost5_LeapForward Text]] "The folder implies that one of our mission imperatives is to setup the infrastructure and industry required to construct, operate and confirm the usefulness of an experimental device of epic proportions and wondrous effects. Constructing such a project on Earth is undesired, either because it poses too much danger, or because it cannot be hidden from prying eyes.\n\nYou read the title of the project again. Interesting..."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(442958318353, --[[StoryBit Boost5_LeapForward Title]] "Leap Forward"),
	VoicedText = T(572675005625, --[[voice:narrator]] "After the touchdown and the initial busy hours, you allow yourself a couple of hours to read the top-secret Big Red Folder which has been lying in your safe for a long time."),
	group = "Pre-Founder Stage",
	id = "Boost5_LeapForward",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880760,
				user = "Momchil",
			},
			{
				action = "Verified",
				time = 1549966942,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1549974157,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550489569,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551966285,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(837283599138, --[[StoryBit Boost5_LeapForward Text]] "Project Mohole."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(327107269772, --[[StoryBit Boost5_LeapForward CustomOutcomeText]] "reveals the tech enabling the Wonder Mohole Mine"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Robotics",
				'Tech', "ProjectMohole",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Robotics",
				'Research', "ProjectMohole",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(473822641251, --[[StoryBit Boost5_LeapForward Text]] "Dream Reality."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(407459351494, --[[StoryBit Boost5_LeapForward CustomOutcomeText]] "reveals the tech enabling the Wonder Project Morpheus"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Social",
				'Tech', "DreamReality",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Social",
				'Research', "DreamReality",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(943333178414, --[[StoryBit Boost5_LeapForward Text]] "Micro Fusion."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(826549039619, --[[StoryBit Boost5_LeapForward CustomOutcomeText]] "reveals the tech enabling the Wonder Artificial Sun"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "MicroFusion",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Physics",
				'Research', "MicroFusion",
				'Amount', 50,
			}),
		},
	}),
})

