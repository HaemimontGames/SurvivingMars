DefineClass.SelectionModeDialog = {
	__parents = { "UnitDirectionModeDialog" },
	mode_name = "selection",
	drag_start_pos = false,
	drag_selection_class = false,
	drag_selection_obj = false,
}

function SelectionModeDialog:OnKbdKeyDown(virtual_key)
	local result = UnitDirectionModeDialog.OnKbdKeyDown(self, virtual_key)
	if result == "continue" then
		if virtual_key == const.vkEsc and IsValid(SelectedObj) then
			SelectObj()
			return "break"
		end
	end
	return result
end

function SelectionModeDialog:OnShortcut(shortcut, source, ...)
	local bindings = GetShortcuts("actionZoomOut")
	if bindings and (shortcut == bindings[0] or shortcut == bindings[1] or shortcut == bindings[2])
		and editor.Active == 0 and not CameraTransitionThread then
		local _, maxZoom = cameraRTS.GetZoomLimits()
		if cameraRTS.GetZoom() >= maxZoom then
			self.parent:SetMode("overview")
			return "break"
		end
	end
	return UnitDirectionModeDialog.OnShortcut(self, shortcut, source)
end

function SelectionMouseObj()
	local solid, transparent = GetPreciseCursorObj()
	solid = SelectionPropagate(solid)
	transparent = SelectionPropagate(transparent)
	local precise = transparent or solid
	local terrain_obj = SelectionPropagate(GetTerrainCursorObjSel())
	--`precise` is object detected using raycast
	--`terrain_obj` is object enumed around the point this ray collides with the terrain
	if precise == terrain_obj then
		--if there was nothing caught there we enum the hex grids which may contain larger objects,
		--objects that don't have collision surfaces or were not detected for some other reason
		if not precise then
			local tc = GetTerrainCursor()
			if terrain.IsPointInBounds(tc) then
				local q, r = WorldToHex(tc)
				local objs = { }
				--@@@msg GatherSelectedObjectsOnHexGrid,q, r, objects- use this message to queue custom objects for selection using a hex grid position.
				Msg("GatherSelectedObjectsOnHexGrid", q, r, objs)
				for i=1,#objs do
					local sel = SelectionPropagate(objs[i])
					if IsValid(sel) then
						precise = sel
						break
					end
				end
				precise = precise or SelectionPropagate(HexGridGetObject(ObjectGrid, q, r))
			end
		end
		
		--passage reselect hack
		if IsKindOf(precise, "PassageGridElement") and SelectedObj == precise.passage_obj then
			return
		end
		
		return precise
	else
		return precise or terrain_obj
	end
end

function SelectionModeDialog:OnMouseButtonDown(pt, button)
	local result = UnitDirectionModeDialog.OnMouseButtonDown(self, pt, button)
	if button == "L" then
		if result ~= "break" then
			if not self.desktop.last_mouse_target or self.desktop.last_mouse_target:IsWithin(self) then
				self.drag_start_pos = pt
				self.desktop:SetMouseCapture(self)
				LockCamera("Multiselection")
			end
			
			local obj = SelectionMouseObj()
			SelectObj(obj)
			result = "break"
		end
	elseif button == "R" then
		if result ~= "break" then
			if HintsEnabled and IsKindOfClasses(SelectedObj, "RCRover","RCTransport") then
				HintTrigger("HintVehicleOrders")
			end
			if g_RightClickOpensBuildMenu then
				ToggleXBuildMenu(true, "back", IsValid(UICity.selected_dome) and UICity.selected_dome or nil)
			end
			result = "break"
		end
	end
	return result
end

function SelectionModeDialog:OnMouseButtonUp(pt, button)
	local result = UnitDirectionModeDialog.OnMouseButtonUp(self, pt, button)
	if result == "break" then return "break" end
	
	if not pt then return end
	if not self.drag_start_pos then return end
	if button ~= "L" then return end
	
	if self.drag_selection_class then
		local UIScale = GetUIScale()
		local all_objects = GatherObjectsInScreenRect(self.drag_start_pos, pt, self.drag_selection_obj, self.drag_selection_class)
		local count = #all_objects
		if count > 1 then --multiselection works only for more than one obj
			local obj = MultiSelectionWrapper:new({
				selection_class = self.drag_selection_class,
				objects = all_objects,
			})
			SelectObj(obj)
		elseif count == 1 then --only one obj in the rect - select it normally
			SelectObj(all_objects[1])
		end
	end
	
	self:CancelMultiselection()
	return "break"
end

function SelectionModeDialog:OnMousePos(pt, button)
	local result = UnitDirectionModeDialog.OnMousePos(self, pt, button)
	if result == "break" then return "break" end

	if not pt then return end
	if not self.drag_start_pos then return end

	local hud = GetHUD()
	if hud then
		local UIScale = GetUIScale()
		local start_x, start_y = MulDivRound(self.drag_start_pos, 100, UIScale):xy()

		local pt_x, pt_y = pt:xy()
		pt_x = MulDivRound(pt_x, 100, UIScale)
		pt_y = MulDivRound(pt_y, 100, UIScale)

		local left =   Min(start_x, pt_x)
		local right =  Max(start_x, pt_x)
		local top =    Min(start_y, pt_y)
		local bottom = Max(start_y, pt_y)
		
		local rect_element = hud.idMultiselectionBox
		rect_element:SetVisible(true)
		rect_element:SetMargins(box(left, top, 0, 0))
		rect_element:SetMinWidth(right - left)
		rect_element:SetMinHeight(bottom - top)
	end
	
	local temp_objects = GatherObjectsInScreenRect(self.drag_start_pos, pt, self.drag_selection_obj, self.drag_selection_class)
	if next(temp_objects) then
		if not self.drag_selection_class then
			--find first object that has a selection class
			for i,temp_obj in ipairs(temp_objects) do
				if temp_obj:HasMember("SelectionClass") then
					self.drag_selection_obj = temp_obj
					self.drag_selection_class = temp_obj.SelectionClass
					break
				end
			end
		end
	else
		self.drag_selection_obj = false
		self.drag_selection_class = false
	end
	
	return "break"
end

function SelectionModeDialog:OnKillFocus()
	self:CancelMultiselection()
end

function SelectionModeDialog:CancelMultiselection()
	if self.desktop.mouse_capture == self then
		self.desktop:SetMouseCapture(false)
	end

	if not self.drag_start_pos then return end
	
	local hud = GetHUD()
	if hud then
		hud.idMultiselectionBox:SetVisible(false)
	end
	
	self.drag_start_pos = false
	self.drag_selection_obj = false
	self.drag_selection_class = false
	UnlockCamera("Multiselection")
end

function SelectionModeDialog:OnMouseButtonDoubleClick(pt, button)
	if button == "L" then
		local obj = SelectionMouseObj()
		if obj and SelectedObj == obj and IsKindOf(obj, "SupplyGridSwitch") and obj.is_switch then
			obj:Switch()
		end
		if obj and SelectedObj == obj then
			local selection_class = GetSelectionClass(obj)
			local new_objs = GatherObjectsOnScreen(obj, selection_class)
			if new_objs and #new_objs > 1 then
				obj = MultiSelectionWrapper:new({
					selection_class = selection_class,
					objects = new_objs,
				})
			end
		end
		SelectObj(obj)
		return "break"
	elseif button == "R" then
		local result = UnitDirectionModeDialog.OnMouseButtonDown(self, pt, button)
		if result == "break" then return "break" end
		
		if g_RightClickOpensBuildMenu then
			ToggleXBuildMenu(true, "back", IsValid(UICity.selected_dome) and UICity.selected_dome or nil)
		end
		return "break"
	end
end