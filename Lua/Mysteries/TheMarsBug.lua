DefineClass.TheMarsBug = {
	__parents = {"MysteryBase"},
	
	scenario_name = "Mystery 8",
	
	display_name = T{8067, "Wildfire (Hard)"},
	rollover_text = T{8068, "\"The worst pandemic in modern history was the Spanish flu of 1918, which killed tens of millions of people. Today, with how interconnected the world is, it would spread faster.\"<newline><right>- Bill Gates"},
	challenge_mod = 55,
	order_pos = 9,
	
	--mystery resource properties
	resource_display_name = T{8458, "Wildfire Cure"}, 
	resource_display_icon = "UI/Icons/Buildings/res_mystery_resource.tga",
	resource_tag_icon = "UI/Icons/res_mystery_resource.tga",
	resource_unit_amount = const.ResourceScale, 
	resource_color = RGB(0, 255, 0),
	resource_entity = "ResourceMystery",
	resource_description = T{8459, "Medicine preventing the Wildfire infection from destroying its host and from spreading to other humans."},
	
	depot_display_name = T{8531, "Wildfire Cure Depot"},
	depot_display_name_pl = T{8532, "Wildfire Cure Depots"},
	depot_description = T{8533, "Stores the cure for the Wildfire infection."},
	
	mech_depot_display_name = T{8796, "Wildfire Cure Storage"},
	mech_depot_display_name_pl = T{8797, "Wildfire Cure Storages"},
	mech_depot_description = T{8533, "Stores the cure for the Wildfire infection."},
}