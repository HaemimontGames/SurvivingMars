-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/dome.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "GeoscapeDome",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T{220760797492, --[[StoryBit GeoLife Text]] "The flourishing gardens mixed with the unavoidable exposure to particles of dust and radiation despite our best shielding efforts has helped certain bacteria that followed us on Mars to evolve in a completely new direction.\n\nThe new organism is harmless but standard decontamination protocols suggest that it should be removed."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{692959657151, --[[StoryBit GeoLife Title]] "Geo Life"},
	VoicedText = T{418142763479, --[[voice:narrator]] "The unique mixture of habitat conditions within the GeoDome has resulted in a new kind of bacterial life form evolving."},
	group = "Wonders",
	id = "GeoLife",
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_loss",
		'Value', -20,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{774357050689, --[[StoryBit GeoLife Text]] "Follow the protocol and sterilize the Geodome, perhaps there is an unseen danger there."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{816903284390, --[[StoryBit GeoLife CustomOutcomeText]] "Colonists in the Geo Dome lose <comfort_loss> Comfort"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "GeoscapeDome",
				'Conditions', {},
			}),
			PlaceObj('ForEachResident', {
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_loss>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{432642667402, --[[StoryBit GeoLife Text]] "Observe the life cycle of the organism in the Geodome ecosystem - this is a unique opportunity to learn!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 75,
		'Enables', {
			"GeoLife_GainResearch",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Enables', {
			"GeoLife_Fail",
		},
		'Effects', {},
	}),
})

