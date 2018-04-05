DefineDataInstance("RadioStation", {
	{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, editor = "text", default = "", translate = true },
	{ category = "General", id = "folder", name = T{3593, "Folder"}, editor = "text", default = "" },
	{ category = "General", id = "silence", name = T{3594, "Silence between tracks (sec)"}, default = DefaultMusicSilenceDuration / 1000, editor = "number" },
	{ category = "General", id = "play", name = T{7905, "Play"}, editor = "func" },
	{ category = "General", id = "dlc", name = T{3895, "Required DLC"}, editor = "dropdownlist", items = DlcCombo(), default = "", }
}, "[203]Editors/[01]Mars/Radio Station Editor" )

DefineModItemDataInstance("RadioStation", { properties = { { id = "dlc", default = "", no_edit = true } } })

function RadioStation:GetTracksFolder()
	return self.folder
end

function ModItemRadioStation:GetTracksFolder()
	return ConvertToOSPath(self.mod.path .. self.folder)
end

function ModItemRadioStation:TestModItem()
	StartRadioStation(self.name)
end

--[[function RadioStation:play()
	local station = {}
	station.SilenceDuration = self.silence * 1000
	PlaylistAddTracks(station, self:GetTracksFolder())
	Playlists.Radio = station
	SetMusicPlaylist("Radio")
end]]

local function PlayTrack(track_list, index, silence)
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

local function PlayTracks(count, track_list, index, silence)
	for i = 1, count do
		index = PlayTrack(track_list, index, silence)
	end
	return index
end

function RadioStation:play()
	local blurbs = {}
	local talks = {}
	local commercials = {}
	local music = {}
	-- list
	local err, files = AsyncListFiles(self:GetTracksFolder(), "*")
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
		music_index = PlayTracks(1 + AsyncRand(3), music, music_index, self.silence * 1000)
		blurb_index = PlayTrack(blurbs, blurb_index, 500)
		commercial_index = PlayTracks(AsyncRand(3), commercials, commercial_index, 500)
		music_index = PlayTracks(1 + AsyncRand(2), music, music_index, self.silence * 1000)
		talk_index = PlayTrack(talks, talk_index, 500)
		music_index = PlayTracks(2 + AsyncRand(1), music, music_index, self.silence * 1000)
		blurb_index = PlayTrack(blurbs, blurb_index, 500)
		commercial_index = PlayTracks(AsyncRand(3), commercials, commercial_index, 500)
		Sleep(1000)
	end
end

function GetRadioStations()
	local radio_stations = DataInstances.RadioStation or empty_table
	local stations_list = { Playlists.NoRadio, Playlists.SurvivingMars }
	for _, radio in ipairs(radio_stations) do
		if radio.name ~= "SurvivingMars" and radio.name ~= "NoRadio" and IsDlcAvailable(radio.dlc) then
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
			local station = DataInstances.RadioStation[station]
			if not station or not IsDlcAvailable(station.dlc) then
				station = DataInstances.RadioStation.NoRadio
			end
			if station then
				station:play()
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

