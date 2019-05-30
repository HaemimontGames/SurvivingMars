-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Clone",
				}),
				PlaceObj('HasTrait', {
					'Trait', "security",
				}),
			},
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
		PlaceObj('RewardFunding', {
			'Amount', "<final_gift>",
		}),
	},
	Prerequisites = {
		PlaceObj('CheckColonistCount', {
			'Trait', "Clone",
		}),
	},
	ScriptDone = true,
	Text = T(490996575503, --[[StoryBit Boost6_SafeKeeping_Complication Text]] 'If it was a bomb it would have exploded by now, so you decide to risk it. You open the package and find a couple of notes. The first one is a check for quite the sum. The other one is a letter.\n\n"Commander, we\'re grateful for your aid in the past. But we cannot live peacefully. We were designed to fight, to conquer. And we will. Some day we could be enemies, but for now, while we\'re friends, accept our final gift. And from now on we\'re even."\n\n<effect>All Officer Clones become Renegades. You have received <funding(final_gift)> Funding.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(276265920333, --[[StoryBit Boost6_SafeKeeping_Complication Title]] "Safe Keeping: Thirteen"),
	VoicedText = T(957141285922, --[[voice:narrator]] "The imposing Clone intercepts you in the dark alley. He throws you a package and vanishes."),
	group = "Pre-Founder Stage",
	id = "Boost6_SafeKeeping_Complication",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880826,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549985071,
				user = "Lina",
			},
			{
				action = "Verified",
				time = 1549985121,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550489865,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "final_gift",
		'Value', 100000000,
	}),
})

