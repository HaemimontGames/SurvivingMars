DefaultCM = ColorizationMaterialEncode(RGB(128,128,128), 0, 0)

GlobalVar("g_CurrentCCS", function() return ColonyColorSchemes.default end)
GlobalVar("g_OverrideCCS", false)

function GetCurrentColonyColorScheme()
	return g_OverrideCCS or g_CurrentCCS or ColonyColorSchemes.default
end

function OverrideColonyColorScheme(id)
	g_OverrideCCS = ColonyColorSchemes[id] or false
	ReapplyPalettes()
end

function OnMsg.NewMapLoaded()
	g_CurrentCCS = ColonyColorSchemes[GetMissionSponsor().colony_color_scheme or "default"]
	ReapplyPalettes()
end

function SavegameFixups.ColonyColorScheme()
	g_CurrentCCS = ColonyColorSchemes.default
	ReapplyPalettes()
end

function GetBuildingColors(ccs, building)
	return ccs[building.palette_color1], ccs[building.palette_color2], ccs[building.palette_color3], ccs[building.palette_color4]
end

if FirstLoad then
	old_rocket_palettes = {}
end

function OnMsg.DlcsLoaded()
	old_rocket_palettes.ArcPod = rawget(_G, "ArkPod") and ArkPod:HasMember("rocket_palette") and ArkPod.rocket_palette
	old_rocket_palettes.DragonRocket = rawget(_G, "DragonRocket") and DragonRocket:HasMember("rocket_palette") and DragonRocket.rocket_palette
	old_rocket_palettes.DropPod = rawget(_G, "DropPod") and DropPod:HasMember("rocket_palette") and DropPod.rocket_palette
	old_rocket_palettes.RocketStandard = rawget(_G, "SupplyRocket") and SupplyRocket:HasMember("rocket_palette") and SupplyRocket.rocket_palette
	old_rocket_palettes.RocketTrade = rawget(_G, "TradeRocket") and TradeRocket:HasMember("rocket_palette") and TradeRocket.rocket_palette
	old_rocket_palettes.SupplyPod = rawget(_G, "SupplyPod") and SupplyPod:HasMember("rocket_palette") and SupplyPod.rocket_palette
	old_rocket_palettes.ZeusRocket = rawget(_G, "ZeusRocket") and ZeusRocket:HasMember("rocket_palette") and ZeusRocket.rocket_palette
end

function DecodePalette(palette, ccs)
	if type(palette) == "table" then
		assert(#palette == 4)
		if type(palette[1]) == "number" then
			return palette[1], palette[2], palette[3], palette[4]
		elseif type(palette[1]) == "string" then
			ccs = ccs or GetCurrentColonyColorScheme()
			return ccs[palette[1]], ccs[palette[2]], ccs[palette[3]], ccs[palette[4]]
		end
	elseif type(palette) == "string" and old_rocket_palettes[palette] then
		return DecodePalette(old_rocket_palettes[palette], ccs)
	elseif not palette then
		return DefaultCM, DefaultCM, DefaultCM, DefaultCM
	end
	assert(false)
	return DefaultCM, DefaultCM, DefaultCM, DefaultCM
end

function GetCablesPalette()
	local ccs = GetCurrentColonyColorScheme()
	return ccs.pipes_metal, ccs.pipes_metal, ccs.cables_base, ccs.cables_base
end

function GetPipesPalette()
	local ccs = GetCurrentColonyColorScheme()
	return ccs.pipes_metal, ccs.pipes_base, ccs.pipes_metal, ccs.pipes_base
end

function ColonyColorSchemeColorNames()
	local names = {}
	for k, v in ipairs(PresetDefs.ColonyColorScheme) do
		if v:HasMember("editor") and v.editor == "material" then 
			names[#names+1] = v.id
		end
	end
	return names
end

function cmstring(cm)
	local rgb, ro, me = ColorizationMaterialDecode(cm)
	local r, g, b = GetRGB(rgb)
	return string.format("RGB %d %d %d; Rgh %d; Mtl %d", r, g, b, ro, me)
end

function ReapplyPalettes()
	local ccs = GetCurrentColonyColorScheme()
	MapForEach("map", "BaseRover", "CargoShuttle" , SetPaletteFromClassMember)
	MapForEach("map", "Building", function(obj)
		if not obj:IsKindOfClasses("ElectricityGridElement", "LifeSupportGridElement", "ConstructionSite", "SupplyRocket") then
			local skin, palette = obj:GetCurrentSkin()
			obj:SetPalette(DecodePalette(palette, ccs))
		end
	end)
	MapForEach(true, "SupplyRocket", function(obj)
		if not obj:IsKindOfClasses("ForeignTradeRocket", "ForeignAidRocket", "TradeRocket", "RefugeeRocket") then
			obj:SetPalette(DecodePalette(obj:GetRocketPalette(ccs), ccs))
		end
	end)
	local ccm1, ccm2, ccm3, ccm4 = GetCablesPalette()
	MapForEach("map", "ElectricityGridElement", SetObjectPaletteRecursive, ccm1, ccm2, ccm3, ccm4)
	local pcm1, pcm2, pcm3, pcm4 = GetPipesPalette()
	MapForEach("map", "LifeSupportGridElement", SetObjectPaletteRecursive, pcm1, pcm2, pcm3, pcm4)
end