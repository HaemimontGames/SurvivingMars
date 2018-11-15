-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardTech', {
			'Field', "Physics",
			'Research', "InterplanetaryAstronomy",
		}),
	},
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Physics",
			'TechId', "InterplanetaryAstronomy",
			'Negate', true,
		}),
	},
	ScriptDone = true,
	SuppressTime = 14400000,
	Text = T{11060, --[[StoryBit Stargazer_Discover Text]] "Forever grateful, he shared the technology with us.\n\n<effect>The Interplanetary Astronomy tech has been researched. You can now construct the Omega Telescope wonder."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{713641615068, --[[voice:narrator]] "Rayan Cox - the astrophysicist whose project we financed a while back – has let us know the technology he was working on has successfully passed the prototype phase."},
	group = "Sponsor",
	id = "Stargazer_Discover",
	PlaceObj('StoryBitReply', {
		'Text', T{675935718782, --[[StoryBit Stargazer_Discover Text]] "Great news!"},
	}),
})

