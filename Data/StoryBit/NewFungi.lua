-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/14_fungal_farm.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "FungalFarm",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">=",
			'Amount', 2,
		}),
	},
	ScriptDone = true,
	Text = T(442647095971, --[[StoryBit NewFungi Text]] "The increased exposure of cosmic radiation is the possible culprit responsible for these mutations. \n\nSadly, the new fungi strain is not edible as it is highly toxic in its current state."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(615140244948, --[[StoryBit NewFungi Title]] "Fun With Fungi"),
	VoicedText = T(689726450611, --[[voice:narrator]] "A new species of fungi has been observed to grow amidst the regulated one we cultivate for food in our Fungal Farms."),
	group = "Buildings",
	id = "NewFungi",
	PlaceObj('StoryBitReply', {
		'Text', T(320109030450, --[[StoryBit NewFungi Text]] "Clear it out and check that no contamination has spread."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(204640976761, --[[StoryBit NewFungi CustomOutcomeText]] "Fungal Farms will require emergency maintenance"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "FungalFarm",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'State', "Malfunction",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(263059843131, --[[StoryBit NewFungi Text]] "Attempt to isolate the toxins and cultivate an edible sort."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(631539680817, --[[StoryBit NewFungi CustomOutcomeText]] "disables all Fungal Farms for <sols(duration)> Sols"),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"NewFungi_Aftermath",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "FungalFarm",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<duration>",
					}),
				},
			}),
		},
	}),
})

