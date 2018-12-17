-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "scientist",
			'Filters', {},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Sanity",
					'Amount', "<sanity_penalty>",
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_penalty>",
					'Sols', 3600000,
				}),
			},
		}),
		PlaceObj('RewardResearchPoints', {
			'Amount', "<research>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(679536744432, --[[StoryBit Shocky_FollowUp2 Text]] "The researchers came up with a confirmation of the theory that parallel universes exist and even though some of them are similar to ours, others are horrifying. The mind of <DisplayName> could not bear this knowledge.\n\n<effect>3 Scientists lost Sanity. We gained 4000 Research."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(199666886433, --[[StoryBit Shocky_FollowUp2 Title]] "Shocky"),
	VoicedText = T(799196876014, --[[voice:narrator]] "The boy who had an “imaginary friend” thrashes and speaks gibberish, restrained in the lab chair. "),
	group = "Colonists",
	id = "Shocky_FollowUp2",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_penalty",
		'Value', -50,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research",
		'Value', 4000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Idiot",
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding",
		'Value', 400000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(789110405274, --[[StoryBit Shocky_FollowUp2 Text]] "This is disturbing. Stop the project and send all data to our Sponsor."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(803516496901, --[[StoryBit Shocky_FollowUp2 CustomOutcomeText]] "gain <funding(funding)> funding"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(233212625454, --[[StoryBit Shocky_FollowUp2 Text]] "Everything is acceptable in the name of science. Continue the research!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(876609466165, --[[StoryBit Shocky_FollowUp2 CustomOutcomeText]] "unknown consequences"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Shocky_FollowUp3",
		},
		'Effects', {},
	}),
})

