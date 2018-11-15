-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ModifyLabel', {
			'Label', "Consts",
			'Prop', "PolymersPerFracture",
			'Percent', "<cost_reduction>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 2160000,
	Text = T{185343709639, --[[StoryBit DomeLeaks_6_Finale Text]] "The fault for the crack was in the design of our airlocks but the issue has been dealt with and repair teams are implementing the solution to all other domes.\n\nOne of our crafty colonists has found how to significantly improve the way we repair Dome leaks.\n\n<effect>Repair cost of Dome leaks reduced by <cost_reduction>% permanently"},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{626770172565, --[[voice:narrator]] "You smile as you read the latest report about the Dome damaged by the Dust Storm. Finally, something positive from this whole ordeal."},
	group = "Disasters",
	id = "DomeLeaks_6_Finale",
	PlaceObj('StoryBitParamPercent', {
		'Name', "cost_reduction",
		'Value', -50,
	}),
})

