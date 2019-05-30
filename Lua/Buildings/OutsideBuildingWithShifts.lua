DefineClass.OutsideBuildingWithShifts = {
	__parents = { "ShiftsBuilding"},
}

function OutsideBuildingWithShifts:GetWorkNotPossibleReason()
	if self:IsClosedShift(self.current_shift) then
		return "InactiveWorkshift"
	end
	return Building.GetWorkNotPossibleReason(self)
end
