DefineClass.OverviewModeDialog = {
	__parents = { "UnitDirectionModeDialog" },
	mode_name = "overview",
	saved_camera = false,
	saved_dist = false,
	saved_angle = false,
	mouse_pos = false,
	overview_angle = false,
	target_obj = false,
	camera_transition_time = 500,	
	sector_obj = false, --selection decal
	sector_objs = false, -- selection decal for advanced probes
	sector_id = false, -- for the sector currently selected
	current_sector = false, --currently selected MapSector object
	exit_to = false, --position to look at when exiting from overview mode
	scan_mode = false,
	dpad_last_sector_change = 0, --used to fix jumping of the sector selection
	rollover_context_cache = false,
}

function OverviewModeDialog:GetRolloverTemplate()
	return "PinRollover"
end

function OverviewModeDialog:GetRolloverText()
	return T{""}
end

function CalcOverviewCameraPos(angle)
	if not angle then
		local igi = GetInGameInterface()
		angle = igi and igi.mode == "overview" and igi.mode_dialog and igi.mode_dialog.overview_angle or 45*60
	end

	assert(terrain.GetMapWidth() == terrain.GetMapHeight()) -- assumed for simplicity and confirmed by designer
	local size = terrain.GetMapWidth()
	local center = point(size/2, size/2, 0)

	local ov_pos = (mapdata.OverviewPos ~= InvalidPos()) and mapdata.OverviewPos or const.OverviewCamPos
	local ov_lookat = (mapdata.OverviewLookAt ~= InvalidPos()) and mapdata.OverviewLookAt or const.OverviewCamLookAt
	local ov_angle = mapdata.OverviewOrientation * 60
	
	local lookat = MulDivRound(ov_lookat, size, 100) - center
	local pos = MulDivRound(ov_pos, size, 100) - center
	
	center = center:SetStepZ()
	
	angle = angle + ov_angle

	lookat = center + Rotate(lookat, angle)
	pos = center + Rotate(pos, angle)

	return pos, lookat
end

function CalcOverviewCurtainsSize(pos, lookat, screen_w, screen_h)
	local mapx, mapy = terrain.GetMapSize()
	local border = 50*guim
	local p = { GameToScreenFromView(pos, lookat, screen_w, screen_h,
		point(border,border):SetTerrainZ(),
		point(mapx-1-border,border):SetTerrainZ(),
		point(mapx-1-border,mapy-1-border):SetTerrainZ(),
		point(border,mapy-1-border):SetTerrainZ())
	}

	if not (p[1] and p[2] and p[3] and p[4]) then
		return 0, 0
	end
	local idx, minx = 1, p[1]:x()
	for i = 2, 4 do
		if minx > p[i]:x() then
			idx = i
			minx = p[i]:x()
		end
	end

	local x1, y1 = p[1+(idx-1)%4]:xy()
	local x2, y2 = p[1+(idx+0)%4]:xy()
	local x3, y3 = p[1+(idx+1)%4]:xy()
	local x4, y4 = p[1+(idx+2)%4]:xy()

	local height = Max(0, y2, y3, screen_h - y1, screen_h - y4)
	local w1 = x1 - MulDivTrunc(y1 - height, x2 - x1, y2 - y1)
	local w2 = x3 - MulDivTrunc(y3 - height, x4 - x3, y4 - y3)
	local width = Max(0, w1, screen_w - w2)
	local min_size = 600
	if screen_w > min_size and screen_w - 2*width < min_size then
		width = (screen_w - min_size) / 2
	end
	if screen_h > min_size and screen_h - 2*height < min_size then
		height = (screen_h - min_size) / 2
	end
	return width, height
end

if FirstLoad then
	CameraTransitionThread = false
end

function OnMsg.DoneMap()
	DeleteThread(CameraTransitionThread)
	CameraTransitionThread = false
	ShowOverviewMapCurtains(false, true)
end

function OverviewModeDialog:Init()
	-- transition camera from current to overview

	CameraTransitionThread = CreateMapRealTimeThread(function(self, prev_thread)
		if IsValidThread(prev_thread) then
			WaitMsg("CameraTransitionEnd")
		end

		local old_pos = cameraRTS.GetEye()
		local old_lookat = cameraRTS.GetLookAt()
		local old_eye = old_lookat + MulDivRound(old_pos - old_lookat, 1000, cameraRTS.GetZoom())
		self.saved_camera = { eye = old_eye, lookat = old_lookat }
		self.saved_dist = old_eye:Dist(old_lookat)
		self.saved_angle = asin(MulDivRound(4096, old_eye:z() - old_lookat:z(), self.saved_dist))

		if not (Platform.developer and IsEditorActive()) then
			LockCamera("overview")
		end
		MapForEach("map", "RangeHexRadius", function(o) o:SetVisible(false) end)

		local transition_time = self.camera_transition_time
		self.overview_angle = 45*60 --CalcOrientation(old_pos, old_lookat) - 45*60
		local pos, lookat = CalcOverviewCameraPos(self.overview_angle)
		pos = lookat + MulDivRound(pos - lookat, 1000, cameraRTS.GetZoom())
		cameraRTS.SetCamera(pos, lookat, transition_time)
		table.change(hr, "overview", {
			FarZ = 1500000,
			ShadowRangeOverride = 1500000,
			ShadowFadeOutRangePercent = 0
		})
		ShowExploration(transition_time)
		hr.CameraFovEasing = "QuinticOut"
		camera.SetAutoFovX(1, transition_time, const.Camera.OverviewFovX_4_3, 4, 3, const.Camera.OverviewFovX_16_9, 16, 9)
		ShowOverviewMapCurtains(true)
		self:ScaleSmallObjects(transition_time, "up")
		hr.NearZ = 1000
		Sleep(transition_time)
		hr.CameraFovEasing = "Linear"
		SetSubsurfaceDepositsVisible(true)
		self.sector_id = nil
		if self.parent then -- might be already switched to a different mode
			self:SelectSectorAtPoint()
		end
		Msg("CameraTransitionEnd")
		if CameraTransitionThread == CurrentThread() then
			CameraTransitionThread = false
		end
		if GetUIStyleGamepad() then
			self:SelectSector(self.current_sector)
		end
	end, self, CameraTransitionThread)

	self.sector_obj = PlaceObject("SectorRadius")
	self.sector_obj:ClearEnumFlags(const.efVisible)
	DeleteOnLoadSavegame(self.sector_obj)

	HideGamepadCursor("overview")
	ShowResourceIcons("overview")

	self:CreateThread("SectorInfoRefresh", function(self)
		while self.parent do
			if self.current_sector then
				self:UpdateSectorRollover(self.current_sector)
			end
			Sleep(1000)
		end
	end, self)
end

function OverviewModeDialog:Open(...)
	UnitDirectionModeDialog.Open(self, ...)
	if GetUIStyleGamepad() then
		local sector = GetMapSector(GetTerrainGamepadCursor())
		
		local probes = UICity.labels.OrbitalProbe or empty_table
		
		if #probes > 0 and #probes[1].scan_pattern > 1 then
			self.sector_objs = {}
			for i = 1, #probes[1].scan_pattern - 1 do
				self.sector_objs[i] = PlaceObject("SectorRadius")
			end
		end		
		
		self:SelectSector(sector, nil, "forced")
	end
	
	local hud = GetHUD()
	if hud then
		local overview_btn = hud.idOverview
		if overview_btn then
			overview_btn:SetToggled(true)
		end
	end
end

function OverviewModeDialog:OnMouseLeft()
	self.sector_id = nil
	self:SelectSector(false)
end

function OverviewModeDialog:DoneMap()
	self.camera_transition_time = 0
end

function OverviewModeDialog:Close(...)
	UnitDirectionModeDialog.Close(self, ...)
	self:DeleteThread("SectorInfoRefresh")

	-- transition camera from current to normal
	CameraTransitionThread = CreateMapRealTimeThread(function(self, prev_thread)
		if IsValidThread(prev_thread) then
			WaitMsg("CameraTransitionEnd")
		end

		ShowGamepadCursor("overview")
		HideResourceIcons("overview")

		local transition_time = self.camera_transition_time
		self:ScaleSmallObjects(transition_time, "down")
		SetSubsurfaceDepositsVisible(false)
		SetSubsurfaceDepositsVisibleExpiration(const.OverlaysVisibleDuration)
		local cpos, clookat = cameraRTS.GetEye(), cameraRTS.GetLookAt()
		local cinvdir = (cpos - clookat):SetZ(0)
		local last_lookat = self.saved_camera and self.saved_camera.lookat
		local target = self.target_obj
		if IsPoint(target) or IsValid(target) then
			local la = IsPoint(target) and target or target:HasMember("GetLogicalPos") and target:GetLogicalPos() or target:GetVisualPos()
			target = (la ~= InvalidPos()) and la
		else
			target = false
		end
		local lookat = self.exit_to or last_lookat or target or GetTerrainCursor()
		
		-- clamp to the map borders
		local min_border = cameraRTS.GetBorder()
		local max_border = terrain.GetMapWidth() - min_border
		local dx, dy = 0, 0
		if lookat:x() < min_border then dx = min_border - lookat:x() end
		if lookat:x() > max_border then dx = max_border - lookat:x() end
		if lookat:y() < min_border then dy = min_border - lookat:y() end
		if lookat:y() > max_border then dy = max_border - lookat:y() end
		
		lookat = point(lookat:x() + dx, lookat:y() + dy):SetStepZ()
		local invdir = SetLen(cinvdir, guim)
		local axis = SetLen(point(invdir:y(), -invdir:x(), 0), guim)
		invdir = RotateAxis(invdir, axis, self.saved_angle)
		local offset = SetLen(invdir, self.saved_dist)
		local eye = lookat + offset

		cameraRTS.SetCamera(eye, lookat, transition_time)
		Msg("CameraTransitionStart", eye, lookat, transition_time)
		HideExploration(transition_time)
		hr.CameraFovEasing = "SinIn"
		camera.SetAutoFovX(1, transition_time, const.Camera.DefaultFovX_16_9, 16, 9)
		local curains_fade_time = OverviewMapCurtains.FadeOutTime
		Sleep(transition_time - curains_fade_time)
		ShowOverviewMapCurtains(false)
		Sleep(curains_fade_time)
		hr.NearZ = 100
		hr.CameraFovEasing = "Linear"

		--hr.RenderTerrainFog = 0
		while cameraRTS.IsMoving() do
			WaitMsg("OnRender")
		end
		UnlockCamera("overview")
		
		if IsValid(self.sector_obj) then
			DoneObject(self.sector_obj)
		end
		for _, obj in ipairs(self.sector_objs or empty_table) do
			DoneObject(obj)
		end

		table.restore(hr, "overview")
		self.saved_camera = nil
		self.target_obj = nil
		Msg("CameraTransitionEnd")
		if CameraTransitionThread == CurrentThread() then
			CameraTransitionThread = false
		end
		MapForEach("map", "RangeHexRadius", function(o) o:SetVisible(true) end)
	end, self, CameraTransitionThread)

	local hud = GetHUD()
	if hud then
		local overview_btn = hud.idOverview
		if overview_btn then
			overview_btn:SetToggled(false)
		end
	end
end

function OverviewModeDialog:SetScan(mode)
	if mode == self.scan_mode then
		return
	end
	
	self.scan_mode = mode
	DoneObject(self.sector_obj)
	for _, obj in ipairs(self.sector_objs or empty_table) do
		DoneObject(obj)
	end
	self.sector_objs = nil
	
	self.sector_obj = mode and PlaceObject("SectorTarget") or PlaceObject("SectorRadius")	
	local probes = UICity.labels.OrbitalProbe or empty_table
	
	if mode and #probes > 0 and #probes[1].scan_pattern > 1 then
		self.sector_objs = {}
		for i = 1, #probes[1].scan_pattern - 1 do
			self.sector_objs[i] = PlaceObject("SectorTarget")
		end
	end
	self.sector_id = nil
	self:SelectSectorAtPoint()
end

function OverviewModeDialog:DeployProbe()
	local probes = UICity.labels.OrbitalProbe or empty_table
	local sector = self.current_sector
	
	if #probes == 0 or not sector or sector:HasBlockers() then
		return
	end
	
	local deep_probe = UICity:IsTechResearched("AdaptedProbes")
	
	if sector.status == "unexplored" or (sector.status == "scanned" and deep_probe) then
		probes[1]:ScanSector(sector)
		self:SetScan(false)
		self:UpdateSectorRollover(sector)
	end
end

function OverviewModeDialog:CreateRolloverWindow(gamepad, context, pos)
	if not context then
		context = self:GenerateSectorRolloverContext(self.current_sector)
	end
	return XWindow.CreateRolloverWindow(self, gamepad, context, pos)
end

function OverviewModeDialog:SelectSector(sector, rollover_pos, forced)
	if not self.sector_obj then return end
	if sector and (forced or not CameraTransitionThread) then
		if self.sector_id ~= sector.id then -- only refresh when a new sector is hovered
			PlayFX("SectorHover", "start") --for sound
			self.current_sector = sector
			self.sector_id = sector.id
			
			self.sector_obj:SetPos(sector.area:Center())
			self.sector_obj:SetEnumFlags(const.efVisible)
			self.sector_obj:SetScale(MulDivRound(sector.area:sizex(), 100, 100*guim))
			
			local pattern = self.sector_objs
			
			if pattern and #pattern > 0 then
				local list = UICity.labels.OrbitalProbe[1]:GetAffectedSectors(sector)
				local i = 1
				local pt = sector.area:Center()
				for idx = 2, #list do
					local s = list[idx]
					pattern[i]:SetPos(s.area:Center())
					pattern[i]:SetEnumFlags(const.efVisible)
					pattern[i]:SetScale(MulDivRound(s.area:sizex(), 100, 100*guim))
					i = i + 1
				end
				for j = i, #pattern do
					pattern[j]:ClearEnumFlags(const.efVisible)
				end
			end

			--Don't show the rollover if there's a notification displayed right now
			if not GetDialog("PopupNotification") then
				local rollover_context = self:GenerateSectorRolloverContext(sector, forced)
				
				-- rollover position might be given before hand - if not -> take the center of the sector
				if not rollover_pos then
					local center, success = sector.area:Center(), false
					success, rollover_pos = GameToScreen(center:SetZ(terrain.GetHeight(center)))
					if not success then
						rollover_pos = point20
					end
				end
				local x, y = rollover_pos:xy()
				rollover_context.anchor = sizebox(x, y, 1, 1)
				
				local rollover = XCreateRolloverWindow(self, GetUIStyleGamepad(), "immediate", rollover_context)
			end
		end
	else
		self.sector_obj:ClearEnumFlags(const.efVisible)
		for _, obj in ipairs(self.sector_objs or empty_table) do
			obj:ClearEnumFlags(const.efVisible)
		end
		if RolloverControl == self then
			XDestroyRolloverWindow()
		end
	end
end

function OverviewModeDialog:SelectSectorAtPoint(terrain_point, rollover_position)
	if Platform.console or GetUIStyleGamepad() then
		terrain_point = terrain_point or GetTerrainGamepadCursor()
		--rollover_position for gamepads is the center of the sector (calculated in self:SelectSector())
	else
		terrain_point = terrain_point or GetTerrainCursor()
		rollover_position = rollover_position or terminal.GetMousePos()
	end
	
	local sector = GetMapSector(terrain_point)
	self:SelectSector(sector, rollover_position)
end

function OverviewModeDialog:OnMousePos(pt)
	self:SelectSectorAtPoint(GetTerrainCursor(), pt)
end

function OverviewModeDialog:GenerateSectorRolloverContext(sector, forced)
	if (not forced and CameraTransitionThread) or not sector or sector.id ~= self.sector_id then -- only refresh when called for the selected sector
		return
	end
			
	local texts = {}
	local deep = g_Consts.DeepScanAvailable ~= 0
	local scanned = sector.status ~= "unexplored"
	local deep_scanned = sector.status == "deep scanned"
	
	if g_ExplorationQueue[1] ~= sector then
		local status = sector.status
		if deep and scanned and not deep_scanned then
			status = "deep available"
		end
		if sector:HasBlockers() then
			texts[#texts + 1] = T{10411, "<em>An Alien Crystal is blocking the scanning of this sector</em>"}
		else
			texts[#texts + 1] = T{4049, "<em><status></em>", status = SectorStatusToDisplay[status]}
		end
	else		
		local target = deep and const.SectorDeepScanPoints or const.SectorScanPoints
		texts[#texts + 1] = T{4050, "Scanning <em><percent(number)></em>", number = MulDivRound(sector.scan_progress, 100, target)}
	end
	texts[#texts + 1] = T{""}
	
	texts[#texts + 1] = T{4051, "Buildable area<right><em><percent(number)></em>", number = sector.play_ratio}
				
	local exp_shown = {}
				
	sector:GatherResourceTexts(texts)
	
	local hint, hint_gamepad
	local deep_probes = UICity:IsTechResearched("AdaptedProbes")
	local has_probes = (not scanned or deep_probes) and #(UICity.labels.OrbitalProbe or empty_table) > 0
								
	if sector:CanBeScanned() or ((self.scan_mode and not scanned) or GetUIStyleGamepad()) then
		local expected = {}
		
		for i = 1, #sector.exp_resources do
			local res = sector.exp_resources[i]
			local desc = Resources[res]
			local name = desc and desc.display_name
			
			if name then
				if (not scanned or desc.deep_available) then
					expected[#expected + 1] = name
					exp_shown[res] = true
				end
			else
				local classdef = g_Classes[res]
				if IsKindOf(classdef, "EffectDeposit") then
					expected[#expected + 1] = classdef.sector_expected_name
					exp_shown[res] = true
				end
			end
		end
		
		local bonus = sector:GetTowerBoost(UICity)
		if bonus > 0 then
			texts[#texts + 1] = T{4052, "Sensor towers boost<right><em><percent(bonus)></em>", bonus = bonus}
		end
		
		if #expected > 0 then
			texts[#texts + 1] = T{4053, "<newline>High chance that this Sector contains:"}
			for i = 1, #expected do
				texts[#texts + 1] = T{4054, "<tab 10><name>", name = expected[i]}
			end
		end

		local max = const.ExplorationQueueMaxSize
		local queued = #g_ExplorationQueue 
		local queue_idx = table.find(g_ExplorationQueue, sector)
		if not scanned or (deep and not deep_scanned) then
			local texts = {}
			if queue_idx  or  queued < max then
				texts = {T{4056, "<ButtonY> Add/Remove sector from scan queue"}}
			end
			if queued>=1 and (queue_idx  and queue_idx>1 or queued < max) then
				texts[#texts +1] = T{10889, "<RightTrigger><ButtonY> Queue first"}
			end	
			if has_probes then
				texts[#texts +1] = T{10536, "<ButtonX> Deploy an Orbital Probe to scan this sector"}
				texts[#texts +1] = T{7908, "<ButtonA> Zoom in"}
				texts[#texts +1] = Untranslated("\n")
			else
				texts[#texts +1] = T{7908, "<ButtonA> Zoom in"}
			end
			hint_gamepad = table.concat(texts, "\n")	
				
			if not self.scan_mode then
				if queue_idx then
					hint = T{4057, "<right_click> Remove from queue"}
				elseif queued < max then
					hint = T{4058, "<left_click> Add to queue"}
				end				 
				if queued>=1 and (queue_idx  and queue_idx>1 or queued < max) then
					hint = (hint or "").."\n".. T{10537, "Ctrl + <left_click> Queue first"}
				end					
			end
			if has_probes then
				hint = hint and hint .. "<newline>" or ""
				if self.scan_mode then
					if deep_probes then
						hint = hint .. T{10985, "<left_click> Deploy an Orbital Probe and deep scan this Sector"}
					else
						hint = hint .. T{4060, "<left_click> Deploy an Orbital Probe and scan this Sector"}
					end
				else
					if deep_probes then
						hint = hint .. T{4061, "<em><ShortcutName('actionDeployProbe')></em> Deploy an Orbital Probe and deep scan this Sector"}
					else
						hint = hint .. T{4062, "<em><ShortcutName('actionDeployProbe')></em> Deploy an Orbital Probe and scan this Sector"}
					end
				end
			end
		elseif deep_probes and not deep_scanned and has_probes then
			if self.scan_mode then
				hint = T{10986, "<left_click> Deploy an Orbital Probe and deep scan this Sector"}
			else
				hint = T{4061, "<em><ShortcutName('actionDeployProbe')></em> Deploy an Orbital Probe and deep scan this Sector"}
			end
		else
			hint_gamepad = T{7908, "<ButtonA> Zoom in"}
		end
	elseif deep_probes and not deep_scanned and has_probes then
		if self.scan_mode then
			hint = T{4059, "<left_click> to deploy an Orbital Probe and deep scan this Sector"}
		else
			hint = T{4061, "<em><ShortcutName('actionDeployProbe')></em> Deploy an Orbital Probe and deep scan this Sector"}
		end
	end
	
	local old_rollover_context = self.rollover_context_cache
	self.rollover_context_cache = {
		RolloverTitle = T{4063, "Sector <u(display_name)>", sector}, 
		RolloverText = table.concat(texts, "<newline><left>"),
		RolloverHint = hint,
		RolloverHintGamepad = hint_gamepad,
		RolloverAnchor = "smart",
	}
	
	return self.rollover_context_cache, old_rollover_context
end

function OverviewModeDialog:UpdateSectorRollover(sector)
	if not RolloverWin or RolloverControl ~= self or sector ~= self.current_sector then
		return
	end
	
	local context, old_context = self:GenerateSectorRolloverContext(self.current_sector)
	if context then
		context.anchor = old_context and old_context.anchor or nil
		XCreateRolloverWindow(self, GetUIStyleGamepad(), "immediate", context)
	else
		XDestroyRolloverWindow()
	end
end

function OverviewModeDialog:OnMouseButtonDown(pt, button)
	local result = UnitDirectionModeDialog.OnMouseButtonDown(self, pt, button)
	if button == "L" then
		if result ~= "break" then
			local sector = GetMapSector(GetTerrainCursor())
			if not sector then
				return
			end
			
			if self.scan_mode and not sector:HasBlockers() then
				local deep_probe = UICity:IsTechResearched("AdaptedProbes")
				if sector.status == "unexplored" or (sector.status == "scanned" and deep_probe) then
					local probes = #(UICity.labels.OrbitalProbe or empty_table)
					assert(probes > 0)
					UICity.labels.OrbitalProbe[1]:ScanSector(sector)
					if probes <= 1 then
						self:SetScan(false)
					end
				end
				return "break"
			end
			
			if sector:QueueForExploration(terminal.IsKeyPressed(const.vkControl)) then
				self:UpdateSectorRollover(sector)
				return "break"
			end
		end
	elseif button == "R" then
		if result ~= "break" then
			if self.scan_mode then
				self:SetScan(false)
				return "break"
			end

			local sector = GetMapSector(GetTerrainCursor())
			if not sector then return end
			
			if sector:RemoveFromExplorationQueue() then
				self:UpdateSectorRollover(sector)
			end
				
			return "break"
		end
	end
	return result
end

--divides the numbers and then round the result
local function divround(x, divisor)
	local sign = (x == 0) and 0 or (x > 0 and 1 or -1)
	return sign * ((abs(x) + divisor/2) / divisor)
end

local gamepad_directional_buttons = {
	LeftThumbDownRight = true,
	LeftThumbDownLeft = true,
	LeftThumbUpRight = true,
	LeftThumbUpLeft = true,
	LeftThumbLeft = true,
	LeftThumbDown = true,
	LeftThumbUp = true,
	LeftThumbRight = true,
}
local sector_change_min_time = 1 --the sector change with the gamepad will not happen twice within this timespan(ms)
function OverviewModeDialog:OnShortcut(shortcut, source)
	if source == "gamepad" then
		local invertLook = const.CameraControlInvertLook
		--Zoom-in from overview
		if (shortcut == "+RightThumbUp" and not invertLook) or (shortcut == "+RightThumbDown" and invertLook) then
			if not self:IsThreadRunning("ZoomInFromOverview") then
				self:CreateThread("ZoomInFromOverview", function(self)
					Sleep(300)
					local sector = self.sector_obj
					self.exit_to = sector and sector:GetPos() or GetTerrainGamepadCursor()
					self.parent:SetMode("selection")
				end, self)
			end
		elseif (shortcut == "-RightThumbUp" and not invertLook) or (shortcut == "-RightThumbDown" and invertLook) then
			if self:IsThreadRunning("ZoomInFromOverview") then
				self:DeleteThread("ZoomInFromOverview")
			end
		end
		--exit - focus sector in middle of the screen
		if shortcut == "ButtonA" then
			local sector = self.sector_obj
			self.exit_to = sector and sector:GetPos() or GetTerrainGamepadCursor()
			self.parent:SetMode("selection")
			return "break"
		end
		
		--exit - focus sector from which overview was activated
		if shortcut == "ButtonB" then
			self.exit_to = false
			self.parent:SetMode("selection")
			return "break"
		end
		
		--toggle sector in scan queue
		if shortcut == "RightTrigger-ButtonY" then
			local sector = self.current_sector
			if sector:QueueForExploration("add first") then
				self:UpdateSectorRollover(sector)
			end	
		elseif shortcut == "ButtonY" then
			local sector = self.current_sector
			if sector:QueueForExploration() then
				self:UpdateSectorRollover(sector)
			elseif sector:RemoveFromExplorationQueue() then
				self:UpdateSectorRollover(sector)
			end
			return "break"
		end
		
		--sector selection change
		if gamepad_directional_buttons[shortcut] then
			shortcut = XInput.LeftThumbToDirection[shortcut] or shortcut
			if not self.current_sector then
				local sector = GetMapSector(GetTerrainGamepadCursor())
				self:SelectSector(sector, nil, "forced")
			end
			
			--sector change with gamepad must not happen twice in some time X to avoid jumps of the selection
			local time = now()
			if (time - self.dpad_last_sector_change) >= sector_change_min_time then
				self.dpad_last_sector_change = time
				--get direction
				local dpad_dir
				if shortcut == "DPadRight"          then dpad_dir =  90  end
				if shortcut == "DPadLeft"           then dpad_dir = -90  end
				if shortcut == "DPadDown"           then dpad_dir =  0   end
				if shortcut == "DPadUp"             then dpad_dir =  180 end
				if shortcut == "LeftThumbDownRight" then dpad_dir =  45  end
				if shortcut == "LeftThumbDownLeft"  then dpad_dir = -45  end
				if shortcut == "LeftThumbUpRight"   then dpad_dir =  135 end
				if shortcut == "LeftThumbUpLeft"    then dpad_dir = -135 end
				
				if dpad_dir then
					--correct for camera rotation
					local sin, cos = sincos(camera.GetYaw() - dpad_dir*60)
					local dx, dy = divround(-cos, 4096), divround(-sin, 4096)

					--select new sector
					local col = Clamp(self.current_sector.col + dx, 1, #g_MapSectors)
					local row = Clamp(self.current_sector.row + dy, 1, #g_MapSectors[col])
					local sector = g_MapSectors[col][row]
					self:SelectSector(sector, nil)
				end
			end
			return "break"
		end
		
		if shortcut == "Back" or shortcut == "TouchPadClick" then
			if DismissCurrentOnScreenHint() then
				return "break"
			end
		end
		
		--block accessing of the HUD
		if shortcut == "LeftTrigger" then
			return "break"
		end
	end
	local bindings = GetShortcuts("actionZoomIn")
	if bindings and (shortcut == bindings[0] or shortcut == bindings[1] or shortcut == bindings[2]) then
		return self.parent:CheckBelowZoomLimit()
	end
	
	return UnitDirectionModeDialog.OnShortcut(self, shortcut, source)
end

function OverviewModeDialog:SetCameraAngle(angle, time)
	angle = angle % (360*60)
	if angle < 0 then
		angle = angle + 360*60
	end
	self.overview_angle = angle
	local pos, lookat = CalcOverviewCameraPos(self.overview_angle)
	pos = lookat + MulDivRound((pos - lookat), 1000, cameraRTS.GetZoom())
	cameraRTS.SetCamera(pos, lookat, time or 0)
end

function OverviewModeDialog:ScaleSmallObjects(time, direction)
	local signs = MapGet(true, "SubsurfaceDeposit", "TerrainDeposit", "ArrowTutorialBase")
	local ropes = MapGet("map", "SpaceElevatorRope")
	CreateRealTimeThread( function()
		g_CurrentDepositScale = direction == "up" and const.SignsOverviewCameraScaleUp or const.SignsOverviewCameraScaleDown
	
		local i = 0
		local step = 33
		repeat
			Sleep(step)
			local sings_scale, ropes_scale
			if time == 0 then
				sings_scale = direction == "up" and const.SignsOverviewCameraScaleUp or const.SignsOverviewCameraScaleDown
				ropes_scale = direction == "up" and const.ElevatorRopesOverviewCameraScaleUp or const.ElevatorRopesOverviewCameraScaleDown
			else
				sings_scale = const.SignsOverviewCameraScaleDown + MulDivRound(direction == "up" and i or time-i, const.SignsOverviewCameraScaleUp - const.SignsOverviewCameraScaleDown, time)
				ropes_scale = const.ElevatorRopesOverviewCameraScaleDown + MulDivRound(direction == "up" and i or time-i, const.ElevatorRopesOverviewCameraScaleUp - const.ElevatorRopesOverviewCameraScaleDown, time)
			end
			for _, sign in ipairs(signs) do
				if IsValid(sign) then
					sign:SetVisible(direction == "up" and g_SignsVisible or g_SignsVisible and g_ResourceIconsVisible)
					sign:SetScale(sings_scale)
				end
			end
			for _,rope in ipairs(ropes) do
				if IsValid(rope) then
					rope:SetScale(ropes_scale)
				end
			end
			i = i + step
		until i > time or not CameraTransitionThread
		
		local disableZ = direction == "up"
		for _, obj in ipairs(signs) do
			if IsValid(obj) then
				obj:SetNoDepthTest(disableZ)
			end
		end
	end )
end

function SavegameFixups.UpdateSectorNumberTextStyle()
	for i = 2, #g_ExplorationQueue do
		if g_ExplorationQueue[i].queue_text then
			g_ExplorationQueue[i].queue_text:SetTextStyle("ExplorationSector")
		end
	end
end