GlobalVar("CurrentLayoutPreset", false)
GlobalVar("CurrentLayoutPos", false)
GlobalVar("CurrentLayoutDir", false)

function RegisterLayout(preset, continue)
	if not UICity then
		return
	end
	preset = preset or Presets.LayoutConstruction.Default[preset]
	if preset then
		if not continue then
			print("Start registering layout", preset.id)
			CurrentLayoutPos = false
			CurrentLayoutDir = false
			table.iclear(preset)
			ObjModified(preset)
		elseif not CurrentLayoutPreset then
			print("Continue registering layout", preset.id)
			UICity:SetCableCascadeDeletion(false, "RegisterLayout")
			local ctrl = GetLayoutConstructionController()
			ctrl:Activate(false, {layout_preset = preset})
			ctrl:UpdateCursor(GetTerrainGamepadCursor())
			ctrl:Place()
			CurrentLayoutPos = point(WorldToHex(ctrl.last_pt))
			CurrentLayoutDir = HexAngleToDirection(ctrl.last_angle)
			ctrl:Deactivate()
			UICity:SetCableCascadeDeletion(true, "RegisterLayout")
		end
		CurrentLayoutPreset = preset
	elseif CurrentLayoutPreset then
		print("End registering layout", CurrentLayoutPreset.id)
		--CurrentLayoutPreset:Save()
		CurrentLayoutPreset = false
	end
end

function GedRpcLayoutStartRegister(socket, obj_name)
	local preset = socket:ResolveObj(obj_name)
	RegisterLayout(preset)
end

function GedRpcLayoutContinueRegister(socket, obj_name)
	local preset = socket:ResolveObj(obj_name)
	RegisterLayout(preset, true)
end

function GedRpcLayoutStopRegister(socket)
	RegisterLayout(false)
end

----

local supported_contstruction_modes = {
	construction = true
}

local function LayoutAddConstructionEntry(template, pos, angle, params, instant)
	if not CurrentLayoutPreset then
		return
	end
	
	local template_obj = ClassTemplates.Building[template]
	if not template_obj or not supported_contstruction_modes[template_obj.construction_mode] then
		print(template, "isn't supported by layout construction!")
		return
	end
	
	local hpos = point(WorldToHex(pos))
	local hdir = HexAngleToDirection(angle)
	
	CurrentLayoutPos = CurrentLayoutPos or hpos
	CurrentLayoutDir = CurrentLayoutDir or hdir
	
	params = params or empty_table
	local entity_t = params.alternative_entity_t or empty_table
	local entry = LayoutConstructionEntry:new{
		template = template,
		pos = (hpos - CurrentLayoutPos):SetInvalidZ(),
		dir = hdir - CurrentLayoutDir,
		instant = instant,
		-- building params
		entity =      entity_t.entity or nil,
		palette =     entity_t.palette or nil,
		-- grid params
		pillar =      params.pillar or nil,
		connect_dir = params.connect_dir or nil,
		grid_skin =   params.construction_grid_skin or nil,
	}
	
	table.insert(CurrentLayoutPreset, entry)
	ObjModified(CurrentLayoutPreset)
	print(template, "added to layout", CurrentLayoutPreset.id)
	return entry
end

OnMsg.ConstructionSitePlace = LayoutAddConstructionEntry

function OnMsg.InstantBuild(template, pos, angle, params)
	LayoutAddConstructionEntry(template, pos, angle, params, true)
end

----

local supported_grid_contstruction_modes = {
	electricity_grid = true,
	life_support_grid = true
}

local function LayoutAddGridConstructionEntry(mode, pos, current_pt1, current_pt2, grid_skin, switch_dobule_line_directions)
	if not CurrentLayoutPreset then
		return
	end
	if not supported_grid_contstruction_modes[mode] then
		print(mode, "isn't supported by layout construction!")
		return
	end

	local hpos = point(WorldToHex(pos))
	local hdir = 0
	CurrentLayoutPos = CurrentLayoutPos or hpos
	CurrentLayoutDir = CurrentLayoutDir or hdir
	
	local current_pt1_hex = point(WorldToHex(current_pt1)) - CurrentLayoutPos
	local current_pt2_hex = current_pt2 and (point(WorldToHex(current_pt2)) - CurrentLayoutPos) or nil
	
	table.insert(CurrentLayoutPreset, LayoutConstructionEntry:new{
		template = mode,
		pos = (hpos - CurrentLayoutPos):SetInvalidZ(),
		dir = 0,
		grid_skin = grid_skin,
		cur_pos1 = current_pt1_hex:SetInvalidZ(),
		cur_pos2 = current_pt2_hex and current_pt2_hex:SetInvalidZ() or point20,
		switch_dobule_line_directions = switch_dobule_line_directions, --irrelevant, since we force feed it the control points
		grid_skin = grid_skin,
	})
	ObjModified(CurrentLayoutPreset)
	
	print(mode, "added to layout", CurrentLayoutPreset.id)
end

OnMsg.PlaceGridLineConstruction = LayoutAddGridConstructionEntry

----

DefineClass.LayoutConstructionEntry = {
	__parents = { "PropertyObject" },
	construction_mode = "layout",
	properties = {
		{ category = "Layout",   id = "template",      name = "Template",         editor = "choice", default = false, items = function() return BuildingsCombo() end, },
		{ category = "Layout",   id = "pos",           name = "Offset Pos (Hex)", editor = "point",  default = point20 },
		{ category = "Layout",   id = "cur_pos1",      name = "Grid Placement p1 (Hex)", editor = "point",  default = point20 },
		{ category = "Layout",   id = "cur_pos2",      name = "Grid Placement p2 (Hex)", editor = "point",  default = point20 },
		{ category = "Layout",   id = "switch_dobule_line_directions",  name = "Pipes Rotated?", editor = "bool",  default = false },
		{ category = "Layout",   id = "dir",           name = "Offset Dir (Hex)", editor = "number", default = 0 },
		{ category = "Layout",   id = "instant",       name = "Instant",       editor = "bool",   default = false, },
		{ category = "Building", id = "entity",        name = "Entity",           editor = "text",   default = "", },
		{ category = "Building", id = "palette",       name = "Palette",          editor = "text",   default = "", },
		{ category = "Grid",     id = "grid_skin",     name = "Grid Skin",        editor = "text",   default = "Default", },
	},
	EditorView = Untranslated(T(12284, "<template> <color 128 128 128><OffsetStr></color>")),
}

function LayoutConstructionEntry:GetOffsetStr()
	local str = ""
	if self.pos ~= point20 then
		str = tostring(self.pos)
	end
	if self.dir ~= 0 then
		str = str .. " " .. tostring(self.dir)
	end
	return str
end

function LayoutConstructionEntry:GetEntityData()
	return {
		entity = self.entity ~= "" and self.entity,
		palette = self.palette ~= "" and self.palette,
	}
end

----

DefineClass.LayoutConstruction = {
	__parents = { "Preset", },
	ContainerClass = "LayoutConstructionEntry",
	EditorMenubarName = "Layout Construction",
	EditorMenubar = "Editors.Game",
	GedEditor = "LayoutConstructionEditor",
}

----

DefineClass.LayoutConstructionBuilding = {
	__parents = { "Building" },
	entity = "InvisibleObject",
	construction_mode = "layout",
	properties = {
		{ template = true, category = "Layout", id = "LayoutList", name = "Layout List", editor = "choice", default = false, items = function() return PresetsCombo("LayoutConstruction") end },
	},
}

----

DefineClass.LayoutConstructionController = {
	__parents = { "ConstructionController" },
	layout_preset = false,
	last_pt = false,
	last_angle = 0,
	controllers = false,
	prefab = false,
	supplied = false,
	prefab_items = false,
	skip_items = false,
}

function LayoutConstructionController:Activate(template, params)
	self.waste_rock_from_colored_rocks = 0
	self.selected_domes = {}
	self.prefab = params and params.prefab
	self.supplied = params and params.supplied
	self.template_name = template
	self.template_obj = ClassTemplates.Building[template] or g_Classes[template] or empty_table
	self.layout_preset = Presets.LayoutConstruction.Default[self.template_obj.LayoutList] or params.layout_preset or empty_table
	self.prefab_items = {}
	self.skip_items = {}
	
	assert(#self.layout_preset > 0)
	local prefab_counters = {}
	local controllers = {}
	for _, entry in ipairs(self.layout_preset) do
		local entity = entry.entity ~= "" and entry.entity
		local template = BuildingTemplates[entry.template]
		local template_obj = ClassTemplates.Building[entry.template]
		local add = true
		local available_prefabs = 0
		if template then
			local tech_shown, tech_enabled, tech_rollover = GetBuildingTechsStatus(template.id, template.build_category)
			available_prefabs = prefab_counters[entry.template] or UICity:GetPrefabs(template.id)
			local prefab_item = template.require_prefab and RocketPayload_GetMeta(template.id)
			local require_prefab = not tech_enabled and prefab_item and not prefab_item.locked
			add = not require_prefab or (not not self.prefab)
		end
		if available_prefabs > 0 then
			self.prefab_items[entry] = available_prefabs
			prefab_counters[entry.template] = available_prefabs - 1
			add = true
		end
		if not add then
			self.skip_items[entry] = true
		end
		
		if add then
			if template_obj then
				local controller = ConstructionController:new{
					UpdateShortConstructionStatus = empty_func,
					EnableBuildGrid = empty_func,
					is_grid_controller = false,
				}
				controller:Activate(entry.template, nil, entry:GetEntityData())
				controller:Rotate(entry.dir)
				controllers[entry] = controller
			end
			
			if entry.template == "life_support_grid" or entry.template == "electricity_grid" then
				local controller = GridConstructionController:new{
					UpdateShortConstructionStatus = empty_func,
					EnableBuildGrid = empty_func,
					is_grid_controller = true,
					mode = entry.template,
				}
				
				controller.switch_dobule_line_directions = entry.switch_dobule_line_directions
				controller.skin_name = entry.grid_skin
				controller.supplied = self.supplied
				controller:InitVisuals() --needs pt for passages?
				controllers[entry] = controller
			end
		end
	end
	
	self.controllers = controllers
	self:EnableBuildGrid(true)
	self:UpdateCursor(GetUIStyleGamepad() and GetTerrainGamepadCursor() or GetTerrainCursor())
end

function LayoutConstructionController:GetBuildGridRadius()
	local bbox = box()
	for entry, controller in pairs(self.controllers or empty_table) do
		if not controller.is_grid_controller then
			local _, r = controller.cursor_obj:GetBSphere()
			local x, y = HexToWorld(entry.pos:xy())
			bbox = Extend(bbox, box(x - r, y - r, x + r, y + r))
		else
			local p = entry.pos
			while p and p ~= point20 do
				local xp = point(HexToWorld(p:xy()))
				Extend(bbox, xp)
				p = p == entry.cur_pos1 and entry.cur_pos2 or p == entry.pos and entry.cur_pos1 or false
			end
		end
	end
	local w, h = bbox:sizexyz()
	local r = Max(w, h) / 2
	return Max(r * 3, 13000)
end

function LayoutConstructionController:Deactivate()
	for entry, controller in pairs(self.controllers or empty_table) do
		controller:Deactivate()
		if controller.is_grid_controller then
			controller:Deactivate()
		end
		DoneObject(controller)
	end
	self:EnableBuildGrid(false)
	self.controllers = false
	self.last_pt = false
	self.last_angle = 0
	self:ColorRocks()
	self:ClearColorFromAllConstructionObstructors()
	WaterMarkerCollisionDetector = false
end

function LayoutConstructionController:PlaceCursors(test)
	local controllers = self.controllers
	assert(controllers)
	if not controllers then
		return
	end
	if not test then
		SuspendPassEdits("LayoutConstructionController:PlaceCursors")
	else
		WaterMarkerCollisionDetector = {}
	end
	local q, r = WorldToHex(self.last_pt)
	local dir = HexAngleToDirection(self.last_angle)
	for i, entry in ipairs(self.layout_preset) do
		if not self.skip_items[entry] then
			local dq, dr = HexRotate(entry.pos, dir)
			local pos1 = point(HexToWorld(q + dq, r + dr))
			--print("test", test, entry.template, "q", q, "dq", dq, "r",r, "dr", dr)
			local angle1 = (dir + entry.dir) * (60 * 60)
			local controller = controllers[entry]
			if not controller then
				--
			elseif test then
				if not controller.is_grid_controller then
					controller:UpdateCursor(pos1)
				else
					controller.starting_point = pos1
					local input_points = {}
					dq, dr = HexRotate(entry.cur_pos1, dir)
					table.insert(input_points, point(HexToWorld(q + dq, r + dr)))
					if entry.cur_pos2 ~= point20 then
						dq, dr = HexRotate(entry.cur_pos2, dir)
						table.insert(input_points, point(HexToWorld(q + dq, r + dr)))
					end
					controller:UpdateVisuals(input_points[#input_points], input_points)
				end
			else
				if controller.is_grid_controller then
					controller:Activate()
				else
					local params = {
						alternative_entity_t = entry:GetEntityData(),
						supplied = self.supplied or self.prefab_items[entry],
						prefab = self.prefab or self.prefab_items[entry],
						dont_consume_prefab = self.prefab,
						dome_skin = controller.dome_skin,
					}
					controller:Place(false, false, false, params, entry.instant)
				end
			end
		end
	end
	
	if not test then
		ResumePassEdits("LayoutConstructionController:PlaceCursors")
		if self.prefab then
			UICity:AddPrefabs(self.template_name, -1)
			if self.prefab and UICity:GetPrefabs(self.template_name) <= 0 then
				--[[
				--if dlg should remain:
				self.prefab = false
				self.supplied = false
				for entry, controller in pairs(self.controllers or empty_table) do
					if controller.is_grid_controller then
						controller.supplied = false
					end
				end
				]]	
				--if dlg should close:
				CloseModeDialog()
				return true
			end
		end
	end	
end

function LayoutConstructionController:UpdateCursor(pt)
	self.last_pt = pt or self.last_pt
	self:PlaceCursors("test")
	if pt then
		ShowNearbyHexGrid(HexGetNearestCenter(pt))
	end
	self:UpdateConstructionObstructors()
	self:UpdateConstructionStatuses() --should go after obstructors
	self:UpdateShortConstructionStatus()
	ObjModified(self)
end

function LayoutConstructionController:UpdateConstructionObstructors()
	local obstructors = {}
	for entry, controller in pairs(self.controllers or empty_table) do
		for _, obstructor in ipairs(controller.construction_obstructors or empty_table) do
			obstructors[obstructor] = true
		end
	end
	self.construction_obstructors = table.keys(obstructors)
end

function LayoutConstructionController:UpdateConstructionStatuses()
	local statuses = {}
	for entry, controller in pairs(self.controllers or empty_table) do
		for _, status in ipairs(controller.construction_statuses or empty_table) do
			statuses[status] = true
		end
	end
	self.construction_statuses = table.keys(statuses)
	SortConstructionStatuses(self.construction_statuses)
end

function LayoutConstructionController:Rotate(delta)
	self.last_angle = self.last_angle + delta*60*60
	for entry, controller in pairs(self.controllers or empty_table) do
		if not controller.is_grid_controller then
			controller:Rotate(delta)
		end
	end
	self:UpdateCursor()
end

function LayoutConstructionController:Place()
	local s = self:GetConstructionState()
	if s == "error" or not self.last_pt then
		return false
	end
	self:PlaceCursors()
	return true
end

function LayoutConstructionController:HasConstructionCost()
	for entry, controller in pairs(self.controllers or empty_table) do
		if not controller.is_grid_controller then
			if controller:HasConstructionCost() then
				return true
			end
		else
			return true
		end
	end
	return false
end

function GetLayoutConstructionBuildingCost(template_obj)
	if IsGameRuleActive("FreeConstruction") then
		return T(10540, "Cost: Nothing (Free Construction rule)"),false
	end
		
	local costs = {}
	local layout_preset = Presets.LayoutConstruction.Default[template_obj.LayoutList]  or empty_table
	assert(#layout_preset > 0)
	-- addd buildings cost 	
	for _, entry in ipairs(layout_preset) do
		local entity = entry.entity ~= "" and entry.entity
		if entry.template~="life_support_grid" and entry.template~="electricity_support_grid" then
			local template_class = ClassTemplates.Building[entry.template]
			local mod_o = GetModifierObject(template_class.template_name)
			for _, resource in ipairs(ConstructionResourceList) do
				local amount = UICity:GetConstructionCost(template_class, resource, mod_o)
				if amount > 0 then
					costs[resource] = (costs[resource] or 0) + amount
				end
			end	
		end	
	end

	local items = {}
	for resource, amount in pairs(costs) do
		items[#items+1]  = T{901, "<resource_name><right><resource(number,resource)>", resource_name = Resources[resource].display_name, number = amount, resource = resource }
	end
	if #items > 0 then
		return table.concat(items, "<newline><left>"), costs
	else
		return T(902, "Doesn't require construction resources"), costs
	end
end

function LayoutConstructionController:GetConstructionCost()
	if not self:HasConstructionCost() then
		return ""
	end	
	return GetLayoutConstructionBuildingCost(self.template_obj)
end

function LayoutConstructionController:HasConsumption()
	for entry, controller in pairs(self.controllers or empty_table) do
		if not controller.is_grid_controller then
			if controller:HasConsumption() then
				return true
			end
		end
	end
	return false
end

function LayoutConstructionController:GetConsumption()
	local costs = {}
	local display_names = {}
	for entry, controller in pairs(self.controllers or empty_table) do
		if not controller.is_grid_controller then
			local template_obj = controller.template_obj
			local modifier_obj = GetModifierObject(template_obj.template_name)
			for i = 1, #maintenance_props do
				local prop = table.find_value(template_obj.properties, "id", maintenance_props[i][1])
				local disable_prop = table.find_value(template_obj.properties, "id", "disable_" .. maintenance_props[i][1])
				if prop and template_obj[prop.id] ~= 0 then
					local val = disable_prop and modifier_obj:ModifyValue(template_obj[disable_prop.id], disable_prop.id) >= 1
							and 0 or modifier_obj:ModifyValue(template_obj[prop.id], prop.id)

					local resource = maintenance_props[i][2]
					costs[resource] = (costs[resource] or 0) + val
					display_names[resource] = maintenance_props[i][3]
				end
			end
		end
	end

	local items = {}
	for resource, amount in pairs(costs) do
		items[#items+1] = T{901, "<resource_name><right><resource(number,resource)>", resource_name = display_names[resource], number = amount, resource = resource }
	end

	return table.concat(items, "<newline><left>")
end

GlobalVar("CityLayoutConstruction", {})

function GetLayoutConstructionController()
	local obj = CityLayoutConstruction[UICity]
	if not obj then
		obj = LayoutConstructionController:new()
		CityLayoutConstruction[UICity] = obj
	end
	return obj
end

function GetLayoutConstructionControllerBMDescription(template, texts, dont_modify)
	local available_prefabs = UICity:GetPrefabs("SelfSufficientDome")
	if available_prefabs>0 then
		texts[#texts+1] = T{3969, "Available prefabs: <number>", number = available_prefabs}
	else
		local text, costs = GetLayoutConstructionBuildingCost(template)
		if costs and next(costs) then
			local cost1 = {}
			for resource, cost in pairs(costs) do
				cost1[#cost1+1] =  FormatResource(empty_table, cost, resource)
			end
			if next(cost1)then
				texts[#texts+1] =  T(263, "Cost: ")..table.concat(cost1," ")
			end
		else
			texts[#texts+1] = text
		end
	end
	local layout_preset = Presets.LayoutConstruction.Default[template.LayoutList]  or empty_table
	assert(#layout_preset > 0)
	
	local consumption = {}
	local maintenance = {}
	local consumption_res = {}
	local entry_templates = {}
	
	for _, entry in ipairs(layout_preset) do
		local entity = entry.entity ~= "" and entry.entity
		if entry.template~="life_support_grid" and entry.template~="electricity_support_grid" then
			local template_class = ClassTemplates.Building[entry.template]
			 entry_templates[#entry_templates +1] = template_class
		end	
	end		
	
	for i = 1, #maintenance_props do
		local maintenance_prop = maintenance_props[i][1]
		local consumption_resource =  maintenance_props[i][2]
		
		local val = 0
		for idx, template_class in ipairs(entry_templates) do
			local properties = template_class.properties
			local modifier_obj = GetModifierObject(template_class.template_name)
			local prop = table.find_value(properties, "id", maintenance_prop)
			if prop then
				if not dont_modify then
					local disable_prop = table.find_value(properties, "id", "disable_" .. maintenance_prop)
					val = val + (disable_prop and modifier_obj:ModifyValue(template_class[disable_prop.id], disable_prop.id) >= 1
									and 0 or modifier_obj:ModifyValue(template_class[prop.id], prop.id))
				else
					val = val + template_class[prop.id]
				end
			end	
			-- calc only ones additional consumption_res and maintanence
			if i==1  then
				if template_class:DoesHaveConsumption() then
					consumption_res[template_class.consumption_resource_type] = consumption_res[template_class.consumption_resource_type] + 1000
				end
				-- maintanence
				if template_class:DoesRequireMaintenance() and template_class:DoesMaintenanceRequireResources()
					and (dont_modify or modifier_obj:ModifyValue(template_class.disable_maintenance, "disable_maintenance") <= 0) then
					maintenance[template_class.maintenance_resource_type] = (maintenance[template_class.maintenance_resource_type] or 0) + template_class.maintenance_resource_amount
				end
			end
		end
		if val ~= 0 then
			consumption[#consumption + 1] = FormatResource(empty_table, val, consumption_resource)
		end
	end

	if next(consumption) then
		local c_text = ""
      for res, val in pairs(consumption_res) do
			c_text = c_text .. FormatResource(empty_table, val, res).." "
		end	
		if c_text~="" then
			consumption[#consumption + 1] = c_text
		end	
		texts[#texts+1] = T(3959, "Consumption: ") .. table.concat(consumption, " ")
	end
	if next(maintenance) then
		local m_text = ""
      for res, val in pairs(maintenance) do
			m_text = m_text .. FormatResource(empty_table, val, res).." "
		end	
		texts[#texts+1] = T(12398, "Maintenance: ") .. m_text
	end

	return table.concat(texts, "\n")
end

DefineClass.LayoutConstructionDialog = {
	__parents = { "ConstructionModeDialog" },
	mode_name = "layout",
}