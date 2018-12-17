local function ModItemChildCombo(self)
	local container = self.mod and self.mod.items or ""
	local mod_entities = {}
	for i=1,#container do
		local content = container[i]
		if IsKindOf(content, "ModItemEntity") and IsValidEntity(content.entity_name) then
			mod_entities[content.entity_name] = true
		end
	end
	local entity_map = GetAllEntities()
	entity_map[""] = nil
	local items = table.keys(entity_map)
	table.sort(items, function(e1, e2)
		local p1 = mod_entities[e1] and 1 or 0
		local p2 = mod_entities[e2] and 1 or 0
		return p1 == p2 and string.cmp_lower(e1, e2) < 0 or p1 < p2
	end)
	table.insert(items, 1, "")
	return items
end

local function ModItemParentCombo(self)
	local items = {}
	for id, template in pairs(BuildingTemplates) do
		items[#items + 1] = id
	end
	table.sort(items)
	table.insert(items, 1, "")
	return items
end

local function ModItemAttachmentSpots(entity)
	local items = {}
	local spot_max_counters = {}
	if IsValidEntity(entity) then
		local state = EntityStates.idle
		local idx1, idx2 = GetAllSpots(entity, state)
		if idx1 ~= -1 then
			local idx_to_name = {}
			for i = idx1, idx2 do
				local name = GetSpotName(entity, i) or ""
				if name ~= "" then
					idx_to_name[i] = name
					spot_max_counters[name] = (spot_max_counters[name] or 0) + 1
				end
			end
			local spot_counters = {}
			for idx, name in pairs(idx_to_name) do
				local offset = spot_counters[name] or 0
				local value = name
				if spot_max_counters[name] > 1 then
					spot_counters[name] = offset + 1
					value = value .. " " .. (offset + 1)
				end
				items[#items + 1] = {
					value = value,
					name = name,
					offset = offset,
					idx = idx,
				}
			end
		end
	end
	table.sort(items, function(v1, v2)
		local cmp = string.cmp_lower(v1.name, v2.name)
		if cmp == 0 then
			return v1.offset < v2.offset
		else
			return cmp < 0
		end
	end)
	return items
end

local function ModItemAttachmentSpotsCombo(self)
	local entity = self:ResolveParentEntity()
	local spots = ModItemAttachmentSpots(entity)
	local items = {""}
	for i=1,#spots do
		items[#items + 1] = spots[i].value
	end
	return items
end

DefineClass.ModItemAttachmentObject =
{
	__parents = { "Shapeshifter", },
	mod_item = false,
}

DefineClass.ModItemAttachmentEditorObject =
{
	__parents = { "ModItemAttachmentObject", "AutoAttachObject"},
	enum_flags = { efWalkable = false, efApplyToGrids = false, efCollision = false },
	template_name = "",
	template_classdef = false,
}

function ModItemAttachmentEditorObject:GetShapePoints()
	return GetEntityOutlineShape(self:GetEntity())
end

function ModItemAttachmentEditorObject:GetBuildShape()
	local classdef = self.template_classdef
	return classdef and classdef.GetBuildShape(self)
end

function ModItemAttachmentEditorObject:GetFlattenShape()
	local classdef = self.template_classdef
	return classdef and classdef.GetFlattenShape(self)
end

local surf_flags = const.efCollision + const.efApplyToGrids + const.efWalkable
function ClearSurfFlags(obj)
	obj:ClearEnumFlags(surf_flags)
	obj:ForEachAttach(ClearSurfFlags)
end

local AttachEvents = {
	{id = "place", name = "always"},
	{id = "work",  name = "when working"},
	{id = "night", name = "during night"},
	{id = "day",   name = "during day"},
}
local def_event = AttachEvents[1].id
local no_clr = const.clrNoModifier
local max_rot = 180*60
local max_off = 10*guim

GlobalVar("ModItemAttachment_Item", false)
GlobalVar("ModItemAttachment_ParentObj", false)
GlobalVar("ModItemAttachment_ChildObj", false)
GlobalVar("ModItemAttachment_Thread", false)

DefineClass.ModItemAttachment = {
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "Parent",  name = T(1000069, "Parent entity"), editor = "choice", default = "",   items = ModItemParentCombo, object_update = true, editor_update = "items", buttons = {{"Ground", "ActionGround"}} },
		{ category = "General", id = "Child",   name = T(1000071, "Child entity"),  editor = "choice", default = "",   items = ModItemChildCombo, editor_update = "items" },
		{ category = "General", id = "AttachSpot",    name = T(1000072, "Anchor"),  editor = "choice", default = "",   items = ModItemAttachmentSpotsCombo, buttons = {{"View", "ActionViewSpots"}} },
		
		{ category = "General", id = "AttachOffset",  name = T(1000073, "Offset"),            editor = "point",        default = point30, scale = guim, buttons = {{"Edit", "ActionEditOffset"}, {"Apply", "ActionApplyOffset"}, {"Reset", "ActionResetOffset"}}, },
		{ category = "General", id = "AttachOffsetX", name = T(1000074, "Offset Front-Back"), editor = "number",       default = 0,       dont_save = true, min = -max_off, max = max_off, scale = guim, slider = true, },
		{ category = "General", id = "AttachOffsetY", name = T(1000075, "Offset Left-Right"), editor = "number",       default = 0,       dont_save = true, min = -max_off, max = max_off, scale = guim, slider = true, },
		{ category = "General", id = "AttachOffsetZ", name = T(1000076, "Offset Top-Bottom"), editor = "number",       default = 0,       dont_save = true, min = -max_off, max = max_off, scale = guim, slider = true, },

		{ category = "General", id = "AttachRotate",  name = T(1000077, "Rotate"),            editor = "point",        default = point30, scale = 60, buttons = {{"Edit", "ActionEditRotate"}, {"Apply", "ActionApplyRotate"}, {"Reset", "ActionResetRotate"}},},
		{ category = "General", id = "AttachRotateX", name = T(1000078, "Rotate Roll"),       editor = "number",       default = 0,       dont_save = true, min = -max_rot, max = max_rot, scale = 60, slider = true, },
		{ category = "General", id = "AttachRotateY", name = T(1000079, "Rotate Pitch"),      editor = "number",       default = 0,       dont_save = true, min = -max_rot, max = max_rot, scale = 60, slider = true, },
		{ category = "General", id = "AttachRotateZ", name = T(1000080, "Rotate Yaw"),        editor = "number",       default = 0,       dont_save = true, min = -max_rot, max = max_rot, scale = 60, slider = true, },
		
		{ category = "General", id = "AttachScale",   name = T(1000081, "Scale"),             editor = "number",       default = 100,     min = 0, max = 1000, buttons = {{"Edit", "ActionEditScale"}} },
		{ category = "General", id = "AttachColor",   name = T(1000082, "Color"),             editor = "color",        default = no_clr, },
		{ category = "General", id = "AttachEvent",   name = T(1000083, "When to Anchor"),    editor = "choice",       default = def_event, items = AttachEvents, editor_update = "items" },
	},
	EditorName = "Attachment",
	spot_texts = false,
	last_state = false,
	camera_initialized = false,
}

function ModItemAttachment:ApplyVisuals()
	local parent = ModItemAttachment_ParentObj
	local child = ModItemAttachment_ChildObj
	if not IsValid(child) or not IsValid(parent) then
		return
	end
	
	local offset = self.AttachOffset + point(self.AttachOffsetX, self.AttachOffsetY, self.AttachOffsetZ)
	local rotate = quaternion(self.AttachRotate:xyz()) * quaternion(self.AttachRotateX, self.AttachRotateY, self.AttachRotateZ)
	local rotate_axis, rotate_angle = rotate:GetAxisAngle()
	
	child:SetAttachOffset(offset)
	child:SetAttachAxis(rotate_axis)
	child:SetAttachAngle(rotate_angle)
	child:SetScale(MulDivRound(parent:GetScale(), self.AttachScale, 100))
	child:SetColorModifier(self.AttachColor)
end

function ModItemAttachment:ApplyOffset(offset)
	self.AttachOffset = offset
	self.AttachOffsetX = 0
	self.AttachOffsetY = 0
	self.AttachOffsetZ = 0
	self:ApplyVisuals()
	ObjModified(self)
end

function ModItemAttachment:ActionApplyOffset(obj)
	obj = obj or self
	obj:ApplyOffset(obj.AttachOffset + point(obj.AttachOffsetX, obj.AttachOffsetY, obj.AttachOffsetZ))
end

function ModItemAttachment:ActionResetOffset(obj)
	obj = obj or self
	obj:ApplyOffset(nil)
end

function ModItemAttachment:ApplyRotate(rotate)
	self.AttachRotate = rotate
	self.AttachRotateX = 0
	self.AttachRotateY = 0
	self.AttachRotateZ = 0
	self:ApplyVisuals()
	ObjModified(self)
end

function ModItemAttachment:ActionApplyRotate(obj)
	obj = obj or self
	if obj.AttachRotateX ~= 0 or obj.AttachRotateY ~= 0 or obj.AttachRotateZ ~= 0 then
		local rotate = quaternion(obj.AttachRotate:xyz()) * quaternion(obj.AttachRotateX, obj.AttachRotateY, obj.AttachRotateZ)
		local roll, pitch, yaw = rotate:GetRollPitchYaw()
		obj:ApplyRotate(point(roll, pitch, yaw))
	end
end

function ModItemAttachment:ActionResetRotate(obj)
	obj = obj or self
	obj:ApplyRotate(nil)
end

function ModItemAttachment:ResolveSpotIndex()
	local entity = self:ResolveParentEntity()
	if entity == "" or self.AttachSpot == "" then
		return -1
	end
	local spot_name, spot_offset = string.match(self.AttachSpot, "(%w+)%s?(%d*)")
	if not spot_name or not HasSpot(entity, EntityStates.idle, spot_name) then
		return -1
	end
	local idx = GetSpotBeginIndex(entity, EntityStates.idle, spot_name)
	if idx ~= -1 then
		idx = idx + (spot_offset and tonumber(spot_offset) or 0)
	end
	return idx
end

function ModItemAttachment:ResolveParentEntity()
	local template = BuildingTemplates[self.Parent]
	if template then
		local entity = template.entity
		if IsValidEntity(entity) then
			return entity
		end
		entity = template.template_class
		if IsValidEntity(entity) then
			return entity
		end
	end
	return ""
end

function ModItemAttachment:OnModLoad()
	ModItem.OnModLoad(self)
end

function ModItemAttachment:TestModItem(ged)
	self:OnModLoad()
end

function ModItemAttachment:Done()
	self:Visualize(false)
end

function ModItemAttachment:OnEditorSelect(selected, ged, previous)
	ModItem.OnEditorSelect(self, selected, ged)
	self:Visualize(selected)
end

local obj_modified
local obj_modified_time = 0
local obj_modified_thread
function ObjModifiedDelayed(obj)
	obj_modified_time = RealTime() + 300
	if obj_modified and obj_modified ~= obj then
		ObjModified(obj_modified)
	end
	obj_modified = obj
	if not IsValidThread(obj_modified_thread) then
		obj_modified_thread = CreateRealTimeThread(function()
			while true do
				local sleep = obj_modified_time - RealTime()
				if sleep > 0 then
					Sleep(sleep)
				else
					ObjModified(obj_modified)
					obj_modified = nil
					return
				end
			end
		end)
	end
end

function ModItemTrackPos(modes, x, y, dx, dy, pt)
	local item = ModItemAttachment_Item
	if not item then
		return
	end
	local parent = ModItemAttachment_ParentObj
	if not IsValid(parent) then
		return
	end
	local mode
	for mode_i, info_i in pairs(modes) do
		if info_i.btn:GetToggled() then
			mode = mode_i
			break
		end
	end
	local left_mouse_button, right_mouse_button, middle_mouse_button = terminal.IsLRMMouseButtonPressed()
	if left_mouse_button then
		if mode == "O" then
			local ptPos = parent:GetVisualPos()
			local ptCamera = GetCamera()
			local vector = ptPos - ptCamera
			local coef = sqrt(vector:Len2D()) / 3
			vector = SetLen(vector, coef)
			local offset = point(-dx * vector:y(), dx * vector:x(), -dy * coef)
			parent:SetPos(ptPos + offset)
		else
			local delta = -dx * pt:y() * guim / 5000
			local offset = item.AttachOffset
			local offset0 = offset
			if mode == "X" then
				offset = offset + point(delta, 0, 0)
			elseif mode == "Y" then
				offset = offset + point(0, delta, 0)
			elseif mode == "Z" then
				offset = offset + point(0, 0, delta)
			end
			if offset ~= offset0 then
				item.AttachOffset0 = item.AttachOffset
				item.AttachOffset = offset
				item:ApplyVisuals()
				ObjModifiedDelayed(item)
			end
		end
	elseif right_mouse_button then
		local rotate = quaternion(item.AttachRotate:xyz())
		local rotate0 = rotate
		local delta = dx * pt:y() * 60 / 1000
		if mode == "O" then
			local parent_rotation = quaternion(parent:GetAxis(), parent:GetAngle())
			local x_rotation = quaternion(0, 0, -dx * 60)
			local y_rotation = quaternion(0, dy * 60, 0)
			local axis, angle = (x_rotation * parent_rotation * y_rotation):GetAxisAngle()
			parent:SetAxis(axis)
			parent:SetAngle(angle)
		elseif mode == "X" then
			rotate = rotate * quaternion(delta, 0, 0)
		elseif mode == "Y" then
			rotate = rotate * quaternion(0, delta, 0)
		elseif mode == "Z" then
			rotate = rotate * quaternion(0, 0, delta)
		end
		if rotate ~= rotate0 then
			item.AttachRotate0 = item.AttachRotate
			item.AttachRotate = point(rotate:GetRollPitchYaw())
			item:ApplyVisuals()
			ObjModifiedDelayed(item)
		end
	end
end

function InitCamera(obj)
	if not IsValid(obj) then
		return
	end
	local bbox = ObjectHierarchyBBox(obj)
	local dim = 2*bbox:Radius()
	local ptCamera, ptCameraLookAt = GetCamera()
	local vector = ptCameraLookAt - ptCamera
	vector = SetLen(vector, 2*dim)
	vector = vector:SetZ(vector:z() < 0 and -dim or dim)
	ptCameraLookAt = bbox:Center()
	ptCamera = ptCameraLookAt - vector
	SetCamera(ptCamera, ptCameraLookAt)
end

function ModItemAttachment:DoneParent()
	local parent = ModItemAttachment_ParentObj
	if IsValid(parent) then
		self.last_state = {parent:GetPos(), parent:GetAxis(), parent:GetAngle()}
		DoneObject(parent)
	end
end

local UnbuildableZ = buildUnbuildableZ()

function ModItemAttachment:Visualize(enable)
	local parent = ModItemAttachment_ParentObj
	local child = ModItemAttachment_ChildObj
	if enable then
		ModItemAttachment_Item = self
		local parent_entity = self:ResolveParentEntity()
		if parent_entity == "" then
			if IsValid(parent) then
				DoneObject(parent)
			end
		else
			if IsValid(parent) and self.Parent ~= parent.template_name then
				self:DoneParent()
			end
			if not IsValid(parent) then
				local template = BuildingTemplates[self.Parent]
				local classdef = template and g_Classes[template.template_class]
				parent = PlaceObject("ModItemAttachmentEditorObject", {
					template_name = self.Parent,
					template_classdef = classdef,
				})
				parent:ChangeEntity(parent_entity)
				AutoAttachObjectsToShapeshifter(parent)
				AttachAttaches(parent, classdef.configurable_attaches)
				ClearSurfFlags(parent)
				local ccs = GetCurrentColonyColorScheme()
				local cm1, cm2, cm3, cm4 = GetBuildingColors(ccs, template)
				SetObjectPaletteRecursive(parent, cm1, cm2, cm3, cm4)
				local pt, shape
				if self.last_state then
					local axis, angle
					pt, axis, angle = table.unpack(self.last_state)
					parent:SetAngle(angle)
				else
					pt = GetTerrainGamepadCursor()
				end
				local build_z = g_BuildableZ and GetBuildableZ(WorldToHex(pt)) or UnbuildableZ
				if build_z ~= UnbuildableZ then
					shape = classdef.GetFlattenShape(parent)
				else
					build_z = Max(GetWalkableZ(pt), terrain.GetSurfaceHeight(pt))
				end
				pt = pt:SetZ(build_z)
				parent:SetPos(pt)
				if shape then
					FlattenTerrainInBuildShape(shape, parent)
				end
				if not IsValid(ModItemAttachment_ParentObj) then
					InitCamera(parent)
				end
				ModItemAttachment_ParentObj = parent
			end
		end
		local child_entity = self.Child or ""
		if not IsValid(parent) or child_entity == "" then
			if IsValid(child) then
				DoneObject(child)
			end
		elseif child_entity ~= "" then
			if not IsValid(child) then
				child = PlaceObject("ModItemAttachmentEditorObject")
				child:ChangeEntity(child_entity)
				child:SetPos(parent:GetPos())
				ModItemAttachment_ChildObj = child
			end
		end
		if IsValid(parent) then
			if IsValid(child) then
				if child:GetEntity() ~= child_entity then
					child:ChangeEntity(child_entity)
				end
				local idx = self:ResolveSpotIndex()
				if child:GetAttachSpot() ~= idx then
					parent:Attach(child, idx)
				end
				self:ApplyVisuals()
			end
		end
		local dlg = OpenDialog("ModItemAttachmentDialog")
		local modes = {
			X = {btn = dlg.idAxisX,  key = const.vkX,    status = T(1000084, "Anchor X-axis")},
			Y = {btn = dlg.idAxisY,  key = const.vkC,    status = T(1000085, "Anchor Y-axis")},
			Z = {btn = dlg.idAxisZ,  key = const.vkZ,    status = T(1000086, "Anchor Z-axis")},
			O = {btn = dlg.idParent, key = const.vkAlt,  status = T(1000087, "Control Parent")},
		}
		for mode_i, info_i in pairs(modes) do
			local btn = info_i.btn
			local status = info_i.status
			local old_SetToggled = btn.SetToggled
			btn.SetToggled = function(btn, value)
				old_SetToggled(btn, value)
				dlg.idStatus:SetText("")
				if value then
					for mode_j, info_j in pairs(modes) do
						local btn_i = info_j.btn
						if btn_i ~= btn then
							old_SetToggled(btn_i, false)
						end
					end
					dlg.idStatus:SetText(status)
				end
			end
		end
		local help = {
			T{7956, "Hold <em><keyboard_key></em> key to activate X-axis of the object", keyboard_key = KeyNames[modes.X.key]},
			T{7957, "Hold <em><keyboard_key></em> key to activate Y-axis of the object", keyboard_key = KeyNames[modes.Y.key]},
			T{7958, "Hold <em><keyboard_key></em> key to activate Z-axis of the object", keyboard_key = KeyNames[modes.Z.key]},
			T{7959, "Hold <em><keyboard_key></em> key to control the parent object", keyboard_key = KeyNames[modes.O.key]},
			"",
			T(7960, "Use the toggle buttons in the bottom right corner to lock one of the above modes"),
			"",
			T{7961, "Click <em><mouse_button></em> button to move the object", mouse_button = T(1000595, "Left")},
			T{7962, "Click <em><mouse_button></em> button to rotate the object", mouse_button = T(1000596, "Right")},
			"",
			T{7964, "Click <em><mouse_button></em> button to control the camera", mouse_button = T(7963, "Middle")},
			T{7965, "Hold <em><keyboard_key></em> key to move the camera", keyboard_key = KeyNames[const.vkControl]},
			T{7966, "Hold <em><keyboard_key></em> key to rotate the camera", keyboard_key = KeyNames[const.vkAlt]},
			T{7967, "Use mouse <em><mouse_scroll></em> to zoom in / out", mouse_scroll = T(1000095, "Scroll")},
		}
		dlg.idHelpText:SetText(table.concat(help, "\n"))
		dlg.TrackPos = function(self, ...)
			return ModItemTrackPos(modes, ...)
		end
		cameraMax.Activate(1)
		camera.Unlock(1)
		if not self.camera_initialized then
			InitCamera(parent)
			self.camera_initialized = true
		end
	elseif ModItemAttachment_Item == self then
		ModItemAttachment_Item = false
		self:DoneParent()
		if IsValid(child) then
			DoneObject(child)
		end
		CloseDialog("ModItemAttachmentDialog")
		self:ClearSpotTexts()
		self.camera_initialized = false
	end
end

function ModItemAttachment:ClearSpotTexts()
	local texts = self.spot_texts or ""
	self.spot_texts = nil
	for i=1,#texts do
		local text = texts[i]
		if IsValid(text) then
			DoneObject(text)
		end
	end
end

function ModItemAttachment:OnEditorSetProperty(prop_id, old_value, ged)
	self:Visualize(true)
	ModItem.OnEditorSetProperty(self, prop_id, old_value, ged)
end

function ModItemAttachment:GetDescription()
	local parent = self.Parent
	local child = self.Child
	if parent == "" or child == "" then return "" end
	local when = table.find_value(AttachEvents, "id", self.AttachEvent)
	return string.format("Attachment %s to %s %s", child, parent, when and when.name or "")
end

function ModItemAttachment:ActionGround(obj)
	obj = obj or self
	if ModItemAttachment_Item ~= obj then
		return
	end
	local parent = ModItemAttachment_ParentObj
	local pt = parent:GetPos()
	local shape
	local build_z = g_BuildableZ and GetBuildableZ(WorldToHex(pt)) or UnbuildableZ
	if build_z ~= UnbuildableZ then
		shape = parent:GetFlattenShape()
	else
		build_z = Max(GetWalkableZ(pt), terrain.GetSurfaceHeight(pt))
	end
	pt = pt:SetZ(build_z)
	parent:SetPos(pt)
	if shape then
		FlattenTerrainInBuildShape(shape, parent)
	end
end

if FirstLoad then
	g_ModItemAttachmentViewSpotsThread = false
end

function ModItemAttachment:ActionViewSpots(obj)
	obj = obj or self
	obj:Visualize(true)
	local entity = obj:ResolveParentEntity()
	local parent = ModItemAttachment_ParentObj
	if not IsValid(parent) or entity ~= parent:GetEntity() then
		return
	end
	local spots = ModItemAttachmentSpots(entity)
	obj:ClearSpotTexts()
	local texts = {}
	local spot_match = obj.AttachSpot or ""
	for i=1,#spots do
		local spot = spots[i]
		if spot_match == "" or spot_match == spot.name then
			local text = Text:new()
			text:SetText(spot.name)
			parent:Attach(text, spot.idx)
			texts[#texts + 1] = text
		end
	end
	obj.spot_texts = texts
	DeleteThread(g_ModItemAttachmentViewSpotsThread)
	g_ModItemAttachmentViewSpotsThread = CreateRealTimeThread(function(self)
		Sleep(5000)
		self:ClearSpotTexts()
	end, obj)
end

function ModItemAttachment:ActionEditOffset()
	print("todo")
end

function ModItemAttachment:ActionEditRotate()
	print("todo")
end

function ModItemAttachment:ActionEditScale()
	print("todo")
end

function ModItemAttachment:ApplyToObject(object, event, apply)
	if self.AttachEvent ~= event
	or not IsValid(object)
	or not IsKindOf(object, "Building")
	or self.Parent ~= object.template_name
	or not IsValidEntity(self.Child) then
		return false
	end
	if apply then
		local idx = self:ResolveSpotIndex()
		local offset = self.AttachOffset
		local rotate = quaternion(self.AttachRotate:xyz())
		local rotate_axis, rotate_angle = rotate:GetAxisAngle()
		local child = PlaceObject("ModItemAttachmentObject", {mod_item = self})
		child:ChangeEntity(self.Child)
		child:SetAttachOffset(offset)
		child:SetAttachAxis(rotate_axis)
		child:SetAttachAngle(rotate_angle)
		child:SetScale(MulDivRound(object:GetScale(), self.AttachScale, 100))
		child:SetColorModifier(self.AttachColor)
		object:Attach(child, idx)
	else
		object:DestroyAttaches(function(attach)
			return rawget(attach, "mod_item") == self
		end)
	end
	return true
end

function ApplyModAttach(object, event, apply)
	local matched = 0
	for _, mod in ipairs(ModsLoaded or empty_table) do
		for _, item in ipairs(mod.items) do
			if IsKindOf(item, "ModItemAttachment") and item:ApplyToObject(object, event, apply) then
				matched = matched + 1
			end
		end
	end
	return matched
end

function OnMsg.BuildingPlaced(bld)
	ApplyModAttach(bld, "place", true)
end