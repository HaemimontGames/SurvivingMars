if FirstLoad then
	g_EditorModeDlg = false
end

g_PlacementStateToColor = {
	Blocked     = RGB(220, 10, 20),
	Placeable   = const.clrNoModifier,
	Problematic = RGB(255, 60, 0),
	Obstructing = RGB(255, 216, 0),
}

ConstructionStatusColors = {
	error   	= { color_tag = Untranslated("<color 249 53 55>") , color_tag_short = Untranslated("<color 255 83 83><shadowcolor 104 23 1>") },
	problem 	= { color_tag = Untranslated("<color 249 53 55>") , color_tag_short = Untranslated("<color 255 83 83><shadowcolor 104 23 1>") },
	warning 	= { color_tag = Untranslated("<color 244 228 117>"), color_tag_short = Untranslated("<color 255 231 70><shadowcolor 124 61 2>") },
	info 		= { color_tag = Untranslated("<color 255 255 255>") },
}

ConstructionStatus = {
	OnTopOfResourceSign =             { type = "warning", priority = 100,  text = T{7571, "May block access to deposit."}, short = T{7572, "Overlaps deposit"} }, --on top of deposit sign
	ElectricityRequired =             { type = "warning", priority = 94,  text = T{842, "This building requires Power."}, short = T{843, "No cable connection"}}, --no grids nearby
	ElectricityGridNotEnoughPower =   { type = "warning", priority = 93,  text = T{844, "Not enough Power for this building."}, short =  T{193, "Not enough Power"} }, --there are grids nearby, but they do not produce enough.
	VaporatorInRange =                { type = "warning", priority = 100, text = T{847, "Producing <water(number)> less than optimal due to the presence of other Moisture Vaporators in the vicinity."}, short =  T{848, "Vaporator nearby"}},
	ColdSensitive =                   { type = "warning", priority = 97,  text = T{849, "The building will consume <red><percent(pct)></red> more Power in cold areas."}, short = T{850, "Cold terrain"}},
	NoNearbyDome =                    { type = "warning", priority = 99, text = T{7702, "No operational Domes in walking distance."}, short =  T{7703, "Far from operational Domes"}}, --no dome nearby
	UnexploredSector =                { type = "warning", priority = 98, text = T{852, "This sector is not yet scanned. The construction will possibly make resource deposits or Anomalies unreachable."} , short =  T{853, "Unexplored sector"}},

	NoDroneHub =                      { type = "problem", priority = 100,  text = T{845, "Too far from working Drone commander."}, short =  T{8016, "Too far from working Drone commander"}}, --outside the range of any drone command center
	
	RequiresCable =                   { type = "error", priority = 90, text = T{854, "Must be constructed over a power cable."}, short = T{855, "Must be built on a cable"}},
	RequiresCompletedCable =          { type = "error", priority = 90, text = T{9833, "Must be constructed over a completed power cable."}, short = T{9834, "Must be built on a completed cable"}},
	RequiresPipe =                    { type = "error", priority = 90, text = T{856, "Must be constructed over a pipe."}, short = T{857, "Must be built on a pipe"}},
	RequiresCompletedPipe =           { type = "error", priority = 90, text = T{9835, "Must be constructed over completed a pipe."}, short = T{9836, "Must be built on a completed pipe"}},
	RequiresPassage =                 { type = "error", priority = 90, text = T{8770, "Must be constructed over a passage."}, short = T{8771, "Must be built on a passage"}},
	RequiresCompletedPassage =        { type = "error", priority = 90, text = T{9758, "Must be constructed over a completed passage."}, short = T{9759, "Must be built on a completed passage"}},
	DontBuildHere =                   { type = "error", priority = 92, text = T{858, "Can't build on dust geysers."}, short = T{7953, "Blocking objects"}},
	BlockingObjects =                 { type = "error", priority = 97, text = T{860, "Objects underneath are blocking construction."}, short = T{7953, "Blocking objects"}},
	NoPlaceForSpire =                 { type = "error", priority = 97, text = T{9619, "No Spire Slot."}, short = T{9620, "No Spire Slot"}},
	UnevenTerrain =                   { type = "error", priority = 96, text = T{861, "Uneven terrain."}, short = T{7954, "Uneven terrain"}},
	ResourceRequired =                { type = "error", priority = 95, text = T{862, "There is none of the required resource nearby."},short =  T{863, "Requires a deposit"} }, --no resource nearby.
	ResourceTechnologyRequired =      { type = "error", priority = 95, text = T{864, "You lack the technology to exploit nearby resources."}, short = T{865, "Unexploitable deposits"}}, --no resource nearby.
	DomeRequired =                    { type = "error", priority = 94, text = T{866, "Must be placed under a functioning Dome."}, short =  T{867, "Requires a Dome"} },
	NonBuildableInterior =            { type = "error", priority = 94, text = T{868, "Unbuildable area."}, short = T{7955, "Unbuildable area"}},
	DomeProhibited =                  { type = "error", priority = 93, text = T{869, "Cannot be placed in a Dome."}, short =  T{870, "Outside building"}},
	DomeCeilingTooLow =               { type = "error", priority = 93, text = T{871, "Cannot be placed at this location due to height constraints."}, short =  T{872, "Too tall"}},
	ParentFarmRequired =              { type = "error", priority = 98, text = T{873, "Must be placed adjacent to the farm or its fields."}, },
	LineTooLong =                     { type = "error", priority = 95, text = T{874, "Section is too long."}, short  =  T{875, "Too long"}}, --cable/pipe too long
	NoNearbyWorkers =                 { type = "error", priority = 100, text = T{190, "This building requires Colonists and is too far from your Domes."}, short =  T{876, "Too far from Domes"}}, --no workers nearby
	TooFarFromTunnelEntrance =        { type = "error", priority = 100, text = T{6773, "Too far from tunnel entrance."}, short =  T{846, "Too far"}},
	RocketLandingDustStorm =          { type = "error", priority = 90, text = T{8524, "Rockets can't land during dust storms."}, short = T{8525, "Can't Land"}},
	PassageRequiresTwoDomes = 		    { type = "error", priority = 90, text = T{8772, "Passage must start and end in a dome."}, short = T{8773, "No dome"}},
	PassageRequiresDifferentDomes =   { type = "error", priority = 90, text = T{8928, "Passage must start and end in different domes."}, short = T{8929, "Same dome"}},
	PassageTooCloseToEntrance =       { type = "error", priority = 90, text = T{8774, "Too close to dome entrance."}, short = T{8775, "Dome entrance blocking"}},
	PassageTooCloseToLifeSupport =    { type = "error", priority = 90, text = T{9760, "Too close to pipe link."}, short = T{9761, "Pipe blocking"}},
	PassageAngleToSteep = 				 { type = "error", priority = 91, text = T{8930, "Too sharp curve."}, short = T{8931, "Sharp curve"}},
	
	DepositInfo =                     { type = "info",  priority = 97, text = T{877, "Available resource<right><resource><newline><left>Grade<right><grade><left>"} },

	-- tutorial-ralated
	TooFarFromTarget = 		 		    { type = "error", priority = 90, text = T{8932, "Too far from target location."}, short = T{846, "Too far"}},
	WrongBuilding = 			 		    { type = "error", priority = 90, text = T{8933, "Wrong building selected."}, short = T{8934, "Wrong building"}},
}


GlobalVar("ConstructableArea", function()
	local sizex, sizey = terrain.GetMapSize()
	local border = const.ConstructBorder
	return box(border, border, (sizex or 0) - border, (sizey or 0) - border)
end)

function SortConstructionStatuses(statuses)
	table.sort(statuses, function(a, b) 
		local a_p = a.type == "error" and a.priority + 100 or a.priority
		local b_p = b.type == "error" and b.priority + 100 or b.priority
		if a_p == b_p then return _InternalTranslate(a.text) < _InternalTranslate(b.text) end
		return a_p > b_p
	end)
end

function TryCloseAfterPlace(self)
	if self.template and ClassTemplates.Building[self.template].wonder then
		CloseModeDialog()
	end
	
	local shift = Platform.desktop and terminal.IsKeyPressed(const.vkShift)
	
	local left_trigger
	if GetUIStyleGamepad() then
		local function CheckForGamepadState(state_idx)
			local state = XInput.CurrentState[state_idx]
			return type(state) == "table" and (state.LeftTrigger or 0) > 0
		end
		
		if Platform.desktop then
			for i = 0, XInput.MaxControllers() - 1 do
				if CheckForGamepadState(i) then
					left_trigger = true
					break
				end
			end
		else
			left_trigger = CheckForGamepadState(XPlayerActive)
		end
	end
	
	if not shift and not left_trigger then
		CloseModeDialog()
	end
end

local function UpdateConstructionCursorObject(controller)
	while true do
		WaitNextFrame()
		local function UpdateForGamepadState(state_idx)
			local state = XInput.CurrentState[state_idx]
			if type(state) == "table" and state.LeftThumb then
				local x, y = state.LeftThumb:xy()
				if x ~= 0 or y ~= 0 then
					local pos = GetTerrainGamepadCursor()
					pos = HexGetNearestCenter(pos)
					controller:UpdateCursor(pos)
				end
			end
		end
		
		if Platform.pc then
			for i = 0, XInput.MaxControllers() - 1 do
				UpdateForGamepadState(i)
			end
		else
			UpdateForGamepadState(XPlayerActive)
		end
	end
end

DefineClass.ConstructionModeDialog = {
	__parents = { "InterfaceModeDialog" },
	mode_name = "construction",
	template = false,
	params = false,
	selected_dome = false,
	instant_build = false,
	template_variants = false, 
	TryCloseAfterPlace = TryCloseAfterPlace,
}

function ConstructionModeDialog:Init()
	for k,v in pairs(self.context) do
		self[k] = v
	end
	self:SetModal()
	self:SetFocus()
	local construction = CityConstruction[UICity]
	construction.template_variants = self.template_variants or false
	construction:Activate(self.template, self.params)
	HideMouseCursor("InGameInterface")
	HideGamepadCursor("construction")
	ShowResourceIcons("construction")
	UICity:SetCableCascadeDeletion(false, "ConstructionModeDialog")
	
	if self.selected_dome then
		UICity:SelectDome(self.selected_dome) --should be already opened, select it in UICity to prevent the build menu from closing it.
	end
	
	if GetUIStyleGamepad() then
		self:CreateThread("GamepadCursorUpdate", UpdateConstructionCursorObject, CityConstruction[UICity])
	end
	local dlg = GetHUD()
	if dlg then 
		local ctrl = dlg.idtxtConstructionStatus
		ctrl:SetMargins(box(0,0,0,0))
		ctrl:AddDynamicPosModifier({id = "construction", target = construction.cursor_obj})
	end
end

function OpenConstructionInfopanel()
	local obj = CityConstruction[UICity]
	local constr_dlg = GetInGameInterfaceModeDlg()
	if obj and constr_dlg and constr_dlg:IsKindOf("ConstructionModeDialog") then
		OpenXInfopanel(constr_dlg, obj, "ipConstruction")
	end
end

function OpenGridConstructionInfopanel()
	local obj = CityGridConstruction[UICity]
	local constr_dlg = GetInGameInterfaceModeDlg()
	if obj and constr_dlg and constr_dlg:IsKindOf("GridConstructionDialog") then
		OpenXInfopanel(constr_dlg, obj, "ipGridConstruction")
	end
end

function OpenGridSwitchConstructionInfopanel()
	local obj = CityGridSwitchConstruction[UICity]
	local constr_dlg = GetInGameInterfaceModeDlg()
	if obj and constr_dlg and constr_dlg:IsKindOf("GridSwitchConstructionDialog") then
		OpenXInfopanel(constr_dlg, obj, "ipGridConstruction")
	end
end

function OpenTunnelConstructionInfopanel(template)
	local obj = CityTunnelConstruction[UICity]
	local constr_dlg = GetInGameInterfaceModeDlg()
	if obj and constr_dlg and constr_dlg:IsKindOf("TunnelConstructionDialog") then
		obj:Initialize(template)		
		OpenXInfopanel(constr_dlg, obj, "ipConstruction")
	end
end

function _ShowNearbyHexGrid(pos)
	if pos then
		hr.NearestHexCenterX = pos:x()
		hr.NearestHexCenterY = pos:y()
		hr.NearestHexCenterZ = terrain.GetSurfaceHeight(pos)
	else
		hr.NearestHexCenterZ = 0
	end
end

function ShowNearbyHexGrid(pos)
	DelayedCall(0, _ShowNearbyHexGrid, pos)
end

function ConstructionModeDialog:Open(...)
	InterfaceModeDialog.Open(self, ...)
	if IsEditorActive() then 
		return 
	end
	DelayedCall(0, OpenConstructionInfopanel) -- SelectionChange message is delayed, so we need to delay this infopanel.
		-- the separate infopanel handling is caused by the fact that the cursor_obj is not SelectedObj for now.
		-- when it is done, all this should be removed and we should simply call SelectObj(cursor_obj)
end

function ConstructionModeDialog:Close(...)
	InterfaceModeDialog.Close(self, ...)
	ShowMouseCursor("InGameInterface")
	ShowGamepadCursor("construction")
	HideResourceIcons("construction")
	CityConstruction[UICity]:Deactivate()
	g_EditorModeDlg = false
	UICity:SetCableCascadeDeletion(true, "ConstructionModeDialog")
	
	if self.selected_dome then
		UICity:SelectDome(false)
	end
	if ShowResourceOverview then
		OpenResourceOverviewInfopanel()
	end
	
	if self:IsThreadRunning("GamepadCursorUpdate") then
		self:DeleteThread("GamepadCursorUpdate")
	end
	local dlg = GetHUD()
	if dlg then dlg.idtxtConstructionStatus:SetVisible(false) end
end

function ConstructionModeDialog:OnMouseButtonDown(pt, button)
	if button == "L" then
		if not CityConstruction[UICity]:Place(nil, nil, nil, nil, self.instant_build, true) then
			PlayFX("ConstructionFail", "start")
		else
			self:TryCloseAfterPlace()
		end
		return "break"
	elseif button == "R" then
		if not IsEditorActive() then
			if self.params and self.params.cancel_callback then
				self.params.cancel_callback()
			end
			PlayFX("CancelConstruction", "start")
			CloseModeDialog()
		else
			if GetInGameInterfaceModeDlg() == self then
				CloseModeDialog()
			end
			if self.window_state ~= "destroying" then
				self:Close()
			end
		end
		return "break"
	elseif button == "M" then
		CityConstruction[UICity]:Rotate(-1)
		return "break"
	end
end

function ConstructionModeDialog:OnMouseButtonDoubleClick(pt, button)
	if button == "M" then
		return self:OnMouseButtonDown(pt, button)
	end
end

function ConstructionModeDialog:OnMousePos(pt)
	local pos = GetTerrainCursor()
	CityConstruction[UICity]:UpdateCursor(pos)
	return "break"
end

function ConstructionModeDialog:OnKbdKeyDown(virtual_key, repeated)
	if virtual_key == const.vkEsc then
		self:OnMouseButtonDown(nil, "R")
		return "break"
	end
	local construction = CityConstruction[UICity]
	if virtual_key == const.vkOpensq then
		if not repeated then
			if construction.template_variants and next(construction.template_variants) then
				construction:ChangeTemplateVariant(1)
			else
				construction:ChangeAlternativeEntity(1)
			end
		end
		return "break"
	end
	if virtual_key == const.vkClosesq then
		if not repeated then
			if construction.template_variants and next(construction.template_variants) then
				construction:ChangeTemplateVariant(-1)
			else
				construction:ChangeAlternativeEntity(-1)
			end
		end
		return "break"
	end
	return "continue"
end

function ConstructionModeDialog:OnShortcut(shortcut, source)
	local construction = CityConstruction[UICity]
	if shortcut == "ButtonA" or shortcut == "LeftTrigger-ButtonA" then
		self:OnMouseButtonDown(nil, "L") --place
		return "break"
	elseif shortcut == "ButtonB" then
		self:OnMouseButtonDown(nil, "R") --cancel
		return "break"
	elseif shortcut == "DPadLeft" then
		if construction.template_variants and next(construction.template_variants) then
			construction:ChangeTemplateVariant(1)
		else
			construction:ChangeAlternativeEntity(1)
		end
		return "break"
	elseif shortcut == "DPadRight" then
		if construction.template_variants and next(construction.template_variants) then
			construction:ChangeTemplateVariant(-1)
		else
			construction	:ChangeAlternativeEntity(-1)
		end
		return "break"
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	end
	
	return "continue"
end

function ConstructionModeDialog:OnMouseWheelForward(...)
	CityConstruction[UICity]:UpdateShortConstructionStatus()
	return "continue"
end

function ConstructionModeDialog:OnMouseWheelBack(...)
	CityConstruction[UICity]:UpdateShortConstructionStatus()
	return "continue"
end

GlobalVar("CityConstruction", {})

DefineClass.CursorBuilding = {
	__parents = { "Shapeshifter", "AutoAttachObject", "NightLightObject" },
	class_flags = { cfNoHeightSurfs = true },
	enum_flags = { efCollision = false, efApplyToGrids = false, efWalkable = false, efRoad = false, efBakedTerrainDecal = false },

	auto_attach = false,
	GetSelectionRadiusScale = false,
	entity = false,
	
	override_palette = false,
	dome_skin = false,
	rocket = false,
}

function CursorBuilding:IsNightLightPossible()
	return self:GetGameFlags(const.gofNightLightsEnabled) ~= 0
end

function CursorBuilding:AreNightLightsAllowed()
	return true
end

local clear_enum_flags = const.efWalkable + const.efApplyToGrids + const.efCollision + const.efBakedTerrainDecal
function CursorBuilding:Init()
	self.entity = self.entity or self.template:GetEntity()
	self:ChangeEntity(self.entity)
	if self.dome_skin then
		self.template.AttachConfigurableAttaches(self, self.dome_skin[2])
	else
		self.template.AttachConfigurableAttaches(self, self.template.configurable_attaches)
	end
	if not self.rocket then
		AutoAttachObjectsToPlacementCursor(self)
	else
		local rocket_e = self.rocket:GetEntity()
		local idx = self:GetSpotBeginIndex("idle", "Rocket")
		if idx > -1 then
			PlaceAtSpot(self, idx, rocket_e, "placementcursor")
		end
	end
	self:ForEachAttach(AutoAttachObjectsToPlacementCursor)
	AttachDoors(self, self.entity)
	
	local palette = self.override_palette or self.dome_skin and self.dome_skin.palettes
	
	if not palette then
		local palettes = BuildingPalettes[self.template.template_name] 
		if palettes and palettes[1] and EntityPalettes[palettes[1]] then
			palette = palettes[1]
		end
	end
	
	if palette then
		Building.SetPalette(self, palette)
	end
	if self.template:IsKindOf("SpireBase") and self.template.spire_frame_entity ~= "none" and IsValidEntity(self.template.spire_frame_entity) then
		local frame = PlaceObject("Shapeshifter")
		frame:ChangeEntity(self.template.spire_frame_entity)
		frame:SetAttachOffset( point(-1, 0, 4392) ) --Dome basic default frame offset
		self:Attach(frame, self:GetSpotBeginIndex("Origin"))
	end
	
	-- attach tiles
	local shape = GetEntityOutlineShape(self.template.entity)
	for i = 1, #shape do
		local q, r = shape[i]:xy()
		local x, y = HexToWorld(q, r)
		local offset = point(x, y, 30)
		local tile = PlaceObject("GridTile", nil, const.cfComponentAttach)
		self:Attach(tile)
		tile:SetAttachOffset(offset)
	end
	
	if IsKindOf(self.template, "LifeSupportGridObject") then
		SetWaterMarkers(self, true)
	end
	
	--switch decal type
	if self.template.show_decals_on_placement then
		local att = self:GetAttaches()
		for i = 1, #att do
			if att[i]:GetEnumFlags(const.efBakedTerrainDecal) ~= 0 then
				att[i]:SetEnumFlags(const.efVisible)
			end
		end
	end
	self:ClearHierarchyEnumFlags(clear_enum_flags)
	if self.template.lights_on_during_placement then
		self:SetIsNightLightPossible(true, true)
	else
		self:ClearHierarchyGameFlags(const.gofNightLightsEnabled)
	end
end

function CursorBuilding:GameInit()
	--setup animated indicators
	local class = self.template
	if IsKindOf(class, "StorageWithIndicators") then
		StorageWithIndicators.ResetIndicatorAnimations(self, class.indicator_class)
	end
	if class.show_range_all or g_BCHexRangeEnable[class.class] then
		ShowHexRanges(UICity, class.class, self)
	end
	if class.show_range_class ~= "" then
		ShowHexRanges(UICity, class.show_range_class)
	end
	
	if class.construction_state ~= "idle" then
		self:SetState(class.construction_state)
		local a = self:GetAttaches()
		for i = 1, #(a or "") do
			if a[i]:HasState(class.construction_state) then
				a[i]:SetState(class.construction_state)
			end
		end
	end
end

function CursorBuilding:Done()
	if self.template.show_range_all or g_BCHexRangeEnable[self.template.class] then
		HideHexRanges(UICity, self.template.class)
	end
	if self.template.show_range_class ~= "" then
		HideHexRanges(UICity, self.template.show_range_class)
	end
end

function ChangeAlternativeEntity(cursor_bld, dir, controller)
	local t_n = cursor_bld.template.template_name
	
	if not t_n or t_n == "" then
		return
	end
	
	local current = cursor_bld:GetEntity()
	local skins = GetBuildingSkins(t_n)
	local class = ClassTemplates.Building[cursor_bld.template.class]
	local is_dome = IsKindOf(class, "Dome")
	local idx = table.find(skins, is_dome and 1 or current, is_dome and current or nil)
	local count = #skins
	if not idx or count <= 1 then
		return
	end
	idx = idx + dir
	if idx>count then idx = 1 end	
	if idx<1     then idx = count end	
	local new_ent = skins[idx]
	if controller then
		controller.dome_skin = is_dome and new_ent or false
	end
	new_ent = new_ent and is_dome and new_ent[1] or new_ent
	return new_ent or current
end

function CursorBuilding:SetColorModifier(clr)
	AutoAttachObject.SetColorModifier(self,clr)
	local attaches = self:GetAttaches()
	if attaches then
		for i = 1, #attaches do
			local curr_attach = attaches[i]
			if not IsKindOf(curr_attach, "ParSystem") then
				curr_attach:SetColorModifier(clr)
			end
		end
	end
end

DefineClass.CursorSupply = {
	__parents = { "Shapeshifter", "AutoAttachObject" },
	enum_flags = { efCollision = false, efApplyToGrids = false, efWalkable = false, efRoad = false },
}

function CursorSupply:Init()
	AutoAttachObjectsToPlacementCursor(self)
	self:ForEachAttach(AutoAttachObjectsToPlacementCursor)
	local class = g_Classes[self.template]
	local entity = class.entity
	self:ChangeEntity(entity)
	--switch decal type
	if self.template.show_decals_on_placement then
		local att = self:GetAttaches()
		for i = 1, #att do
			if att[i]:GetEnumFlags(const.efBakedTerrainDecal) ~= 0 then
				att[i]:SetEnumFlags(const.efVisible)
			end
		end
	end
	self:ClearHierarchyEnumFlags(clear_enum_flags)
end

function CursorSupply:SetColorModifier(clr)
	AutoAttachObject.SetColorModifier(self,clr)
	local attaches = self:GetAttaches()
	if attaches then
		for i = 1, #attaches do
			local curr_attach = attaches[i]
			curr_attach:SetColorModifier(clr)
		end
	end
end

DefineClass.ConstructionController = {
	__parents = { "InitDone" },
	cursor_obj = false,
	template_obj = false, --the building definition table
	template_obj_points = false,
	flat_obj_points = false,
	template = false,
	is_tempate = false,
	construction_obstructors = false, --keeps a list of all objects that are currenty obstructing, so we can tint them.
	dome_with_obstructed_roads = false,
	
	construction_statuses = false,
	
	properties = {
		{id = "construction_statuses_property", editor = "text", name = T{""}, translate = true},
	},
	
	construction_statuses_property = false,
	
	selected_domes = false,
	snap_to_grid = true,
	amount = false,
	resource = false,
	supplied = false,
	prefab = false,
	placing_resource = false,
	template_variants = false,
	markers = false,
	ui_callback = false, -- function to call when the construction is placed; only works for placing through the UI
	
	dome_required = false,
	dome_forbidden = false,
	
	stockpiles_obstruct = false,
	
	rocks_underneath = false,
	
	dome_skin = false,
	rocket = false,
}

function ConstructionController:Init()
	self.construction_statuses = {}
	self.rocks_underneath = {}
end

function ConstructionController:CreateCursorObj(alternative_entity, template_obj, override_palette)
	local o
	if template_obj or self.is_template then
		o = CursorBuilding:new{
			template = template_obj or self.template_obj, 
			entity = alternative_entity or self.dome_skin and self.dome_skin[1] or (template_obj or self.template_obj):GetEntity(), 
			auto_attach_at_init = false,
			override_palette = override_palette,
			dome_skin = self.dome_skin,
			rocket = self.rocket,
		}
	else
		o = CursorSupply:new{template = self.template, auto_attach_at_init = false}
	end

	if o then
		local dlg = GetHUD()
		if dlg then 
			local ctrl = dlg.idtxtConstructionStatus
			ctrl:SetMargins(box(0,0,0,0))
			ctrl:AddDynamicPosModifier({id = "construction", target = o})
		end
	end
	
	return o
end

function ConstructionController:GetBuildGridRadius()
	local _, radius = self.cursor_obj:GetBSphere()
	return Max(radius * 3, 13000)
end

function FixConstructPos(pt)
	local z = pt:z() or 0
	local terrain_z = terrain.GetHeight(pt)
	return terrain_z ~= z and pt:SetZ(terrain_z) or pt
end

local function GetPosHelper(source)
	source = source or (GetUIStyleGamepad() and "gamepad" or "mouse")
	local pos = (source == "gamepad") and GetTerrainGamepadCursor() or GetTerrainCursor()
	return HexGetNearestCenter(pos)
end

function ConstructionController:Activate(template,	params)
	self.dome_skin = false
	self.rocket = params and params.rocket or false
	self.selected_domes = {}
	SelectObj() --so "SelectionChanged" messages are correctly dispatched.
	if params then
		self.amount, self.supplied, self.prefab, self.resource, self.ui_callback = params.amount, params.supplied, params.prefab, params.resource, params.ui_callback
	else
		self.amount, self.supplied, self.prefab, self.resource, self.ui_callback = false, false, false, false, false
	end
	if params and params.snap_to_grid~=nil then -- if nil, use default == true
		self.snap_to_grid = params.snap_to_grid
	else
		self.snap_to_grid = true
	end
	
	if params and params.placing_resource then
		self.placing_resource = params.placing_resource
	else
		self.placing_resource = false
	end
	
	self.dome_required = params and params.dome_required
	self.dome_forbidden = params and params.dome_forbidden
	self.stockpiles_obstruct = params and params.stockpiles_obstruct
	
	local template_obj = ClassTemplates.Building[template]
	self.is_template = not not template_obj
	if not template_obj then
		template_obj = g_Classes[template]
	end
	
	self.template = template
	self.template_obj = template_obj
	self.template_obj_points = template_obj:GetBuildShape()
	self.flat_obj_points = template_obj:GetFlattenShape()
	
	if IsKindOf(template_obj, "Dome") then
		local def_skin = GetMissionSponsor().default_skin
		if def_skin and def_skin ~= "" then
			local skins = GetDomeSkins({entity = template_obj:GetEntity()}, template_obj)
			local idx = table.find(skins, "skin_category", def_skin)
			if idx then
				self.dome_skin = skins[idx]
			end
		end
	end

	self.cursor_obj = self:CreateCursorObj(params and params.template, nil, params and params.override_palette)
	
	if HintsEnabled then
		local is_dome = IsKindOf(self.cursor_obj.template, "Dome")
		if is_dome and not g_ActiveHints["HintDomePlacedTooEarly"] then
			local has_one_air_producer
			local a_grids = UICity.air
			for i = 1, #a_grids do
				if #a_grids[i].producers > 0 then
					has_one_air_producer = true
					break
				end
			end
			local has_one_water_producer
			local w_grids = UICity.water
			for i = 1, #w_grids do
				if #w_grids[i].producers > 0 then
					has_one_water_producer = true
					break
				end
			end
			if not has_one_air_producer or not has_one_water_producer then
				HintTrigger("HintDomePlacedTooEarly")
			end
		end
	end
	
	if IsKindOf(self.template_obj, "RocketLandingSite") then
		self.cursor_obj.GetSelectionRadiusScale = params.drones and const.CommandCenterMaxRadius or 0
	else
		self.cursor_obj.GetSelectionRadiusScale = self.template_obj:HasMember("GetSelectionRadiusScale") and self.template_obj:GetSelectionRadiusScale()
	end
	
	PlayFX("ConstructionCursor", "start", self.cursor_obj, self.template_obj.class)
	
	if IsKindOf(self.template_obj, "Workplace") and self.template_obj.dome_forbidden then
		if g_FXBuildingType then
			PlayFXBuildingType("Select", "end", g_FXBuildingType.city, g_FXBuildingType.class)
		end
		PlayFXBuildingType("Select", "start", UICity, "Dome")
		g_FXBuildingType = { city = UICity, class = "Dome" }
	end
	
	local terrain_pos = GetUIStyleGamepad() and GetTerrainGamepadCursor() or GetTerrainCursor()
	local pos = self.is_template and HexGetNearestCenter(terrain_pos) or terrain_pos
	pos = terrain.ClampPoint(pos)
	
	self.cursor_obj:SetPos(FixConstructPos(pos))
	self:UpdateCursor(pos,"force")
	
	
	table.change(hr, "Construction", { RenderBuildGrid = self.snap_to_grid and 3 or 0, BuildGridRadius = self:GetBuildGridRadius() })
	self:PickCursorObjColor()
	
	if template_obj:IsKindOf("SubsurfaceDepositConstructionRevealer") then
		template_obj:Reveal()
	end
end

function OnMsg.CameraTransitionStart(eye, lookat, transition_time)
	if GetUIStyleGamepad() then
		if InGameInterfaceMode == "construction" then
			local construction = CityConstruction[UICity]
			if construction and IsValid(construction.cursor_obj) then
				local pos = FixConstructPos(lookat)
				construction.cursor_obj:SetPos(pos)
				construction:UpdateCursor(pos, "force")
			end
		end
	end
end

function ConstructionController:Deactivate()
	if self.template_obj:IsKindOf("SubsurfaceDepositConstructionRevealer") then
		self.template_obj:Hide()
	end
	table.restore(hr, "Construction")
	if self.cursor_obj then 
		PlayFX("ConstructionCursor", "end", self.cursor_obj, self.template_obj.class)
		self.cursor_obj:delete()
	end	
	
	if IsKindOf(self.template_obj, "Workplace") and self.template_obj.dome_forbidden then
		if g_FXBuildingType then
			PlayFXBuildingType("Select", "end", g_FXBuildingType.city, g_FXBuildingType.class)
			g_FXBuildingType = false
		end
	end
	
	self.cursor_obj = false
	self.template_obj = false
	self:ColorRocks({})
	self:ClearColorFromAllConstructionObstructors()
	self.construction_obstructors = false
	
	--clear markers from dome with obstructed roads
	if self.dome_with_obstructed_roads then
		SetShapeMarkers(self.dome_with_obstructed_roads, false)
	end
	
	for i = 1, #self.selected_domes do
		self.selected_domes[i]:Close()
	end
	
	local markers = self.markers or ""
	for i = 1, #markers do
		if IsValid(markers[i]) then --building could be demolished while constructing and its attaches should already be dead.
			DoneObject(markers[i])
		end
	end
	
	self.markers = false	
end

function ConstructionController:ChangeCursorObj(dir)
	local pos = self.cursor_obj:GetPos()
	local angle = self.cursor_obj:GetAngle()
	local new_entity = ChangeAlternativeEntity(self.cursor_obj, dir, self)
	if self.cursor_obj then 
		PlayFX("ConstructionCursor", "end", self.cursor_obj, self.template_obj.class)
		self.cursor_obj:delete()
	end
	self:ColorRocks({})
	self:ClearColorFromAllConstructionObstructors()
	self.construction_obstructors = false
	self.cursor_obj = self:CreateCursorObj(new_entity)
	
	self.cursor_obj.GetSelectionRadiusScale = self.template_obj:HasMember("GetSelectionRadiusScale") and self.template_obj:GetSelectionRadiusScale()
	PlayFX("ConstructionCursor", "start", self.cursor_obj, self.template_obj.class)
	
	self.cursor_obj:SetAngle(angle)
	self.cursor_obj:SetPos(pos)
	self:PickCursorObjColor()
	self:UpdateCursor(pos,"force")
end

if FirstLoad then
	OrigColorMod = false
	ControllerMarkers = false
end

function OnMsg.NewMap()
	ControllerMarkers = {}
	OrigColorMod = {}
end

function OnMsg.LoadGame()
	assert(next(ControllerMarkers or empty_table) == nil) --leaked construction markers
	ControllerMarkers = {}
	OrigColorMod = {}
end

function GetMaxHeightInHex(x, y)
	local hex_radius = const.HexSize
	local h0 = terrain.GetHeight(x, y)
	local h1 = terrain.GetHeight(x - hex_radius, y)
	local h2 = terrain.GetHeight(x + hex_radius, y)
	local h3 = terrain.GetHeight(x, y - hex_radius)
	local h4 = terrain.GetHeight(x, y + hex_radius)
	return Max(h0, h1, h2, h3, h4)
end

function SetShapeMarkers(obj, set, color, shape_name)
	local markers = ControllerMarkers[obj]
	if not set then
		for i = 1, #(markers or "") do
			DoneObject(markers[i])
		end
		ControllerMarkers[obj] = nil
	else
		if not IsValid(obj) or not obj:IsValidPos() then return end
		if markers then 
			return
		end
		shape_name = shape_name or "Outline"
		local shape_getter = _G[string.format("GetEntity%sShape", shape_name)]
		if type(shape_getter) ~= "function" then
			assert(false, "No such function: " .. shape_getter)
			return
		end
		local x0, y0, z0, angle0
		if IsKindOf(obj, "Building") and obj.orig_state then
			x0, y0, z0 = obj.orig_state[1]:xyz()
			angle0 = obj.orig_state[2]
		else
			x0, y0, z0 = obj:GetVisualPosXYZ()
			angle0 = obj:GetAngle()
		end
		markers = {}
		color = color or const.clrNoModifier
		local shape = shape_getter(obj:GetEntity())
		local hex_angle = HexAngleToDirection(angle0)
		local hex_radius = const.HexSize
		for i = 1, #shape do
			local q, r = shape[i]:xy()
			local x, y = HexToWorld(HexRotate(q, r, hex_angle))
			x = x + x0
			y = y + y0
			local z = Max(z0, GetMaxHeightInHex(x, y)) + 30
			local tile = PlaceObject("GridTile")
			tile:SetPos(x, y, z)
			tile:SetColorModifier(color)
			markers[#markers + 1] = tile
		end
		ControllerMarkers[obj] = markers
	end
end

local function ApplyColorMod(obj, color)
	OrigColorMod[obj] = OrigColorMod[obj] or obj:GetColorModifier()
	obj:SetColorModifier(color)
end
local function RestoreColorMod(obj)
	local color = OrigColorMod[obj]
	if color then
		obj:SetColorModifier(color)
		OrigColorMod[obj] = nil
	end
end

function ConstructionController:ClearColorFromAllConstructionObstructors()
	for i = 1, #(self.construction_obstructors or "") do
		local obstr = self.construction_obstructors[i]
		if IsValid(obstr) then
			RestoreColorMod(obstr)
		end
		SetShapeMarkers(obstr, false)
	end
end

function ConstructionController:ClearColorFromMissingConstructionObstructors(old, new)
	for i = 1, #(old or "") do
		if not table.find(new, old[i]) then
			if IsValid(old[i]) then
				RestoreColorMod(old[i])
			end
			SetShapeMarkers(old[i], false)
		end
	end
end

function ConstructionController:SetColorToAllConstructionObstructors(color)
	if IsEditorActive() then return end
	local ignore_domes = IsKindOfClasses(self, "GridConstructionController", "GridSwitchConstructionController")
	local domes = {}
	for i = 1, #(self.construction_obstructors or "") do
		local obstr = self.construction_obstructors[i]
		if IsValid(obstr) then
			ApplyColorMod(obstr, color)
			if not IsKindOf(obstr, "SurfaceDeposit") then
				SetShapeMarkers(obstr, true, color)
			end
			if not ignore_domes and IsKindOf(obstr, "Dome") then
				table.insert(domes, obstr)
			end
		else
			assert(false, "Building is unexpectedly deleted.")
		end
	end
	if not ignore_domes then
		local inside_dome = GetDomeAtPoint(self.cursor_obj)
		if inside_dome then table.insert(domes, inside_dome) end
		
		self:CloseSelectedDomes(domes)
	end
end

function ConstructionController:CloseSelectedDomes(domes)
	for i = 1, #self.selected_domes do
		if UICity.selected_dome ~= self.selected_domes[i] and not table.find(domes, self.selected_domes[i]) then
			self.selected_domes[i]:Close()
		end
	end
	
	for i = 1, #domes do
		if not table.find(self.selected_domes, domes[i]) then
			domes[i]:Open()
		end
	end
	
	self.selected_domes = domes
end

function ConstructionController:IsObstructed()
	return self.construction_obstructors and #self.construction_obstructors > 0
end

local ObstructorsQuery = {
	classes = {"Building"},
	area = false,
	arearadius = false,
}

--marks ObjectGrid GridObjects that shouldn't block construction.
DefineClass.DoesNotObstructConstruction = {
	__parents = { "CObject" },
	game_flags = { gofTemporalConstructionBlock = true },
}

local ungrided_stockpile_blockers = false --these should block and be able to receive resources when placing resouces
local ungrided_all_other_blockers = false --these should just block
function OnMsg.ClassesBuilt()
	ungrided_stockpile_blockers = ClassDescendantsList("UngridedObstacle", function(cls) 
																										local class_def = g_Classes[cls]
																										return IsKindOf(class_def, "ResourceStockpileBase") and not IsKindOf(class_def, "DoesNotObstructConstruction") end)
																										
	ungrided_all_other_blockers = ClassDescendantsList("UngridedObstacle", function(cls) 
																										local class_def = g_Classes[cls]
																										return not IsKindOfClasses(class_def, "ResourceStockpileBase", "DoesNotObstructConstruction") end)
end

function ConstructionController:AlignToLandingPad(cursor_obj, landing_pad)
	cursor_obj:SetPos(landing_pad:GetPos())
	cursor_obj:SetAngle(landing_pad:GetAngle())
end

function ConstructionController:UpdateConstructionObstructors()
	local old_obstructors = self.construction_obstructors
	local non_obstructors = "DoesNotObstructConstruction"
	if IsKindOf(self.template_obj, "ResourceStockpile") then
		non_obstructors = nil
	elseif IsKindOf(self.template_obj, "RocketLandingSite") then
		non_obstructors = "WasteRockObstructor"
	end
	
	local am_i_tall = self.is_template and self.template_obj.is_tall
	local pipe_filter = function(o)
		if IsKindOf(o, "LifeSupportGridElement") then
			--its a pipe
			if am_i_tall then return true end --any pipe blocks tall
			return o.pillar --pipes with pillars block short
		end
		
		return true
	end
	--buildings
	self.construction_obstructors = HexGridShapeGetObjectList(ObjectGrid, self.cursor_obj, self.template_obj_points, nil, non_obstructors, pipe_filter)
	
	if IsKindOf(self.template_obj, "RocketLandingSite") and self.construction_obstructors and #self.construction_obstructors > 0 then
		for _, obj in ipairs(self.construction_obstructors) do
			if obj:IsKindOf("LandingPad") and not obj:HasRocket() then
				self:AlignToLandingPad(self.cursor_obj, obj)
				self:ClearColorFromAllConstructionObstructors()
				self:ClearColorFromMissingConstructionObstructors(old_obstructors, empty_table)
				self.construction_obstructors = {}
				return
			end
		end
	end
	
	local force_extend_bb = self.template_obj:HasMember("force_extend_bb_during_placement_checks") and self.template_obj.force_extend_bb_during_placement_checks ~= 0 and self.template_obj.force_extend_bb_during_placement_checks or false
	--stockpiles
	local stockpiles = HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, function(obj) return obj:GetParent() == nil end, ungrided_stockpile_blockers, force_extend_bb) --not test so we can color them
	if not self.placing_resource or #(stockpiles or "") > 1 or --not a stockpile or too many stockpiles already
		(stockpiles[1] and (stockpiles[1].resource ~= self.resource or --stockpile of different type
		Min(self.amount, const.ResourceUnitsInPile) > stockpiles[1]:GetMax() - stockpiles[1]:GetStoredAmount() / const.ResourceScale)) then --we cannot add any more resource.
		table.append(self.construction_obstructors, stockpiles)
	end
	if self.stockpiles_obstruct then
		--rocket.
		stockpiles = HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, function(obj) return obj:GetParent() == nil end, "ResourceStockpile", force_extend_bb) --not attached regular stockpiles.
		table.append(self.construction_obstructors, stockpiles)
	end
	--surface deposits
	table.append(self.construction_obstructors, 
					HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, nil, "SurfaceDeposit", force_extend_bb))
		
	if self.placing_resource then
		table.append(self.construction_obstructors, HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, nil, "WasteRockObstructor", force_extend_bb))
	end
	--everything else
	--empty table catches everything
	if #ungrided_all_other_blockers > 0 then
		table.append(self.construction_obstructors, HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, nil, ungrided_all_other_blockers, force_extend_bb))
	end
	
	self:ClearColorFromMissingConstructionObstructors(old_obstructors, self.construction_obstructors)
	
	--check if inside a dome and roads are obstructed
	if (not self.template_obj or self.template_obj.dome_spot == "none") then
		local dome = IsObjInDome(self.cursor_obj)
		local dome_is_obstructor = table.find(self.construction_obstructors, dome)
		if not dome_is_obstructor then
			if dome then
				--building has a dome
				local dome_hexes = GetEntityBuildShape(dome.entity)
				if dome_hexes and next(dome_hexes) then
					--only domes with build hexes can have their roads obstructed
					local obj_hexes = GetEntityOutlineShape(self.cursor_obj.entity)
					local offset = point(WorldToHex(self.cursor_obj:GetPos() - dome:GetPos()))
					local obj_rotation = HexAngleToDirection(self.cursor_obj:GetAngle())
					local dome_rotation = HexAngleToDirection(dome:GetAngle())
					if not CheckHexSurfaces(obj_hexes, dome_hexes, "subset", offset, obj_rotation, (dome_rotation-1)%6) then
						if not self.dome_with_obstructed_roads then
							--building just started obstructing the roads of its dome
							self.dome_with_obstructed_roads = dome
							SetShapeMarkers(self.dome_with_obstructed_roads, true, g_PlacementStateToColor.Obstructing, "InverseBuild")
						end
					elseif self.dome_with_obstructed_roads then
						--building stops obstructing the roads of its dome
						SetShapeMarkers(self.dome_with_obstructed_roads, false)
						self.dome_with_obstructed_roads = false
					end
				end
			elseif --[[not dome and]] self.dome_with_obstructed_roads then
				--building no longer has a dome, but previously obstructed the roads of one
				SetShapeMarkers(self.dome_with_obstructed_roads, false)
				self.dome_with_obstructed_roads = false
			end
		elseif self.dome_with_obstructed_roads then
			--dome had its roads obstructed, but now its walls now obstruct the building, which takes priority
			SetShapeMarkers(self.dome_with_obstructed_roads, false)
			self.dome_with_obstructed_roads = false
		end
	end
	
	--and now for something completely different.
	local new_rocks = HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, nil, nil, "WasteRockObstructor", force_extend_bb)
	self:ColorRocks(new_rocks)
	
	SetWaterMarkers(self.cursor_obj, "update")
	UpdateShapeHexes(self.cursor_obj)
end

function ConstructionController:ClearDomeWithObstructedRoads()
	if self.dome_with_obstructed_roads then
		--building stops obstructing the roads of its dome
		SetShapeMarkers(self.dome_with_obstructed_roads, false)
		self.dome_with_obstructed_roads = false
	end
end

function ConstructionController:ColorRocks(new_rocks)
	local old_rocks = self.rocks_underneath
	
	for i = 1, #(old_rocks or "") do
		local rock = old_rocks[i]
		if IsValid(rock) and not table.find(new_rocks, rock) then
			rock:ClearGameFlags(const.gofWhiteColored)
		end
	end
	
	for i = 1, #new_rocks do
		local rock = new_rocks[i]
		rock:SetGameFlags(const.gofWhiteColored)
	end
	
	self.rocks_underneath = new_rocks
end

function buildUnbuildableZ() -- workaround problem with storing 64-bit numbers in compiled chunks
	local a = 2^30
	return a * 4 - 1
end

local UnbuildableZ = buildUnbuildableZ()

function ConstructionController:UpdateCursor(pos, force)
	if IsValid(self.cursor_obj) then
		self.spireless_dome = false
		local hex_world_pos = HexGetNearestCenter(pos)
		local build_z = g_BuildableZ and GetBuildableZ(WorldToHex(hex_world_pos)) or UnbuildableZ
		if build_z == UnbuildableZ then
			build_z = pos:z() or terrain.GetHeight(pos)
		end
		hex_world_pos = hex_world_pos:SetZ(build_z)
		
		local placed_on_spot = false
		if self.is_template and not self.template_obj.dome_forbidden and self.template_obj.dome_spot ~= "none" then --dome not prohibited			
			local dome = GetDomeAtPoint(hex_world_pos)
			if dome and IsValid(dome) and IsKindOf(dome, "Dome") then
				if dome:HasSpot(self.template_obj.dome_spot) then
					local idx = dome:GetNearestSpot(self.template_obj.dome_spot, hex_world_pos)
					hex_world_pos = HexGetNearestCenter(dome:GetSpotPos(idx))
					placed_on_spot = true
					if self.template_obj.dome_spot == "Spire" then
						if self.template_obj:IsKindOf("SpireBase") and self.template_obj.spire_frame_entity ~= "none" and IsValidEntity(self.template_obj.spire_frame_entity) then
							assert(_G[self.template_obj.spire_frame_entity], "Specified Spire Frame Entity does not exist!")
							local frame = self.cursor_obj:GetAttaches("Shapeshifter")[1]
							local spot = dome:GetNearestSpot("idle", "Spireframe", self.cursor_obj)
							local pos = dome:GetSpotPos(spot)
							frame:SetAttachOffset(pos - hex_world_pos)
						end
					end
				elseif self.template_obj.dome_spot == "Spire" then
					self.spireless_dome = true
				end
			end
		end
		local new_pos = self.snap_to_grid and hex_world_pos or pos
		if not placed_on_spot then
			new_pos = FixConstructPos(new_pos)
		end

		if force or (self.cursor_obj:GetPos() ~= new_pos and hex_world_pos:InBox2D(ConstructableArea)) then
			ShowNearbyHexGrid(hex_world_pos)
			self.cursor_obj:SetPos(new_pos)
			self:UpdateConstructionObstructors()
			self:UpdateConstructionStatuses() --should go after obstructors
			self:UpdateShortConstructionStatus()
			ObjModified(self)
		end
	end
end

local hex_edges
local v = point(HexGetSize() * 8 / 10, 0)
hex_edges = { v }
for i = 1, 5 do
	hex_edges[i + 1] = Rotate(v, i * 60 * 60)
end

GlobalVar("g_BuildableZ", false)
function GetBuildableZ(q, r)
	return g_BuildableZ:get(q+r/2, r) -- aka HexToStorage in C++ terms
end

function IsBuildableZone(...) -- pos or x,y 
	local q, r = WorldToHex(...)
	return GetBuildableZ(q, r) ~= UnbuildableZ
end

function IsBuildableZoneQR(q, r) --q, r
	return GetBuildableZ(q, r) ~= UnbuildableZ
end

function HexFindBuildableAround(q, r, ...)
	return HexGridFindBuildable(q, r, ObjectGrid, g_BuildableZ, UnbuildableZ, ...)
end

function FindBuildableAround(x, y, ...)
	local q, r = WorldToHex(x, y)
	local bq, br, depth = HexFindBuildableAround(q, r, ...)
	if not bq then return end
	local x, y = HexToWorld(bq, br)
	return x, y, depth
end

function CalcBuildableGrid()
	if g_BuildableZ then return end
	RecalcBuildableGrid()
end

function OnMsg.NewMapLoaded()
	CalcBuildableGrid()
	Msg("BuildableGridReady")
end
	
OnMsg.LoadGame = CalcBuildableGrid

function ConstructionController:IsTerrainFlatForPlacement(shape_data, pos, angle)
	if self and self.template_obj:IsKindOf("RegolithExtractor") then --self is not guaranteed here.
		-- if placing a regolith mine, check for abandoned locations first
		local pos = self.cursor_obj:GetPos()
		local angle = self.cursor_obj:GetAngle()
		for i = 1, #OldMineLocations do
			if pos:Equal2D(OldMineLocations[i].pos) and angle == OldMineLocations[i].angle then
				return true
			end
		end
	end
	
	shape_data = shape_data or self.flat_obj_points or self.template_obj_points
	pos = pos or self.cursor_obj:GetVisualPos()
	angle = angle or self.cursor_obj:GetAngle()
	local dir = HexAngleToDirection(angle)
	
	local q, r = WorldToHex(pos)
	local original_z = false
	
	CalcBuildableGrid()

	for _, shape_pt in ipairs(shape_data) do
		local x, y = HexRotate(shape_pt:x(), shape_pt:y(), dir)
		local z = GetBuildableZ(q+x, r+y)
		original_z = original_z or z
		if z == UnbuildableZ or z ~= original_z then
			return false
		end
	end
	return true
end

g_NCF_FlatInner = HexGetSize()
g_NCF_FlatOuter = 3 * HexGetSize()

function FlattenTerrainInBuildShape(shape_data, obj) --shape_data == nil => { 0, 0 } shape
	CalcBuildableGrid()
	--[[
	-- !!! implement in C, even better - aggregate calls from higher level (cables/pipes call this many times hex by hex)
	local dir = HexAngleToDirection(obj:GetAngle())
	local q, r = WorldToHex(obj:GetPos())
	for _, shape_pt in ipairs(shape_data or {point(0, 0)}) do
		local x, y = HexRotate(shape_pt:x(), shape_pt:y(), dir)
		local z = GetBuildableZ(q+x, r+y)
		if z ~= UnbuildableZ then
			terrain.SetHeightCircle(point(HexToWorld(q+x, r+y)), g_NCF_FlatInner, g_NCF_FlatOuter, z)
		end
	end
	]]
	shape_data = shape_data or empty_table
	local bbox = FlattenTerrainInShape(shape_data, obj, g_BuildableZ, ObjectGrid, g_NCF_FlatInner, g_NCF_FlatOuter, UnbuildableZ)
	if not bbox then
		return
	end
	--DbgAddTerrainRect(bbox)
end

-- max height delta within a hex for it to be even considered for building
g_NCF_FlatThreshold = 2*guim

-- max object surface height to be checked for collision with a hex
g_NCF_MaxSurfaceHeight = 30*guim
g_NCF_MaxSurfaceError = 3*guim
g_NCF_SurfaceTypes = EntitySurfaces.Collision
g_NCF_EnumFlags = const.efCollision
g_NCF_IgnoreGameFlags = const.gofTemporalConstructionBlock

-- areas 10x10 hexes and smaller tolerate height deltas up to 2 m
-- areas 100x100 hexes and larger tolerate height deltas up to 30 guim
-- areas between 10x10 and 100x100 hexes tolerate a height delta somewhere in between (linearly interpolated)

g_NCF_FlatThresholdAreaMin = 5
g_NCF_FlatThresholdAreaMinHeightDelta = 150*guic
g_NCF_FlatThresholdAreaMax = 100
g_NCF_FlatThresholdAreaMaxHeightDelta = 500*guic
g_NCF_MinArea = 50

local HexNeighbours = {
	point(1, 0),
	point(0, 1),
	point(-1, 1),
	point(-1, 0),
	point(0, -1),
	point(1, -1),
}

function RecalcBuildableGrid()
	PauseInfiniteLoopDetection("RecalcBuildableGrid")
	if HexMapWidth == 0 or HexMapHeight == 0 then return false end
	local buildable_hex_z = NewGrid(HexMapWidth, HexMapHeight, 32, UnbuildableZ)
	
	InitBuildableGrid{
		buildable_grid = buildable_hex_z,
		unbuildable_z = UnbuildableZ,
		flat_threshold = g_NCF_FlatThreshold,
		max_surface_height = g_NCF_MaxSurfaceHeight,
		max_surface_error = g_NCF_MaxSurfaceError,
		surface_types = g_NCF_SurfaceTypes,
		enum_flags = g_NCF_EnumFlags,
		ignore_game_flags = g_NCF_IgnoreGameFlags,
		map_border = mapdata.PassBorder,
	}
	local buildable_z = NewGrid(HexMapWidth, HexMapHeight, 32, UnbuildableZ)
	local visited_grid = NewGrid(HexMapWidth, HexMapHeight, 1, 0)
	local minsize = g_NCF_FlatThresholdAreaMin
	local maxsize = g_NCF_FlatThresholdAreaMax
	local A = g_NCF_FlatThresholdAreaMinHeightDelta
	local B = g_NCF_FlatThresholdAreaMaxHeightDelta - g_NCF_FlatThresholdAreaMinHeightDelta
	local C = maxsize - minsize
	local function CalcMaxDelta(hexes)
		local size = Clamp(sqrt(hexes) + 1, minsize, maxsize)
		return A + MulDivRound(size - minsize, B, C)
	end
	local invalidate = hr.TerrainDebugDraw == 1 and DbgLastBuildableColors
	--DbgClear()
	local i = 0
	for x = 0, HexMapWidth - 1 do
		for y = 0, HexMapHeight - 1 do
			local av_z = buildable_hex_z:get(x, y)
			if av_z ~= UnbuildableZ and visited_grid:get(x, y) == 0 then
				i = i + 1
				local q = x - y/2
				local r = y
				-- first pass
				local max, min = av_z, av_z
				local hexes = 1
				local max_delta
				HexGridFloodFill(visited_grid, q, r, const.hgfRestoreVisited, function(nq, nr)
					local z = buildable_hex_z:get(nq+nr/2, nr)
					if z == UnbuildableZ then
						return
					end
					if z < min then
						max_delta = max_delta or CalcMaxDelta(hexes)
						if z < max - max_delta then
							return
						end
						min = z
					elseif z > max then
						max_delta = max_delta or CalcMaxDelta(hexes)
						if z > min + max_delta then
							return
						end
						max = z
					end
					max_delta = false
					av_z = av_z + z
					hexes = hexes + 1
					return true
				end)
				assert(av_z > 0, "Int overflow")
				av_z = av_z / hexes
				-- second pass
				max_delta = max_delta or CalcMaxDelta(hexes)
				local new_hexes = 1
				local visited = HexGridFloodFill(visited_grid, q, r, const.hgfQueryList, function(nq, nr)
					local z = buildable_hex_z:get(nq+nr/2, nr)
					if z == UnbuildableZ or 2 * abs(z - av_z) > max_delta then
						return
					end
					new_hexes = new_hexes + 1
					if new_hexes > hexes then
						max_delta = CalcMaxDelta(new_hexes)
					end
					return true
				end)
				--[[
				DbgAddVector(point(HexToWorld(q, r)), Clamp((visited and #visited) * guim, 10*guim, 300*guim))
				DbgAddText(print_format(i, "z", av_z, "/", visited and #visited, "d", max_delta, visited and #visited > g_NCF_MinArea), point(HexToWorld(q, r)))
				--]]
				assert(visited_grid:get(x, y) ~= 0)
				if visited and #visited > g_NCF_MinArea then
					for i = 1, #visited do
						local q, r = DecodePoint(visited[i])
						buildable_z:set(q+r/2, r, av_z)
					end
				end
			end
		end
	end
	g_BuildableZ = buildable_z
	DbgLastBuildableGrid = false
	if invalidate then
		DbgToggleBuildableGrid()
	end
	ResumeInfiniteLoopDetection("RecalcBuildableGrid")
end

function ConstructionController:DontBuildHere()
	return g_DontBuildHere and g_DontBuildHere:Check(self.cursor_obj:GetPos())
end

function ConstructionController.BlockingUnitsFilter(obj)
	return (IsKindOfClasses(obj, "Drone") and obj:IsDisabled()) or IsKindOf(obj, "RCRover")
end
--
function ConstructionController:HasDepositUnderneath()
	if not IsKindOf(self.template_obj, "TerrainDepositExtractor") then
		local shape =  GetEntityCombinedShape(self.cursor_obj:GetEntity())
		local amount = TerrainDeposit_GetAmount(shape, self.cursor_obj, TerrainDepositGrid, TerrainDepositsInfo.Concrete)
		if amount>0 then 
			return true 
		end
	end
	local force_extend_bb = self.template_obj:HasMember("force_extend_bb_during_placement_checks") and self.template_obj.force_extend_bb_during_placement_checks ~= 0 and self.template_obj.force_extend_bb_during_placement_checks or false
	local excluded_resource = IsKindOf(self.template_obj, "DepositExploiter") and self.template_obj.exploitation_resource or false
	return HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(), nil, nil, true, function(o) return not IsKindOf(o, "SubsurfaceAnomaly") and excluded_resource ~= o.resource end, "Deposit", force_extend_bb)
end

ConstructionController.BlockingUnitClasses = {"Unit"}

--combine this with the above test for perf?
function ConstructionController:AreThereBlockingUnitsUnderneath(shape_data, pos, angle)
	if self.resource then return false end
	local force_extend_bb = self.template_obj:HasMember("force_extend_bb_during_placement_checks") and self.template_obj.force_extend_bb_during_placement_checks ~= 0 and self.template_obj.force_extend_bb_during_placement_checks or false
	return HexGetUnits(self.cursor_obj, self.template_obj:GetEntity(),
							pos or self.cursor_obj:GetVisualPos(), angle or self.cursor_obj:GetAngle(),
							true, ConstructionController.BlockingUnitsFilter, ConstructionController.BlockingUnitClasses, force_extend_bb)
end

function ConstructionController:UpdateConstructionStatuses(dont_finalize)
	local old_t = self.construction_statuses
	self.construction_statuses = {}
	
	local ctarget = g_Tutorial and g_Tutorial.ConstructionTarget
	if ctarget then
		if ctarget.class and self.template ~= ctarget.class then
			self.construction_statuses[1] = ConstructionStatus.WrongBuilding
			return
		end
		if ctarget.loc then
			local dist = ctarget.radius or 3
			if ctarget.strict then
				local spot = ctarget.spot and self.cursor_obj:GetSpotBeginIndex(ctarget.spot) or -1
				local pt = self.cursor_obj:GetSpotLoc(spot)
				if HexAxialDistance(ctarget.loc, pt) > ctarget.radius then
					self.construction_statuses[1] = ConstructionStatus.TooFarFromTarget
					return
				end
			else
				if not IsBuildingInRange(self.cursor_obj, ctarget.loc, dist) then
					self.construction_statuses[1] = ConstructionStatus.TooFarFromTarget
					return
				end
			end
		end
		if ctarget.hex then
			local spot = ctarget.spot and self.cursor_obj:GetSpotBeginIndex(ctarget.spot) or -1
			local pt = self.cursor_obj:GetSpotLoc(spot)
			if HexAxialDistance(ctarget.hex, pt) > 0 then
				self.construction_statuses[1] = ConstructionStatus.TooFarFromTarget
				return
			end
		end
	end
	
	if self:DontBuildHere() then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.DontBuildHere
	end
	
	if self:IsObstructed() or self:AreThereBlockingUnitsUnderneath() then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.BlockingObjects
	end
	
	if  self.template_obj.dome_spot == "Spire" and self.spireless_dome then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.NoPlaceForSpire
	end
	
	local interior = GetEntityInteriorShape(self.template_obj:GetEntity())
	if not self.template_obj:IsKindOf("OrbitalProbe") and (not self:IsTerrainFlatForPlacement() or (next(interior) and not self:IsTerrainFlatForPlacement(interior))) then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.UnevenTerrain
		ShowNearbyHexGrid(false)
	end
	
	if self:HasDepositUnderneath() then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.OnTopOfResourceSign
	end
	
	--check if the building is poking through the dome cupola
	local dome = IsObjInDome(self.cursor_obj)
	if dome then
		local sticks_outside_cupola
		local esCollision = EntitySurfaces.Collision
		local start_id, end_id = self.cursor_obj:GetAllSpots(self.cursor_obj:GetState())
		for i = start_id, end_id do
			--each building should have a bunch of "Heightlimit" spots on its roof
			local spot_name = self.cursor_obj:GetSpotName(i)
			if spot_name == "Heightlimit" then
				local height_limit_pos = self.cursor_obj:GetSpotPos(i)
				local high_point = height_limit_pos:AddZ(10000*guim) --should be high engouh for any case
				local cupola_attach = dome.cupola_attach
				for j=1,#cupola_attach do
					--if rays straight up from these spots don't intersect the dome's glass
					--that means the spot is outside the dome, poking through it, which shouldn't happen
					if not IntersectRayWithObject(height_limit_pos, high_point, cupola_attach[j], esCollision) then
						self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.DomeCeilingTooLow
						sticks_outside_cupola = true
						break
					end
				end
			end
			
			if sticks_outside_cupola then break end
		end
	end
	
	local filter = function(center, obj)
							return (IsKindOf(center, "DroneHub") or center.working) and HexAxialDistance(center, obj) <= center.work_radius 
					  end
	if not self.template_obj:IsKindOf("RocketLandingSite") and ((dome and #dome.command_centers <= 0) or (not dome and MapCount(self.cursor_obj, "hex",const.CommandCenterMaxRadius, "DroneControl", filter, self.cursor_obj  ) <=0)) then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.NoDroneHub
	end
	
	if self.template_obj:IsKindOf("MoistureVaporator") then
		if MapCount(self.cursor_obj, "hex", const.MoistureVaporatorRange, "MoistureVaporator"  ) > 0 then
			local status = table.copy(ConstructionStatus.VaporatorInRange)
			status.text = T{status.text, {number = MulDivRound(self.template_obj.water_production, const.MoistureVaporatorPenaltyPercent, 100)}}
			self.construction_statuses[#self.construction_statuses + 1] = status
		end
	end
	
	if self.template_obj:IsKindOf("RocketLandingSite") then
		if g_DustStorm and (not self.rocket or self.rocket.affected_by_dust_storm) then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RocketLandingDustStorm
		end
		local constr_dlg = GetInGameInterfaceModeDlg()
		if constr_dlg and constr_dlg.class == "ConstructionModeDialog" and constr_dlg.params and constr_dlg.params.passengers then	
			local domes = GetDomesInWalkableDistance(UICity, self.cursor_obj:GetPos())
			if #domes == 0 then
				self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.NoNearbyDome
			end
		end
	end
	
	local sector = GetMapSector(self.cursor_obj)
	if sector.status == "unexplored" then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.UnexploredSector
	end
	
	local dome_required = self.is_template and self.template_obj.dome_required or self.dome_required
	local dome_forbidden = self.is_template and self.template_obj.dome_forbidden or self.dome_forbidden
	
	if self.dome_with_obstructed_roads and not dome_forbidden and (not self.template_obj or self.template_obj.dome_spot == "none") then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.NonBuildableInterior
	end
	
	if dome_required or dome_forbidden then
		if dome_required and not dome then --dome.
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.DomeRequired
		elseif dome_forbidden and dome then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.DomeProhibited
		end
	end
	
	if self.is_template then
		-- make the template object look like a valid object
		local cobj = rawget(self.cursor_obj, true)
		local tobj = setmetatable({[true] = cobj, city = UICity, parent_dome = dome}, {__index = self.template_obj})
		tobj:GatherConstructionStatuses(self.construction_statuses)
	end
	
	if not dont_finalize then
		self:FinalizeStatusGathering(old_t)
	else
		return old_t
	end
end

function ConstructionController:FinalizeStatusGathering(old_t)
	SortConstructionStatuses(self.construction_statuses)
	if not table.iequals(old_t, self.construction_statuses) then
		self:PickCursorObjColor()
		ObjModified(self)
	else
		self:SetColorToAllConstructionObstructors(g_PlacementStateToColor.Obstructing)
	end
end

function ConstructionController:GetShortConstructionStatusPos(obj)
	local obj = obj or self.cursor_obj
	local spot = obj:GetSpotBeginIndex("Center")
	local pos = obj:GetSpotPos(spot) 
	local radius = Min(20*guim,obj:GetRadius())
	local camera_pos = camera.GetPos()
	local len = pos:Dist2D(camera_pos)
	pos = pos +  MulDivRound((camera_pos-pos),radius, len)
	local ok, pt  = GameToScreen(pos:SetZ(terrain.GetHeight(pos)))
	return pt
end

function ConstructionController:UpdateShortConstructionStatus()
	local dlg = GetHUD()
	if not dlg then return end
	local ctrl = dlg.idtxtConstructionStatus
	local text = ""
	if #self.construction_statuses > 0 then
		for i = 1, #self.construction_statuses do
			local st = self.construction_statuses[i]
			if st.short then
				text = T{878, "<col><short></color>", col = ConstructionStatusColors[st.type].color_tag_short, st}
				break
			end
		end
	end
	ctrl:SetText(text)
	ctrl:SetVisible(text~="") 
	ctrl:SetMargins(box(-ctrl.text_width/2,30,0,0))
	return text, ctrl
end

function ConstructionController:GetConstructionState()
	if self.construction_statuses[1] then
		return self.construction_statuses[1].type
	else
		return "clear"
	end
end

function ConstructionController:PickCursorObjColor()
	local clr
	local s = self:GetConstructionState()
	if s == "error" then
		self:SetColorToAllConstructionObstructors(g_PlacementStateToColor.Obstructing)
		clr = g_PlacementStateToColor.Blocked
	else
		self:ClearColorFromAllConstructionObstructors()
		clr = s == "problem" and g_PlacementStateToColor.Problematic or g_PlacementStateToColor.Placeable
		self.construction_obstructors = false
	end
	self.cursor_obj:SetColorModifier(IsEditorActive() and const.clrNoModifier or clr) 
end

function ConstructionController:ChangeAlternativeEntity(dir)
	if not self:HasVariants() then return end
	self:ChangeCursorObj(dir)
end

function ConstructionController:ChangeTemplateVariant(dir)
	local pos = self.cursor_obj:GetPos()
	local angle = self.cursor_obj:GetAngle()
	
	local idx = table.find(self.template_variants,self.template)
	idx = idx + dir
	if idx<1 then idx = #self.template_variants end
	if idx>#self.template_variants then idx = 1 end
	local template = self.template_variants[idx]
	self:Deactivate()
	self:Activate(template)

	self.cursor_obj:SetAngle(angle)
	self.cursor_obj:SetPos(pos)
	self:PickCursorObjColor()
	self:UpdateCursor(pos,"force")
end

function AdjustBuildPos(pos)
	if not GetDomeAtPoint(pos) then
		local x, y, z = pos:xyz()
		local build_z = g_BuildableZ and GetBuildableZ(WorldToHex(pos)) or UnbuildableZ
		if build_z ~= UnbuildableZ then
			return pos:SetZ(build_z)
		end
	end
	return pos
end

--use external_template_name for calls outside of normal construction process
function ConstructionController:Place(external_template_name, pos, angle, param_t, force_instant_build, from_ui)
	local is_external = not not external_template_name
	local in_editor = IsEditorActive()
	
	if g_Tutorial then
		if table.find(self.construction_statuses or empty_table, ConstructionStatus.NoDroneHub) then
			ShowPopupNotification("Tutorial1_Popup7_DroneRange", false, false, GetInGameInterface())
			return
		end
	end
	
	if not is_external then
		if not self.cursor_obj then return end
		if self:IsObstructed() then return end
		if not in_editor and self.construction_statuses and self.construction_statuses[1] and self.construction_statuses[1].type=="error" then return end
	end
	
	assert(UICity.cascade_cable_deletion_enabled == false, "Building placement should not del cables in bulk!")

	SuspendPassEdits("ConstructionController.Place")
	SuspendTerrainInvalidations("ConstructionController.Place")

	local template_name = external_template_name or self.template
	local template_obj = not is_external and self.template_obj or ClassTemplates.Building[template_name]
	local cursor_obj = not is_external and self.cursor_obj or self:CreateCursorObj(nil, template_obj)
	if pos and angle then
		cursor_obj:SetPos(FixConstructPos(pos))
		cursor_obj:SetAngle(angle)
	end
	
	local dome = IsObjInDome(cursor_obj)

	--clear cables (Units don't clear cables)
	if not IsKindOf(template_obj, "Unit") then
		for _, cable in ipairs(HexGridShapeGetObjectList(ObjectGrid, cursor_obj, template_obj:GetShapePoints(), "ElectricityGridElement")) do
			DoneObject(cable)
		end
		local interior = GetEntityInteriorShape(template_obj:GetEntity())
		if interior and next(interior) then
			for _, cable in ipairs(HexGridShapeGetObjectList(ObjectGrid, cursor_obj, interior, "ElectricityGridElement")) do
				DoneObject(cable)
			end
		end
	end
	
	--gather WasteRock rocks
	local force_extend_bb = template_obj:HasMember("force_extend_bb_during_placement_checks") and template_obj.force_extend_bb_during_placement_checks ~= 0 and template_obj.force_extend_bb_during_placement_checks or false
	local rocks = HexGetUnits(cursor_obj, template_obj:GetEntity(), nil, nil, nil, nil, "WasteRockObstructor", force_extend_bb)
	local stockpiles = HexGetUnits(cursor_obj, template_obj:GetEntity(), nil, nil, nil, function(obj) return obj:GetParent() == nil and IsKindOf(obj, "DoesNotObstructConstruction") and not IsKindOf(obj, "Unit") end, "ResourceStockpileBase", force_extend_bb)
	
	-- ApplyToGrids is done in GridObject:GameInit()
	-- here it is applied speculativelty to mark the spot so no other buildings can occupy it before GameInit is called (from a thread)
	-- in addition, early application helps detection of objects to delete in RemoveUnderConstruction
	
	local bld
	local blck_pass = true
	local prefab_exit_mode = false
	if is_external or self.is_template then
		local orig_terrain1, orig_terrain2
		if not terrain.HasRestoreType() and template_obj then
			local all_tiles, terrain1, tiles1, terrain2, tiles2 = TerrainDeposit_CountTiles(template_obj:GetBuildShape(), cursor_obj)
			orig_terrain1 = terrain1
			orig_terrain2 = terrain2
		end
		if force_instant_build or in_editor or (#stockpiles == 0 and #rocks == 0 and template_obj and template_obj.instant_build) then
			for i = 1, #(rocks or empty_table) do
				DoneObject(rocks[i])
			end

			for i = 1, #(stockpiles or empty_table) do
				DoneObject(stockpiles[i])
			end
			
			if not dome then
				FlattenTerrainInBuildShape(template_obj:GetFlattenShape(), cursor_obj)
			end

			local instance = param_t or {}
			instance.city = UICity
			instance.orig_terrain1 = orig_terrain1
			instance.orig_terrain2 = orig_terrain2
			
			bld = PlaceBuilding(template_name, instance, {alternative_entity = cursor_obj:GetEntity()})
			bld:SetAngle(cursor_obj:GetAngle())
			bld:SetPos(AdjustBuildPos(cursor_obj:GetPos()))
			if dome then
				DeleteUnattachedRoads(bld, dome)
				UpdateCoveredGrass(bld, dome, "build")
			end
			bld:ApplyToGrids()
			RemoveUnderConstruction(bld)
			Msg("ConstructionComplete", bld) --@@@msg ConstructionComplete, building - fired when the construction of a building is complete
		else
			local instance = is_external and param_t or {supplied = self.supplied, prefab = self.prefab, alternative_entity = cursor_obj:GetEntity()}
			instance.orig_terrain1 = orig_terrain1
			instance.orig_terrain2 = orig_terrain2
			blck_pass = #rocks == 0 and #stockpiles == 0
			if self.dome_skin and self.dome_skin.construction_entity then
				--dome skins, force correct entity and propagate skin to ConstructionSite
				instance.dome_skin = self.dome_skin
			end
			-- PlaceConstructionSite calls ApplyToGrids internally
			bld = PlaceConstructionSite(UICity, template_name, cursor_obj:GetPos(), cursor_obj:GetAngle(), instance, not blck_pass, not not dome)
			bld:AppendWasteRockObstructors(rocks)
			bld:AppendStockpilesUnderneath(stockpiles)
			bld:ClearHierarchyGameFlags(const.gofNightLightsEnabled)
			
			if self.prefab and UICity:GetPrefabs(template_name) <= 1 then
				prefab_exit_mode = true
			end
		end
	else
		print("unexpected construction placement type")
	end

	if bld then
		bld:SetDome(dome)
		local bld_obj = GetBuildingObj(bld)
		if bld and bld.show_range_all then
			if bld:IsKindOf("ConstructionSite") then
				PlayFX("Select", "start", bld, bld_obj.class)
			else
				PlayFX("Select", "start", bld)
			end
		end
		
		if not IsKindOf(bld, "RocketLandingSite") then
			HintDisable("HintBuildingConstruction")
		end
		
		if in_editor then 
			bld:SetGameFlags(const.gofPermanent)
		end
		
		blck_pass = bld:HasMember("IsBlockerClearenceComplete") and bld:IsBlockerClearenceComplete() or blck_pass
		bld:SetCollision(blck_pass)
		bld:SetBlockPass(blck_pass)

		-- Send over the RCRover to build this construction
		if BuildingWithRCRover then
			CreateGameTimeThread(function(bld)
				BuildingWithRCRover:Construct(bld)
				BuildingWithRCRover = false
			end, bld)
		end
		if from_ui and self.ui_callback then
			self.ui_callback(bld)
		end
	end

	if self.cursor_obj and self.template_obj then
		self:UpdateConstructionObstructors()
		self:UpdateConstructionStatuses()
		self:UpdateShortConstructionStatus()
	end

	ResumePassEdits("ConstructionController.Place")
	ResumeTerrainInvalidations("ConstructionController.Place")

	if not is_external then
		if self.amount and self.amount<=0 or prefab_exit_mode then
			CloseModeDialog()
			return true
		end
	else
		DoneObject(cursor_obj)
	end

	return is_external and bld or true
end

function ConstructionController:Rotate(delta)
	if self.cursor_obj and (not self.is_template or self.template_obj.can_rotate_during_placement) then
		PlayFX("RotateConstruction", "start", self.cursor_obj)
		self.cursor_obj:SetAngle(self.cursor_obj:GetAngle() + delta*60*60)
		self:UpdateConstructionObstructors()
		self:UpdateConstructionStatuses()
		self:UpdateShortConstructionStatus()
	end
	return "break"
end

function ConstructionController:Getconstruction_statuses_property()
	local items = {}
	if #self.construction_statuses > 0 then --we have statuses, display first 2
		for i = 1, Min(#self.construction_statuses, 2) do
			local st = self.construction_statuses[i]
			items[#items+1] = T{879, "<col><text></color>", col = ConstructionStatusColors[st.type].color_tag, text = st.text}
		end
		if #self.construction_statuses < 2 then
			local constr_dlg = GetInGameInterfaceModeDlg()
			if constr_dlg and constr_dlg.class == "ConstructionModeDialog" and constr_dlg.params and constr_dlg.params.passengers then
				local domes = GetDomesInWalkableDistance(UICity, self.cursor_obj:GetPos())
				items[#items+1] = T{7688, "<green>Domes in walkable distance: <number></color></shadowcolor>", number = #domes}
			end
		end
	else
		local constr_dlg = GetInGameInterfaceModeDlg()
		if constr_dlg and constr_dlg.class == "ConstructionModeDialog" and constr_dlg.params and constr_dlg.params.passengers then
			local domes = GetDomesInWalkableDistance(UICity, self.cursor_obj:GetPos())
			items[#items+1] = T{7688, "<green>Domes in walkable distance: <number></color></shadowcolor>", number = #domes}
		else
			items[#items+1] = T{880, "<color 138 223 47>All Clear!</color>"}
		end
	end
	return table.concat(items, "\n")
end

function ConstructionController:GetDisplayName()
	return self.template_obj:GetDisplayName()
end

function ConstructionController:GetDescription()
	return T{self.template_obj.description, self.template_obj}
end

function ConstructionController:HasConstructionCost()
	return not self.template_obj:IsKindOfClasses("Vehicle", "ResourcePile", "ResourceStockpile", "OrbitalProbe", "RocketLandingSite")
end

function ConstructionController:GetConstructionCost()
	if not self:HasConstructionCost() then
		return ""
	end
	local items = {}
	local mod_o = GetModifierObject(self.template_obj.template_name)
	for _,resource in ipairs(ConstructionResourceList) do
		local amount = UICity:GetConstructionCost(self.template_obj, resource, mod_o)
		if amount > 0 then
			items[#items+1]  = T{901, "<resource_name><right><resource(number,resource)>", resource_name = Resources[resource].display_name, number = amount, resource = resource }
		end
	end
	if #items > 0 then
		return table.concat(items, "<newline><left>")
	else
		return T{902, "Doesn't require construction resources"}
	end
end

function ConstructionController:HasConsumption()
	local obj = self.template_obj
	local props = obj.properties
	for i = 1, #maintenance_props do
		local prop = table.find_value(props, "id", maintenance_props[i][1])
		if prop and obj[prop.id] ~= 0 then
			return true
		end
	end
end

function ConstructionController:GetConsumption()
	local items = {}
	local obj = self.template_obj
	local modifier_obj = GetModifierObject(obj.template_name)
	for i = 1, #maintenance_props do
		local prop = table.find_value(obj.properties, "id", maintenance_props[i][1])
		local disable_prop = table.find_value(obj.properties, "id", "disable_" .. maintenance_props[i][1])
		
		if prop and obj[prop.id] ~= 0 then
			local val = disable_prop and modifier_obj:ModifyValue(obj[disable_prop.id], disable_prop.id) >= 1
							and 0 or modifier_obj:ModifyValue(obj[prop.id], prop.id)
			
			items[#items+1]  = T{901, "<resource_name><right><resource(number,resource)>", resource_name = maintenance_props[i][3], number = val, resource = maintenance_props[i][2] }
		end
	end
	return table.concat(items, "<newline><left>")
end

function ConstructionController:GetElevationBoost()
	local pos = self.cursor_obj:GetPos()
	return GetElevation(pos) * self.template_obj.bonus_per_kilometer_elevation / 1000
end

function ConstructionController:HasVariants()
	return #GetBuildingSkins(self.template) > 1
end

function ConstructionController:HasTemplateVariants()
	return self.template_variants and next(self.template_variants)
end
------------------------------------------Demolish--------------------------------
DefineClass.DemolishModeDialog = {
	__parents = { "InterfaceModeDialog" },
	mode_name = "demolish",
	MouseCursor = "UI/Cursors/Salvage.tga",
	
	last_mouse_hex_pos = false,
	selected_dome = false,
}

function DemolishPropagate(obj)
	PlayFX("DemolishPropagate", "start")
	if obj:IsKindOf("RechargeStation") and obj.hub then
		return obj.hub
	end
	return obj
end

function DemolishModeDialog:Init()
	CreateRealTimeThread(OpenAllDomes)
end

function DemolishModeDialog:Close(...)
	InterfaceModeDialog.Close(self, ...)
	CloseAllDomes()
	if IsValid(self.selected_dome) then 
		self.selected_dome:Close() 
	end
end

function DemolishModeDialog:CanDemolish(pt, obj)
	--Get object under mouse
	local obj = obj or SelectionMouseObj()
	
	--No object or an invalid one - ignore
	if not obj or  not IsValid(obj) then
		return false
	end
	
	--A Drone is a Unit, but can be demolished
	if IsKindOf(obj, "DroneBase") and obj:CanDemolish() then
		return true
	end
	
	--Any Unit (besides Drone) and etc. are ignored - no action for them
	if IsKindOfClasses(obj, "Unit", "SurfaceDeposit", "SubsurfaceDeposit") then
		return false
	end	
	
	obj = DemolishPropagate(obj)
	if IsKindOf(obj, "Building") 	then
		if obj:CanDemolish() then
			return true
		end
	elseif IsKindOf(obj, "SupplyGridObject") then	
		return true
	end
	
	return false
end

function DemolishModeDialog:OnMouseButtonDown(pt, button, obj)
	if button == "L" then
		--Get object under mouse
		local obj = obj or SelectionMouseObj()
		
		--No object or an invalid one - ignore
		if not obj or  not IsValid(obj) then
			return "break"
		end
		
		--A Drone is a Unit, but can be demolished
		if IsKindOf(obj, "DroneBase") then
			if obj:CanDemolish() then
				obj:ToggleDemolish()
			end
		end
		
		--Any Unit (besides Drone) and etc. are ignored - no action for them
		if IsKindOfClasses(obj, "Unit", "SurfaceDeposit", "SubsurfaceDeposit") then
			return "break"
		end	
		
		obj = DemolishPropagate(obj)
		if IsKindOf(obj, "Building") then
			if obj:CanDemolish() then
				SelectObj(obj)
				obj:ToggleDemolish()
			else
				obj:DestroyedClear()
			end
		elseif IsKindOf(obj, "SupplyGridObject") then -- cables and pipes
			obj:Demolish()
		end
		
		return "break"
	elseif button == "R" then
		CloseModeDialog()
		PlayFX("DemolishCancel", "start")
		return "break"
	end
end

function DemolishModeDialog:OnMousePos(pt)
	local mouse_hex_pos_pt = point(WorldToHex(GetTerrainCursor()))
	
	if mouse_hex_pos_pt ~= self.last_mouse_hex_pos then
		self.last_mouse_hex_pos = mouse_hex_pos_pt
		local cursor = self:CanDemolish(mouse_hex_pos_pt) and "UI/Cursors/Salvage.tga" or "UI/Cursors/Salvage_no.tga"
		self:SetMouseCursor(cursor)	
	end
end

function DemolishModeDialog:OnShortcut(shortcut, source)
	if shortcut == "+ButtonA" or shortcut == "+LeftTrigger-ButtonA" then
		local center = self.box:Center()
		local object = SelectionGamepadObj(center)
		if object then
			self:OnMouseButtonDown(center, "L", object)
		end
		return "break"
	elseif shortcut == "+ButtonB" or shortcut == "Escape" then
		return self:OnMouseButtonDown(nil, "R")
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	end
end

----------------------------------------GridConstruction-----------------------------------------------
DefineClass.GridConstructionDialog = {
	__parents = { "InterfaceModeDialog" },
	mode_name = "electricity_grid",
	MouseCursor =  "UI/Cursors/CablePlacement.tga",
	success_sound = "CableConstructionSuccess",
	grid_elements_require_construction = false,
}

function GridConstructionDialog:Init()
	for k,v in pairs(self.context) do
		self[k] = v
	end
	table.change(hr, "Construction", { RenderBuildGrid = 3, BuildGridRadius = 13000 })
	self:SetModal(true)
	HideGamepadCursor("construction")
	ShowResourceIcons("construction")
	
	if GetUIStyleGamepad() then
		self:CreateThread("GamepadCursorUpdate", UpdateConstructionCursorObject, CityGridConstruction[UICity])
	end
end

function GridConstructionDialog:Open(...)
	InterfaceModeDialog.Open(self, ...)
	CityGridConstruction[UICity]:SetMode(self.mode_name)
	
	if self.mode_name == "life_support_grid" then
		CityGridConstruction[UICity]:InitHelpers()
	end
	
	CityGridConstruction[UICity].grid_elements_require_construction = self.grid_elements_require_construction
	CityGridConstruction[UICity].last_update_hex = false
	self:OnMousePos() --initial update
	DelayedCall(0, OpenGridConstructionInfopanel)
end

function GridConstructionDialog:Close(...)
	InterfaceModeDialog.Close(self, ...)
	while not CityGridConstruction[UICity]:Deactivate() do end
	table.restore(hr, "Construction")
	ShowGamepadCursor("construction")
	HideResourceIcons("construction")
	
	if self:IsThreadRunning("GamepadCursorUpdate") then
		self:DeleteThread("GamepadCursorUpdate")
	end
	local dlg = GetHUD()
	if dlg then dlg.idtxtConstructionStatus:SetVisible(false) end	
end

function GridConstructionDialog:TryPlace(pos)
	if CityGridConstruction[UICity]:Activate(HexGetNearestCenter(pos)) then
		PlayFX(self.success_sound, "start")
	else
		PlayFX("ConstructionFail", "start")
	end
end

function GridConstructionDialog:OnMouseButtonDown(pt, button)
	if button == "L" then
		self:TryPlace(GetTerrainCursor())
	elseif button == "R" then
		if CityGridConstruction[UICity]:Deactivate(pt) then
			PlayFX("GridConstructionCancel", "start")
			CloseModeDialog()
			return "break"
		end
	elseif button == "M" then
		self:ToggleBuildDirection()
		return "break"
	end
end

function GridConstructionDialog:OnMousePos(pt)
	local terrain_pos = GetPosHelper("mouse")
	if terrain.IsPointInBounds(terrain_pos) then
		CityGridConstruction[UICity]:UpdateCursor(terrain_pos)
	end
	return "break"
end

function GridConstructionDialog:ToggleBuildDirection()
	if not CityGridConstruction[UICity].starting_point then return end
	CityGridConstruction[UICity].switch_dobule_line_directions = not CityGridConstruction[UICity].switch_dobule_line_directions
	CityGridConstruction[UICity].last_update_hex = false
	self:OnMousePos(GetTerrainCursor())
	CityGridConstruction[UICity]:SetColorToAllConstructionObstructors(g_PlacementStateToColor.Obstructing)
end

function GridConstructionDialog:OnKbdKeyDown(virtual_key)
	if virtual_key == const.vkEsc then
		self:OnMouseButtonDown(nil, "R")
		return "break"
	end
end

function GridConstructionDialog:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" or shortcut == "LeftTrigger-ButtonA" then
		self:TryPlace(GetTerrainGamepadCursor())
		return "break"
	elseif shortcut == "ButtonB" then
		self:OnMouseButtonDown(nil, "R") --cancel
		return "break"
	elseif shortcut == "LeftShoulder" then
		self:ToggleBuildDirection() --switch direction
		return "break"
	elseif shortcut == "RightShoulder" then
		self:ToggleBuildDirection() --switch direction
		return "break"
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	end
end

function GridConstructionDialog:OnMouseWheelForward(...)
	CityGridConstruction[UICity]:UpdateShortConstructionStatus()
	return "continue"
end

function GridConstructionDialog:OnMouseWheelBack(...)
	CityGridConstruction[UICity]:UpdateShortConstructionStatus()
	return "continue"
end
DefineClass.GridConstructionDialogPipes = {
	__parents = { "GridConstructionDialog" },
	mode_name = "life_support_grid",
	MouseCursor = "UI/Cursors/PipePlacement.tga",
	success_sound = "PipeConstructionSuccess",
}

DefineClass.GridConstructionDialogPassage = {
	__parents = { "GridConstructionDialog" },
	mode_name = "passage_grid",
}
---
GlobalVar("CityGridConstruction", {})

DefineClass.GridConstructionController = {
	__parents = { "ConstructionController" },
	
	properties = {
		{id = "construction_statuses_property", editor = "text", name = T{""}, translate = true, default = false},
		{id = "DisplayName",                    editor = "text", name = T{""}, translate = true, default = false},
	},
	
	cursor_obj = false,
	starting_point = false,
	starting_cs_group = false,
	total_cost = false,
	visuals = false,
	water_markers = false,
	mode = "electricity_grid", --"electricity_grid" or "life_support_grid"
	max_hex_distance_to_allow_build = 20,
	max_plugs = 30, --(max_hex_distance_to_allow_build/3)*4 + 2
	grid_elements_require_construction = true,
	switch_dobule_line_directions = false,
	
	current_points = false,
	current_status = const.clrNoModifier,
	construction_statuses = false,
	
	
	construction_obstructors = false,
	
	last_update_hex = false,
	rocks_underneath = false,
	
	skin_name = "Default",
	
	placed_points = false,
	last_placed_points_count = false,
	current_len = 0,
	entrance_hexes = false,
}

function GridConstructionController:SetMode(mode)
	self.mode = mode
	self:UpdateCursorObject(true)
	self.construction_statuses = {}
	self.rocks_underneath = {}
	self.placed_points = {}
	self.last_placed_points_count = {}
	self.current_len = 0
end

function GridConstructionController:UpdateCursorObject(visible)
	if visible and not self.visuals then
		local entity
		local palette
		local skin
		if self.mode == "electricity_grid" then
			entity = "CableHub"
			palette = EntityPalettes.Cables
		elseif self.mode == "life_support_grid" then
			skin = TubeSkins[self.skin_name]
			entity = skin.TubeHub
			palette = EntityPalettes.Pipes
		elseif self.mode == "passage_grid" then
			entity = "PassageEntrance"
		end
		if IsValid(self.cursor_obj) then
			self.cursor_obj:DestroyAttaches()
			self.cursor_obj.entity = entity
			self.cursor_obj:ChangeEntity(entity)
		else
			self.cursor_obj = CursorAutoAttachGridElement:new{ entity = entity }
			self.cursor_obj:SetEnumFlags(const.efVisible)
			local terrain_pos = GetPosHelper()
			if terrain.IsPointInBounds(terrain_pos) then
				self.cursor_obj:SetPos(FixConstructPos(terrain_pos))
			end
		end
		
		AutoAttachObjectsToPlacementCursor(self.cursor_obj)
		
		if palette then
			palette:ApplyToObj(self.cursor_obj)
		end
		self:SetTxtPosObj(self.cursor_obj)
	elseif IsValid(self.cursor_obj) then
		self.cursor_obj:delete()
		self.cursor_obj = false
	end
end

function GridConstructionController:SetTxtPosObj(obj)
	--set text pos
	local dlg = GetHUD()
	if dlg then 
		local ctrl = dlg.idtxtConstructionStatus
		ctrl:AddDynamicPosModifier({id = "construction", target = obj})
	end
end

function GridConstructionController:GetCSGroupAtStartingPoint()
	local group
	if self.mode ~= "passage_grid" then
		MapForEach(self.starting_point, const.HexSize * 2, "ConstructionSite", function (obj, self)
			if (self.mode == "electricity_grid" and obj.building_class ~= "ElectricityGridElement") or
				(self.mode == "life_support_grid" and obj.building_class ~= "LifeSupportGridElement") then
				return
			end
			
			local his_group = obj.construction_group
			
			if (not group and #his_group <= const.ConstructiongGridElementsGroupSize) or 
				(group and his_group ~= group and #his_group < #group) then
				group = his_group
			end
		end, self)
	end
	return group
end

function GridConstructionController:Activate(pt)
	self.construction_obstructors = self.construction_obstructors or {}
	if not self.starting_point then
		-- not currently building
		if self:CanExtendFrom(pt) then
			self.starting_point = pt
			self.starting_cs_group = self:GetCSGroupAtStartingPoint()
			self.placed_points = { pt:SetInvalidZ() }
			self.last_update_hex = false
			self:InitVisuals(pt)
			self:UpdateVisuals(pt)
			return true
		end
	else
		if self.current_status == const.clrNoModifier or self.current_status == g_PlacementStateToColor.Problematic then
			local group
			--check if we can extend an existing group
			if self.mode ~= "passage_grid" then
				self:DoneVisuals()
				group = self:GetCSGroupAtStartingPoint() --reget grp, might be gone by now
				self.starting_cs_group = false
				SuspendPassEdits("construction_supply_grid_line")
				local last_placed_obj
				
				if self.current_points[2] then
					local data, _

					group, _, data = self:ConstructLine(self.starting_point, self.current_points[1], nil, group)
					group, last_placed_obj = self:ConstructLine(self.current_points[1], self.current_points[2], self.current_points[1] == self.current_points[2] and self.current_points[1] or nil, group, data)
				else
					group, last_placed_obj = self:ConstructLine(self.starting_point, self.current_points[1], nil, group)
				end
				ResumePassEdits("construction_supply_grid_line")
				local new_start = IsValid(last_placed_obj) and last_placed_obj:GetPos() or self.current_points[#self.current_points]
				if self:CanExtendFrom(new_start) then
					self.starting_point = new_start
					self.starting_cs_group = self:GetCSGroupAtStartingPoint()
					self:InitVisuals(self.starting_point)
					self:UpdateVisuals(self.starting_point)
					self:UpdateCursorObject(false)
					return true
				else
					self.starting_point = false
					self.starting_cs_group = false
					self.total_cost = false
					self:ClearColorFromAllConstructionObstructors()
					self.construction_obstructors = false
					self:UpdateCursorObject(true)
					return false
				end
			else --passage grid
				if self:CanCompletePassage() then
					self:DoneVisuals()
					--build
					SuspendPassEdits("construction_supply_grid_line")
					local indata, outdata, _
					local pts = table.append(self.placed_points, self.current_points)
					
					for i = 1, #pts - 1 do
						group, _, outdata = self:ConstructLine(pts[i], pts[i + 1], nil, group, indata)						
						indata = indata and table.append(indata, outdata) or outdata
						
						if #indata >= self.max_hex_distance_to_allow_build then
							break
						end
					end
					
					ResumePassEdits("construction_supply_grid_line")
					self.starting_point = false
					self.starting_cs_group = false
					self.total_cost = false
					self.current_points = {}
					self:ClearColorFromAllConstructionObstructors()
					self.construction_obstructors = false
					self:UpdateCursorObject(true)
					Msg("PassageConstructionPlaced", GetDomeAtPoint(pts[1]), GetDomeAtPoint(pts[#pts]))
					return false
				end
			end
		elseif self.mode == "passage_grid" then
			if self:CanContinuePassage() then
				table.append(self.placed_points, self.current_points)
				table.insert(self.last_placed_points_count, #self.current_points)
				self.current_points = {}
			end
			return true
		end
	end
end

function GridConstructionController:CanContinuePassage()
	local all_eq = true
	local c = #self.current_points
	local j = 1
	for i = #self.placed_points - c + 1, #self.placed_points do
		local p = self.placed_points[i]
		if p ~= self.current_points[j] then
			all_eq = false
			break
		end
		j = j + 1
	end
	
	return not all_eq
		and (#self.construction_statuses == 1 or self.construction_statuses[2] == ConstructionStatus.NoDroneHub)
		and self.construction_statuses[1] == ConstructionStatus.PassageRequiresTwoDomes
		and self.current_len < self.max_hex_distance_to_allow_build
end

function GridConstructionController:CanCompletePassage()
	return #self.construction_statuses <= 0 or self:GetConstructionState() == "problem"
end

function GridConstructionController:BuildCableShapePts(dir, len)
	local dq, dr = HexNeighbours[dir + 1]:xy()
	local q, r = 0, 0
	
	local shape_arr = {} --cache?
	
	for i = 0, len do
		table.insert(shape_arr, point(q + dq * i, r + dr * i))
	end
	
	return shape_arr
end

function GetEntranceHex(hexes, q, r)
	return (hexes or empty_table)[q * (2^16) + r]
end

function SetEntranceHex(hexes, q, r, obj)
	(hexes or empty_table)[q * (2^16) + r] = obj
end

function GridConstructionController:CanExtendFrom(q, r) --pt should be clamped to hex center
	local pt
	if not r then
		pt = q
		q, r = WorldToHex(q)
	else
		pt = point(HexToWorld(q, r))
	end
	if self.mode == "electricity_grid" then	
		return CableBuildableTest(pt, q, r) and not HexGetUnits(nil, nil, pt, 0, true, nil, "SurfaceDeposit") and HexGetBuilding(q, r) ~= g_DontBuildHere and not GetDomeAtHex(q, r)
	elseif self.mode == "life_support_grid" then
		return ConstructionController.IsTerrainFlatForPlacement(nil, {point20}, pt, 0) and not HexGetUnits(nil, nil, pt, 0, true, nil, "SurfaceDeposit") and HexGetBuilding(q, r) ~= g_DontBuildHere and not GetDomeAtHex(q, r)
	elseif self.mode == "passage_grid" then
		if HexGetBuildingNoDome(q, r) ~= nil then
			return false, "obstruced"
		end
		if GetEntranceHex(self.entrance_hexes, q, r) then
			return false, "block_entrance"
		end
		if GetDomeAtHex(q, r) == nil then
			return false, "requires_dome"
		end
		--TODO: blocking units
		return TestDomeBuildabilityForPassage(q, r, "check_edge", "check_road")
	end
end

function GridConstructionController:CanConstructLine(pt1, pt2, len, in_data)
	local q1, r1 = WorldToHex(pt1)
	local q2, r2 = WorldToHex(pt2)
	local dir = HexGetDirection(q1, r1, q2, r2)
	if q1 == q2 and r1 == r2 then
		dir = 0
		len = 0
	end
	if not dir then
		return
	end
	local func = self.mode == "electricity_grid" and PlaceCableLine or self.mode == "life_support_grid" and PlacePipeLine or PlacePassageLine
	local can_constr, constr_grp, obstructors, data, unbuildable_chunks, rocks, total_cost = func(UICity, q1, r1, dir, len, "test", nil, self.starting_cs_group, in_data, self.skin_name, self.entrance_hexes)
	self.total_cost = total_cost
	if self.mode == "passage_grid" then
		--move return values
		rocks = unbuildable_chunks
		unbuildable_chunks = nil
	end
	return can_constr, constr_grp, obstructors, data, unbuildable_chunks, len, rocks
end

DefineClass.CursorGridElement = {
	__parents = { "Shapeshifter" },
	class_flags = { cfNoHeightSurfs = true },
	enum_flags = { efCollision = false, efApplyToGrids = false, efWalkable = false, efRoad = false, efVisible = false, },
}

function CursorGridElement:Init()
	self:ChangeEntity(self.entity)
end

DefineClass.CursorAutoAttachGridElement = {
	__parents = {"CursorGridElement", "AutoAttachObject"},
	auto_attach_at_init = false,
}

function GridConstructionController:InitVisuals(pt)
	self:UpdateCursorObject(false)
	local start_visible = false
	local hub_entity, connection_entity, joint_entity, link_entity, chain_entity, pillar_entity
	local plug_angle_correction
	local skin = TubeSkins[self.skin_name]
	local pipe_non_hub_pillar = skin.TubePillar
	local tube_joint_seam = skin.TubeJointSeam
	local game_flags = 0
	local palette
	local entrance_hexes
	if self.mode == "electricity_grid" then
		hub_entity = "CableHub"
		connection_entity = "CableHubPlug"
		joint_entity = ""
		link_entity = "CableStraight"
		chain_entity = "CableHanging"
		pillar_entity = "CableTower"
		plug_angle_correction = 0
		game_flags = const.gofTerrainDistortedMesh
		palette = EntityPalettes.Cables
	elseif self.mode == "life_support_grid" then
		hub_entity = skin.TubeHub
		connection_entity = skin.TubeHubPlug
		joint_entity = skin.TubeJoint
		link_entity = skin.Tube
		chain_entity = skin.Tube
		pillar_entity = skin.TubeHub
		plug_angle_correction = 180*60
		palette = EntityPalettes.Pipes
	elseif self.mode == "passage_grid" then
		hub_entity = "PassageEntrance"
		link_entity = "PassageCovered"
		entrance_hexes = {}
		local max_distance = self.max_hex_distance_to_allow_build * 10 * guim
		MapForEach(pt, max_distance + GetEntityMaxSurfacesRadius(), "Dome", 
			function(dome)
				if dome:IsCloser2D(pt, max_distance + dome:GetRadius()) then
					for _, obj in ipairs(dome:GetEntrances() or empty_table) do
						local chains = obj.waypoint_chains or empty_table
						for _, chain in ipairs(chains.entrance or empty_table) do
							if chain.name == "Doorentrance1" or chain.name == "Doorexit2" then
								local q, r = WorldToHex(chain[5])
								SetEntranceHex(entrance_hexes, q, r, dome)
							end
						end
					end
				end
			end)
	end
	self.entrance_hexes = entrance_hexes
	self.visuals = self.visuals or {chain_entity = chain_entity, link_entity = link_entity, connection_entity = connection_entity, pillar_entity = pillar_entity, hub_entity = hub_entity, plug_angle_correction = plug_angle_correction, pipe_non_hub_pillar = pipe_non_hub_pillar, tube_joint_seam = tube_joint_seam}
	self.visuals.elements = {}
	for j = 1, self.max_hex_distance_to_allow_build do
		local e = self.mode == "passage_grid" and CursorAutoAttachGridElement:new{ entity = link_entity } or CursorGridElement:new { entity = link_entity }
		e:SetGameFlags(game_flags)
		if palette then
			palette:ApplyToObj(e)
		end
		self.visuals.elements[j] = e
	end
	if self.mode ~= "passage_grid" then
		self.visuals.plugs = {}
		self.visuals.joints = {}
		for j = 1, self.max_plugs do
			local p = CursorGridElement:new { entity = connection_entity }
			p:SetGameFlags(game_flags)
			palette:ApplyToObj(p)
			self.visuals.plugs[j] = p
			local joint = joint_entity ~= "" and CursorGridElement:new { entity = joint_entity } or nil
			if joint then
				palette:ApplyToObj(joint)
			end
			self.visuals.joints[j] = joint
		end
	end
	if self.mode == "life_support_grid" then
		self:InitHelpers()
	end
end

function GridConstructionController:InitHelpers()
	if not self.water_markers then
		self.water_markers = {}
		local buildings  = UICity.labels.Building
		for i = 1, #(buildings or "") do
			local obj = buildings[i]
			if (IsKindOf(obj, "LifeSupportGridObject") or (IsKindOf(obj, "ConstructionSite") and IsKindOf(obj.building_class_proto, "LifeSupportGridObject"))) then
				SetWaterMarkers(obj, true, self.water_markers)
			end
		end
	end
end

function GridConstructionController:DoneHelpers()
	if not self.water_markers then
		return
	end
	local markers = self.water_markers
	for i = 1, #markers do
		if IsValid(markers[i]) then --building could be demolished while constructing and its attaches should already be dead.
			DoneObject(markers[i])
		end
	end
	self.water_markers = false
end

function GridConstructionController:GetDoubleLineData(pt, sp)
	local start_q, start_r = WorldToHex(sp or self.starting_point)
	local pt_q, pt_r = WorldToHex(pt)
	local diff_q, diff_r = pt_q - start_q, pt_r - start_r
	local abs_diff_q, abs_diff_r = abs(diff_q), abs(diff_r)
	local total_dist = HexAxialDistance(start_q, start_r, pt_q, pt_r)
	
	local is_double_dir = (abs_diff_q + abs_diff_r) > total_dist
	local d2_dist = abs_diff_q < abs_diff_r and (not is_double_dir and abs_diff_q or MulDivRound(abs_diff_q, total_dist, abs_diff_r)) or
																			(not is_double_dir and abs_diff_r or MulDivRound(abs_diff_r, total_dist, abs_diff_q))

	local d1_dist = total_dist - d2_dist
	local d1, d2
	
	if is_double_dir then
		if abs_diff_q == total_dist then
			d1 = point(diff_q/abs_diff_q, 0)
		else
			d1 = point(0, diff_r/abs_diff_r)
		end
		
		d2 = point(diff_q == 0 and 0 or diff_q/abs_diff_q, diff_r == 0 and 0 or diff_r/abs_diff_r)
	else
		if abs_diff_q == d1_dist then
			d1 = point(diff_q/abs_diff_q, 0)
			d2 = point(0, diff_r/abs_diff_r)
		else
			d2 = point(diff_q/abs_diff_q, 0)
			d1 = point(0, diff_r/abs_diff_r)
		end
	end
	
	if not self.switch_dobule_line_directions then
		return d1, d1_dist, d2, d2_dist
	else
		return d2, d2_dist, d1, d1_dist
	end
end

function GridConstructionController:GetDoubleLinePoints(pt, sp)
	local d1, d1_dist, d2, d2_dist = self:GetDoubleLineData(pt, sp)
	return { point(HexToWorld((point(WorldToHex(sp or self.starting_point)) + d1 * d1_dist):xy())),
				pt }
end

function table.append_unique(t1, t2)
	for i = 1, #t2 do
		table.insert_unique(t1, t2[i])
	end
end

function GridConstructionController:UpdateVisuals(pt)
	local hex_pos = point(WorldToHex(pt))
	if self.last_update_hex and hex_pos == self.last_update_hex then
		return
	end
	self.last_update_hex = hex_pos
	ObjModified(self)
	local old_t = self.construction_statuses 
	self.construction_statuses = {}
	
	if not self.starting_point then
		local result, reason = self:CanExtendFrom(pt)
		if not result then
			if self.mode ~= "passage_grid" then
				local d = GetDomeAtHex(pt)
				if d then
					table.insert(self.construction_statuses, ConstructionStatus.DomeProhibited)
				else
					table.insert(self.construction_statuses, ConstructionStatus.UnevenTerrain)
				end
			else
				--we have reason in this mode
				if reason == "requires_dome" then
					table.insert(self.construction_statuses, ConstructionStatus.DomeRequired)
				elseif reason == "block_entrance" then
					table.insert(self.construction_statuses, ConstructionStatus.PassageTooCloseToEntrance)
				elseif reason == "block_life_support" then
					table.insert(self.construction_statuses, ConstructionStatus.PassageTooCloseToLifeSupport)
				else
					table.insert(self.construction_statuses, ConstructionStatus.BlockingObjects)
				end
				
				if self.cursor_obj then
					if not self.template_obj then
						--init
						self.template_obj = ClassTemplates.Building.Passage
						self.is_template = true
						self.template_obj_points = FallbackOutline
					end
					self:UpdateConstructionObstructors(self)
					self:SetColorToAllConstructionObstructors(g_PlacementStateToColor.Obstructing)
				end
			end
			if self.cursor_obj then
				self.cursor_obj:SetColorModifier(g_PlacementStateToColor.Blocked)
			end
		elseif self.cursor_obj then
			if not DoesAnyDroneControlServiceAtPoint(pt) then
				table.insert_unique(self.construction_statuses, ConstructionStatus.NoDroneHub)
				self.cursor_obj:SetColorModifier(g_PlacementStateToColor.Problematic)
			else
				self.cursor_obj:SetColorModifier(const.clrNoModifier)
			end
			if self.mode == "passage_grid" then
				self:ClearColorFromAllConstructionObstructors()
				self:ClearDomeWithObstructedRoads()
			end
		end
		if not table.iequals(old_t, self.construction_statuses) then
			ObjModified(self)
		end
		self:UpdateShortConstructionStatus()
		return
	end
	
	local is_electricity_grid = self.mode == "electricity_grid"
	local is_ls_grid = self.mode == "life_support_grid"
	local is_passage_grid = self.mode == "passage_grid"
	local pt_arr = is_passage_grid and self.placed_points or nil
	local sp = pt_arr and pt_arr[#pt_arr] or self.starting_point
	pt = pt:SetInvalidZ()
	local points = {HexClampToAxis(sp, pt)}
	local number_of_lines = points[1] == pt and 1 or 2
	if number_of_lines > 1 then
		points = self:GetDoubleLinePoints(pt, sp)
	end
	local points_prestine = points
	if pt_arr then
		points = table.append(table.copy(pt_arr), points)
	end
	
	local total_len = 0
	local prev_point = is_passage_grid and points[1] or sp
	local start_idx = is_passage_grid and 2 or 1
	local last_angle = -1
	local start_dome = false
	local steps_arr = {}
	local clr = const.clrNoModifier
	local all_obstructors = {}
	local all_data = {}
	local all_chunks = {}
	local all_rocks = {}
	local can_constr_final = is_passage_grid or false
	local data_merge_idx = false
	for i = start_idx, #points do
		local next_point = points[i]
		next_point = next_point and next_point:SetZ(terrain.GetHeight(next_point)) or false
		if not next_point or next_point:Equal2D(prev_point) and i > start_idx then
			prev_point = next_point
		else
			local len = prev_point:Dist2D(next_point)
			local steps = (len + const.GridSpacing/2) / const.GridSpacing
			local max_steps = (self.max_hex_distance_to_allow_build - 1) - (steps_arr[i - 1] or 0)
			local end_pos = next_point
			local fbreak = false
			
			if is_passage_grid then
				if not end_pos:Equal2D(prev_point) then
					local a = CalcOrientation(prev_point, end_pos)
					
					local na = abs(AngleDiff(a, last_angle))
					if last_angle >= 0 and na > 60*60 then
						if #all_data < self.max_hex_distance_to_allow_build then
							table.insert(self.construction_statuses, ConstructionStatus.PassageAngleToSteep)
						end
						fbreak = true
					end
					last_angle = a
				end
			end
			
			if max_steps <= 0 or fbreak then
				--our step allowance was hit last 
				points[i] = nil
				steps_arr[i] = nil
				break
			elseif steps > max_steps then
				end_pos  = prev_point + MulDivRound(next_point - prev_point, max_steps, steps)
				steps = max_steps
			end
			points[i] = end_pos
			steps_arr[i] = steps
			
			local can_constr, constr_grp, obstructors, data, unbuildable_chunks, axial_dist, rocks = self:CanConstructLine(prev_point, end_pos, steps, all_data)
			all_rocks[i] = rocks
			if obstructors then
				table.append_unique(all_obstructors, obstructors)
			end
			
			if i > start_idx and #data > 0 then
				--the 2 lines we test share a hex at the the turn, so get rid of the duplicate data node
				data[0].is_turn = true
				data_merge_idx = #all_data
				local node_to_rem = all_data[data_merge_idx]
				data[0].chunk = (data[0].chunk or node_to_rem.chunk)
				data[0].chunk_start = (data[0].chunk_start or node_to_rem.chunk_start)
				data[0].chunk_end = (data[0].chunk_end or node_to_rem.chunk_end)
				table.remove(all_data)
			end
			
			table.insert(all_data, data[0])
			table.append(all_data, data)
			
			for k, v in pairs(data) do
				if type(k) == "string" then
					all_data[k] = v
				end
			end
			
			table.append(all_chunks, unbuildable_chunks)
			total_len = total_len + (axial_dist or 0)
			if is_passage_grid then
				can_constr_final = can_constr_final and can_constr
			else
				can_constr_final = can_constr_final or can_constr
			end
			
			prev_point = next_point
			
			if is_passage_grid and not start_dome and #all_data > 0 then
				start_dome = all_data[1].dome
			end
			
			if i == 1 and
				(self.mode == "electricity_grid" and not const.SupplyGridElementsAllowUnbuildableChunksCables or
				self.mode ~= "electricity_grid" and not const.SupplyGridElementsAllowUnbuildableChunksPipes) and 
				data[#data].status == SupplyGridElementHexStatus.unbuildable_blocked then
				points[2] = nil
				break
			end
		end
	end
	
	--buildability tests
	local data_count = #all_data
	local last_idx = Min(data_count, self.max_hex_distance_to_allow_build)
	if not can_constr_final then
		if not is_passage_grid then
			table.insert(self.construction_statuses, ConstructionStatus.UnevenTerrain)
		end
		clr = g_PlacementStateToColor.Blocked
	end
	
	if is_passage_grid and all_data[data_count].dome == start_dome then
		table.insert(self.construction_statuses, ConstructionStatus.PassageRequiresDifferentDomes)
		clr = g_PlacementStateToColor.Blocked
	end
	
	if clr == const.clrNoModifier then
		local obstructor_count = #all_obstructors
		
		--1 building on each side is allowed
		if obstructor_count > 2 
			or (obstructor_count == 2 and (all_data[1].status == SupplyGridElementHexStatus.clear or all_data[data_count].status == SupplyGridElementHexStatus.clear))
			or (obstructor_count == 1 
				and (all_data[1].status == SupplyGridElementHexStatus.clear and all_data[data_count].status == SupplyGridElementHexStatus.clear) or 
					all_obstructors[1] == g_DontBuildHere) then
			clr = g_PlacementStateToColor.Blocked
		end
	end
	
	if clr == const.clrNoModifier and not is_passage_grid then
		--any blocked unbuildable buildable chunk also blocks
		local last_chunk = false
		for idx, chunk_data in ipairs(all_chunks) do
			if chunk_data.status == SupplyGridElementHexStatus.blocked then
				clr = g_PlacementStateToColor.Blocked
				table.insert_unique(self.construction_statuses, ConstructionStatus.UnevenTerrain)
				break
			elseif last_chunk and is_electricity_grid then
				local my_start = chunk_data.chunk_start
				local his_end = last_chunk.chunk_end
				if my_start == his_end and last_chunk.connect_dir ~= chunk_data.connect_dir then
					--cable pillars may connect 2 chunks only in the same direction
					clr = g_PlacementStateToColor.Blocked
					table.insert_unique(self.construction_statuses, ConstructionStatus.UnevenTerrain)
				end
			end
			last_chunk = chunk_data
		end
	end
	
	if clr == const.clrNoModifier and not is_passage_grid then
		if all_data[last_idx].chunk and not (all_data[last_idx].chunk_end or all_data[last_idx].chunk_start) then
			clr = g_PlacementStateToColor.Blocked
			table.insert_unique(self.construction_statuses, ConstructionStatus.UnevenTerrain)
		end
	end
	
	if is_passage_grid then
		--start and end must be in dome buildable hex, start should already be (can extend from) so check end
		local n = all_data[last_idx]
		
		if not self:CanExtendFrom(n.q, n.r) or n.dome == all_data[1].dome then --also can't start and end in the same dome
			clr = g_PlacementStateToColor.Blocked
			table.insert(self.construction_statuses, ConstructionStatus.PassageRequiresTwoDomes)
		end
	end
	
	
	if clr ~= const.clrNoModifier then
		if next(all_obstructors) then
			table.insert(self.construction_statuses, ConstructionStatus.BlockingObjects)
		end
	end
	
	if is_electricity_grid and clr ~= const.clrNoModifier and data_merge_idx and all_data[data_merge_idx].chunk_end and all_data[data_merge_idx].chunk_start then
		--if we are blocked, we have ran 2 passes, we are electricity, and the turn node is both a start and an end, show only up to the turn node
		last_idx = data_merge_idx
		all_rocks = all_rocks[1]
	else
		all_rocks[1] = all_rocks[1] or {}
		local rt = {}
		for i = 1, #all_rocks do
			rt = table.append(rt, all_rocks[i])
		end

		all_rocks = rt
	end
	
	self:ColorRocks(all_rocks)
	self:ClearColorFromMissingConstructionObstructors(self.construction_obstructors, all_obstructors)
	self.construction_obstructors = all_obstructors
	self:SetColorToAllConstructionObstructors(g_PlacementStateToColor.Obstructing)
	--all visuals visibility
	
	local ground_offset = is_electricity_grid and const.GroundOffsetForLosTest or 0
	local visuals = self.visuals

	local visuals_idx = 1
	local plugs_idx = 1
	local last_visual_element = false
	local last_visual_node = false
	local did_start = false
	local x, y, z
	z = const.InvalidZ
	local angle = CalcOrientation(self.starting_point, points[1])
	
	local HandleJoint = false
	if is_electricity_grid then
		HandleJoint = function(plug, plug_angle, joint, node, chunk)
			local length = chunk and chunk.chunk_end - chunk.chunk_start or 0
			if length > 0 then
				local chain = GetChainParams(node.chunk_start == chunk and 0 or length, length, HexAngleToDirection(plug_angle), chunk, true)
				plug:ChangeEntity(chain.index == 0 and "CableTowerPlugIn" or "CableTowerPlugOut")
				plug:SetPos(plug:GetPos():SetZ(chain.base))
				plug:SetAngle(chain.index ~= 0 and plug_angle + 180 * 60 or plug_angle)
				plug:SetChainParams(chain.delta, chain.index, chain.length)
			else
				plug:SetAngle(plug_angle)
				plug:ChangeEntity(visuals.connection_entity)
				plug:ClearGameFlags(const.gofPartOfChain)
			end
		end
	elseif is_ls_grid then
		HandleJoint = function(plug, plug_angle, joint, node, chunk)
			plug:SetAngle(plug_angle)
			local length = chunk and chunk.chunk_end - chunk.chunk_start - 1 or 0
			local delta = chunk and chunk.zd or 0
			if length > 0 and delta ~= 0 then
				plug:ChangeEntity(visuals.tube_joint_seam)
				
				plug:Attach(joint, plug:GetSpotBeginIndex("Joint"))
				joint:SetAttachAxis(axis_y)
				local dist = const.GridSpacing * length
				local angle = acos(MulDivRound(4096, dist, sqrt(chunk.zd ^ 2 + dist ^ 2)))
				
				if (chunk.zd < 0) == (node.chunk_start ~= chunk) then
					joint:SetAttachAngle(angle)
				else
					joint:SetAttachAngle(-angle)
				end
				
				joint:SetVisible(true)
			else
				joint:SetVisible(false)
				joint:Detach()
				if delta == 0 then
					plug:ChangeEntity(visuals.connection_entity)
				else
					plug:SetVisible(false)
					plugs_idx = plugs_idx - 1
				end
			end
		end
	end
	
	local passage_skin = nil
	if is_passage_grid then
		if all_data[1] and all_data[1].dome then
			passage_skin = all_data[1].dome:GetCurrentSkinStrIdForPassage()
		end
	end
	
	local passed_block_reasons = {}
	if all_data.has_group_with_no_hub then
		table.insert_unique(self.construction_statuses, ConstructionStatus.NoDroneHub)
	end
	
	for i = 1, last_idx do
		local node = all_data[i]
		--per node construction errors
		local reason = node.block_reason
		if reason and not passed_block_reasons[reason] then
			if reason == "roads" then
				table.insert_unique(self.construction_statuses, ConstructionStatus.NonBuildableInterior)
			elseif reason == "block_entrance" then
				table.insert_unique(self.construction_statuses, ConstructionStatus.PassageTooCloseToEntrance)
			elseif reason == "block_life_support" then
				table.insert_unique(self.construction_statuses, ConstructionStatus.PassageTooCloseToLifeSupport)
			elseif reason == "unbuildable" then
				table.insert_unique(self.construction_statuses, ConstructionStatus.UnevenTerrain)
			elseif reason == "no_hub" then
				table.insert_unique(self.construction_statuses, ConstructionStatus.NoDroneHub)
			end
			passed_block_reasons[reason] = true
		end
	end
	
	SortConstructionStatuses(self.construction_statuses)
	local s = self:GetConstructionState()
	if s == "error" and clr ~= g_PlacementStateToColor.Blocked then
		clr = g_PlacementStateToColor.Blocked
	elseif s == "problem" and clr ~= g_PlacementStateToColor.Problematic then
		clr = g_PlacementStateToColor.Problematic	
	end
	--cursor strings
	self:UpdateShortConstructionStatus(all_data[data_count])
	
	for i = 1, last_idx do
		local node = all_data[i]
		
		if node.is_turn then
			angle = CalcOrientation(points[1], points[2])
		end
		
		if clr ~= const.clrNoModifier or node.status < SupplyGridElementHexStatus.blocked then
			x, y = HexToWorld(node.q, node.r)
			local el = visuals.elements[visuals_idx]
			
			el:SetPos(x, y, IsBuildableZoneQR(node.q, node.r) and GetBuildableZ(node.q, node.r) or z)
			if i == 1 and is_passage_grid then
				z = el:GetPos():z()
			end
			el:SetColorModifier(clr)
			el:SetAngle(angle % (180 * 60))
			rawset(el, "node", node)
			visuals_idx = visuals_idx + 1
			
			--pick entity
			local e = visuals.link_entity
			local p = nil
			if is_electricity_grid then
				if node.is_turn and not node.chunk_start and not node.chunk_end then
					local a1 = CalcOrientation(points[1], self.starting_point)
					local a2 = angle
					local first = HexAngleToDirection(a1)
					local second = HexAngleToDirection(a2)
					local t_first = Min(first, second)
					second = Max(first, second)
					first = t_first
					e = ElectricGridCableDirectionRelationToEntity[second - first]
					el:SetAngle(60 * 60 * first)
				elseif node.is_turn and node.chunk_end then
					el:SetAngle(60 * 60 * node.chunk_end.connect_dir)
				end
			elseif is_ls_grid then --pipes
				if node.is_turn then
					e = visuals.hub_entity
				elseif node.pillar and not node.ignore_this_pillar_in_visuals then
					e = visuals.pipe_non_hub_pillar
				end
			elseif is_passage_grid then
				e, p = GetPassageEntity(node, passage_skin)
				local a = GetPassageAngle(node)
				if a ~= el:GetAngle() then
					el:SetAngle(a)
				end
			end
			
			if node.chunk_start or node.chunk_end then
				e = visuals.pillar_entity
			elseif node.chunk or (node.status == SupplyGridElementHexStatus.unbuildable and not is_passage_grid) then
				local chunk_idx = i - 1 
				local chain = false 
				if is_electricity_grid then
					chain = GetChainParams(chunk_idx - node.chunk.chunk_start, node.chunk.chunk_end - node.chunk.chunk_start, HexAngleToDirection(angle), node.chunk, true)
				else
					chain = GetChainParams(chunk_idx - node.chunk.chunk_start - 1, node.chunk.chunk_end - node.chunk.chunk_start - 1, HexAngleToDirection(angle), node.chunk)
				end
				el:SetChainParams(chain.delta, chain.index, chain.length)
				e = visuals.chain_entity
				el:SetPos(x, y, chain.base)
			end
			
			if not did_start then
				did_start = true
				if not (node.chunk_start or node.chunk_end) and not is_passage_grid then
					e = visuals.hub_entity
				end
			end
				
			if e ~= el:GetEntity() then
				if is_passage_grid then
					el:DestroyAttaches()
				end
				el:ChangeEntity(e)
				if is_passage_grid then
					AutoAttachObjectsToPlacementCursor(el)
					el:ForEachAttach(function(attach)
						attach:SetSIModulation(0) -- turn off entrance lights
					end)
				end
			end
			if p then
				ApplyToObjAndAttaches(el, function(o)
					p:ApplyToObj(o)
				end)
			end
			if not is_passage_grid and e == visuals.hub_entity then
				el:SetAngle(0)
			end
			if e ~= visuals.chain_entity or not node.chunk then
				el:ClearGameFlags(const.gofPartOfChain)
			end
			el:SetVisible(true)
			
			if not is_passage_grid then
				--plug management
				if (e == visuals.pillar_entity or e == visuals.hub_entity) and last_visual_element then
					local plug = visuals.plugs[plugs_idx]
					plugs_idx = plugs_idx + 1
					plug:SetPos(el:GetPos())	
					plug:SetColorModifier(clr)
					local plug_angle = CalcOrientation(el:GetPos(), last_visual_element:GetPos()) + visuals.plug_angle_correction
					HandleJoint(plug, plug_angle, visuals.joints[plugs_idx - 1], node, node.chunk_end)
					plug:SetVisible(true)
				end
				if last_visual_element and 
					(last_visual_element:GetEntity() == visuals.pillar_entity or last_visual_element:GetEntity() == visuals.hub_entity) then
					local plug = visuals.plugs[plugs_idx]
					plugs_idx = plugs_idx + 1
					local last_el_pos = last_visual_element:GetPos()
					plug:SetPos(last_el_pos)
					plug:SetColorModifier(clr)
					local plug_angle = CalcOrientation(last_el_pos, el:GetPos()) + visuals.plug_angle_correction
					HandleJoint(plug, plug_angle, visuals.joints[plugs_idx - 1], all_data[i-1], all_data[i-1].chunk_start)
					plug:SetVisible(true)
				end
			end
			
			
			last_visual_node = node
			last_visual_element = el
		end
	end
	--make last element into an end element
	local el = visuals.elements[visuals_idx - 1]
	if el and not is_passage_grid then
		local e = is_electricity_grid and visuals.hub_entity or is_ls_grid and visuals.pillar_entity
		if last_visual_node.chunk_start or last_visual_node.chunk_end then
			e = visuals.pillar_entity
		end
		if e ~= el:GetEntity() then
			el:ChangeEntity(e)
			el:ClearGameFlags(const.gofPartOfChain)
		end
		if not is_electricity_grid then
			el:SetAngle(0)
		end
		
		if not last_visual_node.chunk_end then
			angle = visuals.elements[visuals_idx - 2] and CalcOrientation( el:GetPos(), visuals.elements[visuals_idx - 2]:GetPos()) or (angle + 180 * 60)
			local plug = visuals.plugs[plugs_idx]
			plugs_idx = plugs_idx + 1
			plug:SetPos(el:GetPos())
			plug:SetColorModifier(clr)
			local plug_angle = angle + visuals.plug_angle_correction
			HandleJoint(plug, plug_angle, visuals.joints[plugs_idx - 1], last_visual_node, last_visual_node.chunk)
			plug:SetVisible(true)
		end
	end
	if el then
		self:SetTxtPosObj(el)
	end
	
	for i = visuals_idx, self.max_hex_distance_to_allow_build do
		visuals.elements[i]:SetVisible(false)
	end
	
	if not is_passage_grid then
		for i = visuals_idx == 2 and 1 or plugs_idx, self.max_plugs do
			visuals.plugs[i]:SetVisible(false)
			if not is_electricity_grid then
				visuals.joints[i]:SetVisible(false)
			end
		end
	end
	
	self.current_points = points_prestine
	self.current_status = clr
	self.current_len = data_count
	
	ObjModified(self)
end

function GridConstructionController:DoneVisuals()
	self:UpdateCursorObject(true)
	
	for j = 1, self.max_hex_distance_to_allow_build do
		self.visuals.elements[j]:delete()
	end
	if self.mode ~= "passage_grid" then
		for j = 1, #self.visuals.joints do
			self.visuals.joints[j]:delete()
		end
		
		for j = 1, self.max_plugs do
			self.visuals.plugs[j]:delete()
		end
	end
	
	self.visuals = false
	self.last_update_hex = false
end

function GridConstructionController:Deactivate(pt)
	self:ClearColorFromAllConstructionObstructors()
	self.construction_obstructors = false
	if self.starting_point then
		if self.mode == "passage_grid" and #self.last_placed_points_count > 0 then
			local idx = #self.placed_points - self.last_placed_points_count[#self.last_placed_points_count] + 1
			for i = #self.placed_points, idx, -1 do
				self.placed_points[i] = nil
			end
			table.remove(self.last_placed_points_count)
			if #self.last_placed_points_count > 0 then
				local terrain_pos = GetPosHelper()
				if terrain.IsPointInBounds(terrain_pos) then
					self.last_update_hex = false
					self:UpdateVisuals(terrain_pos)
				end
				return false
			end
		end
		
		self.starting_point = false
		self.starting_cs_group = false
		self.total_cost = false
		self:DoneVisuals()
		self:UpdateCursorObject(true)
		self:ColorRocks({})
		local terrain_pos = GetPosHelper()
		if terrain.IsPointInBounds(terrain_pos) then --update at new pos
			self:UpdateCursor(terrain_pos)
		end
		return false --don't kill me
	else
		if self.mode == "passage_grid" then
			self:ClearDomeWithObstructedRoads()
		end
		self:ColorRocks({})
		self:DoneHelpers()
		if IsValid(self.cursor_obj) then
			DoneObject(self.cursor_obj)
			self.cursor_obj = false
		end
		return true --kill me
	end
end

function GridConstructionController:GetShortConstructionStatusPos()
	local obj = self.cursor_obj or self.visuals and self.visuals[#self.visuals].finish
	return ConstructionController.GetShortConstructionStatusPos(self, obj)
end


local RevMask = { 8, 16, 32, 1, 2, 4 } --corresponds to HexNeighbours

function GridConstructionController:UpdateShortConstructionStatus(last_data)
	local txt, ctrl = ConstructionController.UpdateShortConstructionStatus(self)
	if txt ~= "" or self.mode ~= "life_support_grid" then
		return
	end
	
	if not last_data then
		local arr = self.visuals and self.visuals.elements
		if arr and arr[1]:GetVisible() then --there is at least one visible
			for i = #arr, 1, -1 do
				if arr[i]:GetVisible() then
					last_data = arr[i].node
					break
				end
			end
		elseif self.cursor_obj then
			local p = self.cursor_obj:GetPos()
			local q, r = WorldToHex(p)
			last_data = {q = q, r = r}
		end
		
		if not last_data then
			return
		end
	end
	
	local q, r = last_data.q, last_data.r
	local all_cs
	local bld
	local pipe
	for d = 1, 6 do
		local p = HexNeighbours[d]
		local qq, rr = q + p:x(), r + p:y()
		local bld_in_hex = HexGetBuilding(qq, rr)
		if IsKindOf(bld_in_hex, "ConstructionSite") and IsKindOf(bld_in_hex.building_class_proto, "LifeSupportGridObject") then
			all_cs = all_cs or {}
			table.insert(all_cs, {bld = bld_in_hex, q = qq, r = rr}) 
		end
		local v = HexGridGet(SupplyGridConnections.water, point(qq, rr))
		if band(v, shift(RevMask[d], 8)) ~= 0 then
			--any potential to us
			bld = bld or bld_in_hex
			pipe = HexGetPipe(qq, rr)
		end
		if bld then break end
	end
	
	if not bld and all_cs then
		--check construction sites
		for _, data in ipairs(all_cs) do
			local bld_dir = HexAngleToDirection(data.bld)
			local qq, rr = WorldToHex(data.bld)
			local src = point(HexRotate(data.q - qq, data.r - rr, -bld_dir)) -- remove the object rotation
			local dir = (6 + HexGetDirection(data.q, data.r, q, r) - bld_dir) % 6
			for _, conn in ipairs(data.bld.building_class_proto:GetPipeConnections()) do
				if conn[1] == src and conn[2] == dir then
					bld = data.bld
					break
				end
			end
		end
	end
	
	local new_skin = false
	if bld then
		txt = T{8019, "Connected to building"}
		if not IsKindOf(bld, "ConstructionSite") and IsKindOf(bld, "LifeSupportGridObject") then
			new_skin = bld.water and bld.water.grid and bld.water.grid.element_skin
		end
	elseif pipe then
		txt = T{8020, "Connected to pipe"}
		new_skin = pipe.water and pipe.water.grid and pipe.water.grid.element_skin
	else
		txt = T{8021, "<yellow>Not connected</color>"}
	end
	
	if new_skin and not self.starting_point then
		self:SetSkin(new_skin)
	end
	
	ctrl:SetText(txt)
	ctrl:SetVisible(true)
	CreateGameTimeThread(function(ctrl)
		ctrl:SetMargins(box(-ctrl.text_width/2,30,0,0)) --delay until text_width is updated
	end, ctrl)
	--ctrl:SetMargins(box(-ctrl.text_width/2,30,0,0))
end

function GridConstructionController:SetSkin(skin_name)
	if self.skin_name == skin_name then return end
	self.skin_name = skin_name
	local vis = IsValid(self.cursor_obj)
	if self.visuals then
		self:DoneVisuals()
		self:InitVisuals()
	end
	self:UpdateCursorObject(vis)
	
	local terrain_pos = GetPosHelper()
	if terrain.IsPointInBounds(terrain_pos) then
		self:UpdateVisuals(terrain_pos)
	end
end

function GridConstructionController:UpdateCursor(pt)
	if IsValid(self.cursor_obj) then
		self.cursor_obj:SetPos(FixConstructPos(pt))
	end
	ShowNearbyHexGrid(ConstructionController.IsTerrainFlatForPlacement(nil, {point20}, pt, 0) and pt)
	self:UpdateVisuals(pt)
end

function GridConstructionController:ConstructLine(pt1, pt2, override_from, group, last_data)
	local q1, r1 = WorldToHex(pt1)
	local q2, r2 = WorldToHex(pt2)
	local dir, len
	if override_from then
		local q3, r3 = WorldToHex(override_from)
		len = 0
		dir = (HexGetDirection(q3, r3, q2, r2) + 3) % 6
	else
		dir, len = HexGetDirection(q1, r1, q2, r2)
		if q1 == q2 and r1 == r2 then
			dir = 0
			len = 0
		end
	end
	
	assert(dir)
	local func
	if self.mode == "electricity_grid" then
		func = PlaceCableLine
	elseif self.mode == "life_support_grid" then
		func = PlacePipeLine
	elseif self.mode == "passage_grid" then
		func = PlacePassageLine
	else
		return
	end
	local _, construction_grp, last_placed_obj, data = func(UICity, q1, r1, dir, len, nil, self.grid_elements_require_construction, group, last_data, self.skin_name, self.entrance_hexes)
	return construction_grp, last_placed_obj, data
end

function GridConstructionController:Getconstruction_statuses_property()
	local items = {}
	if #self.construction_statuses > 0 then --we have statuses, display first 2
		for i = 1, Min(#self.construction_statuses, 2) do
			local st = self.construction_statuses[i]
			items[#items+1] = T{879, "<col><text></color>", col = ConstructionStatusColors[st.type].color_tag, text = st.text}
		end
	else
		items[#items+1] = T{880, "<color 138 223 47>All Clear!</color>"}
	end
	return table.concat(items, "\n")
end

function GridConstructionController:Getconstruction_costs_property()
	local text = ""
	local t = {}
	
	for k, v in pairs(self.total_cost or empty_table) do
		t[#t + 1] = FormatResource(empty_table, v, k)
	end
	
	if next(t) then
		text = T{263, "Cost: "} .. table.concat(t , " ")
	end
	
	return text
end

function GridConstructionController:GetDisplayName()
	if self.mode == "electricity_grid" then
		return T{881, "Power Cables"}
	elseif self.mode == "life_support_grid" then
		return T{882, "Pipes"}
	elseif self.mode == "passage_grid" then
		return T{8776, "Passages"}
	end
end

function GridConstructionController:GetDescription()
	if self.mode == "electricity_grid" then
		return T{883, "Cables connect adjacent buildings to the power grid when constructed."}
	elseif self.mode == "life_support_grid" then
		return T{884, "Pipes transport Oxygen and Water and have to be connected to buildings on the spots indicated with a pipe connection icon."}
	elseif self.mode == "passage_grid" then
		return T{8777, "Connect two domes by placing both ends of the Passage on empty hexes inside two nearby domes."}
	end
end


----------------------------------------------------------------------------------------------------------------------
----------------supply grid switch construction controller------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
GlobalVar("CityGridSwitchConstruction", {})

DefineClass.GridSwitchConstructionDialog = {
	__parents = { "InterfaceModeDialog" },
	mode_name = "electricity_switch",
	MouseCursor =  "UI/Cursors/CablePlacement.tga",
	success_sound = "CableConstructionSuccess",
	template = false,
	
	TryCloseAfterPlace = TryCloseAfterPlace,
}

function GridSwitchConstructionDialog:Init()
	table.change(hr, "Construction", { RenderBuildGrid = 3, BuildGridRadius = 13000 })
	HideGamepadCursor("construction")
	ShowResourceIcons("construction")
	
	if GetUIStyleGamepad() then
		self:CreateThread("GamepadCursorUpdate", UpdateConstructionCursorObject, CityGridSwitchConstruction[UICity])
	end
end

function GridSwitchConstructionDialog:Open(...)
	if self.mode_name == "passage_ramp" then
		HideMouseCursor("InGameInterface")
		HideGamepadCursor("construction")
		ShowResourceIcons("construction")
	end

	InterfaceModeDialog.Open(self, ...)
	self:SetModal(true)
	CityGridSwitchConstruction[UICity]:SetMode(self.mode_name)
	self:OnMousePos() --initial update
	DelayedCall(0, OpenGridSwitchConstructionInfopanel)
end

function GridSwitchConstructionDialog:Close(...)
	InterfaceModeDialog.Close(self, ...)
	while not CityGridSwitchConstruction[UICity]:Deactivate() do end
	table.restore(hr, "Construction")
	if self.mode_name == "passage_ramp" then
		ShowMouseCursor("InGameInterface")
	end
	ShowGamepadCursor("construction")
	HideResourceIcons("construction")
	
	if self:IsThreadRunning("GamepadCursorUpdate") then
		self:DeleteThread("GamepadCursorUpdate")
	end
	local dlg = GetHUD()
	if dlg then dlg.idtxtConstructionStatus:SetVisible(false) end	
end

function GridSwitchConstructionDialog:TryPlace(pos)
	if CityGridSwitchConstruction[UICity]:Activate(HexGetNearestCenter(pos)) then
		PlayFX(self.success_sound, "start")
		self:TryCloseAfterPlace()
	else
		PlayFX("ConstructionFail", "start")
	end
end

function GridSwitchConstructionDialog:OnMouseButtonDown(pt, button)
	if button == "L" then
		self:TryPlace(GetTerrainCursor())
	elseif button == "R" then
		if CityGridSwitchConstruction[UICity]:Deactivate(pt) then
			PlayFX("GridConstructionCancel", "start")
			CloseModeDialog()
			return "break"
		end
	elseif self.mode_name == "passage_ramp" and button == "M" then
		CityGridSwitchConstruction[UICity]:Rotate(-1)
		return "break"
	end
end

function GridSwitchConstructionDialog:OnMousePos(pt)
	local terrain_pos = GetPosHelper("mouse")
	if terrain.IsPointInBounds(terrain_pos) then
		CityGridSwitchConstruction[UICity]:UpdateCursor(terrain_pos)
	end
	return "break"
end

function GridSwitchConstructionDialog:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" or shortcut == "LeftTrigger-ButtonA" then
		self:TryPlace(GetTerrainGamepadCursor())
		return "break"
	elseif shortcut == "ButtonB" then
		self:OnMouseButtonDown(nil, "R") --cancel
		return "break"
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	end
end

DefineClass.GridSwitchConstructionDialogPipes = {
	__parents = { "GridSwitchConstructionDialog" },
	mode_name = "lifesupport_switch",
	MouseCursor = "UI/Cursors/PipePlacement.tga",
	success_sound = "PipeConstructionSuccess",
}

DefineClass.GridSwitchConstructionDialogPassageRamp = {
	__parents = { "GridSwitchConstructionDialog" },
	mode_name = "passage_ramp",
	MouseCursor = "UI/Cursors/PipePlacement.tga",
	success_sound = "PipeConstructionSuccess",
}

DefineClass.GridSwitchConstructionController = {
	__parents = { "ConstructionController" },
	
	properties = {
		{id = "construction_statuses_property", editor = "text", name = T{""}, translate = true, default = false},
		{id = "DisplayName",                    editor = "text", name = T{""}, translate = true, default = false},
	},
	
	cursor_obj = false,
	mode = "electricity_switch", --"electricity_switch" or "lifesupport_switch" or "passage_ramp"
	
	current_status = const.clrNoModifier,
	construction_statuses = false,
	is_template = true,
	stockpiles_obstruct = false,
}

function GridSwitchConstructionController:Getconstruction_costs_property()
	return ""
end

local passage_ramp_shape_hollow = false

function GridSwitchConstructionController:SetMode(mode)
	self.selected_domes = {}
	self.mode = mode
	if mode == "passage_ramp" then
		if not passage_ramp_shape_hollow then
			--initialize the shape
			passage_ramp_shape_hollow = table.copy(PassageRamp:GetShapePoints())
			table.remove_entry(passage_ramp_shape_hollow, point20)
			table.remove_entry(passage_ramp_shape_hollow, point(1, 0))
			table.remove_entry(passage_ramp_shape_hollow, point(-1, 0))
		end
		self.template_obj_points = passage_ramp_shape_hollow
		local template = "PassageRamp"
		self.template_name = template
		self.template_obj = ClassTemplates.Building[template] or g_Classes[template]
	else
		self.template_obj_points = false
		self.template_name = false
		self.template_obj = false
	end
	self:UpdateCursorObject(true)
	self.construction_statuses = {}
end

function GridSwitchConstructionController:UpdateCursorObject(visible)
	if visible then
		local entity
		local palette
		if self.mode == "electricity_switch" then
			palette = EntityPalettes.Cables
			entity = "CableSwitch"
		elseif self.mode == "lifesupport_switch" then
			palette = EntityPalettes.Pipes
			entity = "TubeSwitch"
		elseif self.mode == "passage_ramp" then
			entity = "PassageRamp"
		end
		if IsValid(self.cursor_obj) then
			self.cursor_obj.entity = entity
			self.cursor_obj:ChangeEntity(entity)
		else
			self.cursor_obj = CursorGridElement:new{ entity = entity }
			self.cursor_obj:SetEnumFlags(const.efVisible)
		end
		
		if palette then
			palette:ApplyToObj(self.cursor_obj)
		end
		
		self:SetTxtPosObj(self.cursor_obj)
	elseif IsValid(self.cursor_obj) then
		self.cursor_obj:delete()
		self.cursor_obj = false
	end
end

GridSwitchConstructionController.SetTxtPosObj = GridConstructionController.SetTxtPosObj

function GridSwitchConstructionController:Activate(pt)
	--place
	local s = self:GetConstructionState()
	if s == "error" then
		return false
	end
	
	local pos = self.cursor_obj:GetPos()
	local q, r = WorldToHex(pos)
	local angle = self.cursor_obj:GetAngle()
	local obj_underneath = self.mode == "electricity_switch" and HexGetCable(q, r) or self.mode == "lifesupport_switch" and HexGetPipe(q, r)
													or self.mode == "passage_ramp" and HexGetPassageGridElement(q, r)
	assert(obj_underneath)
	
	local params = {obj_to_turn_into_switch = obj_underneath, place_stockpile = false}
	local no_blk_pass = false
	local rocks, stocks
	if self.mode == "passage_ramp" then
		local cursor_obj = self.cursor_obj
		local template_obj = self.template_obj
		rocks = HexGetUnits(cursor_obj, template_obj:GetEntity(), nil, nil, nil, nil, "WasteRockObstructor")
		stocks = HexGetUnits(cursor_obj, template_obj:GetEntity(), nil, nil, nil, function(obj) return obj:GetParent() == nil and IsKindOf(obj, "DoesNotObstructConstruction") and not IsKindOf(obj, "Unit") end, "ResourceStockpileBase")
		no_blk_pass = #rocks >= 0 or #stocks >= 0
		params.place_stockpile = true
		params.resource_stockpile_spot = "Workdrone"
	end
	local cs = PlaceConstructionSite(UICity, self.mode == "electricity_switch" and "ElectricitySwitch" or self.mode == "lifesupport_switch" and "LifesupportSwitch" 
										or self.mode == "passage_ramp" and "PassageRamp", pos, angle, params, no_blk_pass, self.mode ~= "passage_ramp")
	cs:AppendWasteRockObstructors(rocks)
	cs:AppendStockpilesUnderneath(stocks)
	return true
end

function GridSwitchConstructionController:Deactivate(pt)
	if IsValid(self.cursor_obj) then
		DoneObject(self.cursor_obj)
		self.cursor_obj = false
	end
	
	ConstructionController.ClearColorFromAllConstructionObstructors(self)
	self.construction_obstructors = false
	
	self:ClearDomeWithObstructedRoads()
	self:ColorRocks({})
	
	return true --kill me
end

function GridSwitchConstructionController:UpdateConstructionStatuses(pt)
	local old_t = self.construction_statuses 
	self.construction_statuses = {}
	
	local q, r = WorldToHex(pt or self.cursor_obj)
	
	if self.mode == "electricity_switch" then
		local c = HexGetCable(q, r)
		if not c then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresCable
		elseif IsKindOf(c, "ConstructionSite") then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresCompletedCable
		elseif not c:CanMakeSwitch() then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.UnevenTerrain
		end
	elseif self.mode == "lifesupport_switch" then
		local p = HexGetPipe(q, r)
		if not p then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresPipe
		elseif IsKindOf(p, "ConstructionSite") then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresCompletedPipe
		elseif not p:CanMakeSwitch() then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.UnevenTerrain
		end
	elseif self.mode == "passage_ramp" then
		local p = HexGetPassageGridElement(q, r)
		if not p then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresPassage
		elseif IsKindOf(p, "ConstructionSite") then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.RequiresCompletedPassage
		end
		
		if self.template_obj.dome_forbidden and GetDomeAtHex(q, r) then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.DomeProhibited
		end
	end
	
	if not DoesAnyDroneControlServiceAtPoint(self.cursor_obj) then
		self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.NoDroneHub
	end
	
	if self.mode == "passage_ramp" then
		ConstructionController.UpdateConstructionObstructors(self)
		ConstructionController.SetColorToAllConstructionObstructors(self, g_PlacementStateToColor.Obstructing)
		if #(self.construction_obstructors or "") > 0 then
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.BlockingObjects
		end
	else
		local b = HexGetBuilding(q, r)
		if b then --any building blocks
			self.construction_statuses[#self.construction_statuses + 1] = ConstructionStatus.BlockingObjects
		end
	end
	
	SortConstructionStatuses(self.construction_statuses)
	if not table.iequals(old_t, self.construction_statuses) then
		ObjModified(self)
	end
	
	self:PickCursorObjColor()
end

function GridSwitchConstructionController:UpdateCursor(pt)
	if IsValid(self.cursor_obj) then
		self.cursor_obj:SetPos(FixConstructPos(pt))
	end
	ShowNearbyHexGrid(ConstructionController.IsTerrainFlatForPlacement(nil, {point20}, pt, 0) and pt)
	self:UpdateConstructionStatuses(pt)
	self:UpdateShortConstructionStatus()
end

function GridSwitchConstructionController:PickCursorObjColor()
	local clr
	local s = self:GetConstructionState()
	if s == "error" then
		clr = g_PlacementStateToColor.Blocked
	else
		self:ClearColorFromAllConstructionObstructors()
		clr = s == "problem" and g_PlacementStateToColor.Problematic or g_PlacementStateToColor.Placeable
		self.construction_obstructors = false
	end
	self.cursor_obj:SetColorModifier(IsEditorActive() and const.clrNoModifier or clr) 
end

function GridSwitchConstructionController:GetDisplayName()
	if self.mode == "electricity_switch" then
		return T{885, "Power Switch"}
	elseif self.mode == "lifesupport_switch" then
		return T{886, "Pipe Valve"}
	elseif self.mode == "passage_ramp" then
		return T{8813, "Passage Ramp"}
	end
end

function GridSwitchConstructionController:GetDescription()
	if self.mode == "electricity_switch" then
		return T{887, "Place a power switch"}
	elseif self.mode == "lifesupport_switch" then
		return T{888, "Place a pipe valve"}
	elseif self.mode == "passage_ramp" then
		return T{8778, "Place a passage ramp"}
	end
end
----------------------------------------------------------------------------------------------------------------------
----------------tunnel construction controller------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
GlobalVar("CityTunnelConstruction", {})

DefineClass.TunnelConstructionDialog = {
	__parents = { "InterfaceModeDialog" },
	Cursor =  "UI/Cursors/CablePlacement.tga",
	mode_name = "tunnel_construction",
	success_sound = "CableConstructionSuccess",
	
	template = false,
	params = false,
	
	TryCloseAfterPlace = TryCloseAfterPlace,
}

function TunnelConstructionDialog:Init()
	for k,v in pairs(self.context) do
		self[k] = v
	end
	table.change(hr, "Construction", { RenderBuildGrid = 3, BuildGridRadius = 13000 })
	HideGamepadCursor("construction")
	ShowResourceIcons("construction")
	
	if GetUIStyleGamepad() then
		self:CreateThread("GamepadCursorUpdate", UpdateConstructionCursorObject, CityTunnelConstruction[UICity])
	end
end

function TunnelConstructionDialog:Open(...)
	InterfaceModeDialog.Open(self, ...)
	self:SetModal(true)
	DelayedCall(0, OpenTunnelConstructionInfopanel, self.template)
end

function TunnelConstructionDialog:Close(...)
	InterfaceModeDialog.Close(self, ...)
	while not CityTunnelConstruction[UICity]:Deactivate() do end
	table.restore(hr, "Construction")
	ShowGamepadCursor("construction")
	HideResourceIcons("construction")
	
	if self:IsThreadRunning("GamepadCursorUpdate") then
		self:DeleteThread("GamepadCursorUpdate")
	end
	local dlg = GetHUD()
	if dlg then dlg.idtxtConstructionStatus:SetVisible(false) end	
end

function TunnelConstructionDialog:TryPlace(pos)
	local close = not not CityTunnelConstruction[UICity].placed_obj
	if CityTunnelConstruction[UICity]:Activate(HexGetNearestCenter(pos)) then
		PlayFX(self.success_sound, "start")
		if close then
			self:TryCloseAfterPlace()
		end
	else
		PlayFX("ConstructionFail", "start")
	end
end

function TunnelConstructionDialog:OnMouseButtonDown(pt, button)
	if button == "L" then
		self:TryPlace(GetTerrainCursor())
	elseif button == "R" then
		if CityTunnelConstruction[UICity]:Deactivate(pt) then
			PlayFX("GridConstructionCancel", "start")
			CloseModeDialog()
			return "break"
		end
	elseif button == "M" then
		CityTunnelConstruction[UICity]:Rotate(-1)
		return "break"
	end
end

function TunnelConstructionDialog:OnMouseButtonDoubleClick(pt, button)
	if button == "M" then
		return self:OnMouseButtonDown(pt, button)
	end
end

function TunnelConstructionDialog:OnMousePos(pt)
	local terrain_pos = HexGetNearestCenter(GetTerrainCursor())
	if terrain.IsPointInBounds(terrain_pos) then
		CityTunnelConstruction[UICity]:UpdateCursor(terrain_pos)
	end
	return "break"
end

function TunnelConstructionDialog:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" then
		self:OnMouseButtonDown(GetTerrainGamepadCursor(), "L")
		return "break"
	elseif shortcut == "ButtonB" then
		self:OnMouseButtonDown(nil, "R") --cancel
		return "break"
	end
end

DefineClass.ObstacleCursorBuilding = {
	__parents = {"CursorBuilding", "UngridedObstacle"},
}

function ObstacleCursorBuilding:Done()
	SetShapeMarkers(self, false)
end

--controller->
DefineClass.TunnelConstructionController = {
	__parents = { "ConstructionController" },
	
	properties = {
		{id = "construction_statuses_property", editor = "text", name = T{""}, translate = true, default = false},
		{id = "DisplayName",                    editor = "text", name = T{""}, translate = true, default = false},
	},
	
	cursor_obj = false,
	placed_obj = false, --when placing the first part of the tunnel, this will be a cursor obj with the picked pos
	
	template_name = false,
	template_obj = false,
	template_obj_points = false,
	is_template = true,
	
	max_range = 100, --hexes
		
	current_status = const.clrNoModifier,
	PickCursorObjColor = GridSwitchConstructionController.PickCursorObjColor,
	stockpiles_obstruct = true,
}

function TunnelConstructionController:Initialize(template)
	self.rocks_underneath = {}
	self.template_name = template
	self.template_obj = ClassTemplates.Building[template] or g_Classes[template]
	self.template_obj_points = self.template_obj:GetBuildShape()
	self:UpdateCursorObject(true)
	self.construction_statuses = {}
	self.selected_domes = {}
	
	local terrain_pos = HexGetNearestCenter(GetUIStyleGamepad() and GetTerrainGamepadCursor() or GetTerrainCursor())
	self:UpdateCursor(terrain_pos)
end

function TunnelConstructionController:UpdateCursorObject(visible)
	if visible then
		local entity = self.template_obj.entity
		
		if IsValid(self.cursor_obj) then
			self.cursor_obj.entity = entity
			self.cursor_obj:ChangeEntity(entity)
		else
			self.cursor_obj = CursorBuilding:new{ template = self.template_obj, entity = entity }
			self.cursor_obj:SetEnumFlags(const.efVisible)
		end
		
		self:SetTxtPosObj(self.cursor_obj)
	elseif IsValid(self.cursor_obj) then
		self.cursor_obj:delete()
		self.cursor_obj = false
	end
end

TunnelConstructionController.SetTxtPosObj = GridConstructionController.SetTxtPosObj

function TunnelConstructionController:Activate(pt)
	--place
	local s = self:GetConstructionState()
	if s == "error" then
		return false
	end
	
	if self.placed_obj then
		--place tunnels
		local template_obj = self.template_obj
		local placed_obj = self.placed_obj
		local cursor_obj = self.cursor_obj
		
		local group = CreateConstructionGroup("Tunnel", placed_obj:GetPos(), 2, false, true, false)
		local params1, params2 = {construction_group = group, place_stockpile = false}, {construction_group = group, place_stockpile = false}
		params1.linked_obj = params2
		params2.linked_obj = params1
		table.insert(group, params1)
		table.insert(group, params2)
		
		
		local entity = template_obj:GetEntity()
		local force_extend_bb = template_obj:HasMember("force_extend_bb_during_placement_checks") and template_obj.force_extend_bb_during_placement_checks ~= 0 and template_obj.force_extend_bb_during_placement_checks or false
		local rocks1 = HexGetUnits(placed_obj, entity, nil, nil, nil, nil, "WasteRockObstructor", force_extend_bb)
		local rocks2 = HexGetUnits(cursor_obj, entity, nil, nil, nil, nil, "WasteRockObstructor", force_extend_bb)
		--tunnels destroy rocks
		for i = 1, #(rocks1 or empty_table) do
			DoneObject(rocks1[i])
		end
		
		for i = 1, #(rocks2 or empty_table) do
			DoneObject(rocks2[i])
		end
		
		params1 = PlaceConstructionSite(UICity, self.template_name, placed_obj:GetPos(), placed_obj:GetAngle(), params1)
		
		params2 = PlaceConstructionSite(UICity, self.template_name, cursor_obj:GetPos(), cursor_obj:GetAngle(), params2)
		
		DoneObject(self.placed_obj)
		self.placed_obj = false
	else
		--place a cursor obj to mark tunnel entrance
		self.placed_obj = ObstacleCursorBuilding:new{ template = self.template_obj, entity = self.template_obj:GetEntity() }
		self.placed_obj:SetPos(self.cursor_obj:GetPos())
		self.placed_obj:SetAngle(self.cursor_obj:GetAngle())
		self.placed_obj:SetEnumFlags(const.efVisible)
	end
	
	local terrain_pos = HexGetNearestCenter(GetUIStyleGamepad() and GetTerrainGamepadCursor() or GetTerrainCursor())
	self:UpdateCursor(terrain_pos)
	return true
end

function TunnelConstructionController:Deactivate(pt)
	if self.placed_obj then
		DoneObject(self.placed_obj)
		self.placed_obj = false
		return false --don't kill me
	else
		if IsValid(self.cursor_obj) then
			DoneObject(self.cursor_obj)
			self.cursor_obj = false
		end
		
		self:ColorRocks({})
		self:ClearColorFromAllConstructionObstructors()
		return true --kill me
	end
end

function TunnelConstructionController:UpdateConstructionStatuses(pt)
	local old_t = ConstructionController.UpdateConstructionStatuses(self, "dont_finalize")
	
	if self.placed_obj then
		if not IsCloser2D(self.placed_obj, self.cursor_obj, self.max_range * const.GridSpacing) then
			table.insert(self.construction_statuses, ConstructionStatus.TooFarFromTunnelEntrance)
		end
		table.remove_entry(self.construction_statuses, ConstructionStatus.NoDroneHub)
	end

	self:FinalizeStatusGathering(old_t)
end

function TunnelConstructionController:UpdateConstructionObstructors()
	ConstructionController.UpdateConstructionObstructors(self)
	
	local template_obj = self.template_obj
	local force_extend_bb = template_obj:HasMember("force_extend_bb_during_placement_checks") and template_obj.force_extend_bb_during_placement_checks ~= 0 and template_obj.force_extend_bb_during_placement_checks or false
	if self.placed_obj and HexGetUnits(self.cursor_obj, template_obj:GetEntity(), nil, nil, "test", nil, "ObstacleCursorBuilding", force_extend_bb) then
		table.insert(self.construction_obstructors, self.placed_obj)
	end
end

function TunnelConstructionController:UpdateCursor(pt)
	ShowNearbyHexGrid(pt)
	
	if IsValid(self.cursor_obj) then
		self.cursor_obj:SetPos(FixConstructPos(pt))
	end
	ObjModified(self)
	if not self.template_obj or not self.cursor_obj then return end
	self:UpdateConstructionObstructors()
	self:UpdateConstructionStatuses(pt)
	self:UpdateShortConstructionStatus()
end


----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

---gui
maintenance_props = {
	{"electricity_consumption", "Power", T{79, "Power"}},
	{"air_consumption", "Air", T{891, "Air"}},
	{"water_consumption", "Water", T{681, "Water"}},
}

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "ConstructionCursor"
	list[#list + 1] = "RotateConstruction"
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "CursorBuilding"
end

DefineClass.GridTile = {
	__parents = { "CObject" },
	game_flags = { gofRealTimeAnim = true },
	class_flags = { cfConstructible = false, },
	entity = "GridTile",
	SetDust = __empty_function__,
}

DefineClass.GridTileWater = {
	__parents = { "CObject" },
	game_flags = { gofRealTimeAnim = true },
	class_flags = { cfConstructible = false, },
	entity = "GridTileWater",
	SetDust = __empty_function__,
}

function SetWaterMarkers(obj, show, list)
	if not IsValid(obj) then
		return
	end
	if show and IsKindOf(obj, "Building") and obj.destroyed then
		show = false
	end
	local marker_class = "GridTileWater"
	if not show then
		obj:DestroyAttaches(marker_class)
		return
	end
	local spot_name = "Lifesupportgrid"
	if not obj:HasSpot(spot_name) then
		return
	end
	if show == "update" then
		obj:ForEachAttach(marker_class, function(marker)
			local spot = marker:GetAttachSpot()
			local x, y, z = obj:GetSpotPosXYZ(spot)
			local zmin = GetMaxHeightInHex(x, y) + 30
			marker:SetAttachOffset(0, 0, Max(0, zmin - z))
			marker:SetVisible(IsBuildableZone(x, y))
		end)
	elseif obj:CountAttaches(marker_class) == 0 then
		local first, last = obj:GetSpotRange(spot_name)
		for idx = first, last do
			local marker = PlaceObject(marker_class, nil, const.cfComponentAttach)
			obj:Attach(marker, idx)
			marker:SetAttachAngle(- marker:GetAngle())
			local x, y, z = marker:GetVisualPosXYZ()
			local zmin = GetMaxHeightInHex(x, y) + 30
			marker:SetAttachOffset(0, 0, Max(0, zmin - z))
			marker:SetVisible(IsBuildableZone(x, y))
			if list then
				list[#list + 1] = marker
			end
		end
	end
	return true
end

function UpdateShapeHexes(obj)
	if not IsValid(obj) or not IsKindOf(obj, "CursorBuilding") then
		return
	end
	obj:ForEachAttach("GridTile", function(tile, obj)
		local dx, dy = tile:GetAttachOffset():xy()
		local x, y = tile:GetVisualPosXYZ()
		local zmin = GetMaxHeightInHex(x, y) + 30
		tile:SetAttachOffset(dx, dy, Max(0, zmin - obj:GetPos():z()))
		tile:SetVisible(IsBuildableZone(x, y))
	end, obj)
end

function SavegameFixups.RemoveStuckDomeShapeHexes()
	MapDelete("map", "GridTile")
end

----

function OnMsg.Demolished(obj)
	SetWaterMarkers(obj, false)
	--update construction controller
	local obj = CityConstruction[UICity]
	local constr_dlg = GetInGameInterfaceModeDlg()
	if obj and constr_dlg and constr_dlg:IsKindOf("ConstructionModeDialog") then
		obj:UpdateConstructionObstructors()
		obj:UpdateConstructionStatuses() --should go after obstructors
		obj:UpdateShortConstructionStatus()
	elseif constr_dlg and constr_dlg:IsKindOf("GridConstructionDialog") then
		obj = CityGridConstruction[UICity]
		if obj then
			local terrain_pos = HexGetNearestCenter(GetTerrainCursor())
			if terrain.IsPointInBounds(terrain_pos) then
				obj:UpdateVisuals(terrain_pos)
			end
		end
	end
end

function dbg_GetCursorObj()
	return CityConstruction[UICity].cursor_obj
end
