InitDoneMethods[#InitDoneMethods + 1] = "BuildingUpdate"
RecursiveCallOrder.BuildingUpdate = true
InitDoneMethods[#InitDoneMethods + 1] = "BuildingDailyUpdate"

AutoResolveMethods.GatherConstructionStatuses = true
AutoResolveMethods.GetWorkNotPossibleReason = "or"
AutoResolveMethods.GetWorkNotPermittedReason = "or"
AutoResolveMethods.UpdateAttachedSigns = true
AutoResolveMethods.OnSetWorking = true
AutoResolveMethods.MoveInside = true
AutoResolveMethods.OnDestroyed = true
AutoResolveMethods.SetSupply = true
AutoResolveMethods.SetPriority = true
AutoResolveMethods.ShouldShowNotConnectedToGridSign = "or"
AutoResolveMethods.IsSuitable = "and"

BuildCategories = {
	{ id = "Infrastructure", name = T{78, "Infrastructure"},              img = "UI/Icons/bmc_infrastructure.tga",     highlight_img = "UI/Icons/bmc_infrastructure_shine.tga" },
	{ id = "Power",          name = T{79, "Power"},                       img = "UI/Icons/bmc_power.tga",              highlight_img = "UI/Icons/bmc_power_shine.tga" },
	{ id = "Production",     name = T{80, "Production"},                  img = "UI/Icons/bmc_building_resources.tga", highlight_img = "UI/Icons/bmc_building_resources_shine.tga" },
	{ id = "Life-Support",   name = T{81, "Life Support"},                img = "UI/Icons/bmc_life_support.tga",       highlight_img = "UI/Icons/bmc_life_support_shine.tga" },
	{ id = "Storages",       name = T{82, "Storages"},                    img = "UI/Icons/bmc_building_storages.tga",  highlight_img = "UI/Icons/bmc_building_storages_shine.tga" },
	{ id = "Domes",          name = T{83, "Domes"},                       img = "UI/Icons/bmc_domes.tga",              highlight_img = "UI/Icons/bmc_domes_shine.tga" },
	{ id = "Habitats",       name = T{84, "Homes, Education & Research"}, img = "UI/Icons/bmc_habitats.tga",           highlight_img = "UI/Icons/bmc_habitats_shine.tga" },	
	{ id = "Dome Services",  name = T{85, "Dome Services"},               img = "UI/Icons/bmc_dome_buildings.tga",     highlight_img = "UI/Icons/bmc_dome_buildings_shine.tga" },
	{ id = "Dome Spires",    name = T{86, "Dome Spires"},                 img = "UI/Icons/bmc_dome_spires.tga",        highlight_img = "UI/Icons/bmc_dome_spires_shine.tga" },
	{ id = "Decorations",    name = T{87, "Decorations"},                 img = "UI/Icons/bmc_decorations.tga",        highlight_img = "UI/Icons/bmc_decorations_shine.tga" },
	{ id = "Wonders",        name = T{88, "Wonders"},                     img = "UI/Icons/bmc_wonders.tga",            highlight_img = "UI/Icons/bmc_wonders_shine.tga" },
	{ id = "Hidden",         name = T{1000155, "Hidden"},                 img = "UI/Icons/bmc_placeholder.tga",        highlight_img = "UI/Icons/bmc_placeholder_shine.tga" },
}

invalid_entity = "Hex1_Placeholder"

function GetBuildCategoryIds()
	local ids = {}
	for i = 1, #BuildCategories do
		ids[#ids + 1] = BuildCategories[i].id
	end
	return ids
end

function BuildingClassesCombo()
	local list = ClassDescendantsList("Building")
	table.insert(list, 1, "")
	return list
end

function BuildingFromGotoTarget(target)
	return target
end

----------------------------------------

--[[@@@
@class Building
Building is the base template class associated with [building templates](ModItemBuildingTemplate.md.html). The template must define a template class type which is then the type of the object that would be instantiated when a template object is created. Specifically, for [building templates](ModItemBuildingTemplate.md.html) this class type may be Building or any Building derived class. The template class should implement all possible functionality of the template object, while the template itself defines its initialization properties.

The Building class is the base template functionality for all buildings in the game and holds a large part of the common functionality of all buildings. A large part of it comes from its parents, so consider examining them to glimpse further into what is readily available in it.

Notable children: [ElectricityProducer](LuaFunctionDoc_ElectricityProducer.md.html), [ElectricityConsumer](LuaFunctionDoc_ElectricityConsumer.md.html), [ElectricityStorage](LuaFunctionDoc_ElectricityStorage.md.html), [WaterProducer](LuaFunctionDoc_WaterProducer.md.html), [AirProducer](LuaFunctionDoc_AirProducer.md.html), [LifeSupportConsumer](LuaFunctionDoc_LifeSupportConsumer.md.html), [AirStorage](LuaFunctionDoc_AirStorage.md.html), [WaterStorage](LuaFunctionDoc_WaterStorage.md.html), [StorageWithIndicator](LuaFunctionDoc_StorageWithIndicator.md.html).

All buildings have a working state represented in the "working" bool member. Don't confuse with "ui_working" which is the state of the infopanel working button. There are two major groups of reasons to prevent a building from working. The IsWorkPossible checks if the game rules allow for the building to work. For example, for a building that is currently not supplied with electricity, but requires it, IsWorkPossible would return false. The IsWorkPermitted function returns the state of the second major group of reasons that prevent a building from working - user interaction. If the user forbids the building from working in any way this function should return false. For example, the infopanel button to stop a building from working is associated with IsWorkPermitted. There can be miriads of reasons for a building to not work, the reasons can be polled with GetNotWorkingReason which returns a humanly readable (not localized) string. The family of functions dealing with the working state of a building can be found in the [BaseBuilding](LuaFunctionDoc_BaseBuilding.md.html).

Buildings can have up to three upgrades aquired and applied throughout the game session. The relevant properties needed to define them on per [building template](ModItemBuildingTemplate.md.html) basis are located in the [UpgradableBuilding](LuaFunctionDoc_UpgradableBuilding.md.html) parent class, and can be used directly in a template definition to spec upgrades. Functions dealing with upgrades are located in the Building class.
--]]
DefineClass.Building = {
	__parents = { "ClassTemplateObject", "Shapeshifter", "BaseBuilding", "TaskRequester", "AutoAttachObject", "GridObject", "PinnableObject", "Constructable", "CityObject", "UpgradableBuilding", "ComponentCustomData", "NightLightObject", "Demolishable", "WaypointsObj", "RequiresMaintenance", "HasConsumption", "SkinChangeable", "InfopanelObj", "ColorizableObject", "Renamable" },
	game_flags = { gofPermanent = true, gofTemporalConstructionBlock = true },
	enum_flags = { efBuilding = true, },
	__hierarchy_cache = true,
	
	UpdateConsumption = BaseBuilding.UpdateConsumption,
	
	properties = {
		{ template = true, name = T{1000067, "Display Name"},     id = "display_name",      category = "General",  editor = "text",         default = "", translate = true, },
		{ template = true, name = T{151, "Display Name (pl)"},    id = "display_name_pl",   category = "General",  editor = "text",         default = "", translate = true, },
		{ template = true, name = T{1000017, "Description"},      id = "description",       category = "General",  editor = "text",         default = "", translate = true, },
		
		{ template = true, name = T{152, "Build Menu Category"},  id = "build_category",    category = "General",  editor = "dropdownlist", default = "", items = GetBuildCategoryIds, },
		{ template = true, name = T{153, "Build Menu Icon"},      id = "display_icon",      category = "General",  editor = "browse",       default = "", folder = "UI" },
		{ template = true, name = T{154, "Build Menu Pos"},       id = "build_pos",         category = "General",  editor = "number",       default = 1, },
		{ template = true, name = T{155, "Entity"},               id = "entity",            category = "General",  editor = "dropdownlist", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end},
		--
		{ template = true, name = T{156, "Dome Comfort"},         id = "dome_comfort",      category = "General",  editor = "number",       default = 0 , scale = "Stat", modifiable = true },
		{ template = true, name = T{158, "Show Range for All"},   id = "show_range_all", 	 category = "General",  editor = "bool",         default = false, help = "Show range radii for all buildings of that class when selected" },
		{ template = true, name = T{7331, "Infopanel"},           id = "ip_template", 	    category = "General",  editor = "text",         default = "ipBuilding", help = "Template used for building infopanel" },
		{ template = true, name = T{8697, "Suspend on Dust Storm"},     id = "suspend_on_dust_storm", category = "General",  editor = "bool",         default = false },
		
		--
		{ template = true, name = T{159, "Exclude From Encyclopedia"},    id = "encyclopedia_exclude", category = "Encyclopedia",  editor = "bool",default = false, },
		{ template = true, name = T{160, "Encyclopedia Text"},    id = "encyclopedia_text", category = "Encyclopedia",  editor = "multi_line_text",default = "", translate = true, },
		{ template = true, name = T{161, "Encyclopedia Image"},   id = "encyclopedia_image",category = "Encyclopedia",  editor = "browse",       default = "", folder = "UI" },
		--
		{ template = true, name = T{7615, "Build Shortcut"},    id = "build_shortcut1", category = "Shortcuts",  editor = "text",default = "", },
		{ template = true, name = T{7616, "Build Shortcut 2"},    id = "build_shortcut2", category = "Shortcuts",  editor = "text",default = "", },
		{ template = true, name = T{7617, "Gamepad Shortcut"},    id = "build_shortcut_gamepad", category = "Shortcuts",  editor = "text",default = "", },
		--
		{ template = true, name = T{162, "Alternative Entity 2"}, id = "entity2", category = "Alternative Entities",  editor = "dropdownlist", default = "", items = function() return GetBuildingEntities("") end},
		{ template = true, name = T{8515, "Alternative Entity 2 DLC"}, id = "entitydlc2", category = "Alternative Entities",  editor = "text", default = "", },
		{ template = true, name = T{163, "Alternative Entity 3"}, id = "entity3", category = "Alternative Entities",  editor = "dropdownlist", default = "", items = function() return GetBuildingEntities("") end},
		{ template = true, name = T{8516, "Alternative Entity 3 DLC"}, id = "entitydlc3", category = "Alternative Entities",  editor = "text", default = "", },
		{ template = true, name = T{164, "Alternative Entity 4"}, id = "entity4", category = "Alternative Entities",  editor = "dropdownlist", default = "", items = function() return GetBuildingEntities("") end},
		{ template = true, name = T{8517, "Alternative Entity 4 DLC"}, id = "entitydlc4", category = "Alternative Entities",  editor = "text", default = "", },
		{ template = true, name = T{165, "Alternative Entity 5"}, id = "entity5", category = "Alternative Entities",  editor = "dropdownlist", default = "", items = function() return GetBuildingEntities("") end},
		{ template = true, name = T{8518, "Alternative Entity 5 DLC"}, id = "entitydlc5", category = "Alternative Entities",  editor = "text", default = "", },
		{ template = true, name = T{166, "Alternative Entity 6"}, id = "entity6", category = "Alternative Entities",  editor = "dropdownlist", default = "", items = function() return GetBuildingEntities("") end},
		{ template = true, name = T{8519, "Alternative Entity 6 DLC"}, id = "entitydlc6", category = "Alternative Entities",  editor = "text", default = "", },
		--
		{ template = true, name = T{167, "Label 1"},       id = "label1",    category = "Custom Labels",  editor = "text",         default = "" },
		{ template = true, name = T{168, "Label 2"},       id = "label2",    category = "Custom Labels",  editor = "text",         default = "" },
		{ template = true, name = T{169, "Label 3"},       id = "label3",    category = "Custom Labels",  editor = "text",         default = "" },
		--
		{ template = true, name = T{170, "Has On/Off button"},   id = "on_off_button",  category = "UI",  editor = "bool",         default = true },
		{ template = true, name = T{171, "Has Priority button"}, id = "prio_button",    category = "UI",  editor = "bool",         default = true },		
		--
		{ name = T{172, "Priority"},            id = "priority",            category = "General", editor = "number", default = 2, ui = "scrollbar", min = 1, max = const.MaxBuildingPriority },
		{ name = T{173, "Salvage Modifier"},    id = "salvage_modifier",    category = "General", editor = "number", default = 100, ui = "number", min = 0, max = 100, modifiable = true, },
		--
		{ template = true, name = T{174, "Color Modifier"},       id = "color_modifier",    category = "General",  editor = "color",        default = const.clrNoModifier },
		{ 				 name = T{7684, "Palette"},       id = "palette",    category = "General",  editor = "text",        default = "" },
		{ template = true, name = T{7685, "Available Palettes"},       id = "palettes",    category = "General",  editor = "combo", items = PresetsCombo("EntityPalette"),        default = "", buttons = {{"Reapply", "ReapplyAllBuildingPalettes"}} },

		{ template = true, category = "Demolish", name = T{157, "Indestructible"}, 		        id = "indestructible", 	          editor = "bool",   default = false, help = "Specify if the building can be destroyed at all (by demolishing, by explosions, by meteors, etc)."},
		{ template = true, category = "Demolish", name = T{175, "Use demolished state?"},       id = "use_demolished_state",      editor = "bool",   default = true, object_update = true, help = "If true, the building will transofrm into ruins, instead of disappearing after destruction."},
		{ template = true, category = "Demolish", name = T{7332, "Demolish sinking (%)"},       id = "demolish_sinking",          editor = "range",  default = range(15, 30), min = 0, max = 50, help = "Building part sinking into the ground in demolished state. Valid only for buildings without terrain modification surfaces.", no_edit = function(obj) return not obj.use_demolished_state end, },
		{ template = true, category = "Demolish", name = T{7333, "Demolish tilt (deg)"},        id = "demolish_tilt_angle",       editor = "range",  default = range(5*60, 10*60), min = 0, max = 30*60, scale = 60, help = "Building tilt angle in demolished state", no_edit = function(obj) return not obj.use_demolished_state end, },
		{ template = true, category = "Demolish", name = T{7334, "Demolish color"},             id = "demolish_color",            editor = "color",  default = RGB(45, 50, 53), no_edit = function(obj) return not obj.use_demolished_state end, help = "Color modifier for the destroyed building." },
		{ template = true, category = "Demolish", name = T{7335, "Demolish place debris (%)"},  id = "demolish_debris",           editor = "number", default = 70, min = 0, max = 100, slider = true, no_edit = function(obj) return not obj.use_demolished_state end, help = "Percentage of debris left after destruction.",},
		{ template = true, category = "Demolish", name = T{8564, "Return resources"},                 id = "demolish_return_resources", editor = "bool",   default = true, help = "If true, the building will return resources upon destruction.", },
		
		{ template = true, category = "Construction", name = T{176, "Construction Mode"}, id = "construction_mode", editor = "text", default = "construction", help = "The type of construction controller to launch", no_edit = true},
		{ template = true, category = "Construction", name = T{7891, --[[Post-Cert]] "Refund on Salvage"}, id = "refund_on_salvage", editor = "bool", default = true},
		
		{ template = true, category = "General", name = T{8698, "Requires DLC"}, id = "requires_dlc", editor = "combo", default = "", items = DlcCombo(), help = "Hide this building from build menu if dlc is not available."}
	},
	
	update_thread = false,
	building_update_time = const.HourDuration,
	
	gamepad_auto_deselect = true,
	
	creation_time = 0,
	configurable_attaches = {},
	is_tall = false, --diamond inherited.
	
	parent_dome = false,
	default_label = "Building",
	disable_selection = false,
	use_shape_selection = true,
	
	upgrade_modifiers = false,
	upgrade_id_to_modifiers = false, --this one can be safely iterated with pairs without going over the same mods twice.
	upgrades_built = false,
	
	upgrades_under_construction = false, --{ [id] = {id = id, tier = tier, construction_start_ts = , required_time = , reqs[] = } }
	
	construction_cost_at_completion = false, --keeps the amount of resources spent to complete this bld, so we don't have to guess what they were.
	clear_work_request = false,
	
	upgrade_on_off_state = false,
	encyclopedia_id = false,
	demolish_debris_objs = false,
		
	resource_spots = false,
	name = "",
}

function Building:Random(...)
	return CityObject.Random(self, ...)
end

function Building:Init()
	local now = GameTime()
	self:StartUpdateThread(now == 0)
	
	self.creation_time = now
	
	self.upgrade_modifiers = {}
	self.upgrades_built = {}
	self.upgrade_id_to_modifiers = {}
	self.upgrade_on_off_state = {}
	
	self:InitResourceSpots()
end

function Building:InitResourceSpots()
	if self.resource_spots then
		return
	end
	self.resource_spots = {}
	for i=1, 10 do
		self.resource_spots[i] = {"Resourcepile" .. i, 90*60}
	end
	self.resource_spots[#self.resource_spots + 1] = {"Workdrone", 0}
	self.resource_spots[#self.resource_spots + 1] = {"Workrover", 0}	
end

function Building:ApplyToGrids()
	GridObject.ApplyToGrids(self)
	Flight_Mark(self)
end

function Building:RemoveFromGrids()
	GridObject.RemoveFromGrids(self)
	Flight_Unmark(self)
end

function Building:GetIPDescription()
	if self:IsKindOf("Building") and self.destroyed and not self.demolishing and not self.bulldozed then
		return T{597, "The <em>ruins</em> of an abandoned building. Can be <em>cleared</em> for resources, or <em>rebuilt</em>."}
	end
	return T{self.description,self}
end

function Building:GetBuildMenuCategory()
	if self.template_name ~= "" then
		return ClassTemplates.Building[self.template_name] and ClassTemplates.Building[self.template_name].build_category
	elseif self:HasMember("building_class_proto") and self.building_class_proto and self.building_class_proto:HasMember("build_category") then
		return self.building_class_proto.build_category
	end
end

function Building:SetCustomLabels(obj, add)
	local i = 1
	while true do
		if not self:HasMember("label"..i) then break end
		if self["label"..i] ~= "" then
			if add then
				obj:AddToLabel(self["label"..i], self)
			else
				obj:RemoveFromLabel(self["label"..i], self)
			end
		end
		i = i + 1
	end
end

function Building:AddToCityLabels()
	if self.default_label then
		self.city:AddToLabel(self.default_label, self)
	end
	self:SetCustomLabels(self.city, true)
	if self.template_name ~= "" then
		self.city:AddToLabel(self.template_name, self)
	end
	if self.class ~= self.template_name then
		self.city:AddToLabel(self.class, self)
	end
	local category = self:GetBuildMenuCategory()
	if category then
		self.city:AddToLabel(category, self)
	end
	
	if self.default_label == "Building" and not IsKindOf(self, "Dome") then
		self.city:AddToLabel("BuildingNoDomes", self)
	end
end

function Building:GameInit()
	PlayFX("Spawn", "start", self, self:HasMember("building_class_proto") and self.building_class_proto or nil)
	
	local dome = GetDomeAtPoint(self)
	if dome and dome ~= self then
		self:InitInside(dome)
	else
		self:InitOutside()
	end

	if not self:IsKindOf("ConstructionSite") then
		if IsKindOf(self, "ElectricityConsumer") then
			self:SetIsNightLightPossible(false) --init that we have no electricity. needs 2 be after auto attaches, before nightlightenable
		end
		self:NightLightDisable()	
		self:NightLightEnable()	
	end

	self:Notify("UpdateNoCCSign")
	self:Gossip("place", self:GetPos())
end

function Building:Done()
	self:Gossip("done")
	PlayFX("Spawn", "end", self, self:HasMember("building_class_proto") and self.building_class_proto or nil)
	self:KickUnitsFromHolder()
	if self.default_label then
		self.city:RemoveFromLabel(self.default_label, self)
	end
	self:SetCustomLabels(self.city, false)
	if self.template_name ~= "" then
		self.city:RemoveFromLabel(self.template_name, self)
	end
	if self.class ~= self.template_name then
		self.city:RemoveFromLabel(self.class, self)
	end
	local category = self:GetBuildMenuCategory()
	if category then
		self.city:RemoveFromLabel(category, self)
	end
	if self.suspended then
		self.city:RemoveFromLabel("Suspended", self)
	end
	
	if self.default_label == "Building" and not IsKindOf(self, "Dome") then
		self.city:RemoveFromLabel("BuildingNoDomes", self)
	end
	self:StopUpgradeModifiers()	
	if self.parent_dome and IsValid(self.parent_dome) then
		UpdateCoveredGrass(self, self.parent_dome, "clear")
	end
	self:SetDome(false)	
	local objs = self.demolish_debris_objs or ""
	for i=1,#objs do
		local debris = objs[i]
		if IsValid(debris) then
			DoneObject(debris)
		end
	end
	self.demolish_debris_objs = nil
end

function Building:InitInside(dome)
	self:SetDome(dome)
	UpdateCoveredGrass(self, dome, "build")
	self.show_dust_visuals = false --from maintenance, whether to show dust visuals.
	self.accumulate_dust = false
	self:SetDustVisualsPerc(0)
end

function Building:SetSuspended(suspended, reason, duration)
	BaseBuilding.SetSuspended(self, suspended, reason, duration)
	if self.suspended then
		self.city:AddToLabel("Suspended", self)
	else
		self.city:RemoveFromLabel("Suspended", self)
	end
end

function Building:InitOutside()
	self:SetDome(false)
	self.show_dust_visuals = nil
	self.accumulate_dust = nil
end

function Building:MoveInside(dome)
	self:InitInside(dome)
end

function Building:Gossip(gossip, ...)
	if not netAllowGossip then return end
	NetGossip("Building", self.template_name == "" and self.class or self.template_name, self.handle, gossip, GameTime(), ...)
end

function Building:GossipName()
	return (self.template_name == "" and self.class or self.template_name)
end

function Building:GetWorkNotPossibleReason()
	if self.destroyed then
		return "Destroyed"
	end
	if self:IsMalfunctioned() then
		return "Malfunction"
	end
	if not self:CanConsume() then
		return "Consumption"
	end
	if self:IsDemolishing() then
		return "Demolish"
	end	
	return BaseBuilding.GetWorkNotPossibleReason(self)
end

function Building:GetBuildShape()
	return self:GetShapePoints()
end
function Building:GetFlattenShape()
	return self:GetBuildShape()
end

function OnMsg.GatherLabels(labels)
	labels.Building = true
	labels.EntertainmentBuildings = true
	local templates = DataInstances.BuildingTemplate
	for i=1,#templates do
		if templates[i].name then
			labels[templates[i].name] = true
			labels[templates[i].name .. g_ConstructionSiteLabelSuffix] = true
			if templates[i].build_category and not labels[templates[i].build_category] then
				labels[templates[i].build_category] = true
				labels[templates[i].build_category .. g_ConstructionSiteLabelSuffix] = true
			end
		end
		
		local j = 1
		while true do
			local label_id = "label"..j
			local template = templates[i]
			if not template:HasMember(label_id) then break end
			if template[label_id] ~= "" then
				labels[template[label_id]] = true
				labels[template[label_id] .. g_ConstructionSiteLabelSuffix] = true
			end
			j = j + 1
		end
	end
end

function Building:SetDome(dome)
	if self.parent_dome then
		self:StopUpgradeModifiers(self.parent_dome)
		self.parent_dome:RemoveFromLabel("Buildings", self)
		if self.template_name ~= "" then
			self.parent_dome:RemoveFromLabel(self.template_name, self)
		end	
		if self.dome_spot == "Spire" then
			self.parent_dome:RemoveFromLabel("Spire", self)
			self.parent_dome:UpdateSignOffset()
		end
		self:SetCustomLabels(self.parent_dome, false)
		self.parent_dome:UpdateColonists()
	end
	assert(IsKindOf(dome, "Dome") or not dome)
	self.parent_dome = dome or nil
	if dome then
		self:ApplyUpgradeModifiers(dome) --TODO: does this work if modifiers' containers are set @ mod creation?
		self.parent_dome:AddToLabel("Buildings", self)
		if self.template_name ~= "" then
			self.parent_dome:AddToLabel(self.template_name, self)
		end
		if self.dome_spot == "Spire" then
			self.parent_dome:AddToLabel("Spire", self)
			self.parent_dome:UpdateSignOffset()
		end
		self:SetCustomLabels(self.parent_dome, true)
		
		if self.parent_dome.demolishing then
			self.parent_dome:ToggleDemolish()
		end
		self.parent_dome:UpdateColonists()
	end
end

if FirstLoad then
	BuildingPalettes = {}
end

function ReloadBuildingPalettes()
	for template_name, template in pairs(ClassTemplates.Building) do
		if template.palettes ~= "" then
			BuildingPalettes[template_name] = string.split(template.palettes, ",")
		end
	end
end

OnMsg.DataLoaded = ReloadBuildingPalettes

function ReapplyAllBuildingPalettes()
	ReloadBuildingPalettes()
	DelayedCall(100, function()
		ForEach{ class = "Building" , exec = function(obj)
			if obj:IsKindOf("Building") then
				local palettes = BuildingPalettes[obj.template_name]
				if palettes and palettes[1] then
					obj:SetPalette(palettes[1])
				end
			end
		end}
	end)
end

function SetObjectPalette(obj, palette)
	if obj:GetGameFlags(const.gofUIAttach) ~= 0 then return end
	palette:ApplyToObj(obj)
	obj:ForEachAttach("ColorizableObject", SetObjectPalette, palette)
end

function Building:SetPalette(palette)
	self.palette = palette
	palette = EntityPalettes[palette]
	if palette then
		SetObjectPalette(self, palette)
	end
end

function Building:Settemplate_name(template_name, params)
	ClassTemplateObject.Settemplate_name(self, template_name)
	if not self.encyclopedia_id or self.encyclopedia_id == "" then
		self.encyclopedia_id = template_name
	end
	local entity = params and params.alternative_entity or self.entity
	self:ChangeEntity(entity)
	AutoAttachObjectsToShapeshifter(self)
	local palettes = BuildingPalettes[template_name] 
	if palettes and palettes[1] and EntityPalettes[palettes[1]] then
		self:SetPalette(palettes[1])
	end
	self:AttachConfigurableAttaches()
	self:InitMaintenanceRequests()
	self:InitConsumptionRequest()
end

function Building:GetSkins(ignore_destroyed_state)
	if ignore_destroyed_state or not self.destroyed then
		local skins = GetBuildingSkins(self.template_name)
		if next(skins) then
			return skins
		end
	end
	return false
end

function AttachAttaches(obj, attaches)
	for _, entry in ipairs(attaches or empty_table) do
		local spot, class = entry[2], entry[1]
		local first, last = obj:GetSpotRange(spot)
		for i = first, last do
			local attach = PlaceObject(class)
			obj:Attach(attach, i)
		end
	end
end

function Building:AttachConfigurableAttaches(attaches) --use for override
	AttachAttaches(self, attaches or self.configurable_attaches)
end

function Building:StartUpdateThread(randomize_tick)
	if not self.building_update_time then return end
	self.update_thread = CreateGameTimeThread(function(self, randomize_tick)
		if randomize_tick then
			Sleep( InteractionRand(max_int, "randomize_tick") % self.building_update_time + 1)
		end
		local last_day
		local city = self.city
		local delta = 0
		while IsValid(self) do
			local day = city.day
			self:RecursiveCall(true, "BuildingUpdate", delta, day, city.hour) --parents first
			if IsValid(self) and last_day ~= day then
				last_day = day
				self:RecursiveCall(true, "BuildingDailyUpdate", day)
			end
			delta = self.building_update_time
			Sleep(delta)
		end
	end, self, randomize_tick)
end

function Building:ThrowDust()
end

function Building:BuildingUpdate(delta, day, hour)
	self:ThrowDust()
	
	if self.upgrades_under_construction and self.working then
		self:UpdateUpgradeConstruction()
	end
end

function Building:IsOutsideCommandRange(ignore_cg)
	for _, cc in ipairs(self.command_centers or empty_table) do
		if cc.working then return false end
	end
	return true
end

function Building:ShouldShowNoCCSign()
	if not self:DoesHaveConsumption() and not self:DoesRequireMaintenance() 
		and (not IsKindOfClasses(self, "StorageDepot", "ConstructionSite") or IsKindOfClasses(self, "SupplyRocket")) then
		return false
	end
	
	return self:IsOutsideCommandRange()
end

function Building:UpdateNoCCSign()
	local show = self:ShouldShowNoCCSign()
	if show then
		self:AttachSign(true, "SignNoCommandCenter")
	else
		self:AttachSign(false, "SignNoCommandCenter")
	end
end

function Building:OnAddedByControl(...)
	Building.UpdateNoCCSign(self, ...)
end

function Building:OnRemovedByControl(...)
	Building.UpdateNoCCSign(self, ...)
end

function Building:OnCommandCenterWorkingChanged(...)
	Building.UpdateNoCCSign(self, ...)
end

function Building:BuildingDailyUpdate(day)	
end

function Building:OnSetDemolishing(is_demolishing)
	self:UpdateWorking()
	self:AttachSign(is_demolishing, "SignSalvaged")
	if is_demolishing then
		self:StopAllUpgradeConstruction()
		self:InterruptUnitsInHolder()
	end
	self:UpdateConsumption()
end

function Building:InterruptUnitsInHolder()
	for _, unit in ipairs(self.units or empty_table) do
		unit:InterruptVisit()
	end
end

function Building:OnDemolish()
	self:Destroy()
	if self.demolish_return_resources then
		self:ReturnResources()	
	end
end

function Building:CanDemolish()
	return self.can_demolish and not self.destroyed and not self.indestructible
end

function Building:AddRefundResource(tbl, res, amnt)
	if amnt <= 0 then
		return
	end
	local idx = table.find(tbl, "resource", res)
	if not idx then
		tbl[#tbl + 1] = { resource = res, amount = amnt }
	else
		tbl[idx].amount = tbl[idx].amount + amnt
	end
end

function Building:GetRefundResources()
	local refund = {}
	
	if not self.refund_on_salvage then return refund end
	
	if self.construction_cost_at_completion then
		for r_n, amount in pairs(self.construction_cost_at_completion) do
			local refund_amount = self:CalcRefundAmount(amount)
			self:AddRefundResource(refund, r_n, refund_amount)
		end
	else
		for _, resource in ipairs(ConstructionResourceList) do
			local amount = self.city:GetConstructionCost(self, resource)
			if amount > 0 then
				local refund_amount = self:CalcRefundAmount(amount)
				self:AddRefundResource(refund, resource, refund_amount)
			end
		end		
	end
		
	local upgrade_resources = self:GatherUpgradeSpentResources()
	for r_n, amount in pairs(upgrade_resources) do
		local refund_amount = self:CalcRefundAmount(amount)
		self:AddRefundResource(refund, r_n, refund_amount)
	end
		
	if self.consumption_stored_resources then
		local refund_amount = self.consumption_stored_resources
		self:AddRefundResource(refund, self.consumption_resource_type, refund_amount)
	end

	return refund
end

function Building:CalcRefundAmount(total_amount)
	local scale = const.ResourceScale
	return MulDivRound(total_amount / 2, self.salvage_modifier, 100)
end

function Building:GatherUpgradeSpentResources()
	--as long as upgrade costs cannot be modified this is accurate,
	local t = {}
	--built upgrades
	for i = 1, 3 do --for each tier, because self.upgrades_built has both [id]=true and [tier]=true
		if self.upgrades_built[i] then
			for j = 1, #AllResourcesList do
				local r_n = AllResourcesList[j]
				local c = self:GetUpgradeCost(i, r_n)
				if c and c > 0 then
					t[r_n] = (t[r_n] or 0) + c
				end
			end
		end
	end
	--upgrades under construction
	for id, data in pairs(self.upgrades_under_construction or empty_table) do
		local reqs = data.reqs
		for i = 1, #(reqs or empty_table) do
			local req = reqs[i]
			local r_n = req:GetResource()
			local amount_remaining = req:GetActualAmount()
			local total_cost = self:GetUpgradeCost(data.tier, r_n)
			local amount_spent = total_cost - amount_remaining
			if amount_spent > 0 then
				t[r_n] = (t[r_n] or 0) + amount_spent
			end
		end
	end
	
	return t
end

function Building:ReturnResources()
	local refund = self:GetRefundResources() or empty_table
	for i = 1, #refund do
		self:PlaceReturnStockpile(refund[i].resource, refund[i].amount)
	end
end

function Building:PlaceReturnStockpile(resource, amount)
	if amount <= 0 then
		return
	end
	
	local pos, angle
	for k = 1, #self.resource_spots do
		local spot_name = self.resource_spots[k][1]
		if self:HasSpot(spot_name) then
			local i1, i2 = self:GetSpotRange(spot_name)
			for i=i1, i2 do
				local pos_i = self:GetSpotPos(i)
				if terrain.IsPassable(pos_i) then
					pos = pos_i
					angle = self:GetSpotRotation(i) + self.resource_spots[k][2]
					break
				end
			end
			if pos then
				break
			end
		end
	end
	if not pos then
		pos = self:GetRandomSpotPosAsync("Workrover") or self:GetRandomSpotPosAsync("Workdrone") or self:GetVisualPos()
		angle = self:GetAngle()
	end
	PlaceResourceStockpile_Delayed(pos, resource, amount, angle, true)
end

function Building:GetDisplayName()
	return not IsKindOf(self, "BuildingTemplate") and self.name and self.name~="" and Untranslated(self.name) or self.display_name 
end

function Building:View()  -- for hyperlinks
	ViewObjectMars(self:GetLogicalPos())
end

function Building:Select()  -- for hyperlinks
	SelectObj(self)
	ViewObjectMars(self:GetVisualPos())
end

function Building:GatherConstructionStatuses(statuses) 
end

function Building:RepairNeeded()
	return self:IsMalfunctioned()
end

--Drones/rover do not clean dusty buildings before they malfunction, or do they
function Building:CleanNeeded()
	return self:RepairNeeded()
end


function Building:GetRandomPos(max_radius, min_radius, center)
	if not center or center == InvalidPos() then
		center  = self:GetPos()
	end	
	min_radius = min_radius or 0
	local mw, mh = terrain.GetMapSize()
	if center == InvalidPos() then
		center = point(mw / 2, mh / 2)
	end
	for j = 1, 25 do
		local pt = RotateRadius(min_radius + self:Random(max_radius - min_radius), self:Random(360 * 60), center)
		local x, y = pt:x(), pt:y()
		x = Clamp(x, guim, mw - guim)
		y = Clamp(y, guim, mh - guim)
		if terrain.IsPassable(x, y) then
			local pos = point(x, y)
			return pos
		end
	end
end

function Building:OnGameExitEditor()
	self:DisconnectFromCommandCenters()
	self:ConnectToCommandCenters()
end

function Building:IsLarge()
	return #GetEntityOutlineShape(self:GetEntity()) >= g_Consts.LargeBuildingHexes
end

GlobalVar("UpgradeModifierModifiers", {}) --[UpgradeId] = { [prop] = {amount = , percent = }}, where mod_id is 1-3, both vals are accumulated on top of existing vals
function RegisterUpgradeModifierModifier(upgrade_id, prop, amount, percent)
	local bld_lbl_name
	local prop_names = { "upgrade1_id", "upgrade2_id", "upgrade3_id" }
	--figure out which bld this is for so we can apply the mod for blds that are already constructed
	local templates = DataInstances.BuildingTemplate
	for _, template in ipairs(templates) do
		for i, u_prop_name in ipairs(prop_names) do
			if upgrade_id == template[u_prop_name] then
				bld_lbl_name = template.name
				break
			end
		end
		if bld_lbl_name then break end
	end
	
	if not bld_lbl_name then
		if Platform.developer then
			print("RegisterUpgradeModifierModifier, did not find building with upgrade -> " .. upgrade_id)
		end
		return
	end
	
	--apply for future upgrades
	local t1 = UpgradeModifierModifiers[upgrade_id] or {}
	UpgradeModifierModifiers[upgrade_id] = t1
	local mod = t1[prop] or {amount = 0, percent = 0}
	t1[prop] = mod
	mod.amount = mod.amount + (amount or 0)
	mod.percent = mod.percent + (percent or 0)
	--apply to existing blds
	local lbl = UICity.labels[bld_lbl_name]
	
	for _, bld in ipairs(lbl or empty_table) do
		local mod_t = bld.upgrade_id_to_modifiers[upgrade_id]
		if mod_t then
			local is_applied = mod_t[1] and mod_t[1]:IsApplied() or false
			if is_applied then
				bld:StopUpgradeModifiersForUpgrade(upgrade_id)
			end
			
			for _, umod in ipairs(mod_t) do
				if umod.prop == prop then
					umod.amount = (umod.amount or 0) + mod.amount
					umod.percent = (umod.percent or 0) + mod.percent
				end
			end
			
			if is_applied then
				bld:ApplyUpgradeModifiersForUpgrade(upgrade_id)
			end
		end
	end
end

function Building:ApplyUpgrade(tier, force)
	local id = self:GetUpgradeID(tier)
	
	if not self.city:IsUpgradeUnlocked(id) then
		print(id, " - Upgrade not researched!")
		if not force then return end
		
		self.city:UnlockUpgrade(id)
	end
	
	if self:HasUpgrade(id) then 
		return 
	end
	
	local all_modifier_modifiers = UpgradeModifierModifiers[id] or empty_table
	
	for i = 1, 3 do
		local targetname = self[string.format("upgrade%d_mod_target_%d",  tier, i)]
		local label      = self[string.format("upgrade%d_mod_label_%d",   tier, i)]
		local propid     = string.format("upgrade%d_mod_prop_id_%d", tier, i)
		local prop       = self[propid]
		local percent    = self[string.format("upgrade%d_mul_value_%d",   tier, i)]
		local amount     = self[string.format("upgrade%d_add_value_%d",   tier, i)]
		local m_mods 	 = all_modifier_modifiers[prop] or empty_table
				
		if prop ~= "" then
			local modifier = nil
			local meta
			if targetname == "self" then
				meta = self:GetPropertyMetadata(prop)
			elseif g_Classes[label] then
				meta = g_Classes[label]:GetPropertyMetadata(prop)
			elseif ClassTemplates[label] and g_Classes[ClassTemplates[label]] then
				meta = g_Classes[ClassTemplates[label]]:GetPropertyMetadata(prop)
			end
			
			local scale = meta and GetPropScale(meta.scale) or 1
			
			if targetname == "self" then
				-- make sure we're modifying an existing property
				assert(self:GetProperty(propid) ~= nil, string.format("Upgrade %s trying to modify nonexisting proprety %s for %s", id, propid, self.template_name))
				modifier = ObjectModifier:new{
					target = self, 
					prop = prop, 
					amount = (amount + (m_mods.amount or 0)) * scale, 
					percent = percent + (m_mods.percent or 0),
				}
			else
				local target = self[targetname]
				if target then
					local mod_id = string.format("%s_upgrade%d_mod_%d", self.handle, tier, i)
					modifier = LabelModifier:new{
						container = target,
						label = label,
						id = mod_id,
						prop = prop,
						amount = (amount + (m_mods.amount or 0)) * scale,
						percent = percent + (m_mods.percent or 0),
					}
					target:SetLabelModifier(label, mod_id, modifier)		
				end
			end
			
			if modifier then
				self.upgrade_modifiers[id] = self.upgrade_modifiers[id] or {}
				self.upgrade_id_to_modifiers[id] = self.upgrade_id_to_modifiers[id] or {}
				table.insert(self.upgrade_modifiers[id], modifier)
				table.insert(self.upgrade_id_to_modifiers[id], modifier)
				rawset(modifier, "upgrade_id", id)
			end
		end
	end
	
	self:CreateUpgradeUpkeepObject(tier)
	
	self.upgrades_built[tier] = true
	self.upgrades_built[id] = true
	self.upgrade_on_off_state[id] = true --starts turned on
	if self.upgrades_under_construction then --not gona exist if from cheat
		self.upgrades_under_construction[id] = nil
		if not next(self.upgrades_under_construction) then
			self.upgrades_under_construction = nil --cleanup
		end
	end
	
	-- update/refresh working state
	if self.working and self:CanWork() then -- restart in case the upgrade alters production/consumption
		self.refreshing_working_state = true
		self:SetWorking(false)
		self:SetWorking(true)
		self.refreshing_working_state = false
	else
		self:UpdateWorking()
	end
	
	Msg("BuildingUpgraded", self, id)
	
	print(id, " - Upgrade applied!")
end

for i = 1, 3 do
	Building["ToggleUpgradeTier" .. i] = function(self) self:ToggleUpgradeOnOff(self:GetUpgradeID(i)) end
end

function Building:ToggleUpgradeOnOff(upgrade_id)
	if not self:HasUpgrade(upgrade_id) then 
		return 
	end
	
	local new_state = not self.upgrade_on_off_state[upgrade_id]
	self.upgrade_on_off_state[upgrade_id] = new_state
	
	local c_obj = self.upgrade_consumption_objects and self.upgrade_consumption_objects[upgrade_id]
	if c_obj then
		c_obj:UpdateRequestConnectivity()
		new_state = new_state and c_obj:CanWork() --if upgrade cant work due to consumption don't turn it on
	end
		
	if new_state then
		self:ApplyUpgradeModifiersForUpgrade(upgrade_id)
	else
		self:StopUpgradeModifiersForUpgrade(upgrade_id)
	end
	
	self:OnUpgradeToggled(upgrade_id, new_state)
	CreateGameTimeThread(RebuildInfopanel, self) --so that supply grid updates have passed when we call this
end

function Building:OnUpgradeToggled(upgrade_id, new_state)
	--cb
end

function Building:ApplyUpgradeModifiersForUpgrade(upgrade_id)
	if not self:HasUpgrade(upgrade_id) then 
		return 
	end
	
	for _,  mod in ipairs(self.upgrade_modifiers[upgrade_id] or empty_table)do
		mod:TurnOn()
	end
end

function Building:StopUpgradeModifiersForUpgrade(upgrade_id)
	if not self:HasUpgrade(upgrade_id) then 
		return 
	end
	
	for _,  mod in ipairs(self.upgrade_modifiers[upgrade_id] or empty_table)do
		mod:TurnOff()
	end
end

function Building:ApplyUpgradeModifiers(only_for_object)
	for upgrade_id, modifiers in pairs(self.upgrade_id_to_modifiers) do
		if not self.upgrade_consumption_objects or not self.upgrade_consumption_objects[upgrade_id] or
			self.upgrade_consumption_objects[upgrade_id]:CanWork() then
			for i=1, #modifiers do
				local modifier = modifiers[i]
				if not only_for_object or (IsKindOf(modifier, "LabelModifier") and only_for_object == modifier.container) then
					modifier:TurnOn()
				end
			end
		end
	end
end

function Building:StopUpgradeModifiers(only_for_object)
	for _, modifier in ipairs(self.upgrade_modifiers) do
		if not only_for_object or (IsKindOf(modifier, "LabelModifier") and only_for_object == modifier.container) then
			modifier:TurnOff()
		end
	end
end

function Building:HasUpgrade(upgrade)
	return self.upgrades_built[upgrade]
end

function Building:IsUpgradeOn(upgrade)
	return self.upgrade_on_off_state[upgrade]
end

function Building:AreNightLightsAllowed()
	local b = true
	if self.build_category == "Decorations" then
		local dome = self.parent_dome
		if dome then
			b = dome:AreNightLightsAllowed()
		end
	end
	return b and self.working and not self:IsSupplyGridDemandStoppedByGame()
end

local gofNightLightsEnabled = const.gofNightLightsEnabled
function Building:RefreshNightLightsState()
	if self:GetGameFlags(gofNightLightsEnabled) == 0 then
		if self:AreNightLightsAllowed() then
			self:SetIsNightLightPossible(true, true)
		end
	else
		if not self:AreNightLightsAllowed() then
			self:SetIsNightLightPossible(false, true)
		end
	end
end

function Building:OnSetWorking(working)
	BaseBuilding.OnSetWorking(self, working)
	self:RefreshNightLightsState()
	
	--Handle working/not-working emissive lights
	--Currently all entities that do not emit light during the night
	--  are turned on/off depending on the working state
	if not NightLightEmissiveEntites[self:GetEntity()] then
		if working then
			self:WorkLightsOn()
		else
			self:WorkLightsOff()
		end
	end
	
	if working then
		self:AttachSign(false, "SignNoConsumptionResource")
	elseif not self:CanConsume() then
		self:AttachSign(true, "SignNoConsumptionResource")
	end
	
	--@@@msg OnSetWorking,building, working- fired when a buildings working state has been changed.
	Msg("OnSetWorking", self, working) --hook for modding
end

function Building:WorkLightsOn()
	self:SetSIModulation(200)
end

function Building:WorkLightsOff()
	self:SetSIModulation(0)
end

local DecDebrisClasses = empty_table
function OnMsg.ClassesBuilt()
	DecDebrisClasses = ClassDescendantsList("DecDebris")
end

function Building:GetDemolishObjs(list)
	ApplyToObjAndAttaches(self, function(obj)
		if IsKindOfClasses(obj, "Bush", "CropEntityClass") then
			DoneObject(obj)
		elseif IsKindOf(obj, "AnimatedTextureObject") then
			obj:SetFrameAnimationSpeed(0)
		elseif obj:GetClassFlags(const.cfConstructible + const.cfDecal) ~= 0 then
			list[#list + 1] = obj
		end
	end)
end

function Building:OnDestroyed()
end

function DestroyBuildingImmediate(bld, return_resources)
	if not IsValid(bld) or bld.destroyed or bld.indestructible then
		return
	end
	bld.demolishing = true
	bld.demolishing_countdown = 0
	if return_resources ~= nil then
		bld.demolish_return_resources = return_resources
	end
	bld:DoDemolish()
	return true
end

function Building:Destroy()
	if self.destroyed or self.indestructible or not self.use_demolished_state then
		return
	end
	
	SuspendPassEdits("Building.Destroy")
	local flags = self:GetEnumFlags(const.efCollision + const.efApplyToGrids)
	self:ClearEnumFlags(const.efWalkable + const.efCollision + const.efApplyToGrids)
	
	if self.parent_dome then
		self.parent_dome:UpdateColonists()
	end
	self.show_dust_visuals = true
	self.destroyed = true
	self:SetIsNightLightPossible(false) -- avoid night lights switching on
	self:DisableMaintenance() -- avoid drones to clear the dust
	self:DisconnectFromCommandCenters()
	self:UpdateWorking(false)
	self:DetachAllSigns() --attach destroyed sign @ sum point
	self:UpdateConsumption()
	self:ConsumptionOnDestroyed()
	self:UpdateNotWorkingBuildingsNotification() --rem from not working notif
	self:OnDestroyed()
	self:SetDustVisualsPerc(100)
	self:KickUnitsFromHolder()

	-- save current visual state in order to set it on rebuild
	local pos = self:GetVisualPos()
	local angle = self:GetVisualAngle()
	self.orig_state = {pos, angle}
	
	-- change color & anim
	local effects_time = 1000
	local demolish_color = self.demolish_color
	local demolish_objs = {}
	self:GetDemolishObjs(demolish_objs)
	for i=1,#demolish_objs do
		local obj = demolish_objs[i]
		if IsValid(obj) then
			obj:SetColorModifier(demolish_color, obj:GetClassFlags(const.cfDecal) and 0 or effects_time)
		end
	end
	
	-- sink & tilt into the ground
	local tilt, sink = 0, 0
	if not HasAnySurfaces(self, EntitySurfaces.TerrainHole + EntitySurfaces.Height) then
		local bbox = ObjectHierarchyBBox(self, const.efVisible, const.cfConstructible)
		--terrain.InvalidateType(bbox)
		local sx, sy, sz = 0, 0, 0
		if bbox then
			sx, sy, sz = bbox:sizexyz()
		end
		if sz and sz > 0 then
			local radius = Max(sx, sy) / 2
			local smin = MulDivRound(self.demolish_sinking.from, sz, 100)
			local smax = MulDivRound(self.demolish_sinking.to, sz, 100)
			sink = self:Random(smin, smax)
			
			local tmin = self.demolish_tilt_angle.from
			local tmax = self.demolish_tilt_angle.to
			tilt = self:Random(tmin, tmax)
			
			-- ensure the building is sinked after the tilt
			tilt = Min(tilt, asin(MulDivRound(4096, smax, radius)))
			sink = Max(sink, MulDivRound(radius, tilt, 4096))
		end
	end
	if sink > 0 or tilt > 0 then
		local spots = {Drone.work_spot_task, BaseRover.work_spot_task}
		for i = 1, #spots do
			local arr = {}
			local b, e = self:GetSpotRange(spots[i])
			for j = b, e do
				table.insert(arr, self:GetSpotPos(j))
			end
			self.orig_state[spots[i]] = arr
		end
		-- attach demolish objects
		for i=1,#demolish_objs do
			local obj = demolish_objs[i]
			if obj ~= self and IsValid(obj) and not obj:GetParent() then
				local pos_i = obj:GetVisualPos()
				local angle_i = obj:GetVisualAngle()
				obj:SetAttachOffset(pos_i - pos)
				obj:SetAttachAngle(angle_i - angle)
				self:Attach(obj, self:GetSpotBeginIndex("Origin"))
				obj:SetAnimSpeed(1, 0, effects_time)
			end
		end
	end
	if sink > 0 then
		local x, y, z = pos:xyz()
		self:SetPos(x, y, z - sink, effects_time)
		if tilt > 0 then
			SetRollPitchYaw(self, self:Random(-tilt, tilt), self:Random(-tilt, tilt), angle, effects_time)
		end
	end
		
	-- place debris decals
	local debris = self.demolish_debris or 0
	if debris > 0 then
		local objs = {}
		local shape_data = self:GetBuildShape()
		local dir = HexAngleToDirection(angle)
		local cq, cr = WorldToHex(pos)
		for _, shape_pt in ipairs(shape_data) do
			if self.city:Random(100) < debris then
				local sx, sy = shape_pt:xy()
				local q, r = HexRotate(sx, sy, dir)
				local hx, hy = HexToWorld(cq + q, cr + r)
				local debris_class = self.city:TableRand(DecDebrisClasses)
				if debris_class ~= "" then
					local debris = PlaceObject(debris_class)
					debris:SetAngle(self:Random(360*60))
					debris:SetPos(hx, hy, const.InvalidZ)
					objs[#objs + 1] = debris
				end
			end
		end
		self.demolish_debris_objs = objs
	end
	
	PlayFX("Destroyed", "start", self)

	local prev_sel = SelectedObj
	if SelectedObj == self then
		SelectObj(false)
	end	
	self.fx_actor_class = "Building" -- disable FX linked to this specific building (e.g. hex radius)
	if prev_sel == self then
		SelectObj(self)
	end
	self:SetEnumFlags(flags)
	ResumePassEdits("Building.Destroy")
end

function ApplyToObjAndAttaches(obj, func, ...)
	func(obj, ...)
	if IsValid(obj) then
		obj:ForEachAttach(ApplyToObjAndAttaches, func, ...)
	end
end

function Building:RebuildStart()
	self:ClearEnumFlags(const.efVisible)
end

function Building:RebuildCancel()
	self:SetEnumFlags(const.efVisible)
end

function Building:IsSuitable(colonist)
end

function Building:ColonistInteract(colonist)
end

function Building:ColonistCanInteract(colonist)
	return nil, nil, true
end

function Building:GetSelectionAngle()
	if self.destroyed and self.orig_state then
		return self.orig_state[2]
	end
	return self:GetAngle()
end

local unpack = table.unpack

function Building:Rebuild(params)
	params = params or {}
	assert(self.destroyed)
	local pos, angle
	if self.orig_state then
		pos, angle = unpack(self.orig_state)
	else
		local roll, pitch, yaw = GetRollPitchYaw(self)
		pos = self:GetPos():SetInvalidZ()
		angle = yaw
	end
	self:RebuildStart()
	if self:IsPinned() then
		self:TogglePin()
	end
	params.rebuild = self
	params.alternative_entity = self:GetEntity()
	params.name = self.name
	return PlaceConstructionSite(self.city, self.template_name, pos, angle, params)
end

function Building:DestroyedRebuild(broadcast)
	if broadcast then
		BroadcastAction(self, "DestroyedRebuild")
		return
	end
	
	if not self.destroyed or self.bulldozed 
		or self:GetEnumFlags(const.efVisible) == 0 then --already rebuilding...
		return
	end
		
	local site = self:Rebuild()
	if SelectedObj == self then
		CreateGameTimeThread(SelectObj, site)
	end
end

function Building:DestroyedClear(broadcast)
	if broadcast then
		BroadcastAction(self, "DestroyedClear")
		return
	end

	if not self.destroyed or self.bulldozed or 
	not self.city:IsTechResearched("DecommissionProtocol")
	or self.clear_work_request or not IsValid(self) then
		return
	end
	
	local template = DataInstances.BuildingTemplate[self.template_name]
	local pts = template and template.build_points or 1000
	self:DisconnectFromCommandCenters()
	self.bulldozed = true
	if self:HasSpot("Top") then
		self:Attach(PlaceObject("RotatyThing"), self:GetSpotBeginIndex("Top"))
	end
	if self.parent_dome then
		self.parent_dome:UpdateColonists()
	end
	self.clear_work_request = self:AddWorkRequest("repair", 0, 0, Max(1, pts / 1000))
	self.clear_work_request:AddAmount(pts)	
	self:ConnectToCommandCenters()
	
	RebuildInfopanel(self)
end

function Building:DroneWork(drone, request, resource, amount)
	if request and request == self.clear_work_request then
		amount = DroneResourceUnits.repair

		drone:PushDestructor(function(drone)
			local self = drone.target
			if drone.w_request:GetActualAmount() <= 0 and IsValid(self) then
				PlayFXAroundBuilding(self, "Remove")
				DoneObject(self)
			end
		end)

		drone:ContinuousTask(request, amount, g_Consts.DroneBuildingRepairBatteryUse, "repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair")
		drone:PopAndCallDestructor()
	else
		RequiresMaintenance.DroneWork(self, drone, request, resource, amount)
	end
end

function Building:CheatDestroy()
	DestroyBuildingImmediate(self)
end

function Building:CheatMalfunction()
	self:SetMalfunction()
end

function Building:CheatAddDust()
	self:AddDust(self.maintenance_threshold_current)
end

function Building:CheatAddMaintenancePnts()
	self:AccumulateMaintenancePoints(self.maintenance_threshold_current)
end

function Building:CheatCleanAndFix()
	self:Repair()
	self.accumulated_maintenance_points = 0
end

function Building:CheatUpgrade1()
	self:ApplyUpgrade(1, true)
end
function Building:CheatUpgrade2()
	self:ApplyUpgrade(2, true)
end
function Building:CheatUpgrade3()
	self:ApplyUpgrade(3, true)
end

local function CheatSpawnRunPrg(bld, id, prg, can_spawn_children, visit_duration)
	visit_duration = visit_duration or const.HourDuration
	local entrance, pos, entrance_spot = bld:GetEntrance(bld)
	if entrance_spot then
		pos = bld:GetSpotPos(bld:GetRandomSpot(entrance_spot))
	end
	if not pos then
		return
	end
	local angle = CalcOrientation(pos, #(entrance or "") > 1 and entrance[#entrance-1] or bld:GetPos())

	local unit = PlaceObject("Unit")
	NetTempObject(unit)
	unit.traits = {}
	unit.entity_gender = AsyncRand(2) == 1 and "Male" or "Female"
	unit.specialist = false
	unit.race = 1 + AsyncRand(5)
	unit.age_trait = "Adult"
	local usable_by_adults, usable_by_children
	if bld:HasMember("children_only") and bld.children_only then
		usable_by_children = true
	else
		usable_by_adults = true
		usable_by_children = can_spawn_children and (not bld:HasMember("usable_by_children") or bld.usable_by_children)
	end
	if usable_by_children and (not usable_by_adults or AsyncRand(100) < 30) then
		unit.traits.Child = true
	end
	local entity, ip_icon, pin_icon = GetSpecialistEntity(unit.specialist, unit.entity_gender, unit.race, unit.age_trait, unit.traits)
	unit:ChangeEntity(entity)
	unit.infopanel_icon = ip_icon
	unit.pin_icon = pin_icon
	unit.ip_specialization_icon, unit.pin_specialization_icon  = Colonist.GetSpecializationIcons(unit)

	unit.inner_entity = entity
	unit.SetOutside = function(self, outside)
		if outside then
			if self:GetEntity() ~= self.inner_entity then return end
			self:ChangeEntity(GetOutsideEntity(self.entity_gender, self.race, self.age_trait, self.traits))
		else
			if self:GetEntity() == self.inner_entity then return end
			self:ChangeEntity(self.inner_entity)
		end
	end
	unit.fx_actor_class = unit.entity_gender == "Male" and "ColonistMale" or "ColonistFemale"
	unit:SetCollisionRadius(Colonist.radius)
	unit:SetDestlockRadius(Colonist.radius)
	unit:SetMoveAnim("moveWalk")
	unit:SetWaitAnim("idle")
	unit:SetMoveSpeed(Colonist.move_speed)
	unit.init_with_command = false
	unit:SetOpacity(0)
	unit:SetOpacity(100, 200)
	unit:SetAngle(angle)
	unit:SetPos(pos)
	unit.current_dome = IsObjInDome(bld)
	if not unit.current_dome then
		unit:SetOutside(true)
	end
	local cmd_name = "Cheat" .. id
	unit[cmd_name] = function(self, prg, visit_duration, building)
		self:PushDestructor(function(self)
			if IsValid(self) then
				DoneObject(self)
			end
		end)
		self:EnterBuilding(building)
		self:PlayPrg(prg, visit_duration, building)
		self:ExitBuilding(building)
		self:SetOpacity(0, 200)
		Sleep(200)
		self:PopAndCallDestructor()
	end
	unit:SetCommand(cmd_name, prg, visit_duration, bld)
end

function Building:CheatSpawnWorker()
	CheatSpawnRunPrg(self, "Work", GetWorkPrg(self), false)
end

function Building:CheatSpawnVisitor()
	CheatSpawnRunPrg(self, "Visit", GetVisitPrg(self), true)
end

function Building:CheatMakeSphereTarget()
	MirrorSphereForcedTarget = self
end

function Building:ConstructUpgrade1(change)
	self:ConstructUpgrade(self:GetUpgradeID(1), change)
end

function Building:ConstructUpgrade2(change)
	self:ConstructUpgrade(self:GetUpgradeID(2), change)
end

function Building:ConstructUpgrade3(change)
	self:ConstructUpgrade(self:GetUpgradeID(3), change)
end

function Building:ConstructUpgrade(id)
	if UICity:IsUpgradeUnlocked(id) and not self:HasUpgrade(id) then
		if self:IsUpgradeBeingConstructed(id) then
			self:StopUpgradeConstruction(id)
		else
			self:StartUpgradeConstruction(id)
		end
	end
end

function Building:StartUpgradeConstruction(id)
	if not IsValid(self) then return end
	self.upgrades_under_construction = self.upgrades_under_construction or {}
	
	if not self.upgrades_under_construction[id] then
		local tier = self:GetUpgradeTier(id)
		assert(tier)
		local reqs = {}
		self.upgrades_under_construction[id] = {
			id = id,
			tier = tier,
			construction_start_ts = false,
			required_time = self:GetUpgradeTime(tier),
			reqs = reqs,
			resources_delivered = false,
			canceled = false,
		}
		
		self:DisconnectFromCommandCenters()
		local is_free = true
		for i = 1, #AllResourcesList do
			local r_n = AllResourcesList[i]
			local c = self:GetUpgradeCost(tier, r_n)
			
			if c > 0 then
				is_free = false
				--0-5-> 2 drone, 6-8 - 3 drones, etc.
				local d_req = self:AddDemandRequest(r_n, c, const.rfUpgrade, Clamp(c/(const.ResourceScale * 3) + 1, 1, 8))
				reqs[#reqs + 1] = d_req
			end
		end
		
		self:ConnectToCommandCenters()
		
		if is_free then
			self.upgrades_under_construction[id].reqs = false
			self.upgrades_under_construction[id].resources_delivered = true
			self:OnUpgradeResourcesDelivered(id)
		end
	else
		--resuming
		self:ResumeUpgradeConstruction(id)
	end
	
	RebuildInfopanel(self)

	HintDisable("HintBuildingUpgrade")
end

function Building:StopAllUpgradeConstruction()
	if self.upgrades_under_construction then
		for id, _ in pairs(self.upgrades_under_construction) do
			--according to doc pairs can clear fields but not assign new fields, so this should be ok
			self:StopUpgradeConstruction(id)
		end
	end
end

function Building:StopUpgradeConstruction(id)
	local can_clean_up = true --if no resources are delivered, clean the thing
	local data = self.upgrades_under_construction[id]
	local reqs = data.reqs
	if reqs then
		for i = 1, #reqs do
			local r_n = reqs[i]:GetResource()
			if reqs[i]:GetActualAmount() ~= self:GetUpgradeCost(data.tier, r_n) then
				can_clean_up = false
				break
			end
		end
	end
	
	if not can_clean_up then
		self:CleanUpgradeConstructionRequests(id, true)
		data.canceled = true
	else
		self:CleanUpgradeConstructionRequests(id, false) 
		self.upgrades_under_construction[id] = nil
	end
	RebuildInfopanel(self)
end

function Building:IsUpgradeBeingConstructedAndCanceled(id)
	return self.upgrades_under_construction and self.upgrades_under_construction[id] and self.upgrades_under_construction[id].canceled or false
end

function Building:UpgradeCosts(index)
	local upgrade = self.upgrades_under_construction
	local id = self:GetUpgradeID(index)
	if upgrade and upgrade[id] then
		return self:GetCostsTArray(id, true)
	end
end

function Building:GetCostsTArray(id, include_total_cost)
	local costs = {}
	if self.upgrades_under_construction and self.upgrades_under_construction[id] then
		local data = self.upgrades_under_construction[id]
		local reqs = data.reqs
		for i = 1, #(reqs or empty_table) do
			local req = reqs[i]
			local r_n = req:GetResource()
			local amount_remaining = req:GetActualAmount()
			local total_cost = self:GetUpgradeCost(data.tier, r_n)
			costs[#costs + 1] = FormatResource(total_cost - amount_remaining, total_cost, r_n, empty_table)
		end
	else
		local tier = self:GetUpgradeTier(id)
		for i = 1, #AllResourcesList do
			local r_n = AllResourcesList[i]
			local c = self:GetUpgradeCost(tier, r_n)
			if c > 0 then
				if include_total_cost then
					costs[#costs + 1] = FormatResource(0, c, r_n, empty_table)
				else
					costs[#costs + 1] = FormatResource(c, r_n, empty_table)
				end
			end
		end
	end
	
	return table.concat(costs, " ")
end

function Building:IsUpgradeBeingConstructed(id)
	return self.upgrades_under_construction and self.upgrades_under_construction[id] and not self.upgrades_under_construction[id].canceled or false
end

function Building:CleanUpgradeConstructionRequests(id, preserve_requestes)
	local data = self.upgrades_under_construction[id]
	local reqs = data and data.reqs
	if reqs then
		self:InterruptDrones(nil, function(drone)
											return drone.d_request and table.find(reqs, drone.d_request) and drone
										end, nil)
		
		
		self:DisconnectFromCommandCenters()
		
		
		for i = 1, #reqs do
			table.remove_entry(self.task_requests, reqs[i])
		end
		if not preserve_requestes then
			data.reqs = false
		end
		self:ConnectToCommandCenters()
	end
end

function Building:ResumeUpgradeConstruction(id)
	local data = self.upgrades_under_construction[id]
	local reqs = data and data.reqs
	data.canceled = false
	
	if reqs and not data.resources_delivered then
		self:DisconnectFromCommandCenters()
		
		for i = 1, #reqs do
			table.insert(self.task_requests, reqs[i])
		end
		
		self:ConnectToCommandCenters()
	end
	
	self:OnUpgradeResourcesDelivered(id)
end

--similar to CleanUpgradeConstructionRequests(id, true)/ResumeUpgradeConstruction
--however this is less loops
function Building:OnSetWorkingRefreshUpgradeConstructionRequests(working)
	if not self.upgrades_under_construction then return end
	
	local all_upgrade_requests = {}
	self:DisconnectFromCommandCenters()
	local functor = working and table.insert or table.remove_entry
	for upgrade_id, data in pairs(self.upgrades_under_construction) do
		if not data.resources_delivered and not data.canceled then
			local reqs = data.reqs
			for i = 1, #(reqs or empty_table) do
				local request = reqs[i]
				functor(self.task_requests, request)
				table.insert(all_upgrade_requests, request)
			end
		end
	end
	self:ConnectToCommandCenters()
	
	if not working then
		self:InterruptDrones(nil, function(drone)
											if table.find(all_upgrade_requests, drone.d_request) then
												return drone
											end
										end)
	end
end

function Building:OnStartWorkingStartUpgradeConstructionTimers()
	if not self.upgrades_under_construction then return end
	local tiers_to_apply = {}
	for upgrade_id, data in pairs(self.upgrades_under_construction) do
		if not data.canceled then
			if data.resources_delivered then
				if data.required_time > 0 then
					data.construction_start_ts = GameTime()
				else
					tiers_to_apply[#tiers_to_apply + 1] = data.tier
				end
			end
		end
	end
	if #tiers_to_apply > 0 then
		for i = 1, #tiers_to_apply do
			self:ApplyUpgrade(tiers_to_apply[i]) --this cleans up the data so it's not safe to call while iterating
		end
		RebuildInfopanel(self)
	end
end

function Building:OnUpgradeResourcesDelivered(id)
	if self.upgrades_under_construction[id].resources_delivered then --if not, onsetworking should call us
		if self.upgrades_under_construction[id].required_time > 0 then
			self.upgrades_under_construction[id].construction_start_ts = GameTime()
		else
			self:ApplyUpgrade(self.upgrades_under_construction[id].tier)
		end
	end
end

function Building:UpdateUpgradeConstruction()
	if self.upgrades_under_construction then
		local tiers_to_apply = {}
		for upgrade_id, data in pairs(self.upgrades_under_construction) do
			if data.construction_start_ts and GameTime() - data.construction_start_ts >= data.required_time then
				tiers_to_apply[#tiers_to_apply + 1] = data.tier
			end
		end
		if #tiers_to_apply > 0 then
			for i = 1, #tiers_to_apply do
				self:ApplyUpgrade(tiers_to_apply[i]) --this cleans up the data so it's not safe to call while iterating
			end
			RebuildInfopanel(self)
		end
	end
end

function Building:GetUpgradeConstructionProgress1()
	return self:GetUpgradeConstructionProgress(1)
end

function Building:GetUpgradeConstructionProgress2()
	return self:GetUpgradeConstructionProgress(2)
end

function Building:GetUpgradeConstructionProgress3()
	return self:GetUpgradeConstructionProgress(3)
end

function Building:GetUpgradeConstructionProgress(tier)
	if not self.working or not self.upgrades_under_construction then 
		return 0
	end
	local id = self:GetUpgradeID(tier)
	local data = self.upgrades_under_construction[id]
	if data and data.construction_start_ts then		
		return MulDivRound(GameTime() - data.construction_start_ts, 100, data.required_time)
	end
	return 0
end

function Building:DroneUnloadResource(drone, request, resource, amount)
	if request:GetBuilding() ~= self then
		assert(not IsValid(self), "Invalid task request building")
		return
	end
	
	if self:DoesHaveConsumption() then
		self:ConsumptionDroneUnload(drone, request, resource, amount)
	end
	
	if self:DoesRequireMaintenance() then
		self:MaintenanceDroneUnload(drone, request, resource, amount)
	end
	
	if request:IsAnyFlagSet(const.rfUpgrade) then
		CreateGameTimeThread(function(self, request)
			if request:GetActualAmount() <= 0 then
				--succesfully fulfilled
				local map = self.upgrades_under_construction or empty_table
				for id, data in pairs(map) do
					local reqs = data.reqs
					if table.find(reqs, request) then
						local all_fulfilled = true
						for i = 1, #reqs do
							if reqs[i]:GetActualAmount() > 0 then
								all_fulfilled = false
								break
							end
						end
						if all_fulfilled then
							data.resources_delivered = true
							self:CleanUpgradeConstructionRequests(id, true)
							self:OnUpgradeResourcesDelivered(id)
						end
						break
					end
				end
			end
			RebuildInfopanel(self)
		end, self, request)
	end
end

function Building:ChangeSkin(skin)
	if SelectedObj == self then
		PlayFX("Select", "end", self)
	end
	SuspendPassEdits("Building.ChangeSkin")
	if self.working then
		self:ChangeWorkingStateAnim(false)
	end
	self:ChangeEntity(skin)
	self:OnSkinChanged(skin)
	if self.working then
		self:ChangeWorkingStateAnim(true)
	end
	ResumePassEdits("Building.ChangeSkin")

	if SelectedObj == self then
		PlayFX("Select", "start", self)
	end
end

function Building:OnSkinChanged(skin)
	local pipe_lookup = empty_table
	
	if IsKindOf(self, "LifeSupportGridObject") then
		pipe_lookup = self:GetPipeConnLookup()
	end
	self:DestroyAttaches(function(attach, pipe_lookup)
		return not pipe_lookup[attach] --pipe
			and not IsKindOfClasses(attach, "CableConnection", "ResourceStockpileBase", "BuildingSign", "GridTileWater")
													--cable,            own stockpile,          ui sign,         ui pipe helper
	end, pipe_lookup)
	AutoAttachObjectsToShapeshifter(self)
	self:AttachConfigurableAttaches()
	local palettes = BuildingPalettes[self.template_name] 
	if palettes and palettes[1] and EntityPalettes[palettes[1]] then
		self:SetPalette(palettes[1])
	end
	if self.parent_dome then
		DeleteUnattachedRoads(self, self.parent_dome)
	end
	self:ChangeWorkingStateAnim(self.working)
	self:BuildWaypointChains()
	self:SetIsNightLightPossible(self:IsNightLightPossible())
end

function Building:Getavailable_drone_prefabs()
	return self.city.drone_prefabs
end
----------------------------------------

DefineClassTemplate("Building") -- all descendants of Building can be templated in a "Building Editor"

function OnMsg.ClassesBuilt()
	table.insert(BuildingEditor.PropEditorViews[1], { title = "View", type = "props", width = 200})
end

local BuildingSortCombo = {
	{ value = "",      text = T{177, "Order of Input"} },
	{ value = "alpha", text = T{178, "Alphabetical"} },
	{ value = "build", text = T{154, "Build Menu Pos"} },
}

local props = BuildingEditor.properties or {}
props[#props + 1] = { category = "Filter", id = "Category", editor = "dropdownlist", default = "",      items = BuildCategoriesCombo }
props[#props + 1] = { category = "Filter", id = "Class",    editor = "dropdownlist", default = "",      items = BuildingClassesCombo }
props[#props + 1] = { category = "Sort",   id = "Order",    editor = "dropdownlist", default = "alpha", items = BuildingSortCombo }
BuildingEditor.properties = props

function BuildingEditor:OnPropertyChanged(prop_id)
	self:Refresh()
end

function BuildingEditor:Filter(building)
	if self.Category ~= "" and building.build_category ~= self.Category then
		return false
	end
	if self.Class ~= "" and not IsKindOf(g_Classes[building.template_class], self.Class) then
		return false
	end
	return true
end

function BuildingEditor:Sort()
	if self.Order == "alpha" then
		table.sort(self, function(a, b)
			return string.cmp_lower(a.name or "", b.name or "") < 0
		end)
	elseif self.Order == "build" then
		table.sortby_field(self, "build_pos")
	end
end

BuildingChoiceList = {}

function AddBuildingUA()
	local BuildingUA = {
		["Demolish"] = {
			key = "Delete",
			mode = "Game",
			menu = "Buildings/[001]Demolish",
			description = "Demolish",
			action = function()
				if GetInGameInterface() then
					GetInGameInterface():SetMode("demolish")
				end
			end,
		},
		["Electricity Grid"] = {
			mode = "Game",
			menu = "Buildings/[002]Electricity Grid",
			description = "Power Cables",
			action = function()
				if GetInGameInterface() then
					GetInGameInterface():SetMode("electricity_grid")
				end
			end,
		},
		["LifeSupport Grid"] = {
			mode = "Game",
			menu = "Buildings/[003]LifeSupport Grid",
			description = "Pipes",
			action = function()
				if GetInGameInterface() then
					GetInGameInterface():SetMode("life_support_grid")
				end
			end,
		},
	}
	
	local folders = {{}}
	for k,v in sorted_pairs(ClassTemplates.Building or empty_table) do
		local this_folder = folders[#folders]
		if #this_folder >= 20 then
			this_folder = {}
			folders[#folders+1] = this_folder
		end
		this_folder[#this_folder+1] = v
	end
	for i=1,#folders do
		local this_folder = folders[i]
		if #this_folder == 0 then break end
		
		local ExtractFirstWord = function(x)
			if #x < 7 then return x end
			local word = x:match("(.....[a-z]-)[A-Z]")
			return word and #word > 5 and word or x
		end
		
		local prefix_first = ExtractFirstWord(this_folder[1].template_name)
		local prefix_last  = ExtractFirstWord(this_folder[#this_folder].template_name)
		local name_format = string.format("Buildings/[%02d]%s - %s/[%%02d]%%s", i, prefix_first, prefix_last)
	
		for j=1,#this_folder do
			local template = this_folder[j]
			local name = template.template_name
			
			table.insert(BuildingUA, {
				description = T{179, "Place <building>", building = template.display_name},
				menu = string.format(name_format, j, name),
				action = function() 
					if IsEditorActive() then
						g_EditorModeDlg = OpenXDialog("ConstructionModeDialog", GetEditorInterface(), { template = name })
					elseif GetInGameInterface() then
						GetInGameInterface():SetMode("construction", { template = name })
					end			
				end,
			})
		end
	end

	if Platform.developer and Platform.editor then
		UserActions.AddActions(BuildingUA)
	end
	
	BuildingChoiceList = {}
	for k,v in pairs(BuildingUA) do
		local item = {}
		if v.description then
			item.text = Untranslated(v.description)
			item.action = v.action
			item.sort_key = tostring(k)
			table.insert(BuildingChoiceList, item)
		end
	end
	table.sortby_field(BuildingChoiceList, "sort_key")
end

OnMsg.BinAssetsLoaded = AddBuildingUA

if not FirstLoad then
	AddBuildingUA()
end

local BuildingCSVColumns = {
	{ "name", "Name" },
	{ "display_name", "Display Name" },
	{ "description", "Description" },
	{ "build_category", "BM Category" },
	{ "build_pos", "BM Category Pos" },
	{ "max_dust", "Max Dust" },
	{ "cold_sensitive", "Cold Sensitive" },
	{ "dome_comfort", "Dome Comfort" },
	{ "service_comfort", "Comfort" },
	{ "construction_cost_Concrete", "Concrete Cost" },
	{ "construction_cost_Metals", "Metals Cost" },
	{ "construction_cost_Polymers", "Polymers Cost" },
	{ "construction_cost_Electronics", "Electronics" },
	{ "construction_cost_MachineParts", "Machine Parts" },
	{ "construction_cost_PreciousMetals", "Precious Metals"},
	{ "build_points", "Construction Pts" },
	{ "instant_build", "Instant Build" },
	{ "is_tall", "Tall Building" },
	{ "dome_required", "Requires Dome" },
	{ "dome_spot", "Required Dome Spot" },
	{ "dome_forbidden", "Outside Building" },
	{ "template_class", "Class" },
	{ "electricity_production", "Power Production" },
	{ "electricity_consumption", "Power Consumption" },
	{ "capacity", "Power/Colonist Capacity" },
	{ "air_production", "Air Production" },
	{ "air_consumption", "Air Consumption" },
	{ "air_capacity", "Air Capacity" },
	{ "water_production", "Water Production" },
	{ "water_consumption", "Water Consumption" },
	{ "water_capacity", "Water Capacity" },
	{ "max_workers", "Workers" },
	{ "specialist", "Preferred Specialist" },
	{ "enabled_shift_1", "Enabled Shift 1" },
	{ "enabled_shift_2", "Enabled Shift 2" },
	{ "enabled_shift_3", "Enabled Shift 3" },
	{ "max_visitors", "Visitors" },
	{ "ResearchPointsPerDay", "Research Pts Per Day" },
}

function ExportBuildingsCSV()
	local data = {}
	for i=1,#DataInstances.BuildingTemplate do
		data[i] = {}
		for j=1,#BuildingCSVColumns do
			local prop = BuildingCSVColumns[j][1]
			data[i][prop] = PropObjHasMember(DataInstances.BuildingTemplate[i], prop) and DataInstances.BuildingTemplate[i][prop] or ""
		end
	end
	SaveCSV("Buildings.csv", data, table.map(BuildingCSVColumns, 1), table.map(BuildingCSVColumns, 2))
end

-- ui functions
function Building:Getui_dronehub_drones() return T{180, "Drones<right><DronesCount>/<CommandCenterMaxDrones>", self, CommandCenterMaxDrones = g_Consts.CommandCenterMaxDrones} end

NotWorkingWarning = {
	Demolish = T{181, "This building will be demolished in <em><FormatScale(demolishing_countdown,1000)></em> sec."},
	Malfunction = T{182, "This building has malfunctioned. Repair it with Drones."},
	MalfunctionRes = T{60192, "This building has malfunctioned. Drones can repair it with <resource(maintenance_resource_amount, maintenance_resource_type)>."},
	Frozen = T{183, "This building is frozen. It can be repaired by Drones after the Cold Wave has passed."},
	FrozenPerma = T{7892, "This building is frozen. Use a Subsurface Heater to heat the surrounding cold area."},
	Defrosting = T{8520, "Defrosting. This building will need repair after it is defrosted."},
	TurnedOff = T{184, "This building has been turned off."},
	SuspendedDustStorm = T{185, "Doesn't function during Dust Storms."},
	Suspended = T{7524, "Building disabled by lightning strike. Will resume work in several hours."},
	NoDeposits = T{187, "No deposits"},
	NoExploitableDeposits = T{188, "There are no exploitable deposits in range"},
	NoStorageSpace = T{189, "Storage space is full"},
	TooFarFromWorkforce = T{190, "This building requires Colonists and is too far from your Domes."},
	InactiveWorkshift = T{191, "Inactive work shift"},
	NotEnoughWorkers = T{192, "Not enough Workers"},
	NoPower = T{193, "Not enough Power"},
	NoOxygen = T{194, "Not enough Oxygen"},
	NoWater = T{195, "Not enough Water"},
	NotConnectedToPowerGridConsumer = T{196, "Must be connected to a Power consumer"},
	NotConnectedToPowerGridProducer = T{197, "Must be connected to a Power producer"},
	NotConnectedToWaterConsumer = T{198, "Must be connected to a Water consumer"},
	NotConnectedToWaterProducer = T{199, "Must be connected to a Water producer"},
	NotConnectedToAirConsumer = T{200, "Must be connected to an Oxygen consumer"},
	NotConnectedToAirProducer = T{201, "Must be connected to an Oxygen producer"},
	NoResearch = T{202, "No research project assigned"},
	LowWind = T{203, "Not producing due to low wind and elevation"},
	Renegades = T{204, "You’ll need more operational Security Stations to deal with Renegade crime in the Dome"},
	WasteRock = T{205, "Waste Rock storage is full"},
	UnexploitableDeposit = T{206, "We can't exploit this deposit with our current technology"},
	WaitingFuel = T{207, "Waiting for Fuel"},
	Default = T{208, "This building is not working"},
	Destroyed = T{209, "This building has been destroyed"},
	Consumption = T{210, "Building is waiting for <resource(1000, consumption_resource_type)> to resume working"},
	NoCrop = T{7525, "No crop set"},
	NoCommandCenter = T{632, "Outside Drone commander range"},
	NoDroneHub = T{845, "Too far from working Drone commander."},
}

function Building:GetUIWarning()
	-- errors
	local reason = false
	if not self.ui_working then
		reason = "TurnedOff" 
	elseif self.demolishing then
		reason = "Demolish"
	elseif self:IsMalfunctioned() then
		if self:DoesRequireMaintenance() then
			reason = "MalfunctionRes"
		else
			reason = "Malfunction"
		end
	elseif self.destroyed then
		reason = "Destroyed"
	elseif self.frozen then
		reason = g_ColdWave and "Frozen" or self:IsFreezing() and "FrozenPerma" or "Defrosting"
	elseif self.suspended then
		reason = self.suspended
	elseif IsKindOf(self, "BuildingDepositExploiterComponent") and not self:HasNearbyDeposits() and not self.city:IsTechResearched("NanoRefinement") then
		reason = "NoDeposits" 
	elseif IsKindOf(self, "BuildingDepositExploiterComponent") and not self:CanExploit() and not self.city:IsTechResearched("NanoRefinement") then
		reason = "NoExploitableDeposits"
	elseif IsKindOf(self, "ResourceProducer") and ResourceProducer.GetWorkNotPossibleReason(self) then 
		local waste_rock_producer = self.wasterock_producer
		if waste_rock_producer and waste_rock_producer:IsStorageFull() then
			reason = "WasteRock"
		elseif not IsKindOf(self, "WaterProducer") then
			reason = "NoStorageSpace"
		end
	elseif IsKindOf(self, "Workplace") and not self:HasNearByWorkers()  then
		reason = "TooFarFromWorkforce"
	elseif IsKindOf(self, "Workplace") and not self:HasWorkersForCurrentShift() then
		if self.active_shift == 0 and self:IsClosedShift(self.current_shift) and self:HasAnyWorkers() then
			reason = "InactiveWorkshift"
		else
			reason = "NotEnoughWorkers"
		end
	elseif IsKindOf(self, "OutsideBuildingWithShifts") and self:IsClosedShift(self.current_shift) then
		reason = "InactiveWorkshift"
	elseif IsKindOf(self, "ElectricityGridObject") and self:ShouldShowNotConnectedToPowerGridSign() then
		reason = IsKindOf(self, "ElectricityProducer") and "NotConnectedToPowerGridConsumer" or "NotConnectedToPowerGridProducer"
	elseif IsKindOf(self, "ElectricityConsumer") and self:ShouldShowNoElectricitySign() then
		reason = "NoPower"
	elseif IsKindOf(self, "LifeSupportGridObject") and self:ShouldShowNotConnectedToLifeSupportGridSign() then
		reason = IsKindOf(self, "AirProducer") and "NotConnectedToAirConsumer"
			or IsKindOf(self, "WaterProducer") and "NotConnectedToWaterConsumer"
			or self:NeedsAir() and #self.air.grid.producers <= 0 and "NotConnectedToAirProducer"
			or self:NeedsWater() and "NotConnectedToWaterProducer"
	elseif IsKindOf(self, "LifeSupportConsumer") and self:ShouldShowNoAirSign() then
		reason = "NoOxygen"
	elseif IsKindOf(self, "LifeSupportConsumer") and self:ShouldShowNoWaterSign() then
		reason = "NoWater"
	elseif IsKindOf(self, "ResearchLab") and not self:TechId() then
		reason = "NoResearch"
	elseif IsKindOf(self, "WindTurbine") and not self:IsProducingEnoughToWork() then
		reason = "LowWind"
	elseif IsKindOf(self, "SecurityStation") and self:GetAdjustedRenegades()>0 then
		reason = "Renegades"
	elseif IsKindOf(self, "BuildingDepositExploiterComponent") and self:IsTechLocked() then
		reason = "UnexploitableDeposit"
	elseif IsKindOf(self, "SupplyRocket") and self.landed and not self:HasEnoughFuelToLaunch() then
		--reason = "WaitingFuel"
	elseif not self:CanConsume() then
		reason = "Consumption"
	elseif self:ShouldShowNoCCSign() then
		reason = "NoDroneHub"
	end
	
	if not reason then
		reason = self:GetNotWorkingReason()
	end
	if not reason or reason == "NotLanded" then
		return
	end
	local text = NotWorkingWarning[reason]
	if not text then
		assert(false, "No display text associated with a not working reason " .. reason)
		return NotWorkingWarning.Default
	end
	return text
end

function Building:ShowUISectionConsumption()
	return
		self:IsKindOf("ElectricityConsumer") and self.electricity_consumption
			and (self.electricity_consumption>0 or self:GetClassValue("electricity_consumption")>0)
		or self:IsKindOf("LifeSupportConsumer")
			and ((self.air_consumption and (self.air_consumption>0 or self:GetClassValue("air_consumption")>0))
				or (self.water_consumption and (self.water_consumption>0 or self:GetClassValue("water_consumption")>0)))
		or self:IsKindOf("HasConsumption") and self:DoesHaveConsumption()
		or #(self.upgrade_consumption_objects or empty_table)>0 
end

ConsumptionStatuses = {
	Power = T{334, "Power<right><green><power(electricity_consumption)></green>"},
	PowerNotEnough = T{335, "Insufficient Power<right><red><power(electricity_consumption)></red>"},
	PowerRequired = T{336, "Required Power<right><power(electricity_consumption)>"},
	Oxygen = T{337, "Oxygen<right><green><air(air_consumption)></green>"},
	OxygenNotEnough = T{338, "Insufficient Oxygen<right><red><air(air_consumption)></red>"},
	OxygenRequired = T{339, "Required Oxygen<right><air(air_consumption)>"},
	Water = T{340, "Water<right><green><water(water_consumption)></green>"},
	WaterNotEnough = T{341, "Insufficient Water<right><red><water(water_consumption)></red>"},
	WaterRequired = T{342, "Required Water<right><water(water_consumption)>"},
	InsufficientResource = T{343, "Insufficient <resource(consumption_resource_type)><right><red><resource(consumption_stored_resources,consumption_max_storage,consumption_resource_type)></red>"},
	Resource = T{344, "Stored <resource(consumption_resource_type)><right><resource(consumption_stored_resources,consumption_max_storage,consumption_resource_type)>"},
	StoredWater = T{7336, "Stored Water<right><water(stored_water,water_capacity)>"},
}

function Building:UpdateUISectionConsumption(win)
	local intentionally_not_consuming = self:IsSupplyGridDemandStoppedByGame()
	local permited = self:IsWorkPermitted()
	
	win.idPower:SetText("")
	win.idAir:SetText("")
	win.idWater:SetText("")
	win.idResource:SetText("")

	local not_permited = (not permited or intentionally_not_consuming)
	if self:IsKindOf("ElectricityConsumer") and self.electricity_consumption
		and (self.electricity_consumption>0 or self:GetClassValue("electricity_consumption")>0) 
	then
		local not_enough = self:ShouldShowNoElectricitySign() and not (intentionally_not_consuming or self.suspended)
		win.idPower:SetText(
			not_enough and ConsumptionStatuses["PowerNotEnough"]
			or not_permited and ConsumptionStatuses["PowerRequired"]
			or ConsumptionStatuses["Power"])
	end
	if self:IsKindOf("LifeSupportConsumer") then
		if self.air_consumption and (self.air_consumption>0 or self:GetClassValue("air_consumption")>0) then
			local no_air = not (self:HasAir() or intentionally_not_consuming) and permited
			win.idAir:SetText(
				no_air and ConsumptionStatuses["OxygenNotEnough"]
				or not_permited and ConsumptionStatuses["OxygenRequired"]
				or ConsumptionStatuses["Oxygen"])
		end
		if IsKindOf(self, "ArtificialSun") then
			if self.work_state ~= "produce" then
				win.idWater:SetText(
					not (self:HasWater() or intentionally_not_consuming) and permited and ConsumptionStatuses["WaterNotEnough"]
					or not_permited and ConsumptionStatuses["WaterRequired"]
					or T{345, "Water<right><green><water(number)></green>", number = self.water.current_consumption})
				win.idStoredWater:SetText(ConsumptionStatuses["StoredWater"])
			end
		elseif self.water_consumption and (self.water_consumption>0 or self:GetClassValue("water_consumption")>0) then
			local no_water = not (self:HasWater() or intentionally_not_consuming) and permited 
			win.idWater:SetText(
				no_water and ConsumptionStatuses["WaterNotEnough"]
				or not_permited  and ConsumptionStatuses["WaterRequired"]
				or ConsumptionStatuses["Water"])
		end
	end
	if self:IsKindOf("HasConsumption") and self:DoesHaveConsumption() and self.consumption_stored_resources then
		win.idResource:SetText(
			self.consumption_stored_resources > 0 and ConsumptionStatuses["Resource"] 
			or ConsumptionStatuses["InsufficientResource"])
	end

	-- consumption from upgrades
	if #(self.upgrade_consumption_objects or empty_table)>0 then
		local texts = {}
		for _,cons_obj in ipairs(self.upgrade_consumption_objects) do
			if self.upgrade_on_off_state[cons_obj.upgrade_id] then
				local res_type = cons_obj.consumption_resource_type
				texts[#texts+1] = T{7767, "<resource_name><right><resource(consumed_amount,res_type)>",resource_name = Resources[res_type].display_name,  res_type = res_type, consumed_amount = cons_obj.consumption_amount }
			end
		end
		win.idUpgrade:SetText(table.concat(texts, "<newline>"))
	end
end

function Building:GetUISectionConsumptionRollover()
	local items = {}
	items[#items+1] = self:IsKindOf("Dome") and T{8652, "The total consumption of the Dome and all buildings inside is indicated in the infopanel. Individual consumption of the Dome is in parentheses. Red text indicates that the required resource is not provided."}
		or T{315, "Current consumption of this building is indicated in the infopanel. Red text indicates that the required resource is not provided."}
	items[#items+1] = T{8653, "<newline><center><em>Grid Parameters<left></em>"}
	local grid = false
	if self:IsKindOf("ElectricityConsumer") and self.electricity_consumption and (self.electricity_consumption>0 or self:GetClassValue("electricity_consumption")>0) then
		grid = self.electricity.grid
		items[#items+1] = T{318, "Power production<right><power(current_production)>", grid}
		items[#items+1] = T{319, "Max production<right><power(production)>", grid}
		items[#items+1] = T{320, "Power consumption<right><power(current_consumption)>", grid}
		items[#items+1] = T{321, "Total demand<right><power(consumption)>", grid}
		items[#items+1] = T{322, "Stored Power<right><power(current_storage)>", grid}
		if self:GetColdPenalty()>0 then
			items[#items+1] = T{317, "<em>The Power consumption of this building is increased by <red><percent(ColdPenalty)></red> due to low temperature</em>", self}
		end
		items[#items+1] = T{316, "<newline>"}
	end
	if self:IsKindOf("LifeSupportConsumer") and self.air_consumption and (self.air_consumption>0 or self:GetClassValue("air_consumption")>0) then
		grid = self.air.grid
		items[#items+1] = T{324, "Oxygen production<right><air(current_production)>", grid}
		items[#items+1] = T{325, "Max production<right><air(production)>", grid}
		items[#items+1] = T{326, "Oxygen consumption<right><air(current_consumption)>", grid}
		items[#items+1] = T{327, "Total demand<right><air(consumption)>", grid}
		items[#items+1] = T{328, "Stored Oxygen<right><air(current_storage)>", grid}
		items[#items+1] = T{316, "<newline>"}
	end
	if self:IsKindOf("LifeSupportConsumer") and self.water_consumption and (self.water_consumption>0 or self:GetClassValue("water_consumption")>0) then
		grid = self.water.grid
		items[#items+1] = T{329, "Water production<right><water(current_production)>", grid}
		items[#items+1] = T{330, "Max production<right><water(production)>", grid}
		items[#items+1] = T{331, "Water consumption<right><water(current_consumption)>", grid}
		items[#items+1] = T{332, "Total demand<right><water(consumption)>", grid}
		items[#items+1] = T{333, "Stored Water<right><water(current_storage)>", grid}
		items[#items+1] = T{316, "<newline>"}
	end
		-- consumption from upgrades
	if #(self.upgrade_consumption_objects or empty_table)>0 then
		for _, cons_obj in ipairs(self.upgrade_consumption_objects) do
			if self.upgrade_on_off_state[cons_obj.upgrade_id] then
				local res_type = cons_obj.consumption_resource_type
				items[#items+1] = T{7768, "Stored <resource_name><right><resource(stored,max_stored,res_type)>",resource_name = Resources[res_type].display_name,  res_type = res_type, stored = cons_obj.consumption_stored_resources, max_stored =  cons_obj.consumption_max_storage }
			end
		end	
		items[#items+1] = T{316, "<newline>"}
	end

	return table.concat(items, Untranslated("<newline><left>"))
end

function Building:GetBroadcastLabel()
	return self.template_name ~= "" and self.template_name or self.class
end

function Building:TogglePriority(change, broadcast)
	TaskRequester.TogglePriority(self, change)
	RebuildInfopanel(self)
	if broadcast then
		BroadcastAction(self, function(obj)
			assert(IsValid(obj))
			if not obj.destroyed then
				obj:SetPriority(self.priority)
			end
		end)
	end
end

function Building:UIRequestMaintenance(broadcast)
	self:RequestMaintenance(true)
	RebuildInfopanel(self)
	if broadcast then 
		BroadcastAction(self, "RequestMaintenance", true)
	end
end

function GetBuildingObj(bld_or_site)
	if IsKindOf(bld_or_site, "ConstructionSite") and bld_or_site.building_class_proto:IsKindOf("Building") then
		return bld_or_site.building_class_proto
	elseif IsKindOf(bld_or_site, "Building") then
		return bld_or_site
	end
end

function PlayFXBuildingType(fx, moment, city, class, ignore)
	if city.labels[class] then
		for _, bld in ipairs(city.labels[class]) do
			if bld ~= ignore then
				PlayFX(fx, moment, bld)
			end
		end
	end
	if city.labels.ConstructionSite then
		for _, site in ipairs(city.labels.ConstructionSite) do
			if site ~= ignore and IsKindOf(site.building_class_proto, class) then
				PlayFX(fx, moment, site, class)
			end
		end
	end
end

function GetAllAnimMoments(obj, anim)
	anim = anim or GetStateName(obj:GetAnim(1))
	local ttt = {}
	local ret = {}
	local c = obj:GetAnimMomentsCount(anim)
	for i = 1, c do
		local s = obj:TypeOfMoment(1, i)
		if s ~= "" then
			ttt[s] = true
		end
	end
	for k, v in pairs(ttt) do 
		table.insert(ret, k)
	end
	
	return ret
end

function TrackAllMoments(obj, fx_action, fx_actor, fx_target) --expects to obj already be playing the anim we want to track
	fx_actor = fx_actor or obj
	fx_target = fx_target or nil
	fx_action = fx_action or "TrackedAnim"
	
	local moment_names = GetAllAnimMoments(obj)
	local tracked_anim_idx = obj:GetAnim(1)
	local t = CreateGameTimeThread(function(obj, moment_names, tracked_anim_idx, fx_action, fx_actor, fx_target)
		local next_m = obj:TypeOfMoment(1, 1) or ""
		if next_m ~= "" then
			local first_moment_t = obj:TimeToMoment(1, next_m, 1) or -1
			if first_moment_t > 0 then
				AnimMomentHook.WaitAnimMoment(obj, next_m) --sleep
			end
		end
		while IsValid(obj) and obj:GetAnim(1) == tracked_anim_idx and next_m ~= "" do
			local lowest_t = 9999999
			next_m = ""
			for i = #moment_names, 1, -1 do
				local t = obj:TimeToMoment(1, moment_names[i], 1) or -1
				if t == 0 then
					PlayFX(fx_action, moment_names[i], fx_actor, fx_target)
					--print(fx_action, moment_names[i], fx_actor.class, fx_target and fx_target.class, obj:GetAnimPhase(1))
					local next_t = obj:TimeToMoment(1, moment_names[i], 2)
					if not next_t then
						table.remove(moment_names, i) --no more moments of this type
					elseif next_t < lowest_t then
						lowest_t = next_t
						next_m = moment_names[i]
					end
				elseif t > 0 and t < lowest_t then
					lowest_t = t
					next_m = moment_names[i]
				elseif t == -1 then
					--no more moments of this type remain, and anim aint looped
					table.remove(moment_names, i)
				end
			end
			
			if next_m == "" then break end
			AnimMomentHook.WaitAnimMoment(obj, next_m) --sleep
		end
	end, obj, moment_names, tracked_anim_idx, fx_action, fx_actor, fx_target)
	
	return t
end

function GetDomeSkins(template, class)
	local skins = {{template.entity, class.configurable_attaches, construction_entity = template.construction_entity}}
	ForEachPreset("DomeSkins", function(preset, grp, skins, class)
		if preset.dome_type == class.class and IsDlcAvailable(preset.dlc) then
			table.insert(skins, {preset.entity, GetConfigAttachTableFromPreset(preset),
							construction_entity = preset.construction_entity, skin_category = preset.preset})
		end
	end, skins, class)
	
	return skins
end

function GetBuildingSkins(template_name, entity)
	local template = DataInstances.BuildingTemplate[template_name]
	if not template then return {} end
	local class = ClassTemplates.Building[template.template_class]
	if IsKindOf(class, "Dome") then
		return GetDomeSkins(template, class)
	end
	local skins = { template.entity }
	for i = 2, 6 do
		local entity = template["entity" .. i]
		if entity == "" then
			break
		end
		if IsDlcAvailable(template["entitydlc" .. i]) then
			table.insert(skins, entity)
		end
	end
	if entity then
		if not table.find(skins, entity) then
			table.insert(skins, 1, entity)
		end
	end
	
	return skins
end

function Building:SetDustVisuals(dust)
	local in_dome = IsObjInDome(self)
	if in_dome and not self.destroyed then return end

	return BuildingVisualDustComponent.SetDustVisuals(self, dust)
end

----

local fx_actions = {}
do
	local suffix = "Building"
	local sizes = { "Small", "Big" }
	local actions = { "Demolish", "Remove", "Place" }
	local locs = { "Inside", "Outside" }
	for i=1,#sizes do
		local size = sizes[i]
		local str1 = suffix .. size
		fx_actions[size] = {}
		for j=1,#actions do
			local action = actions[j]
			local str2 = str1 .. action
			fx_actions[size][action] = {}
			for k=1,#locs do
				local loc = locs[k]
				local str3 = str2 .. loc
				fx_actions[size][action][loc] = str3
				fx_actions[#fx_actions + 1] = str3
			end
		end
	end
end

function PlayFXAroundBuilding(obj, action)
	if not IsValid(obj) or not obj:GetVisible() or GameTime() == 0 then
		return
	end
	local shape = GetEntityPeripheralHexShape(obj:GetEntity())
	local size = #shape > 30 and "Big" or "Small"
	local res = HexGridGetObject(ObjectGrid, obj, "DomeInterior")
	local inside = res and res.dome and obj ~= res.dome and "Inside" or "Outside"
	local action = fx_actions[size][action][inside]
	
	local pos, angle
	local orig_state = IsKindOf(obj, "Building") and obj.orig_state
	if orig_state then
		pos, angle = unpack(orig_state)
	else
		pos, angle = obj:GetPos(), obj:GetAngle()
	end
	--DbgClear()
	local dir = HexAngleToDirection(obj:GetAngle())
	local cq, cr = WorldToHex(obj:GetPos())
	for _, shape_pt in ipairs(shape) do
		local sx, sy = shape_pt:xy()
		local q, r = HexRotate(sx, sy, dir)
		local hx, hy = HexToWorld(cq + q, cr + r)
		PlayFX(action, "start", obj, nil, point(hx, hy))
		--DbgAddVector(point(hx, hy))
	end
end

function OnMsg.GatherFXActions(list)
	for i=1,#fx_actions do
		list[#list + 1] = fx_actions[i]
	end
end

GlobalVar("ShowingGridTileWaterAttachesOn", false)
function OnMsg.SelectionChange()
	if ShowingGridTileWaterAttachesOn then
		SetWaterMarkers(ShowingGridTileWaterAttachesOn, false)
		ShowingGridTileWaterAttachesOn = false
	end
	local o = SelectedObj
	if o and IsKindOf(o, "LifeSupportGridObject") and SetWaterMarkers(o, true) then
		ShowingGridTileWaterAttachesOn = o
	end
end