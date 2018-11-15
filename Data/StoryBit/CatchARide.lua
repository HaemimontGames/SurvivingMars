-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/debris.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{774847634852, --[[StoryBit CatchARide Text]] "The car is very well preserved, it seems it survived the crash of the cargo pod quite well. It was supposed to be in Earth’s orbit, and we don’t know how it got here, but it’s a valuable historical discovery nonetheless."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{731877619105, --[[StoryBit CatchARide Title]] "Catch-a-Ride!"},
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T{362361515857, --[[voice:narrator]] "The expedition team found... a car. It’s an amazing – and amusing – discovery!"},
	group = "Expeditions",
	id = "CatchARide",
	PlaceObj('StoryBitReply', {
		'Text', T{923827459763, --[[StoryBit CatchARide Text]] "This belongs in a museum!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{201702445894, --[[StoryBit CatchARide CustomOutcomeText]] "+<tourists> Tourist Applicants"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourists>",
				'Trait', "Tourist",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{295160862366, --[[StoryBit CatchARide Text]] "We've received orders to not open the trunk."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{905794056631, --[[StoryBit CatchARide CustomOutcomeText]] "+ <funding(bailout_funding)> Funding"},
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "SpaceY",
		}),
		'Comment', "",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<bailout_funding>",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{263356377110, --[[StoryBit CatchARide Text]] "Place it on an auction"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{201642464034, --[[StoryBit CatchARide CustomOutcomeText]] "+<funding(auction_funding)> Funding"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<auction_funding>",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "auction_funding",
		'Value', 250000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "bailout_funding",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "tourists",
		'Value', 50,
	}),
})

