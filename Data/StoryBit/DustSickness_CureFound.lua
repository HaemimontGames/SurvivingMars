-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "DustSickness",
				}),
			},
			'Effects', {
				PlaceObj('ModifyStatus', {
					'Status', "StatusEffect_UnableToWork",
					'Apply', false,
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "DustSickness",
				}),
			},
			'Effects', {
				PlaceObj('RemoveTrait', {
					'Trait', "DustSickness",
				}),
			},
		}),
	},
	Disables = {
		"DustSickness_GeneratSick",
		"DustSickness_GeneratSickNotWorking",
		"DustSickness_Deaths",
	},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<sponsor_bonus>",
		}),
	},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "DustSicknessCure",
		}),
	},
	ScriptDone = true,
	Text = T{366957194452, --[[StoryBit DustSickness_CureFound Text]] "Our sponsor is very happy with the result noting that this is further proof of the colony’s viability.\n\n<effect><sponsor_name> has provided us with <funding(sponsor_bonus)>"},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T{597844079973, --[[voice:narrator]] "The medical report on your desk is very positive and concludes that the Dust Sickness issue has been resolved permanently."},
	group = "Disasters",
	id = "DustSickness_CureFound",
	PlaceObj('StoryBitParamFunding', {
		'Name', "sponsor_bonus",
		'Value', 800000000,
	}),
})

