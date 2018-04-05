-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 7",
	'file_name', "Mystery_7",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Trigger",
		'autostart', true,
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_missionSponsor = GetMissionSponsor().display_name",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "initializes all registers",
			'sequence', "Init",
		}),
		PlaceObj('SA_WaitExpression', {
			'comment', "trigger condition",
			'expression', "#(UICity.labels.Colonist or empty_table) >= 150",
			'duration', 5000,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8158, --[[Scenario Mystery 7 title]] "The Last War: Before The Storm"},
			'voiced_text', T{8159, --[[voice:narrator]] "We have devastating news from Earth!"},
			'text', T{8160, --[[Scenario Mystery 7 text]] "A chain of attacks has reduced to ruins major temples and landmarks in Southeast Asia. Preliminary estimates put the body count in the hundreds. \n\nDespite the scale of the attacks, the perpetrators are believed to be terrorists of a new kind. So far no one has taken responsibility as tensions are high and the blame game is in full swing. \n\nThere is still a lot of confusion. We will be following the events as they unfold."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
			'choice1', T{8161, --[[Scenario Mystery 7 choice1]] "What a tragedy!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8162, --[[Scenario Mystery 7 text]] "Disturbing news from Earth! Terrorist attacks have disturbed the relative peace Earth currently enjoys."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 300000,
			'rand_duration', 450000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8163, --[[Scenario Mystery 7 title]] "The Last War: As Tensions Rise"},
			'voiced_text', T{8164, --[[voice:narrator]] "In the wake of the attacks in Asia, many dormant grievances between the nations affected have been reignited - some of which go far back in time. "},
			'text', T{8165, --[[Scenario Mystery 7 text]] "The UN has set out a tension meter as it warns that this situation has the potential to escalate into an all-out war if measures aren’t taken.\n \nThe goal of the meter is to try and give an objective representation of where things are now and to help us understand what works and what doesn’t. Everyone in the UN is asked to step in and do all they can to help calm the spirits.\n\nSo far we can see no adequate way to help from here.\n\n<effect>You must find ways to keep the tension from reaching 100%. Upon bringing tensions down to 0% the conflicts on Earth will be successfully resolved. Tensions will rise up from events that happen on Earth and are out of your control."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8166, --[[Scenario Mystery 7 choice1]] "We will be following the situation closely."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8167, --[[Scenario Mystery 7 text]] "The terrorist bombings are igniting tensions around the world. The UN has set out a tension meter and warns of a global conflict."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "War Tension accumulator",
			'sequence', "War Tension Increase",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "Flavor at 25% tension",
			'sequence', "25 Tension Flavor",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "Flavor at 40% tension",
			'sequence', "40 Tension Flavor",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "Flavor at 80% tension",
			'sequence', "80 Tension Flavor",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "Game Over effect",
			'sequence', "Tension Game Over",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Local Wars",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8168, --[[Scenario Mystery 7 title]] "The Last War: Peacemaker"},
			'voiced_text', T{8169, --[[voice:narrator]] "Our sponsor has informed us that it's now playing a major role in peacekeeping efforts. They are also providing humanitarian aid to vast territories that are affected by the crisis. "},
			'text', T{8170, --[[Scenario Mystery 7 text]] "Millions have been displaced and food is of severe shortage. \n\nWe have been given a heads up that resource supply from Earth will soon become unavailable for an unspecified amount of time. Now all eyes on Earth are on <reg_param1> and there are those who will benefit greatly by branding them hypocritical in their commitment and intentions - hampering all progress towards peace.  \n\n<effect>Resupply with resources from Earth will be unavailable after 5 Sols. Take care to order any needed resources soon."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{8171, --[[Scenario Mystery 7 choice1]] "We should brace ourselves for a tough time ahead."},
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8172, --[[Scenario Mystery 7 title]] "The Last War: Resupply Cutoff"},
			'voiced_text', T{8173, --[[voice:narrator]] "The supply embargo is now in effect."},
			'text', T{8174, --[[Scenario Mystery 7 text]] "We must make do with what we can obtain by ourselves for however long a period this turns out to be. \n\n<effect>Resupply with resources is now unavailable."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'choice1', T{8175, --[[Scenario Mystery 7 choice1]] "Conservation takes priority."},
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("Metals", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("Concrete", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("Polymers", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("Electronics", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("MachineParts", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'LockImport("Food", "ResupplyCutoff")',
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8176, --[[Scenario Mystery 7 text]] "Supply resources from Earth have temporarily been stopped."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8177, --[[Scenario Mystery 7 title]] "The Last War: Off-World Safety"},
			'voiced_text', T{8178, --[[voice:narrator]] "With millions of refugees, and governments reluctant to take in any at all, a humanitarian crisis on an unprecedented scale has developed. "},
			'text', T{8179, --[[Scenario Mystery 7 text]] "Dug in our struggle to survive on Mars, we seem to have taken for granted that Earth - a place where there is enough of everything we need so desperately up here - is always there for us should we need it. Now that we have established a somewhat solid presence on Mars, and Earth seems to be in a dark place, it seems we may have the opportunity to return the favor.\n\n<reg_param1> has sent a request that we start accepting refugees. They hope this drastic measure to get people to safety will highlight the absurdity of regional governments not taking in refugees and put pressure on them by their own populace.\n\n<effect>20 Refugees want to join the Colony. Accepting them will decrease the War Tension, but could the colony support this additional population?"},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{8180, --[[Scenario Mystery 7 choice1]] "Start planning."},
		}),
		PlaceObj('SA_CallRefugeeRocket', {
			'description', T{8181, --[[Scenario Mystery 7 description]] "Refugees fleeing from the conflicts on Earth want to join our colony."},
			'rocket_id', "FirstRefugeeRocket",
			'display_name', T{8123, --[[Scenario Mystery 7 display_name]] "Refugee Rocket"},
			'travel_time_mars', 0,
			'timeout', 3600000,
			'num_refugees', 20,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Refugee Rocket Landing",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8182, --[[Scenario Mystery 7 text]] "Refugees have arrived."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "UN Inspection",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8183, --[[Scenario Mystery 7 title]] "The Last War: It Has Begun"},
			'voiced_text', T{8184, --[[voice:narrator]] "It has begun. The moment that seemed unthinkable less than a year ago."},
			'text', T{8185, --[[Scenario Mystery 7 text]] "Regional conflicts have dragged the major powers on Earth to declare war on one another. Earth is now officially going through its Third World War. \n\nSo far no nuclear weapons are reported to have been used, and we pray to whatever gods are listening up here on Mars, that none will be used. But somewhere in the now abandoned halls of the UN building in New York, the Doomsday Clock sits in the dark - with its warning having fallen on deaf ears and its hands perilously close to midnight.\n\n<effect>All rockets are unavailable due to chaos on Earth."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
			'choice1', T{8186, --[[Scenario Mystery 7 choice1]] "War, war never changes."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8187, --[[Scenario Mystery 7 text]] "Major powers declare war on one another - rockets are unavailable."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', -1,
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8188, --[[Scenario Mystery 7 title]] "The Last War: Supply Line Back"},
			'voiced_text', T{8189, --[[voice:narrator]] "We have received some good news, for a change!"},
			'text', T{8190, --[[Scenario Mystery 7 text]] "Among the chaos on Earth, our sponsor hasn't forgotten about us. They tell us that bad PR is the least of their concerns right now and we can once again request supply rockets from them. However, all resources are very scarce on Earth and will remain unavailable for us.\n\n<effect>Rockets from Earth are available once again. Resources are still unavailable."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'choice1', T{8191, --[[Scenario Mystery 7 choice1]] "I have mixed feelings about this."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8545, --[[Scenario Mystery 7 text]] "Supply rockets are available once more, but not for resources."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8192, --[[Scenario Mystery 7 title]] "The Last War: Feeding the Hand That Feeds"},
			'voiced_text', T{8193, --[[voice:narrator]] "It may seem that Earth has been engulfed with slowly spreading madness, but there are those who haven’t lost their minds to the war craze, and are actively working to restore peace. "},
			'text', T{8194, --[[Scenario Mystery 7 text]] "As major mining operations on Earth are easy targets for today’s weapons, <reg_param1> believes that a supply of Rare Metals from Mars will greatly help their peacekeeping efforts.\n\n<effect>You can now send Rare Metals to Earth to decrease War Tension, instead of receiving Funding. Rockets for the shipments will arrive regularly."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{8195, --[[Scenario Mystery 7 choice1]] "Audit all our reserves and prepare for sending out supply missions to Earth!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8196, --[[Scenario Mystery 7 text]] "Trade rockets for Rare Metals will arrive periodically to reduce War Tension."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "repeatable rare metal trade rockets",
			'sequence', "RareMetal Trade Rocket",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8197, --[[Scenario Mystery 7 title]] "The Last War: Earth Attacks!!!"},
			'voiced_text', T{8198, --[[voice:narrator]] "Our support for our sponsors has brought attention to us once more and now retaliation is imminent!"},
			'text', T{8199, --[[Scenario Mystery 7 text]] "Several objects that were in unspecified orbits around the Sun and not far from Mars have suddenly changed trajectory and are heading our way. All gathered observations point towards old dormant weapons from the time before the space weapon bans came into power.\n\n<effect>Our colony is being bombarded!\n<hint>MDS Lasers can protect the surrounding area from bombardment"},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'choice1', T{8200, --[[Scenario Mystery 7 choice1]] "Prepare for bombardment!"},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Bombardment",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8201, --[[Scenario Mystery 7 title]] "The Last War: Embracing the Void"},
			'voiced_text', T{8202, --[[voice:narrator]] "From out here, Earth is indeed a pale blue dot. It seems so peaceful and tranquil, yet the harrowing stories of those who have witnessed the recent events there point to a reality which is anything but."},
			'text', T{8203, --[[Scenario Mystery 7 text]] "Millions of people want to flee Earth for the - what now looks like - relative safety of Mars. It is impossible to help them all, but we might endure the extra strain and save some more souls from the war and bring hope to all those we can’t.\n\n<effect>Even more refugees want to join the Colony. Accepting them will decrease the War Tension, but could the colony support this additional population?"},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
			'choice1', T{8204, --[[Scenario Mystery 7 choice1]] "Help as many as we can - then help more!"},
		}),
		PlaceObj('SA_CallRefugeeRocket', {
			'description', T{8181, --[[Scenario Mystery 7 description]] "Refugees fleeing from the conflicts on Earth want to join our colony."},
			'rocket_id', "SecondRefugeeRocket",
			'display_name', T{8123, --[[Scenario Mystery 7 display_name]] "Refugee Rocket"},
			'travel_time_mars', 0,
			'timeout', 3600000,
			'num_refugees', 50,
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8205, --[[Scenario Mystery 7 text]] "More refugees arrive on Mars."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Second Refugee Rocket",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Comet Sighted",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "This is 10 to avoid overlapping 2 Check Deaths sequences",
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8206, --[[Scenario Mystery 7 title]] "The Last War: Noah’s Ark"},
			'voiced_text', T{8207, --[[voice:narrator]] "We have been informed that even more refugees are being sent our way."},
			'text', T{8208, --[[Scenario Mystery 7 text]] "One would argue this is an extreme and unpractical plan, not to mention the extra weight risks dooming the entire Mars project altogether. \n\nHowever, there are those who believe this is an effort to save as many people as possible from what some predict to be a war that ends humanity on Earth. \n\n<effect>Even more refugees want to come to Mars."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
			'choice1', T{8209, --[[Scenario Mystery 7 choice1]] "Our resilience is being tested."},
		}),
		PlaceObj('SA_CallRefugeeRocket', {
			'description', T{8181, --[[Scenario Mystery 7 description]] "Refugees fleeing from the conflicts on Earth want to join our colony."},
			'rocket_id', "ThirdRefugeeRocket",
			'display_name', T{8123, --[[Scenario Mystery 7 display_name]] "Refugee Rocket"},
			'travel_time_mars', 0,
			'timeout', 3600000,
			'num_refugees', 100,
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8210, --[[Scenario Mystery 7 text]] "Even more refugees come to Mars."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Third Refugee Rocket",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "RareMetal Trade Rocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "RareMetalTradeRocket" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8211, --[[Scenario Mystery 7 title]] "The Last War: The Grand Push"},
			'voiced_text', T{8212, --[[voice:narrator]] "There seems to be little time to stop the war from reaching a point of no return, yet time is all we have."},
			'text', T{8213, --[[Scenario Mystery 7 text]] "After doing their best to avoid the war from happening, and ultimately failing to do so, <reg_param1> are now determined to see it through.\n\nA final desperate push to complete several separate projects is underway. The projects aim at dramatically shifting the projected direction of the war and bringing everybody to the table to discuss ending it once and for all.\n\nAs the war has ravaged most of Earth's resource infrastructure, <reg_param1> is asking we contribute resources they are short on and urge haste, certain they do not need to explain why.\n\n<effect>Supply the requested resources to decrease War Tension significantly. Be careful - the conflict on Earth is escalating and we have a limited time frame to resolve it."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{8214, --[[Scenario Mystery 7 choice1]] "The future of Earth is pretty much in our hands now."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "TradeRocket_RareMetals",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "TradeRocket_Metals",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "TradeRocket_Electronics",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "TradeRocket_MachineParts",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "TradeRocket_Food",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "WinAfter5Rockets",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 21600000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8215, --[[Scenario Mystery 7 title]] "The Last War: Time Passes"},
			'voiced_text', T{8216, --[[voice:narrator]] "Tackling the everyday challenges of Mars is a handful on its own, but we mustn't forget that our home world is currently on the brink of annihilation. "},
			'text', T{8217, --[[Scenario Mystery 7 text]] "The narrow window of time we have to act will soon close and the fate of Earth, with which our own fate is very much intertwined with, will be out of our hands.\n\nWe must send the requested supplies to Earth as soon as possible! If we do not act with all haste, there may be no living soul left to receive them very soon."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8218, --[[Scenario Mystery 7 choice1]] "Time is of the essence."},
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Timeout",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Init",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = 0",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = 0",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "War Tension Increase",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = 10",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "started here to make sure that WarTension is already > 0",
			'sequence', "Victory",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery7WarTension",
			'autoupdate', true,
			'interval', 5,
			'text', T{8219, --[[Scenario Mystery 7 text]] "War Tension: <reg_param1>%"},
			'reg_param1', "_WarTension",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 600000,
			'rand_duration', 300000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 1",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "25 Tension Flavor",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_WarTension >= 30",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8220, --[[Scenario Mystery 7 title]] "The Last War: Doomsday Clock"},
			'voiced_text', T{8221, --[[voice:narrator]] "Tensions are rising at a rate faster than even the most pessimistic predictions."},
			'text', T{8222, --[[Scenario Mystery 7 text]] "The UN has adopted the Doomsday Clock that the Bulletin of Atomic Scientists has used since the end of World War Two - to highlight how close humanity is to self-extinction. It is now set at Two Minutes to Midnight, a level at which it hasn’t been at since the early 21st century."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8223, --[[Scenario Mystery 7 choice1]] "Things are spiraling out of control."},
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "40 Tension Flavor",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_WarTension >= 40",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8224, --[[Scenario Mystery 7 title]] "The Last War: Boiling Point"},
			'voiced_text', T{8225, --[[voice:narrator]] "We are officially One Minute to Midnight and most observers are bracing for a prolonged global war which now seems unavoidable."},
			'text', T{8226, --[[Scenario Mystery 7 text]] "At this point hoping that no one resorts to weapons of mass destruction classifies you as an optimist."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8227, --[[Scenario Mystery 7 choice1]] "How did we get here?"},
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "80 Tension Flavor",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_WarTension >= 80",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8228, --[[Scenario Mystery 7 title]] "The Last War: Dire Situation"},
			'voiced_text', T{8229, --[[voice:narrator]] "The end of human civilization on Earth has never been closer."},
			'text', T{8230, --[[Scenario Mystery 7 text]] "We are 80% on track and are still going at full speed on this downhill race towards Armageddon. Right now it seems we might be Earth's only hope. \n\nWe must step up our game and help our sponsor bring things to a conclusion in which the Earth is not scorched by a thousand nuclear detonations.\n\nMake no mistake - although we live our lives on a different world, our fate is very closely tied to that of our mother planet."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8231, --[[Scenario Mystery 7 choice1]] "Could this really be the end?"},
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Tension Game Over",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_WarTension >= 100",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8232, --[[Scenario Mystery 7 title]] "The Last War: The Day After Tomorrow"},
			'voiced_text', T{8233, --[[voice:narrator]] "Silence… After a brief increase in brightness, everything has fallen silent."},
			'text', T{8234, --[[Scenario Mystery 7 text]] "We are scrambling to re-establish communications with Earth, but for the first time no one seems to be listening. Deep down, everyone knows that the unfathomable has happened. \n\nThere is denial, there is depression, yet we all know… for the nature of the luminosity spike can be one thing and one thing only: utter nuclear devastation spread all over the globe.\n\nWe will keep on listening, maybe someday someone will talk back.\n\n<effect>Earth was devastated by the war. Export, Resupply, Research Outsourcing and Applicants have been disabled indefinitely."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
			'choice1', T{8235, --[[Scenario Mystery 7 choice1]] "We are truly alone now."},
		}),
		PlaceObj('SA_Comment', {
			'comment', "Cleanup",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8546, --[[Scenario Mystery 7 text]] "Earth is devastated by the war. Contact with our home planet is lost."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery7WarTension")',
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Trigger",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "War Tension Increase",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Victory",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "RareMetal Trade Rocket",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Bombardment",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Timeout",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "RareMetalTradeRocket" or id == "RareMetals" or id == "Metals" or id == "Electronics" or id == "Food" or id == "MachineParts" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Effects",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "gameover")',
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', -1,
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', 1,
			'target_gameplayconst', "OutsourceDisabled",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 36000000,
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "OutsourceDisabled",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8236, --[[Scenario Mystery 7 title]] "The Last War: New World Order"},
			'voiced_text', T{8237, --[[voice:narrator]] "Today we received the call we've been hoping for!"},
			'text', T{8238, --[[Scenario Mystery 7 text]] "There are humans left on Earth and they are reemerging to form a new society.\n\nThey inform us that things are very different now and Earth will never be the same again. Things are much more difficult; the environment is harsher and sunlight is scarcer; there is little resource to go around and most technological advancements have been lost to nuclear fire.\n\nBut they see this as a means of a new clean beginning and have expressed their desire to cooperate with us, this time as true equals.\n\n<effect>Contact with Earth has been re-established. Rockets are available once again."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'choice1', T{8239, --[[Scenario Mystery 7 choice1]] "A new chapter for all of humanity begins."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8547, --[[Scenario Mystery 7 text]] "A new society emerged from the ruins on Earth."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Metals", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Concrete", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Polymers", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Electronics", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("MachineParts", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Food", "ResupplyCutoff")',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Local Wars",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "ChoiceA_Tension = 5",
		}),
		PlaceObj('SA_Exec', {
			'expression', "ChoiceB_Applicants = 50",
		}),
		PlaceObj('SA_Exec', {
			'expression', "ChoiceB_Tension = 10",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8240, --[[Scenario Mystery 7 text]] "Only united can we hope to conquer the void. (constrain War Tension increase to <ChoiceA_Tension>%)"},
			'result', "ToneA",
			'text_reg1', "ChoiceA_Tension",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8241, --[[Scenario Mystery 7 text]] "Earth won't change. (<ChoiceB_Applicants> new applicants; War Tension will increase by <ChoiceB_Tension>%)"},
			'result', "ToneB",
			'text_reg1', "ChoiceB_Applicants",
			'text_reg2', "ChoiceB_Tension",
		}),
		PlaceObj('SA_WaitChoiceEntries', {
			'title', T{8242, --[[Scenario Mystery 7 title]] "The Last War: Local Wars in the Third World"},
			'voiced_text', T{8243, --[[voice:narrator]] "The ripples made by the attacks on Earth have toppled governments and paved the way for opportunists to ride a wave of populist fury."},
			'text', T{8244, --[[Scenario Mystery 7 text]] "Border skirmishes are slowly spilling into full scale invasions and the major powers are so far failing to instate a cease fire. The relative peace Earth has been enjoying for the past century now seems to have been a fragile facade, beneath which grudges and ambitions have been festering in wait for the right moment. \n\nThe organization responsible has all but vanished after accomplishing more that it could have possibly hoped for. \n\nWe, on the other hand, as a symbol of what humanity can achieve when working together and not by fighting between ourselves, are in an unique position to make a statement which may be of actual merit to the situation."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'end_block', 2,
			'expression', 'choice == "ToneA"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + ChoiceA_Tension",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'end_block', 4,
			'expression', 'choice == "ToneB"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + ChoiceB_Tension",
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "ChoiceB_Applicants",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Refugee Rocket Landing",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "NumberOfRefugees = 20",
		}),
		PlaceObj('SA_WaitRefugeeRocket', {
			'rocket_id', "FirstRefugeeRocket",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', 'g_RefugeeOutcome.FirstRefugeeRocket == "success"',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8245, --[[Scenario Mystery 7 text]] "<reg_param1> safely landed in the colony."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - 5",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "check for 10 unnatural deaths",
			'sequence', "Check Deaths",
			'arg1', "10",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8246, --[[Scenario Mystery 7 text]] "<reg_param1> have suffocated in orbit."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 5",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Check Deaths",
		'loc_section', T{--[[section:Wait for the number of unnatural deaths to exceed 5.]] "Wait for the number of unnatural deaths to exceed 5."},
	}, {
		PlaceObj('SA_Comment', {
			'comment', "Wait until the number of unnatural deaths is 10 or more",
		}),
		PlaceObj('SA_Exec', {
			'expression', "max_deaths = tonumber(arg1) or 10",
		}),
		PlaceObj('SA_Exec', {
			'expression', "start_deaths = UnnaturalDeaths",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UnnaturalDeaths - start_deaths >= max_deaths ",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8247, --[[Scenario Mystery 7 title]] "The Last War: Too Many Unnatural Deaths"},
			'voiced_text', T{8248, --[[voice:narrator]] "Be it from the extra influx of colonists, the shortage of help from Earth or other reasons all together, the number of recently perished colonists by unnatural causes is disturbing. "},
			'text', T{8249, --[[Scenario Mystery 7 text]] "People on Earth have been served a grim reminder that although far from the massive problems that they are experiencing right now, Mars is far from the safe heaven many have probably fooled themselves into believing.\n\n<effect>Too many colonists have died recently from unnatural causes. The War Tension has increased."},
			'image', "UI/Messages/the_last_war_mystery_02.tga",
			'choice1', T{8250, --[[Scenario Mystery 7 choice1]] "A sad day for humanity."},
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 5",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "RareMetal Trade Rocket",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_CallTradeRocket', {
			'comment', "check if fuel consumption works with techs",
			'description', T{8251, --[[Scenario Mystery 7 description]] "Send Rare Metals to Earth to decrease War Tension, instead of receiving Funding. Rockets for the shipments will arrive regularly."},
			'rocket_id', "RareMetalTradeRocket",
			'display_name', T{8252, --[[Scenario Mystery 7 display_name]] "Rare Metals Rocket"},
			'resource1', "PreciousMetals",
			'amount1', 30000,
			'fuel_amount', 60000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "RareMetalTradeRocket",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - 10",
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "RareMetalTradeRocket",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 2880000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "UN Inspection",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "ChoiceA_MoralePenalty = 10",
		}),
		PlaceObj('SA_Exec', {
			'expression', "ChoiceB_TensionIncrease = 10",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8253, --[[Scenario Mystery 7 text]] "Submit to UN inspection. (-<ChoiceA_MoralePenalty> Morale to all colonists)"},
			'result', "ChoiceA",
			'text_reg1', "ChoiceA_MoralePenalty",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8254, --[[Scenario Mystery 7 text]] "Deny allegations. (+<ChoiceB_TensionIncrease>% War Tension)"},
			'result', "ChoiceB",
			'text_reg1', "ChoiceB_TensionIncrease",
		}),
		PlaceObj('SA_WaitChoiceEntries', {
			'title', T{8255, --[[Scenario Mystery 7 title]] "The Last War: Closer to Home"},
			'voiced_text', T{8256, --[[voice:narrator]] "A blatant lie is gaining traction on Earth."},
			'text', T{8257, --[[Scenario Mystery 7 text]] "A faction in the wars on Earth, an alliance of several smaller states, has come out and outright accused <reg_param1> of using the Mars project as a backdrop for developing and testing forbidden weapons, which are then used on their people.   \n\nThe UN has requested that we allow a probe to be made so this nonsense is cleared, although we fear that instilling such doubts in our colonists may have an impact on morale as a whole.\n\nWhat do we do?"},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'reg_param1', "_missionSponsor",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'end_block', 2,
			'expression', 'choice == "ChoiceA"',
		}),
		PlaceObj('SA_ChangeStat', {
			'Label', "Colonist",
			'Stat', "Morale",
			'Amount', "-const.Scale.Stat *  ChoiceA_MoralePenalty",
			'Duration', -1,
			'MoraleReason', T{8258, --[[Scenario Mystery 7 MoraleReason]] "<red>UN inspection -10</red>"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'end_block', 4,
			'expression', 'choice == "ChoiceB"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + ChoiceB_TensionIncrease",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Bombardment",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_PickRandomObject', {
			'obj_label', "Domes",
			'store_obj', "RandomDome",
		}),
		PlaceObj('SA_Exec', {
			'expression', "StartBombard(RandomDome, 500*guim, 20, 2000, 6000)",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "BombardEnd",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
			'rand_duration', 7200000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Second Refugee Rocket",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "NumberOfRefugees = 50",
		}),
		PlaceObj('SA_WaitRefugeeRocket', {
			'rocket_id', "SecondRefugeeRocket",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', 'g_RefugeeOutcome.SecondRefugeeRocket == "success"',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8245, --[[Scenario Mystery 7 text]] "<reg_param1> safely landed in the colony."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - 10",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "check for 10 unnatural deaths",
			'sequence', "Check Deaths",
			'arg1', "10",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8246, --[[Scenario Mystery 7 text]] "<reg_param1> have suffocated in orbit."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 5",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Comet Sighted",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "Tension = 10",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8259, --[[Scenario Mystery 7 text]] "I thought we lived in more enlightened times. (+<Tension>% War Tension)"},
			'result', "ChoiceA",
			'text_reg1', "Tension",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8260, --[[Scenario Mystery 7 text]] "You do know this comet was predicted to come this close to Earth 50 years ago, right? (+<Tension>% War Tension)"},
			'result', "ChoiceB",
			'text_reg1', "Tension",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8261, --[[Scenario Mystery 7 text]] "Earth has changed a lot since we departed for Mars, and not for the better. (+<Tension>% War Tension)"},
			'result', "ChoiceC",
			'text_reg1', "Tension",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8262, --[[Scenario Mystery 7 text]] "Of course it's an omen. How could it possibly be anything but? (+<Tension>% War Tension)"},
			'result', "ChoiceD",
			'text_reg1', "Tension",
		}),
		PlaceObj('SA_WaitChoiceEntries', {
			'title', T{8263, --[[Scenario Mystery 7 title]] "The Last War: Comet Sighted!"},
			'voiced_text', T{8264, --[[voice:narrator]] "A comet suddenly lit up night skies above Earth, visible from all over the globe. "},
			'text', T{8265, --[[Scenario Mystery 7 text]] "Although the comet is well known and talked about by most space agencies, in the current atmosphere on Earth people have little time for space news and have chosen to see an omen in it. \n\nMost interpretations have been that victory is imminent for the interpreter, but more alarmingly many believe this is a sign of the end times. \n\nSome have chosen to embrace it… risking this becoming a self-fulfilling prophecy.\n\nWe have to talk some sense into the Earthlings."},
			'image', "UI/Messages/the_last_war_mystery_01.tga",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 10",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Third Refugee Rocket",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "NumberOfRefugees = 100",
		}),
		PlaceObj('SA_WaitRefugeeRocket', {
			'rocket_id', "ThirdRefugeeRocket",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', 'g_RefugeeOutcome.ThirdRefugeeRocket == "success"',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8245, --[[Scenario Mystery 7 text]] "<reg_param1> safely landed in the colony."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - 20",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "check for 10 unnatural deaths",
			'sequence', "Check Deaths",
			'arg1', "10",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "RefugeeRocket",
			'text', T{8246, --[[Scenario Mystery 7 text]] "<reg_param1> have suffocated in orbit."},
			'reg_param1', "NumberOfRefugees",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension + 5",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "TradeRocket_RareMetals",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "TensionReduction = 30",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8266, --[[Scenario Mystery 7 description]] "Export Rare Metals to Earth and reduce War Tension."},
			'rocket_id', "RareMetals",
			'display_name', T{8267, --[[Scenario Mystery 7 display_name]] "Rare Metals Rocket"},
			'resource1', "PreciousMetals",
			'amount1', 100000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "RareMetals",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - TensionReduction",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = _RocketCounter + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "TradeRocket_Metals",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "TensionReduction = 30",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8268, --[[Scenario Mystery 7 description]] "Export Metals to Earth and reduce War Tension."},
			'rocket_id', "Metals",
			'display_name', T{8269, --[[Scenario Mystery 7 display_name]] "Metals Rocket"},
			'resource1', "Metals",
			'amount1', 400000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "Metals",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - TensionReduction",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = _RocketCounter + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "TradeRocket_Electronics",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "TensionReduction = 30",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8270, --[[Scenario Mystery 7 description]] "Export Electronics to Earth and reduce War Tension."},
			'rocket_id', "Electronics",
			'display_name', T{8271, --[[Scenario Mystery 7 display_name]] "Electronics Rocket"},
			'resource1', "Electronics",
			'amount1', 200000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "Electronics",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - TensionReduction",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = _RocketCounter + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "TradeRocket_MachineParts",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "TensionReduction = 30",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8272, --[[Scenario Mystery 7 description]] "Export Machine Parts to Earth and reduce War Tension."},
			'rocket_id', "MachineParts",
			'display_name', T{8273, --[[Scenario Mystery 7 display_name]] "Machine Parts Rocket"},
			'resource1', "MachineParts",
			'amount1', 200000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "MachineParts",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - TensionReduction",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = _RocketCounter + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "TradeRocket_Food",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "TensionReduction = 30",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8274, --[[Scenario Mystery 7 description]] "Export Food to Earth and reduce War Tension."},
			'rocket_id', "Food",
			'display_name', T{8275, --[[Scenario Mystery 7 display_name]] "Food Rocket"},
			'resource1', "Food",
			'amount1', 200000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "Food",
			'wait_status', "departing",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = _WarTension - TensionReduction",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RocketCounter = _RocketCounter + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "WinAfter5Rockets",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_RocketCounter >= 5",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_WarTension = 0",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Timeout",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{8276, --[[Scenario Mystery 7 title]] "The Last War: Cold War 2.0"},
			'voiced_text', T{8277, --[[voice:narrator]] "Ceasefires are taking effect and armies are pulling back behind borders."},
			'text', T{8278, --[[Scenario Mystery 7 text]] "Mistrust and disbelief is rampant and while the guns are finally silent, the road to healing the wounds of war will be longer than anything Earth has ever experienced before. \n\nMillions have perished and those who survived will suffer a divide so huge, it seems impossible to fill. \n\nIn what almost seems as an apathetic effort to move on, <reg_param1> has informed us that we are to continue the project and its business as usual – with the exception that now everything costs more after the devastation on Earth.\n\n<effect>Resupply prices increased by 50% for the next 50 Sols."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'reg_param1', "_missionSponsor",
			'choice1', T{8279, --[[Scenario Mystery 7 choice1]] "Earth survived, but at what cost?"},
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "timeout")',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Cleanup",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8548, --[[Scenario Mystery 7 text]] "A ceasefire was signed, but Earth is caught in the grip of a new Cold War. All resupply prices have been increased."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery7WarTension")',
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Trigger",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "War Tension Increase",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Tension Game Over",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "RareMetal Trade Rocket",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Bombardment",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Victory",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "80 Tension Flavor",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "40 Tension Flavor",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "25 Tension Flavor",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "RareMetalTradeRocket" or id == "RareMetals" or id == "Metals" or id == "Electronics" or id == "Food" or id == "MachineParts" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Effects",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Metals", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Concrete", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Polymers", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Electronics", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("MachineParts", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Food", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'ModifyResupplyParams("price", 50) ',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "consider adding a message after this",
			'wait_type', "Sols",
			'duration', 36000000,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'ModifyResupplyParams("price", -50) ',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Victory",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_WarTension <= 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "victory")',
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Grant Wonder Tech",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 200,
		}),
		PlaceObj('SA_Comment', {
			'comment', "Rewards",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Metals", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Concrete", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Polymers", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Electronics", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("MachineParts", "ResupplyCutoff")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockImport("Food", "ResupplyCutoff")',
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "50",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'percent', -35,
			'target_gameplayconst', "ApplicantGenerationInterval",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'ModifyResupplyParams("price", -50) ',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Cleanup",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8549, --[[Scenario Mystery 7 text]] "The war is over! Sound minds and human compassion emerged victorious."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery7WarTension")',
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Trigger",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "War Tension Increase",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Tension Game Over",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "RareMetal Trade Rocket",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Bombardment",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Timeout",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Check Deaths",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "80 Tension Flavor",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "40 Tension Flavor",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "25 Tension Flavor",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "RareMetalTradeRocket" or id == "RareMetals" or id == "Metals" or id == "Electronics" or id == "Food" or id == "MachineParts" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 5000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8280, --[[Scenario Mystery 7 title]] "The Last War: Peace-keepers Prevail!"},
			'voiced_text', T{8281, --[[voice:narrator]] "Hatred has lost! Sound minds and human compassion emerge victorious. "},
			'text', T{8282, --[[Scenario Mystery 7 text]] "The Drums of War have ceased their relentless beating and those who survived the wars are looking at the death and destruction it caused. \n\nNever has it been so obvious how little a spark can wipe out our race once and for all and this has reached the heart of every human soul on Earth. \n\nAs the dead and fallen are being honored, pacts and treaties, forged with compassion and good will, are being signed all over the globe. Our colony on Mars and <reg_param1> have been identified as champions of this peace.\n\nWe have received the Honor of Hope and have become the symbol of humanity, closer to everyone’s hearts and minds than ever before. Every nation wishes to repay us in any way possible. \n\n<effect>A spike of applicants and a dramatic reduction in prices are the short term benefits we are promised to expect.\n\n<effect>Gained a new Technology, <em><reg_param2></em>."},
			'image', "UI/Messages/the_last_war_mystery_03.tga",
			'reg_param1', "_missionSponsor",
			'reg_param2', "_grantedTech",
			'choice1', T{8283, --[[Scenario Mystery 7 choice1]] "Celebrate, but never forget!"},
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Grant Wonder Tech",
	}, {
		PlaceObj('SA_Exec', {
			'comment', "Grants either a wonder tech that is not researched or a new breakthrough tech",
			'expression', "tech_id = GrantWonderTech()",
		}),
		PlaceObj('SA_Exec', {
			'comment', "stores the name of the tech",
			'expression', "_grantedTech = TechDef[tech_id].display_name",
		}),
		}),
	})