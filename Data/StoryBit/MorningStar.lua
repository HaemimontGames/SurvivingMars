-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	EnableChance = 20,
	Enabled = true,
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 50,
		}),
	},
	ScriptDone = true,
	Text = T(926491438625, --[[StoryBit MorningStar Text]] '"I want you to have something nice. Here’s the menu. No need to worry about the cost, okay?"\n\n<if(is_commander("psychologist"))>[<commander_profile>] This is a classic case of personality disorder. He needs my help.</if>'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(523495728078, --[[StoryBit MorningStar Title]] "Morning Star"),
	VoicedText = T(588086459461, --[[voice:narrator]] '"I am the Devil, and I have a proposal you might find intriguing." This bizarre statement comes from a rather unremarkable Colonist with a mischievous smile on his face.'),
	group = "Default",
	id = "MorningStar",
	PlaceObj('StoryBitReply', {
		'Text', T(730730746475, --[[StoryBit MorningStar Text]] "I don’t have time for this!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(866067648625, --[[voice:narrator]] '"A once in a lifetime opportunity, and you’re so quick to throw it away", he nods in disapproval, then leaves your office.'),
		'Text', T(404471535031, --[[StoryBit MorningStar Text]] "Strangely, the cameras outside pick no trace of him, and the later check throughout the colony finds no trace of him."),
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(336158371727, --[[StoryBit MorningStar Text]] "I will play your game, let’s see what you have to offer."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(236656828790, --[[StoryBit MorningStar CustomOutcomeText]] "make a choice"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MorningStar_3_SmallPunishment",
		},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_1_Choice",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(546260494664, --[[StoryBit MorningStar Text]] "Begone, Satan!"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "NewArk",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(474434798796, --[[voice:narrator]] "The strange man cries in anguish and rushes out of your office. "),
		'Text', T(752743149230, --[[StoryBit MorningStar Text]] "When you run a check on him, you find nothing in the colony records, and he is nowhere to be seen on the security cameras. Rather disturbing."),
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(127147080279, --[[StoryBit MorningStar Text]] "Color me intrigued, but let’s negotiate the terms."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(150040332640, --[[StoryBit MorningStar CustomOutcomeText]] "gain two choices"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MorningStar_4_BigPunishment",
		},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "MorningStar_2_Oligarh",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(583078978357, --[[StoryBit MorningStar Text]] "Very intriguing, let me call for my associates..."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(504618292001, --[[StoryBit MorningStar CustomOutcomeText]] "call security"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(238012824696, --[[voice:narrator]] "The security Officers apprehend the strange man. "),
		'Text', T(971061825016, --[[StoryBit MorningStar Text]] "He walks out without struggle, but later you find out that his cell is empty. He is nowhere to be found across the colony."),
		'Effects', {},
	}),
})

