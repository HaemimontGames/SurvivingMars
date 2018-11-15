-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 300000,
	Effects = {},
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{900842586317, --[[StoryBit TotalRecall_2 Text]] "The expedition landed at their coordinates, and after a short search Douglas Quaid came across a vast underground cave. There they found the immense alien artifact, some sort of a machine.\n\nQuaid approached it and pressed something which started the machine. The tremors caused the rock to cave in, nearly burying the team alive, but they made it to safety!\n\nThe artifact somehow generated or revealed previously unknown resources, making Mars a bit more hospitable for sentient beings. Of course, Douglas Quaid chose exactly what we needed!"},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{842584071122, --[[StoryBit TotalRecall_2 Title]] "Total Recall: The Artifact"},
	VoicedText = T{367201816141, --[[voice:narrator]] "Douglas Quaid, reporting in! The expedition team is alive, and their report seems like something out of a movie!"},
	group = "Breakthroughs",
	id = "TotalRecall_2",
	PlaceObj('StoryBitReply', {
		'Text', T{497246459059, --[[StoryBit TotalRecall_2 Text]] "More Water is always a good idea!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{889099441161, --[[StoryBit TotalRecall_2 CustomOutcomeText]] "new Water Deposits are revealed"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Amount', 5,
				'Resource', "Water",
				'ResourceAmount', 25000000,
				'Grade', "Very High",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{447844453182, --[[StoryBit TotalRecall_2 Text]] "Those Metal veins will help us expand for sure!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{541025465075, --[[StoryBit TotalRecall_2 CustomOutcomeText]] "new Metals Deposits are revealed"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Amount', 5,
				'ResourceAmount', 25000000,
				'Grade', "Very High",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{138266796286, --[[StoryBit TotalRecall_2 Text]] "Rare Metals would always be of use!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{806799409644, --[[StoryBit TotalRecall_2 CustomOutcomeText]] "new Rare Metals Deposits are revealed"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Amount', 3,
				'Resource', "PreciousMetals",
				'ResourceAmount', 25000000,
				'Grade', "Very High",
			}),
		},
	}),
})

