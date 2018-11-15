--[[function RadioStation:play()
	local station = {}
	station.SilenceDuration = self.silence * 1000
	PlaylistAddTracks(station, self:GetTracksFolder())
	Playlists.Radio = station
	SetMusicPlaylist("Radio")
end]]

function PlayTrack(track_list, index, silence)
	local track = track_list[index]
	index = 1 + index % Max(#track_list, 1)
	if track then
		if type(track) == "table" then
			track = track[1 + AsyncRand(#table)]
		end
		Music:PlayTrack({ path = track })
		WaitMsg("MusicTrackEnded", 30*60*1000)
		Sleep(silence)
	end
	return index
end

function PlayTracks(count, track_list, index, silence)
	for i = 1, count do
		index = PlayTrack(track_list, index, silence)
	end
	return index
end

local function RadioStationDefaultPlay(station)
	local blurbs = {}
	local talks = {}
	local commercials = {}
	local music = {}
	-- list
	local err, files = AsyncListFiles(station:GetTracksFolder(), "*")
	table.sort(files)
	local max_blurb, max_talk = 0, 0
	for _, file in ipairs(files) do
		file = file:match("^(.+)%.[^%.]*$") or ""
		local index, variant = file:match("_(%d+)_(%d+)")
		if variant then
			variant = tonumber(variant)
			index = tonumber(index)
			if file:find("_Blurb_", 1, true) then
				max_blurb = Max(max_blurb, index)
				blurbs[index] = blurbs[index] or {}
				blurbs[index][variant] = file
			elseif file:find("_Talks_", 1, true) then
				max_talk = Max(max_talk, index)
				talks[index] = talks[index] or {}
				talks[index][variant] = file
			end
			file = ""
		else
			if file:find("_Commercials_", 1, true) then
				commercials[#commercials + 1] = file
			else
				music[#music + 1] = file
			end
		end
	end
	-- compact
	for i = 1, max_blurb do
		if not blurbs[i] then table.remove(blurbs, i) end
	end
	for i = 1, max_talk do
		if not talks[i] then table.remove(talks, i) end
	end
	-- permute
	table.permute(music)
	table.permute(commercials)
	table.permute(talks)
	
	PlayFX("RadioStationStarting")
	
	local blurb_index = 1
	local commercial_index = 1
	local talk_index = 1
	local music_index = 1
	while true do
		music_index = PlayTracks(1 + AsyncRand(3), music, music_index, station.silence * 1000)
		blurb_index = PlayTrack(blurbs, blurb_index, 500)
		commercial_index = PlayTracks(AsyncRand(3), commercials, commercial_index, 500)
		music_index = PlayTracks(1 + AsyncRand(2), music, music_index, station.silence * 1000)
		talk_index = PlayTrack(talks, talk_index, 500)
		music_index = PlayTracks(2 + AsyncRand(1), music, music_index, station.silence * 1000)
		blurb_index = PlayTrack(blurbs, blurb_index, 500)
		commercial_index = PlayTracks(AsyncRand(3), commercials, commercial_index, 500)
		Sleep(1000)
	end
end


function GetRadioStations()
	local radio_stations = RadioStationPresets or empty_table
	local stations_list = { Playlists.NoRadio, Playlists.SurvivingMars }
	for _, radio in pairs(radio_stations) do
		if radio.id ~= "SurvivingMars" and radio.id ~= "NoRadio" then
			stations_list[#stations_list + 1] = radio
		end
	end
	TSort(stations_list, "display_name")
	return table.append({
		radio_stations.NoRadio,
		radio_stations.SurvivingMars,
	}, stations_list)
end

if FirstLoad then
	ActiveRadioStation = false
	ActiveRadioStationThread = false
end

function StartRadioStation(station)
	station = station or false
	if ActiveRadioStation ~= station and mapdata.GameLogic then
		EndRadioSession(ActiveRadioStation)
		ActiveRadioStation = station
		DeleteThread(ActiveRadioStationThread)
		ActiveRadioStationThread = CreateRealTimeThread(function()
			SetMusicPlaylist("")
			MusicPlayTrack(false, true)
			ObjModified(Music)
			local station = RadioStationPresets[station]
			if not station then
				station = RadioStationPresets.NoRadio
			end
			if station then
				local play_func = station.play or RadioStationDefaultPlay
				play_func(station)
			end
			ActiveRadioStationThread = false
		end)
	end
end

function StopRadioStation()
	ActiveRadioStation = false
	DeleteThread(ActiveRadioStationThread)
	ActiveRadioStationThread = false
end

function OnMsg.LoadGame()
	StartRadioStation(AccountStorage and AccountStorage.Options and AccountStorage.Options.RadioStation or "SurvivingMars")
end

function OnMsg.NewMapLoaded()
	StartRadioStation(AccountStorage and AccountStorage.Options and AccountStorage.Options.RadioStation or "SurvivingMars")
end

function OnMsg.ClassesBuilt()
	CreateRealTimeThread( function()
		WaitMount()
		Playlists.MainTheme = {{ path = "Music/MainTheme", frequency = 100 }, SilenceDuration = 5000 }
	end)
end


------------------------------------------------------------

DefineClass.ModItemRadioStation = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, editor = "text", default = "", translate = true },
		{ category = "General", id = "folder", name = T{3593, "Folder"}, editor = "text", default = "" },
		{ category = "General", id = "silence", name = T{3594, "Silence between tracks (sec)"}, default = DefaultMusicSilenceDuration / 1000, editor = "number" },
		{ category = "General", id = "play", name = T{7905, "Play"}, editor = "func", default = false },
	},
	EditorMenubarName = "",
}

function ModItemRadioStation:OnModLoad()
	local mod = self.mod
	local new = ModItemRadioStationPreset:new{
		id = self.name,
		SortKey = 100000,
		display_name = self.display_name,
		folder = self.folder,
		silence = self.silence,
		play = self.play,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end
