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

function FormatPercent(value, max, context_obj)
	if not context_obj then
		context_obj = max
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

-- FormatResourceValueMaxResource(value, context_obj) -> value/const.ResourceScale
-- FormatResourceValueMaxResource(value, resource, context_obj) -> value/const.ResourceScale .. [resource icon]
-- FormatResourceValueMaxResource(value, max, resource, context_obj) -> value/const.ResourceScale .. "/" .. max/const.ResourceScale .. [resource icon]

function FormatResourceValueMaxResource(value, max, resource, context_obj)
	if not value then return "" end
	
	local value_sign = value ~= 0 and abs(value)/value or 1
	value = abs(value)
	local value_frac = MulDivRound(value, 10, rs) % 10
	local value_int = MulDivRound(value, 10, rs)/10
	
	if not context_obj then
		-- three arguments or less
		if resource then
			-- value, resource, context_object, nil
			context_obj = resource
			resource = max
		else	
			if type(max) == "string" then
				-- value, resource, nil, nil
				resource = max
			else
				-- value, context_object, nil, nil
				context_obj = max
			end
		end
		max = false
	end
	
	local force_integer = resource == "Colonist" or resource == "Drone" or resource == "Research"
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
FormatResourceIcon = FormatResourceValueMaxResource

function FormatInt(value, precision)
	if value < 1000 then
		return Untranslated(value)
	end
	
	if value<1000000 then
		local dev = 1000
		if not precision or precision == 0 then
			return T{4847, "<value>k", value = value / dev}
		elseif precision == 1 then
			return T{4848, "<value>.<rem>k", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			return T{4849, "<value>.<rem>K", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end	
	elseif value<1000000000 then
		local dev = 1000000
		if not precision or precision == 0 then
			return T{4850, "<value>M", value = value / dev}
		elseif precision == 1 then
			return T{4851, "<value>.<rem>M", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			return T{4851, "<value>.<rem>M", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end		
	else
		local dev = 1000000000
		if not precision or precision == 0 then
			return T{4852, "<value>G", value = value / dev}
		elseif precision == 1 then
			return T{4853, "<value>.<rem>G", value = value / dev, rem = (value%dev)/(dev/10)}
		elseif precision == 2 then
			local rem = (value%dev)/(dev/100)
			return T{4853, "<value>.<rem>G", value = value / dev, rem = rem>0 and rem or Untranslated("00")}
		else
			assert(false, "FormatInt: precision not supported")
		end		
	end
	
end

function FormatSignInt(value, precision)
	local txt = FormatInt(abs(value), precision)
	if txt and value > 0 then
		txt = Untranslated('+') .. txt
	end
	return txt
end

function FormatScale(value, scale)
	return value/scale
end

function FormatIndex(index, context_obj)
	return T{4854, "#<index>", index = index, context_obj}
end

local function FormatResourceFn(format_id,resource)
 TFormat[format_id] = 
	function(value, max, context_obj) 
		if context_obj then
			return FormatResourceValueMaxResource(value, max, resource, context_obj) 
		else
			return FormatResourceValueMaxResource(value, resource, max) 			
		end
	end
end

TFormat.FormatPercent =  function(...)
	assert(false, "Obsolete format function. Use 'percent' function instead.")
	return FormatPercent(...)
end	
TFormat.FormatResource = function(...)
	assert(false, "Obsolete format function. Use specific resource function instead.")
	return FormatResourceValueMaxResource(...)
end	
TFormat.FormatResourceIcon = 
 function(...)
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

TFormat.FormatDuration = FormatDuration
TFormat.percent = FormatPercent
TFormat.resource = function(param1,...)
	if type(param1)=="string" then
		return FormatResourceName(param1)
	else
		return FormatResourceValueMaxResource(param1,...)
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

function ChangeFormat()
	local files = io.listfiles("Lua/", "*.lua", "recursive") 
	for _, fn in pairs(files) do
		local f, err = io.open(fn,"r")
		if f then
			
			io.close(f)
		end
	end
end

	
TFormat.FormatIndex = FormatIndex
--TFormat.FormatResourceIconSmall= FormatResourceIconSmallDecimal

--TFormat.FormatResourceDecimal= FormatResourceDecimal
--TFormat.FormatResourceIconDecimal= FormatResourceIconDecimal
--TFormat.FormatResourceIconDecimal= FormatResourceIconDecimal
TFormat.FormatAsFloat = FormatAsFloat
TFormat.FormatInt     = FormatInt
TFormat.FormatSignInt = FormatSignInt
TFormat.FormatScale   = FormatScale
TFormat.Sol = function() return UICity and UICity.day or 0 end
TFormat.ColonistName = function(x) 
	if not x or not IsKindOf(x, "Colonist") then
		printf("Invalid argument supplied to ColonistName(): %s", tostring(x))
		return ""
	end
	return x:GetDisplayName()
end
TFormat.ResearchPoints = function(points, context_obj)
	return T{4856, "<em><points><image UI/Icons/res_experimental_research.tga></em>", points = points}
	--return T{"<points><imagescale 650><image UI/Icons/Research/research_2.tga>", points = points}
end
TFormat.time = function(time, context_obj)
	return FormatDuration((time or 0) / const.HourDuration)
	--return T{"<points><imagescale 650><image UI/Icons/Research/research_2.tga>", points = points}
end
TFormat.TraitName = function(x)
	if not x then return "" end
	local trait = DataInstances.Trait[x]
	if not trait then return "" end
	return trait.display_name
end

TFormat.funding = function(x)
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

function TFormat.sum(sum, prop, obj)
	sum = tonumber(sum) or 0
	assert(prop and prop:sub(1, 1) ~= '"') -- prop includes "" - use single quotes for literal function parameters
	for _, item in ipairs(obj or empty_table) do
		sum = sum + (GetProperty(item, prop) or 0)
	end
	return sum
end

function TFormat.def(value, default)
	return value or default
end

function TFormat.count(value)
	return type(value) == "table" and #value or 0
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

function NotificationPresetsCombo()
	local items = {}
	local templates = DataInstances.OnScreenNotificationPreset or ""
	for i = 1, #templates do
		local template = templates[i]
		items[#items + 1] = template.name
	end
	table.sort(items)
	table.insert(items, 1, "")
	return items
end

function BuildingsCombo()
	local items = {}
	local templates = DataInstances.BuildingTemplate or ""
	for i = 1, #templates do
		local template = templates[i]
		items[#items + 1] = {value = template.name, text = template.display_name}
	end
	TSort(items, "text")
	table.insert(items, 1, "")
	return items
end

function TechCombo()
	local items = {}
	local fields = TechTree
	for i=1,#fields do
		local field = fields[i]
		for j=1,#field do
			local tech = field[j]
			items[#items + 1] = {value = tech.id, text = tech.display_name}
		end
	end
	TSort(items, "text")
	table.insert(items, 1, {value = "", text = ""})
	return items
end

function CropsCombo()
	local items = {}
	local crops = DataInstances.Crop
	for i = 1, #crops do
		local crop = crops[i]
		items[#items + 1] = {value = crop.name, text = crop.DisplayName}
	end
	TSort(items, "text")
	table.insert(items, 1, {value = "", text = ""})
	return items
end

function ResearchFieldsCombo()
	local fields = table.keys(TechFields)
	table.sort(fields)
	return fields
end

function ResearchTechsCombo(object)
	--find field
	local field = TechFields[object.Field]
	if not field then
		return {}
	end
	--gather techs
	local techs = { value = "", text = "" }
	for i=1,#field do
		techs[#techs+1] = { value = field[i].id, text = field[i].display_name }
	end
	return techs
end

function TraitsCombo(category, city, traitsonly)
	local nonerare, rare = GetCompatibleTraits({}, {}, {}, category)
	local traits = {{value = "", text = ""}}
	for i=1,#nonerare do
		local trait = DataInstances.Trait[nonerare[i]]
		local name = trait.name
		if not traitsonly or not const.ColonistSpecialization[name] then
			if not city or IsTraitAvailable(trait, city) then
				traits[#traits+1] = { value = trait.name, text = trait.display_name }
			end
		end
	end
	for i=1,#rare do
		local trait = DataInstances.Trait[rare[i]]
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
	local data_instances = DataInstances.Trait
	local traits = {}
	local city = object and object:HasMember("city") and object.city -- don't filter locked traits if there's no object given
	for _, trait_id in ipairs(TraitsList) do
		if data_instances[trait_id] then
			if not city or IsTraitAvailable(trait_id, city) then
				traits[#traits + 1 ]={value = trait_id, text = data_instances[trait_id].display_name}
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
		local trait = DataInstances.Trait[t.value] 
		return trait and t.value ~= "" and trait.auto and not g_HiddenTraitsDefault[t.value] 
	end)
	
	if add_empty then
		table.insert(traits, 1, {text = T{6761, "None"}, value = ""})
	end
	
	return traits
end

function ModifiablePropsCombo()
	return ModifiablePropsComboItems
end

function DomeSkinsPresetsCombo()
	return table.get_unique(table.map(Presets.DomeSkins.Default, "preset"))
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

function HasFreeWorkplacesAround(dome)
	for _, b in ipairs(dome.labels.Workplaces or empty_table) do
		if not b.destroyed and b.ui_working and b:HasFreeWorkSlots() then
			return true
		end
	end
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

function TFormat.roman(number)
	if number then
		return Untranslated(RomanNumeral(number))
	end
	return ""
end

function TFormat.abs(number)
	if type(number) == "number" then
		return abs(number)
	else
		local n = tonumber(number)
		return n and abs(n) or number
	end
end

function TFormat.cut_if_platform(platform)
	if Platform[platform] then
		return false
	end
	return ""
end

function TFormat.cut_if_not_platform(platform)
	if not Platform[platform] then
		return false
	end
	return ""
end		

function EdgeAnimation(bReverce, ctrl, offsetx, offsety, time)
	local endrect = sizebox(point(ctrl.box:minx() + (offsetx or 0), ctrl.box:miny() + (offsety or 0)), ctrl.box:size())
	if ctrl.box:IsValid() then
		ctrl:AddInterpolation{
			id = "move",
			type = const.intRect,
			duration = time or const.InterfaceAnimDuration,
			startRect = ctrl.box,
			endRect = endrect,
			flags = bReverce and const.intfInverse or nil,
			autoremove = true,
			easing = bReverce and const.Easing.SinOut or const.Easing.SinIn,
		}		
	end
end
