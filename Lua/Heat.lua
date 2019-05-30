if FirstLoad then
	lerp_grid_thread = false
end

function OnMsg.DoneMap()
	lerp_grid_thread = false
end

GlobalVar("s_Heaters", {})
GlobalVar("g_HeatGrid", false)
GlobalVar("s_HeatGridTarget", false)
GlobalVar("HeatChanged", false)
PersistableGlobals.s_HeatGridTarget = nil -- don't save this, we can rebuild it

local map_border = const.HeatGridBorder
local grid_tile = const.HeatGridTileSize
local max_heat = const.MaxHeat
local heat_step_percent = 1
local heat_step_min = 1
local Heat_Get = Heat_Get

function GetHeatAtXY(x, y)
	return Heat_Get(x, y, g_HeatGrid, map_border, grid_tile)
end

function GetHeatAt(obj)
	return Heat_Get(obj, g_HeatGrid, map_border, grid_tile)
end

function GetAverageHeatIn(area)
	return Heat_Average(area, g_HeatGrid, map_border, grid_tile)
end

function GetAverageHeatShape(shape, obj)
	return Heat_AverageInShape(shape, obj, g_HeatGrid, map_border, grid_tile)
end

function OnHeatGridChanged()
	HeatChanged = true
	if IsValidThread(lerp_grid_thread) then
		return
	end
	SetIceStrength(GetSceneParam("IceStrength"), "LerpHeatGrid")
	lerp_grid_thread = CreateMapRealTimeThread(WaitLerpFinish)
end

----

DefineClass.BaseHeater =
{
	__parents = { "InitDone" },
	heat = 0,
	is_static = false,
	max_neighbors = 0,
}

function BaseHeater:GetHeatRange()
	return 0
end

function BaseHeater:Done()
	self:ApplyHeat(false)
	self.heat = 0
end

local function ApplyHeatForm(heater, heat, center_x, center_y, radius, border, progress)
	radius = radius or 0
	border = border or 0
	progress = progress or -1
	return heater:ApplyForm(s_HeatGridTarget, heat, center_x, center_y, radius - border / 2, border, map_border, grid_tile, progress)
end

function BaseHeater:GetHeatCenter()
	return self:GetVisualPosXYZ()
end

function BaseHeater:GetHeatBorder()
end

function BaseHeater:OnSetWorking(working)
	self:ApplyHeat(working)
end

function BaseHeater:ApplyHeat(apply)
	if not g_HeatGrid or not s_HeatGridTarget then
		return
	end
	local new_info, heat, center_x, center_y, radius, border, progress
	local info = s_Heaters[self]
	if apply then
		if info and self.is_static then
			return
		end
		heat = self.heat
		center_x, center_y = self:GetHeatCenter()
		radius = self:GetHeatRange()
		border = self:GetHeatBorder()
		new_info = {-heat, center_x, center_y, radius, border}
		if info then
			if table.iequals(new_info, info) then
				return
			end
			self:ApplyHeat(false)
		end
	else
		if not info or self.is_static then
			return
		end
		heat, center_x, center_y, radius, border, progress = table.unpack(info)
	end
	s_Heaters[self] = new_info
	if heat ~= 0 then
		local new_progress = ApplyHeatForm(self, heat, center_x, center_y, radius, border, progress)
		if new_info and new_progress then
			new_info[6] = new_progress
		end
		OnHeatGridChanged()
	end
end

function BaseHeater:ApplyForm(grid, heat, center_x, center_y, radius, border, map_border, grid_tile, progress)
	return Heat_AddCircle(grid, center_x, center_y, radius, heat, border, map_border, grid_tile, progress)
end

function OnMsg.ClassesPostprocess()
	local heaters = ClassDescendants("BaseHeater")
	local min_heat, max_heat = 0, 0
	for name, def in pairs(heaters) do
		assert(def.heat ~= 0)
		if def.heat > 0 then
			max_heat = max_heat + (1 + def.max_neighbors) * def.heat
		else
			min_heat = min_heat - (1 + def.max_neighbors) * def.heat
		end
	end
	assert(max_heat < (2<<15))
	assert(min_heat < (2<<15))
end

local function FixHeatValues()
	for heater, info in pairs(s_Heaters) do
		assert(heater.heat == GetClassValue(heater, "heat"))
		info[1] = -heater.heat
	end
end

----

DefineClass.RangeElConsumer =
{
	__parents = { "ElectricityConsumer", "UIRangeBuilding" },
}

function RangeElConsumer:UpdateElectricityConsumption()
	assert(self.disable_electricity_consumption == 0, "RangeElConsumer and disabling electricity consumption both change the base electricity_consumption value. These two logics should not intersect.")
	local range = self.UIRange
	local prop_meta = self:GetPropertyMetadata("UIRange")
	local min_range = prop_meta.min
	local template = ClassTemplates.Building[self.template_name]
	self:SetBase("electricity_consumption", MulDivRound(range * range, template.electricity_consumption, min_range * min_range))
end

----

DefineClass.SubsurfaceHeater =
{
	__parents = { "BaseHeater", "RangeElConsumer", "LifeSupportConsumer", "OutsideBuildingWithShifts" },
	heat = 5*max_heat, -- compensate cold wave + cold area + 2 spheres
	properties =
	{
		-- prop only for UI purposes
		{id = "UIRange", name = T(643, "Range"), editor = "number", default = 5, min = 3, max = 15, no_edit = true, dont_save = true},
	},
	UIRange = 5,
	max_neighbors = 6,
}

function SubsurfaceHeater:GameInit()
	self:UpdateElectricityConsumption()
end

function SubsurfaceHeater:GetHeatRange()
	return 10 * self.UIRange * guim
end

function SubsurfaceHeater:GetHeatBorder()
	return const.SubsurfaceHeaterFrameRange
end

function SubsurfaceHeater:OnPostChangeRange()
	if self:CanWork() then
		self:ApplyHeat(true)
	end
	self:UpdateElectricityConsumption()
end

function WaitLerpFinish()
	while g_HeatGrid and s_HeatGridTarget do
		local game_speed = IsPaused() and 0 or GetTimeFactor()
		if game_speed == 0 then
			WaitMsg("MarsResume", 200)
		else
			local err, changed = AsyncLerpHeatGrid(g_HeatGrid, s_HeatGridTarget, heat_step_percent, heat_step_min)
			if err or not changed then
				if err then
					print("LerpHeatGrid error: ", err)
				end
				HeatChanged = false
				break
			end
			hr.TR_UpdateHeatGrid = 1
			Sleep(200 * (1000 / game_speed))
		end
	end
	SetIceStrength(0, "LerpHeatGrid")
end

local function ApplyHeaters(static)
	for heater, info in pairs(s_Heaters) do
		if static and heater.is_static or not static and not heater.is_static then
			local heat, center_x, center_y, radius, border = table.unpack(info)
			local progress = ApplyHeatForm(heater, -heat, center_x, center_y, radius, border)
			info[6] = progress
		end
	end
end

function CreateHeatGrids()
	local width, height = terrain.GetMapSize()
	width = width - 2 * map_border
	height = height - 2 * map_border
	if width <= 0 or height <= 0 then
		return 0, 0
	end
	local grid_width = width / grid_tile + ((width % grid_tile) == 0 and 0 or 1)
	local grid_height = height / grid_tile + ((height % grid_tile) == 0 and 0 or 1)
	if not g_HeatGrid then
		g_HeatGrid = NewGrid(grid_width, grid_height, 8, max_heat)
	end
	if not s_HeatGridTarget then
		s_HeatGridTarget = NewGrid(grid_width, grid_height, 16, const.HeatZeroTarget + max_heat)
		FixHeatValues()
		ApplyHeaters(true)
		Msg("ApplyHeaters", s_HeatGridTarget)
		ApplyHeaters(false)
	end
	InitHeatGrid(g_HeatGrid, map_border)
end

function OnMsg.ChangeMap()
	if g_HeatGrid then
		DoneHeatGrid()
	end
end

function OnMsg.NewMap()
	CreateHeatGrids()
end

function City:InitHeat()
	if not mapdata.GameLogic then return end
	AsyncLerpHeatGrid(g_HeatGrid, s_HeatGridTarget, 100)
	hr.TR_UpdateHeatGrid = 1
end

function OnMsg.LoadGame()
	CreateHeatGrids()
	hr.TR_UpdateHeatGrid = 1
	if HeatChanged then
		OnHeatGridChanged()
	end
end

----

DefineClass.ColdSensitive = {
	__parents = { "BaseBuilding"},

	properties = {
		{ template = true, name = T(664, "Penalty Heat"),         id = "penalty_heat",            category = "Cold", editor = "number", default = const.DefaultPanaltyHeat, min = 0, max = const.MaxHeat, slider = true, help = "Heat at which the cold penalty is applied" },
		{ template = true, name = T(665, "Penalty Percent"),      id = "penalty_pct",             category = "Cold", editor = "number", default = const.DefaultPanaltyPct,  min = 0, max = 300, slider = true, help = "Cold penalty percents" },
		{ template = true, name = T(666, "Freeze Time"),          id = "freeze_time",             category = "Cold", editor = "number", default = const.DefaultFreezeTime,  scale = const.HourDuration, help = "Freeze time if under the freeze heat" },
		{ template = true, name = T(8526, "Defrost Time"),        id = "defrost_time",            category = "Cold", editor = "number", default = const.DefaultDefrostTime, scale = const.HourDuration, help = "Defrost time if above the freeze heat" },
		{ template = true, name = T(667, "Freeze Heat"),          id = "freeze_heat",             category = "Cold", editor = "number", default = const.DefaultFreezeHeat,  min = 0, max = const.MaxHeat, slider = true, help = "Below that heat the building begins to freeze" },
	},
	
	is_electricity_consumer = false, --el consumer child flips this
	cold_mod = false,
	
	freeze_progress = 0,
}

function ColdSensitive:SetFrozen(frozen)
	frozen = frozen or false
	if self.frozen == frozen then
		return
	end
	if frozen then
		self.frozen = true
		self.city:AddToLabel("Frozen", self)
		self:UpdateWorking(false)
	else
		self.frozen = false
		self.city:RemoveFromLabel("Frozen", self)
		self:UpdateWorking()
	end
	self:AttachSign(frozen, "SignNotWorking")
	self:OnFrozenStateChanged()
	RebuildInfopanel(self)
end

function ColdSensitive:OnFrozenStateChanged()
end

function ColdSensitive:GetColdPenalty()
	local penalty = IsGameRuleActive("WinterIsComing") and g_ColdWave and 2*self.penalty_pct or self.penalty_pct
	return IsValid(self) and not IsObjInDome(self) and GetHeatAt(self) < self.penalty_heat and penalty or 0
end

function ColdSensitive:IsFreezing()
	return IsValid(self) and not IsObjInDome(self) and GetHeatAt(self) < self.freeze_heat
end

function ColdSensitive:BuildingUpdate(delta)
	local old_progress = self.freeze_progress
	local new_progress
	if self:IsFreezing() then
		new_progress = Min(old_progress + delta, self.freeze_time)
	elseif self.defrost_time > 0 then
		new_progress = Max(old_progress - MulDivRound(delta, self.freeze_time, self.defrost_time), 0)
	else
		new_progress = 0
	end
	if old_progress ~= new_progress then
		self.freeze_progress = new_progress
		if not self.frozen and new_progress == self.freeze_time then
			self:SetFrozen(true)
		elseif self.frozen and new_progress == 0 then
			self:SetFrozen(false)
			self:SetMalfunction()
		end
	end
end

function ColdSensitive:GetFreezeProgress()
	return MulDivRound(100, self.freeze_progress, self.freeze_time)
end

function ColdSensitive:GetFreezeStatus()
	if self.frozen then
		return self:IsFreezing() and T(8527, "Frozen") or T(8528, "Desfrosting")
	else
		return self:IsFreezing() and T(3875, "Freezing") or ""
	end
end

function ColdSensitive:CheatUnfreeze()
	self:SetFrozen(false)
end

function FreezeEntireMap()
	hr.RenderIce = 1
	SetIceStrength(100, "debug", nil, 0, 0)
	Heat_SetAmbient(g_HeatGrid, 100)
	hr.TR_UpdateHeatGrid = 1
end

function UnfreezeEntireMap()
	hr.RenderIce = 0
	SetIceStrength(0, "debug")
end