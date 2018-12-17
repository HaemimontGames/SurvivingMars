-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<money>",
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Casino Complex",
			'InDome', true,
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(866418015721, --[[StoryBit HostageSituation Text]] "With a homemade explosive in their possession and extremely stressed out, <DisplayName> has the following demands:\n\n<funding(money)> to be transferred to an unknown account in crypto currency and a Rover with which to escape to some unknown destination."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(242077290835, --[[StoryBit HostageSituation Title]] "Renegades: Hostage Situation"),
	VoicedText = T(768660382627, --[[voice:narrator]] "A crisis has arisen in one of our Casinos. A Renegade has taken hostages inside the building."),
	group = "Renegades",
	id = "HostageSituation",
	PlaceObj('StoryBitParamFunding', {
		'Name', "money",
		'Value', 550000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(800303021855, --[[StoryBit HostageSituation Text]] "An explosive will endanger the entire Dome. Give them what they want."),
		'Cost', "<money>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "HostageSituation_Suicide",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(338508633880, --[[StoryBit HostageSituation Text]] "We will not negotiate with terrorists. Denied!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "HostageSituation_BlowUp",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(982733721236, --[[StoryBit HostageSituation Text]] "Send the money but apprehend the suspect as they head towards the Rover."),
		'Cost', "<money>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "HostageSituation_Suicide",
			}),
		},
	}),
})

