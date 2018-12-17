-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'InDome', true,
			'Filters', {},
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
		PlaceObj('SetBuildingRogueState', nil),
		PlaceObj('RenameAssociatedObject', {
			'Name', T(863612972268, --[[StoryBit TheRogueDome Name]] "First Martian Republic"),
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Enables = {
		"TheRogueDome_Dead",
		"TheRogueDome_Clear",
	},
	Image = "UI/Messages/emergency.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Dome",
			'Conditions', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {
						PlaceObj('HasTrait', {
							'Trait', "Renegade",
						}),
					},
					'Condition', ">=",
					'Amount', 25,
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(918977694838, --[[StoryBit TheRogueDome Text]] "<effect>All residents of <DisplayName> Dome have been converted to Renegades. The Dome is Quarantined. You are no longer allowed to build any construction there or interact with the Dome or its buildings."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(678491819363, --[[StoryBit TheRogueDome Title]] "Renegades: The Rogue Dome"),
	VoicedText = T(663315412307, --[[voice:narrator]] "One of our Domes has gone rogue! The population has declared independence and dubbed themselves the First Martian Republic."),
	group = "Renegades",
	id = "TheRogueDome",
	PlaceObj('StoryBitReply', {
		'Text', T(942765339346, --[[StoryBit TheRogueDome Text]] "This is madness! We are dependent on each other and they have no chance on their own."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(900504002510, --[[StoryBit TheRogueDome Text]] "This is their right! We can only hope that we will again manage to see each other eye to eye in the future!"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(532763989295, --[[StoryBit TheRogueDome Text]] "Traitors! If they are not true to the ideals of our Colony, they will receive no support from us!"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(515755842460, --[[StoryBit TheRogueDome Text]] "I am certain that a diplomatic solution will present itself in time."),
	}),
})

