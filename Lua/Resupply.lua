ResupplyPresets = {
	["Start_low"] = { --low funding starting params
		text = T{3675, "Default starting resources"},
		items = {
			{class = "RCRover",       		amount = 1},
			{class = "RCTransport",    		amount = 1},
			{class = "Concrete",       		amount = 10},
			{class = "Metals",        		amount = 10},
			{class = "Polymers",       		amount = 5},
			{class = "Electronics",     		amount = 5},
			{class = "MachineParts",   		amount = 10},
			{class = "OrbitalProbe",    		amount = 2,},
			{class = "DroneHub",				amount = 1,},
			{class = "MoistureVaporator",  	amount = 1,},
		},
	},
	["Start_medium"] = { --medium funding starting params
		text = T{3675, "Default starting resources"},
		items = {
			{class = "RCRover",           	amount = 1},
			{class = "RCTransport",       	amount = 1},
			{class = "Concrete",          	amount = 10},
			{class = "Metals",            	amount = 10},
			{class = "Polymers",          	amount = 10},
			{class = "Electronics",       	amount = 15},
			{class = "MachineParts",      	amount = 10},
			{class = "OrbitalProbe",      	amount = 2,},
			{class = "DroneHub",				amount = 2,},
			{class = "MoistureVaporator",  	amount = 1,},
			{class = "FuelFactory",  			amount = 1,},
		},
	},
	["Start_high"] = { --high funding starting params
		text = T{3675, "Default starting resources"},
		items = {
			{class = "RCRover",           	amount = 1},
			{class = "RCTransport",       	amount = 1},
			{class = "Concrete",          	amount = 10},
			{class = "Metals",            	amount = 10},
			{class = "Polymers",          	amount = 20},
			{class = "Electronics",       	amount = 20},
			{class = "MachineParts",      	amount = 15},
			{class = "OrbitalProbe",      	amount = 2,},
			{class = "DroneHub",				amount = 2,},
			{class = "StirlingGenerator",	amount = 1,},
			{class = "MoistureVaporator",  	amount = 1,},
			{class = "FuelFactory",  			amount = 1,},
		},
	},
	["Rover"] = {
		text = T{3676, "Rover Start"},
		items = {
			{class = "RCRover",    amount = 1},
		},
	},
	["Materials"] = {
		text = T{3677, "Materials"},
		items = {
			{class = "Concrete",   amount = 30},
			{class = "Metals",     amount = 20},
			{class = "Polymers",   amount = 10},
		},
	},
	["Probe"] = {
		text = T{3678, "Probe"},
		items = {
			{ class = "OrbitalProbe", amount = 1, },
		},
	},
}

function GetResupplyPresetsCombo()
	local items = {}
	for id, data in pairs(ResupplyPresets) do
		items[#items+1] = {value = id, text = data.text}
	end
	return items
end

function ApplyResupplyPreset(city, preset)
	if not city then return end
	if not ResupplyPresets[preset] then return end
	local preset_items = ResupplyPresets[preset].items	
	city.queued_resupply = table.copy(preset_items, "deep")
end

function GetResupplyClassesCombo()
	local items = {}
	items[#items+1] = {value = "OrbitalProbe", text = g_Classes.OrbitalProbe.display_name}
	items[#items+1] = {value = "AdvancedOrbitalProbe", text = g_Classes.AdvancedOrbitalProbe.display_name}
	for _,res in ipairs(AllResourcesList) do
		items[#items+1] = {value = res, text = Resources[res].display_name}
	end

	local buildings = BuildingsCombo()
	table.append(items, buildings)
	
	return items
end

DefineClass.SA_ResuppyInventory = {
	__parents = { "SequenceAction" },
	
	properties = {
	},

	Menu = "Gameplay",
	MenuName = "Resupply stuff",
	RestrictToList = "Scenario",
	PropertyTranslation = false,
	MenuSection = "Resupply",
	max_classes = 10,
}

for i=1, SA_ResuppyInventory.max_classes do
	table.insert(SA_ResuppyInventory.properties,{ category = "General", id = "item"..i,   name = "class",  default = "", editor = "dropdownlist",items = GetResupplyClassesCombo,})
	table.insert(SA_ResuppyInventory.properties,{ category = "General", id = "amount"..i, name = "amount", default = 1,  editor = "number" })
end

function SA_ResuppyInventory:Exec(sequence_player, ip, seq, registers)
	local items = {}
	local refreshBM = false
	for i = 1, self.max_classes do
		if self["item"..i] and self["item"..i]~="" then
			local class = self["item"..i]
			local amount = self["amount"..i]
			
			-- place probes directly, add buildings as prefabs
			if IsKindOf(g_Classes[class], "OrbitalProbe") then 
				for j = 1, amount do
					PlaceObject(class, {city = UICity})
				end
			else
				refreshBM = true
				UICity:AddPrefabs(class, amount, false)
			end
		end
	end	
	if refreshBM then
		RefreshXBuildMenu()
	end
end

function SA_ResuppyInventory:ShortDescription()
	local texts = {"Resupply inventory:"}
	for i=1, self.max_classes do
		if self["item"..i] and self["item"..i]~="" then
			texts[#texts + 1] =  string.format("   %s - %d", self["item"..i],self["amount"..i])
		end
	end	
	return table.concat(texts, "\n")
end


DefineClass.SA_ChangeFunding = {
	__parents = { "SequenceAction" },
	
	properties = {
		{category = "General", id = "funding",   name = "Funding",  default = "0", editor = "text"},
		{category = "General", id = "reason",   name = "Reason",  default = "", editor = "combo", items = function() return FundingSourceCombo() end},
	},

	Menu = "Gameplay",
	MenuName = "Change Funding",
	RestrictToList = "Scenario",
	PropertyTranslation = false,
	MenuSection = "Resupply",
	max_classes = 10,
}


function SA_ChangeFunding:Exec(sequence_player, ip, seq, registers)
	local funding = sequence_player:Eval("return " .. self.funding, registers)
	UICity:ChangeFunding(funding, self.reason)
end

function SA_ChangeFunding:ShortDescription()
	return  string.format("Change Funding: %s", tostring(self.funding))
end

DefineClass.OrbitalProbe = {
	__parents = { "BaseBuilding", "Shapeshifter", "PinnableObject" },
	enum_flags = { efWalkable = false, efCollision = false, efApplyToGrids = false },
	properties = {
		{ id = "display_name", default = T{3525, "Orbital Probe"} },
		{ id = "display_icon", default = "UI/Icons/Buildings/orbital_probe.tga" },
		{ id = "description", default = T{10086, "Reveals underground deposits in the scanned area." }},
	},
	entity = "InvisibleObject",
	range = 160*guim,
	duration = 2*const.HourDuration,
	detected_classes = { "SubsurfaceDepositMetals", "SubsurfaceDepositWater" },
	
	show_pin_toggle = false,
	pin_on_start = false,
	pin_rollover = T{3680, "Immediately scans a Sector for deposits and Anomalies.<DeepScanWarning><newline><newline>Available Orbital Probes<right><NumProbes>"},
	pin_rollover_hint = T{3681, "<left_click> Select Sector"},
	pin_rollover_hint_xbox = T{7882, "<PinRolloverGamepadHint>"},
	pin_progress_value = "",
	pin_progress_max = "",
	pin_summary1 = T{3683, "<NumProbes>"},
	scan_pattern = { point(0, 0) },
}

function OrbitalProbe:GetPinRolloverGamepadHint()
	if GetInGameInterfaceMode() ~= "overview" then
		return T{3682, "<ButtonA> Overview"}
	else
		return T{8569, "<ButtonA> Select Sector"}
	end
end

function OrbitalProbe:GameInit()
	local _, fully_scanned = UnexploredSectorsExist()
	if fully_scanned then
		self:Notify("delete")
		return
	end
	
	self.city:AddToLabel("OrbitalProbe", self)
	if not self.city.labels.OrbitalProbe or #self.city.labels.OrbitalProbe == 1 then
		self:TogglePin()
	end
end

function OrbitalProbe:UpdateNotWorkingBuildingsNotification()
end

function OrbitalProbe:Done()
	self.city:RemoveFromLabel("OrbitalProbe", self)
end

function OrbitalProbe:GetNumProbes()
	local city = self and self.city or UICity
	local probes = city and city.labels.OrbitalProbe
	return probes and #probes or 0
end

function OrbitalProbe:GetDeepScanWarning()
	if self.city:IsTechResearched("AdaptedProbes") then
		return ""
	end
	return T{3684, "<newline><em>Deep scanning of the Sector is not possible with the current technology</em>"}
end

function OrbitalProbe:GetAffectedSectors(sector)
	local list = {}
	
	for _, offset in ipairs(self.scan_pattern) do
		local x, y = offset:xy()
		local col = sector.col + x
		local row = sector.row + y
		local s = g_MapSectors[col] and g_MapSectors[col][row]
		if s then
			list[#list + 1] = s
		end
	end
	return list
end

function OrbitalProbe:ScanSector(sector)
	assert(not sector:HasBlockers())
	if g_Tutorial and not g_Tutorial.EnableOrbitalProbes or sector:HasBlockers() then
		return
	end

	local deep = UICity:IsTechResearched("AdaptedProbes")
	
	local list = self:GetAffectedSectors(sector)
	local mode = deep and "deep scanned" or "scanned"
	for _, s in ipairs(list) do
		s:Scan(mode, "probe")
	end
	
	local label = self.city.labels.OrbitalProbe
	DoneObject(label[#label])
	ObjModified(self)
	PlayFX("OrbitalProbeScan", "start", nil, nil, sector.area:Center():SetTerrainZ())
	HintDisable("HintProbes")
end

function OrbitalProbe:CanBeUnpinned()
	local label = self.city.labels.OrbitalProbe
	return not label or not next(label)
end

function OrbitalProbe:OnPinClicked(gamepad)
	local dlg = GetInGameInterface()
	assert(dlg)
	if not CameraTransitionThread and dlg.mode ~= "overview" then
		dlg:SetMode("overview")
	end
	assert(dlg.mode == "overview" and dlg.mode_dialog:IsKindOf("OverviewModeDialog"))
	
	--gamepad doesn't go into this state (fix:0129799)
	if not gamepad then
		dlg.mode_dialog:SetScan(true)
	end
	
	--if a pin is selected (it must be this object) -> deselect it (fix:0129807)
	local focus = terminal.desktop:GetKeyboardFocus()
	if focus and IsKindOf(focus.parent, "PinsDlg") then
		GetDialog("PinsDlg"):SetFocus(false, true)
	end
	
	if HintsEnabled then
		HintTrigger("HintProbes")
	end
	
	return true
end

function OrbitalProbe:GetDisplayName()
	return self.display_name
end

DefineClass.AdvancedOrbitalProbe = {
	__parents = { "OrbitalProbe" },

	pin_rollover = T{11413, "Immediately scans a Sector and the four adjacent Sectors for deposits and anomalies.<DeepScanWarning><newline><newline>Available Orbital Probes<right><NumProbes>"},

	properties = {
		{ id = "display_name", default = T{10087, "Advanced Orbital Probe"} },
		{ id = "display_icon", default = "UI/Icons/Buildings/orbital_probe.tga" },
	},
	scan_pattern = {
		point(0, 0),
		point(-1, 0),
		point(1, 0),
		point(0, 1),
		point(0, -1),
	},
}