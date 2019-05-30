function GetBuildingEntities(first_element)
	local allentities = GetAllEntities()
	local items = {}
	for name in pairs(allentities) do
		local entity_data = EntityData[name]
		if entity_data and entity_data.entity and entity_data.entity.class_parent == "BuildingEntityClass" then
			items[#items+1] = name
		end
	end
	table.sort(items)
	if first_element ~= nil then
		table.insert(items, 1, first_element)
	end
	local mod_entities = GetModEntities("building")
	table.iappend(items, mod_entities)
	return items
end

--[[
--returns an array of world positions defining the outline of the building
-- for debug only
function GetShapePointsToWorldPos(obj)
	local shape = table.copy(obj:GetShapePoints())
	local pos = obj:GetPos()
	for i = 1, #shape do
		local offset = point(HexToWorld(shape[i]:xy())):SetZ(0)
		shape[i] = pos + offset
	end
	return shape
end
--]]

function GetCropEntities(first_element)
	local allentities = GetAllEntities()
	local items = {}
	for name in pairs(allentities) do
		local entity_data = EntityData[name]
		if entity_data and entity_data.entity and entity_data.entity.class_parent == "CropEntityClass" then
			items[#items+1] = name
		end
	end
	table.sort(items)
	if first_element ~= nil then
		table.insert(items, 1, first_element)
	end
	local mod_entities = GetModEntities("crop")
	table.iappend(items, mod_entities)
	return items
end
-----------------------------------------------------------------------------------------------------------
function Random(min, max, id, obj1, obj2)
	assert(max < max_int, "You are about to overflow and get a random zero")
	return InteractionRand(max - min + 1, id, obj1, obj2) + min
end

function RandomizePercent(value, percent, step)
	step = step or 1
	percent = percent - (InteractionRand(2 * percent, "randomize_perc") + step / 2) / step * step
	return value + value * percent / 100 
end

--------------------------------------------------- format functions ---------------------------------
function FormatResourceIconSmall(value, resource)
	return T{4835, "<value><resource_icon>", value = value, resource_icon = TLookupTag("<icon_" .. resource .."_small>") } 	
end

local rs = const.ResourceScale

function FormatDuration(hours)
	if hours < const.HoursPerDay then
		return T{4839, "<em><hours>h</em>", hours = hours}
	elseif hours % const.HoursPerDay ~= 0 then
		return T{4840, "<em><sols> Sols, <hours>h</em>", sols = hours / const.HoursPerDay, hours = hours % const.HoursPerDay}
	else
		return T{4841, "<em><sols> Sols</em>", sols = hours / const.HoursPerDay}
	end
end

local ForcedIntegerResources = {
	["Colonist"] = true,
	["Home"] = true,
	["Homeless"] = true,
	["Work"] = true,
	["Unemployed"] = true,
	["Drone"] = true,
	["Research"] = true,
}

-- FormatResourceValueMaxResource(context_obj, value ) -> value/const.ResourceScale
-- FormatResourceValueMaxResource(context_obj, value, resource) -> value/const.ResourceScale .. [resource icon]
-- FormatResourceValueMaxResource(context_obj, value, max, resource ) -> value/const.ResourceScale .. "/" .. max/const.ResourceScale .. [resource icon]

local function GetFracWithoutEndingZeros(frac)
	while frac % 10 == 0 do
		frac = frac/10
	end
	return tostring(frac)
end

local function GetFracOfZeroInt(value, resource)
	local frac
	if value<(rs/100) then
		if ResourceNoRoundingDecimalPart[resource] then
			frac = Untranslated("00".. GetFracWithoutEndingZeros(value%rs))
		else
			if value >= rs/200 then
				frac = Untranslated("01")
			end
		end
	elseif value<(rs/10) then
		if ResourceNoRoundingDecimalPart[resource] then
			frac = Untranslated("0".. GetFracWithoutEndingZeros(MulDivRound(value, 100, 10)/10))
		else
			if value >= rs/10 - rs/200 then
				frac = Untranslated("1")
			else
				frac = Untranslated("0".. tostring(value%(rs/100) < rs/200 and value/(rs/100) or value/(rs/100) + 1))
			end
		end
	elseif value<rs and ResourceNoRoundingDecimalPart[resource] then
		frac = Untranslated(GetFracWithoutEndingZeros(value))
	end
	return frac
end

ResourceNoRoundingDecimalPart = {}
function FormatResourceValueMaxResource(context_obj, value, max, resource)
	if not value then return "" end
	
	local value_sign = value ~= 0 and abs(value)/value or 1
	value = abs(value)
	local value_frac = MulDivRound(value, 10, rs) % 10
	local value_int = MulDivRound(value, 10, rs)/10
	
	if not resource then
		-- three arguments or less
		if max then
			resource = max
		end
		max = false
	end
	if resource == "funding" then
		return TFormat.funding(context_obj, value)
	end
	
	local force_integer = ForcedIntegerResources[resource]
	local Tmax, Tresource = "", ""
	
	if max then
		local max_frac = MulDivRound(max, 10, rs) % 10
		if force_integer then
			Tmax  = T{4842, "/<int>", int = max} 
		else
			local max_int = MulDivRound(max, 10, rs)/10
			Tmax  = max_frac == 0 and T{4842, "/<int>", int = max_int} or T{4843, "/<int>.<frac>", int = max_int, frac = max_frac }
		end
	end

	if resource then
		Tresource = TLookupTag("<icon_" .. resource .. ">")
	end

	local frac 
	if value ~= 0 and value_int == 0 then
		frac = GetFracOfZeroInt(value, resource)
	end
	local Tvalue = force_integer and T{4844, "<int>", int = value} 
		or (value_frac == 0 and not frac) and T{4844, "<int>", int = value_int} 
		or T{4845, "<int>.<frac>", int = value_int, frac = frac or Untranslated(value_frac) } 
	if value_sign < 0 then
		Tvalue = T(6981, "-") .. Tvalue
	end
	return Tvalue .. Tmax .. Tresource
end

FormatResource = FormatResourceValueMaxResource

FormattableResources = {}
FormattableResourcesWithoutRP = {}

local function FormatResourceFn(format_id, resource)
	if resource ~= "Research" then
		FormattableResourcesWithoutRP[#FormattableResourcesWithoutRP + 1] = { text = resource, value = format_id }
	end
	FormattableResources[#FormattableResources + 1] = { text = resource, value = format_id }
	TFormat[format_id] = function(context_obj, value, max)
		return FormatResourceValueMaxResource(context_obj, value, max, resource)
	end
end

TFormat.FormatPercent = function(...)
	assert(false, "Obsolete format function. Use 'percent' function instead.")
	return FormatPercent(...)
end	
TFormat.FormatResource = function( ...)
	assert(false, "Obsolete format function. Use specific resource function instead.")
	return FormatResourceValueMaxResource(...)
end	
TFormat.FormatResourceIcon = function(...)
	assert(false, "Obsolete format function. Use specific resource function instead.")
	return FormatResourceValueMaxResource(...)
end

function FormatResourceName(resource)
	local invalid_resource = T(4855, "<red>INVALID RESOURCE</red>")
	if resource and Resources[resource] then
		return Resources[resource].display_name or invalid_resource
	end	
	return invalid_resource
end

TFormat.FormatDuration = function(context_obj, ...) return FormatDuration(...) end
TFormat.resource = function(context_obj, param1,...)
	if type(param1)=="string" then
		return FormatResourceName(param1)
	else
		return FormatResourceValueMaxResource(context_obj, param1,...)
	end
end
FormatResourceFn("water", "Water")
FormatResourceFn("power", "Power")
FormatResourceFn("air", "Air")
FormatResourceFn("concrete", "Concrete")
FormatResourceFn("metals", "Metals")
FormatResourceFn("polymers", "Polymers")
FormatResourceFn("food", "Food")
FormatResourceFn("research", "Research")
FormatResourceFn("drone", "Drone")
FormatResourceFn("colonist", "Colonist")
FormatResourceFn("home", "Home")
FormatResourceFn("homeless", "Homeless")
FormatResourceFn("work", "Work")
FormatResourceFn("unemployed", "Unemployed")
FormatResourceFn("fuel", "Fuel")
FormatResourceFn("electronics", "Electronics")
FormatResourceFn("machineparts", "MachineParts")
FormatResourceFn("preciousmetals", "PreciousMetals")
FormatResourceFn("seeds", "Seeds")
FormatResourceFn("wasterock", "WasteRock")
FormatResourceFn("shuttle", "Shuttle")
FormatResourceFn("blackcube", "BlackCube")
FormatResourceFn("mysteryresource", "MysteryResource")

TFormat.FormatResourceName = function(...)
	assert(false, "Obsolete format function. Use 'resource' function instead.")
	return TFormat.resource(...)
end	

TFormat.Sol = function() return UICity and UICity.day or 0 end
TFormat.ColonistName = function(context_obj, x) 
	if not x or not IsKindOf(x, "Colonist") then
		printf("Invalid argument supplied to ColonistName(): %s", tostring(x))
		return ""
	end
	return x:GetDisplayName()
end
TFormat.ResearchPoints = function(context_obj, points)
	return T{4856, "<em><points><image UI/Icons/res_experimental_research.tga></em>", points = points}
end
TFormat.time = function(context_obj, time)
	return FormatDuration((time or 0) / const.HourDuration)
end
TFormat.TraitName = function(context_obj,x)
	if not x then return "" end
	local trait = TraitPresets[x]
	if not trait then return "" end
	return trait.display_name
end

TFormat.funding = function(context_obj,x)
	local div, suffix
	if type(x) ~= "number" then return end
	if x < 1000 then
		return T{4857, "<em>$<integer></em>", integer = x}
	elseif x < 1000*1000 then
		div = 1000
		suffix = T(4858, "k")
	else
		div = 1000*1000
		suffix = T(6983, "M")
	end
	
	local integer = x / div
	local fractional = string.format("%01d", (x % div) / (div / 10))
	if fractional == "0" or fractional == "00" then
		return T{4859, "<em>$<integer> <suffix></em>", integer = integer, suffix = suffix}
	else
		return T{4860, "<em>$<integer>.<fractional> <suffix></em>", integer = integer, fractional = Untranslated(fractional), suffix = suffix}
	end
end
TFormat.FormatFunding = function(...)
	assert(false, "Obsolete format function. Use 'funding' function instead.")
	return TFormat.funding(...)
end

TFormat.new_in = function(context_obj, version)
	if version == const.GameNewFeaturesNotificationVersion then
		return T(11446, "<em>NEW!</em> ")
	end
	return ""
end

------------------------------------------------------------------------------------------
ConstructionStages = {
	{ value = 1, text = Untranslated("First") },
	{ value = 2, text = Untranslated("Second") },
}

function DepositResourcesCombo()
	local result = table.icopy(DepositResources)
	for i=1,#result do
		local resource = result[i]
		result[i] = { text = table.find_value(ResourceDescription, "name", resource).display_name, value = resource }
	end
	table.insert(result, 1, { text = "All resources", value = "all" })
	return result
end

function ConstructionResourcesCombo()
	local result = table.icopy(ConstructionResourceList)
	for i=1,#result do
		local resource = result[i]
		result[i] = { text = table.find_value(ResourceDescription, "name", resource).display_name, value = resource }
	end
	table.insert(result, 1, { text = "All resources", value = "all" })
	return result
end

function AllResourcesCombo() --construction resources, food, grid, funding, RP
	local result = table.icopy(ResourcesDropDownListItems)
	table.remove_entry(result, "value", "Water")
	result[#result + 1] = { text = T(4806, "Water Production"), value =  "Water"}
	result[#result + 1] = { text = T(5558, "Air Production"), value =  "Air"}
	result[#result + 1] = { text = T(936, "Power Production"), value =  "Power"}
	result[#result + 1] = { text = T(33, "Stored Water"), value =  "StoredWater"}
	result[#result + 1] = { text = T(1074, "Stored Air"), value =  "StoredAir"}
	result[#result + 1] = { text = T(945, "Stored Power"), value =  "StoredPower"}
	return result
end

function BuildCategoriesCombo()
	local list = { {value = "", text = ""} }
	for i = 1, #BuildCategories do
		list[#list + 1] = { value = BuildCategories[i].id, text = BuildCategories[i].name }
	end
	return list
end

function BuildingsCombo(first_entry)
	local items = {}
	for id, template in pairs(BuildingTemplates or "") do
		items[#items + 1] = {value = id, text = template.display_name}
	end
	TSort(items, "text")
	table.insert(items, 1, first_entry or {value = "", text = ""})
	return items
end

function PrefabsCombo(first_entry)
	local items =  BuildingsCombo(first_entry)
	table.insert(items, 2, {value = "DronePrefab", text = T(11189, "Drone Prefab")})
	return items
end

function TechCombo()
	local items = {}
	for id, tech in pairs(TechDef) do
		items[#items + 1] = {value = id, text = tech.display_name}
	end
	TSort(items, "text")
	table.insert(items, 1, {value = "", text = ""})
	return items
end

function ResearchFieldsCombo()
	local fields = table.keys(TechFields)
	table.sort(fields)
	table.insert(fields, 1, "All Fields")

	return fields
end

function ResearchTechsCombo(object)
	local techs = { { value = "", text = "" } }
	if not object:HasMember("Field") or not TechFields[object.Field] then
		return techs
	end
	--gather techs
	local defs = Presets.TechPreset[object.Field] or ""
	for i=1,#defs do
		techs[#techs+1] = { value = defs[i].id, text = defs[i].display_name }
	end
	return techs
end

function TraitsCombo(category, city, traitsonly)
	local nonerare, rare = GetCompatibleTraits({}, {}, {}, category)
	local traits = {{value = "", text = ""}}
	for i=1,#nonerare do
		local trait = TraitPresets[nonerare[i]]
		local name = trait.id
		if not traitsonly or not const.ColonistSpecialization[name] then
			if not city or IsTraitAvailable(trait, city) then
				traits[#traits+1] = { value = trait.id, text = trait.display_name }
			end
		end
	end
	for i=1,#rare do
		local trait = TraitPresets[rare[i]]
		if not city or IsTraitAvailable(trait, city) then
			traits[#traits+1] = { value = trait.id, text = trait.display_name }
		end
	end
	return traits
end

function PositiveTraitsCombo(city)
	return TraitsCombo("Positive", city)
end

function BuildingTraitsCombo(object, TraitsList)
	object = object or empty_table
	local trait_presets = TraitPresets
	local traits = {}
	local city = rawget(object, "city") -- don't filter locked traits if there's no object given
	for _, trait_id in ipairs(TraitsList) do
		if trait_presets[trait_id] then
			if not city or IsTraitAvailable(trait_id, city) then
				traits[#traits + 1 ]={value = trait_id, text = trait_presets[trait_id].display_name}
			end
		else
			print("once", "Invalid trait  in ", object.class, "-", trait_id)
		end
	end
	return traits
end

function NegativeTraitsCombo(city)
	return TraitsCombo("Negative", city)
end

function BaseTraitsCombo(city, add_empty)
	local traits = TraitsCombo("Positive", city)
	table.iappend(traits, TraitsCombo("Negative", city))
	table.iappend(traits, TraitsCombo("other", city))
	traits = table.ifilter(traits, function(idx, t) 
		local trait = TraitPresets[t.value] 
		return trait and t.value ~= "" and trait.auto and not g_HiddenTraitsDefault[t.value] 
	end)
	
	if add_empty then
		table.insert(traits, 1, {text = T(6761, "None"), value = ""})
	end
	
	return traits
end

function SponsorGoalsCombo()
	return table.keys2(SponsorGoalsMap, true, "")
end

function RewardsCombo()
	return table.keys2(RewardsMap, true, "")
end

function ModifiablePropsCombo()
	return ModifiablePropsComboItems
end

function DomeSkinsPresetsCombo()
	local skins = table.get_unique(table.map(Presets.DomeSkins.Default, "preset"))
	table.insert(skins, 1, "")
	return skins
end

function PickVolunteer(crew)
	local cowards = table.copy(crew)
	local volunteer = table.rand(cowards, InteractionRand("PickVolunteer"))
	table.remove_value(cowards, volunteer)
	return volunteer, cowards
end

function PickTwoVolunteers(crew)
	local cowards = table.copy(crew)
	local volunteer1 = table.rand(cowards, InteractionRand("PickVolunteer"))
	table.remove_value(cowards, volunteer1)
	local volunteer2 = table.rand(cowards, InteractionRand("PickVolunteer"))
	table.remove_value(cowards, volunteer2)
	return volunteer1, volunteer2, cowards
end

function GetAvailableResidences(city)
	local city = city or UICity
	local domes = city.labels.Dome or empty_table
	local sum = 0
	for i = 1, #domes do
		local dome = domes[i]
		if dome.accept_colonists and dome.ui_working then
			sum = sum + Max(0, dome:GetFreeLivingSpace())
		end	
	end	
	return sum
end 

function GetDomesInWalkableDistance(city, pos, exclude)
	exclude = exclude or empty_table
	local domes, dome_dist = {}, {}
	if pos == InvalidPos() then
		assert(false, "Searching around an invalid pos!")
		return domes
	end
	local safety_dome, safety_dist = nil, max_int
	for _, dome in ipairs((city or UICity).labels.Dome or empty_table) do
		if not dome.destroyed and not dome.demolishing and not rawget(exclude, dome) then
			local is_walking, dist = IsInWalkingDist(dome, pos)
			if dist then
				if safety_dist > dist then
					safety_dome = dome
					safety_dist = dist
				end
				if is_walking and dome.accept_colonists and dome.ui_working and dome:HasPower() and dome:HasWater() and dome:HasAir() then
					dome_dist[dome] = dist
					domes[#domes + 1] = dome
				end
			end
		end
	end
	table.sortby(domes, dome_dist)
	return domes, safety_dome
end

-- domes are ordered by distance, the first one to match is the best
function ChooseDome(traits, domes, safety_dome, free_space)
	local best_dome = safety_dome
	local best_eval = -1
	local is_child = traits.Child
	for _, dome in ipairs(domes or empty_table) do
		local eval = TraitFilterColonist(dome.traits_filter, traits)
		if best_eval < eval then
			local has_space
			if free_space then
				local space = free_space[dome] or dome:GetFreeLivingSpace(is_child)
				free_space[dome] = space
				has_space = space > 0
			else
				has_space = dome:HasFreeLivingSpace(is_child)
			end
			if has_space then
				best_dome = dome
				best_eval = eval
			end
		end
	end
	return best_dome
end

function GetFreeWorkplacesAround(dome)
	local sum_ui_on = 0
	local sum_ui_off = 0
	for _, b in ipairs(dome.labels.Workplace or empty_table) do
		if not b.destroyed and not b.demolishing then
			if b.ui_working then
				sum_ui_on = sum_ui_on + b:GetFreeWorkSlots()
			end
			sum_ui_off = sum_ui_off + b:GetClosedSlots()
		end   
	end
	return sum_ui_on, sum_ui_off
end

function GetFreeWorkplaces(city)
	local workplaces = city.labels.Workplace or empty_table	
	local sum_ui_on = 0
	local sum_ui_off = 0
	for i=1,#workplaces do
		local b = workplaces[i]
		if not b.destroyed and not b.demolishing then
			if b.ui_working then
				sum_ui_on = sum_ui_on + b:GetFreeWorkSlots()
			end
			sum_ui_off = sum_ui_off + b:GetClosedSlots()
		end
	end
	return sum_ui_on, sum_ui_off
end

function GetFreeLivingSpace(city, count_children)
	local free = 0
	for _, home in ipairs(city.labels.Residence or empty_table) do
		if not home.destroyed and (count_children or not home.children_only) then
			free = free + home:GetFreeSpace()
		end
	end
	return free
end

-- "<on_off(IsResourceAvailable(res))>"
TFormat.on_off = function (context_obj, var)
	return (var and var ~= "") and T(6772, "<green>ON</green>") or T(6771, "<red>OFF</red>")
end

TFormat.is_sponsor = function (context_obj, sponsor_name)
	return GetMissionSponsor().id == sponsor_name
end

TFormat.is_commander = function (context_obj, commander_profile)
	return GetCommanderProfile().id == commander_profile
end

TFormat.rule = function (context_obj, rule)
	return IsGameRuleActive(rule)
end

TFormat.EasyMaintenanceText = function (context_obj, add)
	return T{10557, "<if(rule('EasyMaintenance'))><add><newline><em>Easy Maintenance</em> - malfunctions are suppressed.</if>", add = add and Untranslated("<newline>") or ""}
end

TFormat.modifier_percent = function(obj, prop, id)
	local percent = 0
	local mods = (obj and obj.modifications or empty_table)[prop] or empty_table
	for _, mod in ipairs(mods) do
		if id and string.starts_with(mod.id or "", id) then
			percent = percent + mod.percent
		end
	end
	return Untranslated(string.format("%s%%", tostring(percent)))
end

TFormat.modifier_amount = function(obj, prop, id)
	local amount = 0
	local mods = (obj and obj.modifications or empty_table)[prop] or empty_table
	for _, mod in ipairs(mods) do
		if id and string.starts_with(mod.id or "", id) then
			amount = amount + mod.amount
		end
	end
	return Untranslated(string.format("%s", tostring(amount)))
end

function EdgeAnimation(bReverse, ctrl, offsetx, offsety, time)
	local endrect = sizebox(point(ctrl.box:minx() + (offsetx or 0), ctrl.box:miny() + (offsety or 0)), ctrl.box:size())
	if ctrl.box:IsValid() then
		ctrl:AddInterpolation{
			id = "move",
			type = const.intRect,
			duration = time or const.InterfaceAnimDuration,
			originalRect = ctrl.box,
			targetRect = endrect,
			flags = bReverse and const.intfInverse or nil,
			autoremove = true,
			easing = bReverse and const.Easing.SinOut or const.Easing.SinIn,
		}
	end
end

function AddEmpty(list, empty)
	local items = table.icopy(list)
	table.insert(items, 1, empty or "")
	return items
end

---------------nested_list classes--------------
DefineClass.ResourceAmount = {
	__parents = { "PropertyObject", },
	properties = {
		{ id = "resource", name = "Resource", editor = "choice", default = false, items =  function (self) return AllResourcesCombo() end,},
		{ id = "amount", name = "Amount", editor = "number", default = false, scale = const.ResourceScale},
	},
}

function ResourceAmount:GetEditorView() 
	if not self.resource then
		return self.EditorView
	end
	return self.amount and (self.amount/const.ResourceScale)..Untranslated(" <resource>") or Untranslated("<resource>")
end

function ResourceAmount:GetText() 
	if not self.resource or not self.amount or self.amount<=0 then 
		return ""
	end
	
	if self.resource=="Funding" then
		return T{11086, "<funding(amount)>", amount = self.amount} 	
	else
		return T{722, "<resource(amount,res)>", amount = self.amount, res=self.resource} 
	end
end

TFormat.has_researched = function (context_obj, tech_id)
	return UICity:IsTechResearched(tech_id)
end

TFormat.has_prefabs = function (context_obj, template_id, min_count)
	return UICity:GetPrefabs(template_id) >= (min_count or 1)
end