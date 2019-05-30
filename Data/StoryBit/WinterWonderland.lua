-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "ColdWaveStart",
	Delay = 120000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/19_frozen_landscape.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 120,
		}),
		PlaceObj('AreDomesOpen', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T(292383748563, --[[StoryBit WinterWonderland Text]] "It has become a somewhat common occurrence for colonists to sneak outside of Domes and have some fun in the frost. It goes against at least half a dozen regulations but it’s been overlooked until now.\n\nIf you allow recreational walks outside the dome many colonists will gain a permanent <perm_morale_boost> Morale bonus but may suffer an occasional injury."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(306790072541, --[[StoryBit WinterWonderland Title]] "Winter Wonderland"),
	Trigger = "ColdWave",
	VoicedText = T(773713262024, --[[voice:narrator]] "As you gaze out of the dome glass you witness something unexpected outside. A group of colonists in their space suits are having a low gravity snowball fight."),
	group = "Disasters",
	id = "WinterWonderland",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550844947,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "perm_morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "boosted_colonists",
		'Value', 60,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(897209700313, --[[StoryBit WinterWonderland Text]] "I want to try that!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(780847663505, --[[StoryBit WinterWonderland CustomOutcomeText]] "allow the recreational walks"),
		'Comment', "Keep in mind that some of the events after this one are not inheritated and must have custom titles",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WinterWonderland_AccidentKids",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomPercent', "<boosted_colonists>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<perm_morale_boost>",
						'ModifyId', "WinterWonderland",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(724620138664, --[[StoryBit WinterWonderland Text]] "This is not safe for children."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(481636825357, --[[StoryBit WinterWonderland CustomOutcomeText]] "allow only adults to exit the Domes for recreation"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WinterWonderland_AccidentNoKids",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomPercent', "<boosted_colonists>",
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<perm_morale_boost>",
						'ModifyId', "WinterWonderland",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(847752247439, --[[StoryBit WinterWonderland Text]] "Sorry to be a killjoy, but this is too dangerous!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(913726665587, --[[StoryBit WinterWonderland CustomOutcomeText]] "forbid the recreational walks"),
	}),
})

