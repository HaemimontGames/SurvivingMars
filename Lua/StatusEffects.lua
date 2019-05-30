function GetTopPriorityStatusEffect(unit)
	local status_effects = unit.status_effects
	for _,effect in ipairs(StatusEffectsList) do
		if status_effects[effect] then
			return effect
		end
	end
end

function UpdateAttachedSign(unit, forceadd)
	local new_status_effect = GetTopPriorityStatusEffect(unit)
	local old_status_effect = unit.status_effect_sign
	
	if new_status_effect==old_status_effect and not forceadd then 
		return 
	end
	
	unit.status_effect_sign = new_status_effect
	
	if HasSelectionArrow(unit) then	
		SelectionArrowUpdate(unit)
		return
	end
	
	local oldSign = old_status_effect and g_Classes[old_status_effect].sign
	if oldSign and (unit:CountAttaches(oldSign) > 0) then
		unit:DestroyAttaches(oldSign)
	end
	local newSign =  new_status_effect and g_Classes[new_status_effect].sign
	if newSign then
		local part = AttachToObject(unit, newSign, "Origin")
		part:SetScale(const.SignsOverviewCameraScaleDown)
	end
	local visible = unit.status_effect_sign_visible and g_SignsVisible
	unit:ForEachAttach("UnitSign", CObject.SetVisible, visible)
end

DefineClass.StatusEffect =  {
	__parents = { "PropertyObject"},
	display_name = T(3868, "Status effect"),
	description = "",
	display_icon = "", --in infopanel
	sign = "", -- sign placed on top 
	priority = 0,
	popup_on_first = false, -- display popup notification the first time a unit is affected by this
	popup_display_delay = const.HourDuration / 10, -- don't display the message right away if it's a momentary condition causing the effect 
	popup_group_delay = 9*const.HourDuration, -- don't display similar messages one after another for that time
	popup_group = "",
	move_anim = false,
}

function StatusEffect:Start(unit, start)
end

function StatusEffect:Stop(unit)
end

function StatusEffect:HourlyUpdate(unit, start, hours)
end

function StatusEffect:DailyUpdate(unit, start, hours)
end

-------------------------------------------------------------
DefineClass.StatusEffect_Homeless =  {
	__parents = { "StatusEffect"},
	display_name = T(3869, "Homeless"),
	description = T(3870, "Homeless Colonist"),
	sign = "UnitSignHomeless",
	selection_arrow = "UnitArrowHomeless",
	priority = 75,
}

DefineClass.StatusEffect_Unemployed =  {
	__parents = { "StatusEffect"},
	display_name = T(6859, "Unemployed"),
	description = T(6860, "Unemployed Colonist"),
	sign = "UnitSignUnemployed",
	selection_arrow = "UnitArrowUnemployed",
	priority = 45,
}

DefineClass.StatusEffect_Shock = {
	__parents = { "StatusEffect" },	
	damage = 0,
	damage_pct_hour = 0,
	sanity_damage_percent = 15,
	move_anim = "moveDepressed",
	force_start = false,
	unique_status_number = 1234,
}

local shock_grace_min = const.ShockGraceMin and const.ShockGraceMin / const.HourDuration or 12
local shock_grace_duration = Max(0, (const.ShockGraceMax and const.ShockGraceMax / const.HourDuration or 36) - shock_grace_min)

function StatusEffect_Shock:HourlyUpdate(unit, start, hours)
	local grace_hours = shock_grace_min + BraidRandom(unit.handle, shock_grace_duration)
	if self.force_start or hours > grace_hours then
		local damage = self.damage + unit.stat_health * self.damage_pct_hour / 100
		local unique_seed = unit.handle + self.unique_status_number --unique number per unit per status effect
		if unit.traits.Survivor then
			damage = MulDivRound(damage, 50 + BraidRandom(unique_seed, TraitPresets.Survivor.param), 100)
		else
			damage = MulDivRound(damage, 100 + BraidRandom(unique_seed, 200), 100)
		end	
		unit:ChangeHealth(-damage, self.class)
	end
end

function StatusEffect_Shock:DailyUpdate(unit, start, hours)
	unit:ChangeSanity(-self.sanity_damage_percent * unit.stat_sanity / 100, self.class)
end

function StatusEffect_Shock:Start(unit, time, force)
	self.force_start = not not force
	unit:CalcMoveAnim()
end

function StatusEffect_Shock:Stop(unit)
	unit:CalcMoveAnim()
end

----

DefineClass.StatusEffect_Irradiated =  {
	__parents = { "StatusEffect_Shock"},
	display_name = T(6861, "Irradiated"),
	description = T(6862, "Loses health over time."),
	sign = "UnitSignIrradiated",
	selection_arrow = "UnitArrowIrradiated",
	priority = 75,
	unique_status_number = 1934,
	damage_pct_hour = 5,
}

----

DefineClass.StatusEffect_Suffocating = {
	__parents = { "StatusEffect_Shock"},
	display_name = T(3871, "Suffocating"),
	description = T(3872, "Suffocating Colonist"),
	priority = 100,
	sign = "UnitSignSuffocating",
	selection_arrow = "UnitArrowSuffocating",
	popup_on_first = "FirstStatusEffect_Suffocating",
	popup_group = "FirstStatusEffect",
	
	damage = 100*const.Scale.Stat/const.HoursPerDay,
	move_anim = "moveSuffocation",
	unique_status_number = 1334,
}

DefineClass.StatusEffect_Suffocating_Outside = {
	__parents = { "StatusEffect_Suffocating"},
	popup_on_first = false,
	damage = 200*const.Scale.Stat/const.HoursPerDay,
	unique_status_number = 1434,
}

---------------------------------------------------
DefineClass.StatusEffect_Dehydrated = {
	__parents = { "StatusEffect_Shock"},
	display_name = T(3873, "Dehydrated"),
	description = T(3874, "Dehydrated Colonist"),
	sign = "UnitSignThirsty",
	selection_arrow = "UnitArrowThirsty",
	priority = 90,
	popup_on_first = "FirstStatusEffect_Dehydrated",
	popup_group = "FirstStatusEffect",
	
	damage = 50*const.Scale.Stat/const.HoursPerDay,
	unique_status_number = 1534,
}

DefineClass.StatusEffect_Dehydrated_Outside = {
	__parents = { "StatusEffect_Dehydrated"},
	popup_on_first = false,
}

----------------------------------
DefineClass.StatusEffect_Freezing = {
	__parents = { "StatusEffect_Shock"},
	display_name = T(3875, "Freezing"),
	description = T(3876, "Freezing Colonist"),
	sign = "UnitSignFreezing",
	selection_arrow = "UnitArrowFreezing",
	priority = 95,
	popup_on_first = "FirstStatusEffect_Freezing",
	popup_group = "FirstStatusEffect",
	
	damage = 100*const.Scale.Stat/const.HoursPerDay,
	move_anim = "moveFreezing",
	unique_status_number = 1634,
}

---------------------------
GlobalVar("g_StarvingColonists", {})
GlobalGameTimeThread("StarvingColonistsNotif", function()
	HandleNewObjsNotif(g_StarvingColonists, "StarvingColonists")
end)

DefineClass.StatusEffect_Starving = {
	__parents = { "StatusEffect_Shock"},
	display_name = T(3877, "Starving"),
	sign = "UnitSignStarving",
	selection_arrow = "UnitArrowHungry",
	priority = 85,
	popup_on_first = "FirstStatusEffect_Starving",
	popup_group = "FirstStatusEffect",
	
	damage = 25*const.Scale.Stat/const.HoursPerDay,
	unique_status_number = 1734,
}

function StatusEffect_Starving:Start(unit, time)
	StatusEffect_Shock.Start(self,unit, time)
	g_StarvingColonists[#g_StarvingColonists + 1] = unit
end

function StatusEffect_Starving:Stop(unit, time)
	StatusEffect_Shock.Stop(self,unit, time)
	table.remove_entry(g_StarvingColonists, unit)
end

function OnMsg.LoadGame()
	if not g_StarvingColonists then
		g_StarvingColonists = { }
		for i,colonist in ipairs(UICity.labels.Colonist or empty_table) do
			if colonist.status_effects["StatusEffect_Starving"] then
				g_StarvingColonists[#g_StarvingColonists + 1] = colonist
			end
		end
	end
end

---------------------------
DefineClass.StatusEffect_StressedOut = {
	__parents = { "StatusEffect" },
	display_name = T(3878, "Stressed Out"),
	sign = "UnitSignInsane",
	selection_arrow = "UnitArrowInsane",
	priority = 60,
	popup_on_first = "FirstStatusEffect_StressedOut",
	popup_group = "FirstStatusEffect",
	expire_after_hours = 3*const.HoursPerDay,
	sanity_recovery = 50*const.Scale.Stat,
}

function StatusEffect_StressedOut:DailyUpdate(unit, start, hours)
	if hours >= self.expire_after_hours then
		unit:Affect(self.class, false)
		unit:UpdateEmploymentLabels()
	end
end

function StatusEffect_StressedOut:Start(unit, time)
	unit:SetWorkplace(false)
end

function StatusEffect_StressedOut:Stop(unit)
	unit:ChangeSanity(self.sanity_recovery, "StatusEffect_StressedOut")
end

---------------------------
GlobalVar("g_EarthSickColonists", {})
GlobalGameTimeThread("EarthSickColonistsNotif", function()
	HandleNewObjsNotif(g_EarthSickColonists, "EarthSickColonists")
end)

DefineClass.StatusEffect_Earthsick = {
	__parents = { "StatusEffect" },
	display_name = T(3879, "Earthsick"),
	sign = "UnitSignEarthsick",
	selection_arrow = "UnitArrowEarthsick",
	priority = 50,
}

function StatusEffect_Earthsick:Start(unit, time)
	unit:SetWorkplace(false)
	g_EarthSickColonists[#g_EarthSickColonists + 1] = unit
end

function StatusEffect_Earthsick:Stop(unit, time)
	unit:UpdateEmploymentLabels()
	table.remove_entry(g_EarthSickColonists,unit)
end

StatusEffectsList = {}
StatusEffectsShock = {}

ColonistTraitsWarnings = {
	["Renegade"]                 = T(8946, "This Colonist is a Renegade. Renegades will cause trouble, unless countered by Security Stations."),
	["Infected"]                 = T(8947, "This Colonist is infected and will lose Health over time."),
}
ColonistStatusEffectsWarnings = {
	["StatusEffect_Irradiated"]  = T(8948, "This Colonist is irradiated and will lose Health over time."),
	["StatusEffect_Suffocating"] = T(8949, "This Colonist is suffocating and needs Oxygen to survive."), 
	["StatusEffect_Dehydrated"]  = T(8950, "This Colonist is dehydrated and needs Water to survive."), 
	["StatusEffect_Freezing"]    = T(8951, "This Colonist is freezing. Restore Dome Power to resolve the issue."), 
	["StatusEffect_Starving"]    = T(8952, "This Colonist is starving and needs Food to survive."),
	["StatusEffect_StressedOut"] = T(8953, "This Colonist is stressed out due to low Sanity and temporarily unable to work."), 
	["StatusEffect_Earthsick"]   = T(8954, "This Colonist is Earthsick due to low comfort. Earthsick colonists can't work and will try to return to Earth."),
}

ColonistStatusEffectsWarnings.StatusEffect_Dehydrated_Outside = ColonistStatusEffectsWarnings.StatusEffect_Dehydrated
ColonistStatusEffectsWarnings.StatusEffect_Suffocating_Outside = ColonistStatusEffectsWarnings.StatusEffect_Suffocating

IronColonistsColonistStatusEffectsWarningsOverrides = {
	["StatusEffect_Suffocating"] = T(10533, "This Colonist is suffocating and would have needed Oxygen to survive if not for the Iron Colonists rule."),
	["StatusEffect_Dehydrated"] = T(10534, "This Colonist is dehydrated and would have needed Water to survive if not for the Iron Colonists rule."),
	["StatusEffect_Starving"] = T(10535, "This Colonists is starving and would have needed Food to survive if not for the Iron Colonists rule."),
}

IronColonistsColonistStatusEffectsWarningsOverrides.StatusEffect_Dehydrated_Outside = IronColonistsColonistStatusEffectsWarningsOverrides.StatusEffect_Dehydrated
IronColonistsColonistStatusEffectsWarningsOverrides.StatusEffect_Suffocating_Outside = IronColonistsColonistStatusEffectsWarningsOverrides.StatusEffect_Suffocating

function GetColonistStatusEffectWarning(status_effect)
	return IsGameRuleActive("IronColonists") and IronColonistsColonistStatusEffectsWarningsOverrides[status_effect] or ColonistStatusEffectsWarnings[status_effect]
end

function GetDetrimentalTraits()
	return table.keys(ColonistTraitsWarnings)
end

function GetDetrimentalStatusEffects()
	return table.keys(ColonistStatusEffectsWarnings)
end

function OnMsg.ClassesBuilt()
	StatusEffectsList = ClassDescendantsList("StatusEffect")
	table.sort(StatusEffectsList, function(c1, c2) 
		if _G[c1].priority == _G[c2].priority then
			return c1 < c2
		end
		return _G[c1].priority > _G[c2].priority
	end)
	ForEachDescendantClass("StatusEffect_Shock", function(name, class)
		StatusEffectsShock[name] = true
	end)
end