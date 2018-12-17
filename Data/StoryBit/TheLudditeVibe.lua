-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/26_colonist.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "DroneHub",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(899014718374, --[[StoryBit TheLudditeVibe Text]] 'Transmitting a video stream from inside the building, the angry colonist screams:\n\n"I can’t take it anymore! Machines! Machines! Only bloody, senseless, soulless machines! I will destroy them! ALL OF THEM!"\n\nThen, out of a sudden, the red alert lights flash! <DisplayName> has set the building to self-destruct!'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(208190182578, --[[StoryBit TheLudditeVibe Title]] "Sanity Breakdown - The Luddite Vibe"),
	Trigger = "SanityBreakdown",
	VoicedText = T(552354324216, --[[voice:narrator]] "A colonist has gone mad! Donning a space suit, the unstable individual has occupied one of our Drone Hubs, threatening to destroy it!"),
	group = "Sanity Breakdown",
	id = "TheLudditeVibe",
	PlaceObj('StoryBitReply', {
		'Text', T(371578230411, --[[StoryBit TheLudditeVibe Text]] "We cannot afford to lose the Hub!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(884081768298, --[[voice:narrator]] "The repair teams rush into the building and make the best attempts to stop its destruction. Following your instructions, they completely disregard the extraction of the crazy colonist."),
		'Text', T(334304578822, --[[StoryBit TheLudditeVibe Text]] "<effect>The building has been saved. <DisplayName> has died."),
		'Effects', {
			PlaceObj('KillColonist', {
				'DeathReason', "suicide",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(594872827717, --[[StoryBit TheLudditeVibe Text]] "Forget about the building, save the colonist!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(464978608743, --[[voice:narrator]] "The rescue teams rush into the already collapsing building, searching for the crazed colonist inside. And they succeed, bringing the victim out right before the structure caves in!"),
		'Text', T(592624496028, --[[StoryBit TheLudditeVibe Text]] "<effect>The colonist has been saved. The building has been destroyed."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "DroneHub",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('DestroyBuilding', nil),
				},
			}),
		},
	}),
})

