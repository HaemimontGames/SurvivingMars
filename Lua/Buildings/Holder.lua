DefineClass.Holder = {
	__parents = {"WaypointsObj" },
	units = false,
}

function Holder:Done()
	self:KickUnitsFromHolder()
end

function Holder:KickUnitsFromHolder()
	local units = self.units
	self.units = nil
	if units then
		local cur_thread = CurrentThread()
		for i = 1, #units do
			local unit = units[i]
			assert(IsValid(unit), "(Shielded) Something went wrong. Units should not be invalid")
			assert(unit.command_thread ~= cur_thread, "Probable destructor interuption")
			if IsValid(unit) then
				unit:KickFromBuilding(self)
			end
		end
	end
end

function Holder:OnEnterHolder(unit)
	local units = self.units
	if units then
		units[#units + 1] = unit
	else
		self.units = { unit }
	end
end

function Holder:OnExitHolder(unit)
	table.remove_entry(self.units, unit)
end
