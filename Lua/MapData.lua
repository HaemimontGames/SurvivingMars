table.append(MapDataClass.properties, {
	{ category = "Game", id = "AverageTemperature",     editor = "number", default = -55, },
	{ category = "Game", id = "MapSettings_DustStorm",  editor = "dropdownlist", default = "DustStorm_VeryLow", items = false},
	{ category = "Game", id = "MapSettings_DustDevils", editor = "dropdownlist", default = "DustDevils_VeryLow", items = false},
	{ category = "Game", id = "MapSettings_Meteor",     editor = "dropdownlist", default = "Meteor_VeryLow", items = false},
	{ category = "Game", id = "MapSettings_ColdWave",   editor = "dropdownlist", default = "ColdWave_VeryLow", items = false},
	{ category = "Game", id = "resupply_preset",        editor = "dropdownlist", default = "default", items = function() return GetResupplyPresetsCombo() end },
	
	{ category = "Prefab", id = "weight",               editor = "number",       default = 100,           min = 0 },
	{ category = "Prefab", id = "challenge_rating",     editor = "number",       default = 0,              },
	{ category = "Prefab", id = "map_location",         editor = "prop table",        default = false,         indent = ' '},
	{ category = "Prefab", id = "map_altitude",         editor = "range",        default = range(0, 255), min = 0, max = 255, },
	{ category = "Prefab", id = "type_info",            editor = "prop table",        default = false,         read_only = true },
	{ category = "Prefab", id = "terrain_hash",         editor = "number",       default = false,         read_only = true },
	
	{ category = "Dev", id = "StartMystery", editor = "bool",         default = false, },
	{ category = "Dev", id = "DisableHints", editor = "bool",         default = false, },
	{ category = "Dev", id = "TechState",    editor = "prop table",        default = false, indent = ' ' },
})

function OnMsg.DataLoaded()
	local class_names = ClassDescendantsList("MapSettings")
	for i = 1, #class_names do
		local class = class_names[i]
		local entry = table.find_value(MapDataClass.properties, "id", class)
		if entry then
			entry.items = function() return DataInstanceCombo(class, "{name}", "disabled") end
		end
	end
end


--[[
function OnMsg.DataLoaded()
	local class_names = ClassDescendantsList("MapSettings")
	if #class_names == 0 then
		return
	end
	
	local meta = getmetatable(MapDataClass.properties)
	setmetatable(MapDataClass.properties, {})
	for i = 1, #class_names do
		local class = class_names[i]
		table.append(MapDataClass.properties, {
			{ category = "Game", id = class, editor = "dropdownlist", default = "default", items = function() return DataInstanceCombo(class, "{name}") end, },
		})
	end
	setmetatable(MapDataClass.properties, meta)
end
--]]

MapDataClass.MinimapActiveArea = box(0,0,-1,-1)
MapDataClass.MinimapSize = point(0, 0)

local oldSaveMapData = MapDataClass.SaveMapData
function MapDataClass:SaveMapData(folder)
	if not folder then
		-- precalc minimap size bounding box
		local minimap_image = mapdata.IsRandomMap and "memoryscreenshot/minimap.tga" or (CurrentMapFolder .. "minimap.tga")
		self.MinimapActiveArea = GetTextureBoundingBox(minimap_image, 100)	
		self.MinimapSize = point(UIL.MeasureImage(minimap_image))
	end
	oldSaveMapData(self, folder)
end
