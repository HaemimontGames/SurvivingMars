-- This is the RCRover when the menu is opened from the infopanel
GlobalVar("BuildingWithRCRover", false)
GlobalVar("g_LastBuildCat", false)
GlobalVar("g_LastBuildItem", false)

GlobalVar("g_BuildMenuRightClickPopupShown", false)
GlobalVar("g_BuildMenuHUDClicksCount", 0)
GlobalVar("g_BuildMenuRightClicksCount", 0)

DefineClass.XBuildMenu = {
	__parents = {"ItemMenu"},
	hide_single_category = false,
	ZOrder = 2,
	FocusOnOpen = "self",
	
	lines_stretch_time_init = 220,
	refresh_thread = false,
} 

function XBuildMenu:Init()
	self.idCategoryList:SetScaleModifier(point(800,800))
	self.idContainer:SetScaleModifier(point(750,750))
	self.idCategoryList:SetVAlign("bottom")
	UICity:Gossip("BuildMenu", "open")
	local sel_dome = self.context.selected_dome
	if sel_dome and not not sel_dome:IsOpen() then
		sel_dome:Open()
	end
	BuildingWithRCRover = false
	CloseInfopanelItems()
	SelectObj(false)
	if GetInGameInterfaceMode() == "overview" then
		GetInGameInterface():SetMode("selection")
	end
end

function XBuildMenu:Open(...)
	self:RecalculateMargins()
	ItemMenu.Open(self, ...)
	
	local hud = GetHUD()
	if hud then
		local buildmenu_btn = hud.idBuild
		if buildmenu_btn then
			buildmenu_btn:SetToggled(true)
		end
	end
end

function XBuildMenu:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	local hud, hud_margins = GetHUD()
	if hud then
		local gamepad = not not GetUIStyleGamepad()
		local ui_scale = GetUIScale()
		local hud_height = Max(hud.idBottom.measure_height, hud.idBottom.MinHeight)
		hud_height = MulDivRound(hud_height, 100, ui_scale)
		local bottom_margin = gamepad and 10 or hud_height
		hud_margins = box(0, 0, 0, bottom_margin)
	end
	self:SetMargins(hud_margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetDialog("XBuildMenu")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function XBuildMenu:GetCategories()
	return BuildCategories
end

function XBuildMenu:DefaultCategory()
	return table.find_value(self.cat_items,"Id","Infrastructure")
end

function XBuildMenu:CreateCategoryItems(all_categories)
	local list = self.idCategoryList
	self.cat_items = {}
	for _, cat_data in ipairs(all_categories or empty_table) do
		local id = cat_data.id
		if id ~= "Hidden" then
			local items_count = UICountItemMenu(id)
			if items_count and items_count > 0 then			
				local new_item = MenuCategoryButton:new(cat_data, list.idCategoriesList)
				self.cat_items[#self.cat_items + 1] = new_item
				
				new_item:SetEnabled(true)				
				new_item.OnMouseEnter = function(this, ...)				
					this.idCategoryButton:OnMouseEnter(...)
					this.idCategorySelection:SetVisible(true)
					if self.category ~= id then
						this.idCategoryRollover:SetVisible(true)
					end
					list.idSelectedCat:SetText(cat_data.name)
					self:DeleteThread("show_sel_cat_name")
				end
				new_item.OnMouseLeft = function(this, ...)
					if self.category ~= id then
						this.idCategoryButton:OnMouseLeft(...)
						this.idCategoryRollover:SetVisible(false)
						this.idCategorySelection:SetVisible(false)
					else
						this.idCategorySelection:SetVisible(false)
						this.idCategoryButton:OnMouseEnter()
					end
					self:DeleteThread("show_sel_cat_name")
					self:CreateThread("show_sel_cat_name", function()
						Sleep(self.show_sel_cat_name_lag)				
						list.idSelectedCat:SetText(self.selected_category_name)
					end)			
				end
			
				new_item.idCategoryButton.OnMouseButtonDown = function(this, pos, button)
					XTextButton.OnMouseButtonDown(this, pos, button)
					if button == "L" then
						self:SelectCategory(cat_data)
						return "break"
					end
					return "continue"
				end
				
			end	
		end	
	end
end

function XBuildMenu:Close()
	if IsValidThread(self.refresh_thread) then
		DeleteThread(self.refresh_thread)
	end

	g_LastBuildCat = self.category

	local sel_dome = self.context.selected_dome
	if IsValid(sel_dome) and UICity.selected_dome ~= sel_dome then
		sel_dome:Close()
	end

	ItemMenu.Close(self)
	UICity:Gossip("BuildMenu", "close")

	if not ShowResourceOverview then
		UpdateInfobarVisibility()
	end	
	
	local hud = GetHUD()
	if hud then
		local buildmenu_btn = hud.idBuild
		if buildmenu_btn then
			buildmenu_btn:SetToggled(false)
		end
	end
end

function XBuildMenu:OnXButtonDown(button, source)
	if button == "RightTrigger" and IsColonyOverviewOpened() then
		return
	elseif button == "ButtonY" then
		if not self:IsThreadRunning("CloseThread") then
			self:Close()
			return "break"
		end
	end
	return ItemMenu.OnXButtonDown(self, button, source)
end

function GetBuildingTechsStatus(building, category)
	-- handle overrides of building/category availability from sequences first
	local prerequisite_override = BuildMenuPrerequisiteOverrides[category] or BuildMenuPrerequisiteOverrides[building]
	if prerequisite_override == true then
		return "show", "enable", ""
	elseif type(prerequisite_override) == "string" and prerequisite_override == "hide" then
		return not "show", not "enable", ""
	elseif prerequisite_override then
		return "show", not "enable", prerequisite_override
	end

	local rollover_t = false
	local shown, enabled = true, true
	local tech_t = BuildingTechRequirements[building] or ""
	for i = 1, #tech_t do
		local rinfo = tech_t[i]
		if rinfo.check_supply and not IsResupplyItemAvailable(rinfo.check_supply) then
			shown = false
			enabled = false
			rollover_t = false
			break
		elseif UICity:IsTechResearched(rinfo.tech) then
			-- continue
		elseif rinfo.hide or not UICity:IsTechDiscovered(rinfo.tech) then
			shown = false
			enabled = false
			rollover_t = false
			break
		else
			enabled = false
			local tech_name = TechDef[rinfo.tech].display_name
			rollover_t = rollover_t or {}
			rollover_t[#rollover_t + 1] = T{3956, "Research <em><tech_name></em> to unlock this building.", tech_name = tech_name}
		end
	end
	return shown, enabled, rollover_t and table.concat(rollover_t, "\n") or ""
end

function GetAdditionalBuildingLock(template)
end

function GetGridElementConstructionCost(class_name, is_passage, multiplier)
	if IsGameRuleActive("FreeConstruction") then
		return false
	end
	
	if class_name == "ElectricityGridElement" and g_Consts.InstantCables ~= 0 or
		class_name == "LifeSupportGridElement" and g_Consts.InstantPipes ~= 0 or 
		is_passage and GetMissionSponsor().name == "Brazil" then
		return false
	end
	
	local cost = {}
	local class = is_passage and BuildingTemplates[class_name] or g_Classes[class_name]
	multiplier = multiplier or 100
	for _,resource in ipairs(ConstructionResourceList) do
		local number = UICity:GetConstructionCost(class, resource)
		if number > 0 then
			cost[resource] = MulDivRound(number, multiplier, 100)
		end
	end
	
	return cost
end

function GetGridElementConstructionCostDescription(class, is_passage)
	-- stage 1
	if IsGameRuleActive("FreeConstruction") then
		return T{10540, "Cost: Nothing (Free Construction rule)"}
	end
	local text = ""
	local cost1= {}
	for _,resource in ipairs(ConstructionResourceList) do
		local number = UICity:GetConstructionCost(class, resource)
		if number and number>0 then
			cost1[#cost1+1] = FormatResource(empty_table,number, resource)
		end		
	end
	if next(cost1)then
		local sep = " "..(is_passage and T{8902, "per segment"} or T{3957, "for each 5 hexes-long section"})
		text =  T{263, "Cost: "}..table.concat(cost1,"")..sep
	end
	return text
end

local production_props = {}
function OnMsg.ClassesBuilt()
	production_props = {
		{"electricity_production", "Power"},
		{"air_production", "Air"},
		{"water_production", "Water"},
	}
	for i=1,ResourceProducer.max_resources_produced do
		table.insert(production_props, { "production_per_day"..i, false, "resource_produced"..i })
	end
end

local maintenance_props = {
	{"electricity_consumption", "Power"},
	{"air_consumption", "Air"},
	{"water_consumption", "Water"},
}

function GetConstructionDescription(class, cost1, dont_modify) --class is a building template and not a class
	local modifier_obj = GetModifierObject(class)
	-- stage 1
	local texts
	if IsGameRuleActive("FreeConstruction") then
		texts = {T{10540, "Cost: Nothing (Free Construction rule)"}}
	else
		texts = {}
		if cost1 then
			texts[1] = cost1
		else
			local cost1= {}
			for _,resource in ipairs(ConstructionResourceList) do
				local number = UICity:GetConstructionCost(class, resource, not dont_modify and modifier_obj or nil)
				if number and number>0 then
					cost1[#cost1+1] =  FormatResource(empty_table, number, resource)
				end		
			end
			if next(cost1)then
				texts[#texts+1] =  T{263, "Cost: "}..table.concat(cost1," ") .. "\n"
			end
		end
	end
	-- stage 2
	local template_class = ClassTemplates.Building[class.id]
	local properties = template_class.properties
	
	-- electricity, air, water
	local consumption = {}
	for i = 1, #maintenance_props do
		local prop = table.find_value(properties, "id", maintenance_props[i][1])
		if prop then
			local val 
			if not dont_modify then
				local disable_prop = table.find_value(properties, "id", "disable_" .. maintenance_props[i][1])
				val = disable_prop and modifier_obj:ModifyValue(template_class[disable_prop.id], disable_prop.id) >= 1
								and 0 or modifier_obj:ModifyValue(template_class[prop.id], prop.id)
			else
				val = template_class[prop.id]
			end
			if val ~= 0 then
				consumption[#consumption + 1] = FormatResource(empty_table, val, maintenance_props[i][2])
			end
		end
	end
	if template_class:DoesHaveConsumption() then
		consumption[#consumption + 1] = FormatResource(empty_table, 1000, template_class.consumption_resource_type)
	end
	if next(consumption) then
		texts[#texts+1] = T{3959, "Consumption: "} .. table.concat(consumption, " ")
	end
	
	--- maintenance
	if template_class:DoesRequireMaintenance() and template_class:DoesMaintenanceRequireResources()
		and (dont_modify or modifier_obj:ModifyValue(template_class.disable_maintenance, "disable_maintenance") <= 0) then
		texts[#texts+1] = T{3960, "Maintenance: <resource(maintenance_resource_amount,maintenance_resource_type)>", template_class} .. "\n"
	end
	
	-- living space
	if IsKindOf(template_class, "Residence") and template_class:HasMember("capacity") then
		texts[#texts+1] = T{3961, "Residential space: <home(capacity)>", capacity = template_class["capacity"], empty_table}
	end

	if template_class.dome_comfort>0 then
		texts[#texts+1] = T{3962, "Comfort (all Residences): +<Stat(dome_comfort)>", dome_comfort = template_class["dome_comfort"]}
	end

	if IsKindOf(template_class, "Service") then
		texts[#texts+1] = T{3963, "Service Comfort: <Stat(comfort)>", comfort = template_class["service_comfort"]}
	end
	
	-- workforce
	if IsKindOf(template_class, "Workplace") and template_class["max_workers"]>0 then
		local workers = template_class["max_workers"]
		if template_class["active_shift"] > 0 then
			texts[#texts+1] = T{3964, "<em>Workers:</em> <colonist(workers)> (single work shift)", workers = workers, empty_table}
		else
			texts[#texts+1] = T{3965, "<em>Workers:</em> <colonist(total)> (<colonist(workers)> per work shift)",
				workers = workers, total = workers * template_class["max_shifts"], empty_table}
		end
	end
	
	-- electricity, air, water production
	if IsKindOf(template_class, "Farm") then
		texts[#texts+1] = T{3966, "Base production: <icon_Food> based on crop"}
	else
		local production = {}
		for i = 1, #production_props do
			local prop = table.find_value(properties, "id", production_props[i][1])
			if prop and template_class[prop.id] ~= 0 then
				local resource_name = production_props[i][2]
				if not resource_name then
					local resource_id = template_class[production_props[i][3]]
					if resource_id and resource_id ~= "" and resource_id ~= "WasteRock" then
						resource_name = Resources[resource_id].name
					end
				end
				if resource_name then
					production[#production + 1] = FormatResource(empty_table, template_class[prop.id], resource_name)
				end
			end
		end
		if next(production) then
			texts[#texts+1] = T{3967, "Base production: "} .. table.concat(production, " ")
		end
	end
	
	return table.concat(texts, "\n")
end

function FormatBuildingCostInfo(template_name, dont_modify)
	-- grid elements
	local is_grid_element = template_name=="LifeSupportGridElement" or template_name == "ElectricityGridElement"
	local is_passage = template_name == "Passage"
	local class = is_grid_element and g_Classes[template_name] or BuildingTemplates[template_name]
	if is_grid_element or is_passage then
		return GetGridElementConstructionCostDescription(class, is_passage)
	else
		return GetConstructionDescription(class, nil, dont_modify) -- class is a building template and not a class
	end	
end

function BuildingInfoLine(template_name, dont_modify)
	-- grid elements
	local is_grid_element = template_name=="LifeSupportGridElement" or template_name == "ElectricityGridElement"
	local class = is_grid_element and g_Classes[template_name] or BuildingTemplates[template_name]
	if not class then
		-- asserts olny if all dlcs are available and cannot find the building template 
		-- otherwise the template may be in disabled dlc and return is enough 
		assert(DbgAreDlcsMissing(), "No such class / template: " .. tostring(template_name))
		return ""
	end
	if is_grid_element then
		local text = ""
		local cost1= {}
		for _,resource in ipairs(ConstructionResourceList) do
			local number = UICity:GetConstructionCost(class, resource)
			if number and number>0 then
				cost1[#cost1+1] = FormatResource(empty_table, number, resource)
			end		
		end
		if next(cost1)then
			local sep = " "..T{3957, "for each 5 hexes-long section"}
			return table.concat(cost1,"")..sep
		end
		return text
	else
		local texts = {}
		for _,resource in ipairs(ConstructionResourceList) do
			local number = UICity:GetConstructionCost(class, resource, GetModifierObject(class) )
			if number and number>0 then
				texts[#texts+1] =  FormatResource(empty_table, number, resource)
			end		
		end
		-- workforce
		local template_class = ClassTemplates.Building[class.id]
		if IsKindOf(template_class, "Workplace") and template_class["max_workers"]>0 then
			texts[#texts+1] = T{8099, "<colonist(workers)> ", workers = class["max_workers"], empty_table}
		end
		
		return table.concat(texts, " ")
	end	
end

TFormat.formatedbuildinginfo = function(context_obj, ...) return FormatBuildingCostInfo(...) end
TFormat.buildinginfo = function(context_obj, ...) return BuildingInfoLine(...) end

function TFormat.optionaldomeinfo(context_obj,template_name, dont_modify)
	local template = BuildingTemplates[template_name]
	return T{8955, "\nNew Dome: <em><template_display_name></em> ", template_display_name = template.display_name} .. TFormat.buildinginfo(context_obj,template_name, dont_modify)
end

function TFormat.optionalbuildinginfo(context_obj, template_name, dont_modify)
	local template = BuildingTemplates[template_name]
	return T{8956, "\nNew Building: <em><template_display_name></em> ", template_display_name = template.display_name} .. TFormat.buildinginfo(context_obj, template_name, dont_modify)
end

function TFormat.optionalspireinfo(context_obj, template_name, dont_modify)
	local template = BuildingTemplates[template_name]
	return T{8957, "\nNew Spire Building: <em><template_display_name></em> ", template_display_name = template.display_name} .. TFormat.buildinginfo(context_obj, template_name, dont_modify)
end

function UICountItemMenu(category_id)
	local count = 0
	for _, building_template in pairs(BuildingTemplates) do
		local show, prefabs, can_build, action, description = UIGetBuildingPrerequisites(category_id, building_template)
 		if not show and category_id == "Storages" then
			show, prefabs, can_build, action, description = UIGetBuildingPrerequisites("Depots", building_template)
			if not show then
				show, prefabs, can_build, action, description = UIGetBuildingPrerequisites("MechanizedDepots", building_template)
			end
		end
		if show then count = count + 1 end
	end
	
	if category_id == "Power" then
		count = count + 2
	end
	if category_id == "Life-Support" then
		count = count + 2
	end
	if category_id == "Infrastructure" then
		count = count + 1
	end
	return count
end

function UIGetBuildingPrerequisites(cat_id, template, bCreateItems, ignore_checks)
	if not ignore_checks and (template.build_category ~= cat_id or template.hide_from_build_menu) then
		return false
	end

	local tech_shown, tech_enabled, tech_rollover = GetBuildingTechsStatus(template.id, template.build_category)
	local available_prefabs = UICity:GetPrefabs(template.id)
	local prefab_item = template.require_prefab and RocketPayload_GetMeta(template.id)
	local require_prefab = not tech_enabled and prefab_item and not prefab_item.locked

	if not tech_shown and not require_prefab and available_prefabs == 0 or GetAdditionalBuildingLock(template) then
		return false
	end	
	
	local wonder_exists
	if template.wonder then
		if #(UICity.labels[template.id] or empty_table) > 0 then -- check buildings
			wonder_exists = true
		else -- check construction sites
			local sites = UICity.labels.ConstructionSite or empty_table
			for i = 1, #sites do 
				local site = sites[i]
				if site.building_class_proto.template_name == template.id then
					wonder_exists = true
					break
				end
			end
			--not found in regular construction sites - look in those with height surfaces
			if not wonder_exists then
				local sites = UICity.labels.ConstructionSiteWithHeightSurfaces or empty_table
				for i = 1, #sites do 
					local site = sites[i]
					if site.building_class_proto.template_name == template.id then
						wonder_exists = true
						break
					end
				end
			end
		end
	end
	
	local can_build, description, cost_text
	if wonder_exists then
		description = T{3968, "You can build this building only once."}
		can_build = false
	elseif available_prefabs > 0 then
		-- allowed, display number of prefabs instead of cost
		cost_text = T{3969, "Available prefabs: <number>", number = available_prefabs}
		can_build = true
	elseif require_prefab then
		-- not allowed, display warning about shipping prefabs
		local techs = BuildingTechRequirements[template.id]
		local tech_def
		local field_def
		if #techs == 1 then
			tech_def = TechDef[techs[1].tech]
			field_def = TechFields[tech_def.group]
			description = T{11416, "You need prefab parts for this building. Use a resupply Rocket to bring more <em>prefabs</em> from Earth, or research the technology <em><tech_name> (<tech_field_name>)</em>.", tech_name = tech_def.display_name, tech_field_name = field_def.display_name}
		elseif #techs > 1 then
			description = T{11417, "You need prefab parts for this building. Use a resupply Rocket to bring more <em>prefabs</em> from Earth, or research the technologies"}
			local separator
			for i = 1, #techs do
				tech_def = TechDef[techs[i].tech]
				field_def = TechFields[tech_def.group]
				local separator = T{1000539, ","}
				if i == #techs - 1 then
					separator = T{11418, "and"}
				elseif i == #techs then
					separator = T{""}
				end
				description = T{11419, "<descr> <em><tech_name> (<tech_field_name>)<separator></em>", descr = description, tech_name = tech_def.display_name, tech_field_name = field_def.display_name, separator = separator}
			end
		else
			description = T{3970, "You need prefab parts for this building. Use a resupply Rocket to bring more <em>prefabs</em> from Earth, or research the corresponding <em>Technology</em>."}
		end
		can_build = false
	elseif not tech_enabled then
		description = tech_rollover
		can_build = false
	elseif cat_id == "Domes" and AreDomesCapped() then
		description = T{7907, "Maximum number of Domes has been reached" }
		can_build = false
	else
		can_build = true
	end
	
	local prefab_disabled
	if g_Tutorial and g_Tutorial.BuildMenuWhitelist and not g_Tutorial.BuildMenuWhitelist[template.id] then
		description = T{8958, "Not yet available."} -- due to tutorial
		can_build = false
		prefab_disabled = true
	end
	
	
	if not description then
		local construction_cost = GetConstructionDescription(template, cost_text)
		local class = g_Classes[template.template_class]	
		description = class and class.GetIPDescription(template) or T{template.description,template}
		if construction_cost~="" then
			description = description..Untranslated("\n\n")..construction_cost
		end
	end
	
	local action
	if bCreateItems then
		if require_prefab or available_prefabs > 0 then
			action = function(obj, data)
				g_LastBuildItem = template.id
				local params
				if UICity:GetPrefabs(template.id) > 0 then
					params = { supplied = true, prefab = true }
				elseif not data.enabled then
					return
				end
				local variants
				if IsKindOf(data, "XWindow") then
					local parent = GetDialog(data)
					variants = parent:GetSubCategoryTemplates()
				else
					variants = data.template_variants
				end
				GetInGameInterface():SetMode(data.construction_mode, { template = data.name, selected_dome = obj and obj.selected_dome, template_variants = variants, params = params })
			end
		else
			action = function(obj, data)
				g_LastBuildItem = data.name
				if not data.enabled then return end
				local variants
				if IsKindOf(data, "XWindow") then
					local parent = GetDialog(data)
					variants = parent:GetSubCategoryTemplates()
				else
					variants = data.template_variants
				end
				GetInGameInterface():SetMode(data.construction_mode, { template = data.name, selected_dome = obj and obj.selected_dome, template_variants = variants})
			end
		end
	end
	
	return true, (require_prefab or available_prefabs>0) and not prefab_disabled, can_build, action, description
end

local button_ease_total_duration = 150
function XBuildMenu:EaseInButtons(buttons, start_time, open)
	for i=1,#buttons do
		buttons[i]:SetVisible(not open, "instant")
	end
	
	local step_duration = button_ease_total_duration / #buttons
	
	local first = open and 1 or #buttons
	local last = open and #buttons or 1
	local step = open and 1 or -1
	start_time = (start_time or GetPreciseTicks()) + 80
	for i=first,last,step do
		self:EaseInButton(buttons[i], start_time, open)
		start_time = start_time + step_duration
	end
end

local button_ease_duration = 175
function XBuildMenu:EaseInButton(button, start_time, open)
	button:SetVisible(true, "instant")
	button:AddInterpolation{
		id = "move_up",
		type = const.intRect,
		startRect = Offset(button.box, point(0, -35)),
		endRect = button.box,
		start = start_time,
		duration = button_ease_duration,
		flags = open and const.intfInverse or nil,
		easing = const.Easing.CubicIn,
		autoremove = true,
	}
	button:AddInterpolation{
		id = "appear",
		type = const.intAlpha,
		startValue = 0,
		endValue = 255,
		start = start_time,
		duration = button_ease_duration,
		autoremove = not not open,
		flags = not open and const.intfInverse or nil,
	}
end

function XBuildMenu:StopOpenCloseInterpolation()
	if self:IsThreadRunning("OpenAnimation") then
		self:DeleteThread("OpenAnimation")
	end
end

function XBuildMenu:OpenItemsInterpolation(bFirst, set_focus)
	self:StopOpenCloseInterpolation()

	self:CreateThread("OpenAnimation", function(self)
		self.idBackground.FadeInTime = 140
		self:StretchCloseAnimation(self.idBackground, false, self.lines_stretch_time_init, "invert")
	
		self:EaseInButtons(self.items, nil, "open")
		if set_focus then
			self.idButtonsList.RecalcVisibility = empty_func
			self:SetInitFocus(set_focus)
			self.idButtonsList.RecalcVisibility = nil
		end
		
		if bFirst then
			self.idButtonsListScroll.FadeInTime = 140
			self:StretchCloseAnimation(self.idCategoryList.idCategoriesPad, false, self.lines_stretch_time_init, "invert")
			local interpolation_start = GetPreciseTicks()
			self:EaseInButton(self.idCategoryList.idCatBkg, interpolation_start, "open")
			self:EaseInButtons(self.cat_items, interpolation_start, "open")
		end
	end, self)
end

function XBuildMenu:CloseItemsInterpolation()
	if self:IsThreadRunning("CloseThread") then
		return
	end

	self:StopOpenCloseInterpolation()

	local interpolation_start = GetPreciseTicks()
	self:EaseInButton(self.idCategoryList.idCatBkg, interpolation_start, not "open")
	self:EaseInButtons(self.cat_items, interpolation_start, not "open")
	self:EaseInButtons(self.items, interpolation_start, not "open")
	
	interpolation_start = interpolation_start + button_ease_total_duration
	self.idBackground.FadeOutTime = self.lines_stretch_time_init
	self.idButtonsListScroll.FadeOutTime = self.lines_stretch_time_init
	self.idCategoryList.idCategoriesPad.FadeOutTime = self.lines_stretch_time_init
	self:StretchCloseAnimation(self.idBackground, interpolation_start, self.lines_stretch_time_init, not "invert")
	self:StretchCloseAnimation(self.idCategoryList.idCategoriesPad, interpolation_start, self.lines_stretch_time_init, not "invert")
	self.idBackground:SetVisible(false)
	self.idButtonsListScroll:SetVisible(false)
	self.idCategoryList.idCategoriesPad:SetVisible(false)

	self:CreateThread("CloseThread", function()
		Sleep(button_ease_total_duration + button_ease_duration)
		XDialog.Close(self)
	end)
end

function XBuildMenu:GetItems(category_id)
	local buttons = {}
	local items = UIItemMenu(category_id, "create")
	for i=1, #items do
		local item = items[i]
		item.ButtonAlign = i%2==1 and "top" or "bottom"
		buttons[#buttons + 1] = HexButtonItem:new(item, self.idButtonsList)
	end
	return buttons
end

function XBuildMenu:GetSubCategoryTemplates()
	if not self.parent_category then 
		return 
	end
	local variants = {}
	for _, item in ipairs(self.items) do
		variants[#variants + 1] = item.name
	end
	return variants
end

local subcategories = {
	["Depots"] = false, 
	["MechanizedDepots"] = false,
	}
	
function GetBuildMenuSubcategories()
	return subcategories
end

function UIItemMenu(category_id, bCreateItems)
	local items = {}
	local count = 0
	for cat, val in pairs(subcategories) do
		subcategories[cat] = false
	end	
	for _, building_template in pairs(BuildingTemplates) do
		local show, prefabs, can_build, action, description = UIGetBuildingPrerequisites(category_id, building_template, bCreateItems)
		local template_category = building_template.build_category
		if category_id ~= template_category and subcategories[template_category]~=nil and UIGetBuildingPrerequisites(template_category, building_template) then
			subcategories[template_category]  = true 
		end
 		if show then
			count = count + 1
			if bCreateItems then
				local class = building_template.template_class
				class = class and g_Classes[class]
				local hint = ""
				local binding = "actionBuild" .. building_template.id
				local shortcuts = GetShortcuts(binding)
				if shortcuts and (shortcuts[1] or shortcuts[2]) then
					hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
				end
				table.insert(items, {
					name = building_template.id,
					construction_mode = building_template.construction_mode,
					display_name = class and class.GetDisplayName(building_template) or building_template.display_name,
					icon = building_template.display_icon,
					description = description,
					hint = hint,
					build_pos = building_template.build_pos,
					enabled = can_build or false,
					prefabs = prefabs or false,
					action = action,
					Id = building_template.id,
					close_parent = true,
				})
			end
		end
	end

	if category_id == "Storages" then
		count = count + 2
		if bCreateItems then
			if subcategories["Depots"] then
				items[#items + 1] ={
					name = "Depots",
					display_name = T{8878, "Depot"},
					icon = "UI/Icons/Buildings/depots.tga",
					description = T{10420, "Resource-specific Depots"},
					build_pos = 2,
					category = "Storage",
					close_parent = false,
					action = function(obj, data)
						local parent = GetDialog(data)
						parent:SelectSubCategory(data, category_id)
					end,
					Id = "Depots",
				}
			end
			if subcategories["MechanizedDepots"] then
				items[#items + 1] ={
					name = "MechanizedDepots",
					display_name = T{519, "Storage"},
					icon = "UI/Icons/Buildings/storages.tga",
					description = T{10421, "Resource-specific Storages"},
					build_pos = 3,
					category = "Storage",
					close_parent = false,
					action = function(obj, data)
						local parent = GetDialog(data)
						parent:SelectSubCategory(data, category_id)
					end
				}
			end
		end
	end
	
	if category_id == "Power" then
		count = count + 2
		if bCreateItems then
			local construction_cost =  T{8100, "<formatedbuildinginfo('ElectricityGridElement')>"}
			local description = T{3971, "Connect Power producers and consumers by establishing Power grids."}
			local require_construction = not(g_Consts and g_Consts.InstantCables ~= 0)
			if require_construction and construction_cost~="" then
				description = description..Untranslated("\n\n")..construction_cost
			end
			local hint = ""
			local binding = "actionPlaceCable"
			local shortcuts = GetShortcuts(binding)
			if shortcuts and (shortcuts[1] or shortcuts[2]) then
				hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
			end
			items[#items + 1] = {
				name = "PowerCables",
				Id = "PowerCables",
				display_name = T{881, "Power Cables"},
				icon = "UI/Icons/Buildings/power_cables.tga",
				description = description,
				hint = hint,
				enabled = not g_Tutorial or not g_Tutorial.BuildMenuWhitelist or g_Tutorial.BuildMenuWhitelist.PowerCables or false,
				action = function()
					g_LastBuildItem =  "PowerCables"
					GetInGameInterface():SetMode("electricity_grid", {grid_elements_require_construction = require_construction})
				end,
				build_pos = 11,
				close_parent = true,
			}
		
			local building_template = BuildingTemplates.ElectricitySwitch
			local hint = ""
			local binding = "actionBuild" .. building_template.id
			local shortcuts = GetShortcuts(binding)
			if shortcuts and (shortcuts[1] or shortcuts[2]) then
				hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
			end
			local description = T{8101, "<description>\n\n<formatedbuildinginfo('ElectricitySwitch')>",description = building_template.description}
			items[#items + 1] = {
				name = building_template.id,
				Id = building_template.id,
				display_name = building_template.display_name,
				icon = building_template.display_icon,
				description = description,
				hint = hint,
				enabled = not g_Tutorial or not g_Tutorial.BuildMenuWhitelist or g_Tutorial.BuildMenuWhitelist.ElectricitySwitch or false,
				action = function()
					g_LastBuildItem = building_template.id
					GetInGameInterface():SetMode("electricity_switch")
				end,
				build_pos = 21,
				close_parent = true,
			}
		end
	end
	if category_id == "Life-Support" then
		count = count + 2
		if bCreateItems then
			local construction_cost = T{8102, "<formatedbuildinginfo('LifeSupportGridElement')>"}
			local description = T{3972, "Transport Water and Oxygen."}
			local require_construction = not(g_Consts and g_Consts.InstantPipes ~= 0)
			if require_construction and construction_cost~="" then
				description = description..Untranslated("\n\n")..construction_cost
			end
			local hint = ""
			local binding = "actionPlacePipes"
			local shortcuts = GetShortcuts(binding)
			if shortcuts and (shortcuts[1] or shortcuts[2]) then
				hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
			end
			items[#items + 1] = {
				name = "Pipes",
				Id = "Pipes",
				display_name = T{882, "Pipes"},
				icon = "UI/Icons/Buildings/pipes.tga",
				description = description,
				hint = hint,
				enabled = not g_Tutorial or not g_Tutorial.BuildMenuWhitelist or g_Tutorial.BuildMenuWhitelist.Pipes or false,
				action = function()
					g_LastBuildItem = "Pipes"
					GetInGameInterface():SetMode("life_support_grid", {grid_elements_require_construction = require_construction})
				end,
				build_pos = 8,
				close_parent = true,
			}
		
			local building_template = BuildingTemplates.LifesupportSwitch
			local hint = ""
			local binding = "actionBuild" .. building_template.id
			local shortcuts = GetShortcuts(binding)
			if shortcuts and (shortcuts[1] or shortcuts[2]) then
				hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
			end
			local description = T{8103, "<description>\n\n<formatedbuildinginfo('LifesupportSwitch')>",description = building_template.description}
			items[#items + 1] = {
				name = building_template.id,
				Id = building_template.id,
				display_name = building_template.display_name,
				icon = building_template.display_icon,
				description = description,
				hint = hint,
				enabled = not g_Tutorial or not g_Tutorial.BuildMenuWhitelist or g_Tutorial.BuildMenuWhitelist.LifesupportSwitch or false,
				action = function()
					g_LastBuildItem = building_template.id
					GetInGameInterface():SetMode("lifesupport_switch")
				end,
				build_pos = 9,
				close_parent = true,
			}
		end
	end
	if category_id == "Infrastructure" then
		count = count + 1
		local next_bld_pos = 20
		if bCreateItems then
			if not g_Tutorial or not g_Tutorial.BuildMenuWhitelist or g_Tutorial.BuildMenuWhitelist.Salvage then
				local binding = "Demolish"
				local shortcuts = GetShortcuts(binding)
				local hint = ""
				if shortcuts and (shortcuts[1] or shortcuts[2]) then
					hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
				end
				items[#items + 1] = {
					name = "Salvage",
					Id = "Salvage",
					display_name = T{3973, "Salvage"},
					icon = "UI/Icons/Buildings/salvage.tga",
					description = T{3974, "Marks buildings, cables and pipes to be demolished. Half of the construction resource cost of any salvaged buildings will be refunded."},
					hint = hint,
					action = function()
						g_LastBuildItem = "Salvage"
						GetInGameInterface():SetMode("demolish")
						PlayFX("DemolishButton", "start")
					end,
					build_pos = next_bld_pos,
					close_parent = true,
				}
			end
		end
	end
	if category_id == "Domes" then
		local building_template = BuildingTemplates.Passage
		local construction_cost = T{8720, "<formatedbuildinginfo('Passage')>"}
		local description = building_template.description
		if g_Consts.InstantPassages == 0 then
			description = description .. Untranslated("\n\n") .. construction_cost
		end
		local hint = ""
		local binding = "actionBuild" .. building_template.id
		local shortcuts = GetShortcuts(binding)
		if shortcuts and (shortcuts[1] or shortcuts[2]) then
			hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
		end
		items[#items + 1] = {
			name = "Passage",
			display_name = building_template.display_name,
			icon = building_template.display_icon,
			description = description,
			hint = hint,
			enabled =  not g_Tutorial or (g_Tutorial.BuildMenuWhitelist and g_Tutorial.BuildMenuWhitelist[building_template.id]) or false,
			action = function()
				GetInGameInterface():SetMode("passage_grid", {grid_elements_require_construction = g_Consts.InstantPassages == 0})
			end,
			build_pos = 20,
			close_parent = true,
		}
		building_template = BuildingTemplates.PassageRamp
		local hint = ""
		local binding = "actionBuild" .. building_template.id
		local shortcuts = GetShortcuts(binding)
		if shortcuts and (shortcuts[1] or shortcuts[2]) then
			hint = T{10930, "Shortcut - <em><ShortcutName(shortcut, 'keyboard')></em>", shortcut = binding}
		end
		items[#items + 1] = {
			name = "PassageRamp",
			display_name = building_template.display_name,
			icon = building_template.display_icon,
			description = T{8721, "<description>\n\n<formatedbuildinginfo('PassageRamp')>",description = building_template.description},
			hint = hint,
			enabled =  not g_Tutorial or (g_Tutorial.BuildMenuWhitelist and g_Tutorial.BuildMenuWhitelist[building_template.id]) or false,
			action = function()
				GetInGameInterface():SetMode("passage_ramp")
			end,
			build_pos = 21,
			close_parent = true,
		}
		count = count + 2
	end
	table.sortby(items, "build_pos")
	if bCreateItems then
		return items, count
	else	
		return count
	end	
end

function XBuildMenu:FindCategoryOfItem(item_name)
	if item_name == "PowerCables" or item_name =="Power" then 
		return "Power"
	elseif item_name == "Pipes" or item_name == "Life-Support" then
		return "Life-Support"
	else
		local content_data = BuildingTemplates[item_name]
		if content_data and not content_data.hide_from_build_menu then
			local category = content_data.build_category
			local tech_shown, tech_enabled = GetBuildingTechsStatus(item_name, category)
			if tech_shown and tech_enabled then
				return category
			end
			if category==item_name then
				return category
			end	
		end
	end
end		

function OpenXBuildMenu(selected_dome)
	if g_RightClickOpensBuildMenu and not GetUIStyleGamepad() and
		not g_BuildMenuRightClickPopupShown and
		g_BuildMenuRightClicksCount < 10 and
		g_BuildMenuHUDClicksCount >= 10
	then
		g_BuildMenuRightClickPopupShown = true
		ShowPopupNotification("SuggestedShortcutBuildMenu", false, false, GetInGameInterface())
	end

	CloseDialog("GamepadIGMenu")
	OpenDialog("XBuildMenu", GetInGameInterface(), { selected_dome = selected_dome, first_category = g_LastBuildCat, first_selected_item = g_LastBuildItem })
	CloseXInfopanel()
	UpdateInfobarVisibility("force")
end

function CloseXBuildMenu()
	CloseDialog("XBuildMenu")
end

function ToggleXBuildMenu(count_right_click, close_action, ...)
	local build_menu = GetDialog("XBuildMenu")
	if build_menu then
		if build_menu:IsThreadRunning("CloseThread") then
			if count_right_click then
				g_BuildMenuRightClicksCount = g_BuildMenuRightClicksCount + 1
			end
			build_menu:delete()
			OpenXBuildMenu(...)
		else
			if close_action == "back" then
				build_menu:SelectParentCategory()
			else
				build_menu:Close()
			end
		end
	else
		if count_right_click then
			g_BuildMenuRightClicksCount = g_BuildMenuRightClicksCount + 1
		end
		OpenXBuildMenu(...)
	end
end

function RefreshXBuildMenu()
	local build_menu = GetDialog("XBuildMenu")
	if not build_menu then return end
	
	--a thread is needed here, because buildings add themselves to labels in their GameInit()
	--this way `wonder` buildings are taken into account when refreshing
	build_menu.refresh_thread = CreateGameTimeThread(function()
		local category = build_menu.category_id
		for i,item in ipairs(build_menu.items) do
			local building_template = BuildingTemplates[item.name]
			if building_template then
				local show, prefabs, can_build, action, description = UIGetBuildingPrerequisites(category, building_template, false, "ignore_check")
				item.enabled = can_build or false
				item.prefabs = prefabs or false
				item.description = description or item.description or false
				item:UpdateContent()
			end
		end
	end)
end

local previous_was_construction
function OnMsg.UIModeChange(mode)
	local mode_dlg = GetInGameInterfaceModeDlg()
	local is_construction = IsKindOfClasses(mode_dlg, "ConstructionModeDialog", "GridConstructionDialog", "GridSwitchConstructionDialog", "DemolishModeDialog")
	if not previous_was_construction and not is_construction then
		CloseXBuildMenu()
	elseif previous_was_construction and not is_construction then
		local build_menu = GetDialog("XBuildMenu")
		if build_menu then
			if GetUIStyleGamepad() and g_LastBuildItem then
				for i,item in ipairs(build_menu.items) do
					if g_LastBuildItem == item.name then
						item:SetFocus(true)
						break
					end
				end
			else
				build_menu:SetFocus(true)
			end
			RefreshXBuildMenu()
		end
	end
	previous_was_construction = is_construction
end

function OnMsg.SelectionChange()
	if SelectedObj then
		CloseXBuildMenu()
	end
end
