-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardResearchPoints', {
			'Amount', "<research_reward>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 2160000,
	Text = T(446294721798, --[[StoryBit LastFounder_TechReward Text]] '"This is my final transmission.\n\nI want to say that it has been a wild ride and I can\'t think of a better life worth living. I am sending what data I gathered along the journey while I am still within communication range. I think you may find some of it very interesting.\n\nIt has been an honor, Commander.\n\n<DisplayName> over and out!"\n\n<effect>Gained <research(research_reward)>'),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(840072913158, --[[voice:narrator]] "A transmission from the last Founder arrives:"),
	group = "Colonists",
	id = "LastFounder_TechReward",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_reward",
		'Value', 2000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(11043, --[[StoryBit LastFounder_TechReward Text]] "The honor has been mine!"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(11096, --[[StoryBit LastFounder_TechReward Text]] "See you on the other side, my friend."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(11097, --[[StoryBit LastFounder_TechReward Text]] "Thinking about the Colony until the very end. You are an inspiration to us all!"),
	}),
})

