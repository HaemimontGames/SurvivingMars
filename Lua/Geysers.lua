DefineClass.DontBuildHere =
{
	__parents = { "Object" },
	
	terrain_idx = false,
	is_tall = true
}

function DontBuildHere:Init()
	self.terrain_idx = GetTerrainTextureIndex("Spider")
end

function DontBuildHere:Check(pos)
	local q, r = WorldToHex(pos)
	return HexGridGetObject(ObjectGrid, q, r, "DontBuildHere") == self
end

function DontBuildHere:MarkGeyser(bbox)
	Geysers_FillObjectGrid(ObjectGrid, bbox, self.terrain_idx, self.handle)
end

GlobalVar("g_DontBuildHere", false)

local GeyserQuery_func = function(victim, damage_sanity, target_dust, martianborn_strength)
	if terrain.GetTerrainType(victim:GetVisualPos()) == g_DontBuildHere.terrain_idx then
		if IsKindOf(victim, "Colonist") then
			local traits = victim.traits
			if not (martianborn_strength and traits.Martianborn) then
				local coward_factor = traits.Coward and 2 or 1
				victim:ChangeSanity(-damage_sanity*coward_factor, "geyser")
			end
		elseif not IsObjInDome(victim) then
			victim:AddDust(target_dust)
		end
	end
end

local QueryBuilding_func = function(bld, target_dust, point, radius)
	if not bld:IsCloser2D(point, radius + bld:GetRadius()) then
		return
	elseif IsKindOfClasses(bld, "Dome", "LifeSupportGridElement", "ElectricityGridElement") or not IsObjInDome(bld) then
		bld:AddDust(target_dust)
	end
end

function GeyserLogic(marker, descr)
	local pos = marker:GetPos()
	local radius = marker.FeatureRadius
	local size = point(radius, radius)
	local bbox = box(pos - size, pos + size)
	g_DontBuildHere:MarkGeyser(bbox)
	
	local warm_up, geysers, spiders, dust = {}, {}, {}, {}
	local opacity_start = {}
	
	local objects = MapGet(pos, radius, "GeyserObject")
	for _, obj in ipairs(objects) do
		if obj:IsKindOf("GeyserWarmup") then
			table.insert(warm_up, obj)
		elseif obj:IsKindOf("GeyserBurstOut") then
			table.insert(geysers, obj)
		elseif obj:IsKindOf("DecSpider") then
			table.insert(spiders, obj)
			opacity_start[obj] = obj:GetOpacity()
		elseif obj:IsKindOf("DecDust") then
			table.insert(dust, obj)
			opacity_start[obj] = obj:GetOpacity()
		end
	end
	
	local function set_opacity(objects, opacity, time)
		for _, obj in ipairs(objects) do
			if IsValid(obj) then
				obj:SetOpacity(opacity, time)
			end
		end
	end
	
	local function restore_opacity(objects, time)
		for _, obj in ipairs(objects) do
			if IsValid(obj) then
				obj:SetOpacity(opacity_start[obj], time)
			end
		end
	end
	
	local function play_fx(objects, fx, moment)
		for _, obj in ipairs(objects) do
			if IsValid(obj) then
				PlayFX(fx, moment, obj, marker)
			end
		end
	end
	
	while UICity do
		-- wait while dormant
		local time_dormant = UICity:Random(descr.dormant_min, descr.dormant_max)

		-- start cooling down of decals opacity
		local cool_op_time = Min(descr.cool_op_time, time_dormant)
		restore_opacity(spiders, cool_op_time)
		restore_opacity(dust, cool_op_time)
		Sleep(time_dormant)
		
		-- warming up - increase spiders opacity
		local time_warning = UICity:Random(descr.warning_min, descr.warning_max)
		play_fx(warm_up, "WarmUp", "start")
		set_opacity(spiders, descr.warm_opacity, time_warning)
		Sleep(time_warning)
		play_fx(warm_up, "WarmUp", "end")
		
		-- active phase
		local time_active = UICity:Random(descr.active_min, descr.active_max)
		play_fx(geysers, "BurstOut", "start")
		set_opacity(dust, descr.warm_opacity, descr.dust_op_time)
		local time, dt = 0, 1000
		while time < time_active do
			MapForEach(pos, radius,"Colonist", "Drone", "BaseRover", GeyserQuery_func, descr.damage_sanity, descr.target_dust, UICity:IsTechResearched("MartianbornStrength"))
			MapForEach(pos, radius, "Building", QueryBuilding_func, descr.target_dust, pos, radius )
			local delta = Min(time_active - time, dt)
			Sleep(delta)
			time = time + delta
		end
		play_fx(geysers, "BurstOut", "end")		
	end
end

function OnMsg.NewMapLoaded()
	if not mapdata.GameLogic then return end
	g_DontBuildHere = DontBuildHere:new{}
end

DefineClass.PrefabFeatureChar_Geyser =
{
	__parents = { "PrefabFeatureChar" },
	properties =
	{
		{ category = "Geyser",	name = T(3598, "Dormant Min"),				id = "dormant_min",		editor = "number",	default = 72 * const.HourDuration,	scale = const.HourDuration,	help = "Min duration of the dormant phase, in hours" },
		{ category = "Geyser",	name = T(3599, "Dormant Max"),				id = "dormant_max",		editor = "number",	default = 192 * const.HourDuration,	scale = const.HourDuration,	help = "Max duration of the dormant phase, in hours" },
		{ category = "Geyser",	name = T(3600, "Active Min"),				id = "active_min",		editor = "number",	default = 24 * const.HourDuration,	scale = const.HourDuration,	help = "Min duration of the active phase, in hours" },
		{ category = "Geyser",	name = T(3601, "Active Max"),				id = "active_max",		editor = "number",	default = 72 * const.HourDuration,	scale = const.HourDuration,	help = "Max duration of the active phase, in hours" },
		{ category = "Geyser",	name = T(3602, "Warning Min"),				id = "warning_min",		editor = "number",	default = 10 * const.HourDuration,	scale = const.HourDuration,	help = "Min duration of the warning phase, in hours" },
		{ category = "Geyser",	name = T(3603, "Warning Max"),				id = "warning_max",		editor = "number",	default = 12 * const.HourDuration,	scale = const.HourDuration,	help = "Max duration of the warning phase, in hours" },
		{ category = "Geyser",	name = T(3604, "Warm Opacity"),				id = "warm_opacity",	editor = "number",	default = 100	,	help = "Opacity level for spider/dust decals after warming has finished" },
		{ category = "Geyser",	name = T(3605, "Dust Opacity Time"),		id = "dust_op_time",	editor = "number",	default = 25000,	help = "Time for reaching warm opacity for dust decals" },
		{ category = "Geyser",	name = T(3606, "Cool Down Opacity Time"),id = "cool_op_time",	editor = "number",	default = 24 * const.HourDuration,	scale = const.HourDuration,	help = "Time for cooling opacity down for spider/dust decals" },
		{ category = "Geyser",	name = T(3607, "Sanity/Sec Damage"),		id = "damage_sanity",	editor = "number",	default = 1000,	help = "How fast colonists lose sanity" },
		{ category = "Geyser",	name = T(8495, "Dust/Sec"),		                id = "target_dust",	editor = "number",	default = 50,	help = "Dust accumulation per sec" },
	},
	CanBePlaced = false,
	damage_battery = 0,
}

function PrefabFeatureChar_Geyser:GetDescription()
	local hd = const.HourDuration
	return string.format("Geyser (%dh,%dh)-(%dh,%dh)", self.dormant_min / hd, self.dormant_max / hd, self.active_min / hd, self.active_max / hd)
end

function PrefabFeatureChar_Geyser:GameLogic(marker)
	CreateGameTimeThread(GeyserLogic, marker, self)
end

DefineClass.GeyserObject = { __parents = { "Object" } }

DefineClass.BaseGeyser =
{
	__parents = { "Object", "EditorEntityObject", "GeyserObject" },
	entity = "InvisibleObject",
	editor_entity = "WayPointBig",
	
	properties =
	{
		{ category = "Particles", id = "BurstOut", name = "Burst Out", editor = "text", default = "", buttons = {{"Start", "ActionBurstOutStart"}, {"Stop", "ActionBurstOutEnd"}} },
	},
	
	play_fx = "",
	base_geyser_class = "BaseGeyser",
}

function BaseGeyser:GameInit()
	PlayFX("GeyserSpawn", "start", self)
end

function BaseGeyser:Done()
	PlayFX("GeyserSpawn", "end", self)
end

function BaseGeyser:GetMarker()
	local geysers = MapGet(true, "PrefabFeatureMarker", function(marker)
		return marker:GetDist2D(self) <= marker.FeatureRadius
	end)
	assert(#geysers > 0, "No C02 Jets marker around")
	
	return geysers[1]
end

function BaseGeyser:GetMarkers(C02_marker, class)
	return MapGet(C02_marker:GetPos(), C02_marker.FeatureRadius, class )
end

function BaseGeyser:ActionBurstOutStart(obj)
	local C02_marker = obj:GetMarker()
	local markers = obj:GetMarkers(C02_marker, obj.base_geyser_class)
	for _, m in ipairs(markers) do PlayFX(m.play_fx, "start", m, C02_marker) end
end

function BaseGeyser:ActionBurstOutEnd(obj)
	local C02_marker = obj:GetMarker()
	local markers = obj:GetMarkers(C02_marker, obj.base_geyser_class)
	for _, m in ipairs(markers) do PlayFX(m.play_fx, "end", m, C02_marker) end
end

DefineClass.DecGeyser =
{
	__parents = { "BakedTerrainDecal", "GeyserObject" },
	flags = { efBakedTerrainDecal = false, efVisible = true },
}

DefineClass.GeyserBurstOut = { __parents = { "BaseGeyser" }, play_fx = "BurstOut", base_geyser_class = "GeyserBurstOut" }
DefineClass.DecSpider = { __parents = { "DecGeyser" } }
DefineClass.DecDust = { __parents = { "DecGeyser" } }
DefineClass.BaseWarmup = { __parents = { "BaseGeyser" }, play_fx = "WarmUp", base_geyser_class = "BaseWarmup" }

DefineClass("GeyserWarmup", "BaseWarmup")
DefineClass("Geyser_01", "GeyserBurstOut")
DefineClass("Geyser_02", "GeyserBurstOut")
DefineClass("Geyser_03", "GeyserBurstOut")
DefineClass("DecSpider_01", "DecSpider")
DefineClass("DecSpider_02", "DecDust")
