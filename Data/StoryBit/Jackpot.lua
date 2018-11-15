-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('RewardApplicants', {
			'Amount', "<tourists>",
			'Trait', "Tourist",
		}),
	},
	Enabled = true,
	Image = "UI/Messages/Events/09_fireworks.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Casino Complex",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Tourist",
				}),
			},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{542153446089, --[[StoryBit Jackpot Text]] "Even better, <DisplayName> turned out to be one of the more prominent vloggers out there. \n\nJudging by the 24 karat smile they sported when leaving the Casino, it's safe to say that our budding Martian tourism hit the jackpot as well.\n\n<effect><tourists> Tourists have been added in the Applicant pool."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{667316900647, --[[StoryBit Jackpot Title]] "Jackpot"},
	VoicedText = T{988968326869, --[[voice:narrator]] "A tourist from Earth has won the jackpot in one of our Casinos! "},
	group = "Buildings",
	id = "Jackpot",
	PlaceObj('StoryBitParamNumber', {
		'Name', "tourists",
		'Value', 100,
	}),
})

