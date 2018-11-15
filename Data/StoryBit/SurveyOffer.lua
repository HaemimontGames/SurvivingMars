-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"BlueSun",
				"CNSA",
				"ISRO",
				"Roscosmos",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 100,
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<cost>",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{11061, --[[StoryBit SurveyOffer Text]] 'They are willing to share the patent for their "one of a kind" device that can discover previously undetectable underground deposits of Metals and Rare Metals.\n\nStill, they are asking for a substantial amount of money.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{815573030668, --[[StoryBit SurveyOffer Title]] "Survey Offer"},
	VoicedText = T{782006197574, --[[voice:narrator]] "A recent successful startup company from Earth has made us an offer. "},
	group = "Sponsor",
	id = "SurveyOffer",
	PlaceObj('StoryBitParamFunding', {
		'Name', "cost",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{872501768890, --[[StoryBit SurveyOffer Text]] "This may be pure gold. Literally. Accept!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{689029525688, --[[StoryBit SurveyOffer CustomOutcomeText]] "new deposits will be discovered"},
		'Cost', "<cost>",
		'Comment', "change the action for taking money to the new one when it is done",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Amount', 4,
				'ResourceAmount', 750000,
				'Grade', "High",
			}),
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Amount', 2,
				'Resource', "PreciousMetals",
				'ResourceAmount', 500000,
				'Grade', "High",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{196309292602, --[[StoryBit SurveyOffer Text]] 'How much? We’ll come up with our tech to replicate their "one of a kind" device.'},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{465942259497, --[[StoryBit SurveyOffer CustomOutcomeText]] "new research will be made available"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
		'Comment', "remember to check the tech texts",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"SurveyOffer_TechEffect",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "SurveyOffer",
				'Cost', 10000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{164261601841, --[[StoryBit SurveyOffer Text]] "Their asking price outweighs the benefits. Politely decline."},
	}),
})

