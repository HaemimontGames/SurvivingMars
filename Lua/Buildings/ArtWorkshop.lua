GlobalVar("g_BoostWorkersInWorkshopsCount", 0)

DefineClass.Workshop = {
	__parents = { "ElectricityConsumer", "Workplace" },
	flags = { efWalkable = true },
}

function Workshop:UpdateWorkerMorale(worker)
	local prev_fulfill = worker.fulfill_workshift_boost
	local new_fulfill = self.working
	worker.fulfill_workshift_boost = self.working
	local add = 0
	if prev_fulfill and not new_fulfill then add = -1 end
	if not prev_fulfill and new_fulfill then add =  1 end
	g_BoostWorkersInWorkshopsCount = (g_BoostWorkersInWorkshopsCount or 0)+ add
	worker:UpdateMorale()
end

function Workshop:OnChangeWorkshift(old, new)
	local working = self.working
	if old then
		self:Consume_Workshop(old, new)
		local workers = self.workers[old]
		local comfort_boost = Min(MulDivRound(g_Consts.WorkInWorkshopComfortBoost, self.performance, 100), 100*const.Scale.Stat)
		for _, worker in ipairs(workers) do
			if working then
				worker:ChangeComfort(comfort_boost, "work in workshop")
			end
			self:UpdateWorkerMorale(worker)
		end
	end
	Workplace.OnChangeWorkshift(self, old, new)
end

function Workshop:GetWorkersConsumption(shift)
	local workers = self.workers[shift or self.current_shift] or empty_table
	local workers_percent = MulDivRound(#workers, 100, self.max_workers)
	return  MulDivRound(workers_percent,self.consumption_amount, 100)
end

function Workshop:CanConsume(shift)
	return HasConsumption.CanConsume(self) and self:GetWorkersConsumption(shift)<= self.consumption_stored_resources
end

function Workshop:Consume_Workshop(shift, new_shift)
	if self:DoesHaveConsumption() and self.consumption_type == g_ConsumptionType.Workshop then
		local amount_to_consume = self:GetWorkersConsumption(shift)
		if self.consumption_stored_resources>= amount_to_consume then
			self.consumption_stored_resources = self.consumption_stored_resources - amount_to_consume
			assert(self.consumption_stored_resources >= 0 and self.consumption_stored_resources <= self.consumption_max_storage)
			self.consumption_resource_request:AddAmount(amount_to_consume)
			self.city:OnConsumptionResourceConsumed(self.consumption_resource_type, amount_to_consume)
			self:UpdateVisualStockpile()
			self:UpdateRequestConnectivity()
		else
			--self:SetWorking(false) --we ran out of resources.
		end
		if not self:CanConsume(new_shift) then
			self:AttachSign(true, "SignNoConsumptionResource")
		end
		if SelectedObj == self then
			RebuildInfopanel(self)
		end
	end	
end

function Workshop:AddWorker(unit, shift)
	Workplace.AddWorker(self, unit, shift)
	self:UpdateWorkerMorale(unit)
end

function Workshop:RemoveWorker(unit, shift)
	Workplace.RemoveWorker(self, unit, shift)
	self:UpdateWorkerMorale(unit)
end

function Workshop:GetWorkshopWorkersPercent()
	return self.city:GetWorkshopWorkersPercent()
end

DefineClass.ArtWorkshop = {
	__parents = { "Workshop" },
}
