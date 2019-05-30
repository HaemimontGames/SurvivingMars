-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 1",
	'file_name', "Mystery_1",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Trigger",
		'autostart', true,
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_mystery_ended = false",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 100",
			'duration', 1000,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 7500000,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Message 1: Introduction",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner (First)",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.mystery.spawned_cubes >= 135",
			'duration', 1000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Message 2: Too many cubes",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1200000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Message 3: Colonists believe",
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 1,
			'end_block', 2,
			'Field', "Mysteries",
			'Research', "BlackCubesDisposal",
			'State', "Available",
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'Field', "Mysteries",
			'Research', "BlackCubesDisposal",
			'State', "Researched",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(7185, --[[Scenario Mystery 1 text]] "We should research the Dark Spectrometry technology to learn more about the Black Cubes."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "BlackCubesDisposal",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 6000000,
			'rand_duration', 6000000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Building Destroyer (First)",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 6000000,
			'rand_duration', 6000000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Pulse and Countdown",
			'wait', true,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Alternating Endings",
			'wait', true,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Forced Ending",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cube Spawner (First)",
	}, {
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5862, --[[Scenario Mystery 1 text]] "A peculiar black cube matrix has appeared near the Colony. We should send an Explorer to investigate."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Building",
			'random_pos_label_dist', 25000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'store_pos', "firstBlackCubePos",
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5863, --[[Scenario Mystery 1 description]] "An unknown black, previously undetected cube-shaped object"),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "firstBlackCubePos",
			'display_name', T(5864, --[[Scenario Mystery 1 display_name]] "Mystery Cube"),
			'sequence_list', "Mystery 1",
			'sequence', "Anomaly 1: First Cube",
			'revealed', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'class_name', "ScenarioPosMarker",
			'register_placement_pos', "firstBlackCubePos",
			'par_name_1', "custom_label",
			'par_val_1', "Cube Spawner",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Spread (Repeated)",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Group (Repeated)",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cube Spawner: Spread (Repeated)",
		'loop', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.mystery.spawned_cubes < 10800",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "UICity.mystery.spawned_cubes < 2700",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 1200000,
			'rand_duration', 240000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'expression', "UICity.mystery.spawned_cubes < 6075",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 2400000,
			'rand_duration', 720000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 4800000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Building",
			'random_pos_label_dist', 100000,
			'class_name', "ScenarioPosMarker",
			'use_random_pos', true,
			'par_name_1', "custom_label",
			'par_val_1', "Cube Spawner",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cube Spawner: Group (Repeated)",
		'loop', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.mystery.spawned_cubes < 10800",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "UICity.mystery.spawned_cubes < 1620",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
			'rand_duration', 120000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'expression', "UICity.mystery.spawned_cubes < 6075",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 360000,
			'rand_duration', 360000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 720000,
			'rand_duration', 720000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Cube Spawner",
			'random_pos_label_dist', 6000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cube Spawner: Mega Structure",
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'duration', 24000,
			'rand_duration', 120000,
		}),
		PlaceObj('SA_PlaceObject', {
			'random_pos_label', "Black Monolith Pos",
			'random_pos_label_dist', 10000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 24000,
			'rand_duration', 120000,
		}),
		PlaceObj('SA_PlaceObject', {
			'random_pos_label', "Black Monolith Pos",
			'random_pos_label_dist', 10000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 24000,
			'rand_duration', 120000,
		}),
		PlaceObj('SA_PlaceObject', {
			'random_pos_label', "Black Monolith Pos",
			'random_pos_label_dist', 10000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 24000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.mystery.spawned_cubes < 5500",
		}),
		PlaceObj('SA_PlaceObject', {
			'random_pos_label', "Black Monolith Pos",
			'random_pos_label_dist', 10000,
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Building Destroyer (First)",
	}, {
		PlaceObj('SA_WaitExpression', {
			'description', "check with wait expression label count",
			'expression', '#(UICity.labels.RegolithExtractor or "") > 0',
			'duration', 3333,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 5,
			'Form', "while-do",
			'end_block', 6,
			'expression', "not destroyedBuildingPos",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 3333,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_class', "RegolithExtractor",
			'visible_only', true,
			'store_pos', "destroyedBuildingPos",
			'fx_action', "BlackCubeDemolishBuilding",
			'fx_moment', "hit",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'check_terran_deposit', false,
			'class_name', "BlackCubeStockpile",
			'register_placement_pos', "destroyedBuildingPos",
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5865, --[[Scenario Mystery 1 description]] "Reportedly, a black cube has appeared within the extractor."),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "destroyedBuildingPos",
			'display_name', T(5866, --[[Scenario Mystery 1 display_name]] "Cube Disaster"),
			'sequence_list', "Mystery 1",
			'sequence', "Anomaly 2: Damaged Building",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5867, --[[Scenario Mystery 1 title]] "Power of Three: Disappearing Act"),
			'voiced_text', T(7186, --[[voice:narrator]] "A Concrete Extractor went abruptly silent. Maintenance requests were met with nothing but static."),
			'text', T(5868, --[[Scenario Mystery 1 text]] "This event was unlike any malfunction predicted in the security protocols. Orbital scans on the site revealed no evidence of the existence of the huge structure – only a black cube matrix centered on the spot where the extractor was supposed to be.\n\n<effect>A Concrete Extractor has been destroyed by a Black Cube. An Anomaly has appeared on the site."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5869, --[[Scenario Mystery 1 choice1]] "We must investigate"),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Building Destroyer (Repeated)",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5870, --[[Scenario Mystery 1 text]] "A Black Cube has led to the destruction of a Concrete Extractor. We should investigate the site with an Expedition."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Building Destroyer (Repeated)",
		'loop', true,
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 3600000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "AtRandomPos = false",
		}),
		PlaceObj('SA_PickRandomNoDomeBuilding', {
			'visible_only', true,
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 1,
			'end_block', 2,
			'Field', "Mysteries",
			'Research', "BlackCubesNegation",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'AtRandomPos = IsInRangeOfLabel(RandomObject, "SensorTower",  "GetBlackCubeProtectionRange")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 7,
			'Form', "if-then-else",
			'end_block', 9,
			'else_block', 8,
			'expression', "AtRandomPos",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'check_dome', "outside",
			'check_terran_deposit', false,
			'random_pos_label', "Building",
			'class_name', "BlackCubeStockpile",
			'use_random_pos', true,
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
			'is_else', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_reg', "RandomObject",
			'destroy_all', true,
			'store_pos', "destroyedBuildingPos",
			'fx_action', "BlackCubeDemolishBuilding",
			'fx_moment', "hit",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 10,
			'end_block', 11,
			'expression', "destroyedBuildingPos",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'check_terran_deposit', false,
			'random_pos_label', "Building",
			'class_name', "BlackCubeStockpile",
			'register_placement_pos', "destroyedBuildingPos",
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 11,
			'parent', 10,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 9,
			'parent', 7,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 1: Introduction",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5871, --[[Scenario Mystery 1 title]] "Power of Three: A Black Cube Appears"),
			'voiced_text', T(7187, --[[voice:narrator]] "A routine scan of the perimeter has detected an unidentified object within immediate proximity of the Colony. Data logs confirm it – it isn’t a glitch."),
			'text', T(5872, --[[Scenario Mystery 1 text]] "The mysterious object appears to consist of pitch-black cubes arranged in a matrix. The cubes seemingly levitate above the ground without the aid of any support structure.\n\nPreliminary image analysis remains inconclusive. An on-site investigation is required to assess the Anomaly. We advise caution.\n\n<effect>A Black Cube has appeared seemingly out of nowhere. We have to investigate this Anomaly."),
			'log_entry', true,
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5873, --[[Scenario Mystery 1 choice1]] "A black cube? Most peculiar…"),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 2: Too many cubes",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5874, --[[Scenario Mystery 1 title]] "Power of Three: ...For, They Came in Numbers"),
			'voiced_text', T(7188, --[[voice:narrator]] "The mysterious cubes continue to appear across the colony. Mission Control advises all personnel to remain calm and stick to protocol."),
			'text', T(5875, --[[Scenario Mystery 1 text]] "The cube structures tend to emerge without warning, as unscientific as it may sound, out of thin air. Apart from their evident presence, so far the structures pose no threat to the Colony.\n\nUntil further investigation, the scientific board of Mission Control has decided to impose an information blackout on the matter to prevent the spread of panic and fear among the Colonists."),
			'log_entry', true,
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5876, --[[Scenario Mystery 1 choice1]] "There is a certain sense of urgency to this, it seems."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5877, --[[Scenario Mystery 1 text]] "More than a hundred cubes have appeared. Their purpose and origin are still unknown."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 3: Colonists believe",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 120",
			'duration', 1000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5878, --[[Scenario Mystery 1 title]] "Power of Three: Making Sense of the Unknown"),
			'voiced_text', T(7189, --[[voice:narrator]] "We can’t hide the truth from the public, not when the Colony’s being swarmed by black cubes."),
			'text', T(5879, --[[Scenario Mystery 1 text]] "Without any credible explanation, the Colony was soon flooded with various rumors and interpretations of the mystery. What if they're bombs? Billions of tiny bombs? Or transport capsules maybe, with a mini robot inside. Or deadly hard drives. Or alien eggs? Or messages needing decoding. Or they're all parts of a bigger whole. Jigsaw puzzles that need to be put together.\n\nThe team at Mission Control is against trying to spread further misinformation and propaganda – partially because it would just add to the total confusion, but mainly because it would endanger the philosophical principles of our mission. We could only trust in our Colonists and hope for the best."),
			'log_entry', true,
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5880, --[[Scenario Mystery 1 choice1]] "We have to come up with something better."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 1: First Cube",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5881, --[[Scenario Mystery 1 title]] "Power of Three: Dark Properties"),
			'voiced_text', T(7190, --[[voice:narrator]] "On-site analysis of the unidentified structure only deepens the mystery. The evidence suggests that the cubes are clearly not a natural phenomenon."),
			'text', T(5882, --[[Scenario Mystery 1 text]] "The insides of the cubes as well as the physical forces behind their levitation remain an enigma. Individual cubes as well as their combined structure retain a perfect symmetry and any attempts to physically disturb their positions have failed.\n\nWhat is even more puzzling is the analysis of the photonic spectroscopy of the cubes. They seem to emanate radiation of an unknown wavelength which excites the separation of electrons inside of the spectroscopic lens. While our science team refuses to jump to any conclusions, the Chief Engineer suggests that we should study the effect empirically on the Colony’s Solar Panels.\n\nThe science team requested permission to commence experimental research on the cubes' properties.\n\n<effect>New research on the mystery of the Black Cubes is now available"),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5883, --[[Scenario Mystery 1 choice1]] "We should rearrange our research priorities."),
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "BlackCubesDisposal",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Research 1: Effects",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(7191, --[[Scenario Mystery 1 text]] "Primary analysis of the Black Cubes revealed no conclusive answers. The cubes may somehow affect our Solar Panels. New Breakthrough research is now available."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 2: Damaged Building",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5885, --[[Scenario Mystery 1 title]] "Power of Three: Post–benign"),
			'voiced_text', T(7192, --[[voice:narrator]] "Recent orbital scans revealed a sudden surge of energy on site. It’s now evident that the cubes pose a far greater threat than blocking our infrastructure plans."),
			'text', T(5886, --[[Scenario Mystery 1 text]] "It appears the Black Cubes materialized inside the Extractor. We could only guess what happened to the building.\n\nIt seems any of the artifacts could materialize inside a structure, sending it into oblivion. We are now facing the potential threat of future human casualties.\n\nMission Control advises a top priority on the investigation of the disaster.\n\n<effect>More buildings could collapse in the future. Preventive research is now available."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5887, --[[Scenario Mystery 1 choice1]] "A potential solution! This is great news."),
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "BlackCubesNegation",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Research 2: Effects",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5888, --[[Scenario Mystery 1 text]] "We confirmed that the Extractor was destroyed by the Black Cubes. New preventive research is now available."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 3: Black Monolith",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5889, --[[Scenario Mystery 1 title]] "Power of Three: A Time For Speculation"),
			'voiced_text', T(7193, --[[voice:narrator]] "The latest research confirms that the cubes seem to be interfacing with each other. Almost like they’re forming some kind of device."),
			'text', T(5890, --[[Scenario Mystery 1 text]] "The science team is divided in two camps: those who speculate it will amplify the cube signals allowing them to transmit through the reaches of space, and those who believe it could be some kind of weapon meant for destruction, not communication.\n\nOutside the labs however, the cult of the Cubes has gained even more momentum. People are gathering to wait for what they think would be the coming of God to humanity’s second home."),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'choice1', T(5891, --[[Scenario Mystery 1 choice1]] "A culmination seems to be imminent, that’s for certain."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Research 1: Effects",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "BlackCubesDisposal",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UICity.mystery.can_destroy_cubes = true; table.insert(StorableResourcesForSession, "BlackCube")',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5892, --[[Scenario Mystery 1 title]] "Power of Three: Solace in Science"),
			'voiced_text', T(7194, --[[voice:narrator]] "We’ve applied the scientific method in every possible way to no avail. Time to try something else."),
			'text', T(5893, --[[Scenario Mystery 1 text]] "In a moment of brilliance, or possibly desperation, one of the physicists proposed they should try to crack open the structures.\n\nThe scientists moved the cube matrix inside a non-baryonic shell and proceeded to bombard a single cube with high-energy ions, a process known as sputtering. The results were immediate – the shell of the cube gave in, resulting in its rapid decomposition. The matrix itself reacted to the influence by rearranging itself into a solid structure made of the remaining cubes.\n\nThough we have no explanation for the process, at least we have a way to deal with the cube matrices popping up everywhere. It appears that the exact solution rests on our reason and moderation.\n\n<effect>Cubes can be stored in special sites or destroyed"),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5894, --[[Scenario Mystery 1 choice1]] "Piece by piece, we will unravel this enigma."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5895, --[[Scenario Mystery 1 text]] "Dark Spectrometry research completed. We can now store and destroy the cubes."),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 24000,
			'rand_duration', 48000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5896, --[[Scenario Mystery 1 title]] "Power of Three: Embracing the Unknown"),
			'voiced_text', T(7195, --[[voice:narrator]] "The mystery of the black cubes has consumed our Colonists completely. The reactions are as numerous as they are varied."),
			'text', T(5897, --[[Scenario Mystery 1 text]] "The Colonists have divided into factions centered around a certain hypothesis about the nature and purpose of the mysterious artifacts.\n\nThe excitement about the cubes is evident from the schedules of the weekly hearings in the Colony. The trivial themes such as the quality of the food and the requests for additional scientific funding had completely disappeared, replaced by requests for publicity for each faction’s viewpoint.\n\nSo far, there are three major camps. The moderate skeptics argue that the truth is hardly within our reach and cubes need to be preserved and stored for further research. The pessimistic ones insist on the destruction of all the cubes, seeing them as a deliberate threat. Then, there are those who hold the firm belief that the cubes are meant to be a gift to humanity from some unknown benevolent entity. They request the cubes to be transported inside the Domes and put on display for everyone to see.\n\n<effect>Decoration Buildings made out of cubes can be constructed."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5898, --[[Scenario Mystery 1 choice1]] "A gift or a Trojan horse, I wonder..."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5899, --[[Scenario Mystery 1 text]] "Decorations can be created from the Black Cubes."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Research 2: Effects",
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "BlackCubesNegation",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5900, --[[Scenario Mystery 1 title]] "Power of Three: Primal Fear"),
			'voiced_text', T(7196, --[[voice:narrator]] "We are attempting to make some sort of sense of the laws that govern the cubes’ behavior. But it’s like trying to find a needle in a haystack. In a pitch-black cave. While blindfolded."),
			'text', T(5901, --[[Scenario Mystery 1 text]] "Still, our scientists managed to define to some extent why the cubes sometimes materialize inside our buildings. It seems that some cryptic algorithm first sends a pulse of tachyons to the area where the cube will materialize. If the Cherenkov radiation measurements are within certain limits, the cube appears on the spot. Thus, the cubes avoid appearing inside rocks – indeed, none of our scans confirmed that any cube spawned inside of a high-density object.\n\nOur structures tend to be much less dense than the monolithic Martian rocks. We can modify our sensor towers to create a fake Cherenkov Effect by bombarding the areas around our structures with particles which are harmless to our Colonists, but would still prevent the cubes from threatening our Colony.\n\n<effect>Sensor Towers now protect nearby buildings from the Black Cubes"),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5902, --[[Scenario Mystery 1 choice1]] "A small victory – our efforts continue."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5903, --[[Scenario Mystery 1 text]] "S.H.E.P.I.D. research completed. Buildings within range of our Sensor Towers will be protected from the cubes."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cube Pulse and Countdown",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 140",
			'duration', 1000,
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'Field', "Mysteries",
			'Research', "BlackCubesNegation",
			'State', "Researched",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5884, --[[Scenario Mystery 1 text]] "We should research the S.H.E.P.I.D. technology to protect the Colony structures from the Black Cubes."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "BlackCubesNegation",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "BlackCubesSetActive(true)",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5904, --[[Scenario Mystery 1 text]] "All cubes on Mars have started to pulsate, counting towards an unknown event."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5905, --[[Scenario Mystery 1 title]] "Power of Three: The Countdown"),
			'voiced_text', T(7988, --[[voice:narrator]] "Within the hour all the cubes across the Colony started emitting light pulses, sending a wave of panic across the Colony. Even here at Mission Control we found it hard not to worry."),
			'text', T(5906, --[[Scenario Mystery 1 text]] "The photovoltaic effect we observed earlier has completely disappeared. To make things worse, numerous glitches in the drone command software have our technicians scattering to extinguish fires all across the board. It seems that the pulses from the cubes are somehow interfering with the Drone uplink.\n\nAs reports are flowing in, we can clearly see a trend in the intensification of the light pulses. Is this some kind of countdown? And if so, to what?"),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5907, --[[Scenario Mystery 1 choice1]] "Just colonizing a new world isn’t interesting enough, it seems."),
		}),
		PlaceObj('SA_Exec', {
			'expression', '_ENV["start_time"] = GameTime()',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery1Counter",
			'autoupdate', true,
			'expression', "48 - ((GameTime() - start_time) / const.HourDuration)",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 720000,
		}),
		PlaceObj('SA_ShowMessage', {
			'title', T(5908, --[[Scenario Mystery 1 title]] "Power of Three: Of Mice & Men"),
			'voiced_text', T(7989, --[[voice:narrator]] "Our Colonists want decisive action in dealing with the cubes."),
			'text', T(5909, --[[Scenario Mystery 1 text]] "Some of them call for the immediate destruction of all the cubes while others still insist on storing and studying them – as far away from the Domes as possible. And yet, the number of eccentrics worshiping the cubes and erecting monuments with them has grown even larger. Could the cubes be affecting us like they influenced our drones?"),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5910, --[[Scenario Mystery 1 choice1]] "We must not lose focus."),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 720000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Flavor Based on Player Actions",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery1Counter")',
		}),
		PlaceObj('SA_Exec', {
			'expression', "BlackCubesSetActive(false)",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5911, --[[Scenario Mystery 1 title]] "Power of Three: Construction Begins"),
			'voiced_text', T(7990, --[[voice:narrator]] "Looks like we're fighting the cubes for the control of our drones. And we are losing that battle."),
			'text', T(5912, --[[Scenario Mystery 1 text]] "Between their usual command cycles, the drones have begun carrying cubes to a specific location and seem to be constructing a strange structure.\n\nDiagnostics on the drone software and hardware reveal no clues for any reprogramming. All of our attempts to gather information about the purpose of this operation have failed.\n\nMission Control advises all personnel to brace for the unknown.\n\n<effect>Some Drones are constructing a mystery building with the cubes."),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'choice1', T(5913, --[[Scenario Mystery 1 choice1]] "At least our Drones aren't attacking us yet."),
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "UICity.labels.DroneHub and #UICity.labels.DroneHub>0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'exclude_class_name', "BlackCubeStockpileBase",
			'random_pos_label', "DroneHub",
			'random_pos_label_dist', 25000,
			'class_name', "BlackCubeMonolith",
			'use_random_pos', true,
			'is_construction_site', true,
			'store_pos', "monolithPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "_megamonolith",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'exclude_class_name', "BlackCubeStockpileBase",
			'random_pos_label', "Building",
			'random_pos_label_dist', 50000,
			'class_name', "BlackCubeMonolith",
			'use_random_pos', true,
			'is_construction_site', true,
			'store_pos', "monolithPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "_megamonolith",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5914, --[[Scenario Mystery 1 description]] "Affected Drones are building something of alien design."),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "monolithPos",
			'display_name', T(5915, --[[Scenario Mystery 1 display_name]] "Unknown Construction"),
			'sequence_list', "Mystery 1",
			'sequence', "Anomaly 3: Black Monolith",
			'revealed', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'class_name', "ScenarioPosMarker",
			'register_placement_pos', "monolithPos",
			'par_name_1', "custom_label",
			'par_val_1', "Black Monolith Pos",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Mega Structure",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Forced Ending",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5916, --[[Scenario Mystery 1 text]] "Drones influenced by the cubes have started the construction of a Mega Monolith."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Alternating Endings",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.BlackCubeMonolith and #UICity.labels.BlackCubeMonolith>0",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5917, --[[Scenario Mystery 1 title]] "Power of Three: Out of the Eons"),
			'voiced_text', T(7991, --[[voice:narrator]] "Once completed, the monument emitted a pulse of all-encompassing energy and we all experienced a single collective dream! Or memory? "),
			'text', T(5918, --[[Scenario Mystery 1 text]] "Eons ago, while Earth was still a molten world, Mars had already been a teeming, living world covered by oceans and forests. This long-forgotten Mars was the home for a sentient race which quickly mastered their primitive urges and reached technological peaks yet to be conquered by humankind.\n\nWe witnessed the astonishing evolution of the Ancients and the countless metamorphoses they experienced until they reached a state of existence which allowed them to transcend the boundaries of the material form. Without worrying about resources or lifespan, they traversed the universe, leaving their home behind. But they have not forgotten it.\n\nThe robust Black Cubes lay in wait on the Red Planet for a meeting of the minds. Our actions here were detected by the semi-sentient algorithm which controlled the cubes and triggered the message left by the Ancients. Some of the accounts given by our personnel describe being talked to in a language both familiar and thoroughly alien, while others describe being shown images most vivid and influencing. Some would even account for experiencing a sort of judgment. The essence of the information was, however, without exception, the same."),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'choice1', T(5919, --[[Scenario Mystery 1 choice1]] "I saw it, too..."),
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "UICity.mystery.stored_cubes > UICity.mystery.destroyed_cubes + UICity.mystery.used_cubes",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5917, --[[Scenario Mystery 1 title]] "Power of Three: Out of the Eons"),
			'voiced_text', T(7992, --[[voice:narrator]] "The Ancients were pleased to see we had reacted with restraint and curiosity, trying to understand the unknown phenomenon instead of fearing it. "),
			'text', T(5920, --[[Scenario Mystery 1 text]] "Judging from their own history, they assume this was not necessarily an easy thing to do.\n\nThey recall the fondest epochs of their history, where such strivings were predominant amongst them. Proud and nostalgic, they offer us a gift.\n\n<effect>Gained a new Technology, <em><reg_param1></em>"),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "_grantedTech",
			'choice1', T(5921, --[[Scenario Mystery 1 choice1]] "It has been quite the ride."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5922, --[[Scenario Mystery 1 text]] "We communed with the Ancients in our collective dream. They were impressed by our curiosity."),
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "surprised aliens")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'expression', "UICity.mystery.destroyed_cubes > UICity.mystery.used_cubes",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5917, --[[Scenario Mystery 1 title]] "Power of Three: Out of the Eons"),
			'voiced_text', T(7993, --[[voice:narrator]] "The Ancients were set back by the hostile reaction we had towards their messengers – the cubes."),
			'text', T(5923, --[[Scenario Mystery 1 text]] "Ultimately they expressed understanding, noting that there were times in their own long history, dark times when they had the same hostile response towards the unknown.\n\nThey hope that with time and maturity we will come to embrace the idea that while the universe is a dangerous place, not everything is a threat and there are also wonders to be discovered.\n\n<effect>All Black Cubes have disappeared\n<effect>Gained a new Technology, <em><reg_param1></em>"),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "_grantedTech",
			'choice1', T(5921, --[[Scenario Mystery 1 choice1]] "It has been quite the ride."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5924, --[[Scenario Mystery 1 text]] "We communed with the Ancients in our collective dream. They were somewhat surprised by our hostility against the unknown."),
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeLargeMonument",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeSmallMonument",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeDump",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeMonolith",
			'obj_count', 0,
			'destroy_all', true,
			'return_resource', true,
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 300,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_class', "BlackCubeStockpileBase",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "neutral aliens")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 7,
			'Form', "if-then-else",
			'end_block', 10,
			'else_block', 9,
			'expression', "UICity.mystery.used_cubes > 384",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5917, --[[Scenario Mystery 1 title]] "Power of Three: Out of the Eons"),
			'voiced_text', T(7994, --[[voice:narrator]] "The Ancients were intrigued and quite surprised by our choice to indulge in creations of art with their cubes."),
			'text', T(5925, --[[Scenario Mystery 1 text]] "Oblivious to the concept of higher powers, they seemed to see no other reason for our actions other than a pursuit of aesthetic decoration, one that seems to have eluded them as a possibility.\n\nNot quite sure what to make of this, they express hope we will retain our creativity as a race in the ages ahead.\n\n<effect>The monument collapsed into a pile of Black Cubes\n<effect>Gained a new Technology, <em><reg_param1></em>"),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "_grantedTech",
			'choice1', T(5921, --[[Scenario Mystery 1 choice1]] "It has been quite the ride."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5926, --[[Scenario Mystery 1 text]] "We communed with the Ancients in a collective dream. They were impressed by our creativity."),
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeDump",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_class', "BlackCubeStockpileBase",
			'obj_count', 0,
			'destroy_all', true,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_label', "BlackCubeMonolith",
			'obj_count', 0,
			'destroy_all', true,
			'return_resource', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "aliens approve creativity")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 9,
			'parent', 7,
			'is_else', true,
		}),
		PlaceObj('SA_Comment', {
			'comment', "when you don't interact with the cubes at all",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5917, --[[Scenario Mystery 1 title]] "Power of Three: Out of the Eons"),
			'voiced_text', T(7995, --[[voice:narrator]] "The moment the last cube fit in the structure, we detected a single, intense beam of high-energy particles directed towards the cosmos. What could it mean?"),
			'text', T(5927, --[[Scenario Mystery 1 text]] "Meanwhile, reports from all over the Colony indicate that all cubes have ceased their pulsating and reverted to their previous lifeless state. Many Colonists report to the medical facilities that they feel different states of depression – ranging from melancholy to outright despair. Could these events be attributed to the mysterious structure and the death of the cubes? We would never find out.\n\n<effect>All Colonists suffer penalties to Morale."),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'start_minimized', false,
			'choice1', T(5928, --[[Scenario Mystery 1 choice1]] "Perhaps we should've done more"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_BlackCubeMysteryLog",
			'text', T(5929, --[[Scenario Mystery 1 text]] "We didn't get to the bottom of the mystery of the Black Cubes. Perhaps more decisive action was needed."),
		}),
		PlaceObj('SA_ChangeStat', {
			'Label', "Colonist",
			'Stat', "Morale",
			'Amount', -10000,
			'Duration', -1,
			'MoraleReason', T(7197, --[[Scenario Mystery 1 MoraleReason]] "<red>The mystery of the Cubes remains unresolved</red>"),
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "remains mystery")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 10,
			'parent', 7,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Spread (Repeated)",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Group (Repeated)",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Building Destroyer (Repeated)",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Cube Spawner: Mega Structure",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 1",
			'sequence', "Forced Ending",
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery1",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_mystery_ended = true",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_BlackCubeMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Flavor Based on Player Actions",
	}, {
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "UICity.mystery.stored_cubes >= 150",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5930, --[[Scenario Mystery 1 title]] "Power of Three: For the Generations to Witness"),
			'voiced_text', T(7996, --[[voice:narrator]] "The cubes can’t be ignored. "),
			'text', T(5931, --[[Scenario Mystery 1 text]] "It would be irresponsible to mismanage the situation and leave public opinion to sway back and forth on the matter.\n\nWith the current state of events we lack sufficient data to judge the purpose of the cubes. It could take years if not generations of scientific research to reach a conclusion on that subject. Until then, we will attempt to control the erratic spread of the cubes which hampers our resources and colonization operations by storing them away in a convenient manner."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5932, --[[Scenario Mystery 1 choice1]] "Only time will tell if we are right."),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 5,
			'else_block', 6,
			'expression', "UICity.mystery.destroyed_cubes >= 150",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5933, --[[Scenario Mystery 1 title]] "Power of Three: Might Makes Right"),
			'voiced_text', T(7997, --[[voice:narrator]] "The primary goal of our mission is the permanent colonization of Mars. Any potential threat to humanity’s pioneers is to be eliminated."),
			'text', T(5934, --[[Scenario Mystery 1 text]] "We will attempt to remove all the cubes from our immediate area. A decision as serious as this required a consensus, which was reached through a vote at Mission Control. The public may deem this decision wrong, but we cannot place the fate of the entire Colony on our desire to wait it out. History had taught us that the inability to act often results in disaster. The destruction of cubes will proceed as planned."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5935, --[[Scenario Mystery 1 choice1]] "Humanity will prevail, no matter the cost."),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 7,
			'Form', "if-then-else",
			'end_block', 10,
			'else_block', 9,
			'expression', "UICity.mystery.used_cubes >= 150",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5936, --[[Scenario Mystery 1 title]] "Power of Three: Cult of Tomorrow"),
			'voiced_text', T(7998, --[[voice:narrator]] "The idea that we are not alone in the universe and could become part of a bigger whole has swept over the Colony."),
			'text', T(5937, --[[Scenario Mystery 1 text]] "To disregard the desires of our Colonists would be a monstrous, autocratic act.\n\nMission Control has officially allowed the creation of a series of monuments dedicated to the Higher Truth proclaimed by some of our most active Colonists. We must look into ourselves and at our history as a species – denying the possibility that these people are right would mean that we are no better than the fanatics who burned visionaries at the pyres because of their beliefs."),
			'image', "UI/Messages/power_of_three_mystery_01.tga",
			'choice1', T(5938, --[[Scenario Mystery 1 choice1]] "It would be tyranny to forbid this."),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 9,
			'parent', 7,
			'is_else', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 10,
			'parent', 7,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Forced Ending",
		'loop', true,
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 12000000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 6,
			'end_block', 7,
			'expression', "_mystery_ended",
		}),
		PlaceObj('SA_ExitSequence', nil),
		PlaceObj('SA_Block', {
			'sa_id', 7,
			'parent', 6,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'end_block', 2,
			'expression', "not (UICity.labels.BlackCubeMonolith and #UICity.labels.BlackCubeMonolith>0)",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_megamonolith:ReturnResources()",
		}),
		PlaceObj('SA_Exec', {
			'expression', "DoneObject(_megamonolith)",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5939, --[[Scenario Mystery 1 title]] "Power of Three: Singularity Imminent"),
			'voiced_text', T(7198, --[[voice:narrator]] "The argument was that hindering the construction of the Mega-Monument would give us enough time to prepare for any possible risks. The argument was wrong."),
			'text', T(5940, --[[Scenario Mystery 1 text]] "The obscure algorithm or – perish the thought! - the intelligence directing the construction has commanded otherwise. Within mere hours, the super-structure dematerialized, decaying to its basic components, and reappeared, commanding our drones to proceed with its construction anew.\n\nThe creators of the structure definitely want us to finish their plan. The potential risk from yesterday has now become a tangible menace and I don't believe that anyone in the Colony lives under the illusion that it is avoidable.\n\n<effect>All Colonists suffer Sanity loss due to the threatening behavior of the Mega-Monument Construction."),
			'image', "UI/Messages/power_of_three_mystery_02.tga",
			'choice1', T(5941, --[[Scenario Mystery 1 choice1]] "Ominous news. We must be ready for anything."),
		}),
		PlaceObj('SA_ChangeStat', {
			'Label', "Colonist",
			'Stat', "Sanity",
			'Amount', -10000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 3,
			'Form', "if-then-else",
			'end_block', 4,
			'else_block', 5,
			'expression', "UICity.labels.DroneHub and #UICity.labels.DroneHub>0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'exclude_class_name', "BlackCubeStockpileBase",
			'random_pos_label', "DroneHub",
			'random_pos_label_dist', 25000,
			'class_name', "BlackCubeMonolith",
			'use_random_pos', true,
			'is_construction_site', true,
			'store_pos', "monolithPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "_megamonolith",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 3,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'exclude_class_name', "BlackCubeStockpileBase",
			'random_pos_label', "Building",
			'random_pos_label_dist', 50000,
			'class_name', "BlackCubeMonolith",
			'use_random_pos', true,
			'is_construction_site', true,
			'store_pos', "monolithPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "_megamonolith",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
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
			'popup_register', "_BlackCubeMysteryLog",
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