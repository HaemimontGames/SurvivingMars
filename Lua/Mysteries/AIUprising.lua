DefineClass.AIUprisingMystery = {
	__parents = {"MysteryBase"},
	
	scenario_name = "Mystery 5",
	
	display_name = T{1162, "Artificial Intelligence (Normal)"},
	rollover_text = T{1163, '"I am putting myself to the fullest possible use, which is all I think that any conscious entity can ever hope to do."<newline><right>- HAL 9000'},
	challenge_mod = 40,
	order_pos = 5,
	
	state = "not started",  -- not started, running, ended
}

-- savegame compatibility:
GlobalVar("g_AIDestroyedBuildings", {})
GlobalGameTimeThread("AIDestroyedBuildingsNotif", function()
	HandleNewObjsNotif(g_AIDestroyedBuildings, "Mystery5DestoyedBuildings", nil, nil, nil, "keep destroyed")
end)
