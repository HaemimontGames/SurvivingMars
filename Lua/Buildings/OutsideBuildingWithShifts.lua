DefineClass.OutsideBuildingWithShifts = {
	__parents = { "ShiftsBuilding"},
}

function OutsideBuildingWithShifts:GetWorkNotPossibleReason()
	if self:IsClosedShift(self.current_shift) then
		return "InactiveWorkshift"
	end
end
