local M = 1000000
DefineClass.ModItemMissionSponsor = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem", "DynamicPropertiesObject" },
	properties = {
		{ category = "General", id = "display_name", name = T(1000067, "Display Name"), editor = "text", default = "", translate = true},
		{ category = "General", id = "challenge_mod", name = T(3491, "Challenge Mod (%)"), editor = "number", default = 0},
		{ category = "General", id = "funding", name = T(3492, "Starting Funding (M)"), editor = "number", default = const.StartFunding},
		{ category = "General", id = "funding_per_tech", name = T(3493, "Tech Funding (M)"),              default = 0,                help = T(3494, "Funding earned for each Tech researched"), editor = "number", modifiable = true },
		{ category = "General", id = "funding_per_breakthrough", name = T(3495, "Breakthrough Funding (M)"), default = 0,                help = T(3496, "Funding earned for each Breakthrough Tech researched"), editor = "number", modifiable = true },
		{ category = "General", id = "applicants_per_breakthrough", name = T(3497, "Breakthrough applicants"), default = 0,                help = T(3498, "Applicants earned for each Breakthrough Tech researched"), editor = "number", modifiable = true },
		{ category = "General", id = "cargo", name = T(3499, "Cargo Capacity"), editor = "number", default = const.StartCargoCapacity},
		{ category = "General", id = "initial_rockets", name = T(3500, "Starting Rockets"), editor = "number", default = 2},
		{ category = "General", id = "rocket_price", name = T(6840, "Rocket price (M)"), editor = "number", default = 3000*M, scale = M, min = 0, help = T(6841, "Specify 0 to disable buying")},
		{ category = "General", id = "applicants_price", name = T(6842, "Applicants price (M)"), editor = "number", default = 0, scale = M, min = 0, help = T(6841, "Specify 0 to disable buying")},
		{ category = "General", id = "initial_techs_unlocked", name = T(3503, "Starting Techs to research"), editor = "number", default = 3, help = T(3504, "Number of initially available Techs to research")},
		{ category = "General", id = "trait", name = T(3505, "Trait given to colonists"), editor = "dropdownlist", default = "", items = function() return TraitsCombo() end },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T(3506, "Bonus Breakthrough Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T(3507, "Bonus event Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T(3508, "Bonus free Tech Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "additional_research_points", name = T(8754, "Additional research points per Sol"), editor = "number", default = 0},
		{ category = "General", id = "additional_colonists_per_rocket", name = T(8755, "Increase max colonists per rocket"), editor = "number", default = 0},
		{ category = "General", id = "additional_initial_applicants", name = T(8756, "Additional starting applicants"), editor = "number", default = 0},
		{ category = "General", id = "effect", name = T(3509, "Effect"), editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "flavor", name = T(3510, "Flavor text"), editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "filter", name = T(1000108, "Filter"), editor = "expression", parameters = "self", default = function() return true end,},
		{ category = "General", id = "default_skin", name = T(7968, "Default Dome Skin"), editor = "dropdownlist", default = "", items = DomeSkinsPresetsCombo},
		{ category = "General", id = "game_apply", name = T(8022, "Game Apply"), editor = "func", params = "self, city", default = function(self, city) end, },
		{ category = "General", id = "FreeSpaceLeft", name = T(8494, "Free Space Left"), editor = "number", default = 0, read_only = true, dont_save = true, help = "Shows how much cargo space is left, after taking into account the initial cargo loadout" },
		
		{ category = "Parameters", id = "param1", editor = "number", default = 0},
		{ category = "Parameters", id = "param2", editor = "number", default = 0},
		{ category = "Parameters", id = "param3", editor = "number", default = 0},
		{ category = "Parameters", id = "param4", editor = "number", default = 0},
		{ category = "Parameters", id = "param5", editor = "number", default = 0},
		
		{ category = "Technologies", id = "tech1", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech2", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech3", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech4", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech5", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
	},
	EditorMenubarName = "",
}

function ModItemMissionSponsor:GetDynamicProperties(properties)
	ForEachPreset("Cargo", function(cargo, group, self, props)
		local id = cargo.id
		rawset(self, id, rawget(self, id) or 0)
		properties[#properties + 1] = {
			category = "Rocket Cargo: " .. cargo.group, 
			id = cargo.id, name = cargo.name,
			editor = "number", default = 0, min = 0
		}
	end, self, properties)
	return properties
end

function OnMsg.ClassesBuilt()
	do
		for i=1,const.MissionSponsorPriceModifiers do
			table.iappend(ModItemMissionSponsor.properties, {
				{ category = "Price Modifiers", id = "modifier_name" .. i,  name = T{3541, "Modifier name <number>", number = i}, editor = "combo", default = "", items = ResupplyItemsCombo },
				{ category = "Price Modifiers", id = "modifier_value" .. i, name = T{3542, "Modifier value <number>", number = i}, editor = "number", default = 0},
			})
		end
		for i=1,const.MissionSponsorLockModifiers do
			table.iappend(ModItemMissionSponsor.properties, {
				{ category = "Lock Modifiers", id = "lock_name" .. i,  name = T{8691, "Cargo <number>", number = i}, editor = "combo",         default = "", items = ResupplyItemsCombo },
				{ category = "Lock Modifiers", id = "lock_value" .. i, name = T{8692, "Status <number>", number = i}, editor = "dropdownlist", default = false, items = LockStatusCombo},
			})
		end
		for i=1,const.MissionSponsorNations do
			table.iappend(ModItemMissionSponsor.properties, {
				{ category = "Sponsor Nations", id = "sponsor_nation_name" .. i,    name = T{3543, "Sponsor nation name <number>", number = i}, editor = "combo", default = "",items = Nations },
				{ category = "Sponsor Nations", id = "sponsor_nation_percent" .. i, name = T{3544, "Sponsor nation percent <number>", number = i}, editor = "number", default = 0},
			})
		end
	end
end

function ModItemMissionSponsor:OnModLoad()
	local mod = self.mod
	local obj = {
		id = self.name,
		name = self.name,
		SortKey = 1000000, --put those after our sponsors
		display_name = self.display_name,
		challenge_mod = self.challenge_mod,
		funding = self.funding,
		funding_per_tech = self.funding_per_tech,
		funding_per_breakthrough = self.funding_per_breakthrough,
		applicants_per_breakthrough = self.applicants_per_breakthrough,
		cargo = self.cargo,
		initial_rockets = self.initial_rockets,
		rocket_price = self.rocket_price,
		applicants_price = self.applicants_price,
		initial_techs_unlocked = self.initial_techs_unlocked,
		trait = self.trait,
		anomaly_bonus_breakthrough = self.anomaly_bonus_breakthrough,
		anomaly_bonus_event = self.anomaly_bonus_event,
		anomaly_bonus_free_tech = self.anomaly_bonus_free_tech,
		additional_research_points = self.additional_research_points,
		additional_colonists_per_rocket = self.additional_colonists_per_rocket,
		additional_initial_applicants = self.additional_initial_applicants,
		effect = self.effect,
		flavor = self.flavor,
		filter = self.filter,
		default_skin = self.default_skin,
		game_apply = self.game_apply,
		param1 = self.param1,
		param2 = self.param2,
		param3 = self.param3,
		param4 = self.param4,
		param5 = self.param5,
		tech1 = self.tech1,
		tech2 = self.tech2,
		tech3 = self.tech3,
		tech4 = self.tech4,
		tech5 = self.tech5,
		mod = mod,
	}
	for i=1,const.MissionSponsorPriceModifiers do
		obj["modifier_name" .. i] = self:GetProperty("modifier_name" .. i)
		obj["modifier_value" .. i] = self:GetProperty("modifier_value" .. i)
	end
	for i=1,const.MissionSponsorLockModifiers do
		obj["lock_name" .. i] = self:GetProperty("lock_name" .. i)
		obj["lock_value" .. i] = self:GetProperty("lock_value" .. i)
	end
	for i=1,const.MissionSponsorNations do
		obj["sponsor_nation_name" .. i] = self:GetProperty("sponsor_nation_name" .. i)
		obj["sponsor_nation_percent" .. i] = self:GetProperty("sponsor_nation_percent" .. i)
	end
	ForEachPreset("Cargo", function(cargo, group, self, props)
		if cargo.locked then return end
		obj[cargo.id] = rawget(self, cargo.id)
	end, self)
	local new = ModItemMissionSponsorPreset:new(obj)
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end

------------------------------------------------------------

--[[ Backwards compatibility for TechEffect_ModifyLabelOverTime, which might have saved the commander profile
and calls GetIdentifier() on it]]
DefineClass.CommanderProfile = {}
function CommanderProfile:GetIdentifier()
	return self.name
end

DefineClass.ModItemCommanderProfile = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "display_name", name = T(1000067, "Display Name"), editor = "text", default = "", translate = true},
		{ category = "General", id = "challenge_mod", name = T(3491, "Challenge Mod (%)"), editor = "number", default = 0},
		{ category = "General", id = "effect", name = T(1000017, "Description"), editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "filter", name = T(1000108, "Filter"), editor = "expression", parameters = "self", default = function() return true end,},
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T(3506, "Bonus Breakthrough Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T(3507, "Bonus event Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T(3508, "Bonus free Tech Anomalies"), editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "bonus_rockets", name = T(3511, "Bonus Rockets"), editor = "number", default = 0, min = 0 },
		{ category = "General", id = "additional_research_points", name = T(8754, "Additional research points per Sol"), editor = "number", default = 0},
		{ category = "General", id = "additional_colonists_per_rocket", name = T(8755, "Increase max colonists per rocket"), editor = "number", default = 0},
		{ category = "General", id = "additional_initial_applicants", name = T(8756, "Additional starting applicants"), editor = "number", default = 0},
		{ category = "General", id = "game_apply", name = T(8022, "Game Apply"), editor = "func", params = "self, city", default = function(self, city) end,},
		{ category = "Parameters", id = "param1", editor = "number", default = 0},
		{ category = "Parameters", id = "param2", editor = "number", default = 0},
		{ category = "Parameters", id = "param3", editor = "number", default = 0},
		{ category = "Parameters", id = "param4", editor = "number", default = 0},
		{ category = "Parameters", id = "param5", editor = "number", default = 0},
		{ category = "Technologies", id = "tech1", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech2", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech3", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech4", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech5", name = T(3, "Grant Research"), editor = "combo", default = "", items = TechCombo },
	},
	EditorMenubarName = "",
}

function ModItemCommanderProfile:OnModLoad()
	local mod = self.mod
	local new = ModItemCommanderProfilePreset:new{
		id = self.name,
		name = self.name,
		SortKey = 1000000, --put those after our commanders
		display_name = self.display_name,
		challenge_mod = self.challenge_mod,
		effect = self.effect,
		filter = self.filter,
		anomaly_bonus_breakthrough = self.anomaly_bonus_breakthrough,
		anomaly_bonus_event = self.anomaly_bonus_event,
		anomaly_bonus_free_tech = self.anomaly_bonus_free_tech,
		bonus_rockets = self.bonus_rockets,
		additional_research_points = self.additional_research_points,
		additional_colonists_per_rocket = self.additional_colonists_per_rocket,
		additional_initial_applicants = self.additional_initial_applicants,
		game_apply = self.game_apply,
		param1 = self.param1,
		param2 = self.param2,
		param3 = self.param3,
		param4 = self.param4,
		param5 = self.param5,
		tech1 = self.tech1,
		tech2 = self.tech2,
		tech3 = self.tech3,
		tech4 = self.tech4,
		tech5 = self.tech5,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end