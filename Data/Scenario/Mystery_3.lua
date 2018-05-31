-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 3",
	'file_name', "Mystery_3",
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Mirror Sphere Excavation (Spawn)",
		'autostart', true,
	}, {
		PlaceObj('SA_PlaceObject', {
			'check_dome', "outside",
			'random_pos_label_dist', 25000,
			'class_name', "MirrorSphere",
			'use_random_pos', true,
			'store_pos', "firstBlackCubePos",
			'store_obj', "firstSphere",
			'par_name_1', "init_with_amount",
			'par_val_1', "27000",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "UICity.labels.Colonist and #UICity.labels.Colonist >= 100",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3750000,
			'rand_duration', 3750000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "firstSphere:PlaceAnomaly()",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryBegin")',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "ShieldingTech",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstDamage"] == true',
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "Anti-Sphere Shield",
			'cost', 5000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "PowerDecoysTech",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.MirrorSpheres >= 3",
		}),
		PlaceObj('SA_WaitMessage', {
			'preset', "Mystery3_PowerDecoysTech",
			'choice1', T{7485, --[[Scenario Mystery 3 choice1]] "Can’t decide if this is good news or bad."},
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "Purpose of the Spheres",
			'cost', 5000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Cold Wave Trigger",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstSplit"] == true',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery3Counter",
			'autoupdate', true,
			'expression', "GetMirrorSphereResonancePct()",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["Resonance"] == true',
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.MirrorSpheres > 2",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'RemoveOnScreenNotification("Mystery3Counter")',
		}),
		PlaceObj('SA_StartDisaster', {
			'disaster', "Cold Wave",
			'endless', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'preset', "Mystery3_ColdWave",
			'voiced_text', T{7113, --[[voice:narrator]] "The Colony is expecting some sort of artificial cold wave. How’s that even possible?"},
			'text', T{7486, --[[Scenario Mystery 3 text]] "It is also confirmed that the Spheres are no longer splitting and are simply using their energies to maintain atmospheric stasis – in other words they have reached the critical mass needed for their purpose. \n\nWhat or who needs to lower the atmospheric temperature of contemporary Mars is beyond any of us – yet it is most evident that the Spheres are effective at what they are doing. \n\nIf we want to stop the change, we must find a breakthrough based on what we already know and learn how to control or cancel this process.\n\n<effect> A prolonged, extremely strong Cold Wave has begun.\n<effect> Xeno-Terraforming research available."},
			'choice1', T{7487, --[[Scenario Mystery 3 choice1]] "This is now formally a fight for survival."},
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "Xeno-Terraforming",
			'cost', 20000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "[LOG] ColdWave",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.MirrorSpheres <= 0",
		}),
		PlaceObj('SA_StopDisaster', {
			'disaster', "Cold Wave",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Ending",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.MirrorSpheres > 0",
		}),
		PlaceObj('SA_WaitExpression', {
			'expression', "#UICity.labels.MirrorSpheres < 1",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Grant Wonder Tech",
			'wait', true,
		}),
		PlaceObj('SA_WaitMessage', {
			'preset', "Mystery3_Ending",
			'text', T{7488, --[[Scenario Mystery 3 text]] "Our scientists are confident that we have recorded and gathered all data necessary for making sense of this encounter in the coming decades. Also, they are confident that the Spheres themselves had overstayed their welcome. \n\nKeeping them around would have meant living with the ever present danger of re-activating the endless cold wave once more and caused harm to our Colony as they did before. \n\nAnd despite the risks, despite the purely pragmatic reasons for destroying all the Spheres, one can’t help but wonder how the generations to come will feel of this deed. Will we go down in history as cowards? Or maybe as too insensitive to the magnitude of the encounter, the very first non-man made technology ever found?\n\nWhen our scientists give up on trying to determine the origin of these Spheres, will textbooks mention that because of the rash actions and fears of the few pioneers that lived on Mars at the time, the riddle will never be solved?\n\n<effect>No more Spheres are left.\n<effect>Gained a new Technology, <em><reg_param1></em>."},
			'image', "UI/Messages/sphere_mystery_01.tga",
			'reg_param1', "_grantedTech",
		}),
		PlaceObj('SA_UnlockAchievement', {
			'achievement', "CompletedMystery3",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "[LOG] Ending",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] OnAnomalyScanned",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["OnAnomalyScanned"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6073, --[[Scenario Mystery 3 text]] "We discovered a mysterious sphere half-buried in the red sands. Its origins and purpose remain unknown."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] SphereLaunch",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["SphereLaunch"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6074, --[[Scenario Mystery 3 text]] "The ominous Sphere has burst from the ground and is floating in an unknown direction."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] FirstCharge",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstCharge"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6075, --[[Scenario Mystery 3 text]] "The Sphere has started draining energy from the ground and from our power grid."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] FirstDamage",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstDamage"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6076, --[[Scenario Mystery 3 text]] "The harmful energy-draining aura of the Sphere has affected nearby Colonists, damaging their health. Mission Control advises extreme caution near the alien objects."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] FirstSplit",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstSplit"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6077, --[[Scenario Mystery 3 text]] "The Sphere has used the energy it stored to create another copy of itself. Our scientists predict that the process will continue while also accelerating the coming of some related event."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] FirstCatch",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstCatch"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6078, --[[Scenario Mystery 3 text]] "The power decoys worked! A Sphere is now trapped in one of them. If everything works, it will remain there until we can sustain the power feed of the decoy."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] FirstDeposit",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', 'MirrorSphereEvents["FirstDeposit"] == true',
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6079, --[[Scenario Mystery 3 text]] "The Sphere obeyed our commands and has crash-landed on the surface. We can now safely harvest resources from the deposits left behind."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] PowerDecoysTech",
		'autostart', true,
	}, {
		PlaceObj('SA_WaitResearch', {
			'Field', "Mysteries",
			'Research', "Purpose of the Spheres",
			'State', "Researched",
		}),
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6080, --[[Scenario Mystery 3 text]] "We have invented Power Decoys – buildings which should allow us to attract and trap a Sphere on a specific location."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] ColdWave",
	}, {
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6081, --[[Scenario Mystery 3 text]] "The Spheres had started to terraform Mars, draining it of its energy and making it colder – a massive Cold Wave has began!"},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "[LOG] Ending",
	}, {
		PlaceObj('SA_AppendToLog', {
			'register', "_SpheresMysteryLog",
			'text', T{6082, --[[Scenario Mystery 3 text]] "Success! We managed to disable all of the Spheres!"},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence_list', "Mystery 3",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'Msg("MysteryEnd", "resolved")',
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_SpheresMysteryLog",
			'dismissable', "dismissable",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Update Mystery Log",
	}, {
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_SpheresMysteryLog",
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