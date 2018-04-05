local l_ModifierTargets = { "self", "parent_dome", "city" }

local upgradable_building_props = {}
do
	for k=1,3 do
--upggrade definitions, currently just props.
		local upgrade_properties = {
	--
			{template = true, name = T{92, "Restore Upgrade Defaults"}, id = "restore_defaults", editor = "buttons", default = false, buttons = { {"Restore Upgrade Defaults", "BtnRetoreUpgradeDefaults"} }},
	--
			{ template = true, name = T{93, "ID"},                   id = "id",           editor = "text", default = "" },
			{ template = true, name = T{1000067, "Display Name"},    id = "display_name", editor = "text", default = T{""}, translate = true },
			{ template = true, name = T{1000017, "Description"},     id = "description",  editor = "text", default = T{""}, translate = true },
			{ template = true, name = T{94, "Icon"},                 id = "icon",         editor = "browse", default = "UI/Icons/Upgrades/build.tga", folder = "UI" },
	
			{ template = true, name = T{95, "Concrete Cost"},        id = "upgrade_cost_Concrete",       editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{96, "Metals Cost"},          id = "upgrade_cost_Metals",         editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{97, "Polymers Cost"},        id = "upgrade_cost_Polymers",       editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{98, "Electronics Cost"},     id = "upgrade_cost_Electronics",    editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{99, "Machine Parts Cost"},   id = "upgrade_cost_MachineParts",   editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{100, "Rare Metals Cost"},    id = "upgrade_cost_PreciousMetals", editor = "number", default = 0, scale = const.ResourceScale},
			{ template = true, name = T{101, "Upgrade Time Cost"},   id = "upgrade_time",                editor = "number", default = 0, scale = const.HourDuration},

			{ template = true, name = T{102, "Modifier Target 1"},   id = "mod_target_1",  editor = "dropdownlist", default = "self", items = l_ModifierTargets },
			{ template = true, name = T{103, "Modifier Label 1"},    id = "mod_label_1",   editor = "combo",        default = "",     items = LabelsCombo, },
			{ template = true, name = T{104, "Modified Property 1"}, id = "mod_prop_id_1", editor = "combo",        default = "",     items = ModifiablePropsCombo },
			{ template = true, name = T{105, "Percent Modifier 1"},  id = "mul_value_1",   editor = "number",       default = 0  },
			{ template = true, name = T{106, "Amount Modifier 1"},   id = "add_value_1",   editor = "number",       default = 0  },
	
			{ template = true, name = T{107, "Modifier Target 2"},   id = "mod_target_2",  editor = "dropdownlist", default = "self", items = l_ModifierTargets },
			{ template = true, name = T{108, "Modifier Label 2"},    id = "mod_label_2",   editor = "combo",        default = "",     items = LabelsCombo },
			{ template = true, name = T{109, "Modified Property 2"}, id = "mod_prop_id_2", editor = "combo",        default = "",     items = ModifiablePropsCombo },
			{ template = true, name = T{110, "Percent Modifier 2"},  id = "mul_value_2",   editor = "number",       default = 0  },
			{ template = true, name = T{111, "Amount Modifier 2"},   id = "add_value_2",   editor = "number",       default = 0  },
	
			{ template = true, name = T{112, "Modifier Target 3"},   id = "mod_target_3",  editor = "dropdownlist", default = "self", items = l_ModifierTargets },
			{ template = true, name = T{113, "Modifier Label 3"},    id = "mod_label_3",   editor = "combo",        default = "",     items = LabelsCombo },
			{ template = true, name = T{114, "Modified Property 3"}, id = "mod_prop_id_3", editor = "combo",        default = "",     items = ModifiablePropsCombo },
			{ template = true, name = T{115, "Percent Modifier 3"},  id = "mul_value_3",   editor = "number",       default = 0  },
			{ template = true, name = T{116, "Amount Modifier 3"},   id = "add_value_3",   editor = "number",       default = 0  },
	
			--upgrade upkee... i mean consumption properties (deja vu?)
			{ template = true, name = T{117, "Consumption Resource Type"}, id = "consumption_resource_type",                editor = "dropdownlist", items = GetConsumptionResourcesDropDownItems(), default = GetConsumptionResourcesDropDownItems()[1].value, help = "The type of resource associated with consumption demands.",},
			{ template = true, name = T{118, "Consumption Max Storage"},   id = "consumption_max_storage",                  editor = "number", scale = const.ResourceScale, default = 5 * const.ResourceScale, help = "The max amount of storage for consumption resource.",},
			{ template = true, name = T{119, "Consumption Amount"},        id = "consumption_amount",                       editor = "number", scale = const.ResourceScale, default = 1 * const.ResourceScale,modifiable = true, help = "Amount of stored consumption resources needed for consumption op. In other words, the convertion rate of consumption resources to other stuff.",},
			{ template = true, name = T{120, "Consumption Type"},          id = "consumption_type",                         editor = "dropdownlist", items = GetConsumptionTypeDropdownItems(), default = GetConsumptionTypeDropdownItems()[1].value, help = "Determines the purpose of the consumption resource.",},
			{ template = true, name = T{121, "Input Pile Spot Name"},      id = "consumption_resource_stockpile_spot_name", editor = "text", default = "Resourcepile2", help = "If there is any consumption, will try to attacha purely visual stockpile at this spot.",},
		}
		local upgrade_pretty_name = "Upgrade " .. k
		local upgrade_id_preposition = "upgrade" .. k .. "_"
		for k, v in pairs(upgrade_properties) do
			v.category = upgrade_pretty_name
			v.id = upgrade_id_preposition .. v.id
		end
		table.append(upgradable_building_props, upgrade_properties)
	end
end

function BtnRetoreUpgradeDefaults(main_obj, object, prop_id, identifier)
	local upg_identifier = string.sub(prop_id, 1, 8)
	local meta = UpgradableBuilding
	for k, v in pairs(object) do
		if string.find(k, upg_identifier) then
			object[k] = meta[k]
		end
	end
	PropEditorObjChanged(object)
end


--[[@@@
@class UpgradableBuilding
Property holder class. Contains properties required to define all three building upgrades.

Each building can have up to three upgrades, this division is internally called tiering. I.e. the first upgrade of a building is tier one, second is tier two, etc. This has no special meaning and is mostly used for upgrade identification purposes.

All upgrade properties are formed in the following fassion (.. is the lua concatenation operator): "upgrade" .. tier .. "_" .. upgrade_property_base_name. So, if one needs to access the "id" property of a tier two upgrade, the actual member to access would be "upgrade2_id".
--]]
DefineClass.UpgradableBuilding = {
	__parents = { "PropertyObject" },
	properties = upgradable_building_props,
}

function UpgradableBuilding:GetUpgradeCost(upgrade_tier, resource)
	if GetMissionSponsor().name == "Roscosmos" and
		self:GetUpgradeID(upgrade_tier):ends_with("FueledExtractor") then
		return 0
	end
	local key = string.format("upgrade%s_upgrade_cost_%s", tostring(upgrade_tier), resource)
	return self:HasMember(key) and self[key] or 0
end

function UpgradableBuilding:GetUpgradeTime(upgrade_tier)
	return self[string.format("upgrade%s_upgrade_time", tostring(upgrade_tier))]
end

function UpgradableBuilding:GetUpgradeID(upgrade_tier)
	return self[string.format("upgrade%s_id", tostring(upgrade_tier))]
end

function UpgradableBuilding:GetUpgradeTier(upgrade_id)
	for i = 1, 3 do
		if self:GetUpgradeID(i) == upgrade_id then
			return i
		end
	end
	
	return false
end

function UpgradableBuilding:CreateUpgradeUpkeepObject(upgrade_tier)
	local u_t_s = tostring(upgrade_tier)
	local c_t_r = self[string.format("upgrade%s_consumption_resource_type", u_t_s)]
	local upgrade_id = self:GetUpgradeID(upgrade_tier)
	if c_t_r == "no_consumption" then return end
	if self.upgrade_consumption_objects and self.upgrade_consumption_objects[upgrade_id] then return end
	local c_t = self[string.format("upgrade%s_consumption_type", u_t_s)]
	assert(c_t == g_ConsumptionType.Production, "Only production consumption is currently supported for upgrades!")
	--extract all consumption props and apply them to the consumption obj
	local consumption_max_storage = self[string.format("upgrade%s_consumption_max_storage", u_t_s)]
	local consumption_amount = self[string.format("upgrade%s_consumption_amount", u_t_s)]
	local consumption_resource_stockpile_spot_name = self[string.format("upgrade%s_consumption_resource_stockpile_spot_name", u_t_s)]
	
	local params = { city = self.city, upgrade_id = upgrade_id, upgrade_tier = upgrade_tier, building = self, consumption_max_storage = consumption_max_storage, consumption_amount = consumption_amount, 
						consumption_resource_stockpile_spot_name = consumption_resource_stockpile_spot_name, 
						consumption_resource_type = c_t_r, consumption_type = c_t}
	
	return PlaceObject("UpgradeConsumption", params)
end

function GetUpgradeIdList()
	local upgrade_id_list = {}
	local templates = DataInstances.BuildingTemplate
	local names = {}
	for j=1,3 do
		names[j] = string.format("upgrade%s_id", tostring(j))
	end
	for i=1,#templates do
		local template = templates[i]
		for j=1,3 do
			local name = names[j]
			local id = template[name]
			if id ~= "" then
				upgrade_id_list[#upgrade_id_list + 1] = id
			end
		end
	end
	return upgrade_id_list
end

function UpgradableBuilding:GetUpgradeDisplayName(upgrade_tier)
	return self[string.format("upgrade%s_display_name", tostring(upgrade_tier))]
end

function UpgradableBuilding:GetUpgradeDescription(upgrade_tier)
	return self[string.format("upgrade%s_description", tostring(upgrade_tier))]
end

function UpgradableBuilding:GetUpgradeIcon(upgrade_tier)
	return self[string.format("upgrade%s_icon", tostring(upgrade_tier))]
end

function UICreateUpgradeButtons(parent, obj)
	for i = 1, 3 do
		local id = obj:GetUpgradeID(i) or ""
		if id ~= "" and UICity:IsUpgradeUnlocked(id) then
			local context = SubContext(obj, {i = i})
			local button = XTemplates["InfopanelUpgrade"]:Eval(parent, context)
			local icon = obj:GetUpgradeIcon(i)
			if icon and icon:sub(-6, -1) == "01.tga" then
				icon = icon:sub(1, -7)
			else
				icon = "UI/Icons/Upgrades/amplify_"
			end
			local name = obj:GetUpgradeDisplayName(i)
			button:SetFocusOrder(point(i + 1000, 0))
			button:SetRolloverTitle(name)
			button.OnContextUpdate = function (self, context)
				if obj:HasUpgrade(id) then
					if obj:IsUpgradeOn(id) then
						self:SetIcon(icon .. "02.tga")
					else
						self:SetIcon(icon .. "03.tga")
					end
				elseif obj:IsUpgradeBeingConstructed(id) then
					self:SetIcon(icon .. "04.tga")
				else
					self:SetIcon(icon .. "01.tga")
				end
				return XTextButton.OnContextUpdate(self, context)
			end
			button.GetRolloverText = function(self)
				local status = ""
				
				if not UICity:IsUpgradeUnlocked(id) then
					status = T{7513, "Locked by research."}
				elseif obj:HasUpgrade(id) then
					status = T{7514, "Upgrade already constructed. Current status: <working>", 
						working = obj:IsUpgradeOn(id) and T{6772, "<green>ON</green>"} or T{6771, "<red>OFF</red>"}}
				elseif obj:IsUpgradeBeingConstructed(id) then
					status = T{7515, "Upgrade is under construction."}
				else
					local costs = obj:GetCostsTArray(id, obj:IsUpgradeBeingConstructedAndCanceled(id))
					if costs ~= "" then
						status = T{7516, "Upgrade construction cost: "} .. costs
					end
				end
				return T{7517, "<description><newline><newline><status>", description = obj:GetUpgradeDescription(i), status = status}
			end
			button.GetRolloverHint = function(self, shortcut, mass_shortcut)
				if not UICity:IsUpgradeUnlocked(id) then
					return ""
				end
				shortcut = shortcut or T{7519, "<left_click>"}
				mass_shortcut = mass_shortcut or T{7367, "<em>Ctrl + <left_click></em>"}
				if obj:HasUpgrade(id) then
					if obj:IsUpgradeOn(id) then
						return T{7520, "<shortcut> Turn off<newline><shortcut2> Turn off in all <display_name_pl>", shortcut = shortcut, shortcut2 = mass_shortcut}
					else
						return T{7521, "<shortcut> Turn on<newline><shortcut2> Turn on in all <display_name_pl>", shortcut = shortcut, shortcut2 = mass_shortcut}
					end
				elseif obj:IsUpgradeBeingConstructed(id) then
					return T{7522, "<shortcut> Cancel construction<newline><shortcut2>Cancel construction in all <display_name_pl>", shortcut = shortcut, shortcut2 = mass_shortcut}
				else
					return T{7523, "<shortcut> Start construction<newline><shortcut2>Start construction in all <display_name_pl>", shortcut = shortcut, shortcut2 = mass_shortcut}
				end
			end
			button.GetRolloverHintGamepad = function(self)
				return self:GetRolloverHint(T{7518, "<ButtonA>"}, T{7618, "<ButtonX>"})
			end
			rawset(button, "ProcessUpgrade", function(self, broadcast)
				if broadcast then
					local enable, construct
					if obj:HasUpgrade(id) then
						enable = not obj.upgrade_on_off_state[id]
					else
						construct = not obj:IsUpgradeBeingConstructed(id)
					end
					BroadcastAction(obj, function(bld)
						if not bld:GetUpgradeTier(id) then --upgrade id not present for this bld
							return
						elseif bld:HasUpgrade(id) then
							if enable ~= nil and bld.upgrade_on_off_state[id] ~= enable then
								bld:ToggleUpgradeOnOff(id)
							end
						else
							if construct ~= nil and construct ~= bld:IsUpgradeBeingConstructed(id) then
								bld:ConstructUpgrade(id)
							end
						end
					end)
				else
					if obj:HasUpgrade(id) then
						obj:ToggleUpgradeOnOff(id)
					else
						obj:ConstructUpgrade(id)
					end
				end
				RebuildInfopanel(obj)
			end)
			button.OnPress = function(self, gamepad)
				self:ProcessUpgrade(not gamepad and IsMassUIModifierPressed())
			end
			button.OnAltPress = function(self, gamepad)
				if gamepad then
					self:ProcessUpgrade(true)
				end
			end
		end
	end
end