DefineClass.LevelPrefabBuilding = {
	__parents = { "Building" },
	flags = { cfBlockPass = true },
	
	properties = {
		{ template = true, category = "Construction", name = T(12285, "Prefab Base Name"),   id = "PrefabBaseName", editor = "text",         default = "" },
		{ template = true, category = "Construction", name = T(12286, "Prefab Type"),        id = "PrefabType",     editor = "dropdownlist", default = "", items = function() return PrefabTypesCombo() end },
		{ template = true, category = "Construction", name = T(12287, "Prefab Style"),       id = "PrefabStyle",    editor = "dropdownlist", default = "", items = function() return PrefabStylesCombo() end },
		{ template = true, category = "Construction", name = T(12288, "Prefab Op Override"), id = "PrefabApplyOp",  editor = "dropdownlist", default = "+", items = ApplyHeightOpCombo{value = false, text = "None"},},
	},
	
	landscape_construction_visuals = true,
	use_demolished_state = false,
	construction_mode = "level_prefab",
	objs = false,
}

function LevelPrefabBuilding_InstantiatePrefab(self, height_op, more_enum_flags_to_clear, per_obj_func)
	more_enum_flags_to_clear = more_enum_flags_to_clear or 0
	local prefab_name = (self.construction_data or empty_table).prefab_name
	local prefab = prefab_name and PrefabMarkers[prefab_name]
	assert(prefab, "No such level prefab!")
	if prefab then
		local offset = prefab.dummy_offset or point30
		local angle = self:GetAngle()
		local pos = self:GetPos() - Rotate(offset, angle)
		local err, bbox, objs = PlacePrefab(prefab_name, pos, angle, height_op)
		for _, obj in ipairs(objs) do
			if IsValid(obj) and obj:IsValidPos() and obj:GetVisible() then
				Flight_Mark(obj)
				obj:ClearEnumFlags(const.efSelectable + more_enum_flags_to_clear)
				if per_obj_func then
					per_obj_func(obj)
				end
			end
		end
		assert(not err, err)
		return objs
	end
	return false
end

function LevelPrefabBuilding:GameInit()
	self.objs = LevelPrefabBuilding_InstantiatePrefab(self, self.PrefabApplyOp)
end

function LevelPrefabBuilding:Done()
	self:DeletePrefabObjs()
	self:RestoreTerrain(false, true, true)
end

function LevelPrefabBuilding:DeletePrefabObjs()
	for _, obj in ipairs(self.objs or empty_table) do
		if IsValid(obj) then
			Flight_Unmark(obj)
			DoneObject(obj)
		end
	end
end

----

DefineClass.LevelPrefabDialog = {
	__parents = { "ConstructionModeDialog" },
	mode_name = "level_prefab",
}

----

GlobalVar("CityLevelPrefabConstruction", {})

function GetLevelPrefabConstructionController()
	local obj = CityLevelPrefabConstruction[UICity]
	if not obj then
		obj = LevelPrefabController:new()
		CityLevelPrefabConstruction[UICity] = obj
	end
	return obj
end

DefineClass.LevelPrefabController = {
	__parents = { "ConstructionController" },
	prefab_names = false,
	prefab_idx = 1,
	last_align_pos = false,
	last_pos = point20,
	last_angle = 0,
	objs = false,
}

function LevelPrefabController:Activate(...)
	self:DeletePrefab()
	self.prefab_idx = 1
	self.prefab_names = false
	return ConstructionController.Activate(self, ...)
end

function LevelPrefabController:Deactivate(...)
	self:DeletePrefab()
	return ConstructionController.Deactivate(self, ...)
end

function LevelPrefabController:DeletePrefab()
	for _, obji in ipairs(self.objs or empty_table) do
		if IsValid(obji) then
			DoneObject(obji)
		end
	end
	self.objs = nil
end

function LevelPrefabController:GetPrefabNames()
	local names = self.prefab_names
	if not names then
		names = {}
		local base_name = self.template_obj.PrefabBaseName
		local prefab_type = self.template_obj.PrefabType
		local prefab_style = self.template_obj.PrefabStyle
		for _, marker in ipairs(PrefabMarkers) do
			if marker.type == prefab_type
			and marker.style == prefab_style
			and string.starts_with(marker.name, base_name, true)
			then
				names[#names + 1] = PrefabMarkers[marker]
			end
		end
		self.prefab_names = names
	end
	return names
end

function LevelPrefabController:AddConstructionData(data)
	ConstructionController.AddConstructionData(self, data)
	data.prefab_name = self:GetPrefabNames()[self.prefab_idx]
end

DefineClass.LevelPrefabDummy = {
	__parents = { "Shapeshifter", "AutoAttachObject", "NightLightObject" },
	flags = { cfNoHeightSurfs = true, efCollision = false, efApplyToGrids = false, efWalkable = false, efBakedTerrainDecal = false, efSelectable = false },
}

function LevelPrefabController:PlacePrefab()
	local name = self:GetPrefabNames()[self.prefab_idx]
	local pos = self.cursor_obj:GetVisualPos()
	local axis = self.cursor_obj:GetAxis()
	local angle = self.cursor_obj:GetAngle()
	if not self.objs then
		local prefab_name = self:GetPrefabNames()[self.prefab_idx]
		local prefab = PrefabMarkers[prefab_name]
		if not prefab then
			print("No prefab found:", prefab_name)
			return
		end
		SuspendPassEdits("PlacePrefab")
		local offset = prefab.dummy_offset or point30
		local prefab_pos = pos - Rotate(offset, angle)
		local ground_offsets = {}
		local cursors = {}
		local err, objs = PlacePrefabObjs(prefab_name, prefab_pos, 0, ground_offsets)
		for _, obj in ipairs(objs) do
			if IsValid(obj) and obj:IsValidPos() and obj:GetVisible() then
				local cursor = LevelPrefabDummy:new()
				cursor:ChangeEntity(obj:GetEntity())
				cursor:SetScale(obj:GetScale())
				cursor:SetAngle(obj:GetAngle())
				cursor:SetAxis(obj:GetAxis())
				cursor:SetPos(obj:GetPos())
				cursor.GroundOffset = ground_offsets[obj]
				cursors[#cursors + 1] = cursor
			end
			DoneObject(obj)
		end
		self.last_angle = 0
		self.last_pos = pos
		self.objs = cursors
		ResumePassEdits("PlacePrefab")
	end
	local clr = self.cursor_obj:GetColorModifier()
	local objs = self.objs or empty_table
	local default_offset = Object.GroundOffset
	RotateObjectsAroundCenter(objs, angle - self.last_angle, pos)
	local dx, dy = (pos - self.last_pos):xy()
	for _, obj in ipairs(objs) do
		if obj:IsValidPos() then
			local x, y, z = obj:GetPos():xyz()
			if not z then
				obj:ClearCachedZ()
				z = const.InvalidZ
			else
				local dz = rawget(obj, "GroundOffset") or default_offset
				if dz ~= default_offset then
					z = terrain.GetHeight(x, y) + dz
				end
			end
			obj:SetPos(x + dx, y + dy, z)
			obj:SetColorModifier(clr)
		end
	end
	self.last_angle = angle
	self.last_pos = pos
end

function LevelPrefabController:UpdateCursor(pos, ...)
	ConstructionController.UpdateCursor(self, pos, ...)
	local align_pos = HexGetNearestCenter(pos)
	if self.last_align_pos ~= align_pos then
		self.last_align_pos = align_pos
		self:PlacePrefab()
	end
end

function LevelPrefabController:Rotate(...)
	ConstructionController.Rotate(self, ...)
	self:PlacePrefab()
end

function LevelPrefabController:HasVariants()
	return #self:GetPrefabNames() > 1
end

function LevelPrefabController:ChangeCursorObj(dir)
	self.prefab_idx = self.prefab_idx + dir
	if self.prefab_idx <= 0 then
		self.prefab_idx = #self:GetPrefabNames()
	elseif self.prefab_idx > #self:GetPrefabNames() then
		self.prefab_idx = 1
	end
	self:DeletePrefab()
	self:PlacePrefab()
end