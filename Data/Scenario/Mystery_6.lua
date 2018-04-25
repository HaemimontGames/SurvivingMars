-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 6",
	'file_name', "Mystery_6",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Start",
		'autostart', true,
	}, {
		PlaceObj('SA_Exec', {
			'expression', '_missionSponsor = GetMissionSponsor().display_name or ""',
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 100",
			'duration', 1000,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6249, --[[Scenario Mystery 6 title]] "Marsgate: It Came From Earth"},
			'text', T{6250, --[[Scenario Mystery 6 text]] "We have contacted our partners back on Earth, but have so far received no insight on this mysterious object. Observations at this level suggest an artificial origin but flight schedules indicate no inbound science mission."},
			'voiced_text', T{7256, --[[voice:narrator]] "We’ve observed an unknown object on a rapid trajectory from Earth towards Mars."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6251, --[[Scenario Mystery 6 choice1]] "Pester those guys until you shake off some answers – we need to know what the heck they’ve thrown our way."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7490, --[[Scenario Mystery 6 text]] "An unknown object of artificial origin has been detected to be inbound towards Mars from Earth."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6252, --[[Scenario Mystery 6 title]] "Marsgate: EsoCorp"},
			'text', T{6253, --[[Scenario Mystery 6 text]] "“Please be advised that Object 6Ez-3 will be operating within a respectful distance of your mission. You are not to approach Object 6Ez-3 under any circumstance, under threat of legal and other punitive measures.”\n\nNothing further was added and no effort to even mimic adherence to standard protocol guidelines was made. Our Earth partners are giving their best to question EsoCorp and get to the bottom of this."},
			'voiced_text', T{7257, --[[voice:narrator]] "Mission Control’s received a direct communique from EsoCorp, one of Earth’s largest tech conglomerates. It reads:"},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6254, --[[Scenario Mystery 6 choice1]] "Who do these guys think they are!?"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7491, --[[Scenario Mystery 6 text]] "One of Earth’s largest tech conglomerates, EsoCorp, has confirmed ownership of the mysterious craft and has issued a warning to stay away."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'PlaceObject("AttackRover", {city = UICity})',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6255, --[[Scenario Mystery 6 title]] "Marsgate: Motives Unknown"},
			'text', T{6256, --[[Scenario Mystery 6 text]] "So far we can deduce it is only patrolling the area, as we can’t detect sophisticated science instruments from this observation range.\n\nThe landing, however, was seen by some of our Colonists and questions are being raised – questions we currently can’t answer. Our Earth partners have so far fallen short from picking up on any new information and are currently preparing to take the issue to the UN."},
			'voiced_text', T{7258, --[[voice:narrator]] "Object 6Ez-3 has made impact on the surface, not too far from base. Our readings suggest it’s intact and operational."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6257, --[[Scenario Mystery 6 choice1]] "Soon we may have to take things into our own hands."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7492, --[[Scenario Mystery 6 text]] "The mysterious vehicle has made touchdown on Mars and has begun operating in secrecy."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Malfunctioned Rovers: Counter",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'expression', "4",
			'end_block', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'PlaceObject("AttackRover", {city = UICity})',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 150000,
			'rand_duration', 150000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6258, --[[Scenario Mystery 6 title]] "Marsgate: A Silent Invasion"},
			'text', T{6259, --[[Scenario Mystery 6 text]] "EsoCorp is totally silent about this second batch of what we believe to be some sort of surveying rovers.\n\nMore Colonists have witnessed the landings and are openly concerned about what they perceive to be an invasion."},
			'voiced_text', T{7259, --[[voice:narrator]] "We detect and monitor four more objects as they parachute down and make landfall, every one of them bearing a resemblance to Object 6Ez-3."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6260, --[[Scenario Mystery 6 choice1]] "Calm the general public down. We need answers!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7493, --[[Scenario Mystery 6 text]] "More of the mysterious vehicles have landed on Mars and are a becoming a cause for concern among our Colonists."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "_malfunctions >= 1",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6261, --[[Scenario Mystery 6 title]] "Marsgate: Take It or Leave It"},
			'text', T{6262, --[[Scenario Mystery 6 text]] "They propose a deal - we fix one of their malfunctioning rovers and they provide a generous (as they put it) funding injection. Their legal team has also warned that any mission should be strictly for repairs and further inspection of the vehicle will be taken as an illegal act.\n\nIn other words, if we wish, we can send drones to fix their rover but nothing that can evaluate its purpose – like a rover – and we will be paid for the effort.\n\n<effect>Malfunctioning EsoCorp rovers can now be repaired by Drones."},
			'voiced_text', T{7260, --[[voice:narrator]] "EsoCorp’s stopped giving us the silent treatment, but it’s clear from their message they’re not going to answer our questions."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6263, --[[Scenario Mystery 6 choice1]] "Not suspicious at all."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7494, --[[Scenario Mystery 6 text]] "EsoCorp has broken the silence and has offered us a handsome reward for repairing one of its vehicles."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.enable_rover_repair = true",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_repairedRoverReward = 500 * 1000000",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Repaired Rover: Rewards",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "_malfunctions >= 2",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 500,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "AttackRoverMalfunctioned",
			'register', "_specialMalfunctionedRover",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6264, --[[Scenario Mystery 6 title]] "Marsgate: Fixing a Perfect Design"},
			'text', T{6265, --[[Scenario Mystery 6 text]] "EsoCorp is having obvious issues with their mysterious rovers as they seem to be malfunctioning one after the other. Instead of admitting the faults in their predictions about the rough Martian conditions, the EsoCorp team has sent us a message which, quote, \"gives the Martian Colony Command the rare privilege of sending one of our more analytical vehicles to look into the most certainly small miscalculation that causes these temporary annoyances.” End quote.\n\nFurthermore - they go on to remind us that, by choosing to analyze their broken vehicles, we have an understanding not to dig beyond any obvious logistical shortcomings in their design and agree to full and utter discretion.\n\n<effect>An Anomaly has appeared next to a malfunctioned vehicle."},
			'voiced_text', T{7261, --[[voice:narrator]] "People who aim for perfection learn soon enough that it’s a moving target. Guess EsoCorp didn’t aim high enough."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6266, --[[Scenario Mystery 6 choice1]] "An interesting opportunity has presented itself."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7495, --[[Scenario Mystery 6 text]] "EsoCorp has requested us to analyze the faults in their vehicles. They have been explicitly clear and menacing as to us not delving deeper into the rover’s design and purpose."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_specialMalfunctionedRover.can_repair = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "roverPos = _specialMalfunctionedRover:GetPos()",
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T{7262, --[[Scenario Mystery 6 description]] "Analyze the reason for the constant rover breakdowns."},
			'check_passability', false,
			'check_buildable', false,
			'random_pos_label_dist', 1000,
			'register_placement_pos', "roverPos",
			'store_obj', "anomaly",
			'display_name', T{7263, --[[Scenario Mystery 6 display_name]] "EsoCorp Rover Problems"},
			'sequence_list', "Mystery 6",
			'sequence', "Anomaly 1: Effects",
			'revealed', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_anomalyAnalyzed = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_timeExpired = false",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Wait Time",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "_anomalyAnalyzed == true or _timeExpired == true",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 25,
			'Form', "if-then-else",
			'end_block', 27,
			'else_block', 26,
			'expression', "_anomalyAnalyzed == true",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Wait Time",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6267, --[[Scenario Mystery 6 title]] "Marsgate: The Path Splits"},
			'text', T{6268, --[[Scenario Mystery 6 text]] "A quick scan of the mysterious vehicle was enough to encounter several design flaws that made it comically ill-equipped for Mars. However, the scan also revealed a poor attempt to disguise the true nature of these rovers. Despite having remained a mystery so far, the effort to hide its military origin could not hold up under a close examination. These rovers seem, without a doubt, weapons most probably tasked to use Mars as a testing ground – setting an extremely dangerous precedent, among other obvious problems. \n\nBy allowing us to analyze their vehicles, EsoCorp are also without a doubt issuing us a threat, and they seem comfortable enough with the notion that we will feel threatened enough to comply and keep our findings a secret. For, as issue-riddled as these rovers are, they are numerous and still pack enough fire power to disrupt our Colony, which has its hands full surviving Mars as it is.\n\nAs cynical as this all seems to be, we must take into consideration that we have no military capacity whatsoever, and choosing to challenge them might put the lives of everyone on Mars in danger."},
			'voiced_text', T{7264, --[[voice:narrator]] "A little knowledge is a dangerous thing. But there’s a man out there who has so much of it that he can’t be touched."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6269, --[[Scenario Mystery 6 choice1]] "This breaks all international, not to mention interplanetary treaties! We’re going to expose it!"},
			'choice2', T{6270, --[[Scenario Mystery 6 choice2]] "I say we call their bluff and make them buy our partnership."},
			'choice3', T{6271, --[[Scenario Mystery 6 choice3]] "Our mission is too great to jeopardize this way. We’ll weather it out, just like we would a regular dust storm."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 3,
			'end_block', 4,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6272, --[[Scenario Mystery 6 title]] "Marsgate: Whistleblower's Pride"},
			'text', T{6273, --[[Scenario Mystery 6 text]] "We mixed it with the atmospheric and topographical data of Mars, the basic stuff you’d base your rover design on, so we know we’re safe from EsoCorp digging it up even if they do intercept the transmission.\n \nAlthough this puts us at a momentary disadvantage, we’re all proud to have done the right thing. This is the message we’ve sent to the power-hungry conglomerates back on Earth – we are leaving the old ways behind and the future will not be built on our capacity for war."},
			'voiced_text', T{7265, --[[voice:narrator]] "It’s done. We sent the data dump we collected from EsoCorp’s rover to Earth."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6274, --[[Scenario Mystery 6 choice1]] "It is time we reveal this to our citizens and brace ourselves for whatever is to come."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7496, --[[Scenario Mystery 6 text]] "We have discovered that EsoCorp is testing military vehicles on Mars which goes against established interplanetary and international laws. Faced with a tough choice, we decided to expose the crime."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7500000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Alternative Path 1",
			'wait', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 5,
			'end_block', 6,
			'value', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6275, --[[Scenario Mystery 6 title]] "Marsgate: Sealing the Deal"},
			'text', T{6276, --[[Scenario Mystery 6 text]] "“State your terms:”\n\nNever gotten a response that fast before. Most likely they thought we’d just take an insult lying down. Not to mention the risk. Though I’m pretty sure we’ll be on the wrong side of history if this gets out."},
			'voiced_text', T{7266, --[[voice:narrator]] "We’ve received a message from EsoCorp."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6277, --[[Scenario Mystery 6 choice1]] "Earth really dragged their feet on this one. We’ll need to manage this ourselves."},
			'choice2', T{6278, --[[Scenario Mystery 6 choice2]] "It wasn’t worth risking our Colonists. Not when we’re this underpowered."},
			'choice3', T{6279, --[[Scenario Mystery 6 choice3]] "The strong always get what they want. Hey, at least we got something out of it."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 11,
			'end_block', 12,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding = 500 * 1000000",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery6Reward",
			'text', T{7267, --[[Scenario Mystery 6 text]] "<funding(reg_param1)>"},
			'reg_param1', "funding",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 12,
			'parent', 11,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 13,
			'end_block', 14,
			'value', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', "amountPreciousMetals = 30 * const.ResourceScale",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'PlaceResourceStockpile_Delayed(roverPos, "PreciousMetals", 30 * const.ResourceScale, 0, true)',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery6Reward",
			'text', T{7570, --[[Scenario Mystery 6 text]] "<preciousmetals(reg_param1)>"},
			'reg_param1', "amountPreciousMetals",
			'pos_reg', "roverPos",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 14,
			'parent', 13,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 15,
			'end_block', 16,
			'value', 3,
		}),
		PlaceObj('SA_RevealTech', nil),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery6Reward",
			'text', T{7268, --[[Scenario Mystery 6 text]] "Random Breakthrough Tech"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 16,
			'parent', 15,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7497, --[[Scenario Mystery 6 text]] "We have discovered that EsoCorp is testing military vehicles on Mars which goes against established interplanetary and international laws. Faced with a tough choice, we decided to blackmail EsoCorp."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 11250000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_renegadesPercentage = 15",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Alternative Path 2",
			'wait', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 7,
			'end_block', 8,
			'value', 3,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6280, --[[Scenario Mystery 6 title]] "Marsgate: Silence of the Lambs"},
			'text', T{6281, --[[Scenario Mystery 6 text]] "We have sent EsoCorp our report on the rovers design flaws while carefully playing dumb to our having found out the rover’s true nature. EsoCorp’s sent us some funds as a reward. They’re also trying to pretend there’s a million-in-one chance we didn’t see right through their half-assed... Er, insufficient attempt to conceal military vehicles.\n\nTo recap - we’ve shown our willingness to keep EsoCorp's secret safe and they have acknowledged that their blunt threat was received as intended."},
			'voiced_text', T{7269, --[[voice:narrator]] "Play with a tiger, you're going to get the claws."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6282, --[[Scenario Mystery 6 choice1]] "No escaping our worst impulses no matter how far you get from Earth."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7498, --[[Scenario Mystery 6 text]] "We have discovered that EsoCorp is testing military vehicles on Mars which goes against established interplanetary and international laws. Faced with a tough choice, we decided to pretend we saw nothing, fearing repercussions."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 11250000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_renegadesPercentage = 5",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Alternative Path 2",
			'wait', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 26,
			'parent', 25,
			'is_else', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_reg', "anomaly",
			'destroy_all', true,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Anomaly 1: Effects",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_renegadesPercentage = 5",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Alternative Path 2",
			'wait', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 27,
			'parent', 25,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7500000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6300, --[[Scenario Mystery 6 title]] "Marsgate: The Day We Feared"},
			'text', T{6301, --[[Scenario Mystery 6 text]] "They’re all built to EsoCorp’s specs. Just with some subtle differences thrown in. Our running hypothesis is that they’re some sort of advanced prototype. EsoCorp’s decided they want to shut down all communication, which means we can’t confirm nor deny the following:\n\nTheir movements are scattered. Dangerous. That means it’s likely a rush job aimed at hurting us for blowing the whistle on the whole “Marsgate” thing.  That’s to say EsoCorp’s got a hankering for revenge. \n\nWe’ve put forward several proposals as to how we might deal with the impending attack. We’ll need our scientists working full steam on this. We cannot stress strongly enough the need to shift resources towards this end. We’ve got a word for situations like this. Critical.\n\n<effect>The Defense Turret is now available for Research."},
			'voiced_text', T{7270, --[[voice:narrator]] "We’ve detected multiple unidentified objects on a trajectory towards Mars. Towards us, actually."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6302, --[[Scenario Mystery 6 choice1]] "We need to warn the Colonists. Get our defenses up."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7499, --[[Scenario Mystery 6 text]] "EsoCorp has decided to take revenge on us and is attacking the Colony! Our scientists have proposed defensive countermeasures."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 17,
			'expression', "8",
			'end_block', 18,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'PlaceObject("AttackRover", {city = UICity})',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 18,
			'parent', 17,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Enemy Rovers: Recharger",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "DefenseTower",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Research 1: Effects",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1440000,
			'rand_duration', 720000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6306, --[[Scenario Mystery 6 title]] "Marsgate: The First Wave"},
			'text', T{7271, --[[Scenario Mystery 6 text]] "All stations on Red Alert!"},
			'voiced_text', T{7272, --[[voice:narrator]] "The first attack is on its way! Brace yourselves!"},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6308, --[[Scenario Mystery 6 choice1]] "This moment has been coming for a long time."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7500, --[[Scenario Mystery 6 text]] "EsoCorp has sent a wave of attack rovers."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.can_shoot_rovers = true",
		}),
		PlaceObj('SA_HostileRoverCommand', {
			'Command', "Attack",
			'Param', 1,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1440000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6309, --[[Scenario Mystery 6 title]] "Marsgate: The Second Wave"},
			'text', T{6310, --[[Scenario Mystery 6 text]] "EsoCorp just sent us a whole bunch of rovers. They’re quick to enter formation for a second attack. Hostilities will resume any minute now."},
			'voiced_text', T{7273, --[[voice:narrator]] "The invasion was unrelenting. Our only choice was to fight to survive or fall to the tide of violence."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6311, --[[Scenario Mystery 6 choice1]] "Here we go again!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7501, --[[Scenario Mystery 6 text]] "EsoCorp has sent a second attack wave."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 19,
			'expression', "8",
			'end_block', 20,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'check_terran_deposit', false,
			'class_name', "AttackRover",
			'use_random_pos', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 20,
			'parent', 19,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
		}),
		PlaceObj('SA_HostileRoverCommand', {
			'Command', "Attack",
			'Param', 3,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Random Attacks: Repeater",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "AttackRoverDead",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6312, --[[Scenario Mystery 6 title]] "Marsgate: Using Their Own Stones Against Them"},
			'text', T{6313, --[[Scenario Mystery 6 text]] "The EsoCorp rovers we destroy can be repaired and used against the enemy, or salvaged for resources. What’s more, they can protect anything in their range against meteors."},
			'voiced_text', T{7274, --[[voice:narrator]] "Live by the sword, die by the sword. Or the weaponized rover. Same difference."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6311, --[[Scenario Mystery 6 choice1]] "Here we go again!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7502, --[[Scenario Mystery 6 text]] "We have successfully hijacked and repaired a destroyed EsoCorp rover. This ought to help our defenses."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.enable_rover_repair = true",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.reclaim_repaired_rovers = true",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.HostileAttackRovers and #UICity.labels.HostileAttackRovers <= 0",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Random Attacks: Repeater",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Enemy Rovers: Recharger",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6314, --[[Scenario Mystery 6 title]] "Marsgate: The Fall of EsoCorp"},
			'text', T{6315, --[[Scenario Mystery 6 text]] "An attack from Earth. Never thought we’d see the day.  Has this caused a rift between our two worlds? Wounds are too fresh to tell how deep they go. Might we have a chance we can walk them off and move forward together? Too early to tell, really.\n\nBack on Earth, EsoCorp executives have been arrested and the company has been shut down in many major nations. This will certainly cause economic upheaval, but the ruling parties have deemed it necessary to send a message for all future warlords: Space is neither up for military conquest nor a test ground for weapons. Developing space-oriented war machines still remains against the rules, and we will continue to pretend that this was just a fluke. Humanity has shed its need for war with grace. \n\nLooking at the smoking battlefield, so far from Earth, we can’t help but wonder if this is indeed the case. This, however, brings us to our next question. Do we destroy the prototype weapons made for the Martian environment and salvage what resources we can from the rovers, or do we keep the technology in anticipation of another “fluke”?\n\n<effect>Gained new technology, <em><reg_param1></em>"},
			'voiced_text', T{7275, --[[voice:narrator]] "EsoCorp is done, its rovers either smoldering piles of scrap or under our total control."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'reg_param1', "_grantedTech",
			'choice1', T{6316, --[[Scenario Mystery 6 choice1]] "Put 6Ez-3 on display, destroy the rest."},
			'choice2', T{6317, --[[Scenario Mystery 6 choice2]] "We would be fools to be caught so defenseless once again."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 21,
			'end_block', 22,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_class', "AttackRover",
			'destroy_all', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "destroyed rovers")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 22,
			'parent', 21,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 23,
			'end_block', 24,
			'value', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "kept rovers")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 24,
			'parent', 23,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7503, --[[Scenario Mystery 6 text]] "EsoCorp’s rovers have been neutralized. The Marsgate affair has ended as all EsoCorp executives have been arrested by the authorities on Earth."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery6",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MarsgateMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Alternative Path 1",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{6283, --[[Scenario Mystery 6 title]] "Marsgate"},
			'text', T{6284, --[[Scenario Mystery 6 text]] "Governments and international organizations are furious with EsoCorp’s subterfuge and forbidden military experiments and people were fast to dub the scandal “Marsgate”. As the blame game is unraveling, we can’t help but notice that all channels EsoCorp barely used to communicate with us have now been totally taken offline. Our sponsors from Earth are promising us compensation and guaranteeing protection from EsoCorp, but we fear they may not be able to help fast enough if EsoCorp decides to take revenge.\n\nThis being said, you will have to take part in an upcoming UN trial as the main witness to this whole gruesome affair.\n\n<effect>You can’t repair any more EsoCorp rovers."},
			'voiced_text', T{7276, --[[voice:narrator]] "We blew the whistle on EsoCorp’s dealings and every news agency on Earth sunk their teeth right in. This ought to be interesting."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{6285, --[[Scenario Mystery 6 choice1]] "Time to walk the walk."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7504, --[[Scenario Mystery 6 text]] "Marsgate has exploded. We are given a heads up that a UN trial will begin soon."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.enable_rover_repair = false",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Repaired Rover: Rewards",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{7277, --[[Scenario Mystery 6 title]] "Marsgate: The Trial of the Century"},
			'text', T{6287, --[[Scenario Mystery 6 text]] "Joining the legal proceedings against the entity known as EsoCorp by satellite link is the head of the Mars Colony Project as a representative of <reg_param1> and the main victim in “Marsgate” other than the total disregarding of international and interplanetary treaties. The treaties, which are in place to discourage the militarization of any human endeavors in space, are held to be of utter importance by all present parties, except the defendant, and thus the transgression is seen as most grievous. \n\nBecause communication with Mars is not at its peak at this time and will take too long for a proper discussion, know that our sponsors have shared your overall stance on the whole affair. Still, as the final verdict draws near we have decided it best if you say in your own words the implications of EsoCorp’s secretive and illegal military testing operations on Mars.  "},
			'voiced_text', T{7278, --[[voice:narrator]] "The UN trial is about to start. You can guarantee they’re all hot under the collar."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{7279, --[[Scenario Mystery 6 choice1]] "Humanity can do better."},
			'choice2', T{7280, --[[Scenario Mystery 6 choice2]] "The risk was great, but we did the right thing."},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', "applicants = 3",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{7281, --[[Scenario Mystery 6 title]] "Marsgate: A Harsh Message"},
			'text', T{6290, --[[Scenario Mystery 6 text]] "EsoCorp put the lives of people, who brave an unforgiving world in the name of humanity, in danger with nothing more than profit in mind. A harsh verdict today will stand as testament to humanity reaching the maturity needed to spread amidst the stars.\n\n<effect><reg_param1> Applicants with rare traits are available on Earth"},
			'voiced_text', T{7282, --[[voice:narrator]] "It was time for humanity to come to grips with the fact that violence only breeds more violence. And that’s exactly what we told them."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "applicants",
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "applicants",
			'Trait', "random_rare",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 3,
			'end_block', 4,
			'value', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding = 1500 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{7283, --[[Scenario Mystery 6 title]] "Marsgate: A Message of Hope"},
			'text', T{6291, --[[Scenario Mystery 6 text]] "We of Mars, who have denounced any militarization, have chosen to move on from the ways of the past and shape our new home into a place where military conflict is a thing of myth and legend. In doing so, we place our trust that this idea will resonate with all people back on Earth, our home world, and bring humanity not only to another planet, but to another level of evolution. Yet this incident has shown us that we may not do so without help from Mother Earth, and this trial today has renewed our hope that our vision for the future is not entirely wishful thinking.\n\n<effect>Gained <funding(reg_param1)> Funding"},
			'voiced_text', T{7282, --[[voice:narrator]] "It was time for humanity to come to grips with the fact that violence only breeds more violence. And that’s exactly what we told them."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "funding",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7505, --[[Scenario Mystery 6 text]] "The UN has praised and rewarded us for our brave and risky move to expose EsoCorp."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Alternative Path 2",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{6292, --[[Scenario Mystery 6 title]] "Marsgate"},
			'text', T{6293, --[[Scenario Mystery 6 text]] "The lengths he has taken to circumvent our detection not only by EsoCorp, but that of Mission Control as well, shows us painstakingly that we have failed him and probably many others like him. In their eyes we were playing for the other team. It puts us all to shame. Many citizens are showing their discontent with our Colony now that our own actions have been exposed, and back on Earth this whole ordeal is blowing up to mind boggling proportions. It has been dubbed “Marsgate” and we are accused of being compliant in the breaking of international and interplanetary treaties by the UN. \n\nPopular pressure has prompted that a trial start as quickly as possible. You will be required to defend our actions via satellite link.\n\n<effect>You can’t repair any more EsoCorp rovers."},
			'voiced_text', T{7284, --[[voice:narrator]] "The cat’s out of the bag. One of our bolder Colonists took it upon himself to do what we couldn’t – expose EsoCorp and their dirty dealings on Mars."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'choice1', T{7285, --[[Scenario Mystery 6 choice1]] "We only wanted to protect them, right?"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7506, --[[Scenario Mystery 6 text]] "Marsgate has exploded. One of our citizens has exposed EsoCorp and our involvement in the affair."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.enable_rover_repair = false",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Repaired Rover: Rewards",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
			'rand_duration', 1500000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "renegades = UICity.labels.Colonist and #UICity.labels.Colonist > 0 and (#UICity.labels.Colonist * _renegadesPercentage / 100) or 0",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{6286, --[[Scenario Mystery 6 title]] "Marsgate: Wrong Side of History"},
			'text', T{6287, --[[Scenario Mystery 6 text]] "Joining the legal proceedings against the entity known as EsoCorp by satellite link is the head of the Mars Colony Project as a representative of <reg_param1> and the main victim in “Marsgate” other than the total disregarding of international and interplanetary treaties. The treaties, which are in place to discourage the militarization of any human endeavors in space, are held to be of utter importance by all present parties, except the defendant, and thus the transgression is seen as most grievous. \n\nBecause communication with Mars is not at its peak at this time and will take too long for a proper discussion, know that our sponsors have shared your overall stance on the whole affair. Still, as the final verdict draws near we have decided it best if you say in your own words the implications of EsoCorp’s secretive and illegal military testing operations on Mars.  "},
			'voiced_text', T{7286, --[[voice:narrator]] "The UN trial is about to start... I can already feel the water heating up."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{6288, --[[Scenario Mystery 6 choice1]] "At the end of the day, it is Earth that has failed us by allowing this whole thing in the first place."},
			'choice2', T{6289, --[[Scenario Mystery 6 choice2]] "You want the truth? You can’t handle the truth!"},
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{7287, --[[Scenario Mystery 6 title]] "Marsgate: The Blame Game"},
			'text', T{6296, --[[Scenario Mystery 6 text]] "EsoCorp put the lives of people, who brave an unforgiving world in the name of humanity, in danger with nothing more than profit in mind. We at Mission Control, on the other hand, are tasked with protecting the mission and the lives of all people taking part in it, so we did what we saw fit in order to see our duties are met. With guns pointing at our life support equipment and the closest help 3 million miles away, we were left with little choice and we stand by our decision. Why EsoCorp was able to send these rovers all the way to Mars without being detected from Earth is beyond us and we, the people of Mars, feel let down by Earth today.\n\n<effect><reg_param1> Colonists became Renegades."},
			'voiced_text', T{7288, --[[voice:narrator]] "A tough moment. We tried our best not to fan the flames."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "renegades",
			'choice1', T{6294, --[[Scenario Mystery 6 choice1]] "OK"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 3,
			'end_block', 4,
			'value', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{7289, --[[Scenario Mystery 6 title]] "Marsgate: What Can Change the Nature of Man?"},
			'text', T{6297, --[[Scenario Mystery 6 text]] "EsoCorp came to Mars with force, deployed in our vicinity, breaking every law and basically putting a gun to our heads. It was a classic story of the strong bullying the weak, or in this case, someone completely unprepared for such an event. In a way it was a stab in the back, as we idolized Earth as a source of safety while we had to wrestle with the unforgiving calamities of Mars. \n\nWe did not like it, but we came to the realization that it was only a matter of time before this happened and that it was better to have a strong ally. We are pioneers on a new frontier, opening countless possibilities and space for humans to be, well, humans. If it was not EsoCorp today, it would have been someone else tomorrow, I assure you. And that someone else might have come at different circumstances and not offered us, albeit indirectly, a way to stay on their good side. At the end of day, we may have changed planets, but we are still humans, with all the blessings and curses this fact carries in itself.\n\n<effect><reg_param1> Colonists became Renegades."},
			'voiced_text', T{7290, --[[voice:narrator]] "This was bound to happen. We gave them the whole truth and nothing but the truth, whether they wanted it or not."},
			'image', "UI/Messages/marsgate_mystery_01.tga",
			'reg_param1', "renegades",
			'choice1', T{6294, --[[Scenario Mystery 6 choice1]] "OK"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_AddTrait', {
			'Label', "Colonist",
			'Number', "renegades",
			'Trait', "Renegade",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7507, --[[Scenario Mystery 6 text]] "The UN has shown some understanding of the difficult situation we were put in but has fined the Colony nonetheless. The resulting loss of reputation diverted many Applicants from the project."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 1: Effects",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_anomalyAnalyzed = true",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_specialMalfunctionedRover.can_repair = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Wait Time",
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_timeExpired = true",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_specialMalfunctionedRover.can_repair = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Research 1: Effects",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "DefenseTower",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{6303, --[[Scenario Mystery 6 title]] "Marsgate: Missile Envy"},
			'text', T{6304, --[[Scenario Mystery 6 text]] "We can now build laser-targeting missile defense systems. This will help us mount a defense against the incoming attacks."},
			'voiced_text', T{7291, --[[voice:narrator]] "Fight fire with fire! Well, rockets. You know what I mean."},
			'image', "UI/Messages/marsgate_mystery_02.tga",
			'choice1', T{6305, --[[Scenario Mystery 6 choice1]] "This ought to give us a fighting chance."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MarsgateMysteryLog",
			'text', T{7508, --[[Scenario Mystery 6 text]] "In an attempt to counter the attacks we designed missile turrets tasked with repulsing all incoming attacks."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 6",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Malfunctioned Rovers: Counter",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_malfunctions = 0",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "AttackRoverMalfunctioned",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_malfunctions = _malfunctions + 1",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 500,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Repaired Rover: Rewards",
		'loop', true,
	}, {
		PlaceObj('SA_WaitMsg', {
			'msg', "AttackRoverRepaired",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 3000,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "_repairedRoverReward",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery6Reward",
			'text', T{7292, --[[Scenario Mystery 6 text]] "<funding(reg_param1)>"},
			'reg_param1', "_repairedRoverReward",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Random Attacks: Repeater",
		'loop', true,
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'duration', 360000,
			'rand_duration', 360000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "attackers = UICity.labels.HostileAttackRovers and #UICity.labels.HostileAttackRovers or 0",
		}),
		PlaceObj('SA_HostileRoverCommand', {
			'Number', "attackers",
			'Command', "Attack",
			'Param', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Enemy Rovers: Recharger",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "for _, rover in ipairs(UICity.labels.AttackRover or empty_table) do\n  if rover:IsValidPos() then \n    rover:Repair()\n  end\nend",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 300000,
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', "for _, rover in ipairs(UICity.labels.HostileAttackRovers or empty_table) do\n  rover.battery_current = rover.battery_max\nend",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 300000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MarsgateMysteryLog",
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