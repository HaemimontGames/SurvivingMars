DefineClass.ForeignAidRocket = {
	__parents = { "SupplyRocket" },

	pin_rollover = T{10, "<Description>"},
	fx_actor_base_class = "FXRocket",
	fx_actor_class = "SupplyRocket",
	show_service_area = false,
	allow_export = false,
	owned = false,
	
	launch_fuel = 0,

	rename_allowed = false,
	can_fly_colonists = false,
	sponsor_id = false,
	logo_id = false,
}

function ForeignAidRocket:GameInit()
	self.fx_actor_class = "SupplyRocket"
	local rocket_class = GetMissionSponsor(self.sponsor_id).rocket_class or "SupplyRocket"
	local template = BuildingTemplates[rocket_class]
	self:ChangeEntity(template.entity)
	self:DestroyAttaches()
	AutoAttachObjectsToShapeshifter(self)
	self.rocket_palette = g_Classes[rocket_class].rocket_palette
	self:SetPalette(DecodePalette(self.rocket_palette))
	self.display_icon = template.display_icon
	local logo = self:GetAttach("Logo")
	if logo then
		local logos = Presets.MissionLogoPreset.Default
		local data = logos[self.logo_id]
		if data then
			logo:ChangeEntity(data.entity_name)
		end
	end
end

function ForeignAidRocket:CanHaveMoreDrones()
	return false --foreign aid rockets cant have drones
end

function ForeignAidRocket:GetSelectionRadiusScale()
	return 0 --foreign aid rockets cant have radius gizmo
end

function ForeignAidRocket:CanDemolish()
	return false
end

function ForeignAidRocket:GetRocketType()
	return RocketTypeNames.ForeignAid
end

function ForeignAidRocket:FlyToEarth()
	DoneObject(self)
end

function ForeignAidRocket:UpdateStatus(status)
	if status ~= "on earth" then
		SupplyRocket.UpdateStatus(self, status)
	end
end

function ForeignAidRocket:ToggleAllowExport()
	return -- nope
end

function ForeignAidRocket:GetStoredExportResourceAmount()
	return 0
end

function ForeignAidRocket:IsLaunchAutomated()
	return true
end

function ForeignAidRocket:GetUIExportStatus()
	return
end

function ForeignAidRocket:LeaveForever()
	if self.command == "OnEarth" or self.command == "FlyToMars" or self.command == "WaitInOrbit" then
		self:Notify("delete")
		return
	end
	self.launch_after_unload = true
	if self.command == "Refuel" or self.command == "WaitLaunchOrder" then
		self:SetCommand("Countdown")
		RebuildInfopanel(self)
	end
end

function ForeignAidRocket:GetSponsorName()
	return GetMissionSponsor(self.sponsor_id).display_name
end