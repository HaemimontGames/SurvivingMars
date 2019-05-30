function OnMsg.DataLoaded()
	local class_names = ClassDescendantsList("MapSettings")
	for i = 1, #class_names do
		local class = class_names[i]
		local entry = table.find_value(MapDataPreset.properties, "id", class)
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
		table.iappend(MapDataClass.properties, {
			{ category = "Game", id = class, editor = "dropdownlist", default = "default", items = function() return DataInstanceCombo(class, "{name}") end, },
		})
	end
	setmetatable(MapDataClass.properties, meta)
end
--]]

MapDataPreset.MinimapActiveArea = box(0,0,-1,-1)
MapDataPreset.MinimapSize = point(0, 0)

local oldSaveMapData = MapDataPreset.SaveMapData
function MapDataPreset:SaveMapData(folder)
	if not folder then
		-- precalc minimap size bounding box
		local minimap_image = mapdata.IsRandomMap and "memoryscreenshot/minimap.tga" or (CurrentMapFolder .. "minimap.tga")
		self.MinimapActiveArea = GetTextureBoundingBox(minimap_image, 100)
		self.MinimapSize = point(UIL.MeasureImage(minimap_image))
	end
	oldSaveMapData(self, folder)
end
