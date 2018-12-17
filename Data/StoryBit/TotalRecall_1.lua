-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('DelayExpedition', {
			'Time', 360000,
		}),
	},
	Delay = 180000,
	Effects = {},
	Enables = {
		"TotalRecall_2",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('IsCustomAnomaly', {
			'id', "QuaidExpedition",
		}),
	},
	ScriptDone = true,
	Text = T(157539573548, --[[StoryBit TotalRecall_1 Text]] "The epicenter of the tremors registers at the exact location where Douglas Quaid led the expedition team – and they aren’t responding!\n\n<effect>The Expedition is delayed."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(755914236195, --[[StoryBit TotalRecall_1 Title]] "Total Recall: Douglas Quaid, Come In!"),
	Trigger = "ExpeditionSent",
	VoicedText = T(415888092544, --[[voice:narrator]] "The vibrations shook the entire colony."),
	group = "Breakthroughs",
	id = "TotalRecall_1",
})

