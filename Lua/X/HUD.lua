DefineClass.HUD = 
{
	__parents = { "XDrawCacheDialog" },
	FocusOnOpen = "",
	
	last_highlight = false,
	ZOrder = 50,
}

function HUD:Open(...)
	self.idDayProgress.idProgress:SetTileFrame(true)
	
	self:CreateThread("update_stats", function()
		while UICity do
			self:UpdateTimeButtons()
			self:UpdateHUDButtons()
			Sleep(1000)
		end
	end)
	
	self:UpdateUIStyle()
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

--safe area margins

function HUD:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	local margins = GetSafeMargins()
	self:SetMargins(HUD.Margins + margins)
	self.idtxtConstructionStatus:SetPadding(box(-margins:minx(), -margins:miny(), 0, 0))
end

function HUD:UpdateUIStyle()
	local visible = not GetUIStyleGamepad() or UseHybridControls()
	self.idMiddle:SetVisible(visible)
	self.idRight:SetVisible(visible)
end

function OnMsg.SafeAreaMarginsChanged()
	local hud = GetHUD()
	if hud then
		hud:RecalculateMargins()
	end
end

--gamepad mode

local function UpdateHUDUIStyle()
	local hud = GetHUD()
	if hud then
		hud:UpdateUIStyle()
	end
end

function OnMsg.GamepadUIStyleChanged()
	UpdateHUDUIStyle()
end

OnMsg.ControlSchemeChanged = UpdateHUDUIStyle
OnMsg.MouseConnected = UpdateHUDUIStyle
OnMsg.MouseDisconnected = UpdateHUDUIStyle

--hint highlighting

local HUDElementsWithHintHighlights

function HUD:UpdateHintHighlight(force)
	if not HUDElementsWithHintHighlights then
		HUDElementsWithHintHighlights = { }
		for name, child in ipairs(self) do
			if type(name) == "string" and IsKindOf(child, "XWindow") and string.ends_with(name, "Highlight") then
				local base_name = string.sub(name, 1, -9 - 1) --"Highlight" is 9 chars long
				HUDElementsWithHintHighlights[base_name] = name
			end
		end
	end

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

--buttons & controls

function OnMsg.NewDay(day)
	local dlg = GetHUD()
	if dlg then
		dlg.idSol:SetText(T{4031, "Sol <day>", day=day})
	end
end

function OnMsg.NewMinute(hour, minute)
	local dlg = GetHUD()
	if dlg then
		dlg:SetDayProgress(hour * const.MinutesPerHour + minute)
	end
end

local day_start = 6 * const.MinutesPerHour
local day_end = 20 * const.MinutesPerHour
local day_length = const.HoursPerDay * const.MinutesPerHour
function HUD:SetDayProgress(value)
	local remapped_value = MulDivRound(value, 1000, day_length)
	self.idDayProgress:SetProgress(remapped_value)
	
	local image
	if value > day_start and value < day_end then
		image = "UI/HUD/day_shine.tga"
	else
		image = "UI/HUD/night_shine.tga"
	end	
	self.idDayProgress:SetSeparatorImage(image)
end

function HUDUpdateTimeButtons()
	local dlg = GetHUD()
	if dlg then
		dlg:UpdateTimeButtons()
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

function HUD.UpdateDesatModifier(ctrl)
	if not ctrl:GetEnabled() then
		ctrl:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 255}
	else
		ctrl:RemoveModifier("desat")
	end
end

function HUD:UpdateHUDButtons()
	ObjModified(self)
end

--button callbacks

function HUD.idBuildOnPress()
	if not GetUIStyleGamepad() then
		g_BuildMenuHUDClicksCount = g_BuildMenuHUDClicksCount + 1
	end
	ToggleXBuildMenu(false, "close")
end

function HUD.idOverviewOnPress()
	ToggleOverviewMode()
end

function HUD.idResupplyOnPress()
	if not IsValidThread(CameraTransitionThread) then
		OpenDialog("Resupply")
	end
end

function HUD.idResearchOnPress()
	OpenResearchDialog()
end

function HUD:GetCurrentResearchName()
	local current_research = UICity and UICity:GetResearchInfo()
	return current_research and TechDef[current_research].display_name or T(6868, "None")
end

function HUD:GetCurrentResearchProgress()
	return UICity:GetResearchProgress()
end

function HUD.idColonyControlCenterOnPress()
	OpenCommandCenter()
end

function HUD.idMilestonesOnPress()
	if GetDialog("Milestones") then
		CloseDialog("Milestones")
	else
		OpenDialog("Milestones")
	end
end

function HUD.idGoalsOnPress()
	OpenDialog("MissionProfileDlg")
end

function HUD.idPlanetaryViewOnPress()
	if GetDialog("PlanetaryView") then
		CloseDialog("PlanetaryView")
	else
		OpenPlanetaryView()
	end
end

function HUD.idRadioOnPress()
	OpenDialog("RadioStationDlg")
end

function HUD.idMenuOnPress()
	OpenIngameMainMenu()
end

--others

GlobalVar("UISpeedState", "play")

function ChangeGameSpeedState(delta)
	local states = {"pause", "play", "medium", "fast"}
	local idx = table.find(states, UISpeedState)
	local new_idx = Clamp(idx + delta, 1, #states)
	if new_idx ~= idx then
		local new_state = states[new_idx]
		SetGameSpeedState(new_state)
	end
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

function GetHUD()
	return GetDialog("HUD")
end

DefineClass.HUDButton = {
	__parents = { "XWindow" },
	properties = {
		{ category = "HUD", id = "Image", editor = "text", default = "" },
		{ category = "HUD", id = "ImageShine", editor = "text", default = "" },
		{ category = "HUD", id = "FXMouseIn", editor = "text", default = "UIButtonMouseIn" },
		{ category = "HUD", id = "FXPress", editor = "text", default = "" },
		{ category = "HUD", id = "Rows", editor = "number", default = 1 },
		{ category = "HUD", id = "OnPress", editor = "func", params = "self, gamepad" },
		{ category = "HUD", id = "OnContextUpdate", editor = "func", params = "self, context, ..." },
		{ category = "HUD", id = "ImageScale", editor = "number", default = 1000 },
	},
}

function HUDButton:OnContextUpdate(context, ...)
end

function HUDButton:OnPress(gamepad)
end

function HUDButton:Open()
	local win = self
	local btn = win[1]
	local img = win[2]
	
	local id = win.Id
	win:SetId("")
	btn:SetId(id)
	img:SetId(id .. "Highlight")
	
	btn:SetImage(self.Image)
	img:SetImage(self.ImageShine)
	btn:SetFXPress(self.FXPress)
	btn:SetRows(self.Rows)
	btn:SetOnPress(self.OnPress)
	btn:SetOnContextUpdate(self.OnContextUpdate)
	btn:SetImageScale(point(self.ImageScale, self.ImageScale))
	
	btn:SetRolloverText(self.RolloverText)
	btn:SetRolloverDisabledText(self.RolloverDisabledText)
	btn:SetRolloverTitle(self.RolloverTitle)
	btn:SetRolloverDisabledTitle(self.RolloverDisabledTitle)
	btn:SetRolloverHint(self.RolloverHint)
	btn:SetRolloverHintGamepad(self.RolloverHintGamepad)
end
