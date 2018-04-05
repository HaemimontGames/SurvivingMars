-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Mystery 9",
	'file_name', "Mystery_9",
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
			'expression', "#(UICity.labels.Colonist or empty_table) >= 120",
			'duration', 5000,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 720000,
			'rand_duration', 2160000,
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryBegin")',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 60000,
			'rand_duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'comment', "opening message",
			'title', T{8359, --[[Scenario Mystery 9 title]] "Beyond Earth: Vision of the Future"},
			'voiced_text', T{8360, --[[voice:billionaire]] "“No, aliens did not build the pyramids – human beings built the pyramids because we are clever and hard workers."},
			'text', T{8361, --[[Scenario Mystery 9 text]] "And in this day and age, when we value the strength of a civilization not by its ability to wage war - but by its ability to prevent it, our hard work and cleverness have only one place left to take us – up.\n\nUp towards the stars - above our superficial segregations and competing with ourselves. Up towards a united humanity spread out on many worlds… possibly even stars.  \n\nI am more than certain that the last several thousand years of our history are but the bumpy road towards a version of humanity where there is no hunger, no war, no needless suffering and where the future holds nothing but opportunity and wonder.  And I also believe we are quite close to the end of this turbulent road. I make it my mission to help take us through this last stretch and today I announce my plan in investing the vast majority of my considerable fortune to this endeavor. “\n\nRede Goddenberry, one of the wealthiest and most powerful people on Earth, addresses the UN General Assembly "},
			'actor', "billionaire",
			'image', "UI/Messages/beyond_earth_mystery_02.tga",
			'choice1', T{8362, --[[Scenario Mystery 9 choice1]] "Inspiring!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8363, --[[Scenario Mystery 9 text]] "Rede Goddenberry gives out a speech at the UN."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 2160000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Project - Moon Base",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Project - Asteroid Base",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Project - Rubicon Station",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Project - Ganymede Colony",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Solar Flare",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Sabotage",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "VictoryCondition",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Timeout",
		}),
		PlaceObj('SA_WaitMessage', {
			'comment', "check if we need rewards for this one",
			'title', T{8364, --[[Scenario Mystery 9 title]] "Beyond Earth: A Deluded Old Billionaire"},
			'voiced_text', T{8365, --[[voice:billionaire]] "Greetings from Earth! I’ve wanted an audience with the founders of the first human settlement away from our dear blue planet for ages now."},
			'text', T{8366, --[[Scenario Mystery 9 text]] "You see, in you I find kindred souls, souls who do not view my speech at the UN as the ramblings of a deluded old billionaire. I’m certain my vision resonates with all of you up there; after all - you are a part of it.\n\nMy Beyond Earth initiative is pushing several separate projects simultaneously - all aimed at bringing prosperity and peace to a human race spread across the Solar System.\n\nOne of the projects in question is currently in a ditch - the planning of a Moon base to mine Hydrogen 3, called Aldrin Base. I’m certain I don’t need to tell you what an abundance of the material would mean energy-wise. I’d kindly implore you, if your situation permits it of course, to contribute some research capacity and quite frankly know-how to the Beyond Earth initiative.\n\n<effect>Beyond Earth Initiative tech unlocked. Research the tech to help the Aldrin Base project."},
			'actor', "billionaire",
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'choice1', T{8367, --[[Scenario Mystery 9 choice1]] "Let's plan this."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "repeatable research available",
			'register', "_MysteryLog",
			'text', T{8368, --[[Scenario Mystery 9 text]] "Rede Goddenberry contacts the Mars colony with direct request for research contribution towards his Beyond Earth initiative."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_RevealTech', {
			'tech', "SolExploration",
			'cost', 5000,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Tech Choice",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 2880000,
			'rand_duration', 1440000,
		}),
		PlaceObj('SA_WaitMessage', {
			'comment', "see if we need rewards for this one too",
			'title', T{8369, --[[Scenario Mystery 9 title]] "Beyond Earth: Trade Rockets"},
			'voiced_text', T{8370, --[[voice:billionaire]] "The Beyond Earth initiative needs your help! And not with know-how this time around."},
			'text', T{8371, --[[Scenario Mystery 9 text]] "Currently we are falling behind schedule at our Rubicon Station front - a deep-space shipyard tasked with expanding our space-faring capabilities - and would kindly request you to contribute Metals towards bringing the construction back on track.\n\nWe ran the numbers and have come to the conclusion that using Mars for firing raw materials towards our separate projects could prove far more effective than doing this from Earth and will speed up the whole process of bringing the project to fruition. \n\nA rocket to pick up the resources has been sent towards Mars. Every now and then more such rockets will arrive. If you have the materials to spare, please do!\n\n<effect>A rocket requesting supplies for the Rubicon Station megaproject is headed towards Mars."},
			'actor', "billionaire",
			'image', "UI/Messages/beyond_earth_mystery_03.tga",
			'choice1', T{8372, --[[Scenario Mystery 9 choice1]] "See what resources we can spare."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Trade Rockets",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "repeatable research available",
			'register', "_MysteryLog",
			'text', T{8373, --[[Scenario Mystery 9 text]] "Rede Goddenberry requests the export of materials for the construction a farm hub on Ganymede."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Init",
	}, {
		PlaceObj('SA_Exec', {
			'comment', "Moon Base project progress (0,100)",
			'expression', "_MoonBase = 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "Asteroid Base project progress (0,100)",
			'expression', "_AsteroidBase = 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "Rubicon Station project progress (0,100)",
			'expression', "_RubiconStation = 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "Ganymede Colony project progress (0,100)",
			'expression', "_GanymedeColony = 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "number of finished projects (determines victory)",
			'expression', "_VictoryPoints = 0",
		}),
		PlaceObj('SA_Exec', {
			'comment', "is the billionair alive; used in the time objective to detrmine type of victory",
			'expression', "_DeadBillionair = false",
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
		'name', "Tech Choice",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "MoonResearchReward = 10",
		}),
		PlaceObj('SA_Exec', {
			'expression', "AsteriodReserachReward = 5",
		}),
		PlaceObj('SA_Exec', {
			'expression', "RubiconResearchReward = 200 * 1000000",
		}),
		PlaceObj('SA_Exec', {
			'expression', "GanymedeResearchReward = 5",
		}),
		PlaceObj('SA_Exec', {
			'comment', "first time you always get the moon base",
			'expression', 'choice = "MoonBase"',
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_Exec', {
			'expression', "tech_id = false",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 22,
			'Form', "while-do",
			'end_block', 23,
			'expression', 'tech_id ~= "SolExploration"',
		}),
		PlaceObj('SA_WaitMsg', {
			'msg', "TechResearched",
			'register', "tech_id",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 23,
			'parent', 22,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 14,
			'end_block', 15,
			'expression', 'choice == "MoonBase"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_MoonBase = _MoonBase + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8553, --[[Scenario Mystery 9 text]] "Aldrin Base project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 15,
			'parent', 14,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 16,
			'end_block', 17,
			'expression', 'choice == "AsteroidBase"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_AsteroidBase  = _AsteroidBase + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8554, --[[Scenario Mystery 9 text]] "Port Vesta project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 17,
			'parent', 16,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 18,
			'end_block', 19,
			'expression', 'choice == "RubiconStation"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RubiconStation  = _RubiconStation + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8555, --[[Scenario Mystery 9 text]] "Rubicon Station project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 19,
			'parent', 18,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 20,
			'end_block', 21,
			'expression', 'choice == "GanymedeColony"',
		}),
		PlaceObj('SA_Exec', {
			'expression', "_GanymedeColony = _GanymedeColony + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8556, --[[Scenario Mystery 9 text]] "Spring City project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 21,
			'parent', 20,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 32,
			'end_block', 33,
			'expression', "_MoonBase < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8374, --[[Scenario Mystery 9 text]] "Aldrin Base (bonus: <MoonResearchReward> Scientist Applicants)"},
			'result', "MoonBase",
			'text_reg1', "MoonResearchReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 33,
			'parent', 32,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 34,
			'end_block', 35,
			'expression', "_AsteroidBase < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8375, --[[Scenario Mystery 9 text]] "Port Vesta (bonus: Reduced cost of Robotics Techs by <AsteriodReserachReward>%)"},
			'result', "AsteroidBase",
			'text_reg1', "AsteriodReserachReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 35,
			'parent', 34,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 36,
			'end_block', 37,
			'expression', "_RubiconStation < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8376, --[[Scenario Mystery 9 text]] "Rubicon Station (bonus: <funding(RubiconResearchReward)> Funding)"},
			'result', "RubiconStation",
			'text_reg1', "RubiconResearchReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 37,
			'parent', 36,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 38,
			'end_block', 39,
			'expression', "_GanymedeColony < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8377, --[[Scenario Mystery 9 text]] "Spring City (bonus: <GanymedeResearchReward> Botanist & <GanymedeResearchReward> Geologist Applicants)"},
			'result', "GanymedeColony",
			'text_reg1', "GanymedeResearchReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 39,
			'parent', 38,
		}),
		PlaceObj('SA_WaitChoiceEntries', {
			'title', T{8378, --[[Scenario Mystery 9 title]] "Beyond Earth: Choose Research Focus"},
			'voiced_text', T{8379, --[[voice:narrator]] "Our contributions towards the Beyond Earth project have been received and we have Rede Goddenberry’s everlasting thanks – on behalf of humanity’s future."},
			'text', T{8380, --[[Scenario Mystery 9 text]] "We are given a choice to contribute research to a project of our liking next, partially advancing progress on any of the following:\n\nAldrin Base - a settlement on the Moon to mine the Lunar soil for Hydrogen 3.\n\nPort Vesta - a mining hub situated in the Asteroid Belt.\n\nRubicon Station - a shipyard in deep space.\n\nAnd finally, Spring City - a farming hub on water-rich Ganymede."},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 24,
			'end_block', 25,
			'expression', 'choice == "MoonBase"',
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "MoonResearchReward",
			'Specialization', "scientist",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 25,
			'parent', 24,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 26,
			'end_block', 27,
			'expression', 'choice == "AsteroidBase"',
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Robotics",
			'Amount', 5,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 27,
			'parent', 26,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 28,
			'end_block', 29,
			'expression', 'choice == "RubiconStation"',
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "RubiconResearchReward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 29,
			'parent', 28,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 30,
			'end_block', 31,
			'expression', 'choice == "GanymedeColony"',
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "GanymedeResearchReward ",
			'Specialization', "geologist",
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "GanymedeResearchReward ",
			'Specialization', "botanist",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 31,
			'parent', 30,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Trade Rockets",
	}, {
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8381, --[[Scenario Mystery 9 description]] "This rocket is tasked with bringing construction materials for the completion of the Rubicon Station - a deep space shipyard."},
			'rocket_id', "RubiconRocket",
			'display_name', T{8382, --[[Scenario Mystery 9 display_name]] "Rubicon Station Trade Rocket"},
			'resource1', "Metals",
			'amount1', 200000,
			'travel_time_earth', 0,
			'fuel_amount', 60000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "RubiconRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RubiconStation  = _RubiconStation + 25",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8557, --[[Scenario Mystery 9 text]] "Rockets to supply resources to Beyond Earth projects begin arriving. Each will partially advance a specific project."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Repeat', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 29,
			'end_block', 30,
			'expression', "_MoonBase < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8383, --[[Scenario Mystery 9 text]] "Aldrin Base (requests: Advanced resources)"},
			'result', "MoonBase",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 30,
			'parent', 29,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 27,
			'end_block', 28,
			'expression', "_AsteroidBase < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8384, --[[Scenario Mystery 9 text]] "Port Vesta (requests: Electronics)"},
			'result', "AsteroidBase",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 28,
			'parent', 27,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 25,
			'end_block', 26,
			'expression', "_RubiconStation < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8385, --[[Scenario Mystery 9 text]] "Rubicon Station (requests: Metals)"},
			'result', "RubiconStation",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 26,
			'parent', 25,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 23,
			'end_block', 24,
			'expression', "_GanymedeColony < 100",
		}),
		PlaceObj('SA_AddChoiceEntry', {
			'text', T{8386, --[[Scenario Mystery 9 text]] "Spring City (requests: Polymers)"},
			'result', "GanymedeColony",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 24,
			'parent', 23,
		}),
		PlaceObj('SA_WaitChoiceEntries', {
			'title', T{8387, --[[Scenario Mystery 9 title]] "Beyond Earth: Choose Trade Rocket"},
			'voiced_text', T{8388, --[[voice:narrator]] "The Beyond Earth initiative needs more materials for the completion of its various projects."},
			'text', T{8389, --[[Scenario Mystery 9 text]] "We are being asked to pick a project we are willing to contribute resources to next. Each time we choose and send supplies towards a project it will advance a certain amount towards completion. The Beyond Earth projects are:\n\nAldrin Base - a Hydrogen 3 mining facility on the Moon tasked with powering up all of humanity’s activity in the entire Solar System.\n\nPort Vesta - a mining operation in the Asteroid Belt guaranteeing humanity never wages war over resources again.\n\nRubicon Station - a shipyard situated in deep space tasked with considerably expanding humanity's space fleet construction capabilities.\n\nSpring City - a farming settlement on Ganymede with the potential to feed humanity spread across an entire star system with capacity to spare."},
			'image', "UI/Messages/beyond_earth_mystery_03.tga",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 15,
			'end_block', 16,
			'expression', 'choice == "MoonBase"',
		}),
		PlaceObj('SA_CallTradeRocket', {
			'comment', "change the display name when we have fianl texts",
			'description', T{8390, --[[Scenario Mystery 9 description]] "This rocket is tasked with brining construction materials for the Hydrogen 3 mining base being built on the Moon - Aldrin Base."},
			'rocket_id', "MoonRocket",
			'display_name', T{8391, --[[Scenario Mystery 9 display_name]] "Aldrin Base Trade Rocket"},
			'resource1', "Polymers",
			'amount1', 30000,
			'resource2', "Electronics",
			'amount2', 30000,
			'resource3', "MachineParts",
			'amount3', 30000,
			'travel_time_earth', 0,
			'fuel_amount', 50000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "MoonRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_MoonBase = _MoonBase + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'text', T{8553, --[[Scenario Mystery 9 text]] "Aldrin Base project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 16,
			'parent', 15,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 17,
			'end_block', 18,
			'expression', 'choice == "AsteroidBase"',
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8392, --[[Scenario Mystery 9 description]] "This rocket is headed out for the Asteroid Belt to bring resources for the Port Vesta mining facility."},
			'rocket_id', "AsteroidRocket",
			'display_name', T{8393, --[[Scenario Mystery 9 display_name]] "Port Vesta Trade Rocket"},
			'resource1', "Electronics",
			'amount1', 80000,
			'travel_time_earth', 0,
			'fuel_amount', 80000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "AsteroidRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_AsteroidBase  = _AsteroidBase + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8554, --[[Scenario Mystery 9 text]] "Port Vesta project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 18,
			'parent', 17,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 19,
			'end_block', 20,
			'expression', 'choice == "RubiconStation"',
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8381, --[[Scenario Mystery 9 description]] "This rocket is tasked with bringing construction materials for the completion of the Rubicon Station - a deep space shipyard."},
			'rocket_id', "RubiconRocket",
			'display_name', T{8382, --[[Scenario Mystery 9 display_name]] "Rubicon Station Trade Rocket"},
			'resource1', "Metals",
			'amount1', 120000,
			'travel_time_earth', 0,
			'fuel_amount', 60000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "RubiconRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_RubiconStation  = _RubiconStation + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8555, --[[Scenario Mystery 9 text]] "Rubicon Station project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 20,
			'parent', 19,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 21,
			'end_block', 22,
			'expression', 'choice == "GanymedeColony"',
		}),
		PlaceObj('SA_CallTradeRocket', {
			'description', T{8394, --[[Scenario Mystery 9 description]] "This rocket is headed out for Jupiter's largest moon - Ganymede - where a project to create the breadbasket of humanity is under way."},
			'rocket_id', "GanymedeRocket",
			'display_name', T{8395, --[[Scenario Mystery 9 display_name]] "Spring City Trade Rocket"},
			'resource1', "Polymers",
			'amount1', 80000,
			'travel_time_earth', 0,
			'fuel_amount', 150000,
		}),
		PlaceObj('SA_WaitTradeRocket', {
			'rocket_id', "GanymedeRocket",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_GanymedeColony = _GanymedeColony + 25",
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "Mystery9ProjectProgress",
			'text', T{8556, --[[Scenario Mystery 9 text]] "Spring City project has advanced"},
		}),
		PlaceObj('SA_Block', {
			'sa_id', 22,
			'parent', 21,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Project - Moon Base",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_MoonBase >=  100",
			'duration', 5012,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Sabotage",
		}),
		PlaceObj('SA_Exec', {
			'expression', "Reward = 25",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "to avoid 2 popups at the same time",
			'duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8396, --[[Scenario Mystery 9 title]] "Beyond Earth: Aldrin Base Operational"},
			'voiced_text', T{8397, --[[voice:narrator]] "Aldrin Base has been completed! The Hydrogen 3 mining facility is fully functional and has begun exporting energy to Earth. "},
			'text', T{8398, --[[Scenario Mystery 9 text]] "Earth celebrates a full independence of fossil fuel based energy sources and has a now virtually endless power supply coming from the Moon available for everyone. \n\nThe technologies needed to transit power to far off posts like our colony is still a ways off, but we are given schematics to improve on our Fusion Reactors, based on the perfected design used at the Aldrin Base.\n\nWe have helped bring humanity closer to Rede Goddenberry’s utopic vision.\n\n<effect>+<reg_param1>% Fusion Reactors Power production."},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'reg_param1', "Reward",
			'choice1', T{8399, --[[Scenario Mystery 9 choice1]] "Earth has changed forever."},
		}),
		PlaceObj('SA_LabelModifier', {
			'percent', 25,
			'property', "electricity_production",
			'target_label', "FusionReactor",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8400, --[[Scenario Mystery 9 text]] "The Moon Hydrogen 3 mining base - Aldrin Base - has been completed and Earth now enjoys limitless clean energy."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_VictoryPoints = _VictoryPoints + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Project - Asteroid Base",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_AsteroidBase >=  100",
			'duration', 5012,
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Solar Flare",
		}),
		PlaceObj('SA_Exec', {
			'expression', "Reward = 20",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "to avoid 2 popups at the same time",
			'duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8401, --[[Scenario Mystery 9 title]] "Beyond Earth: Port Vesta Complete"},
			'voiced_text', T{8402, --[[voice:narrator]] "An extraordinary feat has been completed – an unparalleled  milestone in humanity’s history!"},
			'text', T{8403, --[[Scenario Mystery 9 text]] "Port Vesta has begun operations.\n\nAt the heart of the Asteroid Belt, the mining base is predicted to end poverty on Earth and bring an abundance of materials for all needs far and wide across the Solar System. \n\nThe first shipments are already Earthbound, and while free and endless materials may await us in the future, for now we have been given the know-how to upgrade all of our extractors and make them more productive.\n\nThe megaproject envisioned by Rede Goddenberry has been completed.\n\n<effect>+<reg_param1>% Extractor production."},
			'image', "UI/Messages/beyond_earth_mystery_02.tga",
			'reg_param1', "Reward",
			'choice1', T{8404, --[[Scenario Mystery 9 choice1]] "Humanity is conquering the Solar System."},
		}),
		PlaceObj('SA_LabelModifier', {
			'percent', 20,
			'property', "production_per_day1",
			'target_label', "MetalsExtractor",
		}),
		PlaceObj('SA_LabelModifier', {
			'percent', 20,
			'property', "production_per_day1",
			'target_label', "PreciousMetalsExtractor",
		}),
		PlaceObj('SA_LabelModifier', {
			'percent', 20,
			'property', "production_per_day1",
			'target_label', "RegolithExtractor",
		}),
		PlaceObj('SA_LabelModifier', {
			'percent', 20,
			'property', "water_production",
			'target_label', "WaterExtractor",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8405, --[[Scenario Mystery 9 text]] "Port Vesta, a mining base situated in the Asteroid Belt has been completed, virtually ensuring an abundance of resources for all of humanity."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_VictoryPoints = _VictoryPoints + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Project - Rubicon Station",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_RubiconStation >=  100",
			'duration', 5012,
		}),
		PlaceObj('SA_Exec', {
			'expression', "Reward = 10",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "to avoid 2 popups at the same time",
			'duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8406, --[[Scenario Mystery 9 title]] "Beyond Earth: Rubicon Station Complete"},
			'voiced_text', T{8407, --[[voice:narrator]] "What was until recently pure science fiction has now become a reality. Rubicon Station has been built and is already receiving its first permanent residents."},
			'text', T{8408, --[[Scenario Mystery 9 text]] "A shipyard built in deep space, the Station is expected to grow humanity’s space faring capacity a thousandfold.\n\nThe unique location of the base is also perfect for fringe research purposes, boosting humanity’s understanding of the universe.\n\nThis project may have never been completed without our help and guidance.\n\nRede Goddenberry’s vision has become more real than ever.\n\n<effect>Reduced cost of Physics and Engineering Techs by <reg_param1>%."},
			'image', "UI/Messages/beyond_earth_mystery_03.tga",
			'reg_param1', "Reward",
			'choice1', T{8409, --[[Scenario Mystery 9 choice1]] "The Solar System just became a smaller place."},
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Physics",
			'Amount', 10,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Engineering",
			'Amount', 10,
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8410, --[[Scenario Mystery 9 text]] "Rubicon Station has been built. Space vessel construction will never be the same."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_VictoryPoints = _VictoryPoints + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Project - Ganymede Colony",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_GanymedeColony >=  100",
			'duration', 5012,
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "to avoid 2 popups at the same time",
			'duration', 60000,
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8411, --[[Scenario Mystery 9 title]] "Beyond Earth: Spring City Complete"},
			'voiced_text', T{8412, --[[voice:narrator]] "From the idealistic vision of one eccentric old billionaire, to a farm world meant to feed all of humanity’s current and possible future needs – Spring City has now begun food production."},
			'text', T{8413, --[[Scenario Mystery 9 text]] "Many heated regions on Earth where hunger and strife are rampant will now be saved.\n\nOur role in the realization of this project is far from overlooked and we have been sent new crops which are a extremely tough, healthy and nutritious to use on our own farms.\n\nThe Beyond Earth initiative brings humanity closer to a place where hunger and poverty will become nothing more than the woes of yesterday.\n\n<effect>New Ganymede Rice hydroponic crop available."},
			'image', "UI/Messages/beyond_earth_mystery_03.tga",
			'choice1', T{8414, --[[Scenario Mystery 9 choice1]] "Can't wait to see what this does for the salad quality down here!"},
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UnlockCrop("Mystery9_GanymedeRice")',
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8415, --[[Scenario Mystery 9 text]] "Spring City - the breadbasket project of humanity - has been completed."},
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_Exec', {
			'expression', "_VictoryPoints = _VictoryPoints + 1",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "VictoryCondition",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_VictoryPoints  >= 3",
			'duration', 5012,
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "cleanup",
			'sequence', "Project - Moon Base",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Asteroid Base",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Rubicon Station",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Ganymede Colony",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Timeout",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Tech Choice",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Trade Rockets",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Timeout",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UICity:ChangeTechRepeatable("SolExploration", false)',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UICity:DequeueResearch("SolExploration", "all")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "MoonRocket" or id == "AsteroidRocket" or id == "RubiconRocket" or id == "GanymedeRocket" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_WaitMarsTime', {
			'duration', 30000,
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'Form', "if-then-else",
			'end_block', 3,
			'else_block', 2,
			'expression', "_DeadBillionair",
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Grant Wonder Tech",
		}),
		PlaceObj('SA_WaitTime', nil),
		PlaceObj('SA_WaitMessage', {
			'title', T{8416, --[[Scenario Mystery 9 title]] "Beyond Earth: The Dream Lives On"},
			'voiced_text', T{8417, --[[voice:narrator]] "The Beyond Earth initiative has been deemed a success. Already the efforts of this massive endeavor are bearing fruit."},
			'text', T{8418, --[[Scenario Mystery 9 text]] "A time of change is befalling the human race – a time of unity and hope for a brighter future that most couldn’t have imagined just a short few years ago. \n\nA massive push - by thousands of people and the best that two worlds had to offer - has become a reality. Our role will never be forgotten and the everlasting gratitude of a space fearing humanity will always be a factor.\n\nAnd spearheading the whole affair - the vision of an eccentric old billionaire who did not live to see how this vision uplifted the entire human race to conquer the Solar System with no reasons for strife and competition. \n\nMay he rest in peace and forever be remembered a visionary of Mankind.\n\n<effect>Gained a new Technology, <em><reg_param1></em>."},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'reg_param1', "_grantedTech",
			'choice1', T{8419, --[[Scenario Mystery 9 choice1]] "Rede Goddenberry will never be forgotten."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8420, --[[Scenario Mystery 9 text]] "Although Rede Goddenberry did not live to see his vision become a reality, his legacy will forever live on for all of humanity to prosper from."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "latevictory")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
			'is_else', true,
		}),
		PlaceObj('SA_RunSequence', {
			'sequence', "Grant Wonder Tech",
		}),
		PlaceObj('SA_WaitTime', nil),
		PlaceObj('SA_WaitMessage', {
			'title', T{8421, --[[Scenario Mystery 9 title]] "Beyond Earth: In Time to Witness"},
			'voiced_text', T{8417, --[[voice:narrator]] "The Beyond Earth initiative has been deemed a success. Already the efforts of this massive endeavor are bearing fruit."},
			'text', T{8422, --[[Scenario Mystery 9 text]] "A time of change is befalling the human race - a time of unity and hope for a brighter future that most couldn’t have imagined just a short few years ago. \n\nA massive push - by thousands of people and the best that two worlds had to offer - has become a reality. Our role will never be forgotten and the everlasting gratitude of a space fearing humanity will always be a factor.\n\nAnd spearheading the whole affair, the vision of an eccentric old billionaire who wished to see the bright future of his kind before his passing.\n\nHistory will remember Rede Goddenbarry a visionary of Mankind.\n\n<effect>Gained a new Technology, <em><reg_param1></em>."},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'reg_param1', "_grantedTech",
			'choice1', T{8423, --[[Scenario Mystery 9 choice1]] "A new era for humanity has dawned!"},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8424, --[[Scenario Mystery 9 text]] "Rede Goddenberry's dream becomes reality with him still alive to witness it unfolding."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "earlyvictory")',
		}),
		PlaceObj('SA_Block', {
			'sa_id', 3,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Timeout",
	}, {
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 28800000,
			'rand_duration', 7200000,
		}),
		PlaceObj('SA_WaitMessage', {
			'comment', "timeout warrning I",
			'title', T{8425, --[[Scenario Mystery 9 title]] "Beyond Earth: Rede is Dying"},
			'voiced_text', T{8426, --[[voice:narrator]] "We have received grave news from Earth. It seems Rede Goddenberry has fallen ill and doesn’t have much time left."},
			'text', T{8427, --[[Scenario Mystery 9 text]] "The billionaire has sent a special request out to us:\n\n“It seems I can no longer hide the fact that I am and have been dying in these recent months. Although this may explain my push for haste in the completion of the Beyond Earth initiative to some, the reality is that it's badly needed with or without my condition in mind.\n\nPeople are suffering and dying on Earth - in war, from deceases, from malnutrition. All of this is not necessary and my vision will remedy all of it, once complete.\n\nSo I convey this message to you, whom I have come to see as my closest partners in this endeavor: Please redouble your efforts, for it would please a dying old man greatly to see the plan bearing fruit before his death. But if not to warm my old heart, do it because you believe in what the initiative represents as I know you do.“"},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'choice1', T{8428, --[[Scenario Mystery 9 choice1]] "I am at loss for words."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8558, --[[Scenario Mystery 9 text]] "Rede Goddenberry reveals he is ill and dying."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 7200000,
			'rand_duration', 7200000,
		}),
		PlaceObj('SA_WaitMessage', {
			'comment', "timeout warrning II",
			'preset', false,
			'title', T{8429, --[[Scenario Mystery 9 title]] "Beyond Earth: Rede Goddenberry has passed away"},
			'voiced_text', T{8430, --[[voice:narrator]] "Today we received news of Rede Goddenberry’s passing. We are all deeply saddened by this loss."},
			'text', T{8431, --[[Scenario Mystery 9 text]] "But we are still inspired by his vision - a vision where humanity travels free amidst the worlds of a unified Solar System. \n\nAlthough Goddenberry’s death will dissuade many of his current partners to see the completion of the Beyond Earth initiative, we just may bring the plan to full or at least partial realization before other parties quit their involvement."},
			'image', "UI/Messages/beyond_earth_mystery_02.tga",
			'choice1', T{8432, --[[Scenario Mystery 9 choice1]] "We must see this through!"},
		}),
		PlaceObj('SA_Exec', {
			'comment', "is the billionair alive; used in the time objective to detrmine type of victory",
			'expression', "_DeadBillionair = true",
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "creates and updates the log text",
			'register', "_MysteryLog",
			'text', T{8559, --[[Scenario Mystery 9 text]] "Rede Goddenberry passes away."},
		}),
		PlaceObj('SA_RunSequence', {
			'comment', "updates the mystery log notification",
			'sequence', "Update Mystery Log",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'comment', "time has run out",
			'wait_type', "Sols",
			'duration', 14400000,
			'rand_duration', 7200000,
		}),
		PlaceObj('SA_StopSequence', {
			'comment', "cleanup",
			'sequence', "Project - Moon Base",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Asteroid Base",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Rubicon Station",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Project - Ganymede Colony",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "VictoryCondition",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Tech Choice",
		}),
		PlaceObj('SA_StopSequence', {
			'sequence', "Trade Rockets",
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UICity:ChangeTechRepeatable("SolExploration", false)',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'UICity:DequeueResearch("SolExploration", "all")',
		}),
		PlaceObj('SA_Exec', {
			'expression', 'local rockets = table.copy(UICity.labels.TradeRocket or empty_table)\n\nfor _, rocket in ipairs(rockets) do\n  local id = rocket.custom_id\n  if id == "MoonRocket" or id == "AsteroidRocket" or id == "RubiconRocket" or id == "GanymedeRocket" then\n    rocket:LeaveForever()\n  end\nend',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8433, --[[Scenario Mystery 9 title]] "Beyond Earth: The Dream is Dead"},
			'voiced_text', T{8434, --[[voice:narrator]] "Following Rede Goddenberry’s death, all of his former partners from Beyond Earth have since abandoned the initiative."},
			'text', T{8435, --[[Scenario Mystery 9 text]] "We have failed to persuade them without the uniting effect of his utopic vision spearheaded by himself alone. \n\nThe different gains in space exploration and asteroid mining will not simply disappear but are being bought off and pushed towards partial completion by various Earth-based corporations that will exploit them for personal profit and show no signs of desire to contribute to what was Rede Goddenberry’s vision of a united humanity.\n\nIn the end, history will remember him as an old eccentric billionaire who tried to swim upstream for humanity’s sake but ended up solidifying the rule of massive corporations that are more interested in profits than in an idealistic future."},
			'image', "UI/Messages/beyond_earth_mystery_03.tga",
			'choice1', T{8436, --[[Scenario Mystery 9 choice1]] "We have failed everyone..."},
		}),
		PlaceObj('SA_AppendToLog', {
			'comment', "updates the log text",
			'register', "_MysteryLog",
			'text', T{8437, --[[Scenario Mystery 9 text]] "Rede Goddenberry's plan falls apart as previous partners leave the initiative after his passing."},
		}),
		PlaceObj('SA_CustomNotification', {
			'id', "MysteryLog",
			'popup_register', "_MysteryLog",
			'dismissable', "dismissable",
		}),
		PlaceObj('SA_Exec', {
			'comment', "for telemetry",
			'expression', 'Msg("MysteryEnd", "failed")',
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
	PlaceObj('ScenarioSequence', {
		'name', "Solar Flare",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_AsteroidBase  > 1",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
			'rand_duration', 4320000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "Chance = AsyncRand(100) + 1",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'end_block', 2,
			'expression', "Chance > 50",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8442, --[[Scenario Mystery 9 title]] "Beyond Earth: Disaster Strikes"},
			'voiced_text', T{8443, --[[voice:narrator]] "There was a terrible accident at the Port Vesta project site."},
			'text', T{8444, --[[Scenario Mystery 9 text]] "A strong solar flare erupted without a sufficient head warning. There are 23 confirmed casualties.\n\nThe solar flare erupted during a short window of vulnerability, when Port Vesta had no operational means of shielding against such an event. If it had happened just a bit later, the defenses would've been operational.\n\nSadly the damage is massive in scale. The project suffered a major setback."},
			'image', "UI/Messages/beyond_earth_mystery_02.tga",
			'choice1', T{8445, --[[Scenario Mystery 9 choice1]] "A tragedy indeed, but we will overcome this setback."},
		}),
		PlaceObj('SA_Exec', {
			'expression', "_AsteroidBase  = _AsteroidBase - 25",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Sabotage",
	}, {
		PlaceObj('SA_WaitExpression', {
			'expression', "_MoonBase > 1",
		}),
		PlaceObj('SA_WaitMarsTime', {
			'wait_type', "Sols",
			'duration', 3600000,
			'rand_duration', 4320000,
		}),
		PlaceObj('SA_Exec', {
			'expression', "Chance = AsyncRand(100) + 1",
		}),
		PlaceObj('SA_CheckExpression', {
			'sa_id', 1,
			'end_block', 2,
			'expression', "Chance > 50",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{8560, --[[Scenario Mystery 9 title]] "Beyond Earth: Sabotage"},
			'voiced_text', T{8561, --[[voice:narrator]] "News of sabotage at the Aldrin Base mining facility on the Moon has just been made public. Luckily, there are no fatalities."},
			'text', T{8562, --[[Scenario Mystery 9 text]] "The project has suffered a major setback. Below is Mr Goddenberry’s statement:\n\n“What the Beyond Earth initiative is striving to ultimately achieve is change - change that will make inter-human rivalry a thing of the past. \n\nAs with all change, there will be resistance. There are those who prosper from wars, from suffering. And they see a united humanity as a threat, for they will be left behind.\n\nTo them I have to say: the world is moving on. Try as you might, you have only slowed down an irreversible process.”"},
			'image', "UI/Messages/beyond_earth_mystery_01.tga",
			'choice1', T{8563, --[[Scenario Mystery 9 choice1]] "A setback. We will overcome it!"},
		}),
		PlaceObj('SA_Exec', {
			'expression', "_MoonBase = _MoonBase - 25",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		}),
	})