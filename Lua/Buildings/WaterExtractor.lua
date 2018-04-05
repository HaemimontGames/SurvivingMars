--------------------------------------------------------------------------------------------
DefineClass.WaterExtractor = {
	__parents = { "ResourceProducer", "ElectricityConsumer", "WaterProducer", "DustGenerator", "BuildingDepositExploiterComponent", "OutsideBuildingWithShifts", "SubsurfaceDepositConstructionRevealer" },
	subsurface_deposit_class = "SubsurfaceDepositWater",

	UpdateUI = BuildingDepositExploiterComponent.UpdateUI,
	
	building_update_time = const.HourDuration,
	
	stockpile_spots1 = { "Resourcepile" },
	additional_stockpile_params1 = {
		apply_to_grids = false,
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
	
	anim_moments_thread = false,
}

function WaterExtractor:BuildingUpdate()
	RebuildInfopanel(self)
end

function 	WaterExtractor:DroneLoadResource(drone, request, resource, amount)
	TaskRequester.DroneLoadResource(self, drone, request, resource, amount)
	
	if not self.working then
		self:UpdateWorking()
	end
end

function WaterExtractor:GameInit()
	self:DepositChanged()
end

function WaterExtractor:OnDepositsLoaded()
	self:DepositChanged()
	self:UpdateConsumption()
	self:UpdateWorking()
end

-- extract used resource after it is used
function WaterExtractor:ProduceSupply(resource, amount)
	if resource == "water" and self.nearby_deposits[1] then
		local deposit_grade = self.nearby_deposits[1].grade --ExtractResource may kill this
		
		if self:DoesHaveUpgradeConsumption() then
			amount = self:Consume_Upgrades_Production(amount, 100)
		end
		
		amount = self:ExtractResource(amount)
		if self:ProduceWasteRock(amount, deposit_grade) then
			self:UpdateWorking(false)
		end
	end
end

function WaterExtractor:DepositChanged()
	local deposit_multipler = self:GetCurrentDepositQualityMultiplier()
	local amount = MulDivRound(self:GetClassValue("water_production"), deposit_multipler, 100)
	self:SetBase("water_production", amount)
	self:UpdateWorking()
end

function WaterExtractor:OnChangeActiveDeposit()
	BuildingDepositExploiterComponent.OnChangeActiveDeposit(self)
	self:DepositChanged()
end

function WaterExtractor:OnDepositDepleted(deposit)
	BuildingDepositExploiterComponent.OnDepositDepleted(self, deposit)
	self:DepositChanged()
end

function WaterExtractor:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	local production = working and self.water_production or 0
	if self.water then
		self.water:SetProduction(production, production)
	end
	
	if working then
		if not IsValidThread(self.anim_moments_thread) then
			local pump = self:GetAttach("WaterExtractorPump")
			if pump then
				self.anim_moments_thread = TrackAllMoments(pump, "working", self)
			end
		end
	else
		if IsValidThread(self.anim_moments_thread) then
			DeleteThread(self.anim_moments_thread)
		end
	end
end

function WaterExtractor:IsIdle()
	return self.ui_working and not self:CanExploit() and not self.city:IsTechResearched("NanoRefinement")
end

function WaterExtractor:SetUIWorking(working)
	Building.SetUIWorking(self, working)
	BuildingDepositExploiterComponent.UpdateIdleExtractorNotification(self)
end