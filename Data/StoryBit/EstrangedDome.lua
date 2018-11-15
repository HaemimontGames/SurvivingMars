-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('SetBuildingRogueState', nil),
	},
	Category = "Tick_FounderStageDone",
	Comment = "Dome name should be added in the text as parameter",
	Effects = {},
	Enabled = true,
	Enables = {
		"EstrangedDome_FollowUp",
	},
	Image = "UI/Messages/emergency.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 15,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Dome",
			'Conditions', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {},
					'Condition', ">",
					'Amount', 0,
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{742843343523, --[[StoryBit EstrangedDome Text]] "A list of absurd and highly unpractical, not to mention impossible, demands has been forwarded to you.\n\nIf you fail to comply, they shall declare the <DisplayName> Dome independent from the rest of our colony. How that will happen, as they will be very much so dependent on us for Oxygen, Water and Power - to say the least - is beyond you."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{820857660745, --[[StoryBit EstrangedDome Title]] "Renegades: Estranged Dome"},
	VoicedText = T{394655193067, --[[voice:narrator]] "Our Renegade issues have escalated within one of our Domes."},
	group = "Renegades",
	id = "EstrangedDome",
	PlaceObj('StoryBitReply', {
		'Text', T{207450118153, --[[StoryBit EstrangedDome Text]] "*lie* We will comply."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{123734051979, --[[voice:narrator]] "They saw through your bluff so easily, as if refusing their demands was part of the plan."},
		'Text', T{495543817221, --[[StoryBit EstrangedDome Text]] "They declare the Dome independent.\n\n<effect>The Dome <DisplayName> has gone rogue!"},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{443370921894, --[[StoryBit EstrangedDome Text]] "Give them time, they'll come around."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{986617485708, --[[voice:narrator]] "They declare the Dome to be an independent colony on Mars."},
		'Text', T{790348877049, --[[StoryBit EstrangedDome Text]] "We have been stripped off all access to it.\n\n<effect>The Dome <DisplayName> has gone rogue!"},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{217345901457, --[[StoryBit EstrangedDome Text]] "Threaten to stop the power of their Dome."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{757866311292, --[[voice:narrator]] '"If you have fallen so low, then we are willing to risk it. This is the reason we are declaring independence to begin with."'},
		'Text', T{147584482526, --[[StoryBit EstrangedDome Text]] "We have been stripped off all access to the Dome.\n\n<effect>The Dome <DisplayName> has gone rogue!"},
		'Effects', {},
	}),
})

