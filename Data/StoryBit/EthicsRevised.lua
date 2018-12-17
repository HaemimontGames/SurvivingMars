-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"ESA",
				"NASA",
				"paradox",
				"Japan",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 100,
		}),
		PlaceObj('CountTechsResearched', {
			'Filters', {},
			'Condition', "<=",
			'Amount', 40,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(11057, --[[StoryBit EthicsRevised Text]] "Based on personal notes and research done by the scientist in question, strong arguments have been laid down why a practice of testing certain experimental techs on volunteers could present a serious boost to our science program. \n\nWhile the thesis is solid, the danger of lethal consequences for any volunteer is non-negligible. Traditionally, such experiments are never conducted on human subjects. Still - as the work puts it – maybe a new planet calls for a new mentality."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(403809507224, --[[StoryBit EthicsRevised Title]] "Ethics Revisited"),
	VoicedText = T(301654725811, --[[voice:narrator]] "A peculiar thesis has been submitted by one of our scientists - anonymously."),
	group = "Sponsor",
	id = "EthicsRevised",
	PlaceObj('StoryBitReply', {
		'Text', T(376978499489, --[[StoryBit EthicsRevised Text]] "Keeping our science one step ahead is our primary goal. Test the thesis."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(381805118805, --[[StoryBit EthicsRevised CustomOutcomeText]] "Research will be boosted for the next 20 Sols"),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "rp_boost",
		'Value', 40,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"EthicsRevised_Finale",
			"EthicsRevised_KillColonists",
			"EthicsRevised_EarlyExit",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "ResearchBuildings",
				'Prop', "ResearchPointsPerDay",
				'Percent', "<rp_boost>",
				'ModifyId', "EthicsRevised",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(976701159276, --[[StoryBit EthicsRevised Text]] "Never approach me with such unethical suggestion again!"),
	}),
})

