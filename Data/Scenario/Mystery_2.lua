-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 2",
	'file_name', "Mystery_2",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Trigger",
		'autostart', true,
	}, {
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
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 1: Introduction",
			'wait', true,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2Counter",
			'expression', "",
			'interval', -1,
			'expiration', 7200000,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(5942, --[[Scenario Mystery 2 text]] "Meteors incoming from the Koronis asteroid cluster are about to intercept the Earth and Mars orbits."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 4200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 2: Approaching Asteroid",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 2700000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 2.5: Prior to Landing",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 300000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Digger Spawner (First)",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 3: Landing",
			'wait', true,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 90000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 4: First Anomaly",
			'wait', true,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 5: Landings Continue",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1500000,
			'rand_duration', 750000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 7: Lifted Embargo",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 1200000,
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.AlienDiggers < 1",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 8: First Tech",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 1200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 8.5: Sponsor Message",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 1200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 9: Second Tech",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 1200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 10: Speculations",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3000000,
			'rand_duration', 1200000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 10.5: PC Warning",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 120000,
			'rand_duration', 120000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 11: PC Introduction (Choice)",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7500000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Digger Spawner (Repeat)",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 14: Invasions",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Digger Spawner (Invasion)",
			'wait', true,
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.AlienDiggers <= 0",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 15: Invasion Summary",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7500000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 16: Large Digger Arrival",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Digger Spawner (Boss)",
			'wait', true,
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "not IsValid(_Boss)",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 4,
			'Form', "if-then-else",
			'end_block', 6,
			'else_block', 5,
			'expression', "UICity.mystery.is_big_digger_destroyed",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 17.1: Large Digger Destroyed",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 17.2: Large Digger Escapes",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery2",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Registers Init",
		'autostart', true,
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_spawnAnomaly1Alt = true",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_boostingFirstTech = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_firstTechState = 1",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_boostingSecondTech = false",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_secondTechState = 1",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_GetLabelToRegister', {
			'label', "SubsurfaceDeposit",
			'register', "_revealedDeposits",
		}),
		PlaceObj('SA_GetLabelToRegister', {
			'label', "SubsurfaceDepositMarker",
			'register', "_unrevealedDeposits",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 5000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Digger Spawner (First)",
	}, {
		PlaceObj('SA_GetLabelToRegister', {
			'label', "SubsurfaceDeposit",
			'register', "revealedDeposits",
		}),
		PlaceObj('SA_GetLabelToRegister', {
			'label', "Building",
			'register', "buildings",
		}),
		PlaceObj('SA_FilterRegister_RegisterRange', {
			'register_in', "revealedDeposits",
			'register_out', "eliggableDeposits",
			'register_other', "buildings",
			'range', 25000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 23,
			'Form', "if-then-else",
			'end_block', 25,
			'else_block', 24,
			'expression', "#eliggableDeposits > 0",
		}),
		PlaceObj('SA_Exec', {
			'expression', "targetPos = eliggableDeposits[1]:GetPos()",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDigger",
			'register_placement_pos', "targetPos",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 24,
			'parent', 23,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Building",
			'random_pos_label_dist', 15000,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 25,
			'parent', 23,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5943, "The Dredger that lands excavates something from the planet's surface. Sending an expedition crew to analyze this location will shed light on the Dredgers' behavior."),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "diggerPos",
			'attach_obj_spot', "Anomaly",
			'store_obj', "anomaly",
			'display_name', T(5944, "Dredger Encounter: Alpha"),
			'sequence_list', "Mystery 2",
			'sequence', "Anomaly 1: First Digger",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 4,
			'end_block', 5,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 6,
			'end_block', 7,
			'expression', "not IsValid(digger)",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 21,
			'end_block', 22,
			'expression', "_spawnAnomaly1Alt == true",
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_reg', "anomaly",
			'destroy_all', true,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5945, --[[Scenario Mystery 2 description]] "A Dredger excavated something at this position and then took off. Sending an expedition crew to analyze this location will shed light on the Dredger behavior."),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "diggerPos",
			'display_name', T(5946, --[[Scenario Mystery 2 display_name]] "Dredger Excavation Site: Alpha"),
			'sequence_list', "Mystery 2",
			'sequence', "Anomaly 1 (Alt): First Waste Rock",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Message 4.5: Take Off",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 22,
			'parent', 21,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 10,
			'Form', "break-if",
			'expression', "true",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 7,
			'parent', 6,
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 333,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Digger Spawner (Repeat)",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Digger Spawner (Repeat)",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_Random', {
			'TargetReg', "rnd",
			'RandomMin', 1,
			'RandomMax', 2,
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 18,
			'Form', "if-then-else",
			'end_block', 20,
			'else_block', 19,
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'State', "Researched",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 24,
			'Form', "if-then-else",
			'end_block', 25,
			'else_block', 26,
			'expression', "#_revealedDeposits > 0 and rnd > 1",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDeposit",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_pos', "markerPos",
			'store_obj', "markerObj",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 26,
			'parent', 24,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 30,
			'Form', "if-then-else",
			'end_block', 31,
			'else_block', 32,
			'expression', "#_unrevealedDeposits > 0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_pos', "markerPos",
			'store_obj', "markerObj",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 32,
			'parent', 30,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 15000,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_pos', "markerPos",
			'store_obj', "markerObj",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 31,
			'parent', 30,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 25,
			'parent', 24,
		}),
		PlaceObj('SA_Exec', {
			'expression', "sectorName = GetMapSector(markerPos).display_name",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2DiggerDetected",
			'expression', "sectorName ",
			'interval', 2500,
			'pos_reg', "markerPos",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 2400000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDigger",
			'register_placement_pos', "markerPos",
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Exec', {
			'expression', "DoneObject(markerObj)",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 19,
			'parent', 18,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 2400000,
			'rand_duration', 600000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 27,
			'Form', "if-then-else",
			'end_block', 28,
			'else_block', 29,
			'expression', "#_revealedDeposits > 0 and rnd > 1",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDeposit",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 29,
			'parent', 27,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 33,
			'Form', "if-then-else",
			'end_block', 34,
			'else_block', 35,
			'expression', "#_unrevealedDeposits > 0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 35,
			'parent', 33,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 15000,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_pos_spot_name', "Anomaly",
			'store_obj', "digger",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 34,
			'parent', 33,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 28,
			'parent', 27,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 20,
			'parent', 18,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 11,
			'end_block', 12,
			'expression', "_boostingFirstTech == true",
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'description', T(5947, --[[Scenario Mystery 2 description]] "Send an expedition to observe and examine the landed Dredger to boost our Dredger Morhpology tech"),
			'check_passability', false,
			'check_buildable', false,
			'register_placement_pos', "diggerPos",
			'store_obj', "anomaly",
			'display_name', T(5948, --[[Scenario Mystery 2 display_name]] "Dredger Landing Site"),
			'sequence_list', "Mystery 2",
			'sequence', "Anomaly 2: First Tech Boosting",
		}),
		PlaceObj('SA_Exec', {
			'expression', "digger.my_anomally = anomaly",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 12,
			'parent', 11,
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2DiggerLanded",
			'interval', 1000,
			'pos_reg', "diggerPos",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Digger Spawner (Invasion)",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2Counter",
			'expression', "",
			'interval', -1,
			'expiration', 3600000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_destroyed_diggers_prior_invasion = UICity.mystery.destroyed_diggers",
		}),
		PlaceObj('SA_Exec', {
			'expression', "diggersToSpawn = 50",
		}),
		PlaceObj('SA_Exec', {
			'expression', "i = 1",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_nextPos = false",
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 19,
			'Form', "if-then-else",
			'end_block', 20,
			'else_block', 21,
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'State', "Researched",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 22,
			'expression', "50",
			'end_block', 23,
		}),
		PlaceObj('SA_Random', {
			'TargetReg', "rnd",
			'RandomMin', 1,
			'RandomMax', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 28,
			'Form', "if-then-else",
			'end_block', 29,
			'else_block', 30,
			'expression', "#_revealedDeposits > 0 and rnd > 1",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDeposit",
			'random_pos_label_dist', 7500,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_obj', "markerObjs",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 30,
			'parent', 28,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 34,
			'Form', "if-then-else",
			'end_block', 35,
			'else_block', 36,
			'expression', "#_unrevealedDeposits > 0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 7500,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_obj', "markerObjs",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 36,
			'parent', 34,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Building",
			'random_pos_label_dist', 15000,
			'class_name', "AlienDiggerMarker",
			'use_random_pos', true,
			'store_obj', "markerObjs",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 35,
			'parent', 34,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 29,
			'parent', 28,
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 500,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 23,
			'parent', 22,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 21,
			'parent', 19,
			'is_else', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 20,
			'parent', 19,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 3600000,
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 3,
			'end_block', 4,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 5,
			'Form', "break-if",
			'expression', "i > diggersToSpawn",
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 24,
			'Form', "if-then-else",
			'end_block', 25,
			'else_block', 26,
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_nextPos = markerObjs[i]:GetPos()",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'class_name', "AlienDigger",
			'register_placement_pos', "_nextPos",
			'store_pos', "diggerPos",
			'store_obj', "_invasion",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 26,
			'parent', 24,
			'is_else', true,
		}),
		PlaceObj('SA_Random', {
			'TargetReg', "rnd",
			'RandomMin', 1,
			'RandomMax', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 31,
			'Form', "if-then-else",
			'end_block', 32,
			'else_block', 33,
			'expression', "#_revealedDeposits > 0 and rnd > 1",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDeposit",
			'random_pos_label_dist', 7500,
			'class_name', "AlienDigger",
			'register_placement_pos', "_nextPos",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_obj', "_invasion",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 33,
			'parent', 31,
			'is_else', true,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 37,
			'Form', "if-then-else",
			'end_block', 38,
			'else_block', 39,
			'expression', "#_unrevealedDeposits > 0",
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "SubsurfaceDepositMarker",
			'random_pos_label_dist', 7500,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_obj', "_invasion",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 39,
			'parent', 37,
			'is_else', true,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "Building",
			'random_pos_label_dist', 15000,
			'class_name', "AlienDigger",
			'use_random_pos', true,
			'store_pos', "diggerPos",
			'store_obj', "_invasion",
			'store_obj_append', true,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 38,
			'parent', 37,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 32,
			'parent', 31,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 25,
			'parent', 24,
		}),
		PlaceObj('SA_Exec', {
			'expression', "i = i + 1",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 5000,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_DestroyObjects', {
			'obj_reg', "markerObjs",
			'destroy_all', true,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Digger Spawner (Boss)",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2Counter",
			'expression', "",
			'interval', -1,
			'expiration', 2160000,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label', "BuildingNoDomes",
			'random_pos_label_dist', 25000,
			'class_name', "AlienDiggerMarkerBig",
			'use_random_pos', true,
			'store_pos', "markerPos",
			'store_obj', "markerObj",
		}),
		PlaceObj('SA_Exec', {
			'expression', "sectorName = GetMapSector(markerPos).display_name",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery2DiggerDetected",
			'expression', "sectorName ",
			'interval', 2500,
			'pos_reg', "markerPos",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 2160000,
		}),
		PlaceObj('SA_PlaceObject', {
			'check_passability', false,
			'check_buildable', false,
			'random_pos_label', "SubsurfaceDeposit",
			'random_pos_label_dist', 2500,
			'class_name', "AlienDiggerBig",
			'register_placement_pos', "markerPos",
			'store_obj', "_Boss",
		}),
		PlaceObj('SA_Exec', {
			'expression', "DoneObject(markerObj)",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Meteor Storms Trigger",
	}, {
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'expression', "3",
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 2250000,
		}),
		PlaceObj('SA_StartDisaster', {
			'disaster', "Meteors",
			'meteors', "storm",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 1: First Digger",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T(5949, --[[Scenario Mystery 2 title]] "The Dredgers: Contact"),
			'voiced_text', T(7448, --[[voice:narrator]] "Mission Control, we’ve received the preliminary report from the landing site expedition. The RC Explorer is on-site, awaiting further orders."),
			'text', T(5950, --[[Scenario Mystery 2 text]] "From the spectroscopic data gathered from afar, we know that the object is covered in a robust crust of silicates and metal despite its organic appearance. The tentacle-like protrusions are inanimate and it seems they serve as support columns for the main structure. The operators reports no activity from the object except its continuous excavation – it is either inanimate or it pays no heed to our presence in the area.\n\nThe RC Explorer operator requests permission for close inspection on the object."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5951, --[[Scenario Mystery 2 choice1]] "Affirmative. Proceed with caution."),
			'choice2', T(5952, --[[Scenario Mystery 2 choice2]] "Negative. The risk is too high."),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_Random', {
			'TargetReg', "rnd",
			'RandomMin', 1,
			'RandomMax', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 5,
			'Form', "if-then-else",
			'end_block', 7,
			'else_block', 6,
			'expression', "rnd == 1",
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding = 250 * 1000000",
		}),
		PlaceObj('SA_Exec', {
			'expression', "research = 500",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5953, --[[Scenario Mystery 2 title]] "The Dredgers: The Belly of the Beast"),
			'voiced_text', T(7449, --[[voice:narrator]] "The Explorer completed the close inspection of the Object without any major problems."),
			'text', T(5954, --[[Scenario Mystery 2 text]] "The rover ventured within mere meters of the Object and conducted a series of field tests and observations on it. We scanned it with radiological and spectroscopic equipment and extended a remote probe to its carapace, gathering tiny samples of its crust. Via its telescopic arm a camera and sonar were inserted within the Object, revealing a perplexing maze of cavities and corridors inside. A close inspection below the Object shows that it digs a hole beneath itself through a rotation of its frontal hull and extracts metal-rich ores, but its position above the ground level remains the same. The RC Explorer operators report no response from the Object during any of these operations.\n\nThe data we've gathered is already sent to our sponsor via encrypted transmission. We are sure the commission will value our efforts greatly.\n\n<effect>You've gained <funding(reg_param1)> Funding and <research(reg_param2)>.\n\n<hint>The Object extracts resources from below the surface."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "funding",
			'reg_param2', "research",
			'choice1', T(5955, --[[Scenario Mystery 2 choice1]] "Fortune favors the brave"),
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Amount', 500,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
			'is_else', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding = 125 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5953, --[[Scenario Mystery 2 title]] "The Dredgers: The Belly of the Beast"),
			'voiced_text', T(7450, --[[voice:narrator]] "We completed the close inspection of the Object, though the expedition rover’s malfunctions were a heavy price to pay."),
			'text', T(5956, --[[Scenario Mystery 2 text]] "The RC Explorer ventured within mere meters of the Object and conducted series of field tests and observations on it. The operators scanned the Object with radiological and spectroscopic equipment and extended a remote probe to its carapace, gathering tiny samples of its crust. When the RC Explorer approached the Object to perform closer interaction with it via the telescopic arms, the digging process of the Object caused a minor crust collapse and it nearly smashed the front of the rover’s hull. This didn't appear to be a deliberate attack but the damage is evident – it seems the Object possesses immense strength as well.\n\nDespite our setbacks we gathered important data and have already sent it to our sponsor via encrypted transmission. We are sure the commission will value our efforts greatly.\n\n<effect>You've gained <funding(reg_param1)> Funding. The RC Explorer suffered a malfunction.\n\n<hint>The Object extracted resources from below the surface."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "funding",
			'choice1', T(5957, --[[Scenario Mystery 2 choice1]] "We knew the risks but it was worth it."),
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'rover:SetCommand("Malfunction")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 7,
			'parent', 5,
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
			'expression', "funding = 50 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5958, --[[Scenario Mystery 2 title]] "The Dredgers: Foresight and Reflection"),
			'voiced_text', T(7451, --[[voice:narrator]] "We can try to inspect the Object more closely once we’ve properly evaluated the risks."),
			'text', T(5959, --[[Scenario Mystery 2 text]] "The RC Explorer will be returning to base soon. Meanwhile, we will continue to gather visual and telemetry data on the object. The data we've gathered is already sent to our sponsor via encrypted transmission. We are sure the commission will value our efforts greatly.\n\n<effect>You receive <funding(reg_param1)> Funding.\n\n<hint>The Object extracted metals from below the surface."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'reg_param1', "funding",
			'choice1', T(5960, --[[Scenario Mystery 2 choice1]] "Better safe than sorry"),
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_Exec', {
			'expression', "_spawnAnomaly1Alt = false",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 1 (Alt): First Waste Rock",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5961, --[[Scenario Mystery 2 title]] "The Dredgers: Behind the Scenes"),
			'voiced_text', T(7452, --[[voice:narrator]] "While the Object may have left Mars, it also left an indelible mark on our minds and on the face of the planet."),
			'text', T(5962, --[[Scenario Mystery 2 text]] "The large hole left behind by the Object was the focus of the expedition, and the RC Explorer operators did their best to scavenge every bit of information left behind. With the help of the its telescopic arms and on-board spectroscopic equipment, the RC Explorer helped us find out that the hole was dug up on top of a subsurface resource deposit. The amount of discarded waste rock as well as the volume of the hole suggested that the Object sifted through the soil and took away only the usable bits. What the purpose of this was is unknown.\n\n<hint>The Object extracted resources from below the surface and took off with them"),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5963, --[[Scenario Mystery 2 choice1]] "This only makes the mystery deeper."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Anomaly 2: First Tech Boosting",
	}, {
		PlaceObj('SA_CheckResearch', {
			'sa_id', 7,
			'end_block', 8,
			'Field', "Mysteries",
			'Research', "AlienDiggersDestruction",
			'State', "Researched",
		}),
		PlaceObj('SA_ExitSequence', nil),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "_firstTechState == 1",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5964, --[[Scenario Mystery 2 title]] "The Dredgers: A Curious Observation"),
			'voiced_text', T(7453, --[[voice:narrator]] "Mission Control, we’ve got our first detailed analysis of a landed Dredger."),
			'text', T(5965, --[[Scenario Mystery 2 text]] "The RC Explorer used molecular spectroscopy to scan the Rubidium-Strontium proportions on the outer shell of the Dredger and the results are astonishing! It seems that the outer shell of the Dredger is extremely new, as if it has been created years ago!\n\nSome of our scientists proposed that the Dredgers must originate from our Solar System, unless they can traverse immense distances in a flash.\n\n<effect>The Dredger Morphology technology cost is reduced by 50%."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5966, --[[Scenario Mystery 2 choice1]] "If this is true, how could we have missed them for so long?"),
		}),
		PlaceObj('SA_Exec', {
			'expression', "_firstTechState = 2",
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
			'expression', "_firstTechState == 2",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5964, --[[Scenario Mystery 2 title]] "The Dredgers: A Curious Observation"),
			'voiced_text', T(7454, --[[voice:narrator]] "Mission Control, we’ve got RC Explorer operators reporting in from the Dredger analysis site."),
			'text', T(5967, --[[Scenario Mystery 2 text]] "The expedition leader took the initiative to make physical contact with the landed Dredger. Risking it, he ordered the RC Explorer to approach the imposing alien object with a sampling tool and scrape off a portion of its outer hull, nervously anticipating a hostile reaction. The Dredger did nothing, so the RC Explorer ventured closer to it, taking more samples of its hull and probing its insides with various scanning equipment.\n\nIt is now evident that the outer shell of the Dredger consists of silicates and heavy inert metals with no traces of organic materials. The inner walls of the jet vents contain traces of burned alkaline metals. Some of our scientists propose that they are the fuel used to propel the Dredger during flight and take-off.\n\nThe object demonstrated no interest in the activities of the rover. The scientists speculate that it lacks any sort of sensors or processing power whatsoever.\n\n<effect>The Dredger Morphology technology cost is reduced by 50%."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5968, --[[Scenario Mystery 2 choice1]] "So we are talking about a machine or a very primitive organism? Maybe both?"),
		}),
		PlaceObj('SA_Exec', {
			'expression', "_firstTechState = 3",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 4,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5964, --[[Scenario Mystery 2 title]] "The Dredgers: A Curious Observation"),
			'voiced_text', T(7455, --[[voice:narrator]] "An RC Explorer has just completed analyzing a Dredger."),
			'text', T(5969, --[[Scenario Mystery 2 text]] "After our operators made their brave approach and even touched the previous Dredger, no one feels intimidated by the large alien landers. The RC Explorer operators have even begun nicknaming the Dredgers with cute names such as Big Betty. While this raises the morale of the Colony, the scientists are excited to work with the large inflow of samples and data.\n\n<effect>The Dredger Morphology technology cost is reduced by 50%."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5970, --[[Scenario Mystery 2 choice1]] "Name one Cthulhu just for me, OK?"),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 5,
			'parent', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Field', "Mysteries",
			'Research', "AlienDiggersDestruction",
			'Percent', 50,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "PseudoAnomaly 3: Second Tech Boosting",
	}, {
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "_secondTechState == 1",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5971, --[[Scenario Mystery 2 title]] "The Dredgers: The Chinese Puzzle"),
			'voiced_text', T(7456, --[[voice:narrator]] "Our science team is busy with the scant remains of the destroyed Dredger."),
			'text', T(5972, --[[Scenario Mystery 2 text]] "The spectacular explosion revealed that the Dredger lacks mechanical components, its warped internal components resembling organs more than devices. The mysteries behind such a technology have already inspired some of our greatest minds. The Head Scientist called this the project of the century and one can clearly hear the excitement in his voice.\n\n<effect>The Dredger Wavelength Decoding technology cost is reduced by 50%."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5973, --[[Scenario Mystery 2 choice1]] "Keep up the good work."),
		}),
		PlaceObj('SA_Exec', {
			'expression', "_secondTechState = 2",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5971, --[[Scenario Mystery 2 title]] "The Dredgers: The Chinese Puzzle"),
			'voiced_text', T(7457, --[[voice:narrator]] "An RC Explorer just brought in materials salvaged from another destroyed Dredger."),
			'text', T(5974, --[[Scenario Mystery 2 text]] "More samples would allow our scientists to apply more aggressive experimentation and analytical methods, speeding up their work immensely.\n\n<effect>The Dredger Wavelength Decoding technology cost is reduced by 50%."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'Percent', 50,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 1: Introduction",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5975, --[[Scenario Mystery 2 title]] "The Dredgers: Convergence"),
			'voiced_text', T(7458, --[[voice:narrator]] "Mission Control, we’re receiving a priority transmission from Earth."),
			'text', T(5976, --[[Scenario Mystery 2 text]] "Several hours ago, the LINEAR and CSS programs detected an incoming cluster of meteorites from the asteroid belt. Their trajectories are likely to converge with the Martian orbit. Meteor impacts are likely to intensify during the course of the next few weeks.\n\n<effect>Expect several Meteor Storms to hit Mars in the next <text_param1> Sols."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'text_param1', T(5977, --[[Scenario Mystery 2 text_param1]] "10"),
			'choice1', T(5978, --[[Scenario Mystery 2 choice1]] "All personnel – keep calm and watch for meteors."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Meteor Storms Trigger",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 2: Approaching Asteroid",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5979, --[[Scenario Mystery 2 title]] "The Dredgers: The Heavenly Storm"),
			'voiced_text', T(7459, --[[voice:narrator]] "Mission Control, we’ve got an update on the status of the meteor storms. And it’s not looking good."),
			'text', T(5980, --[[Scenario Mystery 2 text]] "The initial evaluation of the situation with the meteor clusters had been miscalculated. The scientists from the near-Earth object detection programs predict that a significant amount of the meteorite stream would fill the space between Mars and Earth. While the thick atmosphere of our home world would protect it from eventual impacts, the threat level for any spacecraft will be past tolerable. To address the new situation, Earth Control has canceled all space flights until further notice.\n\n<effect>Rockets will not arrive until the situation with the meteor impacts is resolved. Inbound rockets will still land on Mars."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'choice1', T(5981, --[[Scenario Mystery 2 choice1]] "We must maintain strict regulations over our supplies until then."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(5982, --[[Scenario Mystery 2 text]] "Severe meteor activity is preventing interplanetary travel. Rockets cannot be requested from Earth."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'amount', -1,
			'target_gameplayconst', "SupplyMissionsEnabled",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 2.5: Prior to Landing",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5983, --[[Scenario Mystery 2 title]] "The Dredgers: Brace for Impact"),
			'voiced_text', T(7460, --[[voice:narrator]] "All stations on red alert! Unidentified object on course for direct impact!"),
			'text', T(5984, --[[Scenario Mystery 2 text]] "Mission Control, our sensors are detecting a large object incoming at high velocity. Judging by the data from our telemetry, its mass and speed are great enough to cause major damage on the surface. It would be wise to evacuate the area around the projected point of impact.\n\nWe could be wrong, but our initial visual readings on the object show that it has an unconventional form for a meteorite. Strange protrusions can be observed from the back of the object. Could this be something different than a meteor?\n\n<effect>A major impact is expected to happen somewhere on Mars."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'choice1', T(5985, --[[Scenario Mystery 2 choice1]] "Stay focused and don’t jump to conclusions."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 3: Landing",
	}, {
		PlaceObj('SA_WaitTime', {
			'duration', 4000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(5986, --[[Scenario Mystery 2 title]] "The Dredgers: Grounding Day"),
			'voiced_text', T(7461, --[[voice:narrator]] "Planetfall. We finally get a visual on the target as the dust settles. No one at Mission Control can believe their eyes."),
			'text', T(5987, --[[Scenario Mystery 2 text]] "We haven't seen anything like it – and it doesn't look like something man made. I don't want to overstate things, but this could be a First Contact situation."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5988, --[[Scenario Mystery 2 choice1]] "Let’s see what we can see."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 4: First Anomaly",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5986, --[[Scenario Mystery 2 title]] "The Dredgers: Grounding Day"),
			'voiced_text', T(7462, --[[voice:narrator]] "Mission Control, you’re not going to believe this – we couldn’t either. Whatever this thing is, it’s not a meteor."),
			'text', T(5989, --[[Scenario Mystery 2 text]] "The object hit the surface without decelerating. We expected it to burst into pieces from the force of impact, but it seems it possesses immense structural integrity. The most astonishing thing is that it has moving parts. From what we have observed so far, it seems that it is trying to burrow below the crust of the planet.\n\nIt is now or never to take a closer look – should the risk be worth it.\n\n<effect>An Anomaly at the landing site is available for analysis."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5990, --[[Scenario Mystery 2 choice1]] "Maintain safe distance and stand by for further orders."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(5991, --[[Scenario Mystery 2 text]] "A mysterious alien object has landed on Mars and is excavating resources. We have to send an Expedition to investigate it on site."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 4.5: Take Off",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5992, --[[Scenario Mystery 2 title]] "The Dredgers: Egress"),
			'voiced_text', T(7463, --[[voice:narrator]] "Mission Control, the unidentified object has left Martian airspace and is now heading towards the asteroid belt."),
			'text', T(5993, --[[Scenario Mystery 2 text]] "As abruptly as it came, the object took off and accelerated extremely quickly. Our initial predictions that it would dig itself deeper in the crust have proven wrong. Instead, from our observation on the landing site, we can conclude that a large amount of Martian soil had been removed and taken away. What the goal and the purpose of this operation was is unknown.\n\n<effect>The object has taken off."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(5994, --[[Scenario Mystery 2 choice1]] "Watch the skies – something tells me there will be more of this."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(5995, --[[Scenario Mystery 2 text]] "The mysterious alien codenamed Dredger has taken off."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 5: Landings Continue",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(5996, --[[Scenario Mystery 2 title]] "The Dredgers: They Will Be Back"),
			'voiced_text', T(7464, --[[voice:narrator]] "Mission Control! We’ve detected another incoming object."),
			'text', T(5997, --[[Scenario Mystery 2 text]] "The similarities with the first Object are obvious, but we cannot confirm the identity on the new one. Our scientists speculate that it would land in another mineral rich region. Our sponsor suggests that we maintain visual contact with the Object but keep our distance as its intentions or its defensive capabilities are unknown.\n\nOur sponsor’s contacts on Earth rifled through any data for a mission launched by another competitor on Earth, but from what we have seen so far it wouldn’t be far-fetched to suggest that these Objects are of extraterrestrial origin.\n\nBy the way, the sponsor HQ dubbed the Object Dredger and they require us to maintain coherency in our documentation by using the same call-sign.\n\n<effect>A new Dredger is about to land on Mars."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'choice1', T(5998, --[[Scenario Mystery 2 choice1]] "Whatever they call it, it’s still our problem."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(5999, --[[Scenario Mystery 2 text]] "More Dredgers continue to land on Mars in search of resources."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 7: Lifted Embargo",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6000, --[[Scenario Mystery 2 title]] "The Dredgers: Happy Reunion"),
			'voiced_text', T(7465, --[[voice:narrator]] "Mission Control, the ban on space flights has been lifted."),
			'text', T(6001, --[[Scenario Mystery 2 text]] "This happened after our sponsor's council reviewed our report on the Dredgers. With the current development, we know that more and more Dredgers land on Mars to extract large amounts of subsurface metals which, combined with the ban on space flights, would endanger the future of the Colony. Our observations on the Dredgers' flight trajectories indicate that they are heading exclusively to Mars and that the threat for interplanetary vessels has lessened, which was confirmed by the CSS and LINEAR.\n\n<effect>Rockets can travel between Mars and Earth once more."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'choice1', T(6002, --[[Scenario Mystery 2 choice1]] "Finally!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6003, --[[Scenario Mystery 2 text]] "The ban on interplanetary flights was lifted. We can now request help from Earth."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_GameplayConstModifier', {
			'target_gameplayconst', "SupplyMissionsEnabled ",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 8: First Tech",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6004, --[[Scenario Mystery 2 title]] "The Dredgers: Hands Full"),
			'voiced_text', T(7466, --[[voice:narrator]] "Sol after Sol, our scientists worked their fingers to the bone trying to find a solution to our incoming Dredger problem. No such luck."),
			'text', T(6005, --[[Scenario Mystery 2 text]] "The problem is the lack of information – so far, we know very little about the nature of the Dredgers. To us they appear as inscrutable as natural events were to our forefathers. The science team requests more data on the objects and, if possible, a closer inspection of several different targets.\n\n<effect>New Research available: Dredger Morphology\n\n<hint>You can boost your Technology Research rate by analyzing landed Dredgers."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6006, --[[Scenario Mystery 2 choice1]] "Operation authorized."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6007, --[[Scenario Mystery 2 text]] "Scientists are working on a project to analyze the structure of the Dredgers. Expeditions near landed Dredgers will help their effort."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "AlienDiggersDestruction",
			'cost', 20000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Research 1: Effects",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 8.5: Sponsor Message",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6008, --[[Scenario Mystery 2 title]] "The Dredgers: Fire at Will"),
			'voiced_text', T(7467, --[[voice:narrator]] "Mission Control, we've got an incoming message from our sponsor. An encrypted one."),
			'text', T(6009, --[[Scenario Mystery 2 text]] "The council of our sponsor has authorized us to use force when dealing with the Dredgers. They put the future of the Colony as the utmost priority."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6010, --[[Scenario Mystery 2 choice1]] "It’s comforting to know that our actions have political backing."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 9: Second Tech",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6011, --[[Scenario Mystery 2 title]] "The Dredgers: The Koronis Predicament"),
			'voiced_text', T(7468, --[[voice:narrator]] "A recent detailed analysis of the Dredgers revealed that they're sending signals towards the Koronis asteroid cluster."),
			'text', T(12126, --[[Scenario Mystery 2 text]] "This occasional discovery was made later rather than sooner, as the emissions are cleverly masked to resemble cosmic rays in their wavelength. It is apparent that the source of the landers is closer than we thought.\n\nThe science team immediately requested permission to “dissect” one of the Dredgers to get their hands on the mysterious device used to send these transmissions.\n\n<effect>A new research is available – Dredger Wavelength Decoding.\n\n<hint>Destroy Dredgers using Drones to reduce the cost of the technology."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6013, --[[Scenario Mystery 2 choice1]] "Time to stop whistling in the dark."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6014, --[[Scenario Mystery 2 text]] "Scientists are working on a project to decode the communications used by the Dredgers. Expeditions to the locations of destroyed Dredgers will help their effort."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "AlienDiggersDetection",
			'cost', 20000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Research 2: Effects",
		}),
		PlaceObj('SA_Exec', {
			'expression', "destroyed_diggers = UICity.mystery.destroyed_diggers",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 5,
			'end_block', 6,
			'expression', "UICity.mystery.destroyed_diggers > destroyed_diggers",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "PseudoAnomaly 3: Second Tech Boosting",
		}),
		PlaceObj('SA_Exec', {
			'expression', "destroyed_diggers = UICity.mystery.destroyed_diggers",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		PlaceObj('SA_CheckResearch', {
			'sa_id', 4,
			'Form', "break-if",
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'State', "Researched",
		}),
		PlaceObj('SA_WaitTime', {
			'duration', 333,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 10: Speculations",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6015, --[[Scenario Mystery 2 title]] "The Dredgers: Dark Omens"),
			'voiced_text', T(7469, --[[voice:narrator]] "The aliens didn't try to destroy our cities. Then again, they didn't try to contact us, either."),
			'text', T(6016, --[[Scenario Mystery 2 text]] "Still, what started out as a single contact quickly grew into series of regular visits. Even when our “guests” are not blaster-toting gray men, they cause damage to our Colony in subtle and cruel ways. As more and more Dredgers continue to land on the surface, the future of the Colony could be threatened by the lack of sufficient metallic resources. It is a sad conclusion, but our first contact with alien life could turn into a race for survival.\n\nOur scientists suggest that with the current rate of landings the amount of metals in our sector will be depleted within three years – and some of the most pessimistic of our colleagues believe that the trend is for the landings to become more frequent. This would be a terrible prospect."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6017, --[[Scenario Mystery 2 choice1]] "Arrange a team meeting – we have to work out a solution."),
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 10.5: PC Warning",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6018, --[[Scenario Mystery 2 title]] "The Dredgers: Into the Light"),
			'voiced_text', T(7470, --[[voice:narrator]] "We've got another problem on the horizon. A potentially devastating one."),
			'text', T(6019, --[[Scenario Mystery 2 text]] "A famous leaks site has just released leaked logs and reports from our Colony. They concentrate exclusively on the Dredgers and elaborate on the evidence that we have contacted an alien civilization.\n\nOur sponsors were probably foolish enough to believe that a secret can remain hidden from the public in the Age of Information. The uproar is tremendous and the UN calls for an emergency press conference. The monitoring council of our sponsor was insistent on our participation in the event. It will be held via the interplanetary network. We’ll be the center of attention. The time-lag will give us fifteen minutes between questions to think of the best way to answer.\n\nThere is no reason to hide the truth now."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6020, --[[Scenario Mystery 2 choice1]] "Good golly!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6021, --[[Scenario Mystery 2 text]] "A hearing on the Dredgers matters and a press conference at the United Nations Assembly will be held soon."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 11: PC Introduction (Choice)",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T(6022, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference"),
			'voiced_text', T(7471, --[[voice:narrator]] "The conference at the United Nations is about to begin. We’ll be transcribing the communication on the fly, give or take five minutes or so."),
			'text', T(6023, --[[Scenario Mystery 2 text]] "Mr. President; Mr. Secretary General; fellow delegates; ladies and gentlemen:\n\nFor many centuries, humans have speculated that, in the great expanse of the universe, there should be life. Humanity never dismissed their hope for contact and so, even before we could reach for the stars, we built machines to probe the space for signs of the existence of others. Until recently, our attempts were met with silence and we had to rely only on our unshakable belief. But today we have proof. We are not alone.\n\nAllow me to introduce you to the Commander of Mars Alpha, our first Colony on the Red Planet, who will personally address your questions."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6024, --[[Scenario Mystery 2 choice1]] "We can’t speak to contact or conflict, but rather about unforeseen competition..."),
			'choice2', T(6025, --[[Scenario Mystery 2 choice2]] "To talk about making contact with a sentient race is rather premature..."),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6026, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference: The Race is On"),
			'voiced_text', T(7472, --[[voice:narrator]] "What we can confirm is that the automated vessels we encountered were of unknown origin."),
			'text', T(6027, --[[Scenario Mystery 2 text]] "The vessels dismissed all of our attempts to communicate and proceeded with their only mission – to consume and transport resources from the surface of Mars. In another time we would address their activity with affectionate curiosity and excitement, but in the light of our current situation, this has caused great distress and concern in all personnel of Mars Alpha. Without bothering you with the tiresome technical details, the extraction and utilization of Martian resources is crucial to the success of Mars Alpha and our ability to settle in the Solar System.\n\nOur Colony's safety and viability is our utmost priority. This is why I’ve personally supervised operations to deny the alien vessels the opportunity to extract and steal away the metal deposits crucial to our survival. I would ask those who might raise questions on the measure of our reaction – what do you call a neighbor who deliberately tries to stall your attempts to lead a better life?"),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'choice1', T(7317, --[[Scenario Mystery 2 choice1]] "Continue"),
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
			'title', T(6028, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference: Contact Denied"),
			'voiced_text', T(7473, --[[voice:narrator]] "Humanity’s imagination has always portrayed contact with an alien species as either a precursor to military conflict or a chance for peaceful exchange of culture and ideas."),
			'text', T(6029, --[[Scenario Mystery 2 text]] "At their core of our expectations has always been a flawed assumption – that an alien race would be psychologically human.\n\nThe first contact, if one has the audacity to call it that way, was with a system of automated mining equipment. As disappointing as it may sound, the alien machines displayed an almost offensive disregard for our presence. So far they had followed their simple purpose – to extract resources from the surface of Mars. The nature and intentions of their creators remains a mystery and our best minds are working towards unveiling it."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'choice1', T(7318, --[[Scenario Mystery 2 choice1]] "Continue"),
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T(6030, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference - Hard Questions"),
			'voiced_text', T(7474, --[[voice:narrator]] "After the applause dies down, the delegates proceed to question our sponsor’s committee as to the details of their encounter with the Dredgers."),
			'text', T(6031, --[[Scenario Mystery 2 text]] "They handle most of the questions with ease and require little input from you. And then you are confronted with a direct question from one of the delegates.\n\n“An anonymous yet reliable source disclosed to us that you ordered and succeeded in the deliberate destruction of at least one of the alien vessels. My country condemns any premature aggressive actions which could taint the reputation of humankind, especially when addressing such a delicate matter. What gave you the authority to act in such a risky manner without an official resolution from the Council of the United Nations?”"),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6032, --[[Scenario Mystery 2 choice1]] "The prosperity of our Colony is our first and only concern..."),
			'choice2', T(6033, --[[Scenario Mystery 2 choice2]] "This is not an act of aggression but instead a step towards mutual understanding..."),
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 5,
			'end_block', 6,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6034, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference – United We Stand"),
			'voiced_text', T(7475, --[[voice:narrator]] "Honorable delegates, we stand at the doorway to a new era, taking those first hesitant steps towards the stars beyond. Allowing fear and doubt to sway us from our path would fail not only Mars Alpha, but us as a species."),
			'text', T(6035, --[[Scenario Mystery 2 text]] "For countless generations the human species had proven to possess the ability to adapt, survive and thrive. Let us not forget who we are.\n\nThe actions I ordered were not an act of war and aggression, but instead were means to secure the future of our initiative and fulfill a promise to all people on Earth. Dismantling several alien vessels is a fair price to pay for what's at stake today. And if the creators of these vessels see our actions as something more than doing the right thing, we will prove them wrong. For we do not desire to take what's not ours – we want to fulfill our destiny as a space-faring species."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'choice1', T(7319, --[[Scenario Mystery 2 choice1]] "Continue"),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1800000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "funding = 250 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6036, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference – A Battle Well Fought"),
			'voiced_text', T(7476, --[[voice:narrator]] "By the looks on the faces of the audience, your words have made a lasting mark."),
			'text', T(6037, --[[Scenario Mystery 2 text]] "You not only managed to persuade the public to support our efforts, but also inspired millions of people around the world who watched the live-stream.\n\nYour influence will aid the Colony greatly.\n\n<effect>The United Nations transferred resources to the Mars Alpha project. You've gained <funding(reg_param1)> Funding."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "funding",
			'choice1', T(6038, --[[Scenario Mystery 2 choice1]] "I'm glad the UN understood the importance of our mission."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6039, --[[Scenario Mystery 2 text]] "The United Nations were persuaded to support the Colony with increased funding."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding",
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
			'title', T(6040, --[[Scenario Mystery 2 title]] "Press Conference 2: A Bridge to Build"),
			'voiced_text', T(7477, --[[voice:narrator]] "I would only take issue with half of the statement given by our honorable delegate. While we did indeed dismantle the vessel, I would hardly paint our intent as an expression of the darker side of human nature."),
			'text', T(6041, --[[Scenario Mystery 2 text]] "Our goal was to make sense of what's happening, of the nature of the alien vessels, which is one of the underlying principles of science.\n\nOur efforts were not in vain. The greatest minds of Mars Alpha and Earth managed to make amazing progress. Dismantling the probe allowed us to make sense of the communications of the alien machines, maybe even the basis of the language of their creators, and not only that. The scientific knowledge we gained from this event will speed our way to the stars, where even more puzzling mysteries await those of us who have the bravery and integrity to face the unknown."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'start_minimized', false,
			'choice1', T(7320, --[[Scenario Mystery 2 choice1]] "Continue"),
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 1800000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "applicants = 50",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6036, --[[Scenario Mystery 2 title]] "The Dredgers: Press Conference – A Battle Well Fought"),
			'voiced_text', T(7476, --[[voice:narrator]] "By the looks on the faces of the audience, your words have made a lasting mark."),
			'text', T(6042, --[[Scenario Mystery 2 text]] "You not only managed to persuade the public to support our efforts, but also inspired millions of people around the world who watched the live-stream.\n\nYour influence will aid the Colony greatly.\n\n<effect> Public opinion for Mars Alpha increased. Additional <reg_param1> Applicants are available."),
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "applicants",
			'choice1', T(6043, --[[Scenario Mystery 2 choice1]] "I feel like a rock star."),
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', 50,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6044, --[[Scenario Mystery 2 text]] "Millions of people on Earth were inspired by the press-conference and more and more Applicants are willing to colonize Mars."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 8,
			'parent', 7,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 14: Invasions",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6045, --[[Scenario Mystery 2 title]] "The Dredgers: Darkened Skies"),
			'voiced_text', T(7478, --[[voice:narrator]] "Warning! We’ve got a red alert!"),
			'text', T(6046, --[[Scenario Mystery 2 text]] "The scanners have gone crazy with the signatures of dozens of Dredgers heading our way. The Dredger transmissions repeat a signal we can interpret only as “urgency eat/dig”. On the screen they look like a swarm of locusts and we presume their goal is similar.\nThe mission sponsor has authorized a forceful response.\n\n<effect>Multiple Dredgers detected! They will arrive within <text_param1> Sols."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'text_param1', T(7199, --[[Scenario Mystery 2 text_param1]] "5"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6047, --[[Scenario Mystery 2 text]] "Multiple Dredgers are bound to land on Mars and harvest our resources!"),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 15: Invasion Summary",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "destroyed_dredgers = UICity.mystery.destroyed_diggers - _destroyed_diggers_prior_invasion",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "destroyed_dredgers > 0",
		}),
		PlaceObj('SA_Exec', {
			'expression', "money_reward = destroyed_dredgers * 100 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6048, --[[Scenario Mystery 2 title]] "The Dredgers: Darkened Skies – Debrief"),
			'voiced_text', T(7479, --[[voice:narrator]] "Mission Control, the Dredgers are retreating!"),
			'text', T(6049, --[[Scenario Mystery 2 text]] "As sudden as they fell upon us, the alien vessels are taking off all at once. Our scientists are just starting to estimate the exact amount of precious resources that have been irreparably lost, but the preliminary reports are promising. We've survived!\n\nPleased with our performance, the monitoring council of our sponsor offered us their financial support as a stimulus.\n\n<effect>You destroyed <reg_param1> Dredgers during the mass landing. Based on the Dredgers destroyed, the mission sponsor provided a bounty of <funding(reg_param2)> Funding."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "destroyed_dredgers",
			'reg_param2', "money_reward",
			'choice1', T(6050, --[[Scenario Mystery 2 choice1]] "We’ll do it again if we have to!"),
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "money_reward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_Exec', {
			'expression', "money_reward = 250 * 1000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6048, --[[Scenario Mystery 2 title]] "The Dredgers: Darkened Skies – Debrief"),
			'voiced_text', T(7479, --[[voice:narrator]] "Mission Control, the Dredgers are retreating!"),
			'text', T(6051, --[[Scenario Mystery 2 text]] "As sudden as they fell upon us, the alien vessels are taking off all at once. Our scientists estimate they extracted a significant amount of materials from below the surface. This is a serious threat to the viability of our Colony and the monitoring council of our sponsor took that in mind. They offered us a small sum as a disaster relief, but from the subtle remarks in their message we can tell they are not happy with the situation.\n\n<effect>You've gained <funding(reg_param1)> Funding as disaster relief."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "money_reward",
			'choice1', T(6052, --[[Scenario Mystery 2 choice1]] "Cosmos help us!"),
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "money_reward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6053, --[[Scenario Mystery 2 text]] "We have survived the Dredger invasion. Teams are working on evaluating the damage."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 16: Large Digger Arrival",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T(6054, --[[Scenario Mystery 2 title]] "The Dredgers: The Leviathan Rises"),
			'voiced_text', T(7480, --[[voice:narrator]] "Red alert! We have a massive object converging with Mars on a collision course!"),
			'text', T(6055, --[[Scenario Mystery 2 text]] "Our readings confirm that this is a Dredger, but its size... There is no mistake, unfortunately.\n\nIf we leave this massive Dredger unchecked, it could have a disastrous impact on our metal supply. On the other hand, our Tactical Advisor supposes that the arrival of this new Dredger may be caused by the threat our actions proved for the aliens' mining operations. At the end, the decision as to how we address the new situation was obvious.\n\nJust when we thought we survived the worst...\n\n<effect>A huge Dredger will land on Mars in <text_param1> Sols.\n\n<hint>You can dismantle the incoming Dredger using Drones."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_01.tga",
			'text_param1', T(7200, --[[Scenario Mystery 2 text_param1]] "5"),
			'choice1', T(6052, --[[Scenario Mystery 2 choice1]] "Cosmos help us!"),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6056, --[[Scenario Mystery 2 text]] "A massive Dredger is inbound to land on Mars."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 17.1: Large Digger Destroyed",
	}, {
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6057, --[[Scenario Mystery 2 title]] "The Dredgers – Conclusion: Fires of Tomorrow's Dawn"),
			'voiced_text', T(7481, --[[voice:narrator]] "We all watched as the Dredger collapsed into a blazing inferno. A spectacular end. While some at Mission Control cheered, others simply stared, their concerns unvoiced."),
			'text', T(6058, --[[Scenario Mystery 2 text]] "The comm-feed from the dying Dredger report a singular message broadcast towards the Koronis cluster – “retreat”, “retreat”. Others may wonder, but you know deep inside that you beheaded the beast – the other Dredgers won't be coming back.\n\nSomehow you don't feel like the victor. You stand silent as you ask yourself one question – have you defeated a dangerous enemy or rebuffed a potential ally?\n\n<effect>Xeno-Extraction Technology is available for research with a 50% cost reduction.\n<effect>Gained a new technology, <em><reg_param1></em>"),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "_grantedTech",
			'choice1', T(6059, --[[Scenario Mystery 2 choice1]] "Only time will tell."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6060, --[[Scenario Mystery 2 text]] "We have destroyed the massive Dredger and salvaged samples and information on its unique excavation methods – Xeno-Extraction Tech is now available. The alien vessels are gone forever."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "XenoExtraction",
			'cost', 20000,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Mysteries",
			'Research', "XenoExtraction",
			'Amount', 50,
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "destroyed drednaught")',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_DiggersMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Message 17.2: Large Digger Escapes",
	}, {
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6061, --[[Scenario Mystery 2 title]] "The Dredgers – Conclusion: Crossroads"),
			'voiced_text', T(7482, --[[voice:narrator]] "Standing in the shoulder-to-shoulder crush of Mission Control, the deep thrum of take-off is almost more felt than heard. It’s not long before the Dredger is a wink in the distance, massive payload and all."),
			'text', T(6062, --[[Scenario Mystery 2 text]] "The cheerful chorus of the Dredger communications is too confusing to understand, but this is pointless as their behavior clearly marks their intentions. The visual feed on the Koronis cluster shows how thousands of bright dots light the sky as the swarm of Dredgers breaks its silence. The satellites track their movement as the swarm gathers around the massive Dredger and the alien vessels head towards the end of the Solar System.\n\nYou failed to destroy the massive Dredger and the Colony will pay the price in the months to come, but maybe this is for the better. Maybe today humanity avoided retribution from the unknown creators of the Dredgers, or started on the path of cooperation, and maybe even friendship, when the next generations reach the stars.\n\n<effect>Xeno-Extraction Technology is available for research\n<effect>Gained a new technology, <em><reg_param1></em>"),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'reg_param1', "_grantedTech",
			'choice1', T(6059, --[[Scenario Mystery 2 choice1]] "Only time will tell."),
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "XenoExtraction",
			'cost', 20000,
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6063, --[[Scenario Mystery 2 text]] "The massive Dredger has taken off and converged with the alien fleet on a course leading far from the Solar System. They’ve left forever. We now have the Xeno-Extraction Tech project based on what we know about the Dredgers."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "drednaught escaped")',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_DiggersMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Research 1: Effects",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_boostingFirstTech = true",
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "AlienDiggersDestruction",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_boostingFirstTech = false",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T(6064, --[[Scenario Mystery 2 title]] "The Dredgers: Knowing the Unknown"),
			'voiced_text', T(7483, --[[voice:narrator]] "We’ve completed the final analysis of the Dredgers but, as is all too common with the mysteries we encounter, it raises more questions than it answers."),
			'text', T(6065, --[[Scenario Mystery 2 text]] "The scientists concluded that the organic appearance of the Dredgers is misleading. Even though their robust hulls are made to endure extreme impact forces, they are deprived of any sensors and react in no way to changes in their environment. Simply put, they are nothing more than extraction vehicles with simple programming.\n\nHere comes the best part – the Dredgers are quite vulnerable! The alkaloid fuels they utilize for propulsion makes them highly volatile in oxygen-rich atmospheres. This is probably the reason why no Dredger landed on Earth so far.\nIt is a tough decision whether we should use force against the Dredgers.\n\n<effect>You can now use Drones to destroy Dredgers"),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6066, --[[Scenario Mystery 2 choice1]] "Hostilities should be our last resort."),
			'choice2', T(6067, --[[Scenario Mystery 2 choice2]] "They came uninvited and I believe it is our right to defend what is ours."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6068, --[[Scenario Mystery 2 text]] "We have researched a way to destroy landed Dredgers by using Drones."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
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
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_Exec', {
			'expression', "UICity.mystery.can_destroy_diggers = true",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Research 2: Effects",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "_boostingSecondTech = true",
		}),
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "AlienDiggersDetection",
			'State', "Researched",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_boostingSecondTech = false",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T(6069, --[[Scenario Mystery 2 title]] "The Dredgers: The Language"),
			'voiced_text', T(7484, --[[voice:narrator]] "We’ve done it. Our science team has deciphered the so-called language of the Dredgers."),
			'text', T(6070, --[[Scenario Mystery 2 text]] "Each transmission consists of several desynchronized threads – each of them sounds like cosmic static, but when combined in the right way they form a pattern which can be translated to binary.\n\nThe information transmitted by the Dredgers is surprisingly simple. They share data regarding plotted courses, the status of their excavations and the location of mineral-rich sites. We cannot identify the source in Koronis as the Dredgers do not use any call signs, but nevertheless we are able to intercept their transmissions and predict the sites of future landings.\n\n<effect>Dredger landing sites will be marked on the map."),
			'log_entry', true,
			'image', "UI/Messages/dredgers_mystery_02.tga",
			'choice1', T(6071, --[[Scenario Mystery 2 choice1]] "Inform me immediately if you intercept anything unusual."),
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_DiggersMysteryLog",
			'text', T(6072, --[[Scenario Mystery 2 text]] "We have researched a way to detect the future landing sites of Dredgers."),
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 2",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_DiggersMysteryLog",
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