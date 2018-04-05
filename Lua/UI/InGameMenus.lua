function OpenIngameMainMenu()
	--don't open this over the pregame menu
	if GameState.gameplay then
		local menu = GetXDialog("IGMainMenu")
		if menu then
			CloseIngameMainMenu()
		else
			local igi = GetInGameInterface()
			if igi and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
				hr.RenderUIL = 1 -- keep this while G_ToggleInGameInterface cheat is present
				CreateRealTimeThread(function()
					PlayFX("OpenInGameMenu", "start")
					local savegame_count = WaitCountSaveGames()
					OpenXDialog("IGMainMenu", nil, {savegame_count = savegame_count})
				end)
			end
		end
	end
end

function CloseIngameMainMenu()
	CloseXDialog("IGMainMenu")
end