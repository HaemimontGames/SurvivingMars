DefineClass.ShiftsBuilding = {
	__parents = { "Building"},
	
	properties = {		
		{ template = true,id = "active_shift",    name = T(738, "Single Active shift"),   default = 0, category = "ShiftsBuilding", editor = "number"},
		{ template = true,id = "closed_shifts_persist",    name = T(739, "Persisted closed shift"),  no_edit = true, editor = "text", default = ""},
	},
	
	max_shifts = 3,
	closed_shifts = false,-- per shift
	current_shift = false,
}

local shift_names = {
	T(740, "Start Shift Enabled 1"),
	T(741, "Start Shift Enabled 2"),
	T(742, "Start Shift Enabled 3"),
}

for i = 1, ShiftsBuilding.max_shifts do
	assert(shift_names[i])
	table.insert(ShiftsBuilding.properties, { template = true, id = "enabled_shift_" .. i, name = shift_names[i], default = true, category = "ShiftsBuilding", editor = "bool"})
end

function ShiftsBuilding:Init()
	self.closed_shifts = {}
end

function ShiftsBuilding:GameInit()
	for i = 1, self.max_shifts do
		if (not self["enabled_shift_" .. i]) or (self.active_shift > 0 and self.active_shift ~= i) then
			self.closed_shifts[i] = true
		end
	end	
	self:InitPersistShifts()
	for i = 1, self.max_shifts do
		if self.closed_shifts[i] then
			self:CloseShift(i)		
		end
	end
	
	self.city:AddToLabel("ShiftsBuilding", self)
	self:SetWorkshift(CurrentWorkshift)
end

function ShiftsBuilding:RemoveFromShiftsBuildingLabel()
	self.city:RemoveFromLabel("ShiftsBuilding", self)
	self.RemoveFromShiftsBuildingLabel = empty_func
end

function ShiftsBuilding:OnDestroyed()
	self:RemoveFromShiftsBuildingLabel()
end

function ShiftsBuilding:Done()
	self:RemoveFromShiftsBuildingLabel()
end

function ShiftsBuilding:GetUnitsInShifts()
	return empty_table
end

GlobalVar("ChangeWorkshiftThread", false)
function OnMsg.NewWorkshift(workshift)
	DeleteThread(ChangeWorkshiftThread)
	ChangeWorkshiftThread = CreateGameTimeThread(WaitChangeWorkshift, workshift)
end

function WaitChangeWorkshift(workshift)
	for i, bld in ipairs(UICity.labels.ShiftsBuilding or empty_table) do
		if IsValid(bld) then
			bld:SetWorkshift(workshift)
			if i % 50 == 0 then
				Sleep(50)
			end
		end
	end
end

function ShiftsBuilding:SetWorkshift(workshift)
	if self.destroyed or self.current_shift == workshift then 
		return 
	end
	self:OnChangeWorkshift(self.current_shift, workshift)							
	self.current_shift = workshift
	self:SetWorkplaceWorking()
	self:UpdateAttachedSigns()
	self:UpdateNotWorkingBuildingsNotification()
end

function ShiftsBuilding:UpdateAttachedSigns()
end

function ShiftsBuilding:InitPersistShifts()
	self.closed_shifts = self.closed_shifts or {}
	local shift = self.closed_shifts_persist
	if shift ~= "" then 
		local idx = 1
		for closed in string.gmatch(shift, "[0-9]") do
			if closed == "1" then
				self.closed_shifts[idx] = true
			else
				self.closed_shifts[idx] = false
			end
			idx = idx + 1
		end
	end
end

function OnMsg.SaveMap()
	local exec = function(building)
		local persist_shifts = ""
		for j=1, building.max_shifts do
			persist_shifts = persist_shifts..(building:IsClosedShift(j) and "1" or "0")
		end
		building.closed_shifts_persist = persist_shifts
	end
	MapForEach("map","ShiftsBuilding", exec)
end

function ShiftsBuilding:SetWorkplaceWorking()
	local shift = self.active_shift > 0 and self.active_shift or self.current_shift
	if (self.closed_shifts or empty_table)[shift] then
		self:OnSetWorkplaceWorking()
		self:UpdateWorking(false)
	else	
		self:OnSetWorkplaceWorking()
		self:UpdateWorking()
	end
end

function ShiftsBuilding:OnChangeWorkshift(old_shift, new_shift)
end

function ShiftsBuilding:OnSetWorkplaceWorking()
	self:UpdateConsumption()
end

function ShiftsBuilding:GetWorkNotPermittedReason()
	local is_work_permitted = self.active_shift > 0 or not self:IsClosedShift(self.current_shift)
	if not is_work_permitted then
		return "InactiveWorkshift"
	end
	return Building.GetWorkNotPermittedReason(self)
end		

function ShiftsBuilding:OnSetUIWorking(work)
	Building.OnSetUIWorking(self, work)
	if work and self:AreAllShiftsClosed()then
		self:OpenShift(2)
	end
end

function ShiftsBuilding:IsClosedShift(shift)
	return (self.closed_shifts or empty_table)[shift]
end

function ShiftsBuilding:IsShiftUIActive(shift)
	return self.current_shift==shift
end

function ShiftsBuilding:AreAllShiftsClosed()
	local closed_shifts = self.closed_shifts or empty_table
	for idx = 1, self.max_shifts do
		if not closed_shifts[idx] then
			return false
		end
	end
	return true
end

function ShiftsBuilding:CloseShift(shift)
	self.closed_shifts = self.closed_shifts or {}
	self.closed_shifts[shift] = true
	if self:AreAllShiftsClosed() then
		self:SetUIWorking(false)
	end
	if shift == self.current_shift then
		self:UpdateWorking()
		self:UpdateConsumption()
	end
	if self.active_shift > 0 or self.current_shift then
		self:UpdateAttachedSigns()
	end
end

function ShiftsBuilding:MoveWorkers(from_shift, to_shift)
end

function ShiftsBuilding:OpenShift(shift)
	self.closed_shifts = self.closed_shifts or {}
	local all_closed = self:AreAllShiftsClosed()
	local prev_active
	if self.active_shift > 0 then
		prev_active = self.active_shift
		self.closed_shifts[self.active_shift] = true
		self.active_shift = shift
	end
	self.closed_shifts[shift] = false
	if self.active_shift > 0 then
		self:MoveWorkers(prev_active, shift)
	end
	if all_closed then
		self:SetUIWorking(true)
	end
	if shift == self.current_shift or self.active_shift > 0 then
		self:UpdateWorking()
		self:UpdateConsumption()
	end
	self:UpdateAttachedSigns()
end

function ShiftsBuilding:ToggleShift(shift)
	if self:IsClosedShift(shift) then
		self:OpenShift(shift)
	else
		self:CloseShift(shift)
	end
	ObjModified(self)
end

function ShiftsBuilding:ShouldShowNotWorkingNotification()
	return not self:IsClosedShift(self.current_shift) and Building.ShouldShowNotWorkingNotification(self)
end

function ShiftsBuilding:CanWorkTrainHereDomeCheck(colonist)
	local his_dome = colonist.dome
	if not his_dome then return false end
	local my_dome = self.parent_dome
	if not my_dome then
		--checking outside bld would be way 2 hvy, just assume it's fine, generally colo cant see this bld if his dome isn't connected
		my_dome = his_dome
	end
	return (his_dome == my_dome
				or (his_dome.allow_work_in_connected and his_dome.accept_colonists
					and AreDomesConnected(his_dome, my_dome)
					and my_dome:CanColonistsFromDifferentDomesWorkServiceTrainHere()
				))
				
end
