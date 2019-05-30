--Determines the selection class of an object.
function GetSelectionClass(obj)
	if not obj then return end
	
	if IsKindOf(obj, "PropertyObject") and obj:HasMember("SelectionClass") then
		return obj.SelectionClass
	else
		--return obj.class
	end
end

function GatherObjectsOnScreen(obj, selection_class)
	obj = obj or SelectedObj
	if not IsValid(obj) then return end
	
	selection_class = selection_class or GetSelectionClass(obj)
	if not selection_class then return end

	local result = GatherObjectsInScreenRect(point20, point(GetResolution()), obj, selection_class)
	if not table.find(result, obj) then
		table.insert(result, obj)
	end
	
	return result
end

function GatherObjectsInScreenRect(start_pt, end_pt, obj, selection_class)
	local start_x, start_y = start_pt:xy()
	local end_x, end_y = end_pt:xy()
	
	--screen space
	local ss_left =   Min(start_x, end_x)
	local ss_right =  Max(start_x, end_x)
	local ss_top =    Min(start_y, end_y)
	local ss_bottom = Max(start_y, end_y)
	
	local ss_top_left =     point(ss_left,  ss_top)
	local ss_top_right =    point(ss_right, ss_top)
	local ss_bottom_right = point(ss_right, ss_bottom)
	local ss_bottom_left =  point(ss_left,  ss_bottom)

	--world space
	local top_left =     GetTerrainCursorXY(ss_top_left)
	local top_right =    GetTerrainCursorXY(ss_top_right)
	local bottom_right = GetTerrainCursorXY(ss_bottom_right)
	local bottom_left =  GetTerrainCursorXY(ss_bottom_left)

	local left =   Min(top_left:x(), top_right:x(), bottom_left:x(), bottom_right:x())
	local right =  Max(top_left:x(), top_right:x(), bottom_left:x(), bottom_right:x())
	local top =    Min(top_left:y(), top_right:y(), bottom_left:y(), bottom_right:y())
	local bottom = Max(top_left:y(), top_right:y(), bottom_left:y(), bottom_right:y())
	
	local max_step = 12 * guim --PATH_EXEC_STEP
	top = top - max_step
	left = left - max_step
	bottom = bottom + max_step
	right = right + max_step
	
	local rect = box(left, top, terrain.GetHeight(left, top), right, bottom, terrain.GetHeight(right, bottom))
	local function IsInsideTrapeze(o)
		local pt = o:GetVisualPos()
		return
			IsInsideTriangle(pt, top_left, bottom_right, bottom_left) or
			IsInsideTriangle(pt, top_left, bottom_right, top_right)
	end
	
	selection_class = selection_class or GetSelectionClass(obj)
	local result = MapGet(rect, selection_class or "Object", const.efSelectable, IsInsideTrapeze)
	if obj then
		result = table.ifilter(result, function(idx, o) return o.class == selection_class end)
	end
	
	if IsKindOfClasses(obj, "Colonist", "Drone") then
		local is_dead = obj:IsDead()
		result = table.ifilter(result, function(i,v) return v:IsDead() == is_dead end)
	elseif IsKindOf(obj, "Building") then
		local destroyed = obj.destroyed
		result = table.ifilter(result, function(i,v) return v.destroyed == destroyed end)
	end
	
	return result
end

g_GamepadMultiselectionThread = false
function StartGamepadMultiselectionThread(obj, selection_class)
	if IsValidThread(g_GamepadMultiselectionThread) then return end
	
	obj = obj or SelectedObj
	if not IsValid(obj) then return end
	
	selection_class = selection_class or GetSelectionClass(obj)
	if not selection_class then return end
	
	g_GamepadMultiselectionThread = CreateRealTimeThread(function(obj, selection_class)
		local w, h = GetResolution()
		local steps = 3
		local center_x, center_y = w / 2, h / 2
		local step_w, step_h = (w / 2) / steps, (h / 2) / steps
		for i=1,steps do
			Sleep(500)
			
			local new_objs = GatherObjectsInScreenRect(
				point(center_x - step_w*i, center_y - step_h*i),
				point(center_x + step_w*i, center_y + step_h*i),
				obj, selection_class)
			
			if new_objs and #new_objs > 1 then
				SelectObj(MultiSelectionWrapper:new({
					selection_class = selection_class,
					objects = new_objs,
				}))
			end
		end
	end, obj, selection_class)
end

function StopGamepadMultiselectionThread()
	if IsValidThread(g_GamepadMultiselectionThread) then
		DeleteThread(g_GamepadMultiselectionThread)
	end
end

---- Multiselect wrapper class

DefineClass.MultiSelectionWrapper = {
	__parents = { "Object", "InfopanelObj", "SkinChangeable" },

	ip_template = "ipMultiSelect",
	IPDescription = T(11994, "<ObjectsCount> units have been selected."),
	DisplayName = T(11995, "<ObjectsDisplayName>"),
	
	display_name = false,
	display_name_pl = false,
	prio_button = false,
	on_off_button = false,
	pfclass = false,
	encyclopedia_id = false,
	template_name = false,
	start_player_controllable = false,
	interaction_mode = false,
	to_load = false,
	
	selection_class = false,
	objects = false,
	objects_set = false,
}

function MultiSelectionWrapper:Init()
	self.objects_set = { }
	for i,subobj in ipairs(self.objects) do
		self.objects_set[subobj] = true
	end

	self:ResolveField("prio_button")
	self:ResolveField("on_off_button")
	self:ResolveField("pfclass")
	self:ResolveField("encyclopedia_id")
	
	--resolve infopanel title
	self:ResolveField("display_name_pl") --get plural display name
	if not self.display_name_pl then --get singular display name, if none has plural (fallback)
		self:ResolveField("display_name")
		self.display_name_pl = self.display_name
	end
	if not self.display_name_pl then --no singlar/plural display name - use selection class (fallback 2)
		self.display_name_pl = T{11998, "<u(selection_class)>", self}
	end
	self.display_name = self.display_name_pl
	
	--check building template (with same name as this class)
	if self:IsClassSupported("Building") then
		self:ResolveField("template_name")
		local building_template = BuildingTemplates[self.template_name] or BuildingTemplates[self.selection_class]
		if building_template then
			self.encyclopedia_id = self.encyclopedia_id or building_template.encyclopedia_id
			self.prio_button = self.prio_button or building_template.prio_button
			self.on_off_button = self.on_off_button or building_template.on_off_button
		end
	end
end

function MultiSelectionWrapper:ResolveDisplayNameOf(classname)
	local classdef = g_Classes[classname]
	local name = rawget(classdef, "display_name_pl")
	name = name or rawget(classdef, "display_name")
	name = name or Untranslated(classname)
	return name
end

function MultiSelectionWrapper:GetDetailedObjectsCount()
	local counter = { }
	for i,subobj in ipairs(self.objects) do
		local name = self:ResolveDisplayNameOf(subobj.class)
		counter[name] = (counter[name] or 0) + 1
	end
	
	local entries = { }
	for name,count in pairs(counter) do
		table.insert(entries, { name = name, count = count })
	end
	TSort(entries, "name")
	
	local str = { }
	for i,entry in ipairs(entries) do
		table.insert(str, T{11997, "<left><name><right><em><count></em>", name = entry.name, count = entry.count})
	end
	
	return table.concat(str, "\n")
end

function MultiSelectionWrapper:ResolveField(field)
	--check children classes
	for i,subobj in ipairs(self.objects) do
		--quicky and dirty "has member" check
		local value = rawget(subobj, field) or rawget(g_Classes[subobj.class], field)
		if value then
			self[field] = value
			break
		end
	end
end

function MultiSelectionWrapper:GameInit()
	local cnt = #self.objects
	local mean_x, mean_y = 0, 0
	for i=1,cnt do
		local subobj = self.objects[i]
		local x, y = subobj:GetPos():xyz()
		mean_x = mean_x + x / cnt
		mean_y = mean_y + y / cnt
	end
	
	local z = terrain.GetHeight(mean_x, mean_y)
	self:SetPos(mean_x, mean_y, z)
end

function MultiSelectionWrapper:GetObjectsDisplayName()
	return T{12084, "<u(display_name_pl)>", self}
end

function MultiSelectionWrapper:GetObjectsCount()
	return #(self.objects or empty_table)
end

--Multiple selection

function MultiSelectionWrapper:IsClassSupported(classname)
	return IsKindOf(g_Classes[self.selection_class], classname)
end

function MultiSelectionWrapper:Broadcast(method, ...)
	if type(method) == "string" then
		assert(g_Classes[self.selection_class]:HasMember(method),
			string.format("Base class %s doesn't have the member %s", self.selection_class, method))
		for i,subobj in ipairs(self.objects) do
			subobj[method](subobj, ...)
		end
	else
		for i,subobj in ipairs(self.objects) do
			method(subobj, ...)
		end
	end
end

function MultiSelectionWrapper:CheckAll(method, ...)
	assert(g_Classes[self.selection_class]:HasMember(method),
		string.format("Base class %s doesn't have the member %s", self.selection_class, method))
	for i,subobj in ipairs(self.objects) do
		if not subobj[method](subobj, ...) then
			return false
		end
	end
	return true
end

function MultiSelectionWrapper:CheckAllProperty(property)
	assert(g_Classes[self.selection_class]:HasMember(property),
		string.format("Base class %s doesn't have the property %s", self.selection_class, property))
	for i,subobj in ipairs(self.objects) do
		if not subobj[property] then
			return false
		end
	end
	return true
end

function MultiSelectionWrapper:CheckAny(method, ...)
	assert(g_Classes[self.selection_class]:HasMember(method),
		string.format("Base class %s doesn't have the member %s", self.selection_class, method))
	for i,subobj in ipairs(self.objects) do
		local result, r2, r3, r4, r5 = subobj[method](subobj, ...)
		if result then return result, r2, r3, r4, r5 end
	end
	return false
end

function MultiSelectionWrapper:CheckAnyProperty(property)
	assert(g_Classes[self.selection_class]:HasMember(property),
		string.format("Base class %s doesn't have the property %s", self.selection_class, property))
	for i,subobj in ipairs(self.objects) do
		if subobj[property] then
			return true
		end
	end
	return false
end

function MultiSelectionWrapper:Union(method, comparison_key, ...)
	assert(g_Classes[self.selection_class]:HasMember(method),
		string.format("Base class %s doesn't have the member %s", self.selection_class, method))
	local values = { }
	for i,subobj in ipairs(self.objects) do
		local result = subobj[method](subobj, ...)
		if result then
			for i,v in ipairs(result) do
				if comparison_key then
					if not table.find(values, comparison_key, v[comparison_key]) then
						table.insert(values, v)
					end
				else
					--optimized when there is no comparison key
					values[v] = true
				end
			end
		end
	end
	
	return comparison_key and values or table.keys(values)
end

--SkinChangeable

function MultiSelectionWrapper:GetSkins(...) --TODO should this be a union of all skins?
	if not self:IsClassSupported("SkinChangeable") then
		return false
	end

	return self:Union("GetSkins", false, ...)
end

function MultiSelectionWrapper:CycleSkin(...)
	local first_skin = self.objects[1]:GetEntity()
	for i,subobj in ipairs(self.objects) do
		if subobj:GetEntity() == first_skin then
			subobj:CycleSkin(...)
		end
	end
end

--Common Unit Methods

function MultiSelectionWrapper:SetCommand(command, ...)
	if not self:IsClassSupported("CommandObject") then return end
	
	--not all objs will have the command so this is a quick optimization for using the heavy `HasMember`
	local base_class_cache = g_Classes[self.selection_class]:HasMember(command)
	local has_member_cache = { }
	
	for i,subobj in ipairs(self.objects) do
		local cache = has_member_cache[subobj.class]
		if base_class_cache or cache == nil and subobj:HasMember(command) or cache then
			subobj:SetCommand(command, ...)
			has_member_cache[subobj.class] = true
		end
	end
end

function MultiSelectionWrapper:CanBeControlled(...)
	if not self:IsClassSupported("Unit") then return end
	return self:CheckAny("CanBeControlled", ...)
end

function MultiSelectionWrapper:CanInteractWithObject(...)
	if not self:IsClassSupported("Unit") then return end
	return self:CheckAny("CanInteractWithObject", ...)
end

function MultiSelectionWrapper:SetInteractionState(val)
	SetUnitControlInteractionMode(self, val)
	if val then
		SetUnitControlFocus(true, self)
	end
end

function MultiSelectionWrapper:SetInteractionMode(...)
	return self:Broadcast("SetInteractionMode", ...)
end

function MultiSelectionWrapper:OnInteractionModeChanged(old, new, ...)
	if not self:IsClassSupported("Unit") then return end
	self.interaction_mode = new
	return self:Broadcast("OnInteractionModeChanged", old, new, ...)
end

function MultiSelectionWrapper:ResolveObjAt(...)
	if not self:IsClassSupported("Unit") then return end
	--return the first result found
	for i,subobj in ipairs(self.objects) do
		local result = subobj:ResolveObjAt(...)
		if result then
			return result
		end
	end
end

function MultiSelectionWrapper:InteractWithObject(...)
	if not self:IsClassSupported("Unit") then return end
	local result
	for i,subobj in ipairs(self.objects) do
		result = result or subobj:InteractWithObject(...)
	end
	SetUnitControlInteractionMode(self, false)
	return "break"
end

function MultiSelectionWrapper:SetCommandUserInteraction(...)
	if not self:IsClassSupported("Unit") then return end
	return self:Broadcast("SetCommandUserInteraction", ...)
end

--DroneBase

function MultiSelectionWrapper:GetSelectorItems(...)
	if not self:IsClassSupported("DroneBase") and 
		not self:IsClassSupported("RCTransport")
	then
		return { }
	end
	
	if self.interaction_mode ~= "route" then
		self.to_load = { }
	end

	return self:Union("GetSelectorItems", "name", ...)
end

function MultiSelectionWrapper:ToggleControlMode()
	if not self:IsClassSupported("Unit") then return end
	
	local unit_ctrl_dlg = GetInGameInterfaceModeDlg()
	assert(unit_ctrl_dlg:IsKindOf("UnitDirectionModeDialog"))
	
	--at least one sub-object must be controllable
	if not self:CanBeControlled() then return end
	
	if terminal.IsKeyPressed(const.vkControl) then --ignore the button while ctrl is down
		--handles case where button is pressed but already in move/interact mode.
		return
	end

	if unit_ctrl_dlg.unit == self and not IsValid(unit_ctrl_dlg.interaction_obj) then
		local new_val = unit_ctrl_dlg.interaction_mode ~= "move" and "move" or false
		SetUnitControlInteractionMode(self, new_val)
		if unit_ctrl_dlg.interaction_mode == "move" then
			unit_ctrl_dlg:SetFocus(true)
		end
	end
	
	HintDisable("HintVehicleOrders")
	
	RebuildInfopanel(self)
end

function MultiSelectionWrapper:ToggleControlMode_Update(button)
	local to_mode = self.interaction_mode ~= "move"

	button:SetIcon(to_mode and "UI/Icons/IPButtons/move.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetEnabled(self:CanBeControlled())
	
	button:SetRolloverText(T(12046, --[[ toggle control mode (multiselect) ]] "Give command to move or interact with objects."))
	local shortcuts = GetShortcuts("actionMoveInteract")
	local hint = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		hint = T(10927, " / <em><ShortcutName('actionMoveInteract', 'keyboard')></em>")
	end
	button:SetRolloverHint(to_mode and
		T{7401, --[[ toggle control mode rollover (multiselect) ]] "<left_click><hint> Select target mode<newline><UnitMoveControl()> on target to move or interact", hint = hint, self} or
		T(7510, --[[ toggle control mode rollover (multiselect) ]] "<left_click> on target to select it  <right_click> Cancel"))
	button:SetRolloverHintGamepad(to_mode and T(7511, "<ButtonA> Select target mode") or T(7512, "<ButtonA> Cancel"))
end

--Drone

function MultiSelectionWrapper:DropCarriedResourceFromUI(...)
	return self:Broadcast("DropCarriedResourceFromUI", ...)
end

function MultiSelectionWrapper:GetDropCarriedResourceFromUIDisabledRollover()
	if self:CanBeControlled() then
		if not self:CheckAny("GetCarriedResource") then
			--operational, no resource
			return T(8535, "No resource loaded.")
		else
			--operational, carries resources (this case should be impossible)
			return T(12047, "Vehicles inactive.")
		end
	else
		--upoperational
		return T(12047, "Vehicles inactive.")
	end
end

function MultiSelectionWrapper:DropCarriedResourceFromUI_Update(button)
	button:SetEnabled(self:CanBeControlled() and self:CheckAny("GetCarriedResource"))
end


function MultiSelectionWrapper:ToggleReassignInteractionMode()
	if self:CheckAll("IsDead") then
		return
	end
	
	if self.interaction_mode ~= "reassign" then
		self:SetInteractionState("reassign")
	else
		self:SetInteractionState(false)
	end
end

function MultiSelectionWrapper:ToggleReassignInteractionMode_Update(button)
	local to_mode = self.interaction_mode ~= "reassign"
	
	button:SetIcon(to_mode and "UI/Icons/IPButtons/reassign.tga" or "UI/Icons/IPButtons/cancel.tga")
	local tutorial2_enable = not g_Tutorial or ((g_Tutorial.Id == "Tutorial2") and g_Tutorial.DisableReassignButtons and AreAllUnassignedDronesSelected()) or false
	button:SetEnabled(self:CanBeControlled() and tutorial2_enable)
	button:SetRolloverText(T(4428, --[[ toggle reassign mode (multiselect) ]] "Assign to target Hub, Commander or Rocket."))
	local shortcuts = GetShortcuts("actionReassignDrone")
	local hint = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		hint = T(10926, " / <em><ShortcutName('actionReassignDrone', 'keyboard')></em>")
	end
	button:SetRolloverHint(to_mode and
		T{10925, --[[ toggle reassign mode rollover (multiselect) ]] "<left_click><hint> Select target mode", hint = hint} or
		T(7510, --[[ toggle reassign mode rollover (multiselect) ]] "<left_click> on target to select it  <right_click> Cancel"))
	button:SetRolloverHintGamepad(to_mode and T(7511, "<ButtonA> Select target mode") or T(7512, "<ButtonA> Cancel"))
end

--Colonist

function MultiSelectionWrapper:CanChangeCommand(...)
	return self:CheckAny("CanChangeCommand", ...)
end

function MultiSelectionWrapper:ToggleInteraction()
	if not self:CanChangeCommand() then 
		return 
	end
	
	if self.interaction_mode ~= "assign_to_bld" then
		self:SetInteractionState("assign_to_bld")
	else
		self:SetInteractionState(false)
	end
end

function MultiSelectionWrapper:ToggleInteraction_Update(button)
	button:SetEnabled(self:CanChangeCommand()) -- and not self.traits.Renegade)
	local to_mode = self.interaction_mode ~= "assign_to_bld"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/assign_residence.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetRolloverTitle(T(8758, --[[ toggle colonist assign mode (multiselect) ]] "Assign to Building"))
	button:SetRolloverText(T(12048, --[[ toggle colonist assign mode (multiselect) ]] "Assign these Colonists to a residence, workplace or training building. The Colonists will not change assignment for the next 5 Sols. If the target building is in another Dome located far away, a shuttle may be needed to reach it."))
	local shortcuts = GetShortcuts("actionAssignToBuilding")
	local hint = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		hint = T(10924, " / <em><ShortcutName('actionAssignToBuilding', 'keyboard')></em>")
	end
	button:SetRolloverHint(to_mode and
		T{10925, --[[ toggle colonist assign mode rollover (multiselect) ]] "<left_click><hint> Select target mode", hint = hint} or
		T(7510, --[[ toggle colonist assign mode rollover (multiselect) ]] "<left_click> on target to select it  <right_click> Cancel"))
	button:SetRolloverHintGamepad(to_mode and T(7511, "<ButtonA> Select target mode") or T(7512, "<ButtonA> Cancel"))
end

--Demolishable

function MultiSelectionWrapper:ToggleDemolish()
	local demolishing_any = self:IsDemolishingAny()
	for i,subobj in ipairs(self.objects) do
		if subobj.demolishing == demolishing_any then
			subobj:ToggleDemolish()
		end
	end
end

function MultiSelectionWrapper:CanDemolish()
	return self:CheckAny("CanDemolish")
end

function MultiSelectionWrapper:IsDemolishingAny()
	return self:CheckAnyProperty("demolishing")
end

function MultiSelectionWrapper:GetUIRefundRes()
	local raw_refund = self:Union("GetRefundResources")
	if not raw_refund or #raw_refund == 0 then return "" end
	
	local refund = { }
	for i,entry in ipairs(raw_refund) do
		if refund[entry.resource] then
			refund[entry.resource].amount = refund[entry.resource].amount + entry.amount
		else
			refund[entry.resource] = {
				resource = entry.resource,
				amount = entry.amount,
			}
			table.insert(refund, refund[entry.resource])
		end
	end
	table.sortby_field(refund, "resource")
	
	local refund_texts = { }
	for i=1,#refund do
		refund_texts[i] = T{4039, "<resource(amount, res)>", amount = refund[i].amount, res = refund[i].resource}
	end
	
	return table.concat(refund_texts, " ")
end

function MultiSelectionWrapper:ToggleDemolish_Update(button)
	local demolishing_any = self:IsDemolishingAny()
	button:SetIcon(demolishing_any and "UI/Icons/IPButtons/cancel.tga" or "UI/Icons/IPButtons/salvage_1.tga")
	button:SetEnabled(self:CanDemolish())
	local shortcuts = GetShortcuts("actionToggleDemolish")
	local binding = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		binding = T(10906, " / <em><ShortcutName('actionToggleDemolish', 'keyboard')></em>")
	end
	if self:IsClassSupported("ConstructionSite") then
		if g_Tutorial then
			button:SetEnabled(false)
		end
		button:SetRolloverHint( --[[ toggle demolish construction rollover (multiselect) ]] T{7573, "<left_click><binding> Cancel construction", binding = binding})
		button:SetRolloverHintGamepad( --[[ toggle demolish construction rollover (multiselect) ]] T(7574, "<ButtonY> Cancel construction"))
		return
	end
	button:SetRolloverHint(not demolishing_any and
		T{7575, --[[ toggle demolish rollover (multiselect) ]] "<left_click><binding> Salvage", binding = binding} or
		T{7576, --[[ toggle demolish rollover (multiselect) ]] "<left_click><binding> Cancel Salvage", binding = binding})
	button:SetRolloverHintGamepad(not demolishing_any and T(7577, "<ButtonY> Salvage") or T(7578, "<ButtonY> Cancel Salvage"))
end

--Building

function MultiSelectionWrapper:AreAllDestroyed()
	if not self:IsClassSupported("Building") then return end
	return self:CheckAllProperty("destroyed")
end

function MultiSelectionWrapper:GetLowestPriority()
	if not self:IsClassSupported("Building") then return end
	local lowest_priority = max_int
	for i,subobj in ipairs(self.objects) do
		if not subobj.destroyed then
			lowest_priority = Min(lowest_priority, subobj.priority)
		end
	end
	return lowest_priority
end

function MultiSelectionWrapper:GetHighestPriority()
	if not self:IsClassSupported("Building") then return end
	local highest_priority = -(max_int - 1)
	for i,subobj in ipairs(self.objects) do
		if not subobj.destroyed then
			highest_priority = Max(highest_priority, subobj.priority)
		end
	end
	return highest_priority
end

function MultiSelectionWrapper:TogglePriority(change)
	local target_priority = (change > 0) and self:GetLowestPriority() or self:GetHighestPriority()
	for i,subobj in ipairs(self.objects) do
		if not subobj.destroyed and subobj.priority == target_priority then
			subobj:TogglePriority(change)
		end
	end
end

function MultiSelectionWrapper:ToggleWorking()
	local target_state = self:CheckAllProperty("ui_working")
	for i,subobj in ipairs(self.objects) do
		if not subobj.destroyed and subobj.ui_working == target_state then
			subobj:ToggleWorking()
		end
	end
end

function MultiSelectionWrapper:ToggleWorking_Update(button)
	local ui_working = self:CheckAllProperty("ui_working")
	local working = self:CheckAllProperty("working")
	local suspended = self:CheckAllProperty("suspended")
	
	button:SetEnabled(not suspended)
	local shortcuts = GetShortcuts("actionOnOff")
	local binding = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		binding = T(10902, " / <em><ShortcutName('actionOnOff', 'keyboard')></em>")
	end
	if suspended then
		button:SetIcon("UI/Icons/IPButtons/turn_off.tga")
		button:SetRolloverHint(T{7611, --[[ toggle working rollover (multiselect) ]] "<left_click><binding> Deactivate <newline><em>Ctrl + <left_click></em> Deactivate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7612, --[[ toggle working rollover (multiselect) ]] "<ButtonA> Deactivate <newline><ButtonX> Deactivate all <display_name_pl>"))
	elseif ui_working then
		if not working then
			button:SetIcon("UI/Icons/IPButtons/turn_warning.tga")
		else
			button:SetIcon("UI/Icons/IPButtons/turn_off.tga")
		end
		button:SetRolloverHint(T{7611, --[[ toggle working rollover (multiselect) ]] "<left_click><binding> Deactivate <newline><em>Ctrl + <left_click></em> Deactivate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7612, --[[ toggle working rollover (multiselect) ]] "<ButtonA> Deactivate <newline><ButtonX> Deactivate all <display_name_pl>"))
	else
		button:SetIcon("UI/Icons/IPButtons/turn_on.tga")
		button:SetRolloverHint(T{7613, --[[ toggle working rollover (multiselect) ]] "<left_click><binding> Activate <newline><em>Ctrl + <left_click></em> Activate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7614, --[[ toggle working rollover (multiselect) ]] "<ButtonA> Activate <newline><ButtonX> Activate all <display_name_pl>"))
	end
end



OnMsg.GamepadUIStyleChanged = StopGamepadMultiselectionThread
OnMsg.ChangeMap = StopGamepadMultiselectionThread

function OnMsg.SelectedObjChange(obj, prev)
	if IsKindOf(obj, "MultiSelectionWrapper") then
		assert(#obj.objects > 1, "MultiSelectionWrapper should be used only when selecting more than one subobject!")
		for i,subobj in ipairs(obj.objects) do
			SelectionAdd(subobj)
		end
	end
end

function OnMsg.SelectionRemoved(obj)
	if IsKindOf(SelectedObj, "MultiSelectionWrapper") and SelectedObj ~= obj then
		local idx = table.remove_entry(SelectedObj.objects, obj)
		SelectedObj.objects_set[obj] = nil
		assert(idx, "Inconsistency between multiselection object list and global selection list")
	end
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "MultiSelectionWrapper"
end
