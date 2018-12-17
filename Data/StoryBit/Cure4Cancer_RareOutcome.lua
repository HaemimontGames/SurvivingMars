-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "TechResearched",
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_boost>",
					'Sols', "<morale_boost_duration>",
				}),
			},
		}),
		PlaceObj('RewardApplicants', {
			'Amount', "<applicants>",
		}),
		PlaceObj('RewardFunding', {
			'Amount', "<funding_reward>",
		}),
	},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "Cure4Cancer",
		}),
	},
	ScriptDone = true,
	Text = T(712056810620, --[[StoryBit Cure4Cancer_RareOutcome Text]] "A promising breakthrough has been made in the fight against cancer – in large part based on research done here, in our own Martian labs. While not entirely ridding us of cancer, the new drug will dramatically reduce the lethality of the horrific disease.\n\n<DisplayName> has been nominated for a Nobel Prize in medical research, followed by a flood of donations and new applicants wanting to become part of our colony.\n\n<effect>+<morale_boost> Morale for the next <sols(morale_boost_duration)> Sols; <applicants> Applicants; <funding(funding_reward)> Funding."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T(160216156691, --[[voice:narrator]] "Everyone on Mars is standing tall today, filled with pride beyond expression. "),
	group = "Sponsor",
	id = "Cure4Cancer_RareOutcome",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicants",
		'Value', 200,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_reward",
		'Value', 1000000000,
	}),
})

