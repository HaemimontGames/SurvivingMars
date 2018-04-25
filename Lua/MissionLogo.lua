----- ModItemMissionLogoPreset

local function folder_fn(obj)
	return {
		{ obj.mod.path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineModItemPreset("MissionLogoPreset", {
	properties = {
		{ category = "General", id = "image", name = T{3794, "Image"}, editor = "browse", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
	},
	EditorName = "Mission Logo",
})

function ReloadMissionLogos()
	local logos = Presets.MissionLogoPreset and Presets.MissionLogoPreset.Default
	if logos then
		table.sort(logos, function (a, b)
			local k1, k2 = a.SortKey, b.SortKey
			if not k1 and k2 then
				return false --items with no SortKey go last
			elseif k1 and not k2 then
				return true --items with no SortKey go last
			elseif k1 ~= k2 then
				return k1 < k2
			end
			return a.id < b.id
		end)
		MissionParams.idMissionLogo.items = logos
	end
end

function ModItemMissionLogoPreset:OnEditorSetProperty(prop_id, old_value, ged)
	ModItemDataInstance.OnEditorSetProperty(self, prop_id, old_value, ged)
	if prop_id == "decal_entity" then
		self.entity_name = self.decal_entity
	end
	ReloadMissionLogos()
end

function ModItemMissionLogoPreset:TestModItem(ged)
	self:OnModLoad()
	WaitDelayedLoadEntities()
	Msg("BinAssetsLoaded")
	
	if GetMap() == "" then
		ModLog(T{1000066, "Entity testing only possible when a map is loaded"})
		return
	end
	
	g_CurrentMissionParams.idMissionLogo = self.id
	local obj = PlaceBuilding("DroneHub")
	obj:SetPos(GetTerrainCursorXY(UIL.GetScreenSize()/2))
	ViewObjectRTS(obj)
end

OnMsg.DataLoaded = ReloadMissionLogos
OnMsg.ModsLoaded = ReloadMissionLogos

DefineClass.Logo = {
	__parents = { "Object", "UIAttach" },
	class_flags = { cfDecal = true, cfConstructible = false, cfAudible = false },
	enum_flags = { efSelectable = false, efShadow = false, efSunShadow = false },
}

function Logo:Init()
	local logos = Presets.MissionLogoPreset.Default
	local data = logos[g_CurrentMissionParams.idMissionLogo] or logos[1]
	if data then
		self:ChangeEntity(data.entity_name)
	end
end

------------------------------------------------------------

DefineClass.ModItemMissionLogo = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "entity_name",  name = T{1000048, "Entity Name"},  		editor = "text", default = "" },
		{ category = "General", id = "decal_entity",	name = T{1160, "Decal Mod Entity"},	editor = "combo", default = "", items = function() return GetModEntities("decal") end },
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 		editor = "text", default = "", translate = true },
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self", default = function() return true end },
		{ category = "General", id = "image", name = T{3794, "Image"}, editor = "browse", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
	},
	EditorName = "",
}

function ModItemMissionLogo:OnModLoad()
	local mod = self.mod
	local new = ModItemMissionLogoPreset:new{
		id = self.name,
		SortKey = 100000, --put those initially after our logos
		entity_name = self.entity_name,
		decal_entity = self.decal_entity,
		display_name = self.display_name,
		filter = self.filter,
		image = self.image,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end