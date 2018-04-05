DefineDataInstance("MissionLogo",
	{
		{ category = "General", id = "entity_name",  name = T{1000048, "Entity Name"},  		editor = "text", default = "" },
		{ category = "General", id = "decal_entity",	name = T{1160, "Decal Mod Entity"},	editor = "combo", default = "", items = function() return GetModEntities("decal") end },
		{ category = "General", id = "image", 			name = T{1161, "UI File"}, 				editor = "text", default = "" },
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 		editor = "text", default = "", translate = true },
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self"},
	}, 
	"[203]Editors/[01]Mars/Mission Logo Editor"
)

MissionLogo.effect = ""
MissionLogo.rollover_text = false
MissionLogo.enabled = false
MissionLogo.challenge_mod = 0

function MissionLogo:filter()
	return true
end

----- MissionLogoModItem

local function folder_fn(obj)
	return {
		{ obj.mod.path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineModItemDataInstance("MissionLogo", {
	properties = {
		{ category = "General", id = "image", name = T{3794, "Image"}, editor = "browse", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
	},
})

function ReloadMissionLogos()
	local items = {}
	for _, v in ipairs(DataInstances.MissionLogo or empty_table) do
		if DataInstances.MissionLogo[v.name] == v then
			items[#items+1] = v
		end
	end
	MissionParams.idMissionLogo.items = items
end

function ModItemMissionLogo:OnEditorSetProperty(prop_id, old_value, ged)
	ModItemDataInstance.OnEditorSetProperty(self, prop_id, old_value, ged)
	if prop_id == "decal_entity" then
		self.entity_name = self.decal_entity
	end
	ReloadMissionLogos()
end

function ModItemMissionLogo:TestModItem(ged)
	self:OnModLoad()
	WaitDelayedLoadEntities()
	Msg("BinAssetsLoaded")
	
	if GetMap() == "" then
		ModLog(T{1000066, "Entity testing only possible when a map is loaded"})
		return
	end
	
	g_CurrentMissionParams.idMissionLogo = self.name
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
	local data = DataInstances.MissionLogo[g_CurrentMissionParams.idMissionLogo] or DataInstances.MissionLogo[1]
	if data then
		self:ChangeEntity(data.entity_name)
	end
end

