DefineClass.SelectionModeDialog = {
	__parents = { "UnitDirectionModeDialog" },
	mode_name = "selection",
}

function GetLandingRocket(site)
	local rockets = UICity.labels.AllRockets or ""
	for i = 1, #rockets do
		if rockets[i].landing_site == site and rockets[i]:GetEnumFlags(const.efSelectable) ~= 0 then
			return rockets[i]
		end
	end
end

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

function SelectionModeDialog:OnMouseButtonDown(pt, button)
	local result = UnitDirectionModeDialog.OnMouseButtonDown(self, pt, button)
	if button == "L" then
		if result ~= "break" then
			local solid, transparent = GetPreciseCursorObj()
			solid = SelectionPropagate(solid)
			transparent = SelectionPropagate(transparent)
			local precise = transparent or solid
			local terrain_obj = SelectionPropagate(GetTerrainCursorObjSel())
			if precise == terrain_obj then
				if not precise then
					-- check for a landing site in the build grid
					local tc = GetTerrainCursor()
					if terrain.IsPointInBounds(tc) then
						local q, r = WorldToHex(tc)
						local site = HexGridGetObject(ObjectGrid, q, r, "RocketLandingSite")
						if site then
							precise = GetLandingRocket(site)
						end
					end
				end
				--passage reselect hack
				if IsKindOf(precise, "PassageGridElement") and SelectedObj == precise.passage_obj then
					return "break"
				end
				SelectObj(precise)
			else
				SelectObj(precise or terrain_obj)
			end
			result = "break"
		end
	elseif button == "R" then
		if result ~= "break" then
			if HintsEnabled and IsKindOfClasses(SelectedObj, "RCRover","RCTransport") then
				HintTrigger("HintVehicleOrders")
			end
			if g_RightClickOpensBuildMenu then
				local dlg = GetDialog("XBuildMenu")
				if dlg then
					dlg:SelectParentCategory()
				else
					OpenXBuildMenu(IsValid(UICity.selected_dome) and UICity.selected_dome or nil)
				end
			end
			result = "break"
		end
	end
	return result
end

function SelectionModeDialog:OnMouseButtonDoubleClick(pt, button)
	if button == "L" then
		local solid, transparent = GetPreciseCursorObj()
		solid = SelectionPropagate(solid)
		transparent = SelectionPropagate(transparent)
		local precise = transparent or solid
		local terrain = SelectionPropagate(GetTerrainCursorObjSel()) --dome
		local obj = terrain and IsKindOf(terrain, "Dome") and precise or terrain or precise
		if SelectedObj == obj and IsKindOf(obj, "SupplyGridSwitch") and obj.is_switch then
			obj:Switch()
		else
			--passage reselect hack
			if IsKindOf(precise, "PassageGridElement") and SelectedObj == precise.passage_obj then
				return "break"
			end
			SelectObj(obj)
		end
	end
end