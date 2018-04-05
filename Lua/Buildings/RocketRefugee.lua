DefineClass.RefugeeRocket = {
	__parents = { "SupplyRocket" },

	pin_rollover = T{10, "<Description>"},
	fx_actor_base_class = "FXRocket",
	fx_actor_class = "SupplyRocket",
	show_service_area = false,
	allow_export = false,
	
	custom_travel_time_earth = 0, -- done after launch
	launch_fuel = 0,
	launch_after_unload = true,

	rocket_palette = "RocketTrade",
	show_logo = false,
	rename_allowed = false,
	can_fly_colonists = false,
}

GlobalVar("g_RefugeeOutcome", {})

function RefugeeRocket:GameInit()
	self.fx_actor_class = "SupplyRocket"
	g_RefugeeOutcome[self.custom_id] = nil
end

function RefugeeRocket:CanHaveMoreDrones()
	return false --refugee rockets cant have drones
end

function RefugeeRocket:GetSelectionRadiusScale()
	return 0 --refugee rockets cant have radius gizmo
end

function RefugeeRocket:CanDemolish()
	return false
end

function RefugeeRocket:GetRocketType()
	return RocketTypeNames.Refugee
end

function RefugeeRocket:FlyToEarth()
	DoneObject(self)
end

function RefugeeRocket:ToggleAllowExport()
	return -- nope
end

function RefugeeRocket:GetStoredExportResourceAmount()
	return 0
end

function RefugeeRocket:IsLaunchAutomated()
	return true
end

function RefugeeRocket:GetUIExportStatus()
	return
end

function RefugeeRocket:Unload(...)
	g_RefugeeOutcome[self.custom_id] = "success"
	SupplyRocket.Unload(self, ...)
end

function RefugeeRocket:OnPassengersLost()
	g_RefugeeOutcome[self.custom_id] = "timeout"
	self:Notify("delete")
end

function RefugeeRocket:LeaveForever()
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