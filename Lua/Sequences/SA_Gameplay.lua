DefineDataInstance("Label",
	{
		{ id = "display_name", name = T{1153, "Display Name"}, editor = "text", translate = true, default = "" },
		{ id = "building", name = T{3702, "A building label"}, editor = "bool", default = true },
	},
	"Editors.Game", "Labels")
	
function GetBuildingLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	for _, label in ipairs(DataInstances.Label) do 
		if label.building and not used[label.name] then
			table.insert(ret, { value = label.name, text = label.display_name } )
			used[label.name] = true
		end
	end
	for name, template in pairs(ClassTemplates.Building) do
		if not used[name] then
			table.insert(ret, { value = name, text = template.display_name } )
			used[name] = true
		end
		if not used[template.class] then
			table.insert(ret, { value = template.class, text = template.class } )
			used[template.class] = true
		end
		local default_label = g_Classes[template.class].default_label
		if default_label and default_label ~= "" and not used[default_label] then
			table.insert( ret, { value = default_label, text = default_label } )
			used[default_label] = true
		end
		local i = 1
		while true do
			if not template:HasMember("label"..i) then break end
			if template["label"..i] ~= "" then
				if not used[template["label"..i]] then
					table.insert(ret, { value = template["label"..i], text = template["label"..i] } )
					used[template["label"..i]] = true
				end
			end
			i = i + 1
		end
	end
	for _, category in ipairs(BuildCategories) do 
		if not used[category.id] then
			table.insert(ret, { value = category.id, text = category.name } )
			used[category.id] = true
		end
	end
	return ret
end

function GetBuildingLabelsCombo()
	local ret = GetBuildingLabels()
	SortLabelsByText(ret)
	return ret
end

function GetDepositLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	if not used["SurfaceDeposit"] then
		table.insert(ret, {value = "SurfaceDeposit", text = "SurfaceDeposit"})
		used["SurfaceDeposit"] = true
	end
	if not used["Anomally"] then
		table.insert(ret, {value = "Anomally", text = "Anomally"})
		used["Anomally"] = true
	end
	if not used["SubsurfaceDeposit"] then
		table.insert(ret, {value = "SubsurfaceDeposit", text = "SubsurfaceDeposit"})
		used["SubsurfaceDeposit"] = true
	end
	if not used["TerrainDeposit"] then
		table.insert(ret, {value = "TerrainDeposit", text = "TerrainDeposit"})
		used["TerrainDeposit"] = true
	end
	return ret
end

function GetBuildingAndDepositLabelsCombo()
	local ret, used = {}, {}
	GetBuildingLabels(ret, used)
	GetDepositLabels(ret, used)
	SortLabelsByText(ret)
	return ret
end

local trait_prefix = "Trait: "  -- if you change this, also find/replace values in sequences

function GetColonistLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	for _, label in ipairs(DataInstances.Label) do 
		if not label.building and not used[label.name] then
			table.insert(ret, { value = label.name, text = label.display_name } )
			used[label.name] = true
		end
	end
	ForEachPreset(TraitPreset, function(trait, group_list)
		table.insert(ret, { value = trait_prefix .. trait.id, text = T{3703, "Trait: <display_name>", trait} })
	end)
	table.insert(ret, { value = "Working-age", text = T{7906, "Working-age Colonists"} })
	return ret
end

function GetObjectsByLabel(label)
	if label == "Working-age" then
		local ret = {}
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			table.append(ret, dome.labels.Youth)
			table.append(ret, dome.labels.Adult)
			table.append(ret, dome.labels["Middle Aged"])
		end
		return ret
	elseif label:starts_with(trait_prefix) then
		label = label:sub(#trait_prefix + 1)
		local ret = {}
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			table.append(ret, dome.labels[label])
		end
		return ret
	else
		return UICity.labels[label]
	end
end

function CountLabel(label)
	if label:starts_with(trait_prefix) then
		label = label:sub(#trait_prefix + 1)
		local ret = 0
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			ret = ret + #(dome.labels[label] or empty_table)
		end
		return ret
	else
		return #UICity.labels[label]
	end
end

function GetDomeLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	if not used["Dome"] then
		table.insert(ret, {value = "Dome", text = "Domes"})
		used["Dome"] = true
	end
	return ret
end

function GetDroneLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	if not used["Drone"] then
		table.insert(ret, {value = "Drone", text = "Drones"})
		used["Drone"] = true
	end
	return ret
end

function GetDroneHubLabels(ret, used)
	local ret = ret or {}
	local used = used or {}
	if not used["DroneHub"] then
		table.insert(ret, {value = "DroneHub", text = "Drone Hubs"})
		used["DroneHub"] = true
	end
	if not used["RCRover"] then
		table.insert(ret, {value = "RCRover", text = "Drone Hubs"})
		used["RCRover"] = true
	end
	return ret
end

function SortLabelsByText(labels)
	table.sort(labels, function(a, b) return (IsT(a.text) and _InternalTranslate(a.text) or a.text) < (IsT(b.text) and  _InternalTranslate(b.text) or b.text) end)
end

function SortLabelsByValue(labels)
	table.sort(labels, function(a, b) return a.value < b.value end)
end

GlobalVar( "BuildMenuPrerequisiteOverrides", {} )

BuildMenuPrerequisitesBehavior = {
	{ value = "always", text = T{3704, "Always Available"} },
	{ value = "never", text = T{3705, "Not Available"} },
	{ value = "default", text = T{3706, "Use Game Logic"} },
}

DefineClass.SA_ControlBuildingPrerequisites = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetBuildingLabelsCombo() end, default = "" },
		{ id = "Behavior", name = T{3707, "Behavior"}, editor = "dropdownlist", items = BuildMenuPrerequisitesBehavior, default = "default" },
		{ id = "DisableReason", name = T{3708, "Disable reason"}, help = "If not available, what to show in the build menu as a rollover explanation", editor = "text", translate = true, default = T{3709, "This building has been disabled"} },
	},
	Menu = "Gameplay",
	MenuName = "Control Building Prerequisites",
}

function SA_ControlBuildingPrerequisites:ShortDescription()
	return string.format( "Force build menu prerequisite for %s: %s", self.Label, self.Behavior)
end

function SA_ControlBuildingPrerequisites:WarningsCheck(seq_player, seq, registers)
	if self.Label == "" then
		seq_player:Error(self, "Unspecified label")
	end
end

function SA_ControlBuildingPrerequisites:Exec(seq_player, ip, seq, registers)
	local override
	if self.Behavior == "always" then
		override = true
	elseif self.Behavior == "never" then
		override = self.DisableReason
	end
	BuildMenuPrerequisiteOverrides[self.Label] = override
end

DefineClass.SA_ForEachBuilding = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetBuildingLabelsCombo() end, default = "" },
		{ id = "Number", name = T{3710, "Number"}, editor = "text", default = "-1" },
	},
}

function SA_ForEachBuilding:Process(seq_player, registers, building)
	assert(not "please implement this in a base class")
end

function SA_ForEachBuilding:Exec(seq_player, ip, seq, registers)
	local buildings = UICity.labels[self.Label]
	if not buildings or not(next(buildings)) then return end
	local number = seq_player:Eval("return " .. self.Number, registers)
	if number == -1 or number >= #buildings then
		for _,building in ipairs(buildings) do
			self:Process(seq_player, registers, building)
		end
	else
		local affected = {}
		for i=1,number do
			local r
			repeat
				r = 1 + UICity:Random(#buildings)
			until not affected[r]
			affected[r] = true
		end
		for i,_ in pairs(affected) do
			self:Process(seq_player, registers, buildings[i])
		end
	end
end

DefineClass.SA_DamageBuildings = {
	__parents = { "SA_ForEachBuilding" },
	properties = {
		{ id = "Demolish", name = T{3711, "Demolish"}, editor = "bool", default = false },
	},
	Menu = "Gameplay",
	MenuName = "Damage Buildings",
}

function SA_DamageBuildings:Process(seq_player, registers, building)
	if self.Demolish then
		if not building.demolishing then
			building:ToggleDemolish()
		end
	else
		building:SetMalfunction()
	end
end

function SA_DamageBuildings:ShortDescription()
	return string.format( "Damage %s buildings of %s", self.Number == "-1" and "all" or tostring(self.Number), self.Label)
end

DefineClass.SA_DustBuildings = {
	__parents = { "SA_ForEachBuilding" },
	properties = {
		{ id = "Dust", name = T{3712, "Amount of dust"}, editor = "number", default = 0 },
	},
	Menu = "Gameplay",
	MenuName = "Accumulate Dust",
}

function SA_DustBuildings:Process(seq_player, registers, building)
	building:AddDust(self.Dust)
end

function SA_DustBuildings:ShortDescription()
	if self.Dust >= 0 then
		return string.format( "Add %d dust to buildings of %s", self.Dust, self.Label)
	else
		return string.format( "Clean %d dust from buildings of %s", self.Dust, self.Label)
	end
end

DefineClass.SA_AddDrones = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetDroneHubLabels() end, default = "" },
		{ id = "Number", name = T{3710, "Number"}, help = "-1 to fill", editor = "text", default = "1" },
	},
	Menu = "Gameplay",
	MenuName = "Add Drones",
}

function SA_AddDrones:ShortDescription()
	if self.Number == "-1" then
		return string.format("Drone hubs %s - fill up", self.Label)
	else
		return string.format("Drone hubs %s - add %s drones", self.Label, self.Number)
	end
end

function SA_AddDrones:Exec(seq_player, ip, seq, registers)
	local number = seq_player:Eval("return " .. self.Number, registers)
	local hubs = UICity.labels[self.Label]
	for _, hub in ipairs(hubs) do
		local additional_drones = hub:GetMaxDrones() - #hub.drones
		if number ~= -1 then
			additional_drones = Min(additional_drones, number)
		end
		for i=1,additional_drones do
			hub:SpawnDrone()
		end
	end
end

DefineClass.SA_DamageDrones = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetDroneLabels() end, default = "" },
		{ id = "Number", name = T{3710, "Number"}, help = "-1 to fill", editor = "text", default = "1" },
		{ id = "Destroy", name = T{697, "Destroy"}, editor = "bool", default = false },
	},
	Menu = "Gameplay",
	MenuName = "Damage Drones",
}

function SA_DamageDrones:ShortDescription()
	return string.format( "%s %s drones of %s", self.Destroy and "Destroy" or "Damage", self.Number == "-1" and "all" or tostring(self.Number), self.Label)
end

function SA_DamageDrones:Exec(seq_player, ip, seq, registers)
	local drones = UICity.labels[self.Label]
	local affected
	
	local number = seq_player:Eval("return " .. self.Number, registers)
	if number == -1 or number >= #drones then
		affected = drones
	else
		affected = {}
		for i=1,number do
			local r
			repeat
				r = 1 + UICity:Random(#drones)
			until not affected[r]
			affected[r] = drones[r]
		end
	end
	
	if self.Destroy then
		for i,drone in pairs(affected) do
			DoneObject(drone)
		end
	else
		for i,drone in pairs(affected) do
			drone:AddDust(drone:GetDustMax())
		end
	end
end

DefineClass.SA_AddColonist = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetDomeLabels() end, default = "" },
		{ id = "Number", name = T{3710, "Number"}, editor = "number", default = 1 },
	},
}

function SA_AddColonist:ShortDescription()
	return string.format("Add %d colonists in domes of %s", self.Number, self.Label)
end

function SA_AddColonist:Exec(seq_player, ip, seq, registers)
	local domes = UICity.labels[self.Label]
	for _, dome in ipairs(domes) do
		for i=1,self.Number do
			dome:SpawnColonist()
		end
	end
end

DefineClass.SA_ForEachColonist = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Label", name = T{3689, "Label"}, editor = "dropdownlist", items = function() return GetColonistLabels() end, default = "", help = "If the register property is empty, take colonists from this label" },
		{ id = "Register", name = T{3690, "Register"}, editor = "text", default = "", help = "Register to take colonists from; if empty, take colonists from label" },
		{ id = "Number", name = T{3710, "Number"}, help = "-1 for everyone", editor = "text", default = "-1" },
	},
	
	short_description_verb = "Foreaches",
	Menu = "Gameplay",
	MenuSection = "Colonist",
}

function SA_ForEachColonist:Process(seq_player, registers, colonist)
	assert(not "please implement")
end

function SA_ForEachColonist:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or string.format("label '%s'", self.Label)
	return string.format( "%s %s colonists of %s", self.short_description_verb, self.Number == "-1" and "all" or tostring(self.Number), group)
end

function SA_ForEachColonist:WarningsCheck(seq_player, seq, registers)
	if self.Register == "" and self.Label == "" then
		seq_player:Error(self, "Please specify Register or Label!")
	end
end

function SA_ForEachColonist:Exec(seq_player, ip, seq, registers)
	local colonists
	if self.Register ~= "" then
		colonists = registers[self.Register]
		if IsKindOf(colonists, "Colonist") then
			colonists = { colonists }
		end
	else
		colonists = GetObjectsByLabel(self.Label)
	end
	if not colonists or not(next(colonists)) then return end
	local number = seq_player:Eval("return " .. self.Number, registers)
	if number == -1 or number >= #colonists then
		for _,colonist in ipairs(colonists) do
			self:Process(seq_player, registers, colonist)
		end
	else
		local affected = {}
		for i=1,number do
			local r
			repeat
				r = 1 + UICity:Random(#colonists)
			until not affected[r]
			affected[r] = true
		end
		for i,_ in pairs(affected) do
			self:Process(seq_player, registers, colonists[i])
		end
	end
end

DefineClass.SA_KillColonist = {
	__parents = {"SA_ForEachColonist"},
	properties = {
		{ id = "DeathReason", name = T{3713, "Cause of Death"}, editor = "text", translate = true, default = T{3714, "Killed by unforeseen circumstances"} },
	},
	short_description_verb = "Kills",
	MenuName = "Kill Colonist",
}

function SA_KillColonist:Process(seq_player, registers, colonist)
	colonist:SetCommand("Die", self.DeathReason)
end

DefineClass.SA_ChangeStat = {
	__parents = {"SA_ForEachColonist"},
	properties = {
		{ id = "Stat",   name = T{3715, "Stat"},  editor = "combo", default = "", items = function() return StatCombo()() end, },
		{ id = "Amount", name = T{1000100, "Amount"}, editor = "text", default = tostring(10*const.Scale.Stat), scale = "Stat"},
		{ id = "Duration", name = T{3716, "Duration hours (only for morale, -1 forever)"}, editor = "number", default = 6*const.HourDuration, scale = "Hours"},
		{ id = "MoraleReason", name = T{3717, "Reason for Morale change"}, editor = "text", translate = true, default = "" },
	},
	MenuName = "Satisfy Stat",
}

function SA_ChangeStat:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or string.format("label '%s'", self.Label)
	return string.format( "Satisfy %s colonists of %s: %s with %s", self.Number == "-1" and "all" or tostring(self.Number), group, self.Stat or T{3718, "NONE"}, tostring(self.Amount))
end

function SA_ChangeStat:Process(seq_player, registers, colonist)
	local amount = seq_player:Eval("return " .. self.Amount, registers)
	if self.Stat == "Morale" then
		colonist:SetModifier("base_morale", seq_player, amount, 0, self.MoraleReason ~= "" and self.MoraleReason or nil)
		if self.Duration ~= -1 then
			CreateGameTimeThread( function()
				Sleep(self.Duration * const.HourDuration )
				if IsValid(colonist) then
					colonist:SetModifier("base_morale", seq_player, 0, 0)
				end
			end )
		end
	else
		colonist:ChangeStat(self.Stat, amount, "sequence")
	end
end

DefineClass.SA_MakeSpecialist = {
	__parents = {"SA_ForEachColonist"},
	properties = {
		{ id = "Specialist", name = T{834, "Specialist"}, editor = "combo", default = "none", items = GetColonistSpecializationCombo()},
	},
	MenuName = "Make Specialist",
}

function SA_MakeSpecialist:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or string.format("label '%s'", self.Label)
	return string.format( "Make %s colonists of %s %s specialist",  self.Number == "-1" and "all" or tostring(self.Number), group, self.Specialist)
end

function SA_MakeSpecialist:Process(seq_player, registers, colonist)
	colonist:SetSpecialization(self.Specialist)
end

DefineClass.SA_DemoteSpecialist = {
	__parents = {"SA_ForEachColonist"},
	short_description_verb = "Demote",
	MenuName = "Demote Specialist",
}

function SA_DemoteSpecialist:Process(seq_player, registers, colonist)
	colonist:SetSpecialization("none")
end

--------------------------
DefineClass.SA_ForEachDrone = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Register", name = T{3690, "Register"}, editor = "text", default = "", help = "Register to take colonists from; if empty, take colonists from label" },
		{ id = "Number", name = T{3710, "Number"}, help = "-1 for everyone", editor = "text", default = "-1" },
		{ id = "ExcludeDead", name = T{3719, "Exclude Dead"}, editor = "bool", default = true },
	},
	
	default_label = "Drone",
	default_class = "Drone",
	
	short_description_verb = "Foreaches",
	Menu = "Gameplay",
	MenuSection = "Drone",
}

function SA_ForEachDrone:Process(seq_player, registers, drone)
	assert(not "please implement")
end

function SA_ForEachDrone:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or "all drones"
	return string.format( "%s %s drones of %s", self.short_description_verb, self.Number == "-1" and "all" or tostring(self.Number), group)
end

function SA_ForEachDrone:Exec(seq_player, ip, seq, registers)
	local drones
	if self.Register ~= "" then
		drones = registers[self.Register]
		if IsKindOf(drones, self.default_class) then
			drones = { drones }
		end
	else
		drones = GetObjectsByLabel(self.default_label)
	end	
	if not drones or not(next(drones)) then return end
	if self.ExcludeDead then
		local filtered = {}
		for i = 1, #drones do
			if not drones[i]:IsDead() then
				filtered[#filtered + 1] = drones[i]
			end
		end
		if #filtered == 0 then return end
		drones = filtered
	end
	
	drones = table.ifilter(drones, function(i, d) return not d:GetParent() end) --remove embarked drones from the arr
	
	local number = seq_player:Eval("return " .. self.Number, registers)
	if number == -1 or number >= #drones then
		for _,drone in ipairs(drones) do
			self:Process(seq_player, registers, drone)
		end
	else
		local affected = {}
		for i=1,number do
			local r
			repeat
				r = 1 + UICity:Random(#drones)
			until not affected[r]
			affected[r] = true
		end
		for i,_ in pairs(affected) do
			self:Process(seq_player, registers, drones[i])
		end
	end
end

DefineClass.SA_GoRogue = {
	__parents = {"SA_ForEachDrone"},
	properties = {
		{ id = "Command", name = T{6852, "Command"}, editor = "dropdownlist", default = "GoRogue", items = {"GoRogue", "RogueRevertToNormal" },  },
	},
	
	short_description_verb = "Go Rogue",
	MenuName = "Go Rogue",
}

function SA_GoRogue:Process(seq_player, registers, drone)
	drone:SetCommand(self.Command)
end

DefineClass.SA_HostileRoverCommand = {
	__parents = { "SA_ForEachDrone" },
	
	properties = {
		{ id = "Command", name = T{6852, "Command"}, editor = "dropdownlist", default = "", items = {"Attack", "Malfunction" },  },
		{ id = "Param", name = T{3949, "Parameter"}, editor = "number", default = -1},
	},
	short_description_verb = "Hostile Rover Command",
	MenuName = "Hostile Rover Command",
	
	default_label = "HostileAttackRovers",
	default_class = "AttackRover",
}

function SA_HostileRoverCommand:Process(seq_player, registers, obj)
	if self.Command ~= "" then
		obj:SetCommand(self.Command, self.Param)
	end
end

--------------------------
DefineClass.SA_AddTrait = {
	__parents = {"SA_ForEachColonist"},
	properties = {
		{ id = "Trait", name = T{3720, "Trait"}, editor = "dropdownlist", default = "", items = function() return TraitsCombo(nil, nil, "no specializations") end},
	},
	MenuName = "Add Trait",
}

function SA_AddTrait:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or string.format("label '%s'", self.Label)
	return string.format( "Add %s trait to %s colonists of %s ", self.Trait, self.Number == "-1" and "all" or tostring(self.Number), group )
end

function SA_AddTrait:Process(seq_player, registers, colonist)
	if self.Trait~="" and not colonist.traits[self.Trait] then
		colonist:AddTrait(self.Trait)
	end
end

DefineClass.SA_RemoveTrait = {
	__parents = {"SA_ForEachColonist"},
	properties = {
		{ id = "Trait", name = T{3720, "Trait"}, editor = "dropdownlist", default = "", items = function()return TraitsCombo(nil, nil, "nospecializations") end},
	},
	MenuName = "Remove Trait",
}

function SA_RemoveTrait:Process(seq_player, registers, colonist)
	if self.Trait~="" and colonist.traits[self.Trait] then
		colonist:RemoveTrait(self.Trait)
	end
end

function SA_RemoveTrait:ShortDescription()
	local group = self.Register ~= "" and string.format("reg '%s'", self.Register) or string.format("label '%s'", self.Label)
	return string.format( "Remove %s trait from %s colonists of %s ", self.Trait, self.Number == "-1" and "all" or tostring(self.Number), group )
end
--
DefineClass.SA_AddApplicants = {
	__parents = { "SequenceAction" },
	properties = {
		{ id = "Number", name = T{3710, "Number"}, editor = "text", default = "1" },
		{ id = "Trait",  name = T{3720, "Trait"}, editor = "dropdownlist", default = "", 
			items = function() 
				local traits = TraitsCombo(nil, nil, "no specialziations") 
				table.insert(traits, {value = "random_positive", text = "Random Positive"})
				table.insert(traits, {value = "random_negative", text = "Random Negative"})
				table.insert(traits, {value = "random_rare", text = "Random Rare"})
				table.insert(traits, {value = "random_common", text = "Random Common"})
				table.insert(traits, {value = "random", text = "Random"})
				return traits
			end},
		{ id = "Specialization",  name = T{240, "Specialization"}, editor = "dropdownlist", default = "any", 
			items = function() 
				local items = GetColonistSpecializationCombo("empty")()
				table.insert(items, 1, {value = "any", text = "Random Specialization"})
				return items
			end},
	},
	MenuName = "Add Applicants",
	Menu = "Gameplay",
	MenuSection = "Colonist",
}

function SA_AddApplicants:ShortDescription()
	return string.format( "Add %s applicants to pool with %s trait and %s specialization", self.Number, self.Trait~="" and self.Trait or "random", self.Specialization)
end

function SA_AddApplicants:Exec(seq_player, ip, seq, registers)
	if self.Trait=="" then
		self.Trait = "random"
	end
	if self.Specialization=="" then
		self.Specialization = "any"
	end
	local number = seq_player:Eval("return " .. self.Number, registers)
	local now = GameTime()
	for i=1,number do
		local colonist = GenerateApplicant(now)
		local to_add = self.Trait
		if self.Trait == "random_positive" then
			to_add = GetRandomTrait(colonist.traits, {}, {}, "Positive", "base")
		elseif self.Trait == "random_negative" then
			to_add =  GetRandomTrait(colonist.traits, {}, {}, "Negative", "base")
		elseif self.Trait == "random_rare" then
			to_add =  GetRandomTrait(colonist.traits, {}, {}, "Rare", "base")
		elseif self.Trait == "random_common" then
			to_add =  GetRandomTrait(colonist.traits, {}, {}, "Common", "base")
		elseif self.Trait == "random" then
			to_add = GenerateTraits(colonist, false, 1)
		else
			to_add = self.Trait
		end
		if type(to_add) == "table" then
			for trait in pairs(to_add) do
				colonist.traits[trait] = true
			end
		elseif to_add then
			colonist.traits[to_add] = true
		end
		if self.Specialization ~= "any" then
			colonist.traits[self.Specialization] = true
			colonist.specialist = self.Specialization
		end
	end
end
--------

DefineClass.SA_GrantResearchPts = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "Amount",   name = T{1000100, "Amount"},  editor = "number",       default = 1000,},
		{ id = "Field",    name = T{3721, "Field"},      editor = "dropdownlist", default = "", items = ResearchFieldsCombo },
		{ id = "Research", name = T{311, "Research"},    editor = "dropdownlist", default = "", items = ResearchTechsCombo },
		{ id = "Percent",  name = T{1000099, "Percent"}, editor = "number",       default = 0, help = "Takes priority over 'Amount'" },
	},
	
	Menu = "Research",
	MenuName = "Grant Research Points",
}

function SA_GrantResearchPts:ShortDescription()
	local tech_id = self.Research ~= "" and self.Research or "current"
	if self.Percent ~= 0 then
		return string.format("Grant %d%% from the rest of the points of %s tech", self.Percent, tech_id)
	else
		return string.format("Grant %d points to %s tech", self.Amount, tech_id)
	end
end

function SA_GrantResearchPts:Exec(seq_player, ip, seq, registers)
	local amount = self.Amount
	local tech_id = self.Research ~= "" and self.Research
	if self.Percent ~= 0 then
		local points, max_points
		tech_id, points, max_points = UICity:GetResearchInfo(tech_id)
		amount = MulDivRound(max_points - points, self.Percent, 100)
	end
	UICity:AddResearchPoints(amount, tech_id)
end

--

DefineClass.SA_GrantTech = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "Field",    name = T{3721, "Field"},    editor = "dropdownlist", items = ResearchFieldsCombo, default = "" },
		{ id = "Research", name = T{311, "Research"}, editor = "dropdownlist", items = ResearchTechsCombo,  default = "" },
	},
	
	Menu = "Research",
	MenuName = "Grant Tech",
}

function SA_GrantTech:ShortDescription()
	return string.format("Grant %s in %s", self.Research, self.Field)
end

function SA_GrantTech:Exec(seq_player, ip, seq, registers)
	UICity:SetTechResearched(self.Research, "notify")
end

--

function GrantWonderTech()
	local city = UICity
	local wonder_techs = {}
	for i=1,#BuildingWonders do
		local techs = BuildingTechRequirements[BuildingWonders[i]] or empty_table
		for j=1,#techs do
			local tech = techs[j].tech
			if not city:IsTechResearched(tech) then
				wonder_techs[tech] = true
			end
		end
	end
	local techs_list = table.keys(wonder_techs)
	if #techs_list == 0 then
		local all_techs = Presets.TechPreset.Breakthroughs or ""
		for i = 1, #all_techs do
			local id = all_techs[i].id
			if not city:IsTechResearched(id) then
				techs_list[#techs_list + 1] = id
			end
		end
	end
	local tech_id = city:TableRand(techs_list)
	if not tech_id then
		return
	end
	city:SetTechResearched(tech_id, "notify")
	return tech_id
end

--

DefineClass.SA_GrantTechBoost = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "Field",    name = T{3721, "Field"},    editor = "dropdownlist", items = ResearchFieldsCombo, default = "" },
		{ id = "Research", name = T{311, "Research"}, editor = "dropdownlist", items = ResearchTechsCombo,  default = "" },
		{ id = "Amount",   name = T{1000100, "Amount"},   editor = "number",       default = 0 },
	},
	
	Menu = "Research",
	MenuName = "Grant Tech Boost",
}

function SA_GrantTechBoost:ShortDescription()
	return string.format("Grant %d%% research boost for %s tech in %s", self.Amount, self.Research == "" and "all" or self.Research, self.Field)
end

function SA_GrantTechBoost:Exec(seq_player, ip, seq, registers)
	if self.Research == "" then
		UICity.TechBoostPerField[self.Field] = (UICity.TechBoostPerField[self.Field] or 0) + self.Amount
	else
		UICity.TechBoostPerTech[self.Research] = (UICity.TechBoostPerTech[self.Research] or 0) + self.Amount
	end
end

--

DefineClass.SA_WaitResearch = {
	__parents = { "SA_WaitBase" },
	
	properties = {
		{ id = "Field",    name = T{3721, "Field"},    editor = "dropdownlist", items = ResearchFieldsCombo, default = "" },
		{ id = "Research", name = T{311, "Research"}, editor = "dropdownlist", items = ResearchTechsCombo,  default = "" },
		{ id = "State",    name = T{3722, "State"},    editor = "dropdownlist", items = {"Available","Researched","In Progress"},  default = "" },
	},
	
	Menu = "Research",
	MenuName = "Wait Research",
}

function SA_WaitResearch:StopWait()
	if self.State == "Available" then
		return UICity:IsTechDiscovered(self.Research) and not UICity:IsTechResearched(self.Research)
	else
		return UICity:IsTechResearched(self.Research) or (self.State == "In Progress" and UICity:GetResearchInfo() == self.Research)
	end
end

function SA_WaitResearch:WarningsCheck(seq_player, sequence, registers)
	if not TechFields[self.Field] then
		seq_player:Error(self, "Unspecified field")
		return
	end
	
	if not TechDef[self.Research] then
		seq_player:Error(self, "Unspecified research")
		return
	end
	
	if #self.State == 0 then
		seq_player:Error(self, "Unspecified state")
	end
end

function SA_WaitResearch:ShortDescription()
	return SequenceMarkup_Keyword("Wait until ")..string.format("%s (in %s) is %s", self.Research, self.Field, self.State)
end

--

DefineClass.SA_CheckResearch = {
	__parents = { "SA_Condition" },
	
	properties = {
		{ id = "Field",    name = T{3721, "Field"},    editor = "dropdownlist", items = ResearchFieldsCombo, default = "" },
		{ id = "Research", name = T{311, "Research"}, editor = "dropdownlist", items = ResearchTechsCombo,  default = "" },
		{ id = "State",    name = T{3722, "State"},    editor = "dropdownlist", items = {"Available","Researched"},  default = "" },
	},
	
	Menu = "Research",
	MenuName = "Check Research",
}

function SA_CheckResearch:TestCondition(sequence_player, ip, seq, registers)
	if self.State == "Available" then
		return UICity:IsTechDiscovered(self.Research) and not UICity:IsTechResearched(self.Research)
	else
		return UICity:IsTechResearched(self.Research)
	end
end

function SA_CheckResearch:WarningsCheck(seq_player, sequence, registers)
	if not TechFields[self.Field] then
		seq_player:Error(self, "Unspecified field")
		return
	end
	
	if not TechDef[self.Research] then
		seq_player:Error(self, "Unspecified research")
		return
	end
	
	if #self.State == 0 then
		seq_player:Error(self, "Unspecified state")
	end
end

function SA_CheckResearch:ConditionText()
	return string.format("%s (in %s) is %s", self.Research, self.Field, self.State)
end

--

DefineClass.SA_AppendToLog = {
	__parents = { "SequenceAction" },

	properties = {
		{ id = "register", name = T{3690, "Register"}, editor = "text", default = "_log", help = "Sequence register to hold the log" },
		{ id = "text",   name = T{3723, "New body text"},   editor = "multi_line_text", translate = true, default = "", help = "Add or replace text in notification body" },
		{ id = "trim_log", name = T{3724, "Limit log to"}, editor = "number", default = 6, help = "After appending, trim log to this many entries" },
	},
	
	Menu = "Gameplay",
	MenuName = "Log Append to Register",
}

function SA_AppendToLog:ShortDescription()
	return string.format("Append to reg '%s' text '%s'", self.register, _InternalTranslate(self.text))
end

function SA_AppendToLog:Exec(seq_player, ip, seq, registers)
	if not registers[self.register] then
		registers[self.register] = {}
	end
	local log = registers[self.register]
	local sol = UICity and UICity.day or 0
	log[#log+1] = T{7799, "<em>Sol <sol>:</em> <text>", text = self.text, sol = sol}
	if self.trim_log ~= 0 then
		while #log > self.trim_log do
			table.remove(log, 1)
		end
	end
end

DefineClass.SA_CustomNotification = {
	__parents = { "SequenceAction" },
	
	properties = {
		{ id = "id",         name = T{3725, "Notification ID"}, editor = "dropdownlist", items = PresetsCombo("OnScreenNotificationPreset"), default = "",  help = "Notification preset ID" },
		{ id = "autoupdate", name = T{6853, "Auto Update"},           editor = "bool",   default = false, help = "If <value> expression will be updated automatically and periodically" },
		{ id = "expression", name = T{3726, "Expression"},      editor = "text",   default = "1", help = "Expression to be evaluation for <value>", no_edit = function(self) return not self.autoupdate end },
		{ id = "interval",   name = T{3727, "Upd. Interval"},   editor = "number", default = 10,  help = "Update interval in seconds", no_edit = function(self) return not self.autoupdate end },
		{ id = "text",       name = T{1000145, "Text"},            editor = "multi_line_text", default = "", translate = true, help = "Text to override the default notification text" },
		{ id = "register",   name = T{3728, "Text Register"},   editor = "text", default = "", help = "Sequence register holding the text to replace the default notification text" },
		{ id = "popup_text",     name = T{7308, "Popup Text"},          editor = "multi_line_text", default = "", translate = true, help = "Text to override the default popup notification text (the on-screen notification preset must trigger a popup notification)" },
		{ id = "popup_register", name = T{7309, "Popup Text Register"}, editor = "text",            default = "",                   help = "Sequence register holding the text to replace the default popup notification text (the on-screen notification preset must trigger a popup notification)" },
		{ id = "reg_param1", name = T{3801, "Reg Param 1"},     editor = "combo", default = "", help = T{3802, "This is a register name, ref as reg_param1 in the body"}, refs_object_of_type = "register" },
		{ id = "reg_param2", name = T{3803, "Reg Param 2"},     editor = "combo", default = "", help = T{3804, "This is a register name, ref as reg_param2 in the body"}, refs_object_of_type = "register" },
		{ id = "expiration", name = T{3729, "Countdown Hours"}, editor = "number", default = 0, scale = const.HourDuration, help = "Expiration" },
		{ id = "exp_reg",	  name = T{3730, "Countdown Register"},editor = "text", default = "", help = "Sequence register holding the expiration to replace the default expiration" },
		{ id = "pos_reg",	  name = T{3731, "Position Register"},editor = "text", default = "", help = "Sequence register holding the position the camera will move to if notif is clicked" },
		{ id = "dismissable", name = T{4101, "Dismissable"}, editor = "dropdownlist", items = { "dismissable", "not dismissable", "no change" }, default = "no change", }
	},
	
	Menu = "Gameplay",
	MenuName = "Custom Notification",
}

function SA_CustomNotification:WarningsCheck(seq_player, sequence, registers)
	if not OnScreenNotificationPresets[self.id] then
		seq_player:Error(self, "Unspecified notification preset")
	end
end

function SA_CustomNotification:ShortDescription()
	return SequenceMarkup_Keyword("Show notification ") .. string.format("about %s", self.id)
end

function SA_CustomNotification:UpdateNotification(seq_player, ip, seq, registers)
	local value = seq_player:Eval("return " .. self.expression, registers)
	local reg_param1 = ResolveNumberOrString(self.reg_param1, registers)
	local reg_param2 = ResolveNumberOrString(self.reg_param2, registers)
	
	local text = self.text
	if text == "" then
		text = self.register ~= "" and registers[self.register] or nil
		if text and type(text) == "table" and not IsT(text) then
			text = table.concat(text, "\n")
		end
	end
	if text == "" then
		text = false
	end
	
	local popup_text = self.popup_text
	if popup_text == "" then
		popup_text = self.popup_register ~= "" and registers[self.popup_register] or nil
		if popup_text and type(popup_text) == "table" and not IsT(popup_text) then
			popup_text = table.concat(popup_text, "\n")
		end
	end
	if popup_text == "" then
		popup_text = false
	end
	
	local expiration = self.expiration
	if expiration == 0 then
		expiration = self.exp_reg ~= "" and registers[self.exp_reg] or expiration
	end
	
	local pos = self.pos_reg ~= "" and registers[self.pos_reg] or nil
	expiration = expiration ~= 0 and expiration or nil
	local params = { reg_param1 = reg_param1, reg_param2 = reg_param2, value = value, override_text = text, expiration = expiration, override_popup_text = popup_text }
	AddOnScreenNotification(self.id, nil, params, pos and {pos} or nil)
	if self.dismissable ~= "no change" then
		SetOnScreenNotificationDismissable(self.id, self.dismissable == "dismissable")
	end
end

function SA_CustomNotification:Exec(seq_player, ip, seq, registers)
	self:UpdateNotification(seq_player, ip, seq, registers)
	if self.autoupdate and self.interval ~= -1 then
		CreateGameTimeThread(function()
			while true do
				Sleep(self.interval*1000)
			
				--Get the controller dialog
				local dlg = GetDialog("OnScreenNotificationsDlg")
				if not dlg then break end
				
				--Check if notification still exists
				local notif = dlg:GetNotificationById(self.id)
				if not notif then break end
				
				--Update expiration time
				if notif.expiration ~= -1 then
					notif.expiration = Max(notif.expiration - self.interval*1000, 0)
				end
				
				--Update notification
				self:UpdateNotification(seq_player, ip, seq, registers)
			end
		end	)
	end
end

--

DefineClass.SA_ModifyConstructionCost = {
	__parents = {"SequenceAction"},
	properties = {
		{ category = "Construction", name = "Building", id = "building", editor = "combo", default = false, items = BuildingsCombo },
		{ category = "Construction", name = "Resource", id = "resource", editor = "combo", default = false, items = ConstructionResourceList },
		{ category = "Construction", name = "Percent",  id = "percent",  editor = "text", default = "0" },	
	},
	
	Menu = "Gameplay",
	MenuName = "Modify construction cost",
}

function SA_ModifyConstructionCost:ShortDescription()
	if not self.building then
		return "Modify construction cost"
	else
		return string.format("Modify %s construction cost of %s by %s%%", self.resource, self.building, self.percent)
	end
end

function SA_ModifyConstructionCost:Exec(seq_player, ip, seq, registers)
	local percent = seq_player:Eval("return " .. self.percent, registers)
	UICity:ModifyConstructionCost("add", self.building, self.resource, percent)
end

--TODO  : remove

DefineClass.SA_SetMystery = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "mystery", name = T{3486, "Mystery"}, editor = "dropdownlist", default = false, items = function() return ClassDescendantsList("MysteryBase") end },
	},
	
	Menu = "Gameplay",
	MenuName = "Set map mystery",
	MenuSection = "Mysteries",
}

function SA_SetMystery:WarningsCheck(seq_player, seq, registers)
	if self.mystery == false then
		seq_player:Error(self, "Unspecified mystery!")
	end
end
function SA_SetMystery:ShortDescription()
	return string.format("Set map mystery to %s", self.mystery or "unspecified mystery")
end

function SA_SetMystery:Exec(seq_player, ip, seq, registers)
	if not UICity.mystery then
		g_Classes[self.mystery]:new{city = UICity}
	elseif Platform.developer then
		print("SA_SetMystery: Mystery already set!")
	end
end

--

local function DiscoverableTechFields()
	local fields = {""}
	for id, field in sorted_pairs(TechFields) do
		if field.discoverable then
			fields[#fields + 1] = id
		end
	end
	return fields
end

DefineClass.SA_BumpTechDiscover = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "field", name = T{3721, "Field"}, editor = "dropdownlist", default = "", items = DiscoverableTechFields },
		{ id = "count", name = T{3732, "Count"}, editor = "number", default = 1, min = 1 },
	},
	
	Menu = "Research",
	MenuName = "Bump Tech Discover",
}

function SA_BumpTechDiscover:WarningsCheck(seq_player, seq, registers)
	if self.field ~= "" and (not TechFields[self.field] or not TechFields[self.field].discoverable) then
		seq_player:Error(self, "Invalid tech field!")
	elseif self.count < 1 then
		seq_player:Error(self, "Invalid count!")
	end
end

function SA_BumpTechDiscover:ShortDescription()
	if self.field == "" then
		return "Bump tech discover"
	else
		return string.format("Bump tech discover in %s by %d", self.field, self.count)
	end
end

function SA_BumpTechDiscover:Exec(seq_player, ip, seq, registers)
	if self.field == "" or self.count < 1 then
		return
	end
	local city = UICity
	for i=1,self.count do
		if not city:DiscoverTechInField(self.field) then
			return
		end
	end
end

--

function RevealableTechs()
	local techs = {
		{value = "", text = T{3733, "Random Breakthrough"}},
	}
	for id, field in sorted_pairs(TechFields) do
		if not field.discoverable then
			local defs = Presets.TechPreset[field.id]
			for i=1,#defs do
				techs[#techs + 1] = {value = defs[i].id, text = defs[i].display_name}
			end
		end
	end
	return techs
end

DefineClass.SA_RevealTech = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "tech", name = T{3734, "Tech"}, editor = "dropdownlist", default = "", items = RevealableTechs },
		{ id = "cost", name = T{6854, "Cost (RP)"}, editor = "number", default = -1 },
	},
	
	Menu = "Gameplay",
	MenuName = "Reveal tech",
	MenuSection = "Mysteries",
}

function SA_RevealTech:WarningsCheck(seq_player, seq, registers)
	if self.tech ~= "" and not TechDef[self.tech] then
		seq_player:Error(self, "Tech not found!")
	end
end

function SA_RevealTech:ShortDescription()
	if self.tech == "" then
		return "Reveal random Breakthrough tech"
	else
		return string.format("Reveal tech %s", self.tech)
	end
end

function SA_RevealTech:Exec(seq_player, ip, seq, registers)
	local city = UICity
	local tech_id = self.tech
	if tech_id == "" then
		local not_revealed_techs = {}
		local all_techs = Presets.TechPreset.Breakthroughs or ""
		for i = 1, #all_techs do
			local id = all_techs[i].id
			if not city:IsTechDiscovered(id) then
				not_revealed_techs[#not_revealed_techs + 1] = id
			end
		end
		tech_id = city:TableRand(not_revealed_techs)
		if not tech_id then
			seq_player:Error(self, "All techs revealed, no tech to reveal!")
			return
		end
	end
	if not city:SetTechDiscovered(tech_id) then
		seq_player:Error(self, "Failed to discover tech '%s'", tech_id)
		return
	end
	if self.cost ~= -1 then
		city:ChangeResearchCost(tech_id, self.cost)
	end
end

--
local function ClassNameItems()
	local template_classes = {}
	for _, template in pairs(BuildingTemplates) do
		template_classes[template.template_class] = true
	end
	local ret = ClassDescendantsList("Object",
		function(name, class)
			return not template_classes[name]
		end)
	for id, template in pairs(BuildingTemplates) do
		table.insert_unique(ret, id)
	end
	table.sort(ret)
	return ret
end
local function CheckDomeCombo()
	return {
		{value = false, text = T{3735, "Anywhere"}},
		{value = "inside", text = T{3736, "Inside Dome"}},
		{value = "outside", text = T{3737, "Outside Dome"}},
	}
end
local function CheckExplorationCombo()
	return {
		{value = false, text = T{3735, "Anywhere"}},
		{value = "explored", text = T{8899, "Explored Areas Only"}},
		{value = "unexplored", text = T{8900, "Unexplored Areas Only"}},
	}
end
local function RandomPosLabelCombo()
	local t = GetBuildingAndDepositLabelsCombo()
	table.insert(t, 1, {value = false, text = "NO"})
	return t
end
local function ExcludeClassNameCombo()
	local t = ClassNameItems()
	table.insert(t, 1, false)
	return t
end

DefineClass.PositionFinder = {
	__parents = {"PropertyObject"},
	
	properties = {
		{ id = "check_passability", name = T{3738, "Check passability?"}, editor = "bool", default = false, },
		{ id = "check_buildable", name = T{3739, "Check buildable?"}, editor = "bool", default = false, },
		{ id = "check_playable", name = T{3740, "Check playable?"}, editor = "bool", default = false, },
		{ id = "check_dome", name = T{3741, "Check Dome"}, editor = "dropdownlist", default = false, items = CheckDomeCombo},
		{ id = "check_terran_deposit", name = T{3742, "Check Terran Deposit"}, editor = "bool", default = false},
		{ id = "check_exploration", name = T{8901, "Check Exploration"}, editor = "dropdownlist", default = false, items = CheckExplorationCombo},
		{ id = "exclude_class_name", name = T{3743, "Exclude class in buildable checks"}, editor = "dropdownlist", default = false, items = ExcludeClassNameCombo, help = "The class selected here will be excluded when doing build checks. Whats more objects of this type found in the hex shape during placement will be destroyed.", },
		{ id = "random_pos_label", name = T{3744, "Random pos is near label"}, editor = "combo", default = false, items = RandomPosLabelCombo, },
		{ id = "random_pos_label_dist", name = T{3745, "Random pos label max distance"}, editor = "number", default = 0, scale = guim,},
	},
}

local hex_edges
local classes = {"Unit", "ResourceStockpileBase", "SurfaceDeposit"}
function PositionFinder:TestPos(pt_pos, q, r, angle, class_def, building_shape, building_other_shape)
	if self.check_playable and not IsBuildableZone(pt_pos) then
		return
	end
	
	local classes_excluded_in_build_checks = self.exclude_class_name
	local check_terran_deposit = self.check_terran_deposit
	local check_exploration = self.check_exploration
	local check_for_buildable = self.check_buildable
	local check_for_passable = self.check_passability
	local check_dome = self.check_dome
	if check_dome then
		if check_dome == "inside" and not GetDomeAtPoint(pt_pos)
		or check_dome == "outside" and GetDomeAtPoint(pt_pos) then
			return
		end
	end
	if check_for_passable and not terrain.IsPassable(pt_pos) then
		return
	end
	if check_exploration then
		local sector = GetMapSector(pt_pos)
		local status = sector and (sector.blocked_status or sector.status)
		if check_exploration == "explored" and status == "unexplored"
		or check_exploration == "unexplored" and status ~= "unexplored" then
			return
		end
	end
	local any_shape = building_shape or building_other_shape	
	local any_shape_check = check_for_passable or check_for_buildable or check_dome or check_terran_deposit or check_exploration
	if any_shape and any_shape_check then
		local dir = HexAngleToDirection(angle * 60)
		local is_tall = class_def:HasMember("is_tall") and class_def.is_tall or false
		if not hex_edges then
			local v = point(HexGetSize() * 8 / 10, 0)
			hex_edges = { v }
			for i = 1, 5 do
				hex_edges[i + 1] = Rotate(v, i * 60 * 60)
			end
		end
		for i = 1, building_other_shape and 2 or 1 do
			local shape_data = i == 1 and building_shape or building_other_shape
			if check_for_buildable and not ConstructionController.IsTerrainFlatForPlacement(nil, shape_data, pt_pos, angle * 60) then
				return
			end
			if check_terran_deposit and TerrainDeposit_Check(shape_data, pt_pos, angle * 60, TerrainDepositGrid) then
				return
			end
			for _, shape_pt in ipairs(shape_data) do
				local x, y = shape_pt:xy()
				x, y = HexRotate(x, y, dir)
				x, y = x + q, y + r
				if check_for_buildable then
					local blds = HexGridGetObjects(ObjectGrid, x, y, nil, nil, function(o)
						if IsKindOfClasses(o, "DoesNotObstructConstruction", classes_excluded_in_build_checks) then
							return false
						end
						if not is_tall and IsKindOf(o, "LifeSupportGridElement") and not o.pillar then
							return false
						end
						return "break"
					end)
					if #blds > 0 then 
						return
					end
				end
				local pt_x, pt_y = HexToWorld(x, y)
				if check_for_passable then
					if not terrain.IsPassable(pt_x, pt_y) then
						return
					end
					for j = 1, 6 do
						local dx, dy = hex_edges[j]:xy()
						if not terrain.IsPassable(pt_x + dx, pt_y + dy) then
							return
						end
					end
				end
				if check_dome then
					if check_dome == "inside" and not GetDomeAtPoint(pt_x, pt_y)
					or check_dome == "outside" and GetDomeAtPoint(pt_x, pt_y) then
						return
					end
				end
				if check_exploration then
					local sector = GetMapSector(pt_x, pt_y)
					local status = sector and (sector.blocked_status or sector.status)
					if check_exploration == "explored" and status == "unexplored"
					or check_exploration == "unexplored" and status ~= "unexplored" then
						return
					end
				end
			end
		end
	end
	
	--buildable checks
	if check_for_buildable then
		--check for units and non grided obstacles
		local force_extend_bb = class_def:HasMember("force_extend_bb_during_placement_checks") and class_def.force_extend_bb_during_placement_checks
		local filter_func = function(obj)
			if IsKindOfClasses(obj, classes_excluded_in_build_checks) then
				return false
			end
			if not ConstructionController.BlockingUnitsFilter(obj) then
				return IsKindOfClasses(obj, "SurfaceDeposit", "ResourceStockpileBase")
			end
			return true
		end
		if HexGetUnits(nil, class_def:GetEntity(), pt_pos, angle * 60, true, filter_func, classes, force_extend_bb ~= 0 and force_extend_bb) then
			return
		end
	end
	
	return true
end

function PositionFinder:TryFindRandomPos(class_def, building_shape, building_other_shape)
	local w, h = terrain.GetMapSize()
	local r_w, r_h, q, r, angle, all_clear
	local random_pos_label, random_pos_max_dist_from_label
	if self.random_pos_label and self.random_pos_label_dist > 0 then --both must be set to make sense
		random_pos_label = self.random_pos_label
		random_pos_max_dist_from_label = self.random_pos_label_dist
	end
	
	local pt_hex_center
	local tries = 0
	local city = UICity
	local check_dome = self.check_dome
	local check_exploration = self.check_exploration
	local valid_objs
	while true do
		if random_pos_label then
			local label_objs = valid_objs or city.labels[random_pos_label] or empty_table
			local label_obj = city:TableRand(label_objs)
			if not label_obj then
				return false
			end
			if not IsValid(label_obj) or not label_obj:IsValidPos() then
				assert(not valid_objs)
				valid_objs = {}
				for _, obj in ipairs(label_objs) do
					if IsValid(obj) and obj:IsValidPos() then
						valid_objs[#valid_objs + 1] = obj
					end
				end
				label_obj = city:TableRand(valid_objs)
				if not label_obj then
					return false
				end
			end
			local r_l = city:Random(random_pos_max_dist_from_label)
			local a = city:Random(360*60)
			r_w, r_h = RotateRadius(r_l, a, label_obj:GetPos(), true)
		elseif check_dome == "inside" then
			local dome = city:TableRand(city.labels.Dome or empty_table)
			if not dome then
				return false
			end
			local r_l = city:Random(dome:GetRadius())
			local a = city:Random(360*60)
			r_w, r_h = RotateRadius(r_l, a, dome:GetPos(), true)
		elseif check_exploration then
			local filtered = {}
			local sectors = g_MapSectors
			for x = 1, const.SectorCount do
				local sectors = sectors[x]
				for y = 1, const.SectorCount do
					local sector = sectors[y]
					local status = sector.blocked_status or sector.status
					if check_exploration == "unexplored" and status == "unexplored"
					or check_exploration == "explored" and status ~= "unexplored" then
						filtered[#filtered + 1] = sector
					end
				end
			end
			local sector = city:TableRand(filtered)
			local area = sector and sector.area
			if not area then
				return false
			end
			r_w = city:Random(area:minx(), area:maxx())
			r_h = city:Random(area:miny(), area:maxy())
		else
			r_w = city:Random(w - 1) + 1
			r_h = city:Random(h - 1) + 1
		end
		
		tries = tries + 1
		q, r = WorldToHex(point(r_w, r_h))
		pt_hex_center = HexGetNearestCenter(point(r_w, r_h))
		local angle_0 = city:Random(6) * 60
		angle = angle_0
		while angle - angle_0 < 360 do
			all_clear = self:TestPos(pt_hex_center, q, r, angle, class_def, building_shape, building_other_shape)
			if not all_clear and #building_shape > 1 then
				angle = angle + 60
			else
				break
			end
		end
		if all_clear or tries > 500 then
			break
		end
	end
	
	return all_clear, pt_hex_center:x(), pt_hex_center:y(), q, r, angle
end

DefineClass.SA_PlaceObject = {
	__parents = {"SequenceAction", "PositionFinder"},
	properties = {
		{ id = "class_name", name = T{3746, "Class name"}, editor = "dropdownlist", default = false, items = ClassNameItems, },
		--position priority => random pos, register pos, placement pos
		{ id = "placement_pos", name = T{3747, "Placement pos"}, editor = "point", default = point30, },
		{ id = "register_placement_pos", name = T{3748, "Use pos from register:"}, editor = "text", default = "", },
		{ id = "use_random_pos", name = T{3749, "Use random pos?"}, editor = "bool", default = false,},

		{ id = "is_construction_site", name = T{3750, "Place as construction site?"}, editor = "bool", default = false},
		
		{ id = "store_pos", name = T{3751, "Store pos in register"}, editor = "text", default = "", help = "Will store the position of the obj placed in this register."},
		{ id = "store_pos_spot_name", name = T{3752, "Stored pos is of spot name?"}, editor = "text", default = "", help = "When storing spawned obj pos in reg, it will be the pos of the spot name given here rather then origin pos."},
		{ id = "store_obj", name = T{3753, "Store spawned obj in register"}, editor = "text", default = "", help = "If diff from empty str, will store spawned object in this register."},
		{ id = "store_obj_append", name = T{3754, "Append to register?"}, editor = "bool", default = false, help = "Check to append to register, leave unchecked to replace register contents."},
		
		{ id = "force_z_terrain_relative", name = T{3755, "Force pos Z, terrain relative"}, editor = "number", default = 0, help = "Values != from zero will force obj's pos' z to that val + terrain height at pos. Also ignored for constructions!",},
		{ id = "skip_cable_cleanup", name = T{3756, "Force skip cable cleanup"}, editor = "bool", default = false, help = "If true and placeing a GridObject, will not remove cables underneath.", },
		--dbg param
		{ id = "show_me_spawned_obj", name = T{3757, "Show me spawned obj (dbg)"}, editor = "bool", default = false,},
		
		--passed to placed obj
		{ id = "par_name_1", name = T{3758, "Param Name 1"}, editor = "text", default = "", },
		{ id = "par_val_1", name = T{3759, "Param Value 1"}, editor = "text", default = "", },
		{ id = "par_name_2", name = T{3760, "Param Name 2"}, editor = "text", default = "", },
		{ id = "par_val_2", name = T{3761, "Param Value 2"}, editor = "text", default = "", },
		{ id = "par_name_3", name = T{3762, "Param Name 3"}, editor = "text", default = "", },
		{ id = "par_val_3", name = T{3763, "Param Value 3"}, editor = "text", default = "", },
	},
	
	Menu = "Gameplay",
	MenuName = "Place object at",
	MenuSection = "Mysteries",
	
	check_passability = true,
	check_buildable = true,
	check_playable = true,
	check_terran_deposit = true,
}

function SA_PlaceObject:WarningsCheck(seq_player, seq, registers)
	if self.class_name == false then
		seq_player:Error(self, "Unspecified class name!")
	end
	
	if not self.use_random_pos then
		if self.register_placement_pos == "" and not terrain.IsPointInBounds(self.placement_pos) then
			seq_player:Error(self, "Specified placement pos outside of terrain bounds!")
		end
	end
end

function SA_PlaceObject:GetParamsStr()
	local params_str = "no params"
	
	if self.par_name_1 ~= "" then
		params_str = string.format("%s set to %s", self.par_name_1, self.par_val_1)
	end
	
	if self.par_name_2 ~= "" then
		if params_str ~= "no params" then
			params_str = string.format("%s, and %s set to %s", params_str, self.par_name_2, self.par_val_2)
		else
			params_str = string.format("%s set to %s", self.par_name_2, self.par_val_2)
		end
	end
	
	if self.par_name_3 ~= "" then
		if params_str ~= "no params" then
			params_str = string.format("%s, and %s set to %s", params_str, self.par_name_3, self.par_val_3)
		else
			params_str = string.format("%s set to %s", self.par_name_3, self.par_val_3)
		end
	end
	
	return params_str
end

function SA_PlaceObject:GetChecksStr()
	local ret = ""
	if self.check_passability then
		ret = " and check for passability,"
	end
	
	if self.check_buildable then
		if ret == "" then
			ret = " and check for buildable,"
		else
			ret = string.format("%s%s", ret, " and check for buildable,")
		end
	end
	
	return ret
end

function SA_PlaceObject:GetPosStr()
	if self.use_random_pos then
		if self.random_pos_label and self.random_pos_label_dist ~= 0 then
			return string.format("random pos up to %s game units from random obj of label %s", self.random_pos_label_dist, self.random_pos_label)
		else
			return "random pos"
		end
	else
		if self.register_placement_pos ~= "" then
			return string.format("position in register %s", self.register_placement_pos)
		else
			return tostring(self.placement_pos)
		end
	end
end

function SA_PlaceObject:ShortDescription()
	return string.format("Place object of type %s at %s%s with %s", self.class_name or "N/A", self:GetPosStr(), self:GetChecksStr(), self:GetParamsStr())
end

local function CleanupExcludedObjects(class_def, q, r, angle, building_shape, building_other_shape, excl_class_name)
	if not excl_class_name then return end
	local is_tall = class_def:HasMember("is_tall") and class_def.is_tall or false
	local dir = HexAngleToDirection(angle * 60)
	
	for i = 1, building_other_shape and 2 or 1 do
		local shape_data = i == 1 and building_shape or building_other_shape
		for _, shape_pt in ipairs(shape_data) do
			local x, y = HexRotate(shape_pt:x(), shape_pt:y(), dir)
			local remove = HexGridGetObjects(ObjectGrid, x + q, y + r, nil, nil, function(o)
				return IsKindOfClasses(o, excl_class_name)
			end)
			for j=1,#remove do
				DoneObject(remove[j])
			end
		end
	end
end

function SA_PlaceObject:GetParamTable()
	local ret = {}
	if self.par_name_1 ~= "" then
		ret[self.par_name_1] = tonumber(self.par_val_1) or self.par_val_1
	end
	
	if self.par_name_2 ~= "" then
		ret[self.par_name_2] = tonumber(self.par_val_2) or self.par_val_2
	end
	
	if self.par_name_3 ~= "" then
		ret[self.par_name_3] = tonumber(self.par_val_3) or self.par_val_3
	end
	
	return next(ret) ~= nil and ret or nil
end

function SA_PlaceObject:Exec(seq_player, ip, seq, registers)
	local obj
	local is_building = not not ClassTemplates.Building[self.class_name]
	local class_def = is_building and ClassTemplates.Building[self.class_name] or g_Classes[self.class_name]
	local outline, interior = GetEntityHexShapes(is_building and ClassTemplates.Building[self.class_name].entity or class_def:GetEntity())
	local q, r, angle
	
	if self.is_construction_site and not is_building then
		seq_player:Error(self, "Cannot place construction site of a non building object!")
		return
	end
	
	if self.class_name then
		if not self.use_random_pos then
			local pos
			if self.register_placement_pos ~= "" then
				pos = registers[self.register_placement_pos]
				if not pos then
					seq_player:Error(self, string.format("Register %s was empty, cannot continue without position!", self.register_placement_pos))
					return
				end
				
				if not IsPoint(pos) then
					seq_player:Error(self, string.format("Register %s is not a point!", self.register_placement_pos))
					return
				end
				
				if not terrain.IsPointInBounds(pos) then
					seq_player:Error(self, string.format("Point in register %s is out of terrain bounds!", self.register_placement_pos))
					return
				end
			else
				pos = self.placement_pos
			end
			q, r = WorldToHex(pos)
			angle = 0
			--todo : test more angles?
			if self:TestPos(pos, q, r, angle, class_def, outline, interior) then
				if self.exclude_class_name then
					CleanupExcludedObjects(class_def, q, r, angle, outline, interior, {self.exclude_class_name})
				end
				if self.is_construction_site or is_building then
					UICity:SetCableCascadeDeletion(false, "SA_PlaceObject")
					obj = CityConstruction[UICity]:Place(self.class_name, HexGetNearestCenter(pos), angle * 60, self:GetParamTable(), not self.is_construction_site and is_building)
					UICity:SetCableCascadeDeletion(true, "SA_PlaceObject")
				else
					obj = PlaceObject(self.class_name, self:GetParamTable())
					if self.force_z_terrain_relative ~= 0 then
						pos = pos:SetZ(terrain.GetHeight(pos) + self.force_z_terrain_relative)
					end
					obj:SetPos(pos)
				end
			else
				seq_player:Error(self, "Could not place @ provided position!")
			end
		else
			local rez, x, y
			rez, x, y, q, r, angle = self:TryFindRandomPos(class_def, outline, interior)
			if rez then
				if self.exclude_class_name then
					CleanupExcludedObjects(class_def, q, r, angle, outline, interior, {self.exclude_class_name})
				end
				if self.is_construction_site or is_building then
					UICity:SetCableCascadeDeletion(false, "SA_PlaceObject")
					obj = CityConstruction[UICity]:Place(self.class_name, point(x, y), angle * 60, self:GetParamTable(), not self.is_construction_site and is_building)
					UICity:SetCableCascadeDeletion(true, "SA_PlaceObject")
				else
					obj = PlaceObject(self.class_name, self:GetParamTable())
					obj:SetPos(point(x, y, self.force_z_terrain_relative ~= 0 and (terrain.GetHeight(x, y) + self.force_z_terrain_relative) or nil))
					obj:SetAngle(angle * 60)
				end
			else
				seq_player:Error(self, "Could not find position to place %s", self.class_name)
			end
		end
	end
	
	if not self.skip_cable_cleanup and obj and IsKindOf(obj, "GridObject") and not
		(self.is_construction_site or is_building) then --clean cables n such if we are not placing a building/constr site
		--check for cables and such
		UICity:SetCableCascadeDeletion(false, "SA_PlaceObject")
		local dir = HexAngleToDirection(angle * 60)
		for i = 1, 2 do
			local shape_data = i == 1 and outline or interior
			for _, shape_pt in ipairs(shape_data) do
				local x, y = HexRotate(shape_pt:x(), shape_pt:y(), dir)
				local remove = HexGridGetObjects(ObjectGrid, x + q, y + r, "DoesNotObstructConstruction", nil, function(o)
					return not IsKindOfClasses(o, "LifeSupportGridElement", "DomeInterior")
				end)
				for j=1,#remove do
					DoneObject(remove[j])
				end
			end
		end
			
		UICity:SetCableCascadeDeletion(true, "SA_PlaceObject")
	end
	
	
	if self.store_pos ~= "" and obj then
		if self.store_pos_spot_name ~= "" then
			if obj:HasSpot(self.store_pos_spot_name) then
				local spot_idx = obj:GetSpotBeginIndex(self.store_pos_spot_name)
				registers[self.store_pos] = obj:GetSpotPos(spot_idx)
			else
				seq_player:Error(self, string.format("Spot name %s not found on obj of type %s!", self.store_pos_spot_name, obj.class))
			end
		else
			registers[self.store_pos] = obj:GetPos()
		end
	end
	
	if self.store_obj ~= "" and obj then
		local reg = self.store_obj
		if self.store_obj_append then
			if not registers[reg] then
				registers[reg] = obj
			elseif #registers[reg] == 1 or IsValid(registers[reg]) then
				registers[reg] = { registers[reg], obj }
			else
				registers[reg][#registers[reg]+1] = obj
			end
		else
			registers[self.store_obj] = obj
		end
	end
	
	if self.show_me_spawned_obj and obj then
		ShowMe(obj)
	end
end

--

DefineClass.SA_DestroyObjects = {
	__parents = {"SA_PickRandomObject"},
	properties = {
		--obj pickage priority => will try label first, class second
		{ id = "obj_count", name = T{3767, "Number of objects to destroy"}, editor = "number", default = 1, min = 1 },
		{ id = "destroy_all", name = T{3768, "Destroy all?"}, editor = "bool", default = false },
		{ id = "return_resource", name = T{3769, "Return resources?"}, editor = "bool", default = false},
		{ id = "store_pos", name = T{3751, "Store pos in register"}, editor = "text", default = "", help = "Will store the position of the first obj destroyed in this register."},
		
		{ category = "FX", id = "fx_action", name = T{3770, "FX Action"}, editor = "text", default = "", help = "If both fx fields are filled will fire fx event using provided action and moment and destroyed obj as actor for each destroyed object."},
		{ category = "FX", id = "fx_moment", name = T{3771, "FX Moment"}, editor = "text", default = "", help = "If both fx fields are filled will fire fx event using provided action and moment and destroyed obj as actor for each destroyed object."},
	},
	
	store_obj = "",
	Menu = "Gameplay",
	MenuName = "Destroy objects",
	MenuSection = "Mysteries",
}

function SA_DestroyObjects:ShortDescription()
	return string.format("Destroy %s%s object(s) %s%s%s", self.destroy_all and "all" or tostring(self.obj_count), self.visible_only and " visible" or "", self:GetObjectString(), self.return_resource and ", and return resources" or "", self.store_pos ~= "" and string.format(", and store first obj's pos in register %s", self.store_pos) or "" )
end

function SA_DestroyObjects.PlayFX(self, obj)
	PlayFX(self.fx_action, self.fx_moment, obj)
end

function SA_DestroyObjects:ReturnResources(obj)
	if self.return_resource then
		if obj:HasMember("ReturnResources") then
			obj:ReturnResources()
		end
	else
		if obj:HasMember("ClearAllResources") then
			obj:ClearAllResources()
		end
	end
end

function SA_DestroyObjects:Exec(seq_player, ip, seq, registers)
	local city = UICity
	local objects = self:GatherObjects(seq_player, ip, seq, registers)
	local fx_func = self.fx_action ~= "" and self.fx_moment ~= "" and SA_DestroyObjects.PlayFX or __empty_function__
	
	local store = self.store_pos ~= ""
	if #(objects or "") <= 0 then
		if store then
			registers[self.store_pos] = false
		end
		return
	end
	
	if self.destroy_all then
		if store then
			registers[self.store_pos] = objects[1]:GetPos()
		end
		
		for i = #objects, 1, -1 do
			local obj = objects[i]
			self:ReturnResources(obj)
			fx_func(self, obj)
			DoneObject(obj)
		end
	else
		for i=1,self.obj_count do
			local obj = self:PickObject(objects)
			if not obj then
				break
			end
			if store then
				registers[self.store_pos] = obj:GetPos()
				store = false
			end
			self:ReturnResources(obj)
			fx_func(self, obj)
			DoneObject(obj)
		end
	end
end

--

local function obj_label_combo()
	local t = GetBuildingAndDepositLabelsCombo()
	table.insert(t, 1, {value = false, text = "NO"})
	return t
end

function IsInRangeOfLabel(obj, label_name, dist)
	local label = IsValid(obj) and UICity.labels[label_name] or empty_table
	for j = 1, #label do
		if obj:IsCloser2D(label[j], dist) then
			return true
		end
	end
end

DefineClass.SA_PickRandomObject = {
	__parents = {"SequenceAction"},
	properties = {
		--obj pickage priority => will try label first, class second
		{ id = "obj_label", name = T{3764, "Pick object from label"}, editor = "dropdownlist", default = false, items = obj_label_combo, },
		{ id = "obj_class", name = T{3765, "Pick object from class"}, editor = "dropdownlist", default = false, items = function() local t = ClassNameItems();table.insert(t, 1, false);return t end, },
		{ id = "obj_reg",   name = T{3766, "Pick object from register"}, editor = "text", default = false,  },
		{ id = "store_obj",       name = T{8037, "Store object in register"}, editor = "text", default = "RandomObject",  },
		{ id = "visible_only",    name = T{8038, "Visible only"}, editor = "bool", default = false },
	},
	
	Menu = "Gameplay",
	MenuName = "Pick Random Object",
	MenuSection = "Mysteries",
}

function SA_PickRandomObject:WarningsCheck(seq_player, seq, registers)
	if self.obj_label == false and self.obj_class == false and self.obj_reg == false then
		seq_player:Error(self, "Unspecified object!")
	end
end

function SA_PickRandomObject:GetObjectString()
	if self.obj_label then
		return string.format("from label %s", self.obj_label)
	elseif self.obj_class then
		return string.format("of type %s", self.obj_class)
	elseif self.obj_reg then
		return string.format("from reg %s", self.obj_reg)
	else
		return "N/A"
	end
end

function SA_PickRandomObject:ShortDescription()
	return string.format("Pick a random %sobject %s and store it in register %s", self.visible_only and "visible " or "", self:GetObjectString(), self.store_obj)
end

function SA_PickRandomObject:GatherObjects(seq_player, ip, seq, registers)
	local city = UICity
	local objects
	local copy = true

	if self.obj_label then
		objects = city.labels[self.obj_label]
		local class = self.obj_class
		if class then
			local filtered = {}
			for i=1,#objects do
				local obj = objects[i]
				if IsKindOf(obj, class) then
					filtered[#filtered + 1] = obj
				end
			end
			objects = filtered
			copy = false
		end
	elseif self.obj_class then
		objects = MapGet(true, self.obj_class)
		copy = false
	else
		objects = registers[self.obj_reg] or empty_table
		if IsValid(objects) then
			objects = { objects }
			copy = false
		end
	end
	if self.visible_only then
		copy = false
		local visible = {}
		for i=1,#objects do
			if objects[i]:GetVisible() then
				visible[#visible + 1] = objects[i]
			end
		end
		objects = visible
	end
	return copy and table.icopy(objects) or objects
end

function SA_PickRandomObject:PickObject(objects)
	local obj, idx = UICity:TableRand(objects)
	if not idx then
		return
	end
	table.remove(objects, idx)
	return obj
end

function SA_PickRandomObject:Exec(seq_player, ip, seq, registers)
	local objects = self:GatherObjects(seq_player, ip, seq, registers)
	registers[self.store_obj] = self:PickObject(objects)
end

----

DefineClass.SA_SpawnObjectAt = {
	__parents = {"SequenceAction", "PositionFinder"},
	properties = {
		--placement
		{ id = "placement_pos", name = T{3747, "Placement pos"}, editor = "point", default = point30, },
		{ id = "register_placement_pos", name = T{3748, "Use pos from register:"}, editor = "text", default = "", },
		{ id = "use_random_pos", name = T{3749, "Use random pos?"}, editor = "bool", default = false,},
		
		{ id = "attach_to_obj_in_reg", name = T{3772, "Attach to object in register"}, editor = "text", default = "", help = "If this is filled, will ignore all other placement options and directly attach the newly created anomally to the given obj."},
		{ id = "attach_obj_spot", name = T{3773, "Attach to object's spot"}, editor = "text", default = "", help = "Only has meaning if attach obj is provided, in that case will attach to the given spot."},
		
		{ id = "store_obj", name = T{3753, "Store spawned obj in register"}, editor = "text", default = "", help = "If diff from empty str, will store spawned object in this register."},
		{ id = "store_obj_append", name = T{3754, "Append to register?"}, editor = "bool", default = false, help = "Check to append to register, leave unchecked to replace register contents."},
		
		--dbg param
		{ id = "show_me_spawned_obj", name = T{3757, "Show me spawned obj (dbg)"}, editor = "bool", default = false,},
	},
	
	check_passability = true,
	check_buildable = true,
}

function SA_SpawnObjectAt:WarningsCheck(seq_player, seq, registers)
	if not self.use_random_pos then
		if self.register_placement_pos == "" and self.attach_to_obj_in_reg == "" and not terrain.IsPointInBounds(self.placement_pos) then
			seq_player:Error(self, "Specified placement pos outside of terrain bounds!")
		end
	end
end

function SA_SpawnObjectAt:Exec(seq_player, ip, seq, registers)
	local pos, angle, obj, q, r, pos_test_result, attach_to_obj
	local class_def = g_Classes["SubsurfaceAnomaly"]
	local outline, interior = GetEntityHexShapes(class_def:GetEntity())
	
	if self.attach_to_obj_in_reg == "" then --if we are going to attach, we don't need a pos.
		if not self.use_random_pos then			
			if self.register_placement_pos ~= "" then
				pos = registers[self.register_placement_pos]
				if not pos then
					seq_player:Error(self, string.format("Register %s was empty, cannot continue without position!", self.register_placement_pos))
					return
				end
				
				if not IsPoint(pos) then
					seq_player:Error(self, string.format("Register %s is not a point!", self.register_placement_pos))
					return
				end
				
				if not terrain.IsPointInBounds(pos) then
					seq_player:Error(self, string.format("Point in register %s is out of terrain bounds!", self.register_placement_pos))
					return
				end
			else
				pos = self.placement_pos
			end
			q, r = WorldToHex(pos)
			angle = 0		
			pos_test_result = self:TestPos(pos, q, r, angle, class_def, outline, interior)
		else
			local x, y
			pos_test_result, x, y, q, r, angle = self:TryFindRandomPos(class_def, outline, interior)
			pos = point(x, y)
		end
	else
		attach_to_obj = registers[self.attach_to_obj_in_reg]
		if not IsValid(attach_to_obj) then
			seq_player:Error(self, string.format("Register %s is not a valid object!", self.attach_to_obj_in_reg))
			return
		end
		
		pos_test_result = true
	end
	if pos_test_result then
		obj = self:SpawnObject()
		if obj then
			if attach_to_obj then
				local spot_idx = self.attach_obj_spot ~= "" and attach_to_obj:GetSpotBeginIndex(self.attach_obj_spot) or nil
				if not spot_idx then
					attach_to_obj:Attach(obj)
				else
					attach_to_obj:Attach(obj, spot_idx)
				end
			else
				obj:SetPos(pos)
			end
		end
	else
		seq_player:Error(self, "Could not find suitable location to place anomaly!")
	end
	
	local reg = obj and self.store_obj or ""
	if reg == "" then
		--
	elseif not registers[reg] or not self.store_obj_append then
		registers[reg] = obj
	elseif #registers[reg] == 1 or IsValid(registers[reg]) then
		registers[reg] = { registers[reg], obj }
	else
		registers[reg][#registers[reg]+1] = obj
	end
	
	if self.show_me_spawned_obj and obj then
		ShowMe(obj)
	end
end

function SA_SpawnObjectAt:SpawnObject()
end

----

DefineClass.SA_SpawnAnomaly = {
	__parents = {"SA_SpawnObjectAt"},
	properties = {
		
		--anomaly props
		{ category = "Anomaly", name = T{1153, "Display Name"}, id = "display_name", editor = "text", default = "", translate = true},
		{ category = "Anomaly", name = T{1000017, "Description"}, id = "description", editor = "text", default = "", translate = true},
		
		
		{ category = "Anomaly", name = T{3774, "Generate Breakthrough Tech"}, id = "is_breakthrough", editor = "bool", default = false},
		{ category = "Anomaly", name = T{3775, "Sequence List"}, 				id = "sequence_list", default = "",    editor = "dropdownlist", items = function() return table.map(DataInstances.Scenario, "name") end, },
		{ category = "Anomaly", name = T{5, "Sequence"},                id = "sequence", editor = "dropdownlist", items = function(self) return self.sequence_list == "" and {} or table.map(DataInstances.Scenario[self.sequence_list], "name") end, default = "", help = "Sequence to start when the anomaly is scanned" },
		{ category = "Anomaly", name = T{8696, "Expiration Time"},                id = "expiration_time", editor = "number", default = 0, scale = const.HourDuration, help = "If > 0 the anomaly will expire and disappear in this many hours." },
	},
	
	Menu = "Gameplay",
	MenuName = "Place anomaly at",
	MenuSection = "Mysteries",
}

function SA_SpawnAnomaly:ShortDescription()
	return string.format("Place anomaly %s at %s%s",_InternalTranslate(self.display_name), SA_PlaceObject.GetPosStr(self), SA_PlaceObject.GetChecksStr(self))
end

function SA_SpawnAnomaly:SpawnObject()
	return PlaceAnomaly{
		display_name = self.display_name ~= "" and self.display_name or nil,
		description = self.description ~= "" and self.description or nil,
		tech_action = self.is_breakthrough and "breakthrough",
		sequence = self.sequence,
		sequence_list = self.sequence_list == "" and seq_player.seq_list.name or self.sequence_list,
		expiration_time = self.expiration_time,
		revealed = true,
	}
end

----

local wait_types = {
	"Hours",
	"Sols",
	"Specific Hour",
	"Specific Sol",
	"Daytime",
}

local daytime_wait_types = {
	"Next Morning",
	"Next Evening",
	"Next Workshift",
	"First Workshift",
	"Second Workshift",
	"Third Workshift",
}

DefineClass.SA_WaitMarsTime = {
	__parents = { "SA_WaitBase" },
	
	properties = {
		{ id = "wait_type", name = T{3777, "Wait type"}, editor = "dropdownlist", items = function() return wait_types end, default = wait_types[1],},
		
		--hours/days
		{ id = "fake_dur", name = function(self) return self.wait_type == "Hours" and T{3778, "Hours"} or T{3779, "Sols"} end, editor = "number", default = 0, no_edit = function(self) return self.wait_type ~= "Sols" and self.wait_type ~= "Hours" end, dont_save = true,},
		{ id = "fake_rand_dur", name = function(self) return self.wait_type == "Hours" and T{3780, "Random Hours"} or T{3781, "Random Sols"} end, editor = "number", default = 0, no_edit = function(self) return self.wait_type ~= "Sols" and self.wait_type ~= "Hours" end, dont_save = true,},
		{ id = "duration", editor = "number", name = "", no_edit = true,},
		{ id = "rand_duration", name = "", editor = "number", no_edit = true, },
		{ id = "loops", name = "", editor = "number", default = 0, no_edit = true, },
		--specific hours/days
		{ id = "target_hour", name = T{3782, "Target hour"}, no_edit = function(self) return self.wait_type ~= "Specific Hour" end, editor = "number", default = 0, min = 0, max = 24},
		{ id = "target_sol", name = T{3783, "Target Sol"}, no_edit = function(self) return self.wait_type ~= "Specific Sol" end, editor = "number", default = 0,},
		--daytime props
		{ id = "wait_subtype", name = T{3784, "Wait subtype"}, editor = "dropdownlist", items = function() return daytime_wait_types end, default = daytime_wait_types[1], no_edit = function(self) return self.wait_type ~= "Daytime" end, },
		{ id = "target_workshift", name = T{""}, editor = "number", default = 1, no_edit = true, },
	},
	
	duration = 1000, --wait time between stopwait reeval or wait dur.
	rand_duration = 0,
	
	--ui
	MenuName = "Wait Hours/Sols",
	Menu = "Gameplay",
	MenuSection = "Mysteries",
}

function SA_WaitMarsTime:Setwait_type(val)
	self.wait_type = val
	self:EvalParams()
end

function SA_WaitMarsTime:Setwait_subtype(val)
	self.wait_subtype = val
	self:EvalParams()
end

function SA_WaitMarsTime:Setfake_dur(val)
	if self.wait_type == "Hours" then
		self.duration = val * const.HourDuration
	elseif self.wait_type == "Sols" then
		self.duration = val * const.DayDuration
	else
		self.duration = val
	end
end

function SA_WaitMarsTime:Getfake_dur()
	if self.wait_type == "Hours" then
		return self.duration / const.HourDuration
	elseif self.wait_type == "Sols" then
		return self.duration / const.DayDuration
	else
		return self.duration
	end
end

function SA_WaitMarsTime:Setfake_rand_dur(val)
	if self.wait_type == "Hours" then
		self.rand_duration = val * const.HourDuration
	elseif self.wait_type == "Sols" then
		self.rand_duration = val * const.DayDuration
	else
		self.rand_duration = val
	end
end

function SA_WaitMarsTime:Getfake_rand_dur()
	if self.wait_type == "Hours" then
		return self.rand_duration / const.HourDuration
	elseif self.wait_type == "Sols" then
		return self.rand_duration / const.DayDuration
	else
		return self.rand_duration
	end
end

function SA_WaitMarsTime:EvalParams()
	--deduce props from type combo
	if self.wait_type == "Daytime" then
		if self.wait_subtype == "Next Morning" then
			self.target_hour = 4 --morning
			self.target_workshift = nil
		elseif self.wait_subtype == "Next Evening" then
			self.target_hour = 21 --evening
			self.target_workshift = nil
		elseif self.wait_subtype == "First Workshift" then
			self.target_workshift = 1
			self.target_hour = nil
		elseif self.wait_subtype == "Second Workshift" then
			self.target_workshift = 2
			self.target_hour = nil
		elseif self.wait_subtype == "Third Workshift" then
			self.target_workshift = 3
			self.target_hour = nil
		else
			self.target_workshift = nil
			self.target_hour = nil
		end
		
		self.target_sol = nil
		self.rand_duration = 0
		self.loops = false --inf checks
		self.duration = const.HourDuration --checks per hour
	elseif self.wait_type == "Specific Sol" then
		self.rand_duration = 0
		self.loops = false --inf checks
		self.target_hour = nil
		self.target_workshift = nil
		self.duration = const.HourDuration --checks per hour
		self.wait_subtype = daytime_wait_types[1]
	elseif self.wait_type == "Specific Hour" then
		self.rand_duration = 0
		self.loops = false --inf checks
		self.target_sol = nil
		self.target_workshift = nil
		self.duration = const.HourDuration --checks per hour
		self.wait_subtype = daytime_wait_types[1]
	else
		self.loops = 0
		self.target_hour = nil
		self.target_sol = nil
		self.target_workshift = nil
		self.wait_subtype = daytime_wait_types[1]
	end
end

function SA_WaitMarsTime:StopWait()
	if self.wait_type == "Specific Hour" then
		return self.target_hour == UICity.hour or (GameTime() - self.meta.start_time) >= const.DayDuration
	elseif self.wait_type == "Specific Sol" then
		return self.target_sol <= UICity.day
	elseif self.wait_type == "Daytime" then
		if self.wait_subtype == "Next Morning" or self.wait_subtype == "Next Evening" then
			return self.target_hour == UICity.hour or (GameTime() - self.meta.start_time) >= const.DayDuration
		else
			return CurrentWorkshift == self.target_workshift or (GameTime() - self.meta.start_time) >= const.DayDuration	
		end
	end
	
	
	return false
end

function SA_WaitMarsTime:OnExacReEvalParams()
	if self.wait_type == "Daytime" then
		if self.wait_subtype == "Next Workshift" then
			self.target_workshift = CurrentWorkshift < 3 and (CurrentWorkshift + 1) or 1
		end
	end
end

function SA_WaitMarsTime:Exec(...)
	self:OnExacReEvalParams()
	return SA_WaitBase.Exec(self, ...)
end

function SA_WaitMarsTime:GetFirstDescStr()
	if self.wait_type == "Hours" or self.wait_type == "Sols" then
		return string.format("%s%s", tostring(self:Getfake_dur()), self.rand_duration ~= 0 and string.format(" + rand(0 - %s)", tostring(self:Getfake_rand_dur())) or "")
	else
		return "until"
	end
	
end

function SA_WaitMarsTime:GetSecondDescStr()
	if self.wait_type == "Hours" or self.wait_type == "Sols" then
		return self.wait_type
	elseif self.wait_type == "Specific Hour" then
		return "hour " .. tostring(self.target_hour)
	elseif self.wait_type == "Specific Sol"  then
		return "sol " .. tostring(self.target_sol)
	else
		return self.wait_subtype
	end
end


function SA_WaitMarsTime:ShortDescription()
	return string.format("Wait %s %s", self:GetFirstDescStr(), self:GetSecondDescStr())
end
--

function ReplaceAllBuildingsOnMap()
	CreateRealTimeThread(function()
		local query_func = function(bld)
				if not IsKindOf(bld, "DroneHub") and (not IsKindOf(bld, "RechargeStation") or bld.hub == false) then
					local a = bld:GetAngle()
					local p = bld:GetPos()
					local t = bld.template_name
					local perma = bld:GetGameFlags(const.gofPermanent) ~= 0
					
					local piles = bld:GetAttaches("ResourceStockpileBase")
					for i = 1, #(piles or "") do --so they get destroyed insted of released.
						piles[i]:SetStoredAmount(0)
					end
					
					DoneObject(bld)
					
					
					bld = PlaceBuilding(t)
					bld:SetPos(p)
					bld:SetAngle(a)
					if perma then
						bld:SetGameFlags(const.gofPermanent)
					end
				end
		end
		
		MapForEach(true, "Building", query_func)
		Sleep(100)
		--pass 2 all hubs
		query_func = function(bld)
			local a = bld:GetAngle()
			local p = bld:GetPos()
			local t = bld.template_name
			local perma = bld:GetGameFlags(const.gofPermanent) ~= 0
			
			for i = 1, #bld.drones do --kill all drones
				DoneObject(bld.drones[i])
			end
			
			DoneObject(bld)
			
			bld = PlaceBuilding(t)
			bld:SetPos(p)
			bld:SetAngle(a)
			if perma then
				bld:SetGameFlags(const.gofPermanent)
			end
		end
		MapForEach(true, "DroneHub", query_func)
	end)
end

DefineClass.ScenarioPosMarker = {
	__parents = { "PosMarkerObj" },
	custom_label = false,
}

function ScenarioPosMarker:GameInit()
	if self.custom_label then
		UICity:AddToLabel(self.custom_label, self)
	end
end

function ScenarioPosMarker:Done()
	if self.custom_label then
		UICity:RemoveFromLabel(self.custom_label, self)
	end
end

----------------------
DefineClass.SA_CallTradeRocket = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "rocket_id", name = T{93, --[[Post-Cert]] "ID"}, editor = "text", default = "", },
		{ id = "display_name", name = T{1153, --[[Post-Cert]] "Display Name"}, editor = "text", default = "", translate = true },
		{ id = "description", name = T{1000017, --[[Post-Cert]] "Description"}, editor = "text", default = "", translate = true },

		{ id = "resource1", name = T{15, --[[Post-Cert]] "Resource"}, editor = "dropdownlist", default = "", items = ResourcesDropDownListItems },
		{ id = "amount1", name = T{1000100, --[[Post-Cert]] "Amount"}, editor = "number", scale = const.ResourceScale, default = 0 },
		{ id = "resource2", name = T{15, --[[Post-Cert]] "Resource"}, editor = "dropdownlist", default = "", items = ResourcesDropDownListItems },
		{ id = "amount2", name = T{1000100, --[[Post-Cert]] "Amount"}, editor = "number", scale = const.ResourceScale, default = 0 },
		{ id = "resource3", name = T{15, --[[Post-Cert]] "Resource"}, editor = "dropdownlist", default = "", items = ResourcesDropDownListItems },
		{ id = "amount3", name = T{1000100, --[[Post-Cert]] "Amount"}, editor = "number", scale = const.ResourceScale, default = 0 },
		{ id = "resource4", name = T{15, --[[Post-Cert]] "Resource"}, editor = "dropdownlist", default = "", items = ResourcesDropDownListItems },
		{ id = "amount4", name = T{1000100, --[[Post-Cert]] "Amount"}, editor = "number", scale = const.ResourceScale, default = 0 },
		{ id = "resource5", name = T{15, --[[Post-Cert]] "Resource"}, editor = "dropdownlist", default = "", items = ResourcesDropDownListItems },
		{ id = "amount5", name = T{1000100, --[[Post-Cert]] "Amount"}, editor = "number", scale = const.ResourceScale, default = 0 },
		
		{ id = "travel_time_mars", name = T{7884, --[[Post-Cert]] "Travel time (to Mars)"}, editor = "number", scale = const.HourDuration, default = -1 * const.HourDuration},
		{ id = "travel_time_earth", name = T{7885, --[[Post-Cert]] "Travel time (to Earth)"}, editor = "number", scale = const.HourDuration, default = -1 * const.HourDuration},
		{ id = "fuel_amount", name = T{7886, --[[Post-Cert]] "Fuel Amount"}, editor = "number", scale = const.ResourceScale, default = -1 * const.ResourceScale},
	},
	
	
	Menu = "Gameplay",
	MenuName = "Call Trade Rocket",
	MenuSection = "Mysteries",
}

function SA_CallTradeRocket:WarningsCheck(seq_player, seq, registers)
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
	end
	
	local res, amount
	for i = 1, 5 do
		res = res or self["resource"..i] ~= ""
		amount = amount or self["amount"..i] > 0
	end
	
	if not res or not amount then
		seq_player:Error(self, "Trade resource/amounts not specified!")
	end	
end

function SA_CallTradeRocket:ShortDescription()
	return string.format("Call trade rocket %s", self.rocket_id)
end

function SA_CallTradeRocket:Exec(seq_player, ip, seq, registers)
	local city = UICity
	
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
		return
	end
	
	local trade_request = {}
	for i = 1, 5 do
		local res = self["resource"..i]
		local amount = self["amount"..i]
		
		if res ~= "" and amount > 0 then
			table.insert(trade_request, {resource = res, amount = amount})
		end
	end
	
	if #trade_request == 0 then
		seq_player:Error(self, "Trade resource/amounts not specified!")
		return
	end
	
	local rocket = PlaceBuilding("TradeRocket", {city = city, custom_id = self.rocket_id, export_goods = trade_request})	
	
	local cargo = false
	if self.display_name ~= "" then
		cargo = { rocket_name = _InternalTranslate(self.display_name) }
	end
	
	if self.description ~= "" then
		rocket.description = self.description
	end
	
	if self.travel_time_mars >= 0 then
		rocket.custom_travel_time_mars = self.travel_time_mars
	end
	
	if self.travel_time_earth >= 0 then
		rocket.custom_travel_time_earth = self.travel_time_earth
	end
	
	if self.fuel_amount > 0 then
		rocket.launch_fuel = self.fuel_amount
	end
	
	rocket:SetCommand("FlyToMars", cargo)
	Sleep(1) -- give time for the rocket to initialize and register
end

local RocketWaitStatuses = { "in orbit", "landed", "takeoff", "departing", "on earth" }

DefineClass.SA_WaitTradeRocket = {
	__parents = { "SA_WaitBase" },
	
	properties = {
		{ id = "rocket_id", name = T{93, --[[Post-Cert]] "ID"}, editor = "text", default = "", },
		{ id = "wait_status", name = T{7887, --[[Post-Cert]] "Wait status"}, editor = "dropdownlist", items = RocketWaitStatuses, default = "on earth" },
	},
		
	--ui
	MenuName = "Wait Trade Rocket",
	Menu = "Gameplay",
	MenuSection = "Mysteries",
	
	msg = "RocketStatusUpdate",
}

function SA_WaitTradeRocket:WarningsCheck(seq_player, seq, registers)
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
	end
end

function SA_WaitTradeRocket:ShortDescription()
	return string.format("Wait %s rocket status %s", self.rocket_id, self.wait_status)
end

function SA_WaitTradeRocket:StopWait()
	if self.rocket_id == "" then
		return true -- nothing to wait
	end
	
	local rockets = UICity.labels.TradeRocket or empty_table	
	local wait_idx = table.find(RocketWaitStatuses, self.wait_status)
	
	for _, rocket in ipairs(rockets) do
		if rocket.custom_id == self.rocket_id then
			local idx = table.find(RocketWaitStatuses, rocket.status)
			return idx and idx >= wait_idx
		end
	end
	
	return true -- rocket not found, stop waiting
end

----------------------
DefineClass.SA_CallRefugeeRocket = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "rocket_id", name = T{93, --[[Post-Cert]] "ID"}, editor = "text", default = "", },
		{ id = "display_name", name = T{1153, --[[Post-Cert]] "Display Name"}, editor = "text", default = "", translate = true },
		{ id = "description", name = T{1000017, --[[Post-Cert]] "Description"}, editor = "text", default = "", translate = true },

		{ id = "travel_time_mars", name = T{7884, --[[Post-Cert]] "Travel time (to Mars)"}, editor = "number", scale = const.HourDuration, default = -1 * const.HourDuration},
		
		-- refugees
		{ id = "timeout", name = T{8457, "Passenger Orbit Lifetime"}, editor = "number", default = -1*const.HourDuration, scale = const.HourDuration, },
		{ id = "num_refugees", name = T{8083, "Num Refugees"}, editor = "number", min = 1, default = 10},
		{ id = "refugee",  name = T{8084, "Add Refugee Trait"}, editor = "bool", default = true },
		{ id = "trait1", name = T{8085, "Trait 1"}, editor = "dropdownlist", items = function() return BaseTraitsCombo(UICity, true) end, default = "", },
		{ id = "chance1", name = T{8086, "Trait 1 chance"}, editor = "number", min = 0, max = 100, default = 0 },
		{ id = "trait2", name = T{8087, "Trait 2"}, editor = "dropdownlist", items = function() return BaseTraitsCombo(UICity, true) end, default = "", },
		{ id = "chance2", name = T{8088, "Trait 2 chance"}, editor = "number", min = 0, max = 100, default = 0 },
		{ id = "trait3", name = T{8089, "Trait 3"}, editor = "dropdownlist", items = function() return BaseTraitsCombo(UICity, true) end, default = "", },
		{ id = "chance3", name = T{8090, "Trait 3 chance"}, editor = "number", min = 0, max = 100, default = 0 },
	},
	
	
	Menu = "Gameplay",
	MenuName = "Call Refugee Rocket",
	MenuSection = "Mysteries",
}

function SA_CallRefugeeRocket:WarningsCheck(seq_player, seq, registers)
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
	end
end

function SA_CallRefugeeRocket:ShortDescription()
	return string.format("Call refugee rocket %s", self.rocket_id)
end

function SA_CallRefugeeRocket:Exec(seq_player, ip, seq, registers)
	local city = UICity
	
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
		return
	end
		
	local rocket = PlaceBuilding("RefugeeRocket", {city = city, custom_id = self.rocket_id})
	
	local cargo = {}
	if self.display_name ~= "" then
		cargo.rocket_name = _InternalTranslate(self.display_name)
	end
	
	if self.description ~= "" then
		rocket.description = self.description
	end
	
	
	if self.travel_time_mars >= 0 then
		rocket.custom_travel_time_mars = self.travel_time_mars
	end
	if self.timeout >= 0 then
		rocket.passenger_orbit_life = self.timeout
	end
	
	-- add refugees
	cargo[1] = { class = "Passengers", amount = self.num_refugees, applicants_data = {} }
	local data = cargo[1].applicants_data
	
	for j = 1, self.num_refugees do
		data[j] = GenerateColonistData(city, nil, nil,{no_traits = true})
		if self.refugee then
			data[j].traits.Refugee = true
		end
		for i = 1, 3 do
			local chance = self["chance"..i]
			local trait = self["trait"..i]
			if trait == "" or UICity:Random(100) >= chance then
				trait = GetRandomTrait(data[j].traits, {}, {}, nil, "base") 			
			end
			data[j].traits[trait] = true				
		end
	end
		
	rocket:SetCommand("FlyToMars", cargo)
	Sleep(1) -- give time for the rocket to initialize and register
end

DefineClass.SA_WaitRefugeeRocket = {
	__parents = { "SA_WaitBase" },
	
	properties = {
		{ id = "rocket_id", name = T{93, --[[Post-Cert]] "ID"}, editor = "text", default = "", help = T{8091, "g_RefugeeOutcome[id] will be either 'success' or 'timeout' after this."} },
	},
		
	--ui
	MenuName = "Wait Refugee Rocket",
	Menu = "Gameplay",
	MenuSection = "Mysteries",
	
	msg = "RocketStatusUpdate",
}

function SA_WaitRefugeeRocket:WarningsCheck(seq_player, seq, registers)
	if self.rocket_id == ""  then
		seq_player:Error(self, "Unspecified object!")
	end
end

function SA_WaitRefugeeRocket:ShortDescription()
	return string.format("Wait %s rocket", self.rocket_id)
end

function SA_WaitRefugeeRocket:StopWait()
	if self.rocket_id == "" then
		return true -- nothing to wait
	end
	
	local rockets = UICity.labels.RefugeeRocket or empty_table		
	for _, rocket in ipairs(rockets) do
		if rocket.custom_id == self.rocket_id then
			return false
		end
	end
	
	return true -- rocket not found, stop waiting
end

----------------------

DefineClass.SA_LabelModifier = {
	__parents = { "SA_Modifier" },
	properties = {
		{ id = "property",     name = "Property",     editor = "combo", default = "", items = function() return ModifiablePropsCombo() end},
		{ id = "target_label", name = "Target Label", editor = "combo", default = "", items = function() return LabelsCombo() end, help = "Target is one of the city labels", },
	},
	Menu = "Logic",
	MenuName = "Label Modifier",
}

function SA_LabelModifier:GetModifierTargetDescription()
	return self.target_label
end

function SA_LabelModifier:GetModifierProperty()
	return self.property:trim_spaces()
end

function SA_LabelModifier:WarningsCheck(seq_player, seq, registers)
	local label = self.target_label
	local property = self.property
	if property == "" or label == "" then
		seq_player:Error(self, "Missing param!")
	end
end

function SA_LabelModifier:Exec(player, ip, seq, registers)
	local label = self.target_label:trim_spaces()
	local property = self.property:trim_spaces()
	if property == "" or label == "" then
		return
	end
	-- label modifications are referenced by ID only
	local id = self.id ~= "" and self.id or string.format("%s.%s", player.seq_list.name, property)
	UICity:SetLabelModifier(label, id, false)
	if self.action == "remove" or self.amount == 0 and self.percent == 0 then
		return
	end
	local scale = ModifiablePropScale[property] or 1
	UICity:SetLabelModifier(label, id, Modifier:new{
		prop = property,
		amount = self.amount * scale,
		percent = self.percent,
		id = id,
	})
end

----