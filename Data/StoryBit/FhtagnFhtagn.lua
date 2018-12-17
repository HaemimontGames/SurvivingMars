-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/05_mysterious_stranger.tga",
	Prerequisites = {
		PlaceObj('HasTrait', {
			'Trait', "Saint",
		}),
	},
	ScriptDone = true,
	Text = T(958075149698, --[[StoryBit FhtagnFhtagn Text]] "Since the Sanity breakdown, the words of <DisplayName> no longer spread the good message. They have become something evil, sinister, making people believe in an ultimate darkness, an endless void and an abyss inside of their souls. The colony has never before experienced such a crisis of faith!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(935924574357, --[[StoryBit FhtagnFhtagn Title]] "Sanity Breakdown - Fhtagn! Fhtagn!"),
	Trigger = "SanityBreakdown",
	VoicedText = T(650471133221, --[[voice:narrator]] "Something sinister happened in the mind and soul of one of our holiest of colonists who lost all faith."),
	group = "Sanity Breakdown",
	id = "FhtagnFhtagn",
	PlaceObj('StoryBitReply', {
		'Text', T(284485601937, --[[StoryBit FhtagnFhtagn Text]] "Expel the false prophet!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(783556988146, --[[StoryBit FhtagnFhtagn CustomOutcomeText]] "A Saint leaves the Colony, Morale penalty for all Colonists"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', -10,
						'Sols', 7200000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(444831335953, --[[StoryBit FhtagnFhtagn Text]] "Let’s wait it out."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(419533392202, --[[StoryBit FhtagnFhtagn CustomOutcomeText]] "Religious Colonists become Cowards"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Coward",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(215325815002, --[[StoryBit FhtagnFhtagn Text]] "Condemn the false teachings"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(400532623496, --[[StoryBit FhtagnFhtagn CustomOutcomeText]] "avoid bad effects"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "NewArk",
		}),
	}),
})

