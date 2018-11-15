----- ModItemMissionLogoPreset

local function folder_fn(obj)
	return {
		{ obj.mod.content_path, os_path = true },
	}
end

DefineModItemPreset("MissionLogoPreset", {
	properties = {
		{ category = "General", id = "image", name = T{3794, "Image"}, editor = "browse", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.png" },
	},
	EditorName = "Mission Logo",
})

function ReloadMissionLogos()
	local logos = Presets.MissionLogoPreset and Presets.MissionLogoPreset.Default
	if logos then
		MissionParams.idMissionLogo.items = {}
		ForEachPreset("MissionLogoPreset", function(preset, group, items) items[#items + 1] = preset end, MissionParams.idMissionLogo.items)
	end
end

function ModItemMissionLogoPreset:OnEditorSetProperty(prop_id, old_value, ged)
	ModItemDataInstance.OnEditorSetProperty(self, prop_id, old_value, ged)
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

function GetDefaultMissionSponsorLogo(sponsor_id)
	local sponsor_preset = Presets.MissionSponsorPreset and Presets.MissionSponsorPreset.Default[sponsor_id]
	if sponsor_preset and Presets.MissionLogoPreset and Presets.MissionLogoPreset.Default[sponsor_preset.default_logo] then
		return sponsor_preset.default_logo
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
	EditorMenubarName = "",
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