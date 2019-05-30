DefineClass.ThreeHarvestTypesBuilding = {
	__parents = { "ElectricityConsumer" },
	no_harvest_type_id = "None",
	current_harvest_idx = 3, --so we start from one when shifting it in GetCurrentHarvestType()
	harvest_type = false
}

function ThreeHarvestTypesBuilding:Init()
	self.harvest_type = {}
	self.harvest_type[1] = self:GetDefaultHarvestTypeId()
	self.harvest_type[2] = self.no_harvest_type_id
	self.harvest_type[3] = self.no_harvest_type_id
end

function ThreeHarvestTypesBuilding:GetHarvestType(idx)
	if self.harvest_type[idx] == self.no_harvest_type_id then return T(6761, "None") end
	return self:GetHarvestTypesTable()[self.harvest_type[idx]].display_name
end

function ThreeHarvestTypesBuilding:GetHarvestTypeInfo(idx)
	if self.harvest_type[idx] == self.no_harvest_type_id then return false end
	return self:GetHarvestTypesTable()[self.harvest_type[idx]]
end

function ThreeHarvestTypesBuilding:HasHarvestTypeSelected()
	return self.harvest_type[1] ~= self.no_harvest_type_id 
		or self.harvest_type[2] ~= self.no_harvest_type_id 
		or self.harvest_type[3] ~= self.no_harvest_type_id
end

function ThreeHarvestTypesBuilding:SetHarvestType(id, idx, broadcast)
	if broadcast then
		BroadcastAction(self, "SetHarvestType", id, idx)
		return
	end
	self.harvest_type[idx] = id
end

function ThreeHarvestTypesBuilding:GetCurrentHarvestType()
	self.current_harvest_idx = self.current_harvest_idx % 3 + 1
	local counter = 0
	local idx
	while true do
		if counter == 3 then return false end
		idx = self.current_harvest_idx
		if self.harvest_type[idx] ~= self.no_harvest_type_id then
			local harvest_types_table = self:GetHarvestTypesTable()
			if not self:CheckHarvestRequirements(harvest_types_table[self.harvest_type[idx]]) then
				self.harvest_type[idx] = self.no_harvest_type_id
			else
				return harvest_types_table[self.harvest_type[idx]]
			end
		end
		self.current_harvest_idx = self.current_harvest_idx % 3 + 1
		counter = counter + 1
	end
end

function ThreeHarvestTypesBuilding:GetNextHarvestIndex()
	local next_idx = self.current_harvest_idx % 3 + 1
	for i = 1, 3 do
		if self.harvest_type[next_idx] ~= self.no_harvest_type_id then
			return next_idx
		end
		next_idx = next_idx % 3 + 1
	end
end

function ThreeHarvestTypesBuilding:CheckHarvestRequirements(harvest_type)
	return true
end

function ThreeHarvestTypesBuilding:GetDefaultHarvestTypeId()
	local default = self:GetHarvestTypesTable()[self.default_harvest_type_id]
	if not self:CheckHarvestRequirements(default) then
		return self.no_harvest_type_id
	end
	return self.default_harvest_type_id
end