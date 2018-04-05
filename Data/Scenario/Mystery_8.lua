-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 8",
	'file_name', "Mystery_8",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Trigger",
		'autostart', true,
	}, {
		PlaceObj('SA_RunSequence', {
			'comment', "initializes all registers",
			'sequence', "Init",
		}),
		PlaceObj('SA_WaitExpression', {
			'comment', "trigger condition",
			'expression', "#(UICity.labels.Colonist or empty_table) >= 100",
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
		PlaceObj('SA_SpawnAnomaly', {
			'random_pos_label', "Building",
			'random_pos_label_dist', 25000,
			'use_random_pos', true,
			'sequence_list', "Mystery 8",
			'sequence', "Anomaly Sequence",
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "Mystery8_AnomalyAnalyzed",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "parallel event; it has its own wait time",
			'sequence', "Contaminated Lab",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "wait 5-10 Sols",
			'wait_type', "Sols",
			'duration', 3600000,
			'rand_duration', 3600000,
		}),
		PlaceObj('SA_AddTrait', {
			'comment', "change to infected trait when it's done",
			'Label', "Colonist",
			'Number', "3",
			'Trait', "Infected",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Infection Trait Spread",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8284, --[[Scenario Mystery 8 title]] "Wildfire: Infection!"},
			'voiced_text', T{8285, --[[voice:narrator]] "We have received a disturbing medical report. A number of colonists have contracted an unknown disease."},
			'text', T{8286, --[[Scenario Mystery 8 text]] "The medical examination shows they all suffer from a form of hypercoagulation. Anti-coagulation medicines have been issued but the symptoms remain. Primary analysis of the patients’ blood samples hasn't found the cause behind the symptoms, but the level of damage to the erythrocytes leads to the workings of a virus-sized or smaller agent. We’re currently running a thorough check on the patients’ background information and behavior to find the source of the infection.\n\n<effect>Several Colonists have gained the Infected trait."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'choice1', T{8287, --[[Scenario Mystery 8 choice1]] "I’ll inform Earth Control to enact decontamination protocols on any cargo we send."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8288, --[[Scenario Mystery 8 text]] "Some Colonists have contracted a mysterious infection. It's spreading rapidly across the colony."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Comment', {
			'comment', 'add a notification for "newly infected colonists"',
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "fluff text",
			'sequence', "Cannot Be Prevented",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "waits for a rocket to Earth",
			'sequence', "Rocket To Earth",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "Earth is infected after some time even without a rocket",
			'sequence', "Earth Infected Timeout",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 10800000,
			'rand_duration', 3600000,
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "WildfireCure",
			'cost', 90000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8289, --[[Scenario Mystery 8 title]] "Wildfire: Quenching the Flames"},
			'voiced_text', T{8290, --[[voice:narrator]] "So far the bizarre nature of the infection has defeated all of our attempts to stop it. Yet time is growing short as more and more people are getting sick."},
			'text', T{8291, --[[Scenario Mystery 8 text]] "The challenge would be monumental as our researchers lack any epidemiological data on which to step up. The medical records we’ve gathered point out the symptoms, but the chemical structure of the agent is so alien that it cannot be compared to anything known to science. To make things worse, the nano-scale of the agent makes analysis even harder. Only by diverting enough resources to the task we can hope to make any breakthrough.\n\n<effect>The <em>Wildfire Cure</em> research has become available.\n<hint>Each newly constructed Medical Building will grant a 5% Tech Boost to the Wildfire Cure research (maximum 50%)."},
			'image', "UI/Messages/wildfire_mystery_02.tga",
			'choice1', T{8292, --[[Scenario Mystery 8 choice1]] "Finally, a glimmer of hope!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8475, --[[Scenario Mystery 8 text]] "Our scientists have devised a complex plan to discover the cure for the Wildfire infection. It would be a monumental effort but we must prioritize the research to be able to find a solution to the growing crisis."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8550, --[[Scenario Mystery 8 text]] "Constructing new Medical buildings which gather data about the infection could speed up the progress towards discovering the Wildfire Cure."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "SpeedUpResearch",
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "WildfireCure",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockBuilding("StorageMysteryResource")',
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "Stop Infection Level increase",
			'sequence', "SpeedUpResearch",
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "Stop Infection Level increase",
			'sequence', "Infection Increase",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8293, --[[Scenario Mystery 8 title]] "Wildfire: The Cure"},
			'voiced_text', T{8294, --[[voice:narrator]] "Tremendous news! The cure for the Wildfire disease has been discovered!"},
			'text', T{8295, --[[Scenario Mystery 8 text]] "A genetically modified strain of the Martian Wildfire interfaces with the RNA of the virus and effectively stops it from coagulating the blood plasma of the host. The intake of only a small amount of the cure is enough to halt the development of the disease, even though it wouldn't repair the tissue damage suffered so far.\n\nThe scientists experimented with multiple growth mediums and discovered that the most effective way to proliferate the medicine is by introducing it in mold cells growing on potatoes. This is great news because we can provide enough biomass for the modified mold to grow and if we do it quickly, we can still stand a chance to end the suffering on Earth.\n\n<effect>The Curetato Crop has become available. Harvesting it will produce Cure for the Wildfire infection, which in turn has to be exported to Earth to end the crisis.\n\n<effect> Colonists with the Infected trait will be cured permanently after their first visit in a Medical Building."},
			'image', "UI/Messages/wildfire_mystery_03.tga",
			'choice1', T{8296, --[[Scenario Mystery 8 choice1]] "Start the process immediately. Time is of the essence!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8476, --[[Scenario Mystery 8 text]] "The Cure for Wildfire has been discovered! Conveniently spliced in modified mold cells, the cure can be grown on plant biomass. We have to produce it en masse!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "Stop contaminating colonists with trait",
			'sequence', "Infection Trait Spread",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockCrop("Cure")',
		}),
		PlaceObj('SA_Exec', {
			'comment', "trait will now start to disappear",
			'expression', 'Msg("Mystery8_BeginHealing")',
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Trade Rockets",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "No Infected On Mars",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Init",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = 0",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_EarthInfected = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_EarthCured = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_FundingReward = 200 * 1000000",
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
		'name', "Anomaly Sequence",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Mystery 8 title]] "Anomaly Analyzed"},
			'voiced_text', T{8297, --[[voice:narrator]] "The faint distress signal led us to the burial site of a small satellite. It had fallen deep under the red sands and could have been there for an eternity."},
			'text', T{8298, --[[Scenario Mystery 8 text]] "It’s strange that we couldn't find any information for the flight in the international records. No black box nor signatures can be seen except for a discolored logo, ‘Scoop XI’. Upon opening the hull we found all of the internal systems corroded away by time, with only a small capsule remaining. The biohazard sign on it only served to stir our curiosity, but a closer examination discovered that it has been breached. We assume that the biological material inside has been destroyed. We have ordered the Rover to store the salvage for further analysis."},
			'image', "UI/Messages/debris.tga",
			'choice1', T{8299, --[[Scenario Mystery 8 choice1]] "A curious find. Let’s hope the future will bring more answers than questions on that matter."},
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("Mystery8_AnomalyAnalyzed")',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Contaminated Lab",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.ResearchBuildings and #UICity.labels.ResearchBuildings >= 1",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1440000,
			'rand_duration', 2160000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8300, --[[Scenario Mystery 8 title]] "Wildfire: Contamination!"},
			'voiced_text', T{8301, --[[voice:narrator]] "We've just lost one of our scientific facilities in a disturbing set of events. We’re still investigating the cause of the disaster but there are clues which lead to unsettling conclusions."},
			'text', T{8302, --[[Scenario Mystery 8 text]] "The security log shows that everything started with a malfunction in the storage unit where the analysis samples were stored. After that the internal systems of the laboratory began to rapidly fail one after another. Suspiciously, the damaged systems were all made of plastic and organic polymers, all corroded away within mere seconds.\n\nOur operatives are puzzled with the cause of the chain reaction but the Chief Engineer has pointed out a fact which eluded our attention until now – the remains of the Scoop XI satellite were held in the storage unit of this facility. We didn't take any chances and ordered an emergency decontamination of the building. Let’s hope that whatever was in there has been destroyed.\n\n<effect>A Laboratory has mysteriously malfunctioned."},
			'image', "UI/Messages/wildfire_mystery_02.tga",
			'choice1', T{8303, --[[Scenario Mystery 8 choice1]] "Monitor the colony and report any related cases."},
		}),
		PlaceObj('SA_DamageBuildings', {
			'comment', "there won't be a damaged building if there are no research buildings",
			'Label', "ResearchBuildings",
			'Number', "1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Infection Trait Spread",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
		}),
		PlaceObj('SA_AddTrait', {
			'comment', "change to infected trait when it's done",
			'Label', "Colonist",
			'Number', "1",
			'Trait', "Infected",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cannot Be Prevented",
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 2160000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8304, --[[Scenario Mystery 8 title]] "Wildfire: Mars Aflame"},
			'voiced_text', T{8305, --[[voice:narrator]] "We have to face it – we cannot stop the infection. No matter what we do it keeps spreading across the colony like a wildfire. Hence the name we've given it."},
			'text', T{8306, --[[Scenario Mystery 8 text]] "All attempts to isolate the sources have failed. We can assume that the virus is traveling all across our life support and maintenance circuits. The only way to stop it is to turn off all systems, but this would be a death sentence for the colonists. We've ran out of options."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'choice1', T{8307, --[[Scenario Mystery 8 choice1]] "Don't despair, we will find a solution!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8477, --[[Scenario Mystery 8 text]] "The infection is spreading at alarming rate through the colony. The scientists have named it Wildfire after its virulence and infection pattern."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rocket To Earth",
	}, {
		PlaceObj('SA_WaitMsg', {
			'msg', "RocketReachedEarth",
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "stops timeout",
			'sequence', "Earth Infected Timeout",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 720000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8308, --[[Scenario Mystery 8 title]] "Wildfire: Countdown to Extinction"},
			'voiced_text', T{8309, --[[voice:narrator]] "The worst has happened – Wildfire has infected Earth. It was on board a rocket which returned to Earth and somehow it breached through all decontamination measures."},
			'text', T{8310, --[[Scenario Mystery 8 text]] "The infected personnel at the landing site deteriorated within hours of contracting the infection and the medics couldn't help them. This doesn't match our medical records as Wildfire takes much more time to develop here, on Mars. We suspect a form of rapid mutation due to the changes in the environment.\n\nThe rocket landing site has been placed under quarantine and the authorities have been informed. We can only pray that they manage to prevent the infection from spreading any further.\n\n<effect>Infection Level on Earth has been set to the Contained level. If it reaches the Extinction level, the human population on Earth will be obliterated. Discover the Wildfire Cure and supply it to Earth to prevent this!"},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'choice1', T{8311, --[[Scenario Mystery 8 choice1]] "Cosmos help us all!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "infection level notification",
			'sequence', "Infection Level Update",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8478, --[[Scenario Mystery 8 text]] "One of our rockets has spread the Wildfire infection on Earth. It's spreading rapidly - we have to discover the Cure before the human population on Earth is obliterated!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "increases infection over time",
			'sequence', "Infection Increase",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_EarthInfected = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Earth Infected Timeout",
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
			'rand_duration', 2880000,
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "stops waiting for a rocket to earth",
			'sequence', "Rocket To Earth",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8308, --[[Scenario Mystery 8 title]] "Wildfire: Countdown to Extinction"},
			'voiced_text', T{8312, --[[voice:narrator]] "The worst has happened – Wildfire has infected Earth. We suspect this was caused by a recent meteor impact on Mars which lifted debris and showered them on the Blue Planet."},
			'text', T{8313, --[[Scenario Mystery 8 text]] "Several small settlements in different regions have been infected. The authorities report that the victims have deteriorated within mere hours, something which doesn't match our medical records. On Mars it takes Sols for the Wildfire to kill its host. We suspect some form of rapid mutation due to the changes in the environment.\n\nThe infected areas have been placed under quarantine and we can only pray that the authorities manage to prevent the disease from spreading any further.\n\n<effect>Infection Level on Earth has been set to the Contained level. If it reaches the Extinction level, the human population on Earth will be obliterated. Discover the Wildfire Cure and supply it to Earth to prevent this!"},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'choice1', T{8311, --[[Scenario Mystery 8 choice1]] "Cosmos help us all!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8479, --[[Scenario Mystery 8 text]] "Martian meteors have spread the Wildfire infection on Earth! We must discover the Cure before the entire human population on Earth is obliterated!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "infection level notification",
			'sequence', "Infection Level Update",
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "increases infection over time",
			'sequence', "Infection Increase",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_EarthInfected = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Infection Level Update",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = _InfectionLevel + 1",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Enedmice Effect",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Epidemic Effect",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Pandemic Effect",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Doomsday Epilogue",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 12,
			'Form', "if-then-else",
			'end_block', 14,
			'else_block', 13,
			'expression', "_InfectionLevel < 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'comment', "Contained",
			'id', "Mystery8InfectionLevel",
			'text', T{8314, --[[Scenario Mystery 8 text]] "Contained"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 13,
			'parent', 12,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 4,
			'expression', "_InfectionLevel < 50",
		}),
		PlaceObj('SA_CustomNotification', {
			'comment', "Endemic",
			'id', "Mystery8InfectionLevel",
			'text', T{8315, --[[Scenario Mystery 8 text]] "Endemic"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 6,
			'Form', "if-then-else",
			'end_block', 8,
			'else_block', 7,
			'expression', "_InfectionLevel < 75",
		}),
		PlaceObj('SA_CustomNotification', {
			'comment', "Epidemic",
			'id', "Mystery8InfectionLevel",
			'text', T{8316, --[[Scenario Mystery 8 text]] "Epidemic"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 7,
			'parent', 6,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 9,
			'Form', "if-then-else",
			'end_block', 11,
			'else_block', 10,
			'expression', "_InfectionLevel < 100",
		}),
		PlaceObj('SA_CustomNotification', {
			'comment', "Pandemic",
			'id', "Mystery8InfectionLevel",
			'text', T{8317, --[[Scenario Mystery 8 text]] "Pandemic"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 10,
			'parent', 9,
			'is_else', true,
		}),
		PlaceObj('SA_CustomNotification', {
			'comment', "Doomsday",
			'id', "Mystery8InfectionLevel",
			'text', T{8318, --[[Scenario Mystery 8 text]] "Doomsday"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 11,
			'parent', 9,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 6,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 3,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 14,
			'parent', 12,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 60000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Infection Increase",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 720000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'Form', "if-then-else",
			'end_block', 7,
			'else_block', 4,
			'expression', "_InfectionLevel < 25",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = _InfectionLevel + 3",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 5,
			'Form', "if-then-else",
			'end_block', 8,
			'else_block', 6,
			'expression', "_InfectionLevel < 50",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = _InfectionLevel + 2",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
			'is_else', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = _InfectionLevel + 1",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 5,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 7,
			'parent', 3,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Enedmice Effect",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_InfectionLevel >= 25",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8319, --[[Scenario Mystery 8 title]] "Wildfire: Infection Level - Endemic"},
			'voiced_text', T{8320, --[[voice:narrator]] "The Wildfire virus is spreading on Earth at an alarming rate, threatening entire populations all over the globe. The grim prediction is that soon the entire population of the planet will be affected."},
			'text', T{8321, --[[Scenario Mystery 8 text]] "Scientists on Earth are desperately trying to discover a solution, but so far in vain. The virulence of the local strain is so high that sampling and transporting infected material is a death sentence. The nanoscopic size of the agent makes containment equally hard - biological filters fail to stop it effectively, threatening the safety of any laboratory which attempts to study it. The only solution is to analyze the original strain - the one we have on Mars - in order to find the cure. Time is running short!\n\nMeanwhile, Third World countries are in a state of panic as the Wildfire strikes the poorest communities. Waves of refugees flee the affected regions and many resource operations are simply abandoned by the scared personnel. The market feels the hunger for raw resources and multiple demands have been filed for imports from Mars.\n\n<effect>Infection Level has reached the Endemic state. Export prices have increased for the next <text_param1> Sols as the First World economies feel the hunger for resources."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'text_param1', T{8634, --[[Scenario Mystery 8 text_param1]] "15"},
			'choice1', T{8322, --[[Scenario Mystery 8 choice1]] "Grave news... We have to hurry!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8480, --[[Scenario Mystery 8 text]] "The Wildfire infection is spreading uncontrollably on Earth. The Third World countries are hit harder due to their lack of resources to fight the disease effectively."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Comment', {
			'comment', "Increase rare metal prices for the next 10 Sols",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'percent', 100,
			'target_gameplayconst', "ExportPricePreciousMetals",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 10800000,
		}),
		PlaceObj('SA_Comment', {
			'comment', "remove effect on prices",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "ExportPricePreciousMetals",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Epidemic Effect",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_InfectionLevel >= 50",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8323, --[[Scenario Mystery 8 title]] "Wildfire: Infection Level - Epidemic"},
			'voiced_text', T{8324, --[[voice:narrator]] "Panic and desperation has spread across the population as waves of refugees flee the endemic zones."},
			'text', T{8325, --[[Scenario Mystery 8 text]] "Wildfire has hit the Third World hard. The crisis can be felt across the developing countries and the First World as well. The chaos in the poorest countries resonates across the globe as the raw materials markets are plummeting. Entire resource operations in the Third World countries are abandoned as the workers flee the areas hit by the virus. People in the rich countries vocally support actions to relieve the struggling regions of the Earth and many companies divert resources for charity. Probably there’s still hope for humanity when so many of us refuse to ignore the tragedy of complete strangers.\n\n<effect>Infection Level has reached the Epidemic state. Applicant pool is depleted for the next <text_param1> Sols due to quarantine measures."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'text_param1', T{8635, --[[Scenario Mystery 8 text_param1]] "20"},
			'choice1', T{8326, --[[Scenario Mystery 8 choice1]] "We have to hurry!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8481, --[[Scenario Mystery 8 text]] "The Wildfire has infected the developed countries as well. Panic and desperation are spreading through the population!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Comment', {
			'comment', "deplete applicant pool and stop generation",
		}),
		PlaceObj('SA_Exec', {
			'comment', "clears the pool table",
			'expression', "ClearApplicantPool()",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', 1,
			'target_gameplayconst', "ApplicantSuspendGenerate",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 14400000,
		}),
		PlaceObj('SA_Comment', {
			'comment', "restore applicant generation (make sure modifiers apply correctly)",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "ApplicantSuspendGenerate",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Pandemic Effect",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_InfectionLevel >= 75",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8327, --[[Scenario Mystery 8 title]] "Wildfire: Infection Level - Pandemic"},
			'voiced_text', T{8328, --[[voice:narrator]] "A wave of despair sweeps across the globe as people witness the futility of all measures against Wildfire. Everyone feels that our time on Earth is running short."},
			'text', T{8329, --[[Scenario Mystery 8 text]] "The tragedy in the Third World has struck some of the richer countries as well, as the Wildfire infection has spread across their populations. People stay inside, fearing for their lives. Refugee camps are filling to the brim as entire areas of the world have been depopulated. Despair has brought the worse in some of us and looters raid the stores in the cities while the police and the army are trying to quell the violent riots. The economies of the First World are failing due to the growing crisis and our Sponsor wasn't spared as well. I'm afraid we’re running out of time...\n\n<effect>Infection Level has reached the Pandemic state. Next level - Extinction! All resupply costs are increased for the next <text_param1> Sols due to supply shortages."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'text_param1', T{8636, --[[Scenario Mystery 8 text_param1]] "20"},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8482, --[[Scenario Mystery 8 text]] "The Wildfire has nearly destroyed the human civilization. Scattered pockets of survivors are still dwindling in remote areas of the world."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Comment', {
			'comment', "increase cost of imports",
		}),
		PlaceObj('SA_Exec', {
			'comment', "double price",
			'expression', 'ModifyResupplyParams("price", 100) ',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 14400000,
		}),
		PlaceObj('SA_Comment', {
			'comment', "restore prices",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'ModifyResupplyParams("price", -100) ',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Doomsday Epilogue",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_InfectionLevel >= 100",
		}),
		PlaceObj('SA_Comment', {
			'comment', "Cleanup",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Infection Level Update",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Infection Increase",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery8InfectionLevel")',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8551, --[[Scenario Mystery 8 text]] "Earth's population has been obliterated by the Wildfire infection. No traces of any human activity can be detected. We could be the only humans left out there..."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 200,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Comment', {
			'comment', "Effect",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8331, --[[Scenario Mystery 8 title]] "Wildfire: Extinction Epilogue"},
			'voiced_text', T{8332, --[[voice:narrator]] "Our sensors detect no signs of human activity on the surface of Earth. We must admit that the battle with the Wildfire infection is lost. Night falls over humankind."},
			'text', T{8333, --[[Scenario Mystery 8 text]] "Earth has become an uninhabited mausoleum of our past greatness - the barren, lifeless husks of the once overcrowded megalopolises, the abandoned derelicts of our once great industrial might, the meadows where no children would ever play. The shroud of silence has covered the surface of the Earth and only the wind chimes through the ruins of our past, whispering stories no one is there to listen.\n\nIs this the end? Is the Wildfire infection over, dead in its rampant destruction alongside its human hosts? Or would it mutate further, consuming all life on Earth? Only the children of our children will be able to answer these questions, watching from afar.\n\n<effect>Earth population is devastated by the Wildfire infection! Export, Resupply, Research Outsourcing and Applicants have been disabled indefinitely."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'choice1', T{8334, --[[Scenario Mystery 8 choice1]] "A dark day, but do not lose hope - while we stand, humanity is alive!"},
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "failed")',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Doomsday Effects - stop rockets, outsourcing then restor it after 50 sols",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', 1,
			'target_gameplayconst', "OutsourceDisabled",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', -1,
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 36000000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8335, --[[Scenario Mystery 8 title]] "Wildfire: Dawn of Earth"},
			'voiced_text', T{8336, --[[voice:narrator]] "We've received a radio transmission! From Earth! We thought we were the last humans and now this! Amazing news!"},
			'text', T{8337, --[[Scenario Mystery 8 text]] "The survivors of the Wildfire gathered in remote places of the planet and inside protected facilities and began to re-emerge into the world when the signs of the infection began to vanish. They are unsure what happened with the disease, and so are we, but they claim that it appears gone. Earth is welcoming to humans once more!\n\nThe survivors have just began restarting abandoned factory complexes and power plants to fuel the industry needed to rebuild the civilization from the ruins. People move into the cities and repopulate the farming areas. The economy is starting to build up momentum – and they want us to become part of the exchange once more!\n\nThe survivors have their spirits high, but still the fear of the Wildfire lies in all of them – what if it comes back? This is the reason why they’ve requested us to send them as much of the Wildfire Cure as we can.\n\n<effect>Communications with Earth have been re-established. Resupply, Research Outsourcing and Applicants are available once more. Export prices are reduced for the next <text_param1> Sols while the economy is recovering.\n\n<effect>Cargo Rockets will be sent from Earth to be loaded with Wildfire Cure. When they reach Earth you will be granted <funding(reg_param2)> Funding."},
			'image', "UI/Messages/wildfire_mystery_01.tga",
			'text_param1', T{5977, --[[Scenario Mystery 8 text_param1]] "10"},
			'reg_param2', "_FundingReward",
			'choice1', T{8338, --[[Scenario Mystery 8 choice1]] "Rejoice!"},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Trade Rockets Funding",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "OutsourceDisabled",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'percent', -50,
			'target_gameplayconst', "ExportPricePreciousMetals",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "ExportPricePreciousMetals",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "SpeedUpResearch",
	}, {
		PlaceObj('SA_Exec', {
			'expression', 'count = #(UICity.labels.MedicalBuilding or "")  + 1',
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'expression', "10",
			'end_block', 2,
		}),
		PlaceObj('SA_Comment', {
			'comment', "Wait for the construction of a new medical building (Infirmary or Medical Center) then grant a tech boost to the tech (already done below). Do this a total of 10 times",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', '#(UICity.labels.MedicalBuilding or "") >= count',
		}),
		PlaceObj('SA_Exec', {
			'expression', "count = count + 1",
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Mysteries",
			'Research', "WildfireCure",
			'Amount', 5,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Trade Rockets",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_EarthInfected == true",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 720000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8339, --[[Scenario Mystery 8 title]] "Wildfire: Wings of Salvation"},
			'voiced_text', T{8340, --[[voice:narrator]] "A cargo rocket is on its way to gather the Wildfire cure. People on Earth depend on our efforts to create a steady supply chain for the cure."},
			'text', T{8341, --[[Scenario Mystery 8 text]] "The amount of Wildfire Cure we have to return to Earth depends on the severity of the situation there. If the situation demands it, we should expect potential future requests for the cure.\n\n<effect>Load Cargo Rockets with the Cure and Fuel and send them back to Earth until the Wildfire infection is completely eradicated."},
			'image', "UI/Messages/wildfire_mystery_03.tga",
			'choice1', T{8342, --[[Scenario Mystery 8 choice1]] "Roger that."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8484, --[[Scenario Mystery 8 text]] "The authorities on Earth have sent a Cargo Rocket to gather Wildfire Cure and return it to the struggling population on our homeworld."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'Form', "while-do",
			'end_block', 4,
			'expression', "_InfectionLevel > 0",
		}),
		PlaceObj('SA_CallTradeRocket', {
			'comment', "remember to add a text description and title to this",
			'description', T{8343, --[[Scenario Mystery 8 description]] "Refuel and load with Wildfire Cure to relief Earth from the Infection."},
			'rocket_id', "CureRocket",
			'display_name', T{1115, --[[Scenario Mystery 8 display_name]] "Cargo Rocket"},
			'resource1', "MysteryResource",
			'amount1', 60000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "CureRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_InfectionLevel = _InfectionLevel - 20",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Grant Wonder Tech",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 200,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8344, --[[Scenario Mystery 8 title]] "Epilogue: Wildfire Eradicated!"},
			'voiced_text', T{8345, --[[voice:narrator]] "Authorities all over the Earth report that no cases of the Wildfire infection have been detected. Earth is freed from the yoke of the worst pandemic in history."},
			'text', T{8346, --[[Scenario Mystery 8 text]] "People all around the world celebrate, but the consequences of the Wildfire crisis remain. We have decades – maybe even centuries before us – to cope with the damages caused, with the fear and desperation which reverberate inside all of us. But we remain optimistic that, given time, people will return to their everyday lives.\n\nThe Wildfire crisis has shown us how fragile we are, how the ivory towers we’ve built could crumble in mere days. Maybe it’s the perfect moment to step back and reconsider the way we lived our lives. To rebuild our civilization, but build it better than before.\n\nThe Wildfire Cure remains our hot lead towards the way the disease worked. By studying it we will be able to delve in the mystery of its structure and origin, preparing for worse days ahead.\n\n<effect>The infection on Earth has been eradicated! All Infection Level effects have been removed.\n\n<effect>Cargo Rockets will be sent from Earth to load Wildfire Cure. Upon return, each rocket will grant you <funding(reg_param2)> Funding. \n\n<effect>Gained a new Technology, <em><reg_param1></em>."},
			'image', "UI/Messages/wildfire_mystery_03.tga",
			'reg_param1', "_grantedTech",
			'reg_param2', "_FundingReward",
			'choice1', T{8347, --[[Scenario Mystery 8 choice1]] "We did it!"},
		}),
		PlaceObj('SA_Comment', {
			'comment', "Cleanup",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Infection Level Update",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Infection Increase",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Enedmice Effect",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Epidemic Effect",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Pandemic Effect",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Doomsday Epilogue",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8552, --[[Scenario Mystery 8 text]] "The Wildfire infection has been eradicated on Earth! People all over the globe rejoice and praise your adequate actions!"},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 200,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery8InfectionLevel")',
		}),
		PlaceObj('SA_Comment', {
			'comment', "Effects",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "resolved")',
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Trade Rockets Funding",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_EarthCured = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Trade Rockets Funding",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1440000,
			'rand_duration', 3600000,
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8349, --[[Scenario Mystery 8 description]] "Refuel and load with Wildfire Cure to sell to Earth and gain Funding."},
			'rocket_id', "SellCureRocket",
			'display_name', T{1115, --[[Scenario Mystery 8 display_name]] "Cargo Rocket"},
			'resource1', "MysteryResource",
			'amount1', 60000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "SellCureRocket",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "_FundingReward",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery8SellCure",
			'text', T{8350, --[[Scenario Mystery 8 text]] " <funding(reg_param1)>"},
			'reg_param1', "_FundingReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "No Infected On Mars",
	}, {
		PlaceObj('SA_Comment', {
			'comment', "Wait until there are no colonists with the Infected trait",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', 'UICity:CountDomeLabel("Infected") == 0',
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "_EarthCured == true",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8351, --[[Scenario Mystery 8 title]] "Wildfire: Safe Space"},
			'voiced_text', T{8352, --[[voice:narrator]] "Today marks the moment when our colony is free from the threat of the Wildfire infection!"},
			'text', T{8353, --[[Scenario Mystery 8 text]] "Our brave colonists waited for their brethren on Earth to be cured before they have received relief from the burden of the disease. The colonists would surely be happy to hear that the threat is eliminated – it will raise their spirits high!"},
			'image', "UI/Messages/wildfire_mystery_02.tga",
			'choice1', T{8354, --[[Scenario Mystery 8 choice1]] "It’s a day for celebration!"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8355, --[[Scenario Mystery 8 title]] "Wildfire: Safer Together"},
			'voiced_text', T{8352, --[[voice:narrator]] "Today marks the moment when our colony is free from the threat of the Wildfire infection!"},
			'text', T{8356, --[[Scenario Mystery 8 text]] "Our efficient medical program has managed to cure all cases of the Wildfire infection. Mars has become a much safer place. We informed Earth and after a careful selection and medical checks they are ready to launch an emergency flight with healthy survivors aboard.\n\nThese are ordinary people who survived the Wildfire crisis somehow and managed to get to safety. None of them has passed the initial training required for arriving on Mars so we expect them to have a hard time acclimating to the life in the colony. But at least they would be safe from harm with us.\n\n<effect>A rocket with <text_param1> Refugees aboard is inbound to Mars."},
			'image', "UI/Messages/wildfire_mystery_02.tga",
			'text_param1', T{5845, --[[Scenario Mystery 8 text_param1]] "50"},
			'choice1', T{8357, --[[Scenario Mystery 8 choice1]] "We’ll make sure these poor souls get the best reception."},
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_MysteryLog",
			'text', T{8486, --[[Scenario Mystery 8 text]] "Now that Mars has become a safe haven from the Wildfire infection the authorities on Earth have sent a rocket with non-infected refugees to be sheltered in your colony."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_CallRefugeeRocket', {
			'description', T{8358, --[[Scenario Mystery 8 description]] "Refugees on board are fleeing the infected Earth."},
			'rocket_id', "RefugeeRocket",
			'display_name', T{8123, --[[Scenario Mystery 8 display_name]] "Refugee Rocket"},
			'travel_time_mars', 0,
			'timeout', 3600000,
			'num_refugees', 50,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
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