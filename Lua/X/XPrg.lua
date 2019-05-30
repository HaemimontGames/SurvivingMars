function OnMsg.ClassesGenerate(classdefs)
	local xdef_slot = classdefs.XPrgDefineSlot
	table.insert(xdef_slot.properties, { category = "Visit Conditions", id = "usable_day", name = "Usable Day", editor = "bool", default = true })
	table.insert(xdef_slot.properties, { category = "Visit Conditions", id = "usable_night", name = "Usable Night", editor = "bool", default = true })
	table.insert(xdef_slot.properties, { category = "Visit Conditions", id = "usable_by_child", name = "Usable by children", editor = "bool", default = true })
	table.insert(xdef_slot.properties, { category = "Visit Conditions", id = "pet_only", name = "Usable only by pets", editor = "bool", default = false })
end

function PrgMatchSlotData(data, bld, unit)
	if unit.prg_class == "Pet" then
		if not data.pet_only then
			return false
		end
	else
		if data.pet_only then
			return false
		end
	end
	if data.usable_by_child == false and unit and unit.traits and unit.traits.Child then
		return false
	end
	if CurrentWorkshift ~= 3 then -- day/night
		if data.usable_day == false then
			return false
		end
	elseif data.usable_night == false then
		return false
	end
	return true
end

function XPrgDefineSlot:GenCustomProperties(t)
	if not self.usable_by_child then
		t.usable_by_child = false
	end
	if not self.usable_day then
		t.usable_day = false
	end
	if not self.usable_night then
		t.usable_night = false
	end
	if self.pet_only then
		t.pet_only = true
	end
end
