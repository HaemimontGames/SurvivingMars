-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('EraseColonist', nil),
		PlaceObj('ModifyLabel', {
			'Label', "Colonist",
			'Prop', "base_morale",
			'Amount', "<morale_penalty>",
			'Sols', "<morale_penalty_sols>",
		}),
	},
	Effects = {},
	Image = "UI/Messages/Events/20_crashed_rocket.tga",
	Prerequisites = {},
	ScriptDone = true,
	SelectObject = false,
	Text = T(387680587744, --[[StoryBit FlatMars_Outcome2 Text]] "<DisplayName> did not survive."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(590394667104, --[[voice:narrator]] "The improvised aircraft lifts off with the Flat Mars Society leader onboard, rapidly loses speed and then quite expectedly comes down crashing."),
	group = "Colonists",
	id = "FlatMars_Outcome2",
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_sols",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(164997666030, --[[StoryBit FlatMars_Outcome2 Text]] "Think what you will, but in the end, you can’t really cherry-pick your physics."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(808985801048, --[[StoryBit FlatMars_Outcome2 Text]] "The flawed idea killed them as much as the flawed vehicle."),
	}),
})

