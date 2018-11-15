-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/17_omega_telescope.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 300,
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<funding_cost>",
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Physics",
			'TechId', "InterplanetaryAstronomy",
			'Status', "unknown",
		}),
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"NASA",
				"ESA",
				"paradox",
				"Japan",
			},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{832230328642, --[[StoryBit Stargazer Text]] 'He needs to secure the lump sum of <funding(funding_cost)> in order to realize a "revolutionary instrument", designed to reveal the secrets of the Cosmos. \n\nDespite his impeccable reputation, however, the lack of direct monetary application for the technology has made securing the funds on Earth quite difficult.\n\nWhen the prototype phase has been completed, he will share the blueprints for the device with us.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{658687217467, --[[StoryBit Stargazer Title]] "Stargazer"},
	VoicedText = T{803006030576, --[[voice:narrator]] "Rayan Cox – an astrophysicist of some renown, has reached us with a proposition which he describes as being mutually beneficial."},
	group = "Sponsor",
	id = "Stargazer",
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_cost",
		'Value', 2000000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{334394643068, --[[StoryBit Stargazer Text]] "We owe our very existence to such innovations. Secure the funds needed."},
		'Cost', "<funding_cost>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Stargazer_Discover",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{251249791135, --[[StoryBit Stargazer Text]] "Money, sadly, is also a tool in our survival playbook – a tool we need a lot."},
	}),
})

