-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PickFromLabelEffect', {
			'Label', "GeoscapeDome",
			'Conditions', {},
		}),
		PlaceObj('SetBuildingEnabledState', {
			'Duration', "<disable_duration>",
		}),
	},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T(623050970123, --[[StoryBit GeoLife_Fail Text]] "We are forced to evacuate all Colonists until the Dome has been sterilized.\n\n<effect>Geoscape Dome will be closed off for <sols(disable_duration)> Sols."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(834271547167, --[[voice:narrator]] "Crucial life-support modules of the Dome are infected with the new bacteria discovered earlier, and their functionality hindered. "),
	group = "Wonders",
	id = "GeoLife_Fail",
	PlaceObj('StoryBitParamSols', {
		'Name', "disable_duration",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(987539322682, --[[StoryBit GeoLife_Fail Text]] "Organize the evacuation!"),
	}),
})

