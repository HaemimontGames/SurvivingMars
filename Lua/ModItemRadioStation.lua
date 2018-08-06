DefineModItemPreset("RadioStationPreset")
ModItemRadioStationPreset.EditorName = "RadioStation"
ModItemRadioStationPreset.tracks = false

function ModItemRadioStationPreset:GetTracksFolder()
	return self.mod.content_path .. self.folder
end

function ModItemRadioStationPreset:OnModLoad()
	ModItemPreset.OnModLoad(self)

	local folder = self:GetTracksFolder()
	local tracks = { }
	if io.exists(folder) then
		local err
		err, tracks = AsyncListFiles(folder, "*.opus")
		if err then
			ModLog(T{10377, "Failed to load tracks for radio <radio>: <err>", radio = Untranslated(self.name), err = Untraslated(err)})
		end
	end
	
	for i=1,#tracks do
		tracks[i] = string.sub(tracks[i], 1, -6)
	end
	table.sort(tracks)
	
	self.tracks = tracks
end

function ModItemRadioStationPreset:TestModItem()
	StartRadioStation(self.id)
end
