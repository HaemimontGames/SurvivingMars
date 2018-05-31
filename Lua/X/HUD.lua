DefineClass.HUD = 
{
	__parents = { "XDrawCacheDialog" },
	FocusOnOpen = "",
	
	last_highlight = false,
	ZOrder = 50,
}

HUD.button_definitions = {
	idMenu = {
		callback = function(this)
			OpenIngameMainMenu()
		end,
		rollover = {title = T{1010, "Main Menu"}, descr = T{4001, "Save, load, change options or quit the game."}, id = "Main Menu"},
		selection = true,
		image = "UI/HUD/hud_menu.tga",
		shine = "UI/HUD/hud_menu_shine.tga",
		FXPress = "MainMenuButtonClick",
	},
	idBuild = {
		callback = function(this)
			if GetXDialog("XBuildMenu") then
				CloseXBuildMenu()
			else
				OpenXBuildMenu()
			end
		end,
		rollover = {title = T{383281603855, "Build Menu"}, descr = T{4002, "Order new construction. Construction usually requires resources and Drone workers in the area."}, hint = T{4003, "<em><ShortcutName('actionOpenBuildMenu')></em> - toggle Build Menu"}, id = "Build menu"},
		selection = true,
		image = "UI/HUD/build.tga",
		shine = "UI/HUD/build_shine.tga",
		FXPress = "BuildMenuButtonClick",
	},
	idResearch = {
		callback = function(this)
			OpenResearchDialog()
		end,
		rollover = {update = true, title = T{311, "Research"},
			descr = T{4004, "Manage the research of new Technologies.<newline><newline>Current Research: <em><name></em><newline><left>Research progress: <em><percent(progress)></em>",
				name = function()
					local current_research = UICity and UICity:GetResearchInfo()
					return current_research and TechDef[current_research].display_name or T{6868, "None"}
				end,
				progress = function() return UICity:GetResearchProgress() end},
			hint = T{4005, "<em><ShortcutName('actionResearchScreen')></em> - open Research Screen"},
			id = "Research"},
		rollover_disabled = {title = T{311, "Research"},
			descr = T{8958, "Not yet available."},	-- only disabled in tutorial
			id = "Research disabled",
			},
		
		enabled = IsHUDResearchEnabled,
		selection = true,
		image = "UI/HUD/research.tga",
		shine = "UI/HUD/research_shine.tga",
		FXPress = "ResearchButtonClick",
	},
	idResupply = {
		rollover = {title = T{3997, "Resupply"},
			descr = T{4006, "Request a new cargo or passenger Rocket from Earth."},
			hint = T{4007, "<em><ShortcutName('actionResupplyScreen')></em> - open Resupply Screen"},
			id = "Resupply",
			},
		
		rollover_disabled = {title = T{3997, "Resupply"},
			descr = function()
				if g_Tutorial and not g_Tutorial.EnableResupply then
					return T{8958, "Not yet available."}
				end
				return T{4009, "<red>All resupply missions are suspended.</red>"}
			end,
			id = "Resupply disabled",
			},

		
		selection = true,
		enabled = IsHUDResupplyEnabled,
		callback = function(this)
			OpenDialog("Resupply")
		end,
		image = "UI/HUD/resupply.tga",
		shine = "UI/HUD/resupply_shine.tga",
		FXPress = "ResupplyButtonClick",
	},
	idMarkers = {
		rollover = {
			title = T{973748367669, "Milestones"}, 
			descr = T{4010, "Shows Colony Milestones and Score."}, 
			hint = T{4011, "<em><ShortcutName('actionMilestonesScreen')></em> - open Milestones Screen"}, 
			id = "Show areas of effect"},
		rollover_disabled = {
			title = T{973748367669, "Milestones"}, 
			descr = T{8958, "Not yet available."},	-- only disabled in tutorial
		},
		selection = true,
		enabled = function()
			return not g_Tutorial
		end,
		callback = function(this)
			if GetXDialog("Milestones") then
				GetXDialog("Milestones"):Close()
			else
				OpenXDialog("Milestones")
			end
		end,
		image = "UI/HUD/missions.tga",
		shine = "UI/HUD/missions_shine.tga",
		Rows = 2,
		FXPress = "AreasOfEffectButtonClick",
	},
	idOverview = {
		rollover = {title = T{786525376837, "Map Overview"}, descr = T{4012, "Switch between normal camera mode and Map Overview."}, hint = T{4013, "<em><ShortcutName('actionMapOverview')></em> - toggle Overview Mode"}, id = "Overlays"},
		selection = true,
		callback = function(this)
			ToggleOverviewMode()
		end,
		image = "UI/HUD/overlays.tga",
		shine = "UI/HUD/overlays_shine.tga",
		Rows = 2,
		FXPress = "OverviewButtonClick",
	},
	idRadio = {
		callback = function(this)
			OpenDialog("RadioStationDlg")
		end,
		rollover = {title = T{796804896133, "Radio"}, descr = T{7385, "Manage radio channels and volume."}, hint = T{7386, "<em><ShortcutName('actionRadio')></em> - open Radio"}, id = "Radio"},
		selection = true,
		image = "UI/HUD/radio.tga",
		shine = "UI/HUD/radio_shine.tga",
		FXPress = "RadioButtonClick",
	},
	idColonyOverview = {
		rollover = {title = T{7849, --[[Post-Cert]] "Colony Overview"}, descr = T{7850, "Aggregated information for your Colony."}, hint = T{7851, --[[Post-Cert]] "<em><ShortcutName('actionColonyOverview')></em> - toggle Colony Overview"}, id = "Resource Overview"},
		selection = true,
		callback = function(this)
			ShowResourceOverview = not ShowResourceOverview
			this:SetToggled(ShowResourceOverview)
			if ShowResourceOverview then
				SelectObj()
				OpenResourceOverviewInfopanel()
			else
				CloseResourceOverviewInfopanel()
			end
		end,
		image = "UI/HUD/statistics.tga",
		shine = "UI/HUD/statistics_shine.tga",
		Rows = 2,
		FXPress = "ResourceOverviewButtonClick",
	},
	idColonyControlCenter = {
		rollover = {title = T{137542936955, "Command Center"}, descr = T{8980, "Provides historical stats and tools to inspect and manage Buildings, Domes, Colonists and transportation."}, hint = T{8981, "<em><ShortcutName('actionColonyControlCenter')></em> - toggle Command Center"}, id = "Command Center"},
		selection = true,
		callback = function(this)
			OpenCommandCenter()
		end,
		image = "UI/HUD/command_center.tga",
		shine = "UI/HUD/command_center_shine.tga",
		FXPress = "ColonyControlCenterButtonClick",
	},
	
	idPause = {
		rollover = {title = T{6869, "Pause"}, descr = T{4017, "Pause the game."}, id = "Pause", hint_gamepad = T{4018, "<em><ShortcutName('actionPauseGame')>/<DPadUp>:</em> Pause/unpause"}, hint = T{9826, "<em><ShortcutName('actionPauseGame')>:</em> Pause/unpause"}},
		image = "UI/HUD/pause.tga",
		shine = "UI/HUD/double_speed_shine.tga",
	},
	idPlay = {
		rollover = {title = T{4019, "Normal"}, descr = T{4020, "Play at normal speed."}, id = "Normal Speed", hint = T{4021, "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')>:</em> Change game speed"}},
		image = "UI/HUD/normal_speed.tga",
		shine = "UI/HUD/double_speed_shine.tga",
	},
	idMedium = {
		rollover = {title = T{4022, "Fast"}, descr = T{4023, "Play at three times normal speed."}, id = "Fast Speed", hint = T{4021, "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')>:</em> Change game speed"}},
		image = "UI/HUD/double_speed.tga",
		shine = "UI/HUD/double_speed_shine.tga",
	},
	idFast = {
		rollover = {title = T{4024, "Fastest"}, descr = T{4025, "Play at five times normal speed."}, id = "Fastest Speed", hint = T{4021, "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')>:</em> Change game speed"}},
		image = "UI/HUD/super_fast_speed.tga",
		shine = "UI/HUD/double_speed_shine.tga",
	},
	
	idSol = {
		rollover = {update = true, title = T{4026, "Solar Date"}, descr = T{4027, "Hour <hour> of Sol <day>.<newline><newline>Martian days consist of nearly 25 Earth hours."}, id = "Solar Date"},
	},
	idDayProgress = {
		rollover = {update = true, title = T{4028, "Solar Time: <white>Hour <hour> of Sol <day></white>"}, descr = T{8104, "Martian days consist of nearly 25 Earth hours."}, id = "Solar Time"},
	},
	
	idDrones = {
		rollover = {title = T{517, "Drones"}, descr = T{4029, "Represents the total number of Drones in your colony. The Drones are automated units controlled by Drone Hubs, Rovers and Rockets."}, id = "Drones"},
	},
	idDronesImg = {
		rollover = {title = T{517, "Drones"}, descr = T{4029, "Represents the total number of Drones in your colony. The Drones are automated units controlled by Drone Hubs, Rovers and Rockets."}, id = "Drones"},
	},
	idHumans = {
		rollover = {title = T{547, "Colonists"}, descr = T{4030, "Represents the total number of Colonists in your Colony. Colonists live within Domes and require Air, Water and Food to survive."}, id = "Colonists"},
	},
	idHumansImg = {
		rollover = {title = T{547, "Colonists"}, descr = T{4030, "Represents the total number of Colonists in your Colony. Colonists live within Domes and require Air, Water and Food to survive."}, id = "Colonists"},
	},
}

HUD.button_list = table.keys2(HUD.button_definitions, true)

local LeftHUDButtons = {"idBuild", "idOverview", "idResupply", "idResearch"}
local RightHUDButtons = {"idColonyControlCenter", "idColonyOverview", "idMarkers", "idRadio", "idMenu"}
local SpeedControlButtons = {"idPause", "idPlay", "idMedium", "idFast"}

function HUD:Init()
	------ construction status text
	XText:new({
		Id = "idtxtConstructionStatus",
		TextFont = "HUDConstruction",
		Translate = true,
		ShadowType = "extrude",
		ShadowSize = 2,
		HandleMouse = false,
		Dock = "box",
		HAlign = "left",
		VAlign = "top",
		Clip = false,
		TextColor = RGBA(255,255,255,255),
	}, self)
	self.idtxtConstructionStatus:SetVisible(false)
	------ background images
	XImage:new({
		Id = "idPadLeft",
		Margins = box(-572,0,0,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "left",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkLeft",
		Margins = box(-572,0,0,-81),
		Dock = "box",
		HAlign = "left",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	XImage:new({
		Id = "idPadMiddle",
		Margins = box(0,0,0,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkMiddle",
		Margins = box(0,0,0,-81),
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	XImage:new({
		Id = "idPadRight",
		Margins = box(0,0,-572,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "right",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkRight",
		Margins = box(0,0,-572,-81),
		Dock = "box",
		HAlign = "right",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	
	----- left side buttons
	local left_buttons = XWindow:new({
		Id = "idLeftButtons",
		Margins = box(41,0,0,0),
		HAlign = "left",
		VAlign = "bottom",
		LayoutMethod = "HList",
		LayoutHSpacing = 5,
	}, self)
	local button_defs = HUD.button_definitions
	for _, id in ipairs(LeftHUDButtons) do
		local win = XWindow:new({}, left_buttons)
		local button = button_defs[id]
		HUDButton:new({
			Id = id,
			Image = button.image,
			Rows = button.Rows or 1,
			FXPress = button.FXPress,
		}, win)
		local highlight = id .. "Highlight"
		XImage:new({
			HandleMouse = false,
			Id = highlight,
			Image = button.shine,
		}, win)
		self[highlight]:SetVisible(false)
	end
	
	------ right side buttons
	local right_buttons = XWindow:new({
		Id = "idRightButtons",
		Margins = box(0,0,41,0),
		HAlign = "right",
		VAlign = "bottom",
		LayoutMethod = "HList",
		LayoutHSpacing = 5,
	}, self)
	for _, id in ipairs(RightHUDButtons) do
		local win = XWindow:new({}, right_buttons)
		local button = button_defs[id]
		HUDButton:new({
			Id = id,
			Image = button.image,
			Rows = button.Rows or 1,
			FXPress = button.FXPress,
		}, win)
		local highlight = id .. "Highlight"
		XImage:new({
			HandleMouse = false,
			Id = highlight,
			Image = button.shine,
		}, win)
		self[highlight]:SetVisible(false)
	end
	
	------- middle section
	local middle_section = XWindow:new({
		HAlign = "center",
		VAlign = "bottom",
		LayoutMethod = "HList",
		LayoutHSpacing = 6,
		Margins = box(0,0,0,3),
	}, self)
	for _, id in ipairs(SpeedControlButtons) do
		local win = XWindow:new({}, middle_section)
		HUDSpeedControlButton:new({
			Id = id,
			Image = button_defs[id].image,
		}, win)
		local highlight = id .. "Highlight"
		XImage:new({
			HandleMouse = false,
			Id = highlight,
			Image = button_defs[id].shine,
		}, win)
		self[highlight]:SetVisible(false)
	end
	XText:new({
		Id = "idSol",
		MinWidth = 73,
		TextFont = "HUDSol",
		RolloverTemplate = "Rollover",
		TextColor = RGBA(255,254,171,255),
		RolloverTextColor = RGBA(255,254,171,255),
		TextHAlign = "center",
		TextVAlign = "center",
		Translate = true,
	}, middle_section)
	XFrameProgress:new({
		Id = "idDayProgress",
		Image = "UI/HUD/day_pad.tga",
		FrameBox = box(5, 0, 5, 0),
		VAlign = "center",
		HandleMouse = true,
		ProgressImage = "UI/HUD/day_cycle.tga",
		RolloverTemplate = "Rollover",
		MinWidth = 146,
		MaxWidth = 146,
		MaxProgress = const.HoursPerDay * const.MinutesPerHour / 5,
		SeparatorImage = "UI/HUD/day_shine.tga",
		SeparatorOffset = 4,
	}, middle_section)
	self.idDayProgress.idProgress:SetTileFrame(true)
	XImage:new({
		Id = "idHumansImg",
		Margins = box(19,0,0,0),
		Image = "UI/HUD/humans.tga",
		RolloverTemplate = "Rollover",
		HandleMouse = true,
	}, middle_section)
	XText:new({
		Id = "idHumans",
		MinWidth = 65,
		TextFont = "HUDSol",
		RolloverTemplate = "Rollover",
		TextColor = RGBA(255,254,171,255),
		RolloverTextColor = RGBA(255,254,171,255),
		TextHAlign = "left",
		TextVAlign = "center",
	}, middle_section)
	XImage:new({
		Id = "idDronesImg",
		Image = "UI/HUD/drones.tga",
		RolloverTemplate = "Rollover",
		HandleMouse = true,
	}, middle_section)
	XText:new({
		Id = "idDrones",
		MinWidth = 60,
		TextFont = "HUDSol",
		RolloverTemplate = "Rollover",
		TextColor = RGBA(255,254,171,255),
		RolloverTextColor = RGBA(255,254,171,255),
		TextHAlign = "left",
		TextVAlign = "center",
	}, middle_section)
	self:InitControls()
end

function HUD:InitControls()
	for k, v in sorted_pairs(HUD.button_definitions) do
		local ctrl = self[k]
		ctrl.OnPress = function()
			if v.callback then
				v.callback(ctrl)
			end
		end
		self:SetCtrlRollover(ctrl, v)
		if v.enabled then
			ctrl:SetEnabled(v.enabled(self))
		end
	end
	rawset(self.idPause, "prev_UISpeedState", UISpeedState)
	self.idPause.OnPress = function(this)
		if GetTimeFactor() == 0 then
			UICity:SetGameSpeed(false)
			UISpeedState = this.prev_UISpeedState
		else
			UICity:SetGameSpeed(0)
			this.prev_UISpeedState = UISpeedState
			UISpeedState = "pause"
		end
	end
	self.idPlay.OnPress = function(this)
		UICity:SetGameSpeed(1)
		UISpeedState = "play"
	end
	self.idMedium.OnPress = function(this)
		UICity:SetGameSpeed(const.mediumGameSpeed)
		UISpeedState = "medium"
	end
	self.idFast.OnPress = function(this)
		UICity:SetGameSpeed(const.fastGameSpeed)
		UISpeedState = "fast"
	end
	
	self:SetDayProgress(UICity.hour * const.MinutesPerHour + UICity.minute)
	self.idSol:SetText(T{4031, "Sol <day>", UICity})
	self:DeleteThread("update_stats")
	self:CreateThread("update_stats", function()
		while UICity do
			self.idDrones:SetText(tostring(#(UICity.labels.Drone or "")))
			self.idHumans:SetText(tostring(#(UICity.labels.Colonist or "")))
			self:UpdateTimeButtons()
			self:UpdateHUDButtons()
			Sleep(1000)
		end
	end)
	self:UpdateGamepadControls()
end

function HUD:Open(...)
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

function HUD:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	local margins = GetSafeMargins()
	self:SetMargins(HUD.Margins + margins)
	self.idtxtConstructionStatus:SetPadding(box(-margins:minx(), -margins:miny(), 0, 0))
end

function OnMsg.SafeAreaMarginsChanged()
	local hud = GetHUD()
	if hud then
		hud:RecalculateMargins()
	end
end

local day_start = 6*const.MinutesPerHour
local day_end = 20*const.MinutesPerHour
function HUD:SetDayProgress(value)
	self.idDayProgress:SetProgress(value / 5)
	local image
	if value>day_start and value<day_end then
		image = "UI/HUD/day_shine.tga"
	else
		image = "UI/HUD/night_shine.tga"
	end	
	self.idDayProgress:SetSeparatorImage(image)
end

function HUD:UpdateGamepadControls()
	local visible = not GetUIStyleGamepad() or (Platform.console and g_MouseConnected)
	self.idWatermarkLeft:SetVisible(visible)
	self.idPadLeft:SetVisible(visible)
	self.idWatermarkRight:SetVisible(visible)
	self.idPadRight:SetVisible(visible)
	self.idLeftButtons:SetVisible(visible)
	self.idRightButtons:SetVisible(visible)
	self:UpdateHintHighlight()
end

local HUDElementsWithHintHighlights = {
	"idMenu", "idBuild", "idOverview", "idResupply",
	"idResearch", "idColonyOverview", "idMarkers", "idRadio",
	"idPause", "idPlay", "idMedium", "idFast",
}
for i=1,#HUDElementsWithHintHighlights do
	local name = HUDElementsWithHintHighlights[i]
	HUDElementsWithHintHighlights[i] = nil
	HUDElementsWithHintHighlights[name] = string.format("%sHighlight", name)
end

function HUD:UpdateHintHighlight(force)
	local id = HintsGetHighlightedID(self.class)
	if not id then
		--hide highlighting
		if self:IsThreadRunning("HintHighlight") then
			for _,element_id in pairs(HUDElementsWithHintHighlights) do
				self[element_id]:SetVisible(false)
			end
			self.last_highlight = false
			self:DeleteThread("HintHighlight")
		end
	else
		--show/change highlighting
		local original = self[id]
		local element_id = HUDElementsWithHintHighlights[id]
		local element = rawget(self, element_id)
		if element and (element ~= self.last_highlight or force) then
			if original:IsVisible() then
				if self.last_highlight then
					self.last_highlight:SetVisible(false)
					self:DeleteThread("HintHighlight")
				end
				
				self.last_highlight = element
				element:SetVisible(true)
				self:CreateThread("HintHighlight", HintHighlightIconAnimation, element)
			else
				if self.last_highlight then
					self.last_highlight:SetVisible(false)
					self:DeleteThread("HintHighlight")
				end
			end
		end
	end
end

function OnMsg.OnScreenHintChanged(hint)
	local hud = GetHUD()
	if hud then
		hud:UpdateHintHighlight("force")
	end
end

local function UpdateHUDUIStyle()
	local hud = GetHUD()
	if hud then
		hud:InitControls()
	end
end

function OnMsg.GamepadUIStyleChanged()
	UpdateHUDUIStyle()
end

OnMsg.MouseConnected = UpdateHUDUIStyle
OnMsg.MouseDisconnected = UpdateHUDUIStyle

function HUD:UpdateHUDButtons()
	local defs = HUD.button_definitions
	for _, id in ipairs(HUD.button_list) do
		local button_def = defs[id]
		local ctrl = self[id]
		if button_def.enabled then 
			ctrl:SetEnabled(button_def.enabled(self))
			if not ctrl.enabled then
				ctrl:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 255}
			else
				ctrl:RemoveModifier("desat")
			end
			if button_def.rollover and button_def.rollover.update then
				XUpdateRolloverWindow(ctrl)
			end
		end
	end	
end

function HUD:UpdateTimeButtons()
	local factor = GetTimeFactor()
	local paused = IsPaused() or factor == 0
	self.idPause:SetToggled(paused)
	self.idPlay:SetToggled(not paused and factor > 0 and factor <= const.DefaultTimeFactor)
	self.idMedium:SetToggled(not paused and factor > const.DefaultTimeFactor and factor < const.DefaultTimeFactor * const.fastGameSpeed)
	self.idFast:SetToggled(not paused and factor >= const.DefaultTimeFactor * const.fastGameSpeed)
end

function HUDUpdateTimeButtons()
	local dlg = GetHUD()
	if dlg then
		dlg:UpdateTimeButtons()
	end
end

function HUD:SetCtrlRollover(ctrl, descr_t)
	if descr_t.rollover then
		local rollover = descr_t.rollover
		ctrl:SetRolloverTitle(T{rollover.title, UICity})
		ctrl:SetRolloverText(T{rollover.descr, UICity})
		ctrl:SetRolloverHint(GetUIStyleGamepad() and rollover.hint_gamepad and T{rollover.hint_gamepad, UICity} or rollover.hint and T{rollover.hint, UICity} or "")
		local disabled_rollover = descr_t.rollover_disabled
		if disabled_rollover then
			local descr = disabled_rollover.descr
			if type(descr) == "function" then
				descr = descr()
			end
			ctrl:SetRolloverDisabledText(T{descr, UICity})
			ctrl:SetRolloverDisabledTitle(T{disabled_rollover.title, UICity})
		end
	end
end

function OnMsg.NewHour(hour)
	local dlg = GetHUD()
	if dlg then
		local defs = HUD.button_definitions
		for _, id in ipairs(HUD.button_list) do
			local button_def = defs[id]
			if button_def.rollover and button_def.rollover.update then
				XUpdateRolloverWindow(dlg[id])
			end
		end
	end
end

function OnMsg.NewMinute(hour, minute)
	local dlg = GetHUD()
	if dlg then
		dlg:SetDayProgress(hour * const.MinutesPerHour + minute)
	end
end

function OnMsg.NewDay(day)
	local dlg = GetHUD()
	if dlg then
		dlg.idSol:SetText(T{4031, "Sol <day>", day=day})
	end
end

GlobalVar("UISpeedState", "play")

function ChangeGameSpeedState(delta)
	local states = {"pause", "play", "medium", "fast"}
	local idx = table.find(states, UISpeedState)
	local new_state = states[Clamp(idx + delta, 1, #states)]
	SetGameSpeedState(new_state)
end

function SetGameSpeedState(speed)
	HintDisable("HintGameSpeed")
	local hud = GetHUD()
	if not hud then
		return
	end
	if speed == "pause" then
		hud.idPause:Press()
	elseif speed == "play" then
		hud.idPlay:Press()
	elseif speed == "medium" then
		hud.idMedium:Press()
	elseif speed == "fast" then
		hud.idFast:Press()
	end
end

function TogglePause()
	local factor = GetTimeFactor() / const.DefaultTimeFactor
	if UICity then
		if factor == 0 then
			UICity:SetGameSpeed() -- restore to last speed
		else
			UICity:SetGameSpeed(0)
		end
	end
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Overlays"
end

DefineClass.HUDButton =
{
	__parents = {"XToggleButton"},
	
	HAlign = "center",
	VAlign = "center",
	ColumnsUse = "abaa",
	RolloverTemplate = "Rollover",
	MouseCursor = "UI/Cursors/Rollover.tga",
	ToggledBackground = RGBA(255,255,255,255),
	DisabledBackground = RGBA(255,255,255,255),
	FXMouseIn = "UIButtonMouseIn",
	FXPressDisabled = "UIDisabledButtonPressed",
}

function HUDButton:OnChange(toggled)
	self.Row = not toggled and 1 or Min(self.Rows, 2)
	self:Invalidate()
end

DefineClass.HUDSpeedControlButton =
{
	__parents = {"HUDButton"},
	
	Rows = 2,
	FXMouseIn = "SpeedControlMouseOver",
	Transparency = 237,
}

function GetHUD()
	return GetXDialog("HUD")
end
