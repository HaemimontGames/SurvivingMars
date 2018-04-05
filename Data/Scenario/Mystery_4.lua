-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 4",
	'file_name', "Mystery_4",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Start",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "#(UICity.labels.Colonist or empty_table) >= 100",
			'duration', 5000,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "Dream_StartMirages()",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6083, --[[Scenario Mystery 4 title]] "Inner Light: The Advent"},
			'text', T{6084, --[[Scenario Mystery 4 text]] "It is so unexpectedly pleasant that any fears of food or drug poisoning are quickly doused and forgotten. And then you hear the voices – people laughing, yelling, crying... speaking. The language is incomprehensible but you sense the presence of friendly and strangely familiar entities. The shimmering lights start forming patterns and sparks flash briefly, revealing scenes from another place.\n\nYou struggle to concentrate and maintain control and the mirage dissolves. You're left alone and confused in the command room."},
			'voiced_text', T{7201, --[[voice:narrator]] "Sitting at your desk, a strange light appears in the corner of your vision. It pulsates and intensifies, bathing the room in a warm glow. It feels... Actually, it feels just about right."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6085, --[[Scenario Mystery 4 choice1]] "What just happened...?"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6086, --[[Scenario Mystery 4 text]] "You have witnessed bizarre hallucinations with no logical explanation."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDreamEnded",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6087, --[[Scenario Mystery 4 title]] "Inner Light: Wake Up Call"},
			'text', T{6088, --[[Scenario Mystery 4 text]] "“Multiple signals from the Colony are coming in and everyone at Mission Control is worried. People are falling asleep on the streets and at their work stations, some report vivid hallucinations. The affected Colonists express symptoms of high stress and have been put under medical supervision. We’ve also exchanged information with Earth Control but they report no activity on their end. It seems the event is localized on Mars.”"},
			'voiced_text', T{7202, --[[voice:narrator]] "And you’re not the only one who’s seen this odd mirage."},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6089, --[[Scenario Mystery 4 choice1]] "This mystery is only getting deeper."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6090, --[[Scenario Mystery 4 text]] "The mirages have affected others as well. Colonists experience visual hallucinations and some have entered a trance-like state."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6091, --[[Scenario Mystery 4 title]] "Inner Light: Childhood's End"},
			'text', T{6092, --[[Scenario Mystery 4 text]] "When you open your eyes, you find yourself hundreds of meters above the ground. The panic overtakes you and you wave your limbs frantically as you try to grasp something. Despite the fact that you aren't falling – a strong rope supports you near the trunk of a gigantic tree, taller than any skyscraper. You compose yourself just on time to hear your sister laughing way above you.\n\n“What are you doing, Kal? Stop it, silly!” You hear her voice directly in your mind. The realization of where you are hits you with full force. You remember that your name is Kal. That you and your numerous Clan call this tree Home.\n\nYou take a deep breath and look at the horizon, the bright sun is almost completely covered by thick veil of red and orange."},
			'voiced_text', T{7203, --[[voice:narrator]] "It’s so much stronger this time - you manage to fight it for a minute or two before you sink into a hypnotic slumber."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6091, --[[Scenario Mystery 4 title]] "Inner Light: Childhood's End"},
			'text', T{6094, --[[Scenario Mystery 4 text]] "“Kal, another dust storm is coming. Let's finish with these moss veins and get back inside.” You clench the rope with your six-digit, two-thumb hands and start climbing towards the last of the moss veins which keeps the bark of Home healthy and alive.\n\n“This one is almost completely dry, too.” You speak out, which upsets your sister. You remember that speaking words instead of sending them had always been an expression of deep, uncontrollable feelings. “Only four dozen out of three hundred are still alive. I fear Home will not survive for much longer. Mother would be devastated.”\n\nYou both enter Home in grim silence. As you enter the dim-lit hollow, the mirage fades and you wake up in your chair."},
			'voiced_text', T{7204, --[[voice:narrator]] "Lea. Her name comes back to you as she looks toward the horizon, frowning."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6095, --[[Scenario Mystery 4 choice1]] "Wake Up"},
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDreamEnded",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6096, --[[Scenario Mystery 4 title]] "Inner Light: Fallen to Dream"},
			'text', T{6097, --[[Scenario Mystery 4 text]] "The staff has dubbed the more susceptible ones “Dreamers,” as it seems that witnessing the mirage sends them into a deep hypnotic slumber where they experience intense emotions and physical strain. Attempts to wake up a Dreamer had proven disastrous – the Colonist screamed, fell into shock and had to be sedated to prevent a potential heart attack.\n\nAs you read this, you wonder when you would become one of these unfortunate souls, unable to take care of the Colony."},
			'voiced_text', T{7205, --[[voice:narrator]] "The shimmering lights sweep through the Colony, pulling Colonist after Colonist into ever deeper states of trance."},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6098, --[[Scenario Mystery 4 choice1]] "Only time knows."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6099, --[[Scenario Mystery 4 text]] "The mirages have intensified. Some Colonists have fallen deeper into the hallucinations than others. We have dubbed these people Dreamers."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6100, --[[Scenario Mystery 4 title]] "Inner Light: Psychometry"},
			'text', T{6101, --[[Scenario Mystery 4 text]] "It supports the hypothesis that they experience real events rather than hallucinations or an imagined reality. The scientific community on Earth discarded the paper as rubbish and some have even condemned the author.\n\nThe Chief Scientist, however, believes the hypothesis could lead somewhere and wants to run MRI scans as they monitor the Dreamers, especially while they are in the trance, and analyze the data.\n\n<effect>New research on the mystery of the Dreamers is now available."},
			'voiced_text', T{7206, --[[voice:narrator]] "One of Earth’s top scientists has a new and intriguing paper on the Dreams. An unorthodox one."},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6102, --[[Scenario Mystery 4 choice1]] "Sweet opportunity!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6103, --[[Scenario Mystery 4 text]] "We have devised a system to monitor the Dreamers. We should divert resources to Dream Simulation research to shed light on the mirages."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "DreamSimulation",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "First Tech",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Sanatorium Hint",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "School Hint",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Cloning Vats Hint",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'end_block', 4,
			'expression', 'UICity:CountDomeLabel("Dreamer") >= 1',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6104, --[[Scenario Mystery 4 title]] "Inner Light: Fleeting Reality"},
			'text', T{6105, --[[Scenario Mystery 4 text]] "You’re sitting in your spartan office, re-reading the letter you got from your Mother. Every letter of her handwriting bears the emotional imprint of grief and desperation and you fail to remain calm. She’s writing to ask for your help as a steward to Watcher Bor, a powerful representative of the Authority you've been serving almost a decade now. The dust storms and the drought have hit the Clan badly in the recent cycles, bringing the horrors of starvation upon them. The neighboring Clans have already given in to the merciless heat and fled to the cities, abandoning the empty dry husks of their Home Trees to rot in the sun.\n\nYou are afraid that you won't be of much help to your Clan. From what you’ve witnessed so far, you know well that the Authority is aware of the hardships the farming Clans are facing but denies the severity of the drought. Above all else, you fear the reaction of your master, yet your loyalty to your Mother leaves you with no other choice but to talk to him."},
			'voiced_text', T{7207, --[[voice:narrator]] "You sit comfortably as the Mirage washes over you, taking you deeper into the trance. The next thing you know, you’re Kal once again."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6104, --[[Scenario Mystery 4 title]] "Inner Light: Fleeting Reality"},
			'text', T{6106, --[[Scenario Mystery 4 text]] "“Kal, I already know what’s bothering you. Or you presumed that such an obvious thought wouldn’t have surfaced? Of course not. Anyway, I strongly recommend you not to give way to such… lowly concerns. Kal, look at me. Do you truly believe the lies your Mother has fed into your heart? Do you believe that the Authority would allow their people to die in vain? These thoughts are forbidden and you know what the punishment is…”\n\nYou shiver when he mentions it. He smiles at your reaction.\n\n“You have been such a good steward all these years, and I know that you would never betray my trust. This nonsense ends now. Do we have an agreement, Kal?”\n\nYou hear yourself whisper, “Yes, Watcher.”"},
			'voiced_text', T{7208, --[[voice:narrator]] "The Watcher senses your approach, turning to face you before you can so much as utter a word."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6104, --[[Scenario Mystery 4 title]] "Inner Light: Fleeting Reality"},
			'text', T{6107, --[[Scenario Mystery 4 text]] "The event is purely for show, as is the enthusiasm with which the public applauds the Watcher’s last words. Not that they have any other option – any misdemeanor is an instant trip to the reeducation stations.\n\nYou can see some people in the crowd who are Clan representatives from the neighboring farms. Almost the entire region is gathered here. You have to show them the truth – that the Authority doesn't care about them, that they are alone. Maybe then it would make a change!"},
			'voiced_text', T{7209, --[[voice:narrator]] "Later that evening you stand next to the Watcher as he gives a speech before the Chamber of Labor."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6108, --[[Scenario Mystery 4 choice1]] "You jump out in front and telepathically project the message."},
			'choice2', T{6109, --[[Scenario Mystery 4 choice2]] "You keep it to yourself and wait for a better time to act."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 5,
			'end_block', 6,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6104, --[[Scenario Mystery 4 title]] "Inner Light: Fleeting Reality"},
			'text', T{6110, --[[Scenario Mystery 4 text]] "You wake up abruptly, with the feeling that something is wrong. You don't remember it that way..."},
			'voiced_text', T{7210, --[[voice:narrator]] "You have a moment in front of the crowd before reality crystallizes. Freezes. Shatters."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6095, --[[Scenario Mystery 4 choice1]] "Wake Up"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 7,
			'end_block', 8,
			'value', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6104, --[[Scenario Mystery 4 title]] "Inner Light: Fleeting Reality"},
			'text', T{6111, --[[Scenario Mystery 4 text]] "You keep your mouth shut and calm your thoughts, hoping that Bor is distracted enough by the conversations with the rich industrialists to not notice your momentary excitement. You know that your time will come soon – wasting the opportunity to help your Clan now wouldn't do any good.\n\nYou wake up in your room, back on Mars, with a feeling of purpose and relaxation."},
			'voiced_text', T{7211, --[[voice:narrator]] "“Patience is a virtue.” You can practically hear your Clan Mother saying it now."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6095, --[[Scenario Mystery 4 choice1]] "Wake Up"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 11,
			'Form', "break-if",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6112, --[[Scenario Mystery 4 text]] "Our scientists have proposed  that the intensity of the hallucinations is linked with the number of people who experience them."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 9,
			'end_block', 10,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 12,
			'end_block', 13,
			'expression', 'UICity:CountDomeLabel("Dreamer") >= 20',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6113, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6114, --[[Scenario Mystery 4 text]] "The sense of danger tingles in the back of your head, a keen tool you have developed over the years of climbing through the intrigue-filled political structure of the Authority. Your contacts wouldn’t be so enigmatic, but neither would be any assassins sent by your competitors to put an end to you. You admit to yourself that your curiosity is sparkled, but you take precautions and tuck in the small pistol in your robes before getting outside.\n\nThe night is very hot, even though it is winter. The weather these days had gone crazy and it has been both a blessing and a curse – it served your cause well, giving extra credibility to your mutinous words, but it also whispered the coming end for the last of the farming Clans and the cities overflowing with starving refugees. You sit by the orchards and prepare for a long wait."},
			'voiced_text', T{7212, --[[voice:narrator]] "Kal. The note in your hand bears your name, its mysterious writer bidding you to visit them in the garden."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6113, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6115, --[[Scenario Mystery 4 text]] "“Lea...” Your breath stops in your throat, silencing your voice. You feel tears forming in the corners of your eyes. Your sister projects love and happiness over the telepathic link and sweeps her own tears away.\n\n“Is it really you, Kal? I've missed you so much!”\n\n“I'm so happy to see you! Where have you been? What happened to you?”\n\n“I've been doing the same thing as you – trying to free us from the Authority. I've found out terrible secrets and the solution to our problems – but it's dangerous, even fatal. My comrades devised a cure.” She opens her palm – two vials of pale liquid lay there. “So I've come to you to take the cure with you. If I'm to die here today, I want to do so in your embrace, Kal. We are the only survivors of our Clan and I want to rest with my people.”\n\n“What are you talking about, Lea? It doesn't make sense!”"},
			'voiced_text', T{7213, --[[voice:narrator]] "Your eyes flutter open as you feel the presence of someone else there. A figure in the bushes. You can’t help but to gasp as they step into the dim glow of the streetlight."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6113, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6116, --[[Scenario Mystery 4 text]] "“We have been deceived the whole time, Kal. The Clans exist for only a generation; our centuries-long traditions and culture are a lie. The people from the cities killed the land with their industry and their wars, so the Authority crafted us from flesh and blood to resettle the planet and work like slaves to feed the cities. But the drought proved stronger than they thought, so they are abandoning us. We are a failed project, Kal, but we are also living people and we refuse to let go and die.”\n\nShe pauses to catch her breath.\n\n“The Authority couldn't release millions of people without a safety kill-switch. So they imprinted our genes with stronger telepathic abilities – so that they could read our minds and wipe us out with terrible weapons designed to kill only us. To be free, we must severe our telepathic link. This is what the cure does, but it kills one in three. It is crucial to set you free, Kal, because you're a Watcher. You can deceive the Authority about the people in this sector and allow us to spread the cure through the local Clans. Then we will have an army.”\n\nYou are unsure and confused. But Lea presses on.\n\n“No time to think, Kal. Let's do it now – let's take the cure together.”"},
			'voiced_text', T{7214, --[[voice:narrator]] "Lea sits down beside you, taking your hand."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6117, --[[Scenario Mystery 4 choice1]] "“We’ll take the cure together, Lea. I'm here with you, there's nothing to be afraid of.”"},
			'choice2', T{6118, --[[Scenario Mystery 4 choice2]] "“No, Lea, let me be the only one to take the risk. I can't lose you now that I've just found you.”"},
			'choice3', T{6119, --[[Scenario Mystery 4 choice3]] "“I know people who will help us refine the cure and make it safer. No need to rush now.”"},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 14,
			'end_block', 15,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6113, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6120, --[[Scenario Mystery 4 text]] "Then oblivion comes. You fall unconscious, failing to witness the convulsions which shake your body. You wake up just before dawn. Lea lies still beside you. She's not breathing.\n\nThe rising sun mercilessly dries your bitter tears from the sand.\n\n<effect>A Dreamer dies."},
			'voiced_text', T{7215, --[[voice:narrator]] "The liquid in the vial tastes like nothing. Like death. You can feel your mouth forming the words."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6121, --[[Scenario Mystery 4 choice1]] "Wake up in tears..."},
		}),
		PlaceObj('SA_KillColonist', {
			'Label', "Trait: Dreamer",
			'Number', "1",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 15,
			'parent', 14,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 16,
			'end_block', 17,
			'value', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6122, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6123, --[[Scenario Mystery 4 text]] "You won't remember it, but your body shakes in painful convulsions in the hands of your loving sister who watches over you the entire night. You wake up just before dawn. When you open your eyes, you look into the smiling face of Lea.\n\n“Welcome back, silly.”\n\n<effect>Several Dreamers gain negative traits."},
			'voiced_text', T{7216, --[[voice:narrator]] "The liquid in the vial tastes like nothing. Like death. You can barely hear yourself say it before a wave of oblivion sweeps over you."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Whiner",
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Idiot",
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Lazy",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 17,
			'parent', 16,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 18,
			'end_block', 19,
			'value', 3,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6113, --[[Scenario Mystery 4 title]] "Inner Light: Always Together"},
			'text', T{6125, --[[Scenario Mystery 4 text]] "Luckily, you know just the right disillusioned government biologists who would take great interest in the formula for the cure. You hide the vials under your robe and give Lea a hand. You sit down by a tree and talk for hours and hours until the sun dawns on the horizon. Then she kisses you farewell and vanishes in the waking city. You have the feeling that you will see her soon enough.\n\n<effect>Additional Dreamers are created."},
			'voiced_text', T{7217, --[[voice:narrator]] "Finding your sister after all these years. The thought of losing her again is enough to break you."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_Exec', {
			'expression', "Dream_CreateDreamers(5)",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 19,
			'parent', 18,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 22,
			'Form', "break-if",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 13,
			'parent', 12,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 10,
			'parent', 9,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6126, --[[Scenario Mystery 4 text]] "Our hypothesis on the effect of the number of Dreamers present in the Colony has been confirmed."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6127, --[[Scenario Mystery 4 title]] "Inner Light: Resonance"},
			'text', T{6128, --[[Scenario Mystery 4 text]] "For a moment you think there is another Mirage happening, but it’s no such thing. You clearly remember the voices who kept on repeating the same words over and over:\n\n“Find us again, Kal! Don’t you remember us? Find us again, Kal…”\n\nYou cannot shake the feeling that there were voices of people from the Colony and some others who sounded strangely familiar.\n\n<hint>Let more Dreamers experience the Mirages."},
			'voiced_text', T{7218, --[[voice:narrator]] "You wake up startled under your own bedsheets, the world outside pitch black. A disturbing dream, not that you remember much of it."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6129, --[[Scenario Mystery 4 choice1]] "Strange. And disturbing…"},
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 26,
			'end_block', 27,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 28,
			'end_block', 29,
			'expression', 'UICity:CountDomeLabel("Dreamer") >= 40',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6131, --[[Scenario Mystery 4 text]] "The doors behind you shut just as the shuttle takes off. No time to catch your breath as the gathering is about to begin.\n\nHundreds of people had come to the Red Valley Home Tree to answer your call. The conspiracy you’ve been gathering in the past year or so has grown to numbers which require the establishment of organization or at least a unified plan for the future. This is why you have ventured to the other side of the globe to contact local anti-Authority dissidents.\n\nThe things you have seen lifted the veil created by the misinformation and propaganda you had all been fed. You have seen cities overrun by disease and starvation, where angry mobs riot every day in a desperate attempt to avoid the inevitable. You have seen the barren landscapes of the planet, dotted by the ruins of cities and factories, where nothing lives and grows. The world is dying and you know this with all of your heart and mind."},
			'voiced_text', T{7219, --[[voice:narrator]] "The day is searing hot. You find refuge in the blessedly cool corridors of the Home Tree."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6132, --[[Scenario Mystery 4 text]] "They all await you to start the meeting and you don’t keep them in suspense. The horrible truth devours your heart and you have to share the burden with them, listen to their words and advice and set the course for the future.\n\nYou know the gathering wouldn’t be easy as the tensions had grown strong within the ranks of the resistance – Clansmen straying from city-dwellers and vice versa. Bad blood is running between the two groups, each viewing the other as something far too different to tolerate. You’re attributing much of this behavior to the recent effects of the Cure taken by your clansmen, which turned their world upside down. You hope they realize the vital role of the city dissidents – mostly scientists and thinkers – who bear skills and knowledge of which your people had been deprived on purpose.\n\nYou don’t have any intention to delay the meeting. You stand before the crowd and start to raise your voice. The murmur in the reservoir stops and everybody listens."},
			'voiced_text', T{7220, --[[voice:narrator]] "The waters of the deep ground reservoir are long gone, replaced now with the leaders of various resistance cells."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6133, --[[Scenario Mystery 4 text]] "You describe the pictures of the dying world and make sure they understand that the clock is ticking for all of you. You cannot wait for better times, but the raw military might of the Authority makes any attempt for direct confrontation a lost cause. After all, your people are farmers, not soldiers. One by one, the cell leaders speak their minds. The discussion is heated and continues until late in the night. You dismiss the gathering with the promise to continue tomorrow.\n\nLater you’re lying in bed and the sleep is chased away by your heavy thoughts. You realize that your word weighs a lot and, whichever solution you support, it would probably be the course for the future. Some of the Clansmen propose that all must hide deep in the desert and live off the land the way you did before – but this would mean condemning millions of people in the city to a starving death. The scientists who perfected the Cure uphold the plan to introduce gene-altering chemicals into the food rations sent to the city – this will instill the truth directly into the minds of the people and cause them to rise. You insist on taking the most brave and noble path – to send agents to spread the word to the people of the city. This would be dangerous and even fatal should the Authority agents get their hands on you."},
			'voiced_text', T{7221, --[[voice:narrator]] "You talk for what seems an eternity, hoping beyond hope that your words are enough to reach the hearts of your audience."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6134, --[[Scenario Mystery 4 choice1]] "Retreat to the desert and let the city-dwellers fend for themselves."},
			'choice2', T{6135, --[[Scenario Mystery 4 choice2]] "It’s either us or them – spread the Cure."},
			'choice3', T{6136, --[[Scenario Mystery 4 choice3]] "Spread the truth."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 32,
			'end_block', 33,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6137, --[[Scenario Mystery 4 text]] "Most of the intellectual dissidents abandon your cause, returning to their homes to continue the fight on their own. The new challenges strengthen your people but also planted the seed of doubt in the hearts of many, including yours. By day your resolve was growing stronger, until you finally decided to return to Bedlam and finish what you started. Some of your closest allies follow you – after all, Clansmen or not, all people deserved their place under the sun.\n\n<effect>Several Dreamers gain new traits."},
			'voiced_text', T{7222, --[[voice:narrator]] "Freed from the burden of servitude, the clansmen took to the depths of the desert. The citizens of Bedlam can lie in the bed they’ve made."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Survivor",
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Enthusiast",
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "1",
			'Trait', "Fit",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 33,
			'parent', 32,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 34,
			'end_block', 35,
			'value', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6138, --[[Scenario Mystery 4 text]] "The experts were sure that the information you were instilling into the brains of the people would help all of you to live together in harmony. The next generations could judge you harshly for the morality of your actions, or they could praise you for your bravery. You don’t care. The only thing that mattered for you was to lead the disgruntled population of Bedlam to the realization that hard times await all of you – and that none of you could trust the selfish leaders who led you to your doom on purpose.\n\n<effect>Some Dreamers become Gurus."},
			'voiced_text', T{7223, --[[voice:narrator]] "You watched the first of those infected shipments leave the city, praying that all of this was for the best."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Trait: Dreamer",
			'Number', "3",
			'Trait', "Guru",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 35,
			'parent', 34,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 36,
			'end_block', 37,
			'value', 3,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6130, --[[Scenario Mystery 4 title]] "Inner Light: Dying of the Light"},
			'text', T{6139, --[[Scenario Mystery 4 text]] "You and anyone who follows you would be the prophets of a new age of freedom and personal responsibility. The Truth will be the highest virtue – no propaganda and no threats from government agents would stop it from spreading. Deep in your heart you know that this is the right course and that soon the citizens of Bedlam would follow you till the end. This is why you’re the first to volunteer to return to the city. Many follow you without hesitation.\n\n<effect>More Dreamers appear."},
			'voiced_text', T{7224, --[[voice:narrator]] "A belief forced down your throat is no belief at all."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_Exec', {
			'expression', "Dream_CreateDreamers(5)",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 37,
			'parent', 36,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 31,
			'Form', "break-if",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 29,
			'parent', 28,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 27,
			'parent', 26,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6140, --[[Scenario Mystery 4 text]] "Dreamers have reported that they saw in their dreams the alien Kal giving a speech, and have followed the decision of the gathering, just as the Commander retold. It is apparent that all Dreamers have been witnessing events which had happened elsewhere."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 38,
			'end_block', 39,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 40,
			'end_block', 41,
			'expression', 'UICity:CountDomeLabel("Dreamer") >= 60',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6141, --[[Scenario Mystery 4 title]] "Inner Light: New Light"},
			'text', T{6142, --[[Scenario Mystery 4 text]] "Over the course of weeks, the peaceful protests had sparked into riots and the inadequate attempts of the Authority to suppress them had caused violent surges from the crowd. Citizens from all ranks of society storm the barricades and burn down government buildings.\nYou walk undisturbed among the chaos. The people view you as a prophet of the end times. No one dares raise their hand against you. When the crowd sees you it parts to let you through. Everyone is waiting for the Truth to flow from your mouth.\n\nYou haven’t asked for this. You only hope that when the Authority in Bedlam is toppled, the people listen to you once more and prepare to face more difficult times ahead. This is what fills your mind as you walk the dusty, debris-covered streets."},
			'voiced_text', T{7225, --[[voice:narrator]] "Bedlam burns with the fires of the revolution."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6141, --[[Scenario Mystery 4 title]] "Inner Light: New Light"},
			'text', T{6143, --[[Scenario Mystery 4 text]] "He's one of the Enforcers of the Authority. He frantically crawls back and reaches for his gun. That’s when the angry mob appears.\n\nAll motion stops – the officer pointing with his gun at you, the crowd, even the wind. You reach out to him. “Give me the gun,” you say. Then you turn to the mob. “What would the death of one man do to help you? Go back to your homes and families!” There’s a second of hesitation. One by one, the street empties.\n\nThe officer breathes a sigh of relief. He throws the gun on the ground and looks you right in the eye for a minute. Then he gestures for you to follow him. For some reason, you know he’s not a threat. You don’t need telepathy to tell you it, either. “Kal, right? The ex-Watcher? Know you’re going to get a kick out of this. You’re the only one of those nut jobs knows how to use it. Come on.”\n\nHe leads you to a bunker. The guards are long gone, fled or taken by the crowd. The officer opens the blast door and motions towards the entrance. ‘The Authority installed this thing a while back. Doesn’t mean a thing to me anymore. I got my life. That’s all that counts.’"},
			'voiced_text', T{7226, --[[voice:narrator]] "You turn the corner to find a man bumping into you, flustered. He falls back into the dirt. His uniform catches your eye."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6093, --[[Scenario Mystery 4 choice1]] "Continue..."},
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6141, --[[Scenario Mystery 4 title]] "Inner Light: New Light"},
			'text', T{6144, --[[Scenario Mystery 4 text]] "You give your old scientist buddies a ring and decide to give the old bones a rest while you wait. You aren't young anymore – even in your mid-forties your body wasn't genetically designed to live to old age. Nevertheless you lived a full life.\n\nThe sun sets on Bedlam. The palace of the Autharch has been taken over and the rule of the Authority is no more. You hope that the new day will bring new hope for survival and rebuilding of your tired, devastated world. This would be a monumental effort, but failure is not an option. All it takes is a helping hand. But you can save that for tomorrow. For now, you need to rest.\n\n<effect>Create more Dreamers to strengthen the Mirage."},
			'voiced_text', T{7227, --[[voice:narrator]] "The device is unfathomably complex, its true purpose lurking behind a sinister aura."},
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6124, --[[Scenario Mystery 4 choice1]] "Wake up..."},
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 42,
			'Form', "break-if",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 41,
			'parent', 40,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 39,
			'parent', 38,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6145, --[[Scenario Mystery 4 text]] "More and more Dreamers report that they wake up from the Mirage with the sense that something big is going to happen. Some people at Mission Control suggest to condition more Colonists to become Dreamers and follow the Mirages."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 43,
			'end_block', 44,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 45,
			'end_block', 46,
			'expression', 'UICity:CountDomeLabel("Dreamer") >= 100',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6146, --[[Scenario Mystery 4 title]] "Inner Light: New Dawn"},
			'text', T{6147, --[[Scenario Mystery 4 text]] "You could think of no other than the faceless Autharch, the ex-leader of the Authority, who would like to rule forever. The people of Bedlam proposed that you take his place but you refused – who are you to accept such responsibility? You ordered the machine dismantled but one of the engineers stopped you. He suggested converting it into a broadcaster with which you could reach every single person within a thousand miles. Thus all people on the planet would learn of your cause and how Bedlam was now free.\n\nYou accept, but only if you shared the honor with the ones who were by your side in all of this. You gather all of your most loyal supporters, the bearers of the highest of moral virtues. You wait in the bunker, ready to share your Truth with all."},
			'voiced_text', T{7228, --[[voice:narrator]] "In the bunker lay a secret, a psionic recorder designed to store and preserve the mind of a single person for all eternity. Foolishness."},
			'image', "UI/Messages/inner_light_mystery_02.tga",
			'choice1', T{6148, --[[Scenario Mystery 4 choice1]] "Begin transmission"},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6146, --[[Scenario Mystery 4 title]] "Inner Light: New Dawn"},
			'text', T{6149, --[[Scenario Mystery 4 text]] "I am Kal. I am an ordinary person, just like you. I was lucky to see through the veil of darkness and to find my inner light to guide me through the coming storm. Now me and my people stand strong and free, ready to forge our own destiny. Witness my life and know that the same qualities that led me to this day are hidden inside of you.\n\nBedlam City will be the center of our new civilization – an order of truth and friendship, where all take responsibility for their own actions and work for the betterment of the whole. Our world is dying because it has suffered for too long – but we will heal it, for ourselves and for our children.\n\nBut we cannot do this alone. We need you. Join us. Join us by not giving up hope. Join us by living by virtue not vice. There is hope. Spread the message.\n\nNever give up.\n\n<effect>All Dreamers gain a performance boost.\n<effect>Gained a new Technology, <em><reg_param1></em>.\n\n<center><em>The End</em>"},
			'voiced_text', T{7229, --[[voice:narrator]] "You don the helmet, willing yourself to focus."},
			'image', "UI/Messages/inner_light_mystery_02.tga",
			'reg_param1', "_grantedTech",
			'choice1', T{6150, --[[Scenario Mystery 4 choice1]] "Wake Up"},
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 47,
			'Form', "break-if",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 46,
			'parent', 45,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 44,
			'parent', 43,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{7489, --[[Scenario Mystery 4 text]] "Witnessing the end of the story of Kal and his people, a new understanding of the meaning of life has sparkled in the minds of the Dreamers. Their story has become a legend to inspire all humankind."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "Dream_StopMirages()",
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery4",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "resolved")',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_InnerLightMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Dream Notification: Maintenance",
		'autostart', true,
		'loop', true,
	}, {
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDream",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery4Mirage",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "MysteryDreamEnded",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery4Mirage")',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "First Tech",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "DreamSimulation",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6151, --[[Scenario Mystery 4 title]] "Inner Light: Pyschometry"},
			'text', T{6152, --[[Scenario Mystery 4 text]] "Indeed the Dreamers experience events which they perceive as real instead of mere hallucinations. We also discovered that they all “dream” the same sequence of events but play different roles in it. And what’s more astonishing, the actions of one affect all others.\n\nDuring routine medical checks of the tested population we accidentally discovered genetic correlation between the neural structures of the Dreamers. The facts suggest that the predisposition to become a Dreamer could be hereditary.\n\nMoreover, the creator of the Dreamer hypothesis which led us here has filed an application for acceptance on Mars.\n\n<hint>The number of Dreamers strengthens the Mirages.\n\n<hint>Children of Dreamers have a better chance to be born Dreamers.\n\n<effect>A Genius Colonist has been added to the Applicant pool."},
			'voiced_text', T{7230, --[[voice:narrator]] "The Dreamer Brainwave project confirmed the hypothesis. "},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6154, --[[Scenario Mystery 4 text]] "Our scientists have concluded that the chance to become a Dreamer is hereditary."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_AddApplicants', {
			'Trait', "Genius",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Sanatorium Hint",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "DreamSimulation",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Sanatorium and #UICity.labels.Sanatorium > 0",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6155, --[[Scenario Mystery 4 title]] "Inner Light: Abrupt Wake Up"},
			'text', T{6156, --[[Scenario Mystery 4 text]] "Hypnotic suggestions and therapy can gradually cure the patient to an almost completely functional state. Some of the Chief Staff at Mission Control suggested that we should allow the spread of Dreamers to continue in order to explore the strange events related to the Mirages.\n\n<effect>Colonists with the Dreamer trait can be cured in the Sanatorium"},
			'voiced_text', T{7231, --[[voice:narrator]] "Our behavioral analysis of the Dreamers tells us that we can mitigate the factors that led to their mirage-induced trance."},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6157, --[[Scenario Mystery 4 choice1]] "Affirmative"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6158, --[[Scenario Mystery 4 text]] "We have discovered a way to treat the symptoms of Dreamers in the Sanatorium, permanently severing their link to the Mirages."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "School Hint",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "DreamSimulation",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.School and #UICity.labels.School > 0",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6159, --[[Scenario Mystery 4 title]] "Inner Light: Learning to Dream"},
			'text', T{6160, --[[Scenario Mystery 4 text]] "To evaluate any potential risks for the Colony, he observed them closely, making notes on their behavior both before and during a Mirage. Analyzing the results, he discovered that the trance-like state the Dreamers enter can be simulated through self-hypnosis and breathing exercises.\n\nHis findings make it possible for us to train children to become Dreamers, if we believe this course of action is justified.\n\n<effect>The Dreamer trait can be taught in Schools"},
			'voiced_text', T{7232, --[[voice:narrator]] "The Chief Security Officer shared his findings on the Dreamers with us."},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6157, --[[Scenario Mystery 4 choice1]] "Affirmative"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6161, --[[Scenario Mystery 4 text]] "We have discovered a way to train our newborn in the schools to become Dreamers."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cloning Vats Hint",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.CloningVats and #UICity.labels.CloningVats > 0",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6162, --[[Scenario Mystery 4 title]] "Inner Light: Conceived in a Dream"},
			'text', T{6163, --[[Scenario Mystery 4 text]] "No matter what the staff does, every clone embryo starts developing the genetic traits of a Dreamer. At first we thought it was a sequencer glitch or a contamination of the bio banks, but thorough maintenance has dismissed such suspicions. The Chief Scientist said that either she's going crazy or the Mirages somehow interact with the genes of the Clones. If she's correct, this hypothesis could spark a new golden age in genetic science!\n\nMeanwhile, it's up to us at Mission Control to evaluate the risks and opportunities behind creating more Dreamers.\n\n<effect>Gain 2000 Research points.\n\n<effect>All Clones are created with the Dreamer trait."},
			'voiced_text', T{7233, --[[voice:narrator]] "There’s something strange happening to the Cloning Vat systems!"},
			'log_entry', true,
			'image', "UI/Messages/inner_light_mystery_01.tga",
			'choice1', T{6164, --[[Scenario Mystery 4 choice1]] "Strange..."},
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Amount', 2000,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_InnerLightMysteryLog",
			'text', T{6165, --[[Scenario Mystery 4 text]] "For reasons unknown, all Clones are born Dreamers."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 4",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_InnerLightMysteryLog",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Grant Wonder Tech",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "tech_id = GrantWonderTech()",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_grantedTech = TechDef[tech_id].display_name",
		}),
		}),
	})