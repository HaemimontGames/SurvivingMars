-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/04_interrogation.tga",
	Prerequisites = {
		PlaceObj('PickResident', {
			'ParentBuildingLabel', "Arcology",
			'ResidentConditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
					'Negate', true,
				}),
			},
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "HiveMind",
		}),
	},
	ScriptDone = true,
	Text = T{885768471792, --[[StoryBit FreeWill_0 Text]] "Luckily for the victim, <DisplayName> botched the assault attempt and failed to cause any harm, but this doesn't mean that the incident should be ignored."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{469675213846, --[[StoryBit FreeWill_0 Title]] "Free Will "},
	VoicedText = T{880492504830, --[[voice:narrator]] "An Arcology resident has committed an armed assault against another Colonist! This is a rather strange case as nothing in the perpetrator’s file suggests a criminal intent."},
	group = "Breakthroughs",
	id = "FreeWill_0",
	PlaceObj('StoryBitReply', {
		'Text', T{838039138122, --[[StoryBit FreeWill_0 Text]] "Order a thorough investigation."},
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 10,
			'Trait', "security",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{417755767554, --[[voice:narrator]] "Our security specialists questioned all people related to both the victim and the perpetrator, but all the evidence is inconclusive."},
		'Text', T{284801076896, --[[StoryBit FreeWill_0 Text]] "Indeed, the personal records of both Colonists suggest no relation between them. But some of the close friends and acquaintances of <DisplayName> who also happen to live in the same Arcology display an unusual animosity against the victim, justifying the actions of the perpetrator.\n\nAll in all, the Officers suggest that we release the perpetrator and place them under surveillance."},
		'Enables', {
			"FreeWill_1_1",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{469297592493, --[[StoryBit FreeWill_0 Text]] "Let me question the perpetrator."},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{308203067970, --[[voice:narrator]] "After a long and tiresome session with the perpetrator, you’ve managed to raise even more questions."},
		'Text', T{907521685862, --[[StoryBit FreeWill_0 Text]] "<DisplayName> has finally opened up and revealed a confused psyche. Prone to suggestions and self-doubt, the perpetrator seems too naive to perform such a crime alone. Furthermore, <DisplayName> hadn’t spoken to anyone at all about the affair – instead, all of a sudden, obsessive thoughts of harming the victim appeared.\n\nImmersed in heavy thoughts, you release the perpetrator. You place them under surveillance, hoping to find out more."},
		'Enables', {
			"FreeWill_1_1",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{215748405268, --[[StoryBit FreeWill_0 Text]] "Go through their personal file again, there’s got to be something there!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{464441271870, --[[voice:narrator]] "After hours of tedious rifling through the perpetrator’s personal file you fail to discover anything of value."},
		'Text', T{499154524308, --[[StoryBit FreeWill_0 Text]] "You have the deep feeling that <DisplayName> isn’t guilty, but you have no other choice but to condemn the unfortunate soul.\n\n<effect><DisplayName> has become a Renegade."},
		'Enables', {
			"FreeWill_1_2",
		},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Renegade",
			}),
		},
	}),
})

