-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	NotificationText = "",
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 14400000,
	Text = T{676081651688, --[[StoryBit MorningStar_4_BigPunishment Text]] 'The Devil is sitting in your chair, with his feet on your desk and the naughtiest smile on his face. He looks you straight into the eye and you feel a cold creep up your spine.\n\n"I\'m a nice devil and I will want but a small price in return for my favors. Just the souls of some of your people. Come on, so many leaders over the years had done this choice with ease, what\'s so hard about it?"'},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{112668165551, --[[voice:narrator]] '"We made a deal, do you remember? Of course you do, you\'re a smart one! Now, time to pay your check!"'},
	group = "Default",
	id = "MorningStar_4_BigPunishment",
	PlaceObj('StoryBitParamNumber', {
		'Name', "death_toll_colonists",
		'Value', 15,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{770317560511, --[[StoryBit MorningStar_4_BigPunishment Text]] "The deal is off!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{802900002061, --[[voice:narrator]] '"Oh, a sudden change of heart? No worries, I would claim these souls myself!"'},
		'Text', T{815577155093, --[[StoryBit MorningStar_4_BigPunishment Text]] "His laughter hasn't even faded away and the sky is cracked by a large meteor that hits near the colony. Then they begin to fall, one after another. So, that's his way of saying \"goodbye\"...\n\n<effect>A Meteor Storm has started atop your colony!"},
		'Effects', {
			PlaceObj('StartDisaster', {
				'Disaster', "Meteors",
				'Meteors', "storm",
				'Label', "Dome",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{250602475040, --[[StoryBit MorningStar_4_BigPunishment Text]] "Granted!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{768705472263, --[[voice:narrator]] '"Good, good! Let the others suffer, who cares?" He laughs maniacally and clicks his fingers.'},
		'Text', T{935375487698, --[[StoryBit MorningStar_4_BigPunishment Text]] "The comm channels in your office start ringing - multiple death reports from the colony. People has dropped as they walked and talked to others. Everyone are in shock. That's a lot of falsified reports you have to file in, now, but people can't know how or why they died...\n\n<effect><death_toll_colonists> Colonists have died."},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', "<death_toll_colonists>",
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Health",
						'Amount', -100,
					}),
				},
			}),
		},
	}),
})

