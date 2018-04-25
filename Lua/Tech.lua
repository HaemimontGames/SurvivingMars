function ClearTechTree()
	TechTree = {}
	TechFields = {}
	TechDef = {}
	BuildingTechRequirements = {}
	CropTechRequirements = {}
	TraitTechRequirements = {}
end

if FirstLoad then
	ClearTechTree()
end

function GetTechFieldsCombo()
	local results = table.imap(TechTree, "id")
	table.sort(results)
	table.insert(results, 1, "")
	return results
end

--tech research costs
local def_cost = {
	1000, 2000, 3000, 4000, 5000,
	7000, 9000, 11000, 13000, 15000,
	18000, 20000, 23000, 26000, 29000,
	33000, 37000, 41000, 45000, 50000}
	
DefineClass.TechField = {
	__parents = { "PropertyObject" },
	properties = {
		{ category = "Field", id = "id",                name = T{1000020, "ID"},                 editor = "text",         default = "No Name", },
		{ category = "Field", id = "display_name",      name = T{1000037, "Name"},               editor = "text",         default = T{3893, "No Name"}, translate = true },
		{ category = "Field", id = "icon",              name = T{94, "Icon"},                    editor = "text",         default = "UI/Icons/Research/rm_placeholder.tga", help = "Tech Game Icon" },
		{ category = "Field", id = "description",       name = T{1000017, "Description"},        editor = "text",         default = T{3894, "No Description"}, translate = true },
		{ category = "Field", id = "dlc",               name = T{3895, "Required DLC"},          editor = "combo",        default = "", items = DlcCombo() },
		{ category = "Field", id = "costs",             name = T{3896, "Research Costs"},        editor = "table",        default = def_cost, help = "Required Research Points For Each Tech Slot" },
		{ category = "Field", id = "discoverable",      name = T{3897, "Discoverable"},          editor = "bool",         default = true, help = "The tech in this field can be discovered through normal means." },
		{ category = "Field", id = "show_in_field",    	name = T{7545, "Show in Other Field"}, editor = "dropdownlist", default = "", items = GetTechFieldsCombo, help = "The tech in this field are visible in another UI group." },
		{ category = "Field", id = "hex_direction",     name = T{3899, "Position on hex grid"},  editor = "number",       default = 0, help = "Position on research screen hex grid, starting at 1 for upper right and proceeding CCW" },
	},
	PropEditorPaste = { "Tech" },
	PropEditorCopy = true,
}

----

local def_id = "<no name>"
local def_name = T{3900, "<no name>"}
local max_pos = 100
local def_pos = range(1, max_pos)

DefineClass.Tech = {
	__parents = { "PropertyObject" },
	properties = {
		{ category = "Tech", id = "id",               name = T{1000020, "ID"},                editor = "text",            default = def_id, help = "Tech ID" },
		{ category = "Tech", id = "display_name",     name = T{1000067, "Display Name"},      editor = "text",            default = def_name, translate = true, help = "Tech Game Name - translated string" },
		{ category = "Tech", id = "icon",             name = T{94, "Icon"},                   editor = "text",            default = "UI/Icons/Research/rm_placeholder.tga", help = "Tech Game Icon" },
		{ category = "Tech", id = "dlc",              name = T{3895, "Required DLC"},         editor = "combo",           default = "",      items = DlcCombo(), help = "Required DLC" },
		{ category = "Tech", id = "description",      name = T{1000017, "Description"},       editor = "multi_line_text", default = "",      translate = true, min = 3, font_size = 8, help = "Tech Description - translated text" },
		{ category = "Tech", id = "position",         name = T{3901, "Unlock Position"},      editor = "range",           default = def_pos, min = 1, max = max_pos, help = "Shuffle slot range" },
		{ category = "Tech", id = "repeatable",       name = T{3902, "Research Repeatable"},  editor = "bool",            default = false, help = "Can be researched multiple times" },
		{ category = "Tech", id = "cost_increase",    name = T{8714, "Repeat Cost Increase (%)"},   editor = "number",          default = 10, help = "Base research cost increase for repeatable techs" },
		
		{ category = "Tech", id = "OnGameInit",   editor = "func", params = "self, city" },
		{ category = "Tech", id = "OnResearchComplete",   editor = "func", params = "self, city" },
		
		{ category = "Params", id = "param1comment",    name = T{3903, "Param 1 Comment"},		    editor = "text",				default = "" },
		{ category = "Params", id = "param1",			 name = T{3904, "Param 1"},						 editor = "number",			default = 0 },
		{ category = "Params", id = "param2comment",    name = T{3905, "Param 2 Comment"},		    editor = "text",				default = "" },
		{ category = "Params", id = "param2",			 name = T{3906, "Param 2"},						 editor = "number",			default = 0 },
		{ category = "Params", id = "param3comment",    name = T{3907, "Param 3 Comment"},		    editor = "text",				default = "" },
		{ category = "Params", id = "param3",			 name = T{3908, "Param 3"},						 editor = "number",			default = 0 },
		{ category = "Params", id = "param4comment",    name = T{3909, "Param 4 Comment"},		    editor = "text",				default = "" },
		{ category = "Params", id = "param4",			 name = T{3910, "Param 4"},						 editor = "number",			default = 0 },
		{ category = "Params", id = "param5comment",    name = T{3911, "Param 5 Comment"},		    editor = "text",				default = "" },
		{ category = "Params", id = "param5",			 name = T{3912, "Param 5"},						 editor = "number",			default = 0 },
		
		{ category = "City", id = "cost",             name = T{3914, "Research Cost"},             editor = "number",          default = 0,       read_only = true, no_edit = true, dont_save = true, help = "Research cost. Depends on the tech field costs table and the tech position in the city research tree." },
		{ category = "City", id = "field",            name = T{3915, "Tech Field"},                editor = "text",            default = "",      read_only = true, no_edit = true, help = "Research field. Initialized by the city when the research tree is constructed." },		
		
		{ category = "Mystery", id = "mystery",       name = T{3916, "From Mystery"},              editor = "combo",           default = false,   items = function() return ClassDescendantsList("MysteryBase") end, help = "This tech will get initialized with the selected mystery, non mystery related techs should leave this blank." },		
	},
	PropEditorCopy = true,
	PropEditorPaste = { "TechEffect" },
	
	disable_reason = false,
}

function Tech:Setid(id)
	if id == def_id then
		self.id = nil
		return
	end
	if TechDef[self.id] == self then
		TechDef[self.id] = nil
	end
	while TechDef[id] do
		id = id .. "_new"
	end
	self.id = id
	TechDef[id] = self
end

function Tech:GetIdentifier()
	return self.id
end

function Tech:Getcost()
	return UICity:TechCost(self.id)
end

function Tech:ResearchQueueCost(queue_idx)
	return UICity:ResearchQueueCost(self.id, queue_idx)
end

function Tech:Getseq_position()
	return UICity:TechSeqPosition(self.id)
end

function Tech:WarningsCheck(params)
	for i=1,#self do
		self[i]:WarningsCheck(self, params)
	end
end

function Tech:Initialize(city)
	self:OnGameInit(city)
	for i=1,#self do
		self[i]:OnGameInit(city, self)
	end
end

function Tech:OnGameInit(city)
end

function Tech:ResearchComplete(city)
	self:OnResearchComplete(city)
	for i=1,#self do
		self[i]:OnResearchComplete(city, self)
	end
end

function Tech:OnResearchComplete(city)	
end

function Tech:GetFieldDisplayName()
	local field = TechFields[self.field]
	return field and field.display_name or ""
end

function Tech:GetFieldDescription()
	local field = TechFields[self.field]
	return field and field.description or ""
end

function OnMsg.GenerateDocs(project_folder, empty_name)
	local output = {
		"# Documentation for *Technology Names*\n",		
		}
	local outputFileName = project_folder.."LuaFunctionDoc_TechnologyNames.md.html"
	for i = 1 , #TechTree do
		local field = TechTree[i]
		local field_id = field.id
		if field_id~="Mysteries" then
			output[#output+1] = "##  "..field_id
			if field.description then
				output[#output+1] = TDevModeGetEnglishText(field.description)
			end
			output[#output+1] = ""
			local techs_by_name = {}
			for _, tech in ipairs(field) do
				local tech_info = {}
				tech_info.name = TDevModeGetEnglishText(tech.display_name)
				tech_info.desc = TDevModeGetEnglishText(tech.description)
				tech_info.id = tech.id
				if tech_info.desc then
					local part1, part2 = tech_info.desc:match("(.*)<grey>(.*)")
					if part1 then
						tech_info.desc = part1
					end
					for i = 1, 5 do
						local current_param = "param"..i
						local text1, text2 = tech_info.desc:match("(.* %+*)<"..current_param..">(.*)")
						if text2 and tech[current_param] then
							tech_info.desc = text1..tech[current_param]..text2
						end	
					end
				end
				tech_info.pos = tech.position or range(1, 100)
				techs_by_name[#techs_by_name +1] = tech_info
			end
			table.sort(techs_by_name, function(a, b) return a.name<b.name end)
			for _, single_tech in ipairs(techs_by_name) do
				output[#output+1] = "###  "..single_tech.name
				output[#output+1] = single_tech.desc
				output[#output+1] = "Internal ID\n: "..single_tech.id
				output[#output+1] = "Position in range\n: "..single_tech.pos.from.." to "..single_tech.pos.to
			end
		end
	end
	local filename = project_folder .. empty_name
	local err, suffix = AsyncFileToString(filename)
	if err then 
		print("Failed to open", filename, err)
	else
		output[#output+1] = suffix
		err = AsyncStringToFile(outputFileName, table.concat(output, "\n"))
		if err then
			print("Failed to save", filename, err)
		end
	end
end

function OnMsg.DataLoaded()
	for i=1,#TechTree do
		local field = TechTree[i]
		for j=1,#field do
			local tech = field[j]
			for k=1,#tech do
				tech[k]:OnDataLoaded(tech)
			end
		end
	end
end

----
local tech_effect_classes = {}
function OnMsg.ClassesBuilt()
	assert(not next(tech_effect_classes))
	ClassDescendants("TechEffect", function(name, classdef)
		table.insert(tech_effect_classes, {value = name, text = classdef:GetDescription()})
		classdef.Type = name
	end)
	table.sortby_field(tech_effect_classes, "text")
end

DefineClass.TechEffect = {
	__parents = { "PropertyObject" },
	properties = {
		{ category = "Effect", id = "Type", name = "Type", editor = "dropdownlist", default = false, items = tech_effect_classes, object_update = true, dont_save = true },
	},
	PropEditorCopy = true,
}

function TechEffect:OnDataLoaded(tech)
end

function TechEffect:SetType(new_class)
	if not new_class or self.class == new_class then
		return
	end
	local classdef = g_Classes[new_class]
	assert(IsKindOf(classdef, "TechEffect"))
	if classdef then
		setmetatable(self, classdef)
	end
end

function TechEffect:WarningsCheck(tech, params)
end

function TechEffect:OnGameInit(city, tech)
end

function TechEffect:OnResearchComplete(city, tech)
end

function TechEffect:GetResearchSpeedMod(city, tech)
	return 0
end

function TechEffect:GetDescription()
	return "Tech effect"
end

----

DefineClass.TechEffect_UnlockBuilding = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Unlock", id = "Building",     name = "Building",         editor = "dropdownlist", default = "", items = BuildingsCombo, editor_update = true },
		{ category = "Unlock", id = "HideBuilding", name = "Hide Building",    editor = "bool",         default = false,  },
	},
}

function TechEffect_UnlockBuilding:WarningsCheck(tech, params)
	if self.Building == "" then 
		print("Specify building class for Unlock Building effect in Tech:", tech:GetIdentifier())
	elseif not DataInstances.BuildingTemplate[self.Building] then
		print("Non-existent building", self.Building, "for Unlock Building effect in Tech:", tech:GetIdentifier())
	end
end

function TechEffect_UnlockBuilding:GetDescription()
	return "Unlock building " .. self.Building
end

function TechEffect_UnlockBuilding:OnDataLoaded(tech)
	local building = self.Building
	local requirements = BuildingTechRequirements[building] or {}
	BuildingTechRequirements[building] = requirements
	requirements[#requirements + 1] = { tech = tech.id, hide = self.HideBuilding }
end

--[[@@@
	Locks a building from the build menu. This method ignores tech effects. Note that this method will override anything done to the same building by the "Control Building Prerequisites" sequence action.

	@function void Gameplay@LockBuilding(string template_name[, string lock_type, T disable_reason])
	@param string template_name - The template name of the building to be locked.
	@param string template_name - Optional. Lock type can be "hide", where the building will not be visible in the build menu, "disable", where the building will be visible but not clickable. Any string different from "hide" and "disable" defaults to "hide". Omitting the value defaults to "hide".
	@param T template_name - Optional. If lock type is "disable" the rollover information string can be provided with this param. It has to be a localized string. If omitted will default to "This building has been disabled".
	@result void
]]
function LockBuilding(template_name, lock_type, disable_reason)
	disable_reason = IsT(disable_reason) and disable_reason or T{3709, "This building has been disabled"}
	if not lock_type or lock_type ~= "disable" then
		BuildMenuPrerequisiteOverrides[template_name] = "hide"
	elseif lock_type == "disable" then
		BuildMenuPrerequisiteOverrides[template_name] = disable_reason	
	end
end

--[[@@@
	Unlocks a building in the build menu regardless of tech effects that may be locking it (in contrast to [RemoveBuildingLock](#RemoveBuildingLock)).

	@function void Gameplay@UnlockBuilding(string template_name)
	@param string template_name - The template name of the building to be unlocked.
	@result void
	See also: [RemoveBuildingLock](#RemoveBuildingLock)
]]
function UnlockBuilding(template_name)
	BuildMenuPrerequisiteOverrides[template_name] = true
end

--[[@@@
	Unlocks a building in the build menu, but doesn't interfere with tech effects that may be locking it (in contrast to [UnlockBuilding](#UnlockBuilding)).
	
	@function void Gameplay@RemoveBuildingLock(string template_name)
	@param string template_name - The template name of the building to be unlocked.
	@result void
	See also: [UnlockBuilding](#UnlockBuilding)
]]
function RemoveBuildingLock(template_name)
	BuildMenuPrerequisiteOverrides[template_name] = nil
end

----

DefineClass.TechEffect_GiveFunding = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Funding", id = "Funding", name = "Funding (M)", editor = "number", default = 0 },
	},
}

function TechEffect_GiveFunding:WarningsCheck(tech, params)
	if self.Funding == 0 then 
		print("Zero funding value for Give Funding effect in Tech:", tech:GetIdentifier())
	end
end

function TechEffect_GiveFunding:GetDescription()
	return "Give funding " .. (self.Funding > 0 and tostring(self.Funding) or "")
end

function TechEffect_GiveFunding:OnResearchComplete(city, tech)
	city:ChangeFunding(self.Funding * 1000000)
end

--[[@@@
Change funding  by adding or removing any value(in millions).
@function void Gameplay@ChangeFunding(int funding)
@param int funding - +/- value in M 1M=1000*1000
@result void
]]
function ChangeFunding(value)
	return UICity:ChangeFunding(value * 1000000)
end
----

DefineClass.TechEffect_TechBoost = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Field",     name = "Field",         editor = "dropdownlist", default = "", items = GetTechFieldsCombo },
		{ category = "Modify", id = "Percent",    name = "Boost percent (%)", editor = "number",         default = 0,  },
	},
}

function TechEffect_TechBoost:GetDescription()
	local str ="Research speed boost "
	if self.Percent ~= 0 then
		str = str .. tostring(self.Percent) .. "%"
		if self.Field ~= "" then
			str = str .. " in " .. self.Field
		end
	end
	return str
end

function TechEffect_TechBoost:OnResearchComplete(city, tech)
	city:BoostTechField(self.Field, self.Percent)
end
	
----

local function UpgradeIdListCombo()
	local items = GetUpgradeIdList()
	items = table.get_unique(items)
	table.sort(items)
	table.insert(items, 1, "")
	return items
end

DefineClass.TechEffect_UnlockUpgrade = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Unlock", id = "Upgrade", name = "Upgrade", editor = "dropdownlist", default = "", items = UpgradeIdListCombo }
	},
}

function TechEffect_UnlockUpgrade:GetDescription()
	return "Unlock upgrade " .. self.Upgrade
end

function TechEffect_UnlockUpgrade:OnResearchComplete(city, tech)
	city:UnlockUpgrade(self.Upgrade)
end

function TechEffect_UnlockUpgrade:WarningsCheck(tech, params)
	params.upgrades = params.upgrades or GetUpgradeIdList()
	if self.Upgrade == "" then 
		print("Specify Upgrade for Unlock Upgrade effect in Tech:", tech:GetIdentifier())
	elseif not table.find(params.upgrades, self.Upgrade) then
		print("Unlock Upgrade effect from", tech:GetIdentifier(), "references non-existent ugrade", self.Upgrade)
	end
end
--[[@@@
	Unlock upgrade so it is available for construction in all building types that has such upgrade id described in their building template. 
	@function void Gameplay@UnlockUpgrade(string upgrade_id)
	@param string upgrade_id - Unique upgrade id set in upgrade definition in building templates.
--]]
function UnlockUpgrade(upgrade_id)
	UICity:UnlockUpgrade(upgrade_id)
end
----

function LabelsCombo()
	local labels = {}
	Msg("GatherLabels", labels)
	labels = table.keys(labels, true)
	table.insert(labels, 1, "")
	return labels
end

DefineClass.TechEffect_ModifyLabel = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Label",    name = "Label",    editor = "combo",  default = "", items = LabelsCombo },
		{ category = "Modify", id = "Prop",     name = "Property", editor = "combo",  default = "", items = ModifiablePropsCombo },
		{ category = "Modify", id = "Amount",   name = "Amount",   editor = "number", default = 0 },
		{ category = "Modify", id = "Percent",  name = "Percent",  editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
}

function TechEffect_ModifyLabel:GetDescription()
	if self.Amount == 0 and self.Percent == 0 then
		return "Modify label"
	elseif self.Amount == 0 then
		return string.format("Modify %s.%s by %s%d%%", self.Label, self.Prop, self.Percent >= 0 and "+" or "", self.Percent)
	elseif self.Percent == 0 then
		return string.format("Modify %s.%s by %s%d", self.Label, self.Prop, self.Amount >= 0 and "+" or "", self.Amount)
	else
		return string.format("Modify %s.%s by %s%d%% %s%d", self.Label, self.Prop, self.Percent >= 0 and "+" or "", self.Percent, self.Amount >= 0 and "+" or "", self.Amount)
	end
end

function TechEffect_ModifyLabel:OnResearchComplete(city, tech)
	local scale = ModifiablePropScale[self.Prop]
	if not scale then
		assert(false, print_format("Trying to modify a non-modifiable property", self.Label, "-", self.Prop))
		return
	end
	city:SetLabelModifier(self.Label, self, Modifier:new{
		prop = self.Prop,
		amount = self.Amount * scale,
		percent = self.Percent,
		id = tech:GetIdentifier(),
	})
end

function TechEffect_ModifyLabel:WarningsCheck(tech, params)
	params.labels = params.labels or LabelsCombo()
	if self.Label == "" then 
		print("Specify label to modify in", tech:GetIdentifier())
	elseif not table.find(params.labels, self.Label) then
		print("Modify Label effect from", tech:GetIdentifier(), "references non-existent label", self.Label)
	elseif not ModifiablePropScale[self.Prop] then
		print("Modify Label effect from", tech:GetIdentifier(), "targets a non-modifiable property", self.Prop)
	end
end

--[[@@@
Create a modifer for a label property.
A label property modifier looks up all objects within a _label_ and modifies one of their properties.
The modification can add an absolute value _amount_ and a relative value _percent_ (_0-100_). Both can be positive and negative.
You can create multiple modifiers for the same property of a label, but they **all must have unique IDs** (even between different mods).
The final value of a property is calculated using the formula: _original * (100 + total_percent) + total_amount_.
@function void Gameplay@CreateLabelModifier(string id, string label, string property, int amount, int percent)
@param string id - unique modification identifier.
@param string label - city label. e.g all buildings are listed in labels with their template_name and build menu category.
@param string property - property of that label/class.
@param int amount - amount to be added to the property value (default=_0_).
@param int percent - percent change of that value (default=_0_).
See also: [ChangeLabelModifier](#ChangeLabelModifier) and [RemoveLabelModifier](#RemoveLabelModifier)
]]
function CreateLabelModifier(id, label, property, amount, percent)
	if type(id) ~= "string" then ModLog(T{8678, "Creating modifier with invalid ID."}) return end
	if not UICity then ModLog(T{8679, "Creating modifier outside of a running game."}) return end
	
	local scale = ModifiablePropScale[property]
	if not scale then
		ModLog(T{8680, "Trying to modify a non-modifiable property."})
		return
	end
	
	local unique_id = property .. id
	if UICity.label_modifiers[label] and UICity.label_modifiers[label][unique_id] then
		ModLog(T{8681, "Modifier with that ID already exists."})
		return
	end
	
	UICity:SetLabelModifier(label, unique_id, Modifier:new{
		prop = property,
		amount = (amount or 0)*scale,
		percent = percent or 0,
		id = id,
	})
end

--[[@@@
Change an already existing label property modifier.
@function void Gameplay@ChangeLabelModifier(string id, string label, string property, int new_amount, int new_percent)
@param string id - modification identifier.
@param string label - label affected by the modification. Label **cannot** be changed - you must remove the old modifier and create a new one.
@param string property - property affected by the modification. Property **cannot** be changed - you must remove the old modifier and create a new one.
@param int amount - new amount to be added to the property value (default=_0_).
@param int percent - new percent change of that value (default=_0_).
See also: [CreateLabelModifier](#CreateLabelModifier) and [RemoveLabelModifier](#RemoveLabelModifier)
]]
function ChangeLabelModifier(id, label, property, new_amount, new_percent)
	if type(id) ~= "string" then ModLog(T{8682, "Changing modifier with invalid ID."}) return end
	if not UICity then ModLog(T{8683, "Changing modifier outside of a running game."}) return end

	local unique_id = property .. id
	if not (UICity.label_modifiers[label] and UICity.label_modifiers[label][unique_id]) then
		ModLog(T{8684, "Changing a non-existing modifier."})
		return
	end
	
	local scale = ModifiablePropScale[property]
	UICity:SetLabelModifier(label, unique_id, Modifier:new{
		prop = property,
		amount = (new_amount or 0)*scale,
		percent = new_percent or 0,
		id = id,
	})
end

--[[@@@
Removes an already existing label property modifier.
@function void Gameplay@RemoveLabelModifier(string id, string label, string property)
@param string id - modification identifier.
@param string label - label affected by the modification.
@param string property - property affected by the modification.
See also: [CreateLabelModifier](#CreateLabelModifier) and [ChangeLabelModifier](#ChangeLabelModifier)
]]
function RemoveLabelModifier(id, label, property)
	if type(id) ~= "string" then ModLog(T{8685, "Removing modifier with invalid ID."}) return end
	if not UICity then ModLog(T{8686, "Removing modifier outside of a running game."}) return end
	
	local unique_id = property .. id
	if not (UICity.label_modifiers[label] and UICity.label_modifiers[label][unique_id]) then
		ModLog(T{8687, "Removing a non-existing modifier."})
		return
	end
	
	UICity:SetLabelModifier(label, unique_id, false)
end

----

local function TimeUnitsCombo()
	local units = {
		{ value = 1, text = "real ms" },
		{ value = const.MinuteDuration, text = "game minutes" },
		{ value = const.HourDuration, text = "game hours" },
		{ value = const.DayDuration, text = "game days" },
	}
	for i=1,#units do
		units[units[i].value] = units[i].text
	end
	return units
end

DefineClass.TechEffect_ModifyLabelOverTime = {
	__parents = { "TechEffect_ModifyLabel" },
	properties = {
		{ category = "Modify", id = "TimeInterval", name = "Time Interval", editor = "number", default = 1, min = 1 },
		{ category = "Modify", id = "TimeUnits",    name = "Time Units",    editor = "dropdownlist", default = 1, items = TimeUnitsCombo },
		{ category = "Modify", id = "Repetitions",  name = "Repetitions",   editor = "number", default = 0 },
	},
}

function TechEffect_ModifyLabelOverTime:GetDescription()
	if self.Repetitions == 0 then
		return "Modify label over time"
	elseif self.Repetitions == 1 then
		return string.format("Modify label %s after %d %s", self.Label, self.TimeInterval, TimeUnitsCombo()[self.TimeUnits])
	else
		return string.format("Modify label %s every %d %s %d times", self.Label, self.TimeInterval, TimeUnitsCombo()[self.TimeUnits], self.Repetitions)
	end
end

function TechEffect_ModifyLabelOverTime:OnResearchComplete(city, tech)
	CreateGameTimeThread(function()
		local amount = 0
		local percent = 0
		local scale = ModifiablePropScale[self.Prop] or 1
		local interval = self.TimeUnits * self.TimeInterval
		for rep=1,self.Repetitions do
			Sleep(interval)
			amount = amount + self.Amount
			percent = percent + self.Percent
			city:SetLabelModifier(self.Label, self, Modifier:new{
				prop = self.Prop,
				amount = amount * scale,
				percent = percent,
				id = tech:GetIdentifier(),
			})
		end
	end)
end

----

DefineClass.TechEffect_CompoundEfficiency = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Label",     name = "Label",    editor = "combo",  default = "", items = LabelsCombo },
		{ category = "Modify", id = "Threshold", name = "Threshold", editor = "number", min = 0, default = 2, },
		{ category = "Modify", id = "Prop",      name = "Property", editor = "combo",  default = "", items = ModifiablePropsCombo },
		{ category = "Modify", id = "Amount",    name = "Amount",   editor = "number", default = 0 },
		{ category = "Modify", id = "Percent",   name = "Percent",  editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
}

function TechEffect_CompoundEfficiency:GetDescription()
	return "Compound efficiency"
end

function TechEffect_CompoundEfficiency:OnResearchComplete(city, tech)
	local effects = city.compound_effects[self.Label] or {}
	local scale = ModifiablePropScale[self.Prop]
	assert(not effects[tech.id])
	effects[tech.id] = { threshold = self.Threshold, amount = self.Amount * scale, percent = self.Percent, prop = self.Prop }
	city.compound_effects[self.Label] = effects
	
	local domes = city.labels.Dome or empty_table
	for i = 1, #domes do
		domes[i]:ApplyCompoundEffects(self.Label, tech.id)
	end
end

----

DefineClass.TechEffect_ModifyResupplyParam = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Item",    name = "Item",    editor = "combo",  default = "", items = ResupplyItemsCombo },
		{ category = "Modify", id = "Param", name = "Parameter", editor = "dropdownlist", default = "price", items = { {value = "price", text = T{3926, "Price"}}, { value = "weight", text = T{3596, "Weight"} } }, },
		{ category = "Modify", id = "Percent",  name = "Percent",  editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
}

function TechEffect_ModifyResupplyParam:GetDescription()
	return string.format("Modify resupply %s for %s", self.Param, self.Item)
end

function TechEffect_ModifyResupplyParam:WarningsCheck(tech, params)
	if not CargoPreset[self.Item] then
		print("Non-existent cargo item", self.Item, "for Modify Resupply Param effect in Tech:", tech:GetIdentifier())
		return
	end
end

function TechEffect_ModifyResupplyParam:OnResearchComplete(city, tech)
	ModifyResupplyParam(self.Item, self.Param, self.Percent)
end

----

DefineClass.TechEffect_UnlockResupplyItem = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Item",    name = "Item",    editor = "combo",  default = "", items = ResupplyItemsCombo },
	},
}

function TechEffect_UnlockResupplyItem:GetDescription()
	return "Unlock Resupply item " .. self.Item
end

function TechEffect_UnlockResupplyItem:WarningsCheck(tech, params)
	if not CargoPreset[self.Item] then
		print("Non-existent cargo item", self.Item, "for Unlock Resupply Item effect in Tech:", tech:GetIdentifier())
		return
	end
end

function TechEffect_UnlockResupplyItem:OnResearchComplete(city, tech)
	local def = RocketPayload_GetMeta(self.Item)
	if def then
		def.locked = false
	end
end

----

local properties = table.raw_copy(Tech.properties, 2)

DefineClass.TechEffect_EditProps = {
	__parents = { "TechEffect" },
	properties = properties,
	owner = false,
}

function TechEffect_EditProps:GetDescription()
	return "Properties"
end

function TechEffect_EditProps:GetOwner()
	local owner = self.owner
	if owner then
		return owner
	end
	for i=1,#TechTree do
		local field = TechTree[i]
		for j=1,#field do
			local tech = field[j]
			if table.find(tech, self) then
				self.owner = tech
				return tech
			end
		end
	end
end

for i=1,#properties do
	local meta = properties[i]
	meta.dont_save = true
	meta.modifiable = false
	local id = meta.id
	TechEffect_EditProps["Get" .. id] = function(self)
		local owner = self:GetOwner()
		return owner and owner:GetProperty(id)
	end
	TechEffect_EditProps["Set" .. id] = function(self, value)
		local owner = self:GetOwner()
		return owner and owner:SetProperty(id, value)
	end
end

function OnMsg.DataLoaded()
	for i=1,#TechTree do
		local field = TechTree[i]
		for j=1,#field do
			local tech = field[j]
			local props = table.find_value(tech, "class", "TechEffect_EditProps")
			if not props then
				table.insert(tech, 1, TechEffect_EditProps:new{owner = tech})
			else
				props.owner = tech
			end
		end
	end
end

----

DefineClass.TechEffect_UnlockTrait = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Unlock", id = "Trait", name = "Trait", editor = "dropdownlist", default = "", items = DataInstanceCombo("Trait") },
	},
}

function TechEffect_UnlockTrait:WarningsCheck(tech, params)
	if self.Trait == "" then 
		print("Specify Trait for unlocking in Tech:", tech:GetIdentifier())
	end
end

function TechEffect_UnlockTrait:GetDescription()
	return "Unlock trait " .. self.Trait
end

function TechEffect_UnlockTrait:OnGameInit(city, tech)
	local trait = self.Trait
	LockTrait(trait, tech.id)
end

function TechEffect_UnlockTrait:OnResearchComplete(city,tech)
	local trait = self.Trait
	UnlockTrait(trait, tech.id)
end

----
--can reach deeper deposits.
DefineClass.TechEffect_UnlockDeeperDeposits = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Unlock", id = "depth_levels", name = "Depth Levels to unlock:", editor = "number", default = 1, min = 1, max = 5, help = "Added to city's current max deposit depth exploitation val."} ,
	}
}

function TechEffect_UnlockDeeperDeposits:GetDescription()
	return "Subsurface deposit depth exploitation + " .. tostring(self.depth_levels)
end

function TechEffect_UnlockDeeperDeposits:OnResearchComplete(city, tech)
	city:IncrementDepositDepthExploitationLevel(self.depth_levels)
	UpdateScannedSectorVisuals("scanned")	
end
----

DefineClass.TechEffect_ModifyConstructionCost = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Construction", name = "Category", id = "Category", editor = "combo",  default = "",    items = BuildCategoriesCombo },
		{ category = "Construction", name = "Building", id = "Building", editor = "combo",  default = false, items = BuildingsCombo, no_edit = function(t) return t.Category ~= "" end },
		{ category = "Construction", name = "Stage",    id = "Stage",    editor = "combo",  default = false, items = ConstructionStages },
		{ category = "Construction", name = "Resource", id = "Resource", editor = "combo",  default = "all", items = ConstructionResourcesCombo },
		{ category = "Construction", name = "Percent",  id = "Percent",  editor = "number", default = 0 },	
	},
}

function TechEffect_ModifyConstructionCost:GetDescription()
	if not self.Building then
		return "Modify construction cost"
	else
		local Stage = self.Stage == 2 and "(2nd stage)" or ""
		return string.format("Modify %s construction cost of %s%s by %s%%", self.Resource, self.Building, Stage, self.Percent)
	end
end

function TechEffect_ModifyConstructionCost:OnResearchComplete(city, tech)
	local category = self.Category
	local resource = self.Resource
	if category == "" then --when no category is selected, then we're modifying for a single building
		if resource ~= "all" then --only 1 resource
			city:ModifyConstructionCost("add", self.Building, resource, self.Percent, self.Stage)
		else
			--modify all construction resources
			for i=1,#ConstructionResourceList do
				city:ModifyConstructionCost("add", self.Building, ConstructionResourceList[i], self.Percent, self.Stage)
			end
		end
	else
		--if modifying a whole category, first gather all building inside it
		local buildings = {}
		local templates = DataInstances.BuildingTemplate or ""
		for i = 1, #templates do
			local template = templates[i]
			if template.build_category == category then
				buildings[#buildings + 1] = template.name
			end
		end
		
		--same as above but for all buildings
		if resource ~= "all" then
			for i=1,#buildings do
				city:ModifyConstructionCost("add", buildings[i], resource, self.Percent, self.Stage)
			end
		else
			for i=1,#buildings do
				local building = buildings[i]
				for j=1,#ConstructionResourceList do
					city:ModifyConstructionCost("add", building, ConstructionResourceList[j], self.Percent, self.Stage)
				end
			end
		end
	end
end

function TechEffect_ModifyConstructionCost:WarningsCheck(tech, params)
	if self.Building and not DataInstances.BuildingTemplate[self.Building] then
		print("Non-existent building", self.Building, "for Modify Construction Cost effect in Tech:", tech:GetIdentifier())
	end
end
--[[@@@
Modify construction cost of  the specified building/category with the specified percent. Calling ModifyConstructionCost multiple times in one building with different percents, first sums all percents and then apply to the cost. 
@function void Gameplay@ModifyConstructionCost(string building_name, string construction_resource, int percent)
@param string building - single buidling template name or buildmenu category for all buildings from that category.
@param string construction_resource - one of construction resources (ConstructionResourceList = {"Concrete", "Metals", "Polymers", "BlackCube", "Electronics", "MachineParts", "PreciousMetals" }) or "all" for all construction resources.
@param int percent - change the cost with that percent.
--]]
function ModifyConstructionCost(building_name, construction_resource, percent)
	local templates = DataInstances.BuildingTemplate or ""
	local buildings = {}
	if templates[building_name] then
		buildings[#buildings + 1] = building_name
	else	
		for i = 1, #templates do
			local template = templates[i]
			if template.build_category == building_name then
				buildings[#buildings + 1] = template.name
			end
		end
	end
	--same as above but for all buildings
	if construction_resource ~= "all" then
		for i=1,#buildings do
			city:ModifyConstructionCost("add", buildings[i], construction_resource, percentp)
		end
	else
		for i=1,#buildings do
			local building = buildings[i]
			for j=1,#ConstructionResourceList do
				city:ModifyConstructionCost("add", building, ConstructionResourceList[j], percent)
			end
		end
	end
end
----

DefineClass.TechEffect_GrantTech = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Unlock", id = "Field",    name = T{3721, "Field"},    editor = "dropdownlist", items = ResearchFieldsCombo, default = "" },
		{ category = "Unlock", id = "Research", name = T{311, "Research"}, editor = "dropdownlist", items = ResearchTechsCombo,  default = "" },
		{ category = "Unlock", id = "Count",    name = T{3732, "Count"},    editor = "number", default = 1 },
	}
}

function TechEffect_GrantTech:GetDescription()
	if self.Field == "" or self.Research == "" then
		return "Grant tech"
	end
	return string.format("Grant tech %s in %s", self.Research, self.Field)
end

function TechEffect_GrantTech:OnResearchComplete(city, tech)
	if self.Research == "" then
		return
	end
	city:SetTechResearched(self.Research)
end

function TechEffect_GrantTech:WarningsCheck(tech, params)
	local field = TechFields[self.Field]
	if not field or not table.find(field, "id", self.Research)  then
		print("Grant Tech effect from", tech:GetIdentifier(), "references non-existent tech", self.Research, "in field", self.Field)
	end
end

--[[@@@
Research technology and gain its effect. If the technology property 'repeatable' is set to true, it can be researched multiple times.
@function void Gameplay@GrantTech(string tech_id)
@param string tech_id - technology internal id.
]]
function GrantTech(tech_id)
	UICity:SetTechResearched(tech_id)
end	

--[[@@@
Discovers a tech, revealing it in the Research UI.
@function void Gameplay@DiscoverTech(string tech_id)
@param string tech_id - technology internal id.
]]
function DiscoverTech(tech_id)
	UICity:SetTechDiscovered(tech_id)
end

--[[@@@
Instantly grant research points, as if a research center generated them.
@function void Gameplay@GrantResearchPoints(int amount)
@param int amount - amount of points to grant.
]]
function GrantResearchPoints(amount)
	UICity:AddResearchPoints(amount)
end

--[[@@@
Get the number of times a technology has been researched.
@function number Gameplay@IsTechResearched(string tech_id)
@param string tech_id - technology internal id.
@result - number of times this tech has been researched or nil, instead of zero.
]]
function IsTechResearched(tech_id)
	return UICity:IsTechResearched(tech_id)
end

--[[@@@
Check if a technology has been discovered.
@function number Gameplay@IsTechDiscovered(string tech_id)
@param string tech_id - technology internal id.
@result - index of discovery or nil, if not yet discovered.
]]
function IsTechDiscovered(tech_id)
	return UICity:IsTechDiscovered(tech_id)
end

--[[@@@
Check if a technology can be researched multiple times.
@function bool Gameplay@IsTechRepeatable(string tech_id)
@param string tech_id - technology internal id.
]]
function IsTechRepeatable(tech_id)
	return UICity:IsTechRepeatable(tech_id)
end

----
DefineClass.TechEffect_ModifyUprade = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Upgrade", id = "upgrade_id",    name = T{3928, "Upgrade ID"},    editor = "combo", items = UpgradeIdListCombo, default = false },	
		{ category = "Upgrade", id = "prop",     		 name = T{3699, "Property"}, 		editor = "combo",  default = "", items = ModifiablePropsCombo },
		{ category = "Upgrade", id = "amount",    	 name = T{1000100, "Amount"},    		editor = "number", default = 0, },	
		{ category = "Upgrade", id = "percent",    	 name = T{1000099, "Percent"},    		editor = "number", default = 0 },	
	}
}

function TechEffect_ModifyUprade:WarningsCheck(tech, params)	
	if not self.upgrade_id then
		print(tech:GetIdentifier(), "- TechEffect_ModifyUprade: No ugprade id provided")
	end
	if self.prop == "" then
		print(tech:GetIdentifier(), "- TechEffect_ModifyUprade: No property provided")
	end
	if self.amount == self.percent and self.amount == 0 then
		print(tech:GetIdentifier(), "- TechEffect_ModifyUprade: No amount or percent provided")
	end
end

function TechEffect_ModifyUprade:GetDescription()
	if not self.upgrade_id then
		return "Modify upgrade modifier"
	end
	return string.format("Adds to upgrade with id %s's modifers for property %s amount: %d, and percent: %d", self.upgrade_id or "N/A", self.prop, self.amount, self.percent)
end

function TechEffect_ModifyUprade:OnResearchComplete(city, tech)
	RegisterUpgradeModifierModifier(self.upgrade_id, self.prop, self.amount, self.percent)
end
----

DefineClass.TechEditor = {
	__parents = { "PropEditor", "InitDone" },
	
	PropEditorPaste = { "TechField", "Tech", "TechEffect" },
	PropEditorCloseOnChangeMap = false,
	PropEditorSaveOnSaveMap = false,
	PropEditorViews = {
		{
			name = "Default",
			height = 780,
			caption = "Tech Editor",
			{ title = "Tech Fields",  type = "list",  width = 300, items = '{display_name}' },
			{ title = "Tech List",    type = "list",  width = 300, items = '{display_name}', obj = 1 },
			{ title = "Tech Effects", type = "list",  width = 300, items = '{GetDescription}', obj = 2 },
			{ title = "Effect Props", type = "props", width = 300, obj = 3},
		},
	},

	PropEditorActions = {
		{ "New",       "ActionNew",    "Ctrl-N",    "new",     {"TechEditor", "TechField", "Tech"}},
		{ "Delete",    "ActionDelete", "Delete",    "delete!", {"TechEditor", "TechField", "Tech"} },
		{ "Save",      "ActionSave",   "Ctrl-S",    "save!"},
		{ "Move Up",   "ActionUp",     "Ctrl-Up",   "up",      {"TechEditor", "TechField", "Tech"} },
		{ "Move Down", "ActionDown",   "Ctrl-Down", "down!",   {"TechEditor", "TechField", "Tech"} },
		{ "Research",  "Research",	  "Ctrl-R", 		"play", 	 { "TechField" } },
	},
}

if Platform.developer then
UserActions.AddActions {
	["TechEditor"] = {
		menu = "[203]Editors/[01]Mars/Tech Editor",
		key = "Ctrl-Alt-T",
		action = function() 
			local _, window_id = PropEditor_GetFirstWindow("TechEditor")
			if not window_id then
				PropEditorOpen(TechEditor:new(TechTree)) 
			else
				PropEditorActivateWindow(window_id)
			end
		end,
	}
}
end

function TechEditor:Init()
	self:WarningsCheck()
end

--events
function TechEditor:OnObjectModified(object, prop_id)
	if prop_id == "Type" and IsKindOf(object, "TechEffect") then 
		PropEditorObjChanged(self)
	end
end

--actions
function TechEditor:ActionNew(obj, selected_index, selection, view_index)
	local new_obj
	if IsKindOf(obj, "Tech") then
		new_obj = TechEffect:new()
	elseif IsKindOf(obj, "TechField") then
		new_obj = Tech:new()
		new_obj[1] = TechEffect_EditProps:new{owner = new_obj}
	else
		obj = self
		new_obj = TechField:new()
	end
	local idx = (selected_index or #obj) + 1
	local redo_func = function()
		table.insert(obj, idx, new_obj)
		PropEditorObjChanged(self)
		return idx
	end
	local undo_func = function()
		local idx = table.remove_entry(obj, new_obj)
		PropEditorObjChanged(self)
		return idx and Max(1, idx - 1) or 1
	end
	redo_func()
	return idx, undo_func, redo_func
end

--actions
function TechEditor:ActionDelete(obj,selected_index,selection,view_index)
	obj = obj or self
	local del_obj = obj[selected_index]
	local redo_func = function()
		local idx = table.remove_entry(obj, del_obj)
		PropEditorObjChanged(self)
		return idx and Max(1, idx - 1) or 1
	end
	local undo_func = function()
		local idx = table.insert(obj, selected_index, del_obj)
		PropEditorObjChanged(self)
		return idx
	end
	local idx = redo_func()
	return idx, undo_func, redo_func
end

function TechEditor:ActionSave()
	self:WarningsCheck()
	
	--autofill the field of each tech
	for i=1,#TechTree do
		local field = TechTree[i]
		local field_id = field.id
		for j=1,#field do
			local tech = field[j]
			tech.field = field_id
		end
	end
	
	local data = {
		exported_files_header_warning,
		"ClearTechTree()\n\n",
		"TechTree = ",
		ArrayToLuaCode(TechTree),
		[=[

TechFields = {}
for i=1,#TechTree do
	local field = TechTree[i]
	TechFields[field.id] = field
end]=],
	}
	return AsyncStringToFile("Data/TechTree.lua", data)
end

function TechEditor:WarningsCheck()
	local params = {}
	for i=1,#TechTree do
		local field = TechTree[i]
		for j=1,#field do
			local tech = field[j]
			tech:WarningsCheck(params)
		end
	end
end

function TechEditor:MoveEntry(down, obj, selected_index, selection, view_index, column_index)
	obj = obj or self
	local target = obj[selected_index]
	local move_up = function()
		local idx = table.remove_entry(obj, target)
		idx = Max(1, idx - 1)
		table.insert(obj, idx, target)
		PropEditorObjChanged(self)
		return idx
	end
	local move_down = function()
		local idx = table.remove_entry(obj, target)
		idx = Min(#obj + 1, idx + 1)
		table.insert(obj, idx, target)
		PropEditorObjChanged(self)
		return idx
	end
	local redo_func, undo_func = move_up, move_down
	if down then
		redo_func, undo_func = move_down, move_up
	end
	local idx = redo_func()
	return idx, undo_func, redo_func
end

function TechEditor:ActionUp(obj, selected_index, selection, view_index, column_index)
	return self:MoveEntry(false, obj, selected_index, selection, view_index, column_index)
end

function TechEditor:ActionDown(obj, selected_index, selection, view_index, column_index)
	return self:MoveEntry(true, obj, selected_index, selection, view_index, column_index)
end

function TechEditor:Research(obj, selected_index, selection, view_index, column_index)
	if IsKindOf(obj, "TechField") then
		UICity:SetTechResearched(obj[selected_index].id)
	end
end

----

-- purpose: store research on level-designer-created map (deprecated!!!, now stored in mapdata)
DefineClass.MapStoredTech = {
	__parents = { "Object" },
	--game_flags = { gofPermanent = true },
	properties = {
		{ id = "tech_id", editor = "text", default = "unexplored", no_edit = true },
		{ id = "Walkable", dont_save = true },
		{ id = "Collision", dont_save = true },
		{ id = "ApplyToGrids", dont_save = true },
	},
}

-- effect functions
--[[@@@
You can read more details about the [Research](Research.md.html) and [Colonists](Colonists.md.html) in their respective pages. Here are provided some useful functions for implementing gameplay effects. Modders could also create new [Technologies](ModItemTechnology.md.html), [Mission Sponsors](ModItemMissionSponsor.md.html) or [Commander Profiles](ModItemCommanderProfile.md.html).
@class Gameplay
--]]

