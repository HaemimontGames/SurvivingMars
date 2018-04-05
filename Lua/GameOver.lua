function OnMsg.ColonistDied(colonist)
	if IsGameOver(colonist) then
		GameOver("last_colonist_died")
	end
end

function OnMsg.ColonistLeavingMars(colonist)
	if IsGameOver(colonist) then
		GameOver("last_colonist_left")
	end
end

function IsGameOver(last_colonist)
	if #UICity.labels.Colonist == 0 or #UICity.labels.Colonist == 1 and UICity.labels.Colonist[1] == last_colonist then
		return true
	end
	return false
end

function GameOver(reason)
	g_GameSessionOutcome = reason or "game_over"
	CreateGameTimeThread(function()
		local params = {}
		local idx = 1
		local has_savegames = WaitCountSaveGames() > 0
		if has_savegames then
			params["choice" .. idx] = T{1009, "Load Game"}
			idx = idx + 1
		end
		params["choice" .. idx] = T{1010, "Main Menu"}
		idx = idx + 1
		if Platform.developer then
			params["choice" .. idx] = T{1011, "Close"}
		end
		local gameover_popup = (g_ColonyNotViableUntil == -1) and "GameOver_PostFounder" or "GameOver"
		local res = WaitPopupNotification(gameover_popup, params)
		if res == 1 and has_savegames then
			--load menu
			CreateRealTimeThread(function()
				OpenPreGameMainMenu("Load")
			end)
		elseif res == 1 or res == 2 and has_savegames then
			--main menu
			CreateRealTimeThread(function()
				OpenPreGameMainMenu()
			end)
		else
			--close - do nothing
		end
	end)
end