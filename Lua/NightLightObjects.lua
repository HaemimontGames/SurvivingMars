-- define class
-- overall structure, message, update
-- attach: parse autoattach-like annotations
-- execute parsed autoattach structures
-- enum with sort

if FirstLoad then
	MaxNightLightObjectAttachLights = 3000
	NightLightObjectsTotalDelay = const.HourDuration/4
	NightLightSpecs = {}
	NightLightEmissiveEntites = {}
end

NightLightColors = {
	warm = RGB(250, 230, 180),
	neutral = RGB(255, 255, 255),
	cool = RGB(180, 230, 250),
	orange = RGB(255, 155, 65),
	red = RGB(255, 60, 60),
}

GlobalVar("NightLightsState", false)

function InitNightLightState()
	NightLightsState = next(CurrentLightmodel) and CurrentLightmodel[1].night or false
end

NightLightColorNames = { }
for color,_ in pairs(NightLightColors) do
	NightLightColorNames[#NightLightColorNames + 1] = color
end

DefineClass.NightLightLight = {
	__parents = { "CObject" },
	
	properties = {
		{
			template = true, category = "Night Light", name = T{3023, "Predefined Color"}, id = "predefined_color",
			editor = "combo", items = NightLightColorNames, default = "warm",
			buttons = {{"Assign", "AssignPredefinedColor"}},
		},
		{
			template = true, category = "Night Light", name = T{3024, "Exported string"}, id = "",
			editor = "text", default = "",
			buttons = {{"Export", "ExportNightLight"}},
		},
	},
	
	specifications = false,
}

function NightLightLight:SetNightLightColor(name)
	self:SetColor(NightLightColors[self.predefined_color])
end

function NightLightLight:GetNightLightColor()
	return self.predefined_color
end

function NightLightLight:GetIntensity()
	return self:GetIntensity1()
end

function NightLightLight:GetColor()
	return self:GetColor1()
end

DefineClass.NightLightPointLight = {
	--game_flags = { gofRealTimeAnim = false },
	__parents = { "PointLight", "NightLightLight" },
}

NightLightPointLight.GetIntensity = NightLightLight.GetIntensity
NightLightPointLight.GetColor = NightLightLight.GetColor

DefineClass.NightLightSpotLight = {
	--game_flags = { gofRealTimeAnim = false },
	__parents = { "SpotLight", "NightLightLight" },
}

NightLightSpotLight.GetIntensity = NightLightLight.GetIntensity
NightLightSpotLight.GetColor = NightLightLight.GetColor

DefineClass.NightLightObject = {
	game_flags = { gofNightLightsEnabled = true },
	__parents = { "CObject" },
}

function NightLightObject:IsNightLightPossible()
	return NightLightsState and self:GetGameFlags(const.gofNightLightsEnabled) ~= 0
end

function NightLightObject:SetIsNightLightPossible(val, all_lights)
	if val then
		self:SetHierarchyGameFlags(const.gofNightLightsEnabled)
		self:NightLightEnable(all_lights)
	else
		self:ClearHierarchyGameFlags(const.gofNightLightsEnabled)
		self:NightLightDisable(all_lights)
	end
end

local NightLightDefaultSpecifications = {
	color = "neutral",
	radius = 0,
	src_radius = 0,
	cut_off = 1200,
	intensity = 100,
	angle = 90,
	inner_angle = 72,
	emissive = false,
	important = false,
	simult = false,
	emissive_intensity = 200,
}

function NightLightObject:NightLightOnEmissive(att)
	self:SetSIModulation(MulDivRound(att.intensity or NightLightDefaultSpecifications.emissive_intensity, 255, 200))
end

function NightLightObject:NightLightOffEmissive(att)
	self:SetSIModulation(0)
end

function NightLightObject:NightLightOnAttaches(att)
	local default_specifications = NightLightDefaultSpecifications
	local cl = att.class
	local light = PlaceObject(cl)
	
	light:SetSourceRadius(att.src_radius or default_specifications.src_radius)
	light:SetAttenuationRadius(att.radius or default_specifications.radius)
	light:SetCutOff(att.cut_off or default_specifications.cut_off)
	if light:IsKindOf("SpotLight") then
		light:SetConeOuterAngle(att.angle or default_specifications.angle)
		light:SetConeInnerAngle(att.inner_angle or default_specifications.inner_angle)
	end
	
	light:SetColor(0)
	light:SetIntensity(0)
	
	self:Attach(light, att.spot)
	light:Fade(att.color, att.intensity or default_specifications.intensity, 300)
	
	light.specifications = att
	light.Important = (not self:IsKindOf("ConstructionSite")) and (att.important or default_specifications.important)
end

function NightLightObject:NightLightOffAttaches(spec)
	self:DestroyAttaches("NightLightLight")
end

function NightLightObject:NightLightEnable(all_lights)
	if all_lights then
		self:ForEachAttach(function(attach)
			if attach:GetGameFlags(const.gofUIAttach) == 0 then
				if attach:IsKindOf("NightLightObject") then
					attach:NightLightEnable(true)
				elseif not attach:IsKindOfClasses("GridTile", "GridTileWater") then
					attach:SetSIModulation(NightLightDefaultSpecifications.intensity) --those should light up during the day as well
				end
			end
		end)
	else
		self:ForEachAttach("NightLightObject", NightLightObject.NightLightEnable)
	end

	--Don't turn on if not night
	if not self:IsNightLightPossible() then return false end

	--Fetch night light specs for this entity
	local specs = NightLightSpecs[self:GetEntity()]
	
	--Turn on
	for i=1,#(specs or "") do
		local att = specs[i]
		if att.emissive then
			self:NightLightOnEmissive(att)
		elseif att.class then
			self:NightLightOnAttaches(att)
		end
	end
end

function NightLightObject:NightLightDisable(all_lights)
	self:NightLightOffAttaches()
	self:NightLightOffEmissive()
	if all_lights then
		self:ForEachAttach(function(attach)
			if attach:GetGameFlags(const.gofUIAttach) == 0 then
				if attach:IsKindOf("NightLightObject") then
					attach:NightLightDisable(true)
				elseif not attach:IsKindOfClasses("GridTile", "GridTileWater") then
					attach:SetSIModulation(0)
				end
			end
		end)
	else
		self:ForEachAttach("NightLightObject", NightLightObject.NightLightDisable)
	end
end

function OnMsg.LightmodelChange(view, lm, time, prev_lm)
	if not prev_lm.night and lm.night then
		NightLightsOn(time == 0 and time or NightLightObjectsTotalDelay)
	elseif prev_lm.night and not lm.night then
		NightLightsOff(time == 0 and time or NightLightObjectsTotalDelay)
	end
end

-- to have this stable-shuffled (e.g. to preserve which lights are on across EXE runs, e.g. 
-- different movie shooting sessions, or when the user changes options):
-- after GetObjects gathers the objects, sort them by hash(seed+handle) 
-- not doing this unless necessary - it will be quite a bit slower

-- reimplement this in C if you ever see it in a profiler

function GetNightLightObjectsAttaches()
	local nlobjs = GetObjects{ class="NightLightObject", game_flags_all = const.gofNightLightsEnabled }
	local nlattaches = {}
	local n = 1
	for i=1,#nlobjs do
		local obj = nlobjs[i]
		local spec = NightLightSpecs[obj:GetEntity()]
		if spec then
			for j=1,#spec do
				nlattaches[n] = obj
				nlattaches[n+1] = spec[j]
				n = n + 2
			end
		end
	end
	
	if #nlattaches > 0 then
		local seed = UICity.day or 0
		
		-- Fisher-Yates shuffle of pairs
		local rand
		for i=#nlattaches/2, 1, -1 do
			rand, seed = BraidRandom(seed)
			local a = i*2-1
			local b = (seed % i)*2+1
			nlattaches[a], nlattaches[b] = nlattaches[b], nlattaches[a]
			a = a+1
			b = b+1
			nlattaches[a], nlattaches[b] = nlattaches[b], nlattaches[a]
		end
	end
	
	return nlattaches
end

local function CreateNightLightThread(delay, ...)
	return delay == 0 and CreateRealTimeThread(...) or CreateGameTimeThread(...)
end

function NightLightsOn(total_delay)
	NightLightsState = true
	local nlattaches = GetNightLightObjectsAttaches()
	local num_randomized = 0

	-- note: the limit might be split better between simult and randomized optionals,
	-- right now the simults have precedence
	local remaining = MaxNightLightObjectAttachLights
	
	-- first pass: turn on all simult important, all simult emissive, count the others
	for i=1,#nlattaches,2 do
		local att = nlattaches[i+1]
		if att.simult then
			local obj = nlattaches[i]
			if obj:IsNightLightPossible() then
				if att.emissive then
					obj:NightLightOnEmissive(att)
				elseif att.class and att.important then
					obj:NightLightOnAttaches(att)
					remaining = remaining - 1
				end
			end
		else
			num_randomized = num_randomized + 1
		end
	end

	-- second pass: turn on up to remaining simult optional
	if remaining > 0 then
		for i=1,#nlattaches,2 do
			local att = nlattaches[i+1]
			if att.class and att.simult and not att.important and nlattaches[i]:IsNightLightPossible() then
				nlattaches[i]:NightLightOnAttaches(att)
				remaining = remaining - 1
			end
			if remaining == 0 then break end
		end
	end

	-- third pass: turn on up to 'remaining' optional randomized, and all important randomized
	if remaining <= 0 or num_randomized == 0 then return end

	CreateNightLightThread(total_delay, function(nlattaches, remaining, total_delay)
		for i=1,#nlattaches,2 do
			local att = nlattaches[i+1]
			if not att.simult then
				local obj = nlattaches[i]
				if IsValid(obj) and obj:IsNightLightPossible() then
					if att.emissive then
						obj:NightLightOnEmissive(att)
					elseif att.class then
						if att.important or remaining > 0 then
							obj:NightLightOnAttaches(att)
							remaining = remaining - 1
						end
					end
				end
				Sleep( (i+1)*total_delay/num_randomized - i*total_delay/num_randomized )
			end
		end
	end, nlattaches, remaining, total_delay or NightLightObjectsTotalDelay)
end

function NightLightsOff(total_delay)
	NightLightsState = false
	local nlattaches = GetNightLightObjectsAttaches()
	local num_randomized = 0
	for i=1,#nlattaches,2 do
		local att = nlattaches[i+1]
		if att.simult then
			local obj = nlattaches[i]
			if att.emissive then
				obj:NightLightOffEmissive(att)
			elseif att.class then
				obj:NightLightOffAttaches(att)
			end
		else
			num_randomized = num_randomized + 1
		end
	end

	if num_randomized == 0 then return end

	CreateNightLightThread(total_delay, function(nlattaches, total_delay)
		for i=1,#nlattaches,2 do
			local att = nlattaches[i+1]
			if not att.simult then
				local obj = nlattaches[i]
				if IsValid(obj) then
					if att.emissive then
						obj:NightLightOffEmissive(att)
					elseif att.class then
						obj:NightLightOffAttaches(att)
					end
				end
				Sleep( (i+1)*total_delay/num_randomized - i*total_delay/num_randomized )
			end
		end
	end, nlattaches, total_delay or NightLightObjectsTotalDelay)
end

function ProcessNightLightSpot(entity, spotidx, ann)
	local ann = ann or GetSpotAnnotation(entity, spotidx)
	if not ann or ann == "" then return end
	
	local attach = { class = "NightLightPointLight", spot = spotidx }
	
	--Parse light type
	local spot = string.find(ann, "spot", 1, true) or string.find(ann, "sp", 1, true)
	if spot then
		attach.class = "NightLightSpotLight"
		
		--Parse cone radiuses separately
		local angle = string.match(ann, "outer%:(%d+)")
		if angle and tonumber(angle) then
			attach.angle = tonumber(angle)
		end
		local inner_angle = string.match(ann, "inner%:(%d+)")
		if inner_angle and tonumber(inner_angle) then
			attach.inner_angle = tonumber(inner_angle)
		end
		
		--Try parse cone radiuses in short format
		if not inner_angle and not angle then
			angle, inner_angle = string.match(ann, "angle%:(%d+)/(%d+)")
			angle = angle and tonumber(angle)
			inner_angle = inner_angle and tonumber(inner_angle)
			if angle and inner_angle then
				attach.angle = angle
				attach.inner_angle = inner_angle
			end
		end
		
		--Make sure there are some default values for the spot light angles
		attach.angle = attach.angle or 90
		attach.inner_angle = attach.inner_angle or MulDivRound(attach.angle, 8, 10)
		
		attach.inner_angle = Min(attach.angle-1, attach.inner_angle)
	end
	
	--Prase color
	local color = string.match(ann, "color%:(%w+)")
	if color then
		if NightLightColors[color] then
			attach.color = NightLightColors[color]
		else
			printf("Invalid color '%s' specified spot in for entity %s, check valid colors in NightLightColors", color, entity)
		end
	else --Try parse color name without the 'color:' prefix
		for name,rgb in pairs(NightLightColors) do
			local found = string.find(ann, name, 1, true)
			if found then
				attach.color = NightLightColors[name]
				break
			end
		end
	end
	
	--Prase radius (attenuation length)
	local radius = string.match(ann, "radius%:(%d+)") or string.match(ann, "rad%:(%d+)")
	if radius and tonumber(radius) then
		attach.radius = tonumber(radius)*guim
	end
	
	--Parse source radius
	local src_radius = string.match(ann, "src_radius%:(%d+)") or string.match(ann, "srad%:(%d+)")
	if src_radius and tonumber(src_radius) then
		attach.src_radius = tonumber(src_radius)*guic
	end
	
	--Prase cut off
	local cut_off = string.match(ann, "cut_off%:(%d+)") or string.match(ann, "cut%:(%d+)")
	if cut_off and tonumber(cut_off) then
		attach.cut_off = tonumber(cut_off)
	end
	
	--Prase intensity
	local intensity = string.match(ann, "intensity%:(%d+)") or string.match(ann, "int%:(%d+)")
	if intensity and tonumber(intensity) then
		attach.intensity = tonumber(intensity)
	end
	
	--Parse emissive lights
	if string.find(ann, "emissive", 1, true) then
		attach.emissive = true
		attach.class = nil
	end
	if attach.emissive then
		NightLightEmissiveEntites[entity] = true
	end
	
	--Parse important lights
	if string.find(ann, "important", 1, true) or string.find(ann, "imp", 1, true) then
		attach.important = true
	end
	
	--Parse simultaneous lights
	if string.find(ann, "simult", 1, true) or string.find(ann, "sim", 1, true) then
		attach.simult = true
	end
	
	if (attach.radius and attach.radius > 0) or attach.emissive then
		return attach
	end
end

function RebuildNightLightSpecs()
	NightLightSpecs = {}
	for entity,_ in pairs(GetAllEntities()) do	
		local spec = { }
		
		--Prase both light spot names
		local first, last = GetSpotRange(entity, EntityStates["idle"], "Autolight")
		for spot=first,last do
			spec[#spec + 1] = ProcessNightLightSpot(entity, spot)
		end
		local first, last = GetSpotRange(entity, EntityStates["idle"], "L")
		for spot=first,last do
			spec[#spec + 1] = ProcessNightLightSpot(entity, spot)
		end
		
		if next(spec) then
			NightLightSpecs[entity] = spec
		end
	end
end

function ExportNightLight(editor, light)
	local default_specifications = NightLightDefaultSpecifications
	local specs = light.specifications or { }
	local properties = { }
	
	local function should_append(value, specs_property)
		if not specs_property then
			return specs[value]
		else
			return specs[specs_property] ~= nil or value ~= default_specifications[specs_property]
		end
	end

	local function append_property(value, property_name)
		properties[#properties + 1] = property_name and (property_name..":"..tostring(value)) or tostring(value)
	end
	
	local function try_append_property(value, specs_property, display_name)
		if not should_append(value, specs_property) then return end
		append_property(value, display_name or specs_property)
	end
	
	
	try_append_property(light.predefined_color, "color")
	if should_append(light:GetAttenuationRadius(), "radius") then
		append_property(light:GetAttenuationRadius() / guim, "radius")
	end
	try_append_property(light:GetSourceRadius(), "src_radius")
	try_append_property(light:GetCutOff(), "cut_off")
	try_append_property(light:GetIntensity(), "intensity")
	if IsKindOf(light, "NightLightSpotLight") then
		append_property("spot")
		try_append_property(light:GetConeOuterAngle(), "angle", "outer")
		try_append_property(light:GetConeInnerAngle(), "inner_angle", "inner")
	end
	try_append_property("important")
	try_append_property("emissive")
	try_append_property("simult")
	
	
	CopyToClipboard("("..table.concat(properties, ",")..")")
end

function AssignPredefinedColor(editor, light)
	light:SetNightLightColor(light.predefined_color)
end

OnMsg.EntitiesLoaded = RebuildNightLightSpecs
