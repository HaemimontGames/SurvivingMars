-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "ColdWaveStart",
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(965278902310, --[[StoryBit WinterWonderland_AccidentNoKids Text]] "Colonists have taken Martian snowball fights to the extreme, trying evermore dangerous stunts and maneuvers. \n\nIf you keep the recreational walks colonists will have a small chance for more serious injuries."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(293468065101, --[[StoryBit WinterWonderland_AccidentNoKids Title]] "Winter Wonderland"),
	Trigger = "ColdWave",
	VoicedText = T(462767291271, --[[voice:narrator]] "Two Colonists with broken limbs and guilty faces sit across your desk as you scold them about proper safety procedure."),
	group = "Disasters",
	id = "WinterWonderland_AccidentNoKids",
	PlaceObj('StoryBitReply', {
		'Text', T(493699503042, --[[StoryBit WinterWonderland_AccidentNoKids Text]] "Keep recreational walks."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WinterWonderland_SeriousAccident",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(736971564794, --[[StoryBit WinterWonderland_AccidentNoKids Text]] "Forbid recreational walks."),
	}),
})

