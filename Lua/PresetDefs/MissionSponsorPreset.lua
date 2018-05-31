-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

DefineClass.MissionSponsorPreset = {
	__parents = { "Preset", "GameEffectsContainer", "DynamicPropertiesObject", },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "funding", name = T{3492, "Starting Funding (M)"}, 
			editor = "number", default = 4000, },
		{ category = "General", id = "funding_per_tech", name = T{3493, "Tech Funding (M)"}, help = T{3494, "Funding earned for each Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "funding_per_breakthrough", name = T{3495, "Breakthrough Funding (M)"}, help = T{3496, "Funding earned for each Breakthrough Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "applicants_per_breakthrough", name = T{3497, "Breakthrough applicants"}, help = T{3498, "Applicants earned for each Breakthrough Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "cargo", name = T{3499, "Cargo Capacity"}, 
			editor = "number", default = 35000, },
		{ category = "General", id = "initial_rockets", name = T{3500, "Starting Rockets"}, 
			editor = "number", default = 2, },
		{ category = "General", id = "rocket_price", name = T{6840, "Rocket price (M)"}, help = T{6841, "Specify 0 to disable buying"}, 
			editor = "number", default = 3000000000, scale = "mil", min = 0, },
		{ category = "General", id = "applicants_price", name = T{6842, "Applicants price (M)"}, help = T{6841, "Specify 0 to disable buying"}, 
			editor = "number", default = 0, scale = "mil", min = 0, },
		{ category = "General", id = "initial_techs_unlocked", name = T{3503, "Starting Techs to research"}, help = T{3504, "Number of initially available Techs to research"}, 
			editor = "number", default = 3, },
		{ category = "General", id = "trait", name = T{3505, "Trait given to colonists"}, 
			editor = "choice", default = "", items = function (self) return TraitsCombo() end, },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "effect", name = T{3509, "Effect"}, 
			editor = "text", default = false, translate = true, lines = 4, },
		{ category = "General", id = "flavor", name = T{3510, "Flavor text"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "default_skin", name = T{7968, "Default Dome Skin"}, 
			editor = "choice", default = "", items = function (self) return DomeSkinsPresetsCombo() end, },
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, 
			editor = "func", default = function (self)
return
end, params = "self, city", },
		{ category = "General", id = "GetDefaultRocketSkin", 
			editor = "func", default = function (self)
return nil
end, },
		{ category = "General", id = "FreeSpaceLeft", name = T{8494, "Free Space Left"}, help = T{925675045550, "Shows how much cargo space is left, after taking into account the initial cargo loadout"}, 
			editor = "number", default = 0, dont_save = true, read_only = true, },
		{ category = "Parameters", id = "param1", help = T{580081009511, "Arbitrary parameter you can reference from code as self.param1"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param2", help = T{859041574780, "Arbitrary parameter you can reference from code as self.param2"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param3", help = T{915618200154, "Arbitrary parameter you can reference from code as self.param3"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param4", help = T{237226183718, "Arbitrary parameter you can reference from code as self.param4"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param5", help = T{882655721960, "Arbitrary parameter you can reference from code as self.param5"}, 
			editor = "number", default = 0, },
		{ category = "Technologies", id = "tech1", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech2", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech3", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech4", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech5", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Goal", id = "goal", name = T{8076, "Goal"}, 
			editor = "choice", default = "", items = function (self) return ClassDescendantsCombo("MissionGoal") end, },
		{ category = "Goal", id = "goal_timeout", name = T{8077, "Timeout (Sols)"}, 
			editor = "number", default = 100, min = 1, },
		{ category = "Goal", id = "goal_target", name = T{8078, "Target"}, 
			editor = "number", default = 0, },
	},
	HasGroups = false,
	HasSortKey = true,
	
}

DefineModItemPreset("MissionSponsorPreset")

function MissionSponsorPreset:GetDynamicProperties(properties)
	for i=1,const.MissionSponsorPriceModifiers do
		properties[#properties + 1] = { category = "Price Modifiers", id = "modifier_name" .. i,  name = T{3541, "Modifier name <number>", number = i}, editor = "combo", default = "", items = ResupplyItemsCombo }
		properties[#properties + 1] = { category = "Price Modifiers", id = "modifier_value" .. i, name = T{3542, "Modifier value <number>", number = i}, editor = "number", default = 0}
	end
	for i=1,const.MissionSponsorLockModifiers do
		properties[#properties + 1] = { category = "Lock Modifiers", id = "lock_name" .. i,  name = T{8691, "Cargo <number>", number = i}, editor = "combo",         default = "", items = ResupplyItemsCombo }
		properties[#properties + 1] = { category = "Lock Modifiers", id = "lock_value" .. i, name = T{8692, "Status <number>", number = i}, editor = "choice", default = false, items = LockStatusCombo}
	end
	for i=1,const.MissionSponsorNations do
		properties[#properties + 1] = { category = "Sponsor Nations", id = "sponsor_nation_name" .. i,    name = T{3543, "Sponsor nation name <number>", number = i}, editor = "combo", default = "",items = Nations }
		properties[#properties + 1] = { category = "Sponsor Nations", id = "sponsor_nation_percent" .. i, name = T{3544, "Sponsor nation percent <number>", number = i}, editor = "number", default = 0}
	end
	ForEachPreset("Cargo", function(cargo, group, self, props)
		if cargo.locked then return end
		local id = cargo.id
		rawset(self, id, rawget(self, id) or 0)
		properties[#properties + 1] = {
			category = "Rocket Cargo: " .. cargo.group, 
			id = cargo.id, name = cargo.name,
			editor = "number", default = 0, min = 0,
			group = cargo.group,
		}
	end, self, properties)
	return properties
end

function MissionSponsorPreset:GetFreeSpaceLeft()
	local loadout_weight = 0
	local props = self:GetProperties()
	for _, prop in ipairs(props) do
		local item = CargoPreset[prop.id]
		if item then
			local weight = self[item.id] / item.pack * item.kg
			loadout_weight = loadout_weight + weight
		end
	end
	return self.cargo - loadout_weight
end

ModItemMissionSponsorPreset.EditorName = "Mission Sponsor"
