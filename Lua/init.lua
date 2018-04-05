function OpenPreGameMainMenu(mode)
	ResetGameSession()
	local savegame_count = WaitCountSaveGames()
	local dlg = OpenXDialog("PGMainMenu", nil, {savegame_count = savegame_count})
	if dlg and mode then
		dlg:SetMode(mode)
	end
end

function ResetGameSession()
	CloseAllDialogs()
	if GetMap() ~= "" then
		if mapdata.GameLogic then
			TelemetryEndSession("main_menu")
		end
		ChangeMap("")
	end
	StopRadioStation()
	SetMusicPlaylist("MainTheme")
end

if Platform.desktop and not Platform.steam and not Platform.gog then

function AsyncAchievementUnlock(xplayer, achievement)
	Msg("AchievementUnlocked", 0, achievement)
end

end -- Platform.desktop and not Platform.steam and not Platform.gog

function CanUnlockAchievement(xplayer, achievement)
	return true
end