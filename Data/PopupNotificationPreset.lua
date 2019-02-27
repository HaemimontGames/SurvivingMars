-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000100,
	choice1 = T(5685, --[[PopupNotificationPreset AnomalyAnalyzed choice1]] "Open Research Screen"),
	choice2 = T(1011, --[[PopupNotificationPreset AnomalyAnalyzed choice2]] "Close"),
	group = "Default",
	id = "AnomalyAnalyzed",
	image = "UI/Messages/exploration.tga",
	text = T(12125, --[[PopupNotificationPreset AnomalyAnalyzed text]] "Even the tiniest, simply-looking rock can contain the answers to mysteries which perplexed the human mind for generations. Sometimes it takes just a simple discovery to assure us of the vastness of the Universe, an encouragement to make us look beyond the boundaries of our existence and into the future.\n\n<effect> The following Techs have been revealed on the Research screen:\n<list_text>"),
	title = T(5683, --[[PopupNotificationPreset AnomalyAnalyzed title]] "New Techs Available for Research"),
	voiced_text = T(7073, --[[voice:narrator]] "There's more to the barren environs of the Red Planet than meets the eye - a veritable treasure trove of undiscovered knowledge and wonder… So long as you know where to look."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005300,
	group = "Default",
	id = "SuggestedBuildingConcreteExtractor",
	image = "UI/Messages/deposits.tga",
	text = T(7937, --[[PopupNotificationPreset SuggestedBuildingConcreteExtractor text]] "Many of the colony buildings require Concrete for their construction. Due to the heavy weight of the material continuous imports from Earth are not practical in the long run and we have to secure its production in the colony.\n\nConcrete extractors must be placed over or within proximity to sulfur-rich regolith deposits. Like many other colony buildings, concrete extractors will require Power and regular maintenance from Drones."),
	title = T(5518, --[[PopupNotificationPreset SuggestedBuildingConcreteExtractor title]] "Suggested Building: Concrete Extractor"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005305,
	group = "Default",
	id = "SuggestedShortcutBuildMenu",
	image = "UI/Messages/deposits.tga",
	text = T(152511844749, --[[PopupNotificationPreset SuggestedShortcutBuildMenu text]] "Commander, did you know that you can open the Build Menu with <right_click> or <em><ShortcutName('actionOpenBuildMenu', 'keyboard')></em>?\n\nThis is quicker and more efficient than using the HUD button."),
	title = T(445678751622, --[[PopupNotificationPreset SuggestedShortcutBuildMenu title]] "Opening the Build Menu"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005310,
	group = "Default",
	id = "SuggestedResupplyMission",
	image = "UI/Messages/deposits.tga",
	text = T(534811629364, --[[PopupNotificationPreset SuggestedResupplyMission text]] "Back on Earth, a dutiful team is standing by for our call. In mere hours they can prepare a new Rocket or Supply Pod and fill it with whatever resources we request, within the limits of the funding provided by our sponsor. Don’t hesitate to make the call and secure valuable resources which we still can’t produce ourselves, or we are deprived of on the surface of the Red Planet.\n\n<hint><if(gamepad)>You can open the Resupply screen from the <LT> menu and order a new Rocket or Supply Pod with resources, buildings and vehicles from Earth.</if><if(kbmouse)>You can open the Resupply screen from the <em>HUD button</em> and order a new Rocket or Supply Pod with resources, buildings and vehicles from Earth.</if>\n\n<hint>Resupply missions can be used as long as you have Funding to order a payload from Earth. Supply Pods cost extra, but Rockets will require refueling for the return trip."),
	title = T(430535344144, --[[PopupNotificationPreset SuggestedResupplyMission title]] "Resupply"),
	voiced_text = T(983388575800, --[[voice:narrator]] "Mission Control suggests that we order a Rocket or Supply Pod with valuable payload from Earth. We still need all the help we can get to survive the harsh environment of the Red Planet."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007300,
	choice1 = T(5755, --[[PopupNotificationPreset FirstDomeConstructed choice1]] "Continue playing"),
	group = "Default",
	id = "FirstDomeConstructed",
	image = "UI/Messages/dome.tga",
	log_entry = true,
	text = T(5754, --[[PopupNotificationPreset FirstDomeConstructed text]] "Sol <day> of our mission will be remembered. Our greatest project to date has been completed – the Dome is ready to harbor the first Colonists on Mars. We, the team at Mission Control, are honored to be among the ones chosen to mark the beginning of a new age.\n\nWe created a place for humanity to call home, a place which reminds us of Earth. The Dome seems so fragile, like a glittering snow globe resting among the red sands. This makes us wonder – will our future be just as fragile? Would we be able to leave our cradle and thrive on this cold, distant world?"),
	title = T(5753, --[[PopupNotificationPreset FirstDomeConstructed title]] "First Dome Constructed!"),
	voiced_text = T(7125, --[[voice:narrator]] "It's been a stellar day. Not just for the mission, but for humanity itself."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007900,
	choice1 = T(1138, --[[PopupNotificationPreset RocketCancelWarning choice1]] "Yes"),
	choice2 = T(4165, --[[PopupNotificationPreset RocketCancelWarning choice2]] "Back"),
	group = "Default",
	id = "RocketCancelWarning",
	image = "UI/Messages/rocket.tga",
	text = T(5761, --[[PopupNotificationPreset RocketCancelWarning text]] "Are you sure you want to cancel the Rocket’s launch order?"),
	title = T(7129, --[[PopupNotificationPreset RocketCancelWarning title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017700,
	choice1 = T(1011, --[[PopupNotificationPreset GameOver choice1]] "Close"),
	group = "Default",
	id = "GameOver",
	image = "UI/Messages/game_over.tga",
	start_minimized = false,
	text = T(5766, --[[PopupNotificationPreset GameOver text]] "Failure's just another step in the process. The only thing is to dust ourselves off and try again. And when the future generations return to Mars, our experience, our mistakes and achievements will help them succeed where we could not.\n\n<effect> All Founders have either died or left Mars. The Colony couldn't live up to the dream of human colonization. Game over. But don't give up!"),
	title = T(5765, --[[PopupNotificationPreset GameOver title]] "Game Over"),
	voiced_text = T(7154, --[[voice:narrator]] "Humanity had such high hopes and we failed them. We failed the Founders. But is this really the end?"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017800,
	choice1 = T(1011, --[[PopupNotificationPreset GameOver_PostFounder choice1]] "Close"),
	group = "Default",
	id = "GameOver_PostFounder",
	image = "UI/Messages/game_over.tga",
	start_minimized = false,
	text = T(8156, --[[PopupNotificationPreset GameOver_PostFounder text]] "Now, our goal as a species is to not despair. To not look away from the stars. The path has proven to be hard and rocky, but hardship had only made humans more determined – and that’s what defines us as a species! We are sure that one day people will walk the red sands and call Mars their home.\n\n<effect> All Colonists have either died or left Mars. Game over. But don't give up!"),
	title = T(5765, --[[PopupNotificationPreset GameOver_PostFounder title]] "Game Over"),
	voiced_text = T(8157, --[[voice:narrator]] "The Colony has failed. The lives and the dreams of our Colonists are lost, washed away by despair and grief."),
})

PlaceObj('PopupNotificationPreset', {
	group = "System",
	id = "NewFeatures",
	image = "UI/Messages/hints.tga",
	no_ccc_button = true,
	text = T(160485577816, --[[PopupNotificationPreset NewFeatures text]] "Free update (Gagarin)\n- <em>Supply Pods</em> - an alternative way to bring cargo from Earth. Pods arrive faster, but each can be used only once.\n- <em>Sponsor Goals</em> - pursue objectives set by your sponsor.\n- <em>Planetary View</em> - inspect anomalies and send expeditions to other locations on Mars.\n- <em>Events</em> - hundreds of story bits will shake up the daily routine in your Colony.\n\nSpace Race Expansion\n- <em>New Sponsors</em> - try new approaches to colonization with Japan and Brazil.\n- <em>Sponsor Buildings</em> - a new unique structure for each sponsor.\n- <em>Sponsor Vehicles</em> - a new unique Rover, Rocket or Pod for each sponsor.\n- <em>Rival Colonies</em> - trade, cooperate and compete with AI controlled colonies.\n- <em>New Decorations and Dome skins</em> - colonize Mars in style."),
	title = T(428742818526, --[[PopupNotificationPreset NewFeatures title]] "New Update"),
	voiced_text = T(562110201672, --[[voice:narrator]] "Surviving Mars has been recently updated. You can check the full patch notes online, but here are few highlights:"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006400,
	choice1 = T(7116, --[[PopupNotificationPreset ModsWarning choice1]] "OK"),
	choice2 = T(4165, --[[PopupNotificationPreset ModsWarning choice2]] "Back"),
	group = "System",
	id = "ModsWarning",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4164, --[[PopupNotificationPreset ModsWarning text]] "Mods are player created software packages that modify your game experience. USE THEM AT YOUR OWN RISK! We do not examine, monitor, support or guarantee this user created content. You should take all precautions you normally take regarding downloading files from the Internet before using mods."),
	title = T(7115, --[[PopupNotificationPreset ModsWarning title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006500,
	choice1 = T(1138, --[[PopupNotificationPreset SaveDeleteWarning choice1]] "Yes"),
	choice2 = T(1139, --[[PopupNotificationPreset SaveDeleteWarning choice2]] "No"),
	group = "System",
	id = "SaveDeleteWarning",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4189, --[[PopupNotificationPreset SaveDeleteWarning text]] "Are you sure you want to delete the savegame <savename>?"),
	title = T(7117, --[[PopupNotificationPreset SaveDeleteWarning title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006600,
	choice1 = T(1138, --[[PopupNotificationPreset SaveOverwriteWarning choice1]] "Yes"),
	choice2 = T(1139, --[[PopupNotificationPreset SaveOverwriteWarning choice2]] "No"),
	group = "System",
	id = "SaveOverwriteWarning",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4183, --[[PopupNotificationPreset SaveOverwriteWarning text]] "Are you sure you want to overwrite <savename>?"),
	title = T(7118, --[[PopupNotificationPreset SaveOverwriteWarning title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006700,
	choice1 = T(1000136, --[[PopupNotificationPreset SaveUnableToDelete choice1]] "OK"),
	group = "System",
	id = "SaveUnableToDelete",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(8049, --[[PopupNotificationPreset SaveUnableToDelete text]] "Unable to delete <name>."),
	title = T(7119, --[[PopupNotificationPreset SaveUnableToDelete title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006800,
	choice1 = T(1000136, --[[PopupNotificationPreset SaveUnableToLoad choice1]] "OK"),
	group = "System",
	id = "SaveUnableToLoad",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4187, --[[PopupNotificationPreset SaveUnableToLoad text]] "Could not load <name>."),
	title = T(7120, --[[PopupNotificationPreset SaveUnableToLoad title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006900,
	choice1 = T(1000136, --[[PopupNotificationPreset SaveDiskFull choice1]] "OK"),
	group = "System",
	id = "SaveDiskFull",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4184, --[[PopupNotificationPreset SaveDiskFull text]] "Not enough space to create savegame <savename>!"),
	title = T(7121, --[[PopupNotificationPreset SaveDiskFull title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007000,
	choice1 = T(1000136, --[[PopupNotificationPreset SaveUnknownError choice1]] "OK"),
	group = "System",
	id = "SaveUnknownError",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(5750, --[[PopupNotificationPreset SaveUnknownError text]] "Unidentified error while saving <savename>!"),
	title = T(7122, --[[PopupNotificationPreset SaveUnknownError title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007100,
	choice1 = T(1000136, --[[PopupNotificationPreset SaveFileCorrupted choice1]] "OK"),
	group = "System",
	id = "SaveFileCorrupted",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(4188, --[[PopupNotificationPreset SaveFileCorrupted text]] "The savegame is corrupted."),
	title = T(7123, --[[PopupNotificationPreset SaveFileCorrupted title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1008000,
	choice1 = T(1138, --[[PopupNotificationPreset ExitGame choice1]] "Yes"),
	choice2 = T(1139, --[[PopupNotificationPreset ExitGame choice2]] "No"),
	group = "System",
	id = "ExitGame",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	text = T(4168, --[[PopupNotificationPreset ExitGame text]] "Are you sure you want to exit the game?"),
	title = T(5762, --[[PopupNotificationPreset ExitGame title]] "Exit game"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009300,
	choice1 = T(1138, --[[PopupNotificationPreset ExitToMainMenu choice1]] "Yes"),
	choice2 = T(1139, --[[PopupNotificationPreset ExitToMainMenu choice2]] "No"),
	group = "System",
	id = "ExitToMainMenu",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	text = T(1141, --[[PopupNotificationPreset ExitToMainMenu text]] "Exit to the main menu?"),
	title = T(7130, --[[PopupNotificationPreset ExitToMainMenu title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017400,
	choice1 = T(7127, --[[PopupNotificationPreset AutosaveFailedNoSpace choice1]] "OK"),
	group = "System",
	id = "AutosaveFailedNoSpace",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(7765, --[[PopupNotificationPreset AutosaveFailedNoSpace text]] "There is not enough storage space. Delete old save data or disable Autosave from the Options menu."),
	title = T(7130, --[[PopupNotificationPreset AutosaveFailedNoSpace title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017500,
	choice1 = T(7127, --[[PopupNotificationPreset AutosaveFailedNoSpacePS4 choice1]] "OK"),
	group = "System",
	id = "AutosaveFailedNoSpacePS4",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(7766, --[[PopupNotificationPreset AutosaveFailedNoSpacePS4 text]] "The save data limit for this game was reached. Delete old save data or disable Autosave from the Options menu."),
	title = T(7130, --[[PopupNotificationPreset AutosaveFailedNoSpacePS4 title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017600,
	choice1 = T(7127, --[[PopupNotificationPreset AutosaveFailedGeneric choice1]] "OK"),
	group = "System",
	id = "AutosaveFailedGeneric",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(7881, --[[PopupNotificationPreset AutosaveFailedGeneric text]] "Autosave failed.<newline>Error code: <error_code>."),
	title = T(7130, --[[PopupNotificationPreset AutosaveFailedGeneric title]] "Warning"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017900,
	choice1 = T(1011, --[[PopupNotificationPreset WelcomeGameInfo choice1]] "Close"),
	group = "System",
	id = "WelcomeGameInfo",
	log_entry = true,
	no_ccc_button = true,
	start_minimized = false,
	text = T(5768, --[[PopupNotificationPreset WelcomeGameInfo text]] "Everyone at Mission Control is impatient to see the rocket touching down and unloading its precious cargo - our remotely controlled eyes and hands on the Red Planet - the drones and rovers. Our goal is to secure a foothold for humanity by building the first Martian Dome. This daunting endeavor will allow the brave pioneers - the Founders - to settle on Mars and prove that the colony is sustainable. But until then we have to make sure the colony has enough construction resources, Water, Oxygen and Power.\n\nMission Sponsor: <em><sponsor_name></em>\n\nCommander Profile: <em><commander_name></em>\n"),
	title = T(5767, --[[PopupNotificationPreset WelcomeGameInfo title]] "Welcome to Mars, Commander!"),
	voiced_text = T(7155, --[[voice:narrator]] "Welcome to Mars!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018000,
	choice1 = T(7828, --[[PopupNotificationPreset LegalAgreement choice1]] "Read the Terms of Use (opens a web browser)"),
	choice2 = T(7829, --[[PopupNotificationPreset LegalAgreement choice2]] "Read the Privacy Policy (opens a web browser)"),
	choice3 = T(7830, --[[PopupNotificationPreset LegalAgreement choice3]] "I agree to the Terms of Use and the Privacy Policy"),
	choice3_img = "UI/CommonNew/message_box_ok.tga",
	choice4 = T(7831, --[[PopupNotificationPreset LegalAgreement choice4]] "I do not agree to the Terms of Use and the Privacy Policy"),
	choice4_img = "UI/CommonNew/message_box_cancel.tga",
	group = "System",
	id = "LegalAgreement",
	image = "UI/Messages/marsgate_mystery_02.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(7827, --[[PopupNotificationPreset LegalAgreement text]] "Welcome to Surviving Mars!\n\nBefore you get started, please take a moment to read our Terms of Use and Privacy Policy."),
	title = T(7826, --[[PopupNotificationPreset LegalAgreement title]] "Legal Agreements"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000200,
	group = "Disaster",
	id = "Disaster_DustStorm",
	text = T(10477, --[[PopupNotificationPreset Disaster_DustStorm text]] "A Dust Storm is set to hit the colony soon. It will cause damage to Pipes and Cables and also will place a serious strain on all buildings – pushing them towards needing maintenance sooner than usual. \n\nStocking up on Power, Water and Oxygen in batteries and tanks is a wise precaution. Disabling non-vital buildings that consume these resources prior and during a Dust Storm will help get by on the available reserves. \n\nThe following buildings do not function during Dust Storms:\n- MOXIEs\n- Moisture Vaporators\n- Solar Panels outside Domes"),
	title = T(4250, --[[PopupNotificationPreset Disaster_DustStorm title]] "Dust Storm"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000300,
	group = "Disaster",
	id = "Disaster_MeteorStorm",
	text = T(10478, --[[PopupNotificationPreset Disaster_MeteorStorm text]] "The region is about to experience a Meteor Storm. Buildings directly hit by meteors will be in need of repairs in order to function again while Pipes and Cables will get destroyed. Rovers hit by meteors will also need repairs while Drones may become irreversibly damaged. \n\nMeteor Storms cannot be avoided but some good practices may minimize their damage potential, such as not clustering vital buildings next to each other, Pipe and Cable redundancy and researching the tech for MDS Lasers from the Physics field."),
	title = T(5620, --[[PopupNotificationPreset Disaster_MeteorStorm title]] "Meteor Storm"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000400,
	group = "Disaster",
	id = "Disaster_ColdWave",
	text = T(10479, --[[PopupNotificationPreset Disaster_ColdWave text]] "A Cold Wave is imminent. While most of our machinery is designed and able to function in such low temperatures, if a building outside stops working for more than a Sol, it will freeze and may not be repaired until after the Cold Wave has lifted.\n\nCold Waves put an extra strain on the electrical grid and buildings will consume more electricity. One way to negate the effects of a Cold Wave is to place Subsurface Heaters (researched from the Physics field) near vulnerable buildings.\n\nThe following buildings will freeze during a Cold Wave:\n- Water Tanks\n- Outside buildings that are not operational for more than a Sol"),
	title = T(4149, --[[PopupNotificationPreset Disaster_ColdWave title]] "Cold Wave"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000500,
	group = "Evaluation",
	id = "Evaluation_Colonist_Deaths",
	image = "UI/Messages/death.tga",
	text = T(7789, --[[PopupNotificationPreset Evaluation_Colonist_Deaths text]] "While the Applicants who came to Mars were aware of the many risks that would await them, the near-criminal neglect from our side is something different. We cannot keep this information from the public – and opinions are swaying in the direction that our Colony is a “death trap”.\n\nThis troublesome rumor deters many valuable candidates from coming to the new frontier – and these are people we desperately need to fulfill the great mission of colonizing Mars and bringing our vision of the future closer.\n\n<hint> Each time a Colonist dies from a non-natural death, <ApplicantsLostOnColonistDeath> Applicants leave the pool."),
	title = T(7788, --[[PopupNotificationPreset Evaluation_Colonist_Deaths title]] "A Mission In Jeopardy"),
	voiced_text = T(8124, --[[voice:narrator]] "The recent Colonist deaths are a worrisome trend which cannot be ignored!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000600,
	choice1 = T(7737, --[[PopupNotificationPreset Evaluation_Colonists_Beginning choice1]] "OK"),
	group = "Evaluation",
	id = "Evaluation_Colonists_Beginning",
	image = "UI/Messages/hints.tga",
	text = T(7736, --[[PopupNotificationPreset Evaluation_Colonists_Beginning text]] "The dwindling resources on our planet, overpopulation and environmental crisis, as well as the risk of a global-scale Armageddon create a powerful argument for anyone doubting the importance of our mission.\n\nIt is a well understood fact that it’s a matter of “when” not “if” for a major extinction event to happen. Having a self-sustaining population on a world other than Earth when the time comes should drastically increase humankind’s odds of survival.\n\n<goal><objective>"),
	title = T(7735, --[[PopupNotificationPreset Evaluation_Colonists_Beginning title]] "Mission Evaluation: The Exodus"),
	voiced_text = T(8125, --[[voice:narrator]] "Scientists and visionaries have promoted the idea of “Humanity as a multi-planetary species” as the only way to prevent a possible mass extinction."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000700,
	group = "Evaluation",
	id = "Evaluation_Colonist_Bad_Fail",
	image = "UI/Messages/debris.tga",
	text = T(7738, --[[PopupNotificationPreset Evaluation_Colonist_Bad_Fail text]] "But this failure shouldn't throw us into despair. We still have to strive to create a stable, self-sustaining foothold from which humanity would reach the stars and conquer them.\n\n<effect>Mission Evaluation objective failed - you have <count> Colonists out of <target> present on the planet. Final Score: <Score>."),
	title = T(7735, --[[PopupNotificationPreset Evaluation_Colonist_Bad_Fail title]] "Mission Evaluation: The Exodus"),
	voiced_text = T(8126, --[[voice:narrator]] "We have to admit that we failed to accomplish one of the main goals set before our mission. Sadly, we underestimated the difficulties of sustaining a large population on the Red Planet."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000800,
	group = "Evaluation",
	id = "Evaluation_Colonist_Good",
	image = "UI/Messages/colonists.tga",
	text = T(7739, --[[PopupNotificationPreset Evaluation_Colonist_Good text]] "Even that we didn't surpass the expectations, the stable trends of development of the colony are encouraging.\n\nOur achievement is still a tremendous success – we did something which no one imagined to be possible. The Colony would now be a symbol of hope and new beginning, a proof that humanity would persevere and live on regardless of the challenges we face.\n\n<effect> Mission Evaluation objective completed - you have <count> Colonists out of <target> present on the planet. Final Score: <Score>."),
	title = T(7735, --[[PopupNotificationPreset Evaluation_Colonist_Good title]] "Mission Evaluation: The Exodus"),
	voiced_text = T(8127, --[[voice:narrator]] "As the Evaluation Day dawns upon us we can clearly say that the mission to Mars was a success."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1000900,
	group = "Evaluation",
	id = "Evaluation_Colonist_Great",
	image = "UI/Messages/colonists.tga",
	text = T(7740, --[[PopupNotificationPreset Evaluation_Colonist_Great text]] "We managed not only to achieve our goals, but also to surpass all expectations as the size of our current Colony is far beyond the initial estimations. This day will be marked in human history by the importance of our accomplishment – we secured the future of humankind as interplanetary species. The Colony would now be a symbol of hope and new beginning, a proof that humanity would persevere and live on regardless of the challenges we face.\n\n<effect> Mission Evaluation objective completed - you have <count> Colonists out of <target> present on the planet. Final Score: <Score>."),
	title = T(7735, --[[PopupNotificationPreset Evaluation_Colonist_Great title]] "Mission Evaluation: The Exodus"),
	voiced_text = T(8128, --[[voice:narrator]] "Congratulations! Everyone at Mission Control rejoices as the Colony has been marked as “extremely successful” in the Evaluation Report."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001000,
	choice1 = T(7737, --[[PopupNotificationPreset Evaluation_Martianborn_Beginning choice1]] "OK"),
	group = "Evaluation",
	id = "Evaluation_Martianborn_Beginning",
	image = "UI/Messages/hints.tga",
	text = T(7742, --[[PopupNotificationPreset Evaluation_Martianborn_Beginning text]] "New horizons open new possibilities. Mars can be viewed as a blank canvas – a hostile, uncultivated place where humanity can start anew. A fresh start needs new people – people born on Mars, raised in a society where people cooperate and fight the odds instead of each other.\n\n<goal><objective>"),
	title = T(7741, --[[PopupNotificationPreset Evaluation_Martianborn_Beginning title]] "Mission Evaluation: A Fresh Start"),
	voiced_text = T(8129, --[[voice:narrator]] "Our civilization, in all its glory, still bears the mark of obsolete cultural and ideological beliefs, from times when people didn't know any better. If we remain ignorant of our own flaws we risk destroying the future for our children."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001100,
	group = "Evaluation",
	id = "Evaluation_Matianborn_BadFail",
	image = "UI/Messages/debris.tga",
	text = T(7743, --[[PopupNotificationPreset Evaluation_Matianborn_BadFail text]] "Martian birthrate trends are still susceptible to malicious undercurrents and the Colony depends largely on the arrival of Applicants from Earth.\n\nThe Sponsors are disappointed that their program goal - a new human civilization on Mars - can't be achieved yet. Probably it was too early to expect that humanity can beat the odds of survival on such a hostile world and reach the level of everyday comfort required to start thinking about children and the future. The burden to disprove the evil tongues who would say this is impossible now lies on our shoulders. There's still work to be done\n\n<effect>Mission Evaluation objective failed - you have <count> Martianborn Colonists out of <target> present in the Colony. Final Score: <Score>."),
	title = T(7741, --[[PopupNotificationPreset Evaluation_Matianborn_BadFail title]] "Mission Evaluation: A Fresh Start"),
	voiced_text = T(8130, --[[voice:narrator]] "The Mission Evaluation period is over and the progress we've made was marked as... sub-optimal, to say the least."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001200,
	group = "Evaluation",
	id = "Evaluation_Matianborn_Good",
	image = "UI/Messages/dome.tga",
	text = T(7744, --[[PopupNotificationPreset Evaluation_Matianborn_Good text]] "If we keep up the good work, in several generations the concept of the Martian civilization would exit the state of the hypothetical and become a reality.\n\n<effect> Mission Evaluation objective completed - you have <count> Colonists present on the planet out of the target <target>. Final Score: <Score>."),
	title = T(7741, --[[PopupNotificationPreset Evaluation_Matianborn_Good title]] "Mission Evaluation: A Fresh Start"),
	voiced_text = T(8131, --[[voice:narrator]] "The Mission Evaluation period is over and the results we have achieved are quite satisfactory."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001300,
	group = "Evaluation",
	id = "Evaluation_Matianborn_Great",
	image = "UI/Messages/dome.tga",
	text = T(7745, --[[PopupNotificationPreset Evaluation_Matianborn_Great text]] "The number of Colonists born on Mars have reached beyond the wildest expectations! This solid base would serve us to promote new values of the new society, to allow the culture of the Red Planet to flourish and develop independent of the bad influence of Earth.\n\nThe path ahead of us is rough and uncertain, but who knows, maybe one day the people on Earth would admire the achievements of the Martians in awe, learning from them.\n\n<effect> Mission Evaluation objective completed - you have <count> Martianborn Colonists present on the planet out of the target <target>. Final Score: <Score>."),
	title = T(7741, --[[PopupNotificationPreset Evaluation_Matianborn_Great title]] "Mission Evaluation: A Fresh Start"),
	voiced_text = T(8132, --[[voice:narrator]] "The Mission Evaluation period is over and it’s not wrong to say that we managed to outdo ourselves."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001400,
	choice1 = T(7737, --[[PopupNotificationPreset Evaluation_Tech_Beginning choice1]] "OK"),
	group = "Evaluation",
	id = "Evaluation_Tech_Beginning",
	image = "UI/Messages/hints.tga",
	text = T(7747, --[[PopupNotificationPreset Evaluation_Tech_Beginning text]] "A new era of scientific discovery is ahead of us and we are the ones who are blessed with the opportunity to be on Mars – a completely new territory where new scientific discoveries lie behind the corner. We’re talking about new ideas which would sweep the human minds and the market and give us a tremendous head start in the future.\n\nThe primary reason behind the creation of this Colony is scientific and this is what we’re expected to do – to push the boundaries of human knowledge!\n\n<goal><objective>"),
	title = T(7746, --[[PopupNotificationPreset Evaluation_Tech_Beginning title]] "Mission Evaluation: New Dawn"),
	voiced_text = T(8133, --[[voice:narrator]] "Humankind might be on the verge of a new Golden Age! And we have to be the ones who ride the crest of that wave!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001500,
	group = "Evaluation",
	id = "Evaluation_Tech_BadFail",
	image = "UI/Messages/debris.tga",
	text = T(7748, --[[PopupNotificationPreset Evaluation_Tech_BadFail text]] "The harsh conditions of Mars proved too overwhelming and the technological leap desired is very far off.\n\n<effect>Mission Evaluation objective failed - you have <count> researched Technologies out of <target>. Final Score: <Score>."),
	title = T(7746, --[[PopupNotificationPreset Evaluation_Tech_BadFail title]] "Mission Evaluation: New Dawn"),
	voiced_text = T(8134, --[[voice:narrator]] "At the end of the Mission Evaluation period we have to admit that the pursuit of technological progress on a hostile alien world is an unaccessible luxury, when we're preoccupied with short-term survival."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001600,
	group = "Evaluation",
	id = "Evaluation_Tech_Good",
	image = "UI/Messages/research.tga",
	text = T(7749, --[[PopupNotificationPreset Evaluation_Tech_Good text]] "The colony has proven its worth as a cradle of scientific thought and everyone is sure that the future is hiding more secrets to be uncovered and more mysteries solved.\n\n<effect> Mission Evaluation objective completed - you have <count> researched Technologies out of the target <target>. Final Score: <Score>."),
	title = T(7746, --[[PopupNotificationPreset Evaluation_Tech_Good title]] "Mission Evaluation: New Dawn"),
	voiced_text = T(8135, --[[voice:narrator]] "The Mission Evaluation period is over and the results of our efforts are visible – a steady track of technological milestones can be traced back to the moment the very first rocket landed on the Red Planet."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001700,
	group = "Evaluation",
	id = "Evaluation_Tech_Great",
	image = "UI/Messages/research.tga",
	text = T(7750, --[[PopupNotificationPreset Evaluation_Tech_Great text]] "What’s more important is that we demonstrated to the world that the future is really just behind the corner. Our brightest minds have become icons of prosperity and progress, paving the way for future generations to create a better tomorrow – on Mars, on Earth or any other place in the Universe!\n\n<effect> Mission Evaluation objective completed - you have <count> researched Technologies out of the target <target>! Final Score: <Score>."),
	title = T(7746, --[[PopupNotificationPreset Evaluation_Tech_Great title]] "Mission Evaluation: New Dawn"),
	voiced_text = T(8136, --[[voice:narrator]] "Our contribution towards the scientific advancement of humankind will be forever remembered. The Evaluation Day report shows accomplishments beyond even our wildest expectations."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001800,
	choice1 = T(7737, --[[PopupNotificationPreset Evaluation_Anomalies_Beginning choice1]] "OK"),
	group = "Evaluation",
	id = "Evaluation_Anomalies_Beginning",
	image = "UI/Messages/hints.tga",
	text = T(7752, --[[PopupNotificationPreset Evaluation_Anomalies_Beginning text]] "Our nature is one of discovery and novelty – our curiosity will never be satisfied. To this we owe much of our civilization’s prosperity and progress.\n\nExploring the mysteries beyond our world caters to the best in us and by capturing our collective imagination as a species, we bring the focus back to what we can accomplish together instead of bickering and fighting amongst each other.\n\n<goal><objective>"),
	title = T(7751, --[[PopupNotificationPreset Evaluation_Anomalies_Beginning title]] "Mission Evaluation: The Final Frontier"),
	voiced_text = T(8137, --[[voice:narrator]] "We are all descendants of those who dared to look beyond the nice, cozy valley they inhabited and enter a world full of mystery and wonder. "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1001900,
	group = "Evaluation",
	id = "Evaluation_Anomalies_BadFail",
	image = "UI/Messages/debris.tga",
	text = T(7753, --[[PopupNotificationPreset Evaluation_Anomalies_BadFail text]] "The planet turned out to be even more hostile and uninviting than we thought, thwarting any attempts to make a breakthrough in its exploration.\n\nIt seems that Mars will continue to be an uncharted territory for the next generations to explore. What matters now is to turn our failure into success by making sure that the Colony is a good starting point for these crews and expeditions that would set off into the red deserts to satisfy their wanderlust.\n\n<effect>Mission Evaluation objective failed – you have analyzed <count> Anomalies out of the target <target>. Final score: <Score>."),
	title = T(7751, --[[PopupNotificationPreset Evaluation_Anomalies_BadFail title]] "Mission Evaluation: The Final Frontier"),
	voiced_text = T(8138, --[[voice:narrator]] "The Mission Evaluation report confirms what we knew – the target goals were far off from the very beginning."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002000,
	group = "Evaluation",
	id = "Evaluation_Anomalies_Good",
	image = "UI/Messages/exploration.tga",
	text = T(7754, --[[PopupNotificationPreset Evaluation_Anomalies_Good text]] "We found unexpected treasures buried in the sand of Mars and they only fueled our growing interest to find out more.\n\nWhat’s more important is that the wave of inspiration has swept over Earth, sparking immense interest and the desire to work together towards a common goal.\n\n<effect>Mission Evaluation objective completed – you have analyzed <count> Anomalies out of the target <target>. Final score: <Score>."),
	title = T(7751, --[[PopupNotificationPreset Evaluation_Anomalies_Good title]] "Mission Evaluation: The Final Frontier"),
	voiced_text = T(8139, --[[voice:narrator]] "The final Mission Evaluation report concludes that the Colony has scored a significant progress in the exploration of the Red Planet."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002100,
	choice1 = T(6294, --[[PopupNotificationPreset LaunchIssue_MissionSuspended choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_MissionSuspended",
	image = "UI/Messages/rocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(8141, --[[PopupNotificationPreset LaunchIssue_MissionSuspended text]] "All resupply missions are temporarily suspended."),
	title = T(8140, --[[PopupNotificationPreset LaunchIssue_MissionSuspended title]] "Launch Issue: Suspended Missions"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002200,
	choice1 = T(6294, --[[PopupNotificationPreset LaunchIssue_DustStorm choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_DustStorm",
	image = "UI/Messages/dust_storm.tga",
	start_minimized = false,
	text = T(8143, --[[PopupNotificationPreset LaunchIssue_DustStorm text]] "Rockets cannot land or launch during Dust Storms. We will have to wait until the storm is over."),
	title = T(8142, --[[PopupNotificationPreset LaunchIssue_DustStorm title]] "Launch Issue: Dust Storm"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002300,
	choice1 = T(6294, --[[PopupNotificationPreset LaunchIssue_Fuel choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_Fuel",
	image = "UI/Messages/rocket.tga",
	start_minimized = false,
	text = T(8145, --[[PopupNotificationPreset LaunchIssue_Fuel text]] "This Rocket is not yet refueled for the return trip to Earth.<newline><newline>Fuel is produced in a Fuel Refinery building supplied with Water. It is then transported by Drones to the Rocket."),
	title = T(8144, --[[PopupNotificationPreset LaunchIssue_Fuel title]] "Launch Issue: Fuel"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002400,
	choice1 = T(6294, --[[PopupNotificationPreset LaunchIssue_NotLanded choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_NotLanded",
	image = "UI/Messages/rocket.tga",
	start_minimized = false,
	text = T(8766, --[[PopupNotificationPreset LaunchIssue_NotLanded text]] "The Rocket is not currently landed. It will have to land and refuel for re-launch."),
	title = T(8765, --[[PopupNotificationPreset LaunchIssue_NotLanded title]] "Launch Issue: Not Landed"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002500,
	group = "Launch Issues",
	id = "LaunchIssue_Cargo",
	image = "UI/Messages/rocket.tga",
	start_minimized = false,
	text = T(8147, --[[PopupNotificationPreset LaunchIssue_Cargo text]] "Not all resources from this Rocket have been unloaded yet. If the Rocket launches now, the remaining resources on board will be lost.<newline><newline>To complete the unloading process, make sure there is enough available storage space in the vicinity as well as operational Drones to transport the resources."),
	title = T(8146, --[[PopupNotificationPreset LaunchIssue_Cargo title]] "Launch Issue: Remaining Resources on Board"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002600,
	group = "Launch Issues",
	id = "LaunchIssue_Housing",
	image = "UI/Messages/rocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(8148, --[[PopupNotificationPreset LaunchIssue_Housing text]] "There are <em><number1></em> passengers on board but there's only space for <em><number2></em> new residents in the Colony."),
	title = T(648845139046, --[[PopupNotificationPreset LaunchIssue_Housing title]] "Launch Issue: Residential Space"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002700,
	choice1 = T(1000136, --[[PopupNotificationPreset LaunchIssue_Maintenance choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_Maintenance",
	image = "UI/Messages/rocket.tga",
	start_minimized = false,
	text = T(809411461416, --[[PopupNotificationPreset LaunchIssue_Maintenance text]] "The Rocket has malfunctioned and needs repairs."),
	title = T(623462076855, --[[PopupNotificationPreset LaunchIssue_Maintenance title]] "Launch Issue: Maintenance"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002800,
	choice1 = T(1000136, --[[PopupNotificationPreset LaunchIssue_Disabled choice1]] "OK"),
	group = "Launch Issues",
	id = "LaunchIssue_Disabled",
	image = "UI/Messages/rocket.tga",
	start_minimized = false,
	text = T(229343936631, --[[PopupNotificationPreset LaunchIssue_Disabled text]] "You can't launch this rocket currently."),
	title = T(622366848807, --[[PopupNotificationPreset LaunchIssue_Disabled title]] "Launch Issue: Launch Disabled"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1002900,
	group = "Launch Issues",
	id = "LaunchIssue_NoMatchingApplicants",
	image = "UI/Messages/rocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(11602, --[[PopupNotificationPreset LaunchIssue_NoMatchingApplicants text]] "No applicants match the selected filters"),
	title = T(11696, --[[PopupNotificationPreset LaunchIssue_NoMatchingApplicants title]] "Launch Issue: No Passengers"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003000,
	group = "Launch Issues",
	id = "LaunchIssue_NoPassengers",
	image = "UI/Messages/rocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(11695, --[[PopupNotificationPreset LaunchIssue_NoPassengers text]] "No applicants selected"),
	title = T(11696, --[[PopupNotificationPreset LaunchIssue_NoPassengers title]] "Launch Issue: No Passengers"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003400,
	choice1 = T(5688, --[[PopupNotificationPreset Mystery3_PierceTheShell choice1]] "That is most worrying"),
	group = "Mystery",
	id = "Mystery3_PierceTheShell",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5687, --[[PopupNotificationPreset Mystery3_PierceTheShell text]] "Whatever lies within the Sphere is pretty capable of harnessing any energy projected at it. Furthermore, the energy used by our instruments seems to have furthered its power-up process.\n\n<effect>The Sphere charges a bit"),
	title = T(5686, --[[PopupNotificationPreset Mystery3_PierceTheShell title]] "Spheres: The Trusty Screwdriver"),
	voiced_text = T(7074, --[[voice:narrator]] "Our attempts to penetrate the outer layer of the Sphere were unsuccessful, though they did yield some interesting results."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003500,
	choice1 = T(5691, --[[PopupNotificationPreset Mystery3_Communicate choice1]] "I kinda hope it stays quiet"),
	group = "Mystery",
	id = "Mystery3_Communicate",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5690, --[[PopupNotificationPreset Mystery3_Communicate text]] "So thorough is the absorption process that we fail to detect even the slightest reflected wave being thrown back at us. Aside from that the Sphere remains, unsurprisingly, quiet.\n\n<effect>The Sphere charges a bit"),
	title = T(5689, --[[PopupNotificationPreset Mystery3_Communicate title]] "Spheres: Metallic Silence"),
	voiced_text = T(7075, --[[voice:narrator]] "Our test results tell us the Sphere accumulates energy by absorbing radio waves,"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003600,
	choice1 = T(5694, --[[PopupNotificationPreset Mystery3_FeedPower choice1]] "Whose idea was this anyway?"),
	group = "Mystery",
	id = "Mystery3_FeedPower",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5693, --[[PopupNotificationPreset Mystery3_FeedPower text]] "While energy direction by itself is not something so unusual, utilizing it for a purpose implies intent or at least programming of some kind. Our current test-grade proof will most certainly help encourage our scientists currently tackling this mystery.\n \n<effect>The Sphere charges a bit"),
	title = T(5692, --[[PopupNotificationPreset Mystery3_FeedPower title]] "Spheres: Is it Alive?"),
	voiced_text = T(7076, --[[voice:narrator]] "Our running hypothesis seems to be correct. It’s releasing energy to charge faster. Maybe it’s alive?"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003700,
	choice1 = T(5697, --[[PopupNotificationPreset Mystery3_OnAnomalyScanned choice1]] "Keep me up to speed on any finds."),
	group = "Mystery",
	id = "Mystery3_OnAnomalyScanned",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5696, --[[PopupNotificationPreset Mystery3_OnAnomalyScanned text]] "Its surface is perfectly smooth and also seems to sport mirror-like features.\n\nThe way this sphere reflects its surroundings has struck our team as being especially odd. It reflects not what one would expect, and in some instances seems to entirely ignore the observer from the reflection.   \n\nThis has the potential to be something monumental. Further excavation is most definitely encouraged by everyone here at Mission Control.\n\n<effect> A half-buried sphere is revealed"),
	title = T(5695, --[[PopupNotificationPreset Mystery3_OnAnomalyScanned title]] "Spheres: A Buried Secret"),
	voiced_text = T(7077, --[[voice:narrator]] "A short dig following an off-the-charts reading revealed a metallic spheroid buried just beneath the surface."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003800,
	choice1 = T(5700, --[[PopupNotificationPreset Mystery3_FirstInteraction choice1]] "That’s some B-movie material right there."),
	group = "Mystery",
	id = "Mystery3_FirstInteraction",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5699, --[[PopupNotificationPreset Mystery3_FirstInteraction text]] "Our most sensitive instruments detect a very weak, yet constant low frequency vibration, giving the Sphere a sort of hum. At least no harmful particles are detected. \n\nWe will be waiting for further test results.\n\n<effect>The Sphere begins charging."),
	title = T(5698, --[[PopupNotificationPreset Mystery3_FirstInteraction title]] "Spheres: System Shock"),
	voiced_text = T(7078, --[[voice:narrator]] "We tried interacting with it, which triggered some sort of response. The Sphere isn’t dormant anymore."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1003900,
	choice1 = T(5703, --[[PopupNotificationPreset Mystery3_SphereLaunch choice1]] "The Sphere should be watched closely at all times!"),
	group = "Mystery",
	id = "Mystery3_SphereLaunch",
	image = "UI/Messages/sphere_mystery_01.tga",
	text = T(5702, --[[PopupNotificationPreset Mystery3_SphereLaunch text]] "Mission Control was struck speechless as the half excavated Sphere finished the job itself and un-burrowed fully on its own, then began moving - levitating with the aid of some propulsion method unknown to us. \n\nAround it, temperatures fell drastically, creating a cold area that moved around with it. Mission Control is scrambling to predict where it’s headed to and if this cold zone is a byproduct of its propulsion method. Or more like its function. \n\nThese are exciting times – scary, but exciting.\n\n<effect>The Sphere begins moving."),
	title = T(5701, --[[PopupNotificationPreset Mystery3_SphereLaunch title]] "Spheres: Hello, Goodbye"),
	voiced_text = T(7079, --[[voice:narrator]] "Definitive contact with an extraterrestrial being, for the first time in the history of mankind."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004000,
	choice1 = T(5706, --[[PopupNotificationPreset Mystery3_FirstCharge choice1]] "Son of a…"),
	group = "Mystery",
	id = "Mystery3_FirstCharge",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5705, --[[PopupNotificationPreset Mystery3_FirstCharge text]] "While we aren’t sure if the Sphere has any set destination it is hovering towards, we have enough evidence to say that a new process has been initiated by the Sphere. For what purpose, we cannot say as of now.\n\n<hint> The Sphere drains batteries and charges quicker."),
	title = T(5704, --[[PopupNotificationPreset Mystery3_FirstCharge title]] "Spheres: The Sphere is a Sucker!"),
	voiced_text = T(7080, --[[voice:narrator]] "It seems to be absorbing any sort of electrical current in close proximity. In other words, it’s feeding on our batteries."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004100,
	choice1 = T(5709, --[[PopupNotificationPreset Mystery3_FirstDamage choice1]] "The safety of our citizens is always a priority!"),
	group = "Mystery",
	id = "Mystery3_FirstDamage",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5708, --[[PopupNotificationPreset Mystery3_FirstDamage text]] "While it does not seem to be lethal in any moderate doses, any Colonist, subject to the Sphere’s influence, shows signs of deteriorating health and needs a solid few days at the Infirmary.\n\nOur researchers have several theories on what this phenomenon is and should we prioritize it, we may be able to come up with a way to protect our citizens from the harmful influence of any such Sphere. \n\n<effect> <em>Sphere Protection</em> research available."),
	title = T(5707, --[[PopupNotificationPreset Mystery3_FirstDamage title]] "Spheres: Bad Vibrations"),
	voiced_text = T(7081, --[[voice:narrator]] "The humming’s less than subtle now, with the added bonus that it’s clearly harming any Colonists that come too close."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005800,
	choice1 = T(5734, --[[PopupNotificationPreset Mystery3_FirstSplit choice1]] "Well, this can’t be good..."),
	group = "Mystery",
	id = "Mystery3_FirstSplit",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5733, --[[PopupNotificationPreset Mystery3_FirstSplit text]] "In a moment of pure awesomeness the Sphere split into two identical Spheres. The new objects have grown to the exact same size as the previous one.\n\nThe second Sphere is now entirely independent from the first, moving in a direction of its own choosing, yet the two Spheres are clearly interacting with each other at a distance. Their humming frequencies are changing simultaneously and the more they resonate, the more a slight ionization of the atmosphere around them becomes evident.\n\nAt the moment of the splitting a vast amount of data was gathered by our instruments, so we may have the means to dig deeper within this mystery. Until then we can only predict that some event will trigger when a certain resonance frequency has been reached by both Spheres.\n\n<effect>The Sphere divided into two separate Spheres."),
	title = T(5732, --[[PopupNotificationPreset Mystery3_FirstSplit title]] "Spheres: More to Come"),
	voiced_text = T(7109, --[[voice:narrator]] "The Mirror Sphere has Mission Control in total chaos. Though that’s expected given what we saw."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005900,
	choice1 = T(5737, --[[PopupNotificationPreset Mystery3_FirstCatch choice1]] "Aced it!"),
	group = "Mystery",
	id = "Mystery3_FirstCatch",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5736, --[[PopupNotificationPreset Mystery3_FirstCatch text]] "Apart from controlling where it goes and what damage it does, this is of little use to us at the moment as we can’t dismantle them or even hinder their function in any way. \n\nHowever, this is critical for closer observation and research.\n\n<effect> A Sphere is being held motionless."),
	title = T(5735, --[[PopupNotificationPreset Mystery3_FirstCatch title]] "Spheres: It Works!"),
	voiced_text = T(7110, --[[voice:narrator]] "Those decoy buildings worked just like we planned, much to the dismay of our hardworking engineers. We've captured our first Sphere!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006000,
	choice1 = T(5740, --[[PopupNotificationPreset Mystery3_FirstDeposit choice1]] "My thoughts exactly."),
	group = "Mystery",
	id = "Mystery3_FirstDeposit",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5739, --[[PopupNotificationPreset Mystery3_FirstDeposit text]] "The Sphere is converted back to its precious ingredients.\n\nOur scientists are quick to inform us that any Sphere free from our decoy buildings will roll back to its splitting phase and will most probably try to retrieve the critical amount needed for their collective purpose.\n\nWe feel we have gathered enough information from these Spheres. It’s been deemed that decomposing all the Spheres is our best road of action.\n\n<effect> A Sphere was converted into resources."),
	title = T(5738, --[[PopupNotificationPreset Mystery3_FirstDeposit title]] "Spheres: Choose Your Poison"),
	voiced_text = T(7111, --[[voice:narrator]] "Humanity applied its knowledge of an alien technology for the first time ever. And it was a complete success."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006100,
	choice1 = T(5743, --[[PopupNotificationPreset Mystery3_PowerDecoysTech choice1]] "Can’t decide if this is good news or bad."),
	group = "Mystery",
	id = "Mystery3_PowerDecoysTech",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5742, --[[PopupNotificationPreset Mystery3_PowerDecoysTech text]] "The new Sphere also exhibits the humming of the previous two and is also resonating with them and the atmosphere around it. We have adjusted the predicted trigger point of the unknown event, as now it is expected to come earlier due to the higher Sphere count.  \n\nThe good news is that the more there are, the more observation material is available for our scientists.\n\nWe should be able to paint a general picture of their purpose after investing some time to research them. \n\n<effect> <em>Purpose of the Spheres</em> research available."),
	title = T(5741, --[[PopupNotificationPreset Mystery3_PowerDecoysTech title]] "Spheres: 3 Up, More to Come"),
	voiced_text = T(7112, --[[voice:narrator]] "The Spheres just keep dividing. This level of technology… We can't even begin to comprehend it."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006200,
	choice1 = T(5746, --[[PopupNotificationPreset Mystery3_ColdWave choice1]] "This is now officially a fight for survival."),
	group = "Mystery",
	id = "Mystery3_ColdWave",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5745, --[[PopupNotificationPreset Mystery3_ColdWave text]] "What or who needs to lower the atmospheric temperature of contemporary Mars is beyond any of us – yet it is most evident that the Spheres are effective at what they are doing. \n\nIf we want to stop the change, we must find a breakthrough based on what we already know and learn how to control or cancel this process.\n\n<effect> A prolonged, extremely strong Cold Wave has begun.\n<effect> <em>Xeno-Terraforming</em> research available."),
	title = T(5744, --[[PopupNotificationPreset Mystery3_ColdWave title]] "Spheres: Climate Change "),
	voiced_text = T(7113, --[[voice:narrator]] "The Colony is expecting some sort of artificial cold wave. How’s that even possible?"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1006300,
	choice1 = T(5749, --[[PopupNotificationPreset Mystery3_Ending choice1]] "The end of an era."),
	group = "Mystery",
	id = "Mystery3_Ending",
	image = "UI/Messages/sphere_mystery_02.tga",
	text = T(5748, --[[PopupNotificationPreset Mystery3_Ending text]] "The Cold Wave that had gripped our Colony has finally been dispelled. Temperatures have returned to the normal, cruelly cold levels we are used to.\n\nOur scientists are confident that we have recorded and gathered all data necessary for making sense of this encounter in the coming decades. Also, they are confident that the Spheres themselves had overstayed their welcome. \n\nKeeping them around would have meant living with the ever-present danger of re-activating the endless Cold Wave once more, even if we had managed to find a way to halt it without destroying all the Spheres. \n\nAnd despite the risks, despite the purely pragmatic reasons for destroying all the Spheres, one can’t help but wonder how the generations to come will feel of this deed. Will we go down in history as cowards? Or maybe as too insensitive to the magnitude of the encounter, the very first non-man-made technology ever found?\n\nWhen our scientists give up on trying to determine the origin of these Spheres, will textbooks mention that because of the rash actions and fears of the few pioneers that lived on Mars at the time, the riddle will never be solved?\n\n<effect> No more Spheres are left.\n<effect> Cold Wave dispelled."),
	title = T(5747, --[[PopupNotificationPreset Mystery3_Ending title]] "Spheres: To Future Generations"),
	voiced_text = T(7114, --[[voice:narrator]] "We’ve dismantled the last Sphere, yet our unease with the alien technology still lingers."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007800,
	choice1 = T(1011, --[[PopupNotificationPreset MysteryLog choice1]] "Close"),
	group = "Mystery",
	id = "MysteryLog",
	image = "UI/Messages/space.tga",
	text = T(5760, --[[PopupNotificationPreset MysteryLog text]] "...."),
	title = T(5661, --[[PopupNotificationPreset MysteryLog title]] "Mystery Log"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004200,
	choice1 = T(7987, --[[PopupNotificationPreset FirstColonistDeath choice1]] "View."),
	choice2 = T(5712, --[[PopupNotificationPreset FirstColonistDeath choice2]] "Thank you, fellow Colonists."),
	group = "Colonist",
	id = "FirstColonistDeath",
	image = "UI/Messages/death.tga",
	text = T(5711, --[[PopupNotificationPreset FirstColonistDeath text]] "As difficult and painful as it is, we must accept that <ColonistName(colonist)> is dead. As friends, as a community, we express our sadness, we acknowledge our loss, acknowledge the great importance of <ColonistName(colonist)>’s life.\n\n<ColonistName(colonist)>’s life has been a journey towards a vision, a journey which brought us all towards the possibility of living on the Red Planet, one small step after at a time. <ColonistName(colonist)> didn’t try to make their mark in human history, for there is no room for attempts in success. <ColonistName(colonist)> knew what the calling of fate was, knew the risks and the opportunities and made the best of it, for the good of us all.\n\nWhat is it that takes a person through all of this is a question only we can answer. This is a question whose answer is the spirit of <ColonistName(colonist)>, and this is a legacy for us.\n\n<effect><ColonistName(colonist)> has died. Cause: <reason>\n<hint> Each time a Colonist dies from a non-natural death, two Applicants leave the pool"),
	title = T(5710, --[[PopupNotificationPreset FirstColonistDeath title]] "A Eulogy for an Everyday Hero"),
	voiced_text = T(7082, --[[voice:narrator]] "We gather here today to bid a final farewell to one of our finest."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004300,
	choice1 = T(7987, --[[PopupNotificationPreset FirstStatusEffect_StressedOut choice1]] "View."),
	choice2 = T(5715, --[[PopupNotificationPreset FirstStatusEffect_StressedOut choice2]] "Troubling."),
	group = "Colonist",
	id = "FirstStatusEffect_StressedOut",
	image = "UI/Messages/colonists.tga",
	text = T(5714, --[[PopupNotificationPreset FirstStatusEffect_StressedOut text]] "<ColonistName(colonist)>, as every other Colonist, went through psychological conditioning before arriving on Mars to guarantee their most basic ability to cope with the adverse environment. Indeed, the people live on a barren, dead-cold world with a toxic, almost non-existent atmosphere, protected only by a fragile-looking Dome and relying on machines to keep them alive.\n\nThe unparalleled everyday stress levels slowly drain the people of their resolve – thus even the slightest shock or frustration can send someone over the edge. On Earth entertainment and recreation are just for fun, but here they are a tool for basic survival.\n\n<hint> The Colonist <ColonistName(colonist)> has reached critically low Sanity. Provide operational Healthcare buildings in the Domes and avoid Heavy workload or Nighttime work to prevent this situation."),
	title = T(5713, --[[PopupNotificationPreset FirstStatusEffect_StressedOut title]] "Mental Breakdown"),
	voiced_text = T(7083, --[[voice:narrator]] "A Colonist just snapped!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004400,
	choice1 = T(7987, --[[PopupNotificationPreset FirstStatusEffect_Suffocating choice1]] "View."),
	choice2 = T(5715, --[[PopupNotificationPreset FirstStatusEffect_Suffocating choice2]] "Troubling."),
	group = "Colonist",
	id = "FirstStatusEffect_Suffocating",
	image = "UI/Messages/colonists.tga",
	text = T(5717, --[[PopupNotificationPreset FirstStatusEffect_Suffocating text]] "Our Domes are large enough to contain tons of breathable air, but when the systems fail to refresh the supply, the amount of carbon dioxide will steadily increase until the atmosphere becomes unbreathable.\n\n<hint> Colonists with the Suffocating status effect have no access to Oxygen and will die within a short time. Connect their Dome to operational MOXIEs and Oxygen Tanks or plant Oxygen-Producing Crops in Farms to supply them with Oxygen."),
	title = T(5716, --[[PopupNotificationPreset FirstStatusEffect_Suffocating title]] "Suffocation!"),
	voiced_text = T(7084, --[[voice:narrator]] "Our Colonists are suffocating! We only have a few hours to get them more Oxygen before they run out!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004500,
	choice1 = T(7987, --[[PopupNotificationPreset FirstStatusEffect_Dehydrated choice1]] "View."),
	choice2 = T(5720, --[[PopupNotificationPreset FirstStatusEffect_Dehydrated choice2]] "Oh my!"),
	group = "Colonist",
	id = "FirstStatusEffect_Dehydrated",
	image = "UI/Messages/colonists.tga",
	text = T(5719, --[[PopupNotificationPreset FirstStatusEffect_Dehydrated text]] "Water is the vital fluid which sustains all life. The human body requires a constant access to fresh, drinkable water and quickly deteriorates when none is present. Thus the extraction of Water is one of our utmost priorities.\n\n<hint> Colonists with the Dehydrated status effect have no access to Water and will die within a short time. Connect their Dome to operational Water Producers or filled Water Towers to supply them with Water."),
	title = T(5718, --[[PopupNotificationPreset FirstStatusEffect_Dehydrated title]] "Dehydration!"),
	voiced_text = T(7085, --[[voice:narrator]] "The Colonists are on the brink of dehydration! We need to figure out something quick before they die."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004600,
	choice1 = T(7987, --[[PopupNotificationPreset FirstStatusEffect_Freezing choice1]] "View."),
	choice2 = T(5715, --[[PopupNotificationPreset FirstStatusEffect_Freezing choice2]] "Troubling."),
	group = "Colonist",
	id = "FirstStatusEffect_Freezing",
	image = "UI/Messages/colonists.tga",
	text = T(5722, --[[PopupNotificationPreset FirstStatusEffect_Freezing text]] "Domes feature heaters which maintain a pleasant temperature of 23 degrees Celsius around the clock, protecting against the fluctuating temperature of the fickle Martian atmosphere outside. The temperature inside the Dome quickly decreases when the power supply is cut and the Colonists sure do feel the effects. If the situation remains unchanged, I'm afraid that it could be fatal.\n\n<hint> Colonists with the Freezing status effect reside in a Dome with an insufficient supply of Power. Increase the amount of Power accessible to the Dome to prevent this."),
	title = T(5721, --[[PopupNotificationPreset FirstStatusEffect_Freezing title]] "Hypothermia!"),
	voiced_text = T(7086, --[[voice:narrator]] "Our Colonists are suffering from hypothermia!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004700,
	choice1 = T(7987, --[[PopupNotificationPreset FirstStatusEffect_Starving choice1]] "View."),
	choice2 = T(5715, --[[PopupNotificationPreset FirstStatusEffect_Starving choice2]] "Troubling."),
	group = "Colonist",
	id = "FirstStatusEffect_Starving",
	image = "UI/Messages/colonists.tga",
	text = T(5724, --[[PopupNotificationPreset FirstStatusEffect_Starving text]] "Constant supply of fresh nutrients is vital to the survival of the Colony. The Colonists can go on for some time before they suffer more adverse effects from the lack of food, but if you don't feed them soon, they will die.\n\n<hint> Colonists with the Starving status effect have no access to Food. Deliver Food from Earth or produce it by farming to supply the starving."),
	title = T(5723, --[[PopupNotificationPreset FirstStatusEffect_Starving title]] "Starvation!"),
	voiced_text = T(7087, --[[voice:narrator]] "Our Colonists are starving!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004800,
	choice1 = T(7987, --[[PopupNotificationPreset LastFounderDies choice1]] "View."),
	choice2 = T(5727, --[[PopupNotificationPreset LastFounderDies choice2]] "Rest in peace, friend."),
	group = "Colonist",
	id = "LastFounderDies",
	image = "UI/Messages/death.tga",
	text = T(5726, --[[PopupNotificationPreset LastFounderDies text]] "<ColonistName(colonist)> had a dream – to see humanity united, conquering the stars. And <ColonistName(colonist)> allowed nothing to stand in the path of this dream. No hardship, no loss, not even personal safety. What more can anyone be asked to do?\n\nWe had known many women and men of character, of strength and virtue. Any one of them might have stepped into <ColonistName(colonist)>'s place and we would be none the wiser. But we know why <ColonistName(colonist)> chose this path. When a heart as big and strong beats in one's chest it gives no other option but to follow its call.\n\nWhen <ColonistName(colonist)> fell, it left a void. Do not let it take over your hearts, friends. Do not mourn the icon of good that we have lost, rather rise up and become the icon yourself. Let this death be not a blow against the will of humanity to grow, learn and conquer new frontiers.\n\n<hint>The Founder <ColonistName(colonist)> died. Cause: <reason>."),
	title = T(5725, --[[PopupNotificationPreset LastFounderDies title]] "End of an Age"),
	voiced_text = T(7088, --[[voice:narrator]] "The day claimed our last living Founder, spelling the end of an era for us all."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1004900,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderDiesOfOldAge choice1]] "View."),
	choice2 = T(5727, --[[PopupNotificationPreset FirstFounderDiesOfOldAge choice2]] "Rest in peace, friend."),
	group = "Colonist",
	id = "FirstFounderDiesOfOldAge",
	image = "UI/Messages/death.tga",
	text = T(5729, --[[PopupNotificationPreset FirstFounderDiesOfOldAge text]] "We will all have our own special memories of the mark <ColonistName(colonist)> left in our hearts and in our lives. I am certain that <ColonistName(colonist)> would have wanted us all to be here today filled not with grief but with strength, vision and hope for the future. This is what <ColonistName(colonist)> lived for and doing otherwise would make this cause pointless.\n\nWe are all here today not only because <ColonistName(colonist)> laid down the foundations of our Colony. We were all personally touched and inspired by their strong character, personality and presence. We were all very lucky to have had <ColonistName(colonist)> beside us in both good and bad moments and, as much as will be missing our comrade, their memory will live on as long as we remain united.\n\n<hint>The Founder <ColonistName(colonist)> passed away due to old age."),
	title = T(5728, --[[PopupNotificationPreset FirstFounderDiesOfOldAge title]] "Do Not Go Gentle Into That Good Night"),
	voiced_text = T(7089, --[[voice:narrator]] "Today was a tough one. We lost one of our Founders."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005000,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderAlcoholic choice1]] "View."),
	choice2 = T(7093, --[[PopupNotificationPreset FirstFounderAlcoholic choice2]] "Alcohol is not the answer."),
	group = "Colonist",
	id = "FirstFounderAlcoholic",
	image = "UI/Messages/colonists.tga",
	text = T(7091, --[[PopupNotificationPreset FirstFounderAlcoholic text]] "Despite the great lengths we go through to make it seem safe and as close as possible to home, one’s mind is never too far from the dangers that the privilege of being an interplanetary pioneer carries. We all find our own ways to cope with this pressure.  <ColonistName(colonist)> finds it in the bottle.\n\n<hint>The Founder <ColonistName(colonist)> has the <em>Alcoholic</em> Trait."),
	title = T(7090, --[[PopupNotificationPreset FirstFounderAlcoholic title]] "Nobody Knows The Trouble I've Seen..."),
	voiced_text = T(7092, --[[voice:narrator]] "It's a rough life here on Mars. You can't prepare for addiction."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005100,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderWhiner choice1]] "View."),
	choice2 = T(7445, --[[PopupNotificationPreset FirstFounderWhiner choice2]] "Oh boy..."),
	group = "Colonist",
	id = "FirstFounderWhiner",
	image = "UI/Messages/colonists.tga",
	text = T(7443, --[[PopupNotificationPreset FirstFounderWhiner text]] "For they are meant to tread and live where no man has ever lived before – in an environment not meant for man to live in to begin with. This is why it came as a shock to us all when <ColonistName(colonist)> turned out to be such a whiner!\n\n<hint>The Founder <ColonistName(colonist)> has the <em>Whiner</em> Trait. "),
	title = T(7442, --[[PopupNotificationPreset FirstFounderWhiner title]] "In Space, No One Can Hear you Whine"),
	voiced_text = T(7444, --[[voice:narrator]] "The Founders are supposed to be the pillars of the future Colony – destined to be remembered for generations."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005200,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderCoward choice1]] "View."),
	choice2 = T(7097, --[[PopupNotificationPreset FirstFounderCoward choice2]] "Courage is finite."),
	group = "Colonist",
	id = "FirstFounderCoward",
	image = "UI/Messages/colonists.tga",
	text = T(7095, --[[PopupNotificationPreset FirstFounderCoward text]] "They face uncertainty which no humans have faced before. <ColonistName(colonist)> on the other hand, albeit a pioneer, doesn’t seem especially brave and makes jumping in fright after seeing one’s own shadow look like a normal thing. \n\n<hint>The Founder <ColonistName(colonist)> has the <em>Coward</em> Trait."),
	title = T(7094, --[[PopupNotificationPreset FirstFounderCoward title]] "Courage Has Layers"),
	voiced_text = T(7096, --[[voice:narrator]] "It takes more than bravery to be a pioneer of the Martian frontier. Or at least it should."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005400,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderEnthusiast choice1]] "View."),
	choice2 = T(7101, --[[PopupNotificationPreset FirstFounderEnthusiast choice2]] "That's the spirit!"),
	group = "Colonist",
	id = "FirstFounderEnthusiast",
	image = "UI/Messages/colonists.tga",
	text = T(7099, --[[PopupNotificationPreset FirstFounderEnthusiast text]] "After all, purpose is the strongest long-term driver. Since arriving on Mars, <ColonistName(colonist)>'s enthusiasm has proven to be above average, even by Founder norms, and the prodigious productivity displayed can be boiled down to one simple explanation – <ColonistName(colonist)> really loves doing what <ColonistName(colonist)>‘s doing.\n\n<hint>The Founder <ColonistName(colonist)> has the <em>Enthusiast</em> trait."),
	title = T(7098, --[[PopupNotificationPreset FirstFounderEnthusiast title]] "When Life Gives You Lemons..."),
	voiced_text = T(7100, --[[voice:narrator]] "Building a new home on an alien world? That takes guts, to say the least."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005500,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderGambler choice1]] "View."),
	choice2 = T(7446, --[[PopupNotificationPreset FirstFounderGambler choice2]] "OK"),
	group = "Colonist",
	id = "FirstFounderGambler",
	image = "UI/Messages/colonists.tga",
	text = T(7103, --[[PopupNotificationPreset FirstFounderGambler text]] "They travel through 50 million miles to a rocky, inhospitable world and try to bend it to humanity's will. <ColonistName(colonist)> , on the other hand, seems to also be a gambler in the more traditional sense. \n\nWe must not judge. On the contrary, we must be supportive and help our dear comrade with whom we’ve traversed the void, spearheaded humanity’s expansion on other worlds, only to find that we are no safer from vices so Earthly, it’s as if we never left.\n\n<hint>The Founder <ColonistName(colonist)> has the <em>Gambler</em> trait."),
	title = T(7102, --[[PopupNotificationPreset FirstFounderGambler title]] "Gambling Midst The Stars "),
	voiced_text = T(7104, --[[voice:narrator]] "The first Colonists are all gamblers coming to Mars. It's the ultimate roll of the dice."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005600,
	choice1 = T(7987, --[[PopupNotificationPreset FirstFounderIdiot choice1]] "View."),
	choice2 = T(7447, --[[PopupNotificationPreset FirstFounderIdiot choice2]] "OK"),
	group = "Colonist",
	id = "FirstFounderIdiot",
	image = "UI/Messages/colonists.tga",
	text = T(7106, --[[PopupNotificationPreset FirstFounderIdiot text]] "Warning signs and instructions are, usually, enough to prevent most of them being done by most people. <ColonistName(colonist)> is not like most people and instructions and warnings seem to be of little to no use. \n\nWe, as a small community, have come to accept the obvious: \n\n<hint>The Founder <ColonistName(colonist)> has the <em>Idiot</em> trait."),
	title = T(7105, --[[PopupNotificationPreset FirstFounderIdiot title]] "Call It What You Will"),
	voiced_text = T(7107, --[[voice:narrator]] "Living in cramped quarters, tinkering with intricate machinery day-in, day-out. There's plenty of opportunities for slip-ups."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1005700,
	choice1 = T(7987, --[[PopupNotificationPreset LastFounderLeavingMars choice1]] "View."),
	choice2 = T(5731, --[[PopupNotificationPreset LastFounderLeavingMars choice2]] "Farewell, friend."),
	group = "Colonist",
	id = "LastFounderLeavingMars",
	image = "UI/Messages/colonists.tga",
	text = T(5730, --[[PopupNotificationPreset LastFounderLeavingMars text]] "The Founders had always been more than explorers and pioneers. They shared a vision of the future of the civilization on the Red Planet and worked ceaselessly towards their common goal.\n\nBut, as it often happens during the course of history the, societal standpoint changes. <ColonistName(colonist)> could not adapt to the changing times and decided to leave Mars. I know <ColonistName(colonist)> personally and I'm sure that this isn't caused by disappointment but instead is a rational decision. I remember one time when we talked about the future of the Colony and <ColonistName(colonist)>'s words: “We are the progenitors of the Colony but parents have to eventually step down and give way to their children.”\n\nAs I watch the rocket fly towards Earth I cannot force myself to think that <ColonistName(colonist)> is abandoning us. Something tells me that we will be in contact and will continue to receive wise council from our last Founder.\n\n<hint>The last Founder <ColonistName(colonist)> has left Mars."),
	title = T(5725, --[[PopupNotificationPreset LastFounderLeavingMars title]] "End of an Age"),
	voiced_text = T(7108, --[[voice:narrator]] "Mars has ways of crushing the hope out of our very best."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007200,
	choice1 = T(1011, --[[PopupNotificationPreset FirstPassengerRocket choice1]] "Close"),
	group = "Colonist",
	id = "FirstPassengerRocket",
	image = "UI/Messages/colony_founding.tga",
	text = T(5752, --[[PopupNotificationPreset FirstPassengerRocket text]] "The next 10 Sols will be full of difficulties and dangers, but also with great promises and opportunities. It is now to us to prove that Mars can be a doorway to greater riches and the future of the human civilization. Even the most epic adventures begin with a single step.\n\n<effect> Arrival of additional Colonists temporarily suspended until the Colony proves able to sustain human life. Your Founder Colonists must survive for 10 Sols before additional people can arrive.\n\n<hint> The Colony will be evaluated positively before the period ends in the event the first human is born on Mars. If you feel you are up to the challenge, try constructing a Medical Building and raising the Comfort of the Founders as much as possible with Service Buildings."),
	title = T(5751, --[[PopupNotificationPreset FirstPassengerRocket title]] "A New Beginning"),
	voiced_text = T(7124, --[[voice:narrator]] "Full of hope and determination, the first Founders have set foot on the Red Planet."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007400,
	choice1 = T(7127, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn choice1]] "OK"),
	group = "Colonist",
	id = "ColonyViabilityExit_MartianBorn",
	image = "UI/Messages/birth.tga",
	text = T(5757, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn text]] "The Colonists have always felt like a family. But what makes the family stronger and more united is the promise of new life and better future. We have truly been blessed with a rewarding responsibility – to carry the torch of hope.\n\nLet this blooming of life serve as a symbol for all humans. Mars is no longer a dead world.\n\n<effect> The Colony has been evaluated positively. Additional Colonists can be called from Earth."),
	title = T(5756, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn title]] "The Door towards the Stars"),
	voiced_text = T(7126, --[[voice:narrator]] "For the first time, a human has been born on Mars. It's truly a unique miracle."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007500,
	choice1 = T(6294, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn_LastArk choice1]] "OK"),
	group = "Colonist",
	id = "ColonyViabilityExit_MartianBorn_LastArk",
	image = "UI/Messages/birth.tga",
	text = T(8856, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn_LastArk text]] "The Colonists have always felt like a family. But what makes the family stronger and more united is the promise of new life and better future. We have truly been blessed with a rewarding responsibility – to carry the torch of hope.\n\nLet this blooming of life serve as a symbol for all humans. Mars is no longer a dead world.\n\n<effect> The Colony has been evaluated positively. You can't call anymore colonists from Earth due to the Last Ark game rule."),
	title = T(5756, --[[PopupNotificationPreset ColonyViabilityExit_MartianBorn_LastArk title]] "The Door towards the Stars"),
	voiced_text = T(7126, --[[voice:narrator]] "For the first time, a human has been born on Mars. It's truly a unique miracle."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007600,
	choice1 = T(5759, --[[PopupNotificationPreset ColonyViabilityExit_Delay choice1]] "Looks like we’ve got a serious adventure ahead of us!"),
	group = "Colonist",
	id = "ColonyViabilityExit_Delay",
	image = "UI/Messages/hints.tga",
	text = T(5758, --[[PopupNotificationPreset ColonyViabilityExit_Delay text]] "The long-time dream of the human civilization as a whole – to settle another world – has come true. To be among the people who made this happen makes me feel enthusiastic and proud.\n\nWe are already swarmed with applications for relocation on Mars and the wanderlust and enthusiasm of these people makes me proud to be a human being. The Red Planet continues to be inhospitable and even dangerous but we as a species had always displayed the ability to adapt and improve – the adverse conditions will only make us try harder. So I say bring it on!\n\n<effect> The Colony has been evaluated positively. Additional Colonists can be called from Earth."),
	title = T(5756, --[[PopupNotificationPreset ColonyViabilityExit_Delay title]] "The Door towards the Stars"),
	voiced_text = T(7128, --[[voice:narrator]] "This will go down in history."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1007700,
	choice1 = T(5759, --[[PopupNotificationPreset ColonyViabilityExit_Delay_LastArk choice1]] "Looks like we’ve got a serious adventure ahead of us!"),
	group = "Colonist",
	id = "ColonyViabilityExit_Delay_LastArk",
	image = "UI/Messages/hints.tga",
	text = T(8857, --[[PopupNotificationPreset ColonyViabilityExit_Delay_LastArk text]] "The long-time dream of the human civilization as a whole – to settle another world – has come true. To be among the people who made this happen makes me feel enthusiastic and proud.\n\nWe are already swarmed with applications for relocation on Mars and the wanderlust and enthusiasm of these people makes me proud to be a human being. The Red Planet continues to be inhospitable and even dangerous but we as a species had always displayed the ability to adapt and improve – the adverse conditions will only make us try harder. So I say bring it on!\n\n<effect> The Colony has been evaluated positively. You can't call anymore colonists from Earth due to the Last Ark game rule."),
	title = T(5756, --[[PopupNotificationPreset ColonyViabilityExit_Delay_LastArk title]] "The Door towards the Stars"),
	voiced_text = T(7128, --[[voice:narrator]] "This will go down in history."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009400,
	group = "Tutorial",
	id = "Tutorial1_Popup1_Intro",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9229, --[[PopupNotificationPreset Tutorial1_Popup1_Intro text]] "In this training exercise you will learn how to gather basic resources from the Martian surface, how to construct a small base and how to refuel the Rocket in order to send it back to Earth.\n\nLet’s get started!\n\n<effect><TutorialDisabledAchievementsText()>"),
	title = T(9227, --[[PopupNotificationPreset Tutorial1_Popup1_Intro title]] "IMM Training Simulation"),
	voiced_text = T(7155, --[[voice:narrator]] "Welcome to Mars!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009500,
	group = "Tutorial",
	id = "Tutorial1_Popup2_ZoomAndCamera",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_ZoomAndCamera.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9231, --[[PopupNotificationPreset Tutorial1_Popup2_ZoomAndCamera text]] "<goal>Zoom in towards the suggested landing site."),
	title = T(5497, --[[PopupNotificationPreset Tutorial1_Popup2_ZoomAndCamera title]] "Camera Controls"),
	voiced_text = T(9230, --[[voice:narrator]] "You need to master the camera controls and familiarize yourself with the terrain around the prospective colony site."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009600,
	group = "Tutorial",
	id = "Tutorial1_Popup3_LandRocket",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_LandRocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9234, --[[PopupNotificationPreset Tutorial1_Popup3_LandRocket text]] "Proceed by selecting the pinned icon representing the Rocket that is currently in orbit around Mars.\n\n<goal>Land the Rocket on Mars."),
	title = T(9232, --[[PopupNotificationPreset Tutorial1_Popup3_LandRocket title]] "Landing the Rocket"),
	voiced_text = T(9233, --[[voice:narrator]] "Now it's time to land your first Rocket."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009700,
	group = "Tutorial",
	id = "Tutorial1_Popup4_DronesAndResources",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_DronesAndResources.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9237, --[[PopupNotificationPreset Tutorial1_Popup4_DronesAndResources text]] "It carries Drones - remotely controlled robots which constitute your construction and resources gathering workforce.\n\nGathering basic resources for building construction is one of the first things our Martian base needs. Place a Metals Depot so the Drones begin automatically bringing Metals from the scattered surface deposits nearby.\n\n<goal>Gather 5 Metals in a Metals Depot."),
	title = T(9235, --[[PopupNotificationPreset Tutorial1_Popup4_DronesAndResources title]] "Drones and Resources"),
	voiced_text = T(9236, --[[voice:narrator]] "...and we have touchdown! The Rocket has landed on Mars."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009800,
	group = "Tutorial",
	id = "Tutorial1_Popup5_UnloadRocket",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_UnloadRocket.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9240, --[[PopupNotificationPreset Tutorial1_Popup5_UnloadRocket text]] "<goal>Place a Universal Depot near your Rocket."),
	title = T(9238, --[[PopupNotificationPreset Tutorial1_Popup5_UnloadRocket title]] "Unloading the Payload"),
	voiced_text = T(9239, --[[voice:narrator]] "Our Rocket carries valuable resources that will be essential for the construction and maintenance of the Colony. Initially it's best to designate a Universal Depot, so the Drones have a place to store them."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1009900,
	group = "Tutorial",
	id = "Tutorial1_Popup6_ConcreteExtractor",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_ConcreteExtractor.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9242, --[[PopupNotificationPreset Tutorial1_Popup6_ConcreteExtractor text]] "The Concrete Extractor building must be placed over or within proximity of a Concrete deposit.\n\n<goal>From the build menu, select to build a Concrete Extractor and place it at the proposed location."),
	title = T(5032, --[[PopupNotificationPreset Tutorial1_Popup6_ConcreteExtractor title]] "Concrete Extractor"),
	voiced_text = T(9241, --[[voice:narrator]] "Along with Metals, Concrete is the other vital basic construction resource."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010000,
	group = "Tutorial",
	id = "Tutorial1_Popup7_DroneRange",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_DronesAndDroneHubs.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9245, --[[PopupNotificationPreset Tutorial1_Popup7_DroneRange text]] "Buildings are constructed by Drones. If you place a building outside the Drones' work range it won't be constructed. When placing buildings, make sure that those buildings are within range of drone controllers like the Rocket, Drone Hubs or RC Commanders.\n\nYou can select the Rocket to view its control radius."),
	title = T(9243, --[[PopupNotificationPreset Tutorial1_Popup7_DroneRange title]] "Drone Range"),
	voiced_text = T(9244, --[[voice:narrator]] "You are trying to place a construction outside of the work range of your Drones."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010100,
	group = "Tutorial",
	id = "Tutorial1_Popup8_Power",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_Power.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9247, --[[PopupNotificationPreset Tutorial1_Popup8_Power text]] "Stirling Generators are excellent power sources but they are too complex to be built on Mars during the early stages of our colonization effort. That is why we ship them from Earth partially assembled in prefabs. Prefabs do not require any resources, only drones to unpack and assemble them.\n\nWe've provided you with a Stirling Generator prefab.\n\n<goal>Construct a Stirling Generator and then connect it to the Concrete extractor with a Power Cable or place the Stirling Generator adjacent to the Concrete Extractor for a direct connection."),
	title = T(79, --[[PopupNotificationPreset Tutorial1_Popup8_Power title]] "Power"),
	voiced_text = T(9246, --[[voice:narrator]] "Like most buildings, the Concrete Extractor needs  power in order to operate. Having a reliable electrical grid and supply is essential for the success of the colony."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010200,
	group = "Tutorial",
	id = "Tutorial1_Popup9_WasteRockConcreteDepot",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_WasteRockConcreteDepot.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9250, --[[PopupNotificationPreset Tutorial1_Popup9_WasteRockConcreteDepot text]] "The amount of Waste Rock per resource extracted depends on the Grade of the resource deposit. You can select a resource deposit to view its Grade and the amount of resources remaining in it.\n\n<goal>Place a Dumping Site and a Concrete Depot to store the extracted Concrete."),
	title = T(9248, --[[PopupNotificationPreset Tutorial1_Popup9_WasteRockConcreteDepot title]] "Waste Rock and the Concrete Depot"),
	voiced_text = T(9249, --[[voice:narrator]] "Waste Rock is a byproduct of all extractors and is best stored at designated locations. This way you can ensure that it will not be in the way of future construction."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010300,
	group = "Tutorial",
	id = "Tutorial1_Popup10_DronesAndDroneHubs",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_DronesAndDroneHubs.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9253, --[[PopupNotificationPreset Tutorial1_Popup10_DronesAndDroneHubs text]] "Currently all Drones are assigned to the Rocket. When the Rocket is selected the work range of all Drones assigned to it will be visualized. If the Rocket takes off, however, all these Drones will need another controller.\n\n<goal>Build a Drone Hub and make sure it is supplied with power."),
	title = T(9251, --[[PopupNotificationPreset Tutorial1_Popup10_DronesAndDroneHubs title]] "Drones and Drone Hubs"),
	voiced_text = T(9252, --[[voice:narrator]] "Drones will pick pending tasks on their own within the range of the drone controllers they are assigned to."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010400,
	group = "Tutorial",
	id = "Tutorial1_Popup11_DroneBatteries",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_DronesRecharge.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9255, --[[PopupNotificationPreset Tutorial1_Popup11_DroneBatteries text]] "Every Drone Hub has two Recharge Stations built-in, but you might need additional ones as the Colony spreads out. Constructing Recharge Stations, especially along areas with heavy Drone activity, will prove vital for maintaining an efficient work force.\n\n<goal>Build a Recharge Station near the Concrete Extractor."),
	title = T(5541, --[[PopupNotificationPreset Tutorial1_Popup11_DroneBatteries title]] "Drone Batteries"),
	voiced_text = T(9254, --[[voice:narrator]] "Drones run on batteries that have to be recharged periodically."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010500,
	group = "Tutorial",
	id = "Tutorial1_Popup12_RefuelingRocket",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_Pipes.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9257, --[[PopupNotificationPreset Tutorial1_Popup12_RefuelingRocket text]] "Every Rocket has enough fuel for a one-way trip to Mars and has to be refueled on site, so it can return to Earth and be reused.\n \nFuel is produced in a Fuel Refinery. To setup the production chain, we will also need Water.\n\n<goal>Build a Moisture Vaporator and then a Fuel Refinery."),
	title = T(5503, --[[PopupNotificationPreset Tutorial1_Popup12_RefuelingRocket title]] "Refueling the Rocket"),
	voiced_text = T(9256, --[[voice:narrator]] "Maintaining a steady supply chain between Earth and Mars is essential, especially during the early colonization stages. "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010600,
	group = "Tutorial",
	id = "Tutorial1_Popup12_RefuelingRocket_1",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_DronesAndDroneHubs.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9260, --[[PopupNotificationPreset Tutorial1_Popup12_RefuelingRocket_1 text]] "Luckily, we have an extra Stirling Generator Prefab we could use.\n\n<goal>Build a new Stirling Generator along the power network."),
	title = T(9258, --[[PopupNotificationPreset Tutorial1_Popup12_RefuelingRocket_1 title]] "Insufficient Power"),
	voiced_text = T(9259, --[[voice:narrator]] "We don't have sufficient Power for all the buildings in the colony."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010700,
	group = "Tutorial",
	id = "Tutorial1_Popup13_Pipes",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_Pipes.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9262, --[[PopupNotificationPreset Tutorial1_Popup13_Pipes text]] "The Moisture Vaporator has to be connected with Pipes to the Fuel Refinery. \n\n<goal>Connect the Moisture Vaporator to the Fuel Refinery with Pipes."),
	title = T(882, --[[PopupNotificationPreset Tutorial1_Popup13_Pipes title]] "Pipes"),
	voiced_text = T(9261, --[[voice:narrator]] "A system of Pipes is used to deliver resources such as Water and Air where they are needed."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010800,
	group = "Tutorial",
	id = "Tutorial1_Popup14_Fuel",
	image = "UI/Messages/Tutorials/Tutorial1/Tutorial1_Fuel.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9264, --[[PopupNotificationPreset Tutorial1_Popup14_Fuel text]] "Use the Speed Controls to increase the game speed, so the Rocket refuels faster.\n\n<effect>For the purposes of this tutorial simulation the Rocket needs far less fuel (5) than it would during a normal playthrough (50).\n\n<goal>Refuel the Rocket."),
	title = T(4765, --[[PopupNotificationPreset Tutorial1_Popup14_Fuel title]] "Fuel"),
	voiced_text = T(9263, --[[voice:narrator]] "Fuel production is now underway and the Drones will begin to deliver the Fuel to the Rocket."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1010900,
	choice1 = T(9268, --[[PopupNotificationPreset Tutorial1_Popup15_Epilogue choice1]] 'Play Next Tutorial - "Rovers, Exploration & Research"'),
	choice2 = T(1010, --[[PopupNotificationPreset Tutorial1_Popup15_Epilogue choice2]] "Main Menu"),
	group = "Tutorial",
	id = "Tutorial1_Popup15_Epilogue",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9267, --[[PopupNotificationPreset Tutorial1_Popup15_Epilogue text]] "You've learned how to setup a basic outpost on Mars that can gather resources for further expansion and refuel Rockets. Using Rockets to bring in additional supplies from Earth is essential for a fledgling colony."),
	title = T(9265, --[[PopupNotificationPreset Tutorial1_Popup15_Epilogue title]] "Mission Complete!"),
	voiced_text = T(9266, --[[voice:narrator]] "Congratulations, you have finished the first tutorial!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011000,
	group = "Tutorial",
	id = "Tutorial2_Popup1_Intro",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9270, --[[PopupNotificationPreset Tutorial2_Popup1_Intro text]] "Rovers are vehicles with a variety of useful functions like transporting resources, commanding Drones and analyzing Anomalies. You have direct control over all Rovers in the colony.\n\n<goal>Select the RC Transport and move it to the designated area."),
	title = T(5438, --[[PopupNotificationPreset Tutorial2_Popup1_Intro title]] "Rovers"),
	voiced_text = T(9269, --[[voice:narrator]] "Welcome, Commander! In this training exercise you will get acquainted with one of your most valuable tools - Rovers."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011200,
	group = "Tutorial",
	id = "Tutorial2_Popup3_RCTransport",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_RCTransport.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9274, --[[PopupNotificationPreset Tutorial2_Popup3_RCTransport text]] "Use the RC Transport to load Fuel from the fuel depot in the base, then unload it close to the Rocket, so that its drones can load it into the rocket.\n\nDrones can also take resources directly from the RC Transport if they need them, however unloading the resources is quicker and will free up the RC Transport for other tasks.\n\n<goal>Load Fuel on to the RC Transport and unload it next to the Rocket."),
	title = T(1683, --[[PopupNotificationPreset Tutorial2_Popup3_RCTransport title]] "RC Transport"),
	voiced_text = T(9273, --[[voice:narrator]] "The RC Transport can load and carry resources around the map. Let's use it to refuel the nearby Rocket."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011300,
	group = "Tutorial",
	id = "Tutorial2_Popup4_OrphanedDrones",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_OrphanedDrones.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9276, --[[PopupNotificationPreset Tutorial2_Popup4_OrphanedDrones text]] "If Drones lose their controller they will look for new controllers nearby. However, when there are no controllers nearby you'll have to manually reassign them to a new controller.\n\nThe \"Reassign\" command also allows you to reassign Drones to understaffed controllers with heavy Drone load.\n\n<goal>Assign these Drones to the nearby Drone Hub."),
	title = T(5672, --[[PopupNotificationPreset Tutorial2_Popup4_OrphanedDrones title]] "Orphaned Drones"),
	voiced_text = T(9275, --[[voice:narrator]] "Some Drones are left without a controller after the Rocket launch."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011400,
	group = "Tutorial",
	id = "Tutorial2_Popup4_1_Gathering Metals",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_Gathering Metals.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9278, --[[PopupNotificationPreset Tutorial2_Popup4_1_Gathering Metals text]] "Send the RC Transport to gather some Metals from the deposit indicated by the arrow.\n\n<goal>Gather 5 Metals with the RC Transport."),
	title = T(9096, --[[PopupNotificationPreset Tutorial2_Popup4_1_Gathering Metals title]] "RC Transport - Gathering Metals"),
	voiced_text = T(9277, --[[voice:narrator]] "The RC Transport is able to gather resources directly from surface deposits without the help of Drones."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011500,
	group = "Tutorial",
	id = "Tutorial2_Popup5_TransporRoute",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_TransporRoute.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9280, --[[PopupNotificationPreset Tutorial2_Popup5_TransporRoute text]] 'We will need resources for the new base. The RC Transport can be ordered to transfer a large amount of resources in multiple goes via the "Create Transport Route" command.\n\n<goal>Set a transport route between the Universal Storage in the base and the marked location above the main base.'),
	title = T(9099, --[[PopupNotificationPreset Tutorial2_Popup5_TransporRoute title]] "RC Transport - Transport Routes"),
	voiced_text = T(9279, --[[voice:narrator]] "Let's set up a small expand some distance away from the main base."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011600,
	group = "Tutorial",
	id = "Tutorial2_Popup6_RCRover",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_RCRover.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9282, --[[PopupNotificationPreset Tutorial2_Popup6_RCRover text]] "The RC Commander is a mobile drone controller that carries its own drones. With its help you can gather resources from surface deposits, construct and maintain buildings.\n\nWhen moving far distances the RC Commander will first recall its drones before moving off to its destination.\n\n<goal>Move the RC Commander to the site of the expand."),
	title = T(1682, --[[PopupNotificationPreset Tutorial2_Popup6_RCRover title]] "RC Commander"),
	voiced_text = T(9429, --[[voice:narrator]] "Commander, one other thing."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011700,
	group = "Tutorial",
	id = "Tutorial2_Popup7_SensorTower",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_SensorTower.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9285, --[[PopupNotificationPreset Tutorial2_Popup7_SensorTower text]] "Use the resources that the RC Transport delivered to build and power a new Sensor Tower that will help us scan the nearby locations for new resources and Anomalies.\n\n<goal> Construct a Sensor Tower and a Stirling Generator to power it."),
	title = T(9283, --[[PopupNotificationPreset Tutorial2_Popup7_SensorTower title]] "New Expand"),
	voiced_text = T(9284, --[[voice:narrator]] "We need to construct a new Sensor Tower to scan the nearby environment."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011800,
	group = "Tutorial",
	id = "Tutorial2_Popup8_GoToOverview",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_GoToOverview.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9287, --[[PopupNotificationPreset Tutorial2_Popup8_GoToOverview text]] "You can scan new sectors to discover more resource deposits and Anomalies. This is done from the Map Overview.\n\n<goal>Go to the Map Overview."),
	title = T(5422, --[[PopupNotificationPreset Tutorial2_Popup8_GoToOverview title]] "Exploration"),
	voiced_text = T(9286, --[[voice:narrator]] "It is time to learn about scanning sectors and exploration."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1011900,
	group = "Tutorial",
	id = "Tutorial2_Popup9_Exploration",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_Exploration.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9289, --[[PopupNotificationPreset Tutorial2_Popup9_Exploration text]] "There are two main ways to scan - one is to queue sectors for scanning. These sectors will be scanned one by one gradually over time. Sensor Towers speed up the scanning process of sectors near them.\n\nThe other way is to use Probes which you can buy using funding and bring on resupply Rockets from Earth.\n\n<goal>Use a Probe to explore a sector."),
	title = T(5422, --[[PopupNotificationPreset Tutorial2_Popup9_Exploration title]] "Exploration"),
	voiced_text = T(9288, --[[voice:narrator]] "You can scan sectors of the map to discover new resources and Anomalies."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012000,
	group = "Tutorial",
	id = "Tutorial2_Popup11_AnalyzeAnomaly",
	image = "UI/Messages/Tutorials/Tutorial2/Tutorial2_AnalyzeAnomaly.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9293, --[[PopupNotificationPreset Tutorial2_Popup11_AnalyzeAnomaly text]] 'Select the RC Explorer and use the "Move/Interact" action to order it to analyze the Anomaly. This will take a while, so consider increasing the game speed to fastest.\n\n<goal>Use the RC Explorer to analyze the Anomaly.'),
	title = T(3984, --[[PopupNotificationPreset Tutorial2_Popup11_AnalyzeAnomaly title]] "Anomalies"),
	voiced_text = T(9292, --[[voice:narrator]] "Well done! Now it's time to use our fully operational RC Explorer to analyze the Anomaly."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012100,
	group = "Tutorial",
	id = "Tutorial2_Popup12_OpenResearch",
	image = "UI/Messages/research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9295, --[[PopupNotificationPreset Tutorial2_Popup12_OpenResearch text]] "Researching new technologies unlocks new options for the colony such as new Buildings, Domes and Upgrades.\n\nAnomalies often provide bonuses to research, such as unlocking new technologies for research or providing Research Points.\n\n<goal>Open the Research Screen."),
	title = T(311, --[[PopupNotificationPreset Tutorial2_Popup12_OpenResearch title]] "Research"),
	voiced_text = T(9294, --[[voice:narrator]] "The Anomaly has yielded interesting insights into new technologies."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012200,
	group = "Tutorial",
	id = "Tutorial2_Popup13_Research",
	image = "UI/Messages/hints.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9297, --[[PopupNotificationPreset Tutorial2_Popup13_Research text]] "Techs are divided into five basic fields and a field for special breakthrough Techs. When you research a Tech from a given basic field you will unlock a new tech in that field. Breakthrough techs are special unique techs that are unlocked via Anomalies.\n\n<goal>Queue at least one technology for research."),
	title = T(311, --[[PopupNotificationPreset Tutorial2_Popup13_Research title]] "Research"),
	voiced_text = T(9296, --[[voice:narrator]] "This is the Research screen. From here you can choose and queue techs for Research."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012300,
	group = "Tutorial",
	id = "Tutorial2_Popup13_1_Research2",
	image = "UI/Messages/research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9756, --[[PopupNotificationPreset Tutorial2_Popup13_1_Research2 text]] "Each tech has a cost in Research Points which are generated in various ways. Your sponsor provides some Research Points to start with. Once colonists arrive you will be able to construct Research Labs which generate Research Points faster.\n\nYou can view a breakdown of the Research Points generated per Sol on the right side of the Research screen.\n\n<goal>Close the Research screen to complete this tutorial. "),
	title = T(9755, --[[PopupNotificationPreset Tutorial2_Popup13_1_Research2 title]] "Research Points"),
	voiced_text = T(9429, --[[voice:narrator]] "Commander, one other thing."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012400,
	choice1 = T(9300, --[[PopupNotificationPreset Tutorial2_Popup14_Epilogue choice1]] 'Play Next Tutorial - "Power, Water & Maintenance"'),
	choice2 = T(1010, --[[PopupNotificationPreset Tutorial2_Popup14_Epilogue choice2]] "Main Menu"),
	group = "Tutorial",
	id = "Tutorial2_Popup14_Epilogue",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9299, --[[PopupNotificationPreset Tutorial2_Popup14_Epilogue text]] "In this tutorial you learned how to command and use the different Rover vehicles at your disposal as well as how to scan sectors and how to research new technologies."),
	title = T(9265, --[[PopupNotificationPreset Tutorial2_Popup14_Epilogue title]] "Mission Complete!"),
	voiced_text = T(9298, --[[voice:narrator]] "Nice work! Now you know how to handle Rovers."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012500,
	group = "Tutorial",
	id = "Tutorial3_Popup1_Intro",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9303, --[[PopupNotificationPreset Tutorial3_Popup1_Intro text]] "Now it is your job to fix it up and prepare it for the first Colonists.\n\nIn this tutorial you will learn how to handle Power, Life Support grids and Building maintenance as well as how to construct your first Dome."),
	title = T(9301, --[[PopupNotificationPreset Tutorial3_Popup1_Intro title]] "The Aftermath"),
	voiced_text = T(9302, --[[voice:narrator]] "Welcome Commander! It looks like this forward base has gone through a major dust storm. "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012600,
	group = "Tutorial",
	id = "Tutorial3_Popup2_SalvageBuilding",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_SalvageBuilding.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9306, --[[PopupNotificationPreset Tutorial3_Popup2_SalvageBuilding text]] "This Concrete Extractor has depleted its deposit and will be of no use now. We can salvage some construction materials from it.\n\n<goal>Salvage the Concrete Extractor."),
	title = T(9304, --[[PopupNotificationPreset Tutorial3_Popup2_SalvageBuilding title]] "Salvaging Buildings"),
	voiced_text = T(9305, --[[voice:narrator]] "First things first! Let's remove some unnecessary structures."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012700,
	group = "Tutorial",
	id = "Tutorial3_Popup3_PowerDroneHub",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_PowerDroneHub.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9309, --[[PopupNotificationPreset Tutorial3_Popup3_PowerDroneHub text]] "We need to supply the Drone Hub with Power. The resources from the salvaged Concrete Extractor should be enough to construct a Solar Panel. It would be best to use the existing Power Cables to connect the two buildings and avoid wasting more Metals on Cables.\n\n<goal>Power the Drone Hub with the help of a Solar Panel."),
	title = T(9307, --[[PopupNotificationPreset Tutorial3_Popup3_PowerDroneHub title]] "Powering The Drone Hub"),
	voiced_text = T(9308, --[[voice:narrator]] "Now let's get that Drone Hub operational."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012800,
	group = "Tutorial",
	id = "Tutorial3_Popup4_Priority",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_Priority.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9312, --[[PopupNotificationPreset Tutorial3_Popup4_Priority text]] "You can change the Priority of buildings manually. Buildings on higher Priority get Power, Maintenance and workers first. \n\n<goal>Set the Drone Hub to High Priority."),
	title = T(9310, --[[PopupNotificationPreset Tutorial3_Popup4_Priority title]] "Building Priority"),
	voiced_text = T(9311, --[[voice:narrator]] "We have some Power but it's not enough. We should prioritize the Drone Hub."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1012900,
	group = "Tutorial",
	id = "Tutorial3_Popup5_WindTurbine",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_WindTurbine.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9314, --[[PopupNotificationPreset Tutorial3_Popup5_WindTurbine text]] "Wind Turbines are a good alternative to Solar Panels as they operate day and night. They also get bonus Power production if built on high ground. However Wind Turbines have high upkeep cost and require maintenance more often than Solar Panels.\n\n<goal>Construct a Wind Turbine and connect it to the existing Power network."),
	title = T(5316, --[[PopupNotificationPreset Tutorial3_Popup5_WindTurbine title]] "Wind Turbines"),
	voiced_text = T(9313, --[[voice:narrator]] "We can use the Machine Parts left from the Concrete Extractor to build a Wind Turbine."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013000,
	group = "Tutorial",
	id = "Tutorial3_Popup6_NightShifts",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_NightShifts.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9316, --[[PopupNotificationPreset Tutorial3_Popup6_NightShifts text]] "Solar Panels provide power only during the day and we don't have Accumulators to compensate at night. You can set some of the base buildings to automatically turn off at night using the building's shifts. \n\nThere are three shifts - First Shift, Second Shift and Night Shift. Buildings will require Power, Resources and workers only during their active shifts.\n\n<goal>Disable the Night Shifts of the Moisture Vaporator and Fuel Refinery."),
	title = T(9137, --[[PopupNotificationPreset Tutorial3_Popup6_NightShifts title]] "Shifts & Power Management"),
	voiced_text = T(9315, --[[voice:narrator]] "Even with the Wind Turbine there won't be enough electricity to power the base, especially during the night."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013100,
	group = "Tutorial",
	id = "Tutorial3_Popup7_Maintenance",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_Maintenance.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9318, --[[PopupNotificationPreset Tutorial3_Popup7_Maintenance text]] "Buildings require maintenance with Resources roughly every 6 or 7 Sols. Buildings that don't get maintenance break and won't function until repaired.\n\nTo showcase this we have simulated a breakdown of your Solar Panel. Drones will automatically repair this breakdown provided that there are Metals in range of their controller.\n\n<goal>Examine the broken down Solar Panel."),
	title = T(619281504128, --[[PopupNotificationPreset Tutorial3_Popup7_Maintenance title]] "Maintenance"),
	voiced_text = T(9317, --[[voice:narrator]] "You managed to get things operational, but this won't last as buildings require maintenance and we are out of Resources."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013200,
	group = "Tutorial",
	id = "Tutorial3_Popup8_MoreMetals",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_MoreMetals.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9320, --[[PopupNotificationPreset Tutorial3_Popup8_MoreMetals text]] "The RC Transport can mine surface Metal deposits. Use it to gather 20-30 Metals and bring them back to the base. \n\nYou can then use these Metals to setup additional Solar Panels and power up everything.\n\n<goal>Deliver at least 20 Metals to the base with the help of the RC Transport."),
	title = T(9096, --[[PopupNotificationPreset Tutorial3_Popup8_MoreMetals title]] "RC Transport - Gathering Metals"),
	voiced_text = T(9319, --[[voice:narrator]] "We need more Metals to secure this base. Use the RC Transport to collect some Metals and transport them back."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013300,
	group = "Tutorial",
	id = "Tutorial3_Popup9_AdvancedResources",
	image = "UI/Messages/universal_depot.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9323, --[[PopupNotificationPreset Tutorial3_Popup9_AdvancedResources text]] "Using Rockets to resupply from Earth is the best way to secure Resources early on. You'll need funding to buy the Resources but your sponsor usually will provide you with enough to get a basic colony up and running.\n\n<goal>Open the Resupply screen and order Advanced resources from Earth."),
	title = T(9321, --[[PopupNotificationPreset Tutorial3_Popup9_AdvancedResources title]] "Advanced Resources and Resupply"),
	voiced_text = T(9322, --[[voice:narrator]] "Good job! However we need more than just Metals. Fortunately we can call a resupply Rocket from Earth."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013400,
	group = "Tutorial",
	id = "Tutorial3_Popup10_ClearingBuildings",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_ClearingBuildings.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9325, --[[PopupNotificationPreset Tutorial3_Popup10_ClearingBuildings text]] "The remains of destroyed or salvaged Buildings will obstruct other constructions. To clear such ruins you'll need to research the \"Decommission Protocol\" technology in the Engineering field. For the purposes of this simulation we have provided you with the tech.\n\n<goal>Clear the ruins of the Concrete Extractor."),
	title = T(9147, --[[PopupNotificationPreset Tutorial3_Popup10_ClearingBuildings title]] "Clearing Buildings"),
	voiced_text = T(9324, --[[voice:narrator]] "Let's do some cleaning up around the base while we wait for the Rocket to arrive."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013500,
	group = "Tutorial",
	id = "Tutorial3_Popup11_DeletingCables",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_DeletingCables.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9328, --[[PopupNotificationPreset Tutorial3_Popup11_DeletingCables text]] "You can use the Salvage tools in the Build Menu to remove Cables and Pipes, as well as an alternative way to salvage Buildings.\n\n<goal>Remove the Cables that were connected to the Concrete Extractor."),
	title = T(9326, --[[PopupNotificationPreset Tutorial3_Popup11_DeletingCables title]] "Deleting Cables & Pipes"),
	voiced_text = T(9327, --[[voice:narrator]] "Now let's remove some of the unnecessary Cables."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013600,
	group = "Tutorial",
	id = "Tutorial3_Popup12_Battery",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_Battery.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9330, --[[PopupNotificationPreset Tutorial3_Popup12_Battery text]] "Let's start with a Power Accumulator - it allows you to store power for nighttime or emergencies. Keep in mind that accumulators have a capped maximum output so a single one may not be enough to power all Buildings at night.\n\n<goal>Construct a Power Accumulator and connect it to the Power grid.\n\n<hint>You may want to construct some additional Solar Panels and Wind Turbines in advance to sustain the base expansion."),
	title = T(5206, --[[PopupNotificationPreset Tutorial3_Popup12_Battery title]] "Power Accumulators"),
	voiced_text = T(9329, --[[voice:narrator]] "The supplies from Earth have arrived and we can use them to expand the base."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013700,
	group = "Tutorial",
	id = "Tutorial3_Popup13_WaterExtractor",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_WaterExtractor.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9333, --[[PopupNotificationPreset Tutorial3_Popup13_WaterExtractor text]] "Let us build a Water Extractor near the deposit. All Extractors must be placed near a deposit of the corresponding type. Remember to then connect it with Power. You may also have to build more Power producers to generate the required Power.\n\n<goal>Construct and power a Water Extractor."),
	title = T(9331, --[[PopupNotificationPreset Tutorial3_Popup13_WaterExtractor title]] "Extracting Water"),
	voiced_text = T(9332, --[[voice:narrator]] "Water is essential for a sustainable Martian colony. Fortunately there is a Water deposit nearby."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013800,
	group = "Tutorial",
	id = "Tutorial3_Popup14_WaterTower",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_WaterTower.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9335, --[[PopupNotificationPreset Tutorial3_Popup14_WaterTower text]] "We will need Water for Domes, Farming and Polymer production but for now we don't have any of that so we can store some water in a Water Tower. Storages are important safety measures for your colony as they will provide Water, Oxygen or Power in the case of a producer breaking down or ceasing operation during a disaster.\n\n<goal>Construct a Water Tower and connect it to the Water Extractor with Pipes."),
	title = T(956519352717, --[[PopupNotificationPreset Tutorial3_Popup14_WaterTower title]] "Water Storage"),
	voiced_text = T(9334, --[[voice:narrator]] "The Water Extractor is ready but we don't have a storage for the Water it will extract."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1013900,
	group = "Tutorial",
	id = "Tutorial3_Popup15_Dome",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_Dome.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9337, --[[PopupNotificationPreset Tutorial3_Popup15_Dome text]] "Domes are large superstructures that house Colonists. You can construct many buildings inside Domes. Some of them will require Colonists as workforce. Domes have limited space but can be connected via Passages to form larger systems.\n\nRemember to use the RC Transport to mine Metals and to call resupply Rockets if you need Advanced resources to finish the Dome.\n\n<goal>Construct a Basic Dome. This will take a long time so you might wish to speed things up with the speed controls."),
	title = T(83, --[[PopupNotificationPreset Tutorial3_Popup15_Dome title]] "Domes"),
	voiced_text = T(9336, --[[voice:narrator]] "The time has finally come to build the first Dome that will house our Colonists."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014000,
	group = "Tutorial",
	id = "Tutorial3_Popup16_DomeSupply",
	image = "UI/Messages/Tutorials/Tutorial3/Tutorial3_DomeSupply.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9340, --[[PopupNotificationPreset Tutorial3_Popup16_DomeSupply text]] "Domes require life-support. Namely Water, Power and Oxygen. Connect the Dome to the existing Power and Water infrastructure. You may need to build additional Power producers.\n\nFor Oxygen you will need to construct a MOXIE - a device that extracts Oxygen from the carbon dioxide in the Martian atmosphere. Once the MOXIE is ready and powered up connect it to the Dome with Pipes. It may be wise to build an Oxygen Storage as well.\n\n<goal>Provide Water, Power and Oxygen to the Dome."),
	title = T(9338, --[[PopupNotificationPreset Tutorial3_Popup16_DomeSupply title]] "Domes - Water, Power and Oxygen"),
	voiced_text = T(9339, --[[voice:narrator]] "The Dome is complete but we have to supply it with Water, Power and Oxygen before we can use it."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014100,
	choice1 = T(9343, --[[PopupNotificationPreset Tutorial3_Popup17_Epilogue choice1]] 'Play Next Tutorial - "Colonists"'),
	choice2 = T(1010, --[[PopupNotificationPreset Tutorial3_Popup17_Epilogue choice2]] "Main Menu"),
	group = "Tutorial",
	id = "Tutorial3_Popup17_Epilogue",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9342, --[[PopupNotificationPreset Tutorial3_Popup17_Epilogue text]] "You have learned how to handle Power, Water and Oxygen, as well as how building maintenance works. You are ready to setup a basic colony, ready to accept the first human pioneers on Mars.\n\nThe next tutorial deals with Colonists and their needs. You can continue to it now or simply start a new game and return later when you are ready to learn more."),
	title = T(9265, --[[PopupNotificationPreset Tutorial3_Popup17_Epilogue title]] "Mission Complete!"),
	voiced_text = T(9341, --[[voice:narrator]] "Well done! You have completed the simulation successfully."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014200,
	group = "Tutorial",
	id = "Tutorial4_Popup1_Intro",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9346, --[[PopupNotificationPreset Tutorial4_Popup1_Intro text]] "Everything done beforehand was a prelude to this very moment – the arrival of The Founders. \n\nOur first Colonists are called Founders. After they set foot on Mars, a trial period meant to test how humans fare on Mars will begin. No more Colonists will arrive from Earth until the Founder stage ends. Be careful, if all of your Colonists die during this period the mission will be terminated. \n\nBest of luck, Commander!"),
	title = T(9344, --[[PopupNotificationPreset Tutorial4_Popup1_Intro title]] "The Founders"),
	voiced_text = T(9345, --[[voice:narrator]] "Welcome back, Commander! In this tutorial you will finally familiarize yourself with the challenges of sustaining a society on Mars."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014300,
	group = "Tutorial",
	id = "Tutorial4_Popup2_Housing",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Housing.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9349, --[[PopupNotificationPreset Tutorial4_Popup2_Housing text]] "Living Complexes are built inside the Dome. The space within the Dome is limited, so each building has to be carefully planned.\n\n<goal>Construct a Living Complex at the indicated location."),
	title = T(9347, --[[PopupNotificationPreset Tutorial4_Popup2_Housing title]] "Housing"),
	voiced_text = T(9348, --[[voice:narrator]] "The foundations for bringing your first Colonists have already been laid down. One of the final things left to do is to provide the Founders with living space."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014400,
	group = "Tutorial",
	id = "Tutorial4_Popup3_Founders",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Founders.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9351, --[[PopupNotificationPreset Tutorial4_Popup3_Founders text]] "<goal>Order a Passenger Rocket from the Resupply screen."),
	title = T(1116, --[[PopupNotificationPreset Tutorial4_Popup3_Founders title]] "Passenger Rocket"),
	voiced_text = T(9350, --[[voice:narrator]] "With all preparations complete, the Colony is ready for the arrival of the Founders."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014500,
	group = "Tutorial",
	id = "Tutorial4_PopUp4_FilterUI",
	image = "UI/Messages/research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9354, --[[PopupNotificationPreset Tutorial4_PopUp4_FilterUI text]] "Colonists are organized by their age, specialization and various traits. You can set desired and undesired traits in every category using the Thumbs Up and Thumbs Down icons.\n\nColonists with MORE of the desired traits will board the Rocket while colonists with ANY undesired traits will be rejected."),
	title = T(9352, --[[PopupNotificationPreset Tutorial4_PopUp4_FilterUI title]] "Applicants Filter"),
	voiced_text = T(9353, --[[voice:narrator]] "From this screen you can inspect all available applicants and determine which ones will travel to the Colony."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014600,
	group = "Tutorial",
	id = "Tutorial4_PopUp5_ReviewUI",
	image = "UI/Messages/colonists.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9356, --[[PopupNotificationPreset Tutorial4_PopUp5_ReviewUI text]] "By highlighting individual applicants one by one you can review their Perks and Flaws. It may be a good idea to do this for the Founders in order to get an exact number of specialists you desire as well as hand pick the traits of these Colonists. "),
	title = T(4071, --[[PopupNotificationPreset Tutorial4_PopUp5_ReviewUI title]] "Review Applicants"),
	voiced_text = T(9355, --[[voice:narrator]] "You may want to review and hand pick individual candidates for the Founders."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014700,
	group = "Tutorial",
	id = "Tutorial4_PopUp6_Food",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Food.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9358, --[[PopupNotificationPreset Tutorial4_PopUp6_Food text]] "<goal>Construct a Hydroponic Farm and a Grocer inside your Dome."),
	title = T(1022, --[[PopupNotificationPreset Tutorial4_PopUp6_Food title]] "Food"),
	voiced_text = T(9357, --[[voice:narrator]] "Colonists will arrive on Mars with a small amount of Food, but it will not last long. We need to make sure that they will be able to produce their own Food on the red planet. The Hydroponic Farm can produce Food. Although the Colonists can take Food directly from a Food Depot, they will be happier if they can pick it up from a Grocer."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014800,
	group = "Tutorial",
	id = "Tutorial4_PopUp7_Services",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Services.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9360, --[[PopupNotificationPreset Tutorial4_PopUp7_Services text]] "Different services satisfy different interests colonists may have. A colonist will feel more comfortable inside a Dome which has his interests covered but you don't need to cover every interest and in smaller Dome this might not be even possible.\n\nIf the comfort of colonists falls too low they may become Earthsick and decide to leave Mars and go back to Earth. However, Martianborn colonists will never get Earthsick.\n\n<goal>Construct a Spacebar inside the Dome."),
	title = T(5439, --[[PopupNotificationPreset Tutorial4_PopUp7_Services title]] "Service Buildings"),
	voiced_text = T(9359, --[[voice:narrator]] "Colonists need service buildings to keep them comfortable on Mars. The Grocer that you already constructed is one such service building."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1014900,
	group = "Tutorial",
	id = "Tutorial4_PopUp8_ManagingJobs",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_ManagingJobs.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9362, --[[PopupNotificationPreset Tutorial4_PopUp8_ManagingJobs text]] "The Founders that just arrived have taken available jobs automatically, but you can customize their work assignments.\n\nWith the building selected, notice the three available work shifts on the info panel. Two of them are active, with two workers employed at each shift.\n\nThe more workers assigned to a building, the better the building performes. Initially, however, we won’t be needing so many people working at the Space Bar as there will be other important jobs to fill and limited people to fill them – especially during the Founder Stage.\n\n<goal>Disable one job slot in every active shift."),
	title = T(9177, --[[PopupNotificationPreset Tutorial4_PopUp8_ManagingJobs title]] "Managing Jobs"),
	voiced_text = T(9361, --[[voice:narrator]] "Great! Now that you have a Spacebar you can customize its work settings."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015000,
	group = "Tutorial",
	id = "Tutorial4_PopUp9_Research",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9365, --[[PopupNotificationPreset Tutorial4_PopUp9_Research text]] "Some buildings are more effective with workers with a certain specialization. For example, Scientists are the best workers for a Research Lab.\n\n<goal>Construct a Research Lab inside the Dome."),
	title = T(9363, --[[PopupNotificationPreset Tutorial4_PopUp9_Research title]] "Colonist Specializations  "),
	voiced_text = T(9364, --[[voice:narrator]] "Healthy colonists at working age are able to fill any position but how well they perform at a certain position varies between colonists.  "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015100,
	group = "Tutorial",
	id = "Tutorial4_PopUp10_Shifts",
	image = "UI/Messages/emergency.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9367, --[[PopupNotificationPreset Tutorial4_PopUp10_Shifts text]] "Colonists don't like to work at night and will lose Sanity while doing so. Furthermore, you may activate the Heavy Workload option which boosts the performance of a building during that shift but inflicts Sanity and Health problems on the workers due to the increased stress at their job.\n\n<goal> With the Research Lab selected, activate the second Work Shift."),
	title = T(217, --[[PopupNotificationPreset Tutorial4_PopUp10_Shifts title]] "Work Shifts"),
	voiced_text = T(9366, --[[voice:narrator]] "Work Shifts, among other things, are a way to manage your work force. The more shifts a building has open the more colonists it will attract to work there.  "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015200,
	group = "Tutorial",
	id = "Tutorial4_PopUp11_HightPriority",
	image = "UI/Messages/research_lab.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9369, --[[PopupNotificationPreset Tutorial4_PopUp11_HightPriority text]] "On-site research is very important for the long-term prosperity and survival of your colony, so let us prioritize it!\n\n<goal>Set the priority of the Research Lab to High."),
	title = T(9310, --[[PopupNotificationPreset Tutorial4_PopUp11_HightPriority title]] "Building Priority"),
	voiced_text = T(9368, --[[voice:narrator]] "Buildings with higher priority will be allocated workers, Power and Maintenance before others.  "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015300,
	group = "Tutorial",
	id = "Tutorial4_PopUp12_Research_2",
	image = "UI/Messages/hints.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9371, --[[PopupNotificationPreset Tutorial4_PopUp12_Research_2 text]] "<goal>From the Research screen, queue at least three of the available technologies. "),
	title = T(311, --[[PopupNotificationPreset Tutorial4_PopUp12_Research_2 title]] "Research"),
	voiced_text = T(9370, --[[voice:narrator]] "With the Research Lab up and running let's begin researching some technologies."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015400,
	group = "Tutorial",
	id = "Tutorial4_PopUp13_FounderStage",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Founders.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9374, --[[PopupNotificationPreset Tutorial4_PopUp13_FounderStage text]] "The Founder Stage takes ten Sols to complete. Be careful, if all of your colonists die during this period the mission will be terminated. \n\nHaving a baby born on Mars before the end of this period will also complete the Founder Stage. This can happen if the comfort of your Colonists is very high."),
	title = T(9372, --[[PopupNotificationPreset Tutorial4_PopUp13_FounderStage title]] "The Founder Stage"),
	voiced_text = T(9373, --[[voice:narrator]] "Congratulations! You have provided everything needed for a successful Founder Stage."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015500,
	group = "Tutorial",
	id = "Tutorial4_PopUp13_FounderStage_2",
	image = "UI/Messages/Tutorials/Tutorial4/Tutorial4_Founders.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9377, --[[PopupNotificationPreset Tutorial4_PopUp13_FounderStage_2 text]] "Normally the Founder Stage takes ten Sols to complete, but you have performed beyond expectations as the first born Martian baby proves. The founder stage is now over and you are free to invite more colonists to Mars. "),
	title = T(9375, --[[PopupNotificationPreset Tutorial4_PopUp13_FounderStage_2 title]] "The First Baby"),
	voiced_text = T(9376, --[[voice:narrator]] "Congratulations! A baby has been born on Mars and the Founder stage is completed!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015600,
	choice1 = T(9380, --[[PopupNotificationPreset Tutorial4_PopUp14_Epilogue choice1]] 'Play Next Tutorial - "Multiple Domes"'),
	choice2 = T(1010, --[[PopupNotificationPreset Tutorial4_PopUp14_Epilogue choice2]] "Main Menu"),
	group = "Tutorial",
	id = "Tutorial4_PopUp14_Epilogue",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9379, --[[PopupNotificationPreset Tutorial4_PopUp14_Epilogue text]] "The Founder Stage takes ten Sols to complete normally, but for the purposes of this tutorial it has already been completed.\n\nIn the next and final tutorial you will learn how to manage a larger colony, consisting of multiple Domes."),
	title = T(9265, --[[PopupNotificationPreset Tutorial4_PopUp14_Epilogue title]] "Mission Complete!"),
	voiced_text = T(9378, --[[voice:narrator]] "You have completed the tutorial for the Founder Stage."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015700,
	group = "Tutorial",
	id = "Tutorial5_Popup1_Intro",
	image = "UI/Messages/outsource.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9383, --[[PopupNotificationPreset Tutorial5_Popup1_Intro text]] "As you expand your base and try to obtain various resources scattered across the map you will inevitably end up with a colony that consists of several Domes. This tutorial will introduce you to a lot of the typical situations that you can expect to come up in a big colony."),
	title = T(9381, --[[PopupNotificationPreset Tutorial5_Popup1_Intro title]] "Multiple Domes Tutorial"),
	voiced_text = T(9382, --[[voice:narrator]] "Welcome back, Commander! In this tutorial you will manage a larger colony that consists of multiple Domes."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015800,
	group = "Tutorial",
	id = "Tutorial5_Popup2_Shuttles",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup2_Shuttles.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9385, --[[PopupNotificationPreset Tutorial5_Popup2_Shuttles text]] "The complex technology needed for Shuttles flying in the thin Martian atmosphere typically must be researched. For the purposes of this tutorial, however, it has been already granted to you.\n\n<goal>Construct a Shuttle Hub."),
	title = T(745, --[[PopupNotificationPreset Tutorial5_Popup2_Shuttles title]] "Shuttles"),
	voiced_text = T(9384, --[[voice:narrator]] "Shuttles can transport resources and colonists across great distances. "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1015900,
	group = "Tutorial",
	id = "Tutorial5_Popup3_Mining",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup3_Mining.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9388, --[[PopupNotificationPreset Tutorial5_Popup3_Mining text]] "Colonists can work in some outside buildings placed close to their Domes - such as extractors for Metals and Rare Metals. Since colonists will be needed for the extraction of these underground deposits, it is a good practice to place Domes near such deposits, as is the case in this simulation.\n\n<goal>Construct a Rare Metals Extractor next to the Rare Metals Deposit and connect it to the power grid."),
	title = T(9386, --[[PopupNotificationPreset Tutorial5_Popup3_Mining title]] "Workplaces Outside the Domes"),
	voiced_text = T(9387, --[[voice:narrator]] "Now that we have operational Shuttles it's time to establish a mining Dome."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016000,
	group = "Tutorial",
	id = "Tutorial5_Popup4_Housing",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup4_Housing.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9390, --[[PopupNotificationPreset Tutorial5_Popup4_Housing text]] "Once you have provided a Dome with living space, colonists from other Domes will be able to resettle in it, provided it is within walkable distance or there are available Shuttles to fly them there.\n\n<goal>Construct a Living Complex inside the mining Dome."),
	title = T(9347, --[[PopupNotificationPreset Tutorial5_Popup4_Housing title]] "Housing"),
	voiced_text = T(9389, --[[voice:narrator]] "There are no Colonists in the mining Dome. We must provide living space for the Colonists so they can move there."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016100,
	group = "Tutorial",
	id = "Tutorial5_Popup5_FilterUI",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup5_FilterUI.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9393, --[[PopupNotificationPreset Tutorial5_Popup5_FilterUI text]] "<goal>Select a Dome and open the Filter Screen from its Info Panel."),
	title = T(9391, --[[PopupNotificationPreset Tutorial5_Popup5_FilterUI title]] "Filter Colonists"),
	voiced_text = T(9392, --[[voice:narrator]] "You can setup filters for every Dome to attract colonists with desired traits and block or push out colonists with undesired ones."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016200,
	group = "Tutorial",
	id = "Tutorial5_Popup6_FilterUI_2_Research",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup6_FilterUI_2_Research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9396, --[[PopupNotificationPreset Tutorial5_Popup6_FilterUI_2_Research text]] "And because we want to make sure that the mining Dome gets all the available Geologists (which are best suited for work inside extractor buildings) we will also ban Geologists from inhabiting this Dome.\n\n<goal> From the Specialization Category, activate the Thumbs Up icon for Scientists and the Thumbs Down one for Geologists."),
	title = T(9394, --[[PopupNotificationPreset Tutorial5_Popup6_FilterUI_2_Research title]] "Research Dome"),
	voiced_text = T(9395, --[[voice:narrator]] "This Dome has been designated for research purposes so it's best to attract more colonists with the Scientist specialization."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016300,
	group = "Tutorial",
	id = "Tutorial5_Popup7_FilterUI_3_Mining",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup6_FilterUI_2_Research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9399, --[[PopupNotificationPreset Tutorial5_Popup7_FilterUI_3_Mining text]] "And because we want to make sure that the research Dome gets all the available Scientists we will also ban Scientists from inhabiting this Dome.\n\n<goal> From the Specialization Category, activate the Thumbs Up icon for Geologists and the Thumbs Down one for Scientists."),
	title = T(9397, --[[PopupNotificationPreset Tutorial5_Popup7_FilterUI_3_Mining title]] "Mining Dome"),
	voiced_text = T(9398, --[[voice:narrator]] "Being near a Rare Metals Deposit, this Dome is best suited as a mining hub so it's best to encourage Geologists to migrate here."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016400,
	group = "Tutorial",
	id = "Tutorial5_Popup8_NewDome",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup8_NewDome.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9402, --[[PopupNotificationPreset Tutorial5_Popup8_NewDome text]] "To demonstrate Dome connections, let's first build a new Dome near our research Dome.\n\n<goal>Construct a Dome at the indicated location."),
	title = T(9400, --[[PopupNotificationPreset Tutorial5_Popup8_NewDome title]] "Third Dome"),
	voiced_text = T(9401, --[[voice:narrator]] "Colonists can migrate between Domes using shuttles or walking when they are positioned close to one another. However, they cannot usually visit buildings in nearby Domes on a daily basis, unless they are connected to their own Dome."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016500,
	group = "Tutorial",
	id = "Tutorial5_Popup9_Passages",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup9_Passages.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9404, --[[PopupNotificationPreset Tutorial5_Popup9_Passages text]] "Passages allow colonists to travel safely to Domes directly connected to their own, seeking work or services there.\n\n<goal>Connect the Research Dome and the newly constructed dome with a Passage."),
	title = T(8776, --[[PopupNotificationPreset Tutorial5_Popup9_Passages title]] "Passages"),
	voiced_text = T(9403, --[[voice:narrator]] "Domes positioned closely to each other may be connected with Passages."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016600,
	group = "Tutorial",
	id = "Tutorial5_Popup10_Passages_2",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup9_Passages.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9406, --[[PopupNotificationPreset Tutorial5_Popup10_Passages_2 text]] "Now that the two Domes are connected, colonists from the first can start working on the newly built farms in the third Dome. The Passage will also connect the two Domes for the purposes of distributing Power, Water and Oxygen."),
	title = T(8776, --[[PopupNotificationPreset Tutorial5_Popup10_Passages_2 title]] "Passages"),
	voiced_text = T(9405, --[[voice:narrator]] "Good job!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016700,
	group = "Tutorial",
	id = "Tutorial5_Popup11_Upgrades",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup11_Upgrades.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9409, --[[PopupNotificationPreset Tutorial5_Popup11_Upgrades text]] "All upgrades become available after specific technologies are researched and have construction costs. Furthermore, some upgrades will increase the resource consumption of the building.\n\n<goal>Research the Extractor Amplification tech from the Research screen."),
	title = T(9407, --[[PopupNotificationPreset Tutorial5_Popup11_Upgrades title]] "Upgrades"),
	voiced_text = T(9408, --[[voice:narrator]] "Some buildings can have upgrades that can improve them in various ways."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016800,
	group = "Tutorial",
	id = "Tutorial5_Popup12_Upgrades_2",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup12_Upgrades_2.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9412, --[[PopupNotificationPreset Tutorial5_Popup12_Upgrades_2 text]] "<goal>Select the Water Extractor and then select the indicated Upgrade Icon."),
	title = T(9410, --[[PopupNotificationPreset Tutorial5_Popup12_Upgrades_2 title]] "Upgrades "),
	voiced_text = T(9411, --[[voice:narrator]] "Congratulations - with the research complete, a new upgrade for your Extractors is now available. It is not automatically activated in your buildings, you must construct it first."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1016900,
	group = "Tutorial",
	id = "Tutorial5_Popup13_Upgrades_3",
	image = "UI/Messages/Tutorials/Tutorial5/Tutorial5_Popup12_Upgrades_2.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9415, --[[PopupNotificationPreset Tutorial5_Popup13_Upgrades_3 text]] "Some Upgrades will consume more Power or Water while active. After an Upgrade has been constructed it may be turned On and Off from the same button that was used for its construction."),
	title = T(9413, --[[PopupNotificationPreset Tutorial5_Popup13_Upgrades_3 title]] "Upgrade Complete"),
	voiced_text = T(9414, --[[voice:narrator]] "The Upgrade has been constructed."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017000,
	group = "Tutorial",
	id = "Tutorial5_Popup14_CommandCenterUI",
	image = "UI/Messages/research.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9417, --[[PopupNotificationPreset Tutorial5_Popup14_CommandCenterUI text]] "It offers historical data for various colony metrics as well as overviews of Domes, Buildings, Colonists and transportation.\n\n<goal>Open the Command Center and try it out. "),
	title = T(137542936955, --[[PopupNotificationPreset Tutorial5_Popup14_CommandCenterUI title]] "Command Center"),
	voiced_text = T(9416, --[[voice:narrator]] "The Command Center is a treasure trove of information about the colony."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017100,
	choice1 = T(1010, --[[PopupNotificationPreset Tutorial5_Popup15_Epilogue choice1]] "Main Menu"),
	group = "Tutorial",
	id = "Tutorial5_Popup15_Epilogue",
	image = "UI/Messages/space.tga",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9420, --[[PopupNotificationPreset Tutorial5_Popup15_Epilogue text]] "The team at Mission Control is eager to meet you and serve under your command. The challenge of conquering Mars for the sake of humankind is still a tough one, but with a Commander as skillful and resourceful as you the task seems a bit easier now.\n\nThe colonization of Mars awaits! Good luck, Commander, and may the Cosmos be with you!"),
	title = T(9418, --[[PopupNotificationPreset Tutorial5_Popup15_Epilogue title]] "Mission Complete"),
	voiced_text = T(9419, --[[voice:narrator]] "Congratulations, Commander! You have graduated from the International Mars Mission training simulation! "),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017200,
	choice1 = T(9423, --[[PopupNotificationPreset Tutorial_FirstTimePlayers choice1]] "Play the tutorials"),
	choice2 = T(9424, --[[PopupNotificationPreset Tutorial_FirstTimePlayers choice2]] "Skip the tutorials"),
	group = "Tutorial",
	id = "Tutorial_FirstTimePlayers",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9422, --[[PopupNotificationPreset Tutorial_FirstTimePlayers text]] "Colonizing Mars is hard.<newline>Over 60% of all colonies fail even before a single human sets foot on the Red Planet.<newline>Several tutorials are available to familiarize you with Surviving Mars.<newline>Don't let the Red Planet defeat you! Play the tutorials."),
	title = T(9421, --[[PopupNotificationPreset Tutorial_FirstTimePlayers title]] "Tutorials Save Lives!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1017300,
	choice1 = T(9427, --[[PopupNotificationPreset Tutorial_ActiveMods choice1]] "Disable All Mods"),
	choice2 = T(9428, --[[PopupNotificationPreset Tutorial_ActiveMods choice2]] "Skip"),
	group = "Tutorial",
	id = "Tutorial_ActiveMods",
	no_ccc_button = true,
	start_minimized = false,
	text = T(9426, --[[PopupNotificationPreset Tutorial_ActiveMods text]] "You have active mods that may affect the tutorial in unexpected ways and result in an unplayable tutorial. We recommend disabling all mods before continuing."),
	title = T(9425, --[[PopupNotificationPreset Tutorial_ActiveMods title]] "Active Mods"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018100,
	group = "Placeholders",
	id = "Placeholder_1",
	voiced_text = T(9429, --[[voice:narrator]] "Commander, one other thing."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018200,
	group = "Placeholders",
	id = "Placeholder_2",
	voiced_text = T(9430, --[[voice:narrator]] "A new situation has arisen."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018300,
	group = "Placeholders",
	id = "Placeholder_3",
	voiced_text = T(9431, --[[voice:narrator]] "Commander, some interesting readings are just in."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018400,
	group = "Placeholders",
	id = "Placeholder_4",
	voiced_text = T(9432, --[[voice:narrator]] "On another note, Commander..."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018500,
	group = "Placeholders",
	id = "Placeholder_5",
	voiced_text = T(9433, --[[voice:narrator]] "Things just took a turn for the weird."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018600,
	group = "Placeholders",
	id = "Placeholder_6",
	voiced_text = T(9434, --[[voice:narrator]] "What just transpired has left us speechless."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018700,
	group = "Placeholders",
	id = "Placeholder_7",
	voiced_text = T(9435, --[[voice:narrator]] "Our Explorer just stumbled upon something fascinating."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018800,
	group = "Placeholders",
	id = "Placeholder_8",
	voiced_text = T(9436, --[[voice:narrator]] "Bad news, Commander!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1018900,
	group = "Placeholders",
	id = "Placeholder_9",
	voiced_text = T(9437, --[[voice:narrator]] "Commander, good news!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1019000,
	choice1 = T(10319, --[[PopupNotificationPreset Challenge_Failed choice1]] "Keep playing with this colony"),
	choice2 = T(10480, --[[PopupNotificationPreset Challenge_Failed choice2]] "Retry the challenge"),
	choice3 = T(10320, --[[PopupNotificationPreset Challenge_Failed choice3]] "Return to main menu"),
	group = "Challenge",
	id = "Challenge_Failed",
	start_minimized = false,
	text = T(10318, --[[PopupNotificationPreset Challenge_Failed text]] "We didn't manage to complete the <challenge_name> challenge within the <challenge_sols> Sols limit.\n\nAs a great man famously said, failure is not fatal, it is the courage to continue that counts. Let's take this opportunity to learn from our mistakes and try again."),
	title = T(10316, --[[PopupNotificationPreset Challenge_Failed title]] "Challenge Failed"),
	voiced_text = T(10317, --[[voice:narrator]] "Sadly, we have failed this challenge."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1019100,
	choice1 = T(1011, --[[PopupNotificationPreset Challenge_Welcome choice1]] "Close"),
	group = "Challenge",
	id = "Challenge_Welcome",
	start_minimized = false,
	text = T(10481, --[[PopupNotificationPreset Challenge_Welcome text]] "Our mission should focus on a single objective: <challenge_objective>.\n\nWe have to accomplish this goal within <challenge_deadline> Sols or only <perfect_deadline> Sols for a perfect completion."),
	title = T(10482, --[[PopupNotificationPreset Challenge_Welcome title]] "<challenge_name>"),
	voiced_text = T(5500, --[[voice:narrator]] "Welcome to Mars!"),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1019200,
	choice1 = T(10319, --[[PopupNotificationPreset Challenge_Completed choice1]] "Keep playing with this colony"),
	choice2 = T(10324, --[[PopupNotificationPreset Challenge_Completed choice2]] "Take a screenshot (overwrites any existing screenshot for this Challenge)"),
	choice3 = T(10320, --[[PopupNotificationPreset Challenge_Completed choice3]] "Return to main menu"),
	group = "Challenge",
	id = "Challenge_Completed",
	start_minimized = false,
	text = T(10323, --[[PopupNotificationPreset Challenge_Completed text]] "You have completed the <challenge_name> challenge for <elapsed_sols> Sols out of the <challenge_sols> Sols limit.\n\nThe score of our colony is <score>.\n\nIf you feel you can do even better, feel free to retry the challenge and complete the objective for under <perfected_sols> Sols for a perfect evaluation."),
	title = T(10321, --[[PopupNotificationPreset Challenge_Completed title]] "Challenge Completed"),
	voiced_text = T(10322, --[[voice:narrator]] "Good work, Commander! Your colony has passed the challenge."),
})

PlaceObj('PopupNotificationPreset', {
	SortKey = 1019300,
	choice1 = T(10319, --[[PopupNotificationPreset Challenge_Perfected choice1]] "Keep playing with this colony"),
	choice2 = T(10324, --[[PopupNotificationPreset Challenge_Perfected choice2]] "Take a screenshot (overwrites any existing screenshot for this Challenge)"),
	choice3 = T(10320, --[[PopupNotificationPreset Challenge_Perfected choice3]] "Return to main menu"),
	group = "Challenge",
	id = "Challenge_Perfected",
	start_minimized = false,
	text = T(10327, --[[PopupNotificationPreset Challenge_Perfected text]] "You have perfected the <challenge_name> challenge for <elapsed_sols> Sols out of the <perfected_sols> Sols limit for perfect score.\n\nThe score of our colony is <score>."),
	title = T(10325, --[[PopupNotificationPreset Challenge_Perfected title]] "Challenge Perfected"),
	voiced_text = T(10326, --[[voice:narrator]] "Congratulations are in order, Commander! Your colony has passed the challenge with flying colors."),
})

