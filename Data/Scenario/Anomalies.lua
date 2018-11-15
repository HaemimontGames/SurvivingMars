-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Scenario', {
	'name', "Anomalies",
	'file_name', "Anomalies",
	'singleton', false,
}, {
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Sulphides",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7156, --[[voice:narrator]] "You’d think the Explorer had found buried treasure, the way our scientists were reacting. It was a sulfur-rich regolith!"},
			'text', T{5774, --[[Scenario Anomalies text]] "The Explorer vehicle gathered various soil samples from far and wide around the Anomaly site and fed us the data. For hours, the telemetry was filled with buzzing chatter as the scientists at Mission Control discussed the implications of the element and made inventive plans about the future. The time of the expedition was limited and we urged them to make a final decision."},
			'log_entry', true,
			'image', "UI/Messages/deposits.tga",
			'choice1', T{5775, --[[Scenario Anomalies choice1]] "Concentrate effort on gathering as many samples as possible. (<research(1000)>)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5777, --[[Scenario Anomalies choice2]] "Focus on geochemical analysis of the most Sulphide-rich samples. (Reduces the cost of Engineering techs by 10%)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_GrantResearchPts', nil),
		PlaceObj('SA_Block', {
			'sa_id', 2,
			'parent', 1,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 3,
			'end_block', 4,
			'value', 2,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Engineering",
			'Amount', 10,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Dust Devil",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7157, --[[voice:narrator]] "We’ve got bad news. The RC Explorer investigating the anomaly accidentally released a pocket of high-pressure gas."},
			'text', T{5779, --[[Scenario Anomalies text]] "The carbon dioxide erupted, damaging the rover and lifting tons of fine dust into the atmosphere, forming a Dust Devil. The Red Planet reminded us how dangerous an alien world could be.\n\n<effect>Expect fierce Dust Devils to form at the Anomaly location."},
			'log_entry', true,
			'image', "UI/Messages/dust_storm.tga",
		}),
		PlaceObj('SA_SpawnDustDevilAtAnomaly', {
			'period', 5000,
			'period_random', 15000,
			'probability', 50,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Curiosity",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7158, --[[voice:narrator]] "The readings told us it was a vein rich with ore, but the data turned out to be incorrect. Under those fine red sands lay the intact hull of a rover."},
			'text', T{5780, --[[Scenario Anomalies text]] "We immediately recognized it – Curiosity. A historic finding that stretched its hand in a welcoming gesture through the years back to the first missions on the Red Planet. It belonged in a museum, but on the other hand was an opportunity to gain more parts that we could rarely get our hands on. It was a tough decision."},
			'log_entry', true,
			'image', "UI/Messages/debris.tga",
			'choice1', T{5781, --[[Scenario Anomalies choice1]] "Send Curiosity back to Earth. (<funding(500000000)> Funding)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5783, --[[Scenario Anomalies choice2]] "Display it as a monument in the Colony. (Reduces the cost of Social techs by 10%)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "500000000",
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
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Social",
			'Amount', 10,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Chromium",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7159, --[[voice:narrator]] "Our initial spectrographic analysis confirmed it. Chromium. To find such a rich deposit of such a rare metal. Important was an understatement."},
			'text', T{5785, --[[Scenario Anomalies text]] "The geological team couldn't wait to get their hands on the samples, but this was going to prevent the engineering team from smelting the materials for their ceaseless operations. The experts at Mission Control argued for hours, but the course of action was clear."},
			'log_entry', true,
			'image', "UI/Messages/deposits_2.tga",
			'choice1', T{5786, --[[Scenario Anomalies choice1]] "Study the Chromium deposit. (Reduces the cost of Engineering techs by 10%)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5788, --[[Scenario Anomalies choice2]] "Exploit the deposit. (deep Rare Metals deposit)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Engineering",
			'Amount', 10,
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
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "PreciousMetals",
			'amount', 700000,
			'grade', "High",
			'depth_layer', 2,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Beryllium",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7160, --[[voice:narrator]] "Someone joked we found kryptonite. It was because of the greenish-yellow hue of the beryl crystals."},
			'text', T{5790, --[[Scenario Anomalies text]] "The contrast with the red Martian dust made them appear almost alien. Even if they wouldn't make any of the Colonists superhuman, they would surely give us almost supernatural powers!\n\nOur plans at Mission Control included the introduction of a long-term nuclear energy solution for the growing Colony, and the Beryllium that we would produce from these minerals would be an immense help in this difficult mission. We would encase the nuclear fuel rods of our nuclear reactors in Beryllium and make a good use of its incredible mechanical, chemical and nuclear properties.\n\n<effect>Reduces the cost of Physics techs by 10%."},
			'log_entry', true,
			'image', "UI/Messages/deposits_2.tga",
			'choice1', T{5791, --[[Scenario Anomalies choice1]] "Awesome!"},
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Physics",
			'Amount', 10,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Tellurium",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7161, --[[voice:narrator]] "The rover manipulators held the silver-white mineral up to the camera just as the chemical analysis came through. We’ve found Tellurium."},
			'text', T{5792, --[[Scenario Anomalies text]] "In a moment, the Chief Engineer at Mission Control was at the communications station, urging instructions to the RC Explorer on how to handle and analyze the discovery. It was amusing to watch the almost childlike excitement in the eyes of the expert.\n\nThis is a significant discovery because it allows us to overcome an old problem in metallurgy. Easily-machinable metals allow for economical manufacturing of components, but the factors that allow it usually lower their performance, and vice versa. Thus, engineers had always been challenged to find ways to balance the two factors. The addition of Tellurium to iron alloys allows them to perform better in both areas.\n\n<effect>Reduces the cost of Robotics techs by 10%."},
			'log_entry', true,
			'image', "UI/Messages/deposits_2.tga",
			'choice1', T{5793, --[[Scenario Anomalies choice1]] "Great news!"},
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Robotics",
			'Amount', 10,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Germanium",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7162, --[[voice:narrator]] "Get up close and personal with Mars and you’ll find it’s anything but barren. We found another treasure in the form of a small deposit of a Germanium-rich mineral."},
			'text', T{5794, --[[Scenario Anomalies text]] "The purity of the Germanium found in the vein is amazing, which our scientific team presumes is due to the millennia-long loss of volatiles in the Martian atmosphere.\n\nGermanium started out as the humble ekasilicon proposed by Mendeleev and for almost a century it was discerned as a useless metal, only for late 20th century discoveries to make it one of the cornerstones of modern electronics.\n\n<effect>Discovered Rare Metals deposit."},
			'log_entry', true,
			'image', "UI/Messages/deposits_2.tga",
		}),
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "PreciousMetals",
			'amount', 1000000,
			'grade', "Very High",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Magnesium Sulphates",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7163, --[[voice:narrator]] "The probe’s drill had hit one hundred meters before it detected a spike in temperature. The data tells us it was ignited Magnesium compounds."},
			'text', T{5795, --[[Scenario Anomalies text]] "We are still waiting for confirmation but the preliminary results are clear. There are signs of chemical burning, indicating a combustible material in contact with the probe. The mechanical friction of the drilling head must have ignited the magnesium. What a great discovery!\n\nScientists on Earth had long planned the creation of jet engines that could burn the carbon dioxide in the Martian atmosphere with the use of magnesium powder. With abundant amounts on site, the research teams could begin preliminary testing of a working prototype right away!\n\n<effect>Reduces the cost of Robotics techs by 10%."},
			'log_entry', true,
			'image', "UI/Messages/deposits.tga",
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Robotics",
			'Amount', 10,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Ice XV",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7164, --[[voice:narrator]] "Until today, the only place we’d thought you could find Ice XV outside of a lab was on an icy planet or a moon. And here we find it. On Mars."},
			'text', T{5796, --[[Scenario Anomalies text]] "Ice XV is a super-dense phase of water ice which is formed in extremely cold and extremely high-pressure environments. It turns out that the unique geological history of Mars allowed a small quantity of Ice XV to form under the crust.\n\nEven though we didn't confirm any substantial deposits of water, this discovery would cause uproar in the scientific communities and draw significant attention to our efforts on the Red Planet. Our sponsors immediately provided us with tools to discover more about the effects of Martian geology on the formation of underground ice.\n\n<effect>Gain <funding(500000000)> Funding."},
			'log_entry', true,
			'image', "UI/Messages/exploration_2.tga",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "500000000",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Underground Cavity",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7165, --[[voice:narrator]] "We’ve just confirmed the location of a metal-rich deposit. A drilling accident turned to our advantage."},
			'text', T{5797, --[[Scenario Anomalies text]] "We lost a drilling probe while trying to analyze this Anomaly. The signal was suddenly lost and we got the tingling feeling that we would get lucky with the second one. The operators were extra careful and the second insertion revealed a vast network of underground cavities beneath the hard rock plate. On top of that, we managed to get in contact with the first probe which had fallen through in another section of the crust faults. We used the two probes as triangulation points for telemetry and pinpointed the location of the deposit.\n\n<effect>Discovered a Metal deposit."},
			'log_entry', true,
			'image', "UI/Messages/exploration.tga",
		}),
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "Metals",
			'amount', 1000000,
			'grade', "Very High",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Static Dust Charge",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7166, --[[voice:narrator]] "The on-site data validates our predictive models of the electrically-charged dust devils."},
			'text', T{5798, --[[Scenario Anomalies text]] "Science is well aware of the causes of the massive Earth storms, monsoons and tornadoes and yet we never ceased to admire the primeval forces unleashed before our eyes. The same goes for Martian electrostatic dust storms. Our scientists already had a good working model on the behavior of these peculiar weather Anomalies on the Red Planet. Now we can refine this model even further. With the current expedition complete, we can confirm their theory, yet I doubt anyone would ever cease to revere the massive dust storms.\n\n<effect>Gain <research(2000)>"},
			'log_entry', true,
			'image', "UI/Messages/dust_storm.tga",
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Amount', 2000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Asteroid Impact Site",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7167, --[[voice:narrator]] "The Anomaly turned out to be one of the most well-preserved asteroid impacts in our area. No geologist could ever put a price on it."},
			'text', T{5799, --[[Scenario Anomalies text]] "Earth scientists had long wondered about the effect of ancient asteroid impacts on Martian climate and geology. Several missions had been sent to gather data about these primordial events but the landers failed, as if the Red Planet wanted to keep some of its secrets for itself. Generations had to pass until we managed to send a successful expedition to lift the shroud of mystery.\n\nWith the data we gathered from the site, our colleagues on Earth will have material for years of research. Maybe we would finally find out whether the Martian core was shut down or it died out on its own, and we would be able to predict the destiny of our home world.\n\n<effect>You gain <funding(800000000)> Funding\n<effect>You gain <research(3000)>"},
			'log_entry', true,
			'image', "UI/Messages/crater.tga",
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "800000000",
		}),
		PlaceObj('SA_GrantResearchPts', {
			'Amount', 3000,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Beagle 2 Found",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7168, --[[voice:narrator]] "We've just found Beagle 2. Or at least what’s left of it."},
			'text', T{5800, --[[Scenario Anomalies text]] "Over the years over two-thirds of the missions sent to Mars ended in disaster. The tragic course of events, attributed to bad luck, human error, or simply to the inevitability of shooting blind in the dark, had created a dark humor revolving around the Great Galactic Ghoul which feeds on exploration probes and the mystery of the Martian Triangle.\n\nOne of the best-equipped probe missions to Mars was Beagle 2, which failed dramatically in the last minutes before landing. Failed by the parachutes and the treacherous Martian atmosphere, the brave little probe crashed at fatally high speed against the red desert.\n\n<effect>Reduces the cost of Robotics techs by 10%."},
			'log_entry', true,
			'image', "UI/Messages/debris.tga",
			'choice1', T{5801, --[[Scenario Anomalies choice1]] "Begin analysis on the crash site."},
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Robotics",
			'Amount', 10,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Natural Gas Pocket",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7169, --[[voice:narrator]] "We’ve analyzed material from the Anomaly and it completely validates our hypothesis on abiogenic petroleum!"},
			'text', T{5802, --[[Scenario Anomalies text]] "The pocket of natural gas we discovered deep among the hydrocarbon rocks was nothing short of an evidence of petroleum formation. The geophysicists here, at Mission Control, stare at the research data in disbelief. Mars, even in its alien nature, has proven once more a teacher in the mysteries so well veiled on our home world.\n\nThis unique opportunity allows us to gaze into the past of Mars and gather knowledge which would take months to simulate inside a laboratory."},
			'log_entry', true,
			'image', "UI/Messages/deposits.tga",
			'choice1', T{5803, --[[Scenario Anomalies choice1]] "Conduct on-site volatiles experiments. (Reduce cost of Physics research by 10%)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5805, --[[Scenario Anomalies choice2]] "Conduct on-site polymerization experiments. (Reduce cost of Engineering research by 10%)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
			'choice3', T{5807, --[[Scenario Anomalies choice3]] "Sell the scientific data. (<funding(500000000)> Funding)"},
			'choice3_img', "UI/CommonNew/message_3.tga",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Physics",
			'Amount', 10,
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
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Engineering",
			'Amount', 10,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 5,
			'end_block', 6,
			'value', 3,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "500000000",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Radiation Pocket",
	}, {
		PlaceObj('SA_WaitChoice', {
			'title', T{5808, --[[Scenario Anomalies title]] "Uranium-Rich Hematite"},
			'voiced_text', T{7170, --[[voice:narrator]] "It’s not every day that we have the luxury to choose from what Mars has to offer."},
			'text', T{5809, --[[Scenario Anomalies text]] "The planet constantly reminds us of its old habit – to give with one hand and take with the other. The rover came across coffinite rocks rich in uranium, clustered on top of a rich hematite deposit. The mineral veins were positioned in such a manner inside the rock that we couldn't blast through without compromising some of them.\n\nWe faced a difficult decision, but at the end, it was a matter of simple pragmatics."},
			'log_entry', true,
			'image', "UI/Messages/deposits.tga",
			'choice1', T{5810, --[[Scenario Anomalies choice1]] "Exploit the Hematite vein. (rich Metals deposit)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5812, --[[Scenario Anomalies choice2]] "Exploit the Uranium vein. (Rare Metals deposit)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "Metals",
			'amount', 1024000,
			'grade', "Very High",
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
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "PreciousMetals",
			'amount', 300000,
			'grade', "Very High",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare Resource - Iridium",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7171, --[[voice:narrator]] "The analysis tells us that we’ve found Iridium-rich sulfides! That’s a real rarity on Earth!"},
			'text', T{5814, --[[Scenario Anomalies text]] "Mankind's ingenuity had found a myriad of applications for it. But we focused our plan on a much simpler, more vital role in our growing Colony – RTGs. Free energy for everyone!\n\n<effect>Reduces the cost of Physics techs by 10%."},
			'log_entry', true,
			'image', "UI/Messages/exploration_2.tga",
			'choice1', T{5815, --[[Scenario Anomalies choice1]] "Excellent!"},
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Physics",
			'Amount', 10,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Electromagnetic Concentration",
	}, {
		PlaceObj('SA_Exec', {
			'expression', 'rover:SetCommand("Malfunction")',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7172, --[[voice:narrator]] "The Rover went dark for five hours. When it rebooted, it confirmed it had come into contact with an unusually high-voltage electrical charge."},
			'text', T{5816, --[[Scenario Anomalies text]] "The red alert was sounded immediately after we lost contact with the RC Explorer vehicle. Five long hours of fear and desperation ended with the reinstating of data feed. A wave of relief passed through the crowd of scientists gathered at the control center. The telescopic drill used to probe the crust at the Anomaly site disturbed a layer of magnetite-rich rocks, the source of the electric charge. The rover is still functional but it would take time before its locomotion systems are fully restored. The operators turned the defeat into a victory, devoting the unexpected time window to studying the magnetic properties of the Martian crust.\n\n<effect>The RC Explorer has malfunctioned. It has to be repaired by Drones.\n<effect>50% cost reduction for the following technologies: Low-G Drive (faster Drones and Rovers), Autonomous Sensors (Sensor Towers require no Power or Maintenance).\n<effect> Gain <funding(200000000)> Funding."},
			'log_entry', true,
			'image', "UI/Messages/dust_storm.tga",
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Robotics",
			'Research', "LowGDrive",
			'Amount', 50,
		}),
		PlaceObj('SA_GrantTechBoost', {
			'Field', "Physics",
			'Research', "AutonomousSensors",
			'Amount', 50,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "200000000",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Phobos 2 Crash Site",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7173, --[[voice:narrator]] "We’ve just found the wreckage of Phobos-2! The old probe even had some new data for us to analyze."},
			'text', T{5817, --[[Scenario Anomalies text]] "On July 7th, 1988 the Soviet Union launched two Proton-K rockets carrying the Phobos-1 and Phobos-2 probes on a course to Mars. Of the two craft only Phobos-2 reached its final destination, but contact with it was lost just before it could deliver its precious payload.\n\nHumankind will be forever grateful for the information we salvaged from its computers.\n\n<effect>Locations of several Anomalies discovered.\n<hint> Check the map for the new locations."},
			'log_entry', true,
			'image', "UI/Messages/debris.tga",
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'check_dome', "outside",
			'use_random_pos', true,
			'sequence_list', "Anomalies",
			'sequence', "Ice XV",
			'revealed', true,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'check_dome', "outside",
			'use_random_pos', true,
			'sequence_list', "Anomalies",
			'sequence', "Underground Cavity",
			'revealed', true,
		}),
		PlaceObj('SA_SpawnAnomaly', {
			'check_dome', "outside",
			'use_random_pos', true,
			'sequence_list', "Anomalies",
			'sequence', "Rare Resource - Iridium",
			'revealed', true,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Crust Fault",
	}, {
		PlaceObj('SA_Exec', {
			'expression', 'rover:SetCommand("Malfunction")',
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7174, --[[voice:narrator]] "Our Explorer just got into a pretty serious accident. The good news is it’s still in one piece."},
			'text', T{5818, --[[Scenario Anomalies text]] "The vehicle stumbled upon a crust fault which could have lasted for a couple hundreds of years under the slow erosion of the planet. Disturbed by the mechanical motion of the scanning probes, the surface opened like a wound and swallowed the rover, luckily, only for a dozen of meters. The sturdy machine got out of the hole, but nevertheless it sustained heavy damage.\n\nMillions of years ago Mars had been shaken to its core by cataclysmic impact which sealed the fate of the planet. Since then Mars, like all giants, is dying, too slow for our mortal eyes to witness. Yet even today the death-throes of the Red Planet can be felt unmistakably.\n\n<effect>The RC Explorer has malfunctioned. It has to be repaired by Drones."},
			'log_entry', true,
			'image', "UI/Messages/malfunctioned_rover.tga",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Past Life on Mars",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "funding_reward = 500000000",
		}),
		PlaceObj('SA_Exec', {
			'expression', "applicants_reward = 50",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7175, --[[voice:narrator]] "We’ve found signs of native life!"},
			'text', T{5819, --[[Scenario Anomalies text]] "The sensor reading from the Anomaly site provided the answer to one of the biggest mysteries about Mars. The Explorer examined a mineral cluster and found the preserved remains of microscopic life forms. We've managed to confirm that the deposit originated on Mars and not on one of the many asteroids that pockmark the surface of the planet.\n\nThe team is ecstatic with the find. If there was past life on Mars, perhaps we are not alone in the universe!"},
			'log_entry', true,
			'image', "UI/Messages/exploration_3.tga",
			'choice1', T{5820, --[[Scenario Anomalies choice1]] "Publicize the find as a triumph of the Mars mission. (<funding(choice_param1)> Funding)"},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5822, --[[Scenario Anomalies choice2]] "Publicize the find as a triumph of humankind. (<choice_param2> Applicants)"},
			'choice2_img', "UI/CommonNew/message_2.tga",
			'choice_param1', "funding_reward",
			'choice_param2', "applicants_reward",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding_reward",
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
		PlaceObj('SA_AddApplicants', {
			'Number', "applicants_reward",
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Rare metals in meteor",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7176, --[[voice:narrator]] "We found some useful material in the debris from a small meteorite."},
			'text', T{5824, --[[Scenario Anomalies text]] "After minimal processing, the resources can be transported and put to good use for the benefit of the Colony.\n\n<effect> We discovered 30 Rare Metals at the Anomaly site."},
			'log_entry', true,
			'image', "UI/Messages/crater.tga",
			'choice1', T{5825, --[[Scenario Anomalies choice1]] "Every little bit helps."},
		}),
		PlaceObj('SA_Exec', {
			'expression', 'PlaceResourceStockpile_Delayed(anomaly_pos, "PreciousMetals", 30 * const.ResourceScale, 0, true)',
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Natural Beauty",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "applicants_reward = 50",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7177, --[[voice:narrator]] "We’ve discovered a magnificent vista at the site of the anomaly."},
			'text', T{5826, --[[Scenario Anomalies text]] "Even after watching the cold splendor of the Red Planet for so long, Mission Control was awestruck by the beautiful footage provided by our intrepid reconnaissance vehicle.\n\n<effect><reg_param1> new Applicants are available on Earth."},
			'log_entry', true,
			'image', "UI/Messages/exploration_3.tga",
			'reg_param1', "applicants_reward",
			'choice1', T{5827, --[[Scenario Anomalies choice1]] "Let's hope we never tire of this beauty!"},
		}),
		PlaceObj('SA_AddApplicants', {
			'Number', "50",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Scientific Find",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "funding_reward = 200000000",
		}),
		PlaceObj('SA_WaitChoice', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7178, --[[voice:narrator]] "We’ve collected valuable geographic data at the site of the Anomaly."},
			'text', T{5828, --[[Scenario Anomalies text]] "Analysis of the crust yielded rare insights on the geological history of Mars, especially about the ancient Theiikian period, in which volcanic activity released immense amounts of sulfur dioxide in the atmosphere. Several key hypotheses of the exo-geologists were confirmed by our findings.\n\nThe scientific community praised the findings, raising the status of our mission in the eyes of humanity. Our sponsor committed additional funds to the mission."},
			'log_entry', true,
			'image', "UI/Messages/exploration.tga",
			'choice1', T{5829, --[[Scenario Anomalies choice1]] "Get <funding(choice_param1)> Funding."},
			'choice1_img', "UI/CommonNew/message_1.tga",
			'choice2', T{5831, --[[Scenario Anomalies choice2]] "Get 2 Drone Hub Prefabs."},
			'choice2_img', "UI/CommonNew/message_2.tga",
			'choice3', T{5833, --[[Scenario Anomalies choice3]] "Get 4 Moisture Vaporator Prefabs."},
			'choice3_img', "UI/CommonNew/message_3.tga",
			'choice_param1', "funding_reward",
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 1,
			'end_block', 2,
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding_reward",
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
		PlaceObj('SA_ResuppyInventory', {
			'item1', "DroneHub",
			'amount1', 2,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 4,
			'parent', 3,
		}),
		PlaceObj('SA_WaitChoiceCheck', {
			'sa_id', 5,
			'end_block', 6,
			'value', 3,
		}),
		PlaceObj('SA_ResuppyInventory', {
			'item1', "MoistureVaporator",
			'amount1', 4,
		}),
		PlaceObj('SA_Block', {
			'sa_id', 6,
			'parent', 5,
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Atypic Debris",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7179, --[[voice:narrator]] "The odd composition of the debris collected from the anomaly site has proven to be an uncrackable riddle for our science team."},
			'text', T{5835, --[[Scenario Anomalies text]] "The experts all agree that the materials discovered at the Anomaly site could not originate on Mars, but they are also in agreement that they are not the remains of a meteorite or a contaminant introduced from our Rockets. For now it looks like the origin of the debris will remain a mystery.\n\nAs wise men throughout history said more than once: the more we know, the more we realize that we don't know.\n\n<effect> A Genius Applicant is available on Earth."},
			'log_entry', true,
			'image', "UI/Messages/debris.tga",
			'choice1', T{5836, --[[Scenario Anomalies choice1]] "Nothing like a good puzzle!"},
		}),
		PlaceObj('SA_AddApplicants', {
			'Trait', "Genius",
			'Specialization', "scientist",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Geological Composition",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7180, --[[voice:narrator]] "Though initially fruitless, we recalibrated the operating spectrum for our scans and voila!"},
			'text', T{5837, --[[Scenario Anomalies text]] "The unusual chemical composition of the regolith near the Anomaly site effectively shielded it from our data gathering. As we re-purposed and improved our scanning technology based on these new findings, we were rewarded with an unexpected surprise.\n\n<effect>Large Water deposit discovered."},
			'log_entry', true,
			'image', "UI/Messages/exploration_2.tga",
		}),
		PlaceObj('SA_SpawnDepositAtAnomaly', {
			'resource', "Water",
			'amount', 20000000,
			'grade', "Very High",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Stuning Vista",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7181, --[[voice:narrator]] "There were no secrets to find near the Anomaly site, just a scene of breathtaking beauty."},
			'text', T{5838, --[[Scenario Anomalies text]] "Such photo-ops have proven to be useful for the mission, inspiring people on Earth to believe that humanity should create its new home on the Red Planet.\n\n<effect> A Celebrity Applicant is available on Earth."},
			'log_entry', true,
			'image', "UI/Messages/exploration_3.tga",
		}),
		PlaceObj('SA_AddApplicants', {
			'Trait', "Celebrity",
		}),
		PlaceObj('SA_SpawnEffectDepositAtAnomaly', {
			'effect_type', "BeautyEffectDeposit",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Alien Artifact",
	}, {
		PlaceObj('SA_Exec', {
			'expression', "funding_reward = 400000000",
		}),
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7182, --[[voice:narrator]] "We discovered unusual crystals in the remains of a meteorite. The magnified images of their crystalline matrix were broadcast by every major news channel on Earth."},
			'text', T{5839, --[[Scenario Anomalies text]] 'One tabloid even claims that the crystal is in fact artificially created - some kind of artwork of a microscopic alien race.\n\n"The work resembles million tiny cylinders surrounded by flames. If you squint your eyes, the very static of the composition resembles a star map. The image is bordered by double rainbows while the work has an abstract feeling and a very dynamic structure."\n\nWhile all this unscientific sensationalism had outraged our experts, the publicity provided us with some unexpected benefits.\n\n<effect>You gain <funding(reg_param1)>.'},
			'log_entry', true,
			'image', "UI/Messages/crater.tga",
			'reg_param1', "funding_reward",
			'choice1', T{5840, --[[Scenario Anomalies choice1]] "I want to believe!"},
		}),
		PlaceObj('SA_ChangeFunding', {
			'funding', "funding_reward",
		}),
		}),
	PlaceObj('ScenarioSequence', {
		'name', "Nothing",
	}, {
		PlaceObj('SA_WaitMessage', {
			'title', T{5614, --[[Scenario Anomalies title]] "Anomaly Analyzed"},
			'voiced_text', T{7183, --[[voice:narrator]] "The Explorer made a thorough scan of the Anomaly site but couldn't find anything unusual."},
			'text', T{5841, --[[Scenario Anomalies text]] "Regrettably, it appears that the unusual readings were just a sensor glitch."},
			'log_entry', true,
			'image', "UI/Messages/exploration.tga",
			'choice1', T{5842, --[[Scenario Anomalies choice1]] "Or were they?"},
		}),
		}),
	})