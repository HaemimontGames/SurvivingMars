function ClearTechRequirements()
	BuildingTechRequirements = {}
	CropTechRequirements = {}
	TraitTechRequirements = {}
end

if FirstLoad then
	ClearTechRequirements()
end

function OnMsg.DataLoaded()
	ClearTechRequirements()
	for _, tech in pairs(TechDef) do
		tech:OnDataLoaded()
	end
end

function OnMsg.GenerateDocs(project_folder, empty_name)
	local output = {
		"# Documentation for *Technology Names*\n",		
		}
	local outputFileName = project_folder.."LuaFunctionDoc_TechnologyNames.md.html"
	local fields = Presets.TechFieldPreset.Default
	for i = 1 , #fields do
		local field = fields[i]
		local field_id = field.id
		if field_id~="Mysteries" then
			output[#output+1] = "##  "..field_id
			if field.description then
				output[#output+1] = TDevModeGetEnglishText(field.description)
			end
			output[#output+1] = ""
			local techs_by_name = {}
			for _, tech in ipairs(Presets.TechPreset[field_id]) do
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

function TechEffect:OnGameInit(city, tech)
end

function TechEffect:OnResearchComplete(city, tech)
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
	@param string lock_type - Optional. Lock type can be "hide", where the building will not be visible in the build menu, "disable", where the building will be visible but not clickable. Any string different from "hide" and "disable" defaults to "hide". Omitting the value defaults to "hide".
	@param T disable_reason - Optional. If lock type is "disable" the rollover information string can be provided with this param. It has to be a localized string. If omitted will default to "This building has been disabled".
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

function TechEffect_GiveFunding:GetDescription()
	return "Give funding " .. (self.Funding > 0 and tostring(self.Funding) or "")
end

function TechEffect_GiveFunding:OnResearchComplete(city, tech)
	city:ChangeFunding(self.Funding * 1000000)
end

--[[@@@
Change funding  by adding or removing any value(in millions).
@function void Gameplay@ChangeFunding(int funding, [string source])
@param int funding - +/- value in M 1M=1000*1000
@result void
]]
function ChangeFunding(value, source)
	return UICity:ChangeFunding(value * 1000000, source)
end
----

DefineClass.TechEffect_TechBoost = {
	__parents = { "TechEffect" },
	properties = {
		{ category = "Modify", id = "Field",     name = "Field",         editor = "dropdownlist", default = "", items = ResearchFieldsCombo },
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
	labels = table.keys(labels)
	table.sort(labels, CmpLower)
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

--[[@@@
Modify construction cost of  the specified building/category with the specified percent. Calling ModifyConstructionCost multiple times in one building with different percents, first sums all percents and then apply to the cost. 
@function void Gameplay@ModifyConstructionCost(string building_name, string construction_resource, int percent)
@param string building - single buidling template name or buildmenu category for all buildings from that category.
@param string construction_resource - one of construction resources (ConstructionResourceList = {"Concrete", "Metals", "Polymers", "BlackCube", "Electronics", "MachineParts", "PreciousMetals" }) or "all" for all construction resources.
@param int percent - change the cost with that percent.
--]]
function ModifyConstructionCost(building_name, construction_resource, percent)
	local templates = BuildingTemplates or ""
	local buildings = {}
	if templates[building_name] then
		buildings[#buildings + 1] = building_name
	else	
		for id, template in pairs(templates) do
			if template.build_category == building_name then
				buildings[#buildings + 1] = id
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

--[[@@@
Research technology and gain its effect. If the technology property 'repeatable' is set to true, it can be researched multiple times.
@function void Gameplay@GrantTech(string tech_id)
@param string tech_id - technology internal id.
]]
function GrantTech(tech_id)
	UICity:SetTechResearched(tech_id, "notify")
end	

--[[@@@
Discovers a tech, revealing it in the Research UI.
@function void Gameplay@DiscoverTech(string tech_id)
@param string tech_id - technology internal id.
]]
--[[
function DiscoverTech(tech_id)
	UICity:SetTechDiscovered(tech_id)
end--]]

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

--[[@@@
You can read more details about the [Research](Research.md.html) and [Colonists](Colonists.md.html) in their respective pages. Here are provided some useful functions for implementing gameplay effects. Modders could also create new [Technologies](ModItemTechnology.md.html), [Mission Sponsors](ModItemMissionSponsor.md.html) or [Commander Profiles](ModItemCommanderProfile.md.html).
@class Gameplay
--]]

function TechEditor_Research(socket, preset)
	if not UICity then return end
	local obj = socket.selected_object
	if obj and IsKindOf(obj, "TechPreset") then
		UICity:SetTechResearched(obj.id, "notify")
	end
end