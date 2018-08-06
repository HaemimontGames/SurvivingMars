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
	table.append(items, mod_entities)
	return items
end

--returns an array of world positions defining the outline of the building
function GetShapePointsToWorldPos(obj)
	local shape = table.copy(obj:GetShapePoints())
	local pos = obj:GetPos()
	for i = 1, #shape do
		local offset = point(HexToWorld(shape[i]:xy())):SetZ(0)
		shape[i] = pos + offset
	end
	return shape
end

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
	table.append(items, mod_entities)
	return items
end

function GetRandomPassablePos(max_radius, min_radius, center)
	min_radius = min_radius or 0
	local mw, mh = terrain.GetMapSize()
	center = center or point(mw / 2, mh / 2)
	for j = 1, 25 do
		local pt = RotateRadius(min_radius + InteractionRand(max_radius - min_radius),InteractionRand(360 * 60), center)
		local x, y = pt:x(), pt:y()
		x = Clamp(x, guim, mw - guim)
		y = Clamp(y, guim, mh - guim)
		if terrain.IsPassable(x, y) then
			return point(x, y)
		end
	end
	return center
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
function FormatNone(value)
	return value
end

function FormatPercent(context_obj, value, max)
	if not max then
		return T{4834, "<percentage>%", percentage = value, context_obj}
	else
		local percent = MulDivRound(value, 100, max)
		return T{4834, "<percentage>%", percentage = percent,context_obj}
	end
end

function FormatResourceIconSmall(value, resource)
	return T{4835, "<value><resource_icon>", value = value, resource_icon = TLookupTag("<icon_" .. resource .."_small>") } 	
end

function FormatAsFloat(precision, mul, prefix, postfix)
	prefix = prefix or ""
	postfix = postfix or ""
	if precision == 0 then
		return function(v)
			return T{4836, "<prefix><n><postfix>", n = v / mul, prefix = prefix, postfix = postfix}
		end
	elseif precision == 1 then
		return function(v)
			return T{4837, "<prefix><n>.<d1><postfix>", n = v / mul, d1 = MulDivTrunc(v, 10, mul) % 10, prefix = prefix, postfix = postfix}
		end
	elseif precision == 2 then
		return function(v)
			return T{4838, "<prefix><n>.<d1><d2><postfix>", n = v / mul, d1 = MulDivTrunc(v, 10, mul) % 10, d2 = MulDivTrunc(v, 100, mul) % 10, prefix = prefix, postfix = postfix}
		end
	else
		assert(false, "FormatAsFloat: precision not supported")
	end
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
	
	local Tvalue = force_integer and T{4844, "<int>", int = value} 
		or (value_frac == 0) and T{4844, "<int>", int = value_int} 
		or T{4845, "<int>.<frac>", int = value_int, frac = value_frac } 
	if value_sign < 0 then
		Tvalue = T{6981, "-"} .. Tvalue
	end
	return Tvalue .. Tmax .. Tresource
end

FormatResource = FormatResourceValueMaxResource

function FormatInt(value, precision, size)
	if value < 1000 then
		if size then
			return T{10465, "<value>B", value = value}
		end
		return Untranslated(value)
	end
	
	if value<1000000 then
		local dev = 1000
		if not precision or precision == 0 then
			if size then
				return T{10466, "<value>kB", value = value / dev}
			end
			return T{4847, "<value>k", value = value / dev}
		elseif precision == 1 then
			if size then
				return T{10467, "<value>.<rem>kB", value = value / dev, rem = (value%dev)/(dev/10)}
			end
			return T{4848, "<value>.<rem>k", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			if size then
				return T{10467, "<value>.<rem>kB", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
			end
			return T{4849, "<value>.<rem>K", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end	
	elseif value<1000000000 then
		local dev = 1000000
		if not precision or precision == 0 then
			if size then
				return T{10468, "<value>MB", value = value / dev}
			end
			return T{4850, "<value>M", value = value / dev}
		elseif precision == 1 then
			if size then
				return T{10469, "<value>.<rem>MB", value = value / dev, rem = (value%dev)/(dev/10)}
			end
			return T{4851, "<value>.<rem>M", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			if size then
				return T{10469, "<value>.<rem>MB", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
			end
			return T{4851, "<value>.<rem>M", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end		
	else
		local dev = 1000000000
		if not precision or precision == 0 then
			if size then
				return T{10470, "<value>GB", value = value / dev}
			end
			return T{4852, "<value>G", value = value / dev}
		elseif precision == 1 then
			if size then
				return T{10471, "<value>.<rem>GB", value = value / dev, rem = (value%dev)/(dev/10)}
			end
			return T{4853, "<value>.<rem>G", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			if size then
				return T{10471, "<value>.<rem>GB", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
			end
			return T{4853, "<value>.<rem>G", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end		
	end
end

function FormatSize(value, precision)
	return FormatInt(value, precision, true)
end

function FormatSignInt(value, precision)
	local txt = FormatInt(abs(value), precision)
	if txt and value > 0 then
		txt = Untranslated('+') .. txt
	end
	return txt
end

function FormatScale(value, scale, round)
	return round and DivRound(value, scale) or (value/scale)
end

function FormatIndex(index, context_obj)
	return T{4854, "#<index>", index = index, context_obj}
end

local function FormatResourceFn(format_id,resource)
 TFormat[format_id] = 
	function(context_obj, value, max) 
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
	local invalid_resource = T{4855, "<red>INVALID RESOURCE</red>"}
	if resource and Resources[resource] then
		return Resources[resource].display_name or invalid_resource
	end	
	return invalid_resource
end

TFormat.FormatDuration = function(context_obj, ...) return FormatDuration(...) end
TFormat.percent = function(...) return FormatPercent(...) end
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
FormatResourceFn("wasterock", "WasteRock")
FormatResourceFn("shuttle", "Shuttle")
FormatResourceFn("blackcube", "BlackCube")
FormatResourceFn("mysteryresource", "MysteryResource")

TFormat.FormatResourceName = function(...)
	assert(false, "Obsolete format function. Use 'resource' function instead.")
	return TFormat.resource(...)
end	


TFormat.FormatIndex   = function(context_obj,...) return FormatIndex(...)   end
TFormat.FormatAsFloat = function(context_obj,...) return FormatAsFloat(...) end
TFormat.FormatInt     = function(context_obj,...) return FormatInt(...)     end
TFormat.FormatSize    = function(context_obj,...) return FormatSize(...)    end
TFormat.FormatSignInt = function(context_obj,...) return FormatSignInt(...) end
TFormat.FormatScale   = function(context_obj,...) return FormatScale(...)   end
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
	if not x then return end
	if x < 1000 then
		return T{4857, "<em>$<integer></em>", integer = x}
	elseif x < 1000*1000 then
		div = 1000
		suffix = T{4858, "k"}
	else
		div = 1000*1000
		suffix = T{6983, "M"}
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

TFormat.display_name = function(context_obj, presets_table, value, field)
	value = value and _InternalTranslate(value or "", context_obj, false)
	presets_table = Presets[presets_table] and Presets[presets_table].Default or rawget(_G, presets_table)
	local preset = presets_table[value]
	return preset and preset[field or "display_name"] or value
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

function BuildCategoriesCombo()
	local list = { {value = "", text = ""} }
	for i = 1, #BuildCategories do
		list[#list + 1] = { value = BuildCategories[i].id, text = BuildCategories[i].name }
	end
	return list
end

function BuildingsCombo()
	local items = {}
	for id, template in pairs(BuildingTemplates or "") do
		items[#items + 1] = {value = id, text = template.display_name}
	end
	TSort(items, "text")
	table.insert(items, 1, "")
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
	table.insert(fields, 1, "")
	return fields
end

function ResearchTechsCombo(object)
	local techs = { { value = "", text = "" } }
	if not TechFields[object.Field] then
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
		local name = trait.name
		if not traitsonly or not const.ColonistSpecialization[name] then
			if not city or IsTraitAvailable(trait, city) then
				traits[#traits+1] = { value = trait.name, text = trait.display_name }
			end
		end
	end
	for i=1,#rare do
		local trait = TraitPresets[rare[i]]
		if not city or IsTraitAvailable(trait, city) then
			traits[#traits+1] = { value = trait.name, text = trait.display_name }
		end
	end
	return traits
end

function PositiveTraitsCombo(city)
	return TraitsCombo("Positive", city)
end

function BuildingTraitsCombo(object, TraitsList)
	local trait_presets = TraitPresets
	local traits = {}
	local city = object and object:HasMember("city") and object.city -- don't filter locked traits if there's no object given
	for _, trait_id in ipairs(TraitsList) do
		if trait_presets[trait_id] then
			if not city or IsTraitAvailable(trait_id, city) then
				traits[#traits + 1 ]={value = trait_id, text = trait_presets[trait_id].display_name}
			end
		else
			print("once", "Invalid trait  in ",object.class .." - ".. trait_id)
		end
	end
	return traits
end

function SchoolTraitsCombo(object)
	return BuildingTraitsCombo(object, g_SchoolTraits)
end

function SanatoriumTraitsCombo(object)
	return BuildingTraitsCombo(object, g_SanatoriumTraits)
end

function NegativeTraitsCombo(city)
	return TraitsCombo("Negative", city)
end

function BaseTraitsCombo(city, add_empty)
	local traits = TraitsCombo("Positive", city)
	table.append(traits, TraitsCombo("Negative", city))
	table.append(traits, TraitsCombo("other", city))
	traits = table.ifilter(traits, function(idx, t) 
		local trait = TraitPresets[t.value] 
		return trait and t.value ~= "" and trait.auto and not g_HiddenTraitsDefault[t.value] 
	end)
	
	if add_empty then
		table.insert(traits, 1, {text = T{6761, "None"}, value = ""})
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
	for _, b in ipairs(dome.labels.Workplaces or empty_table) do
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

function RomanNumeral(number)
	-- GRATIA STACCVM SVPERFLVVM
    if number < 1 then return "" end
    if number >= 1000 then return "M" .. RomanNumeral(number - 1000) end
    if number >= 900 then return "CM" .. RomanNumeral(number - 900) end
    if number >= 500 then return "D" .. RomanNumeral(number - 500) end
    if number >= 400 then return "CD" .. RomanNumeral(number - 400) end
    if number >= 100 then return "C" .. RomanNumeral(number - 100) end
    if number >= 90 then return "XC" .. RomanNumeral(number - 90) end
    if number >= 50 then return "L" .. RomanNumeral(number - 50) end
    if number >= 40 then return "XL" .. RomanNumeral(number - 40) end
    if number >= 10 then return "X" .. RomanNumeral(number - 10) end
    if number >= 9 then return "IX" .. RomanNumeral(number - 9) end
    if number >= 5 then return "V" .. RomanNumeral(number - 5) end
    if number >= 4 then return "IV" .. RomanNumeral(number - 4) end
    if number >= 1 then return "I" .. RomanNumeral(number - 1) end
end

function TFormat.roman(context_obj, number)
	if number then
		return Untranslated(RomanNumeral(number))
	end
	return ""
end

function TFormat.abs(context_obj, number)
	if type(number) == "number" then
		return abs(number)
	else
		local n = tonumber(number)
		return n and abs(n) or number
	end
end

function TFormat.cut_if_platform(context_obj, platform)
	if Platform[platform] then
		return false
	end
	return ""
end

function TFormat.cut_if_not_platform(context_obj, platform)
	if not Platform[platform] then
		return false
	end
	return ""
end		

function TFormat.opt_amount(context_obj, amount)
	amount = tonumber(amount)
	if type(amount) ~= "number" or amount == 0 then return "" end
	if amount < 0 then
		return Untranslated("" .. amount)
	else
		return Untranslated("+" .. amount)
	end
end

function TFormat.opt_percent(context_obj, percent)
	percent = tonumber(percent)
	if type(percent) ~= "number" or percent == 0 then return "" end
	local pattern = percent < 0 and "%d%%" or "+%d%%"
	return Untranslated(string.format(pattern, percent))
end

-- "<on_off(IsResourceAvailable(res))>"
TFormat.on_off = function (context_obj, var)
	return (var and var ~= "") and T{6772, "<green>ON</green>"} or T{6771, "<red>OFF</red>"}
end

TFormat.has_dlc = function (context_obj, dlc)
	return IsDlcAvailable(dlc)
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

function EdgeAnimation(bReverse, ctrl, offsetx, offsety, time)
	local endrect = sizebox(point(ctrl.box:minx() + (offsetx or 0), ctrl.box:miny() + (offsety or 0)), ctrl.box:size())
	if ctrl.box:IsValid() then
		ctrl:AddInterpolation{
			id = "move",
			type = const.intRect,
			duration = time or const.InterfaceAnimDuration,
			startRect = ctrl.box,
			endRect = endrect,
			flags = bReverse and const.intfInverse or nil,
			autoremove = true,
			easing = bReverse and const.Easing.SinOut or const.Easing.SinIn,
		}
	end
end
