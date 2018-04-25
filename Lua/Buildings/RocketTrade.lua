DefineClass.TradeRocket = {
	__parents = { "SupplyRocket" },

	export_goods = false, -- { resource, amount } pairs
	pin_rollover = T{10, "<Description>"},
	pin_rollover_arriving = T{8031, "<RocketType><newline>Travelling to Mars.<newline>Flight progress: <em><ArrivalTimePercent></em>%.<newline>Cargo Requested:<newline><CargoRequested>"},
	pin_rollover_in_orbit = T{8032, "Ready to land.<newline>Cargo Requested:<newline><CargoRequested>"},

	fx_actor_base_class = "FXRocket",
	fx_actor_class = "SupplyRocket",
	show_service_area = false,
	
	rocket_palette = "RocketTrade",
	show_logo = false,
	rename_allowed = false,
	can_fly_colonists = false,
}

function TradeRocket:GameInit()
	self.fx_actor_class = "SupplyRocket"
end

function TradeRocket:CreateExportRequests()
	self.export_requests = {}
	assert(self.export_goods)
	for _, req in ipairs(self.export_goods) do
		local unit_count = 3 + (req.amount / (const.ResourceScale * 5)) --1 per 5 + 3
		self.export_requests[#self.export_requests + 1] = self:AddDemandRequest(req.resource, req.amount, 0, unit_count)
	end
end

function TradeRocket:CanHaveMoreDrones()
	return false --trade rockets cant have drones
end

function TradeRocket:GetSelectionRadiusScale()
	return 0 --trade rockets cant have radius gizmo
end

function TradeRocket:CanDemolish()
	return false
end

function TradeRocket:GetRocketType()
	return RocketTypeNames.Trade
end

function TradeRocket:UpdateStatus(status)
	if status ~= "on earth" then
		SupplyRocket.UpdateStatus(self, status)
	end
end

function TradeRocket:FlyToEarth()
	DoneObject(self)
end

function TradeRocket:OnModifiableValueChanged(prop, ...)
	if prop ~= "max_export_storage" then -- filter out changes to export storage for trade rockets
		SupplyRocket.OnModifiableValueChanged(self, prop, ...)
	end
end

function TradeRocket:ResetDemandRequests()
	self.refuel_request:ResetAmount(self.launch_fuel)
end

function TradeRocket:ToggleAllowExport()
	return -- nope
end

function TradeRocket:GetStoredExportResourceAmount()
	return 0
end

function TradeRocket:IsLaunchAutomated()
	return true
end

function TradeRocket:GetCargoRequested()
	assert(self.export_goods)

	local resources = {}
	for _, req in ipairs(self.export_goods) do
		resources[#resources + 1] = T{722, "<resource(amount,res)>", amount = req.amount, res = req.resource}
	end
	
	return table.concat(resources, " ")
end

function TradeRocket:GetUIExportStatus()
	local text = T{7883, --[[Post-Cert]] "Gathering exports<right>"}
		
	for i = 1, #self.export_goods do
		local req = self.export_goods[i]
		local stored = req.amount - self.export_requests[i]:GetActualAmount()
		text = text .. FormatResourceValueMaxResource(stored, req.amount, req.resource, empty_table)
		if i < #self.export_goods then
			text = text .. "<newline>"
		end
	end
	return text
end

function TradeRocket:LeaveForever()
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