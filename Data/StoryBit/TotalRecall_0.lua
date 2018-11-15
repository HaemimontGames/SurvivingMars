-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "AlienImprints",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{724010603535, --[[StoryBit TotalRecall_0 Text]] "“My whole life I felt like I had to go to Mars. I’ve kept dreaming about a place and now I have the money to do it. But I need your aid. Something big has got to be on these coordinates!”\n\nAll in all, Douglas Quaid wants you to organize an expedition to the coordinates where his little craft would land. What would happen there is anyone's guess..."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{746411257431, --[[StoryBit TotalRecall_0 Title]] "Total Recall"},
	VoicedText = T{713961405371, --[[voice:narrator]] "You are contacted by Douglas Quaid, a strong-built Earthling with a thick accent. His request seems nonsensical, but somehow you feel that you trust the guy."},
	group = "Breakthroughs",
	id = "TotalRecall_0",
	PlaceObj('StoryBitReply', {
		'Text', T{253414308741, --[[StoryBit TotalRecall_0 Text]] "Accept their proposal"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{489753962458, --[[voice:narrator]] "Douglas Quaid nods in approval and rewards you with a wide charming smile."},
		'Text', T{797667150200, --[[StoryBit TotalRecall_0 Text]] "He then sends you the coordinates of the spot where he will land. Now, it’s up to you to hold your promise.\n\n<effect>A new Planetary Anomaly “Quaid Expedition” has been added. Send an expedition to it to follow Douglas Quaid’s sixth sense."},
		'Enables', {
			"TotalRecall_1",
		},
		'Effects', {
			PlaceObj('CreatePlanetaryAnomaly', {
				'id', "QuaidExpedition",
				'display_name', T{11391, --[[StoryBit TotalRecall_0 display_name]] "Quaid Expedition"},
				'description', T{11392, --[[StoryBit TotalRecall_0 description]] "Rendezvous with Douglas Quaid to help him follow his sixth sense."},
				'required_crew', 5,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{623294854487, --[[StoryBit TotalRecall_0 Text]] "Decline"},
	}),
})

