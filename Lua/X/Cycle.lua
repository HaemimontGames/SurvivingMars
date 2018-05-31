if FirstLoad then
	CycleFunc = false
end


----- CycleMember

DefineClass.CycleMember = {
	parents = { "PropertyObject" },
}

function CycleMember:CycleNext(gamepad)
	local index, objs, text = GetCycleInfo(self)
	local obj = index and objs and (index < #objs and objs[index + 1] or objs[1])
	if obj then
		InfopanelSlideIn = false
		InfopanelFocused = gamepad or false
		obj:Select(CycleFunc)
	end
end

function CycleMember:CyclePrev(gamepad)
	local index, objs, text = GetCycleInfo(self)
	local obj = index and objs and (index > 1 and objs[index - 1] or objs[#objs])
	if obj then
		InfopanelSlideIn = false
		InfopanelFocused = gamepad or false
		obj:Select(CycleFunc)
	end
end

function CycleMember:GetDefaultCycleFunc()
end


----- globals

function GetCycleInfo(obj)
	obj = obj or SelectedObj
	local index, objs, text
	if CycleFunc then
		index, objs, text = CycleFunc(obj)
	end
	if not index then
		CycleFunc = false
	end
	return index, objs, text
end

local clear_cycle = true
function OnMsg.SelectedObjChange(obj)
	if clear_cycle then
		CycleFunc = false
		if obj and obj:IsKindOf("CycleMember") then
			CycleFunc = obj:GetDefaultCycleFunc() or false
		end
	end
	clear_cycle = true
end

function SelectObjWithCycle(obj, cycle_func)
	clear_cycle = false
	CycleFunc = cycle_func or obj and obj:GetDefaultCycleFunc() or false
	SelectObj(obj)
end

function ResidenceCycle(obj)
	local residence = obj.residence
	local objs = residence and residence.colonists
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = residence:GetDisplayName(), index = index, max = #objs}
	end
end

function DomeCycle(obj)
	local dome = obj.dome
	local objs = dome and dome.labels.Colonist
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = dome:GetDisplayName(), index = index, max = #objs}
	end
end

function HomelessCycle(obj)
	local city = obj.city or UICity
	local objs = city.labels.Homeless or empty_table
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = T{3869, "Homeless"}, index = index, max = #objs}
	end
end

function UnemployedCycle(obj)
	local city = obj.city or UICity
	local objs = city.labels.Unemployed or empty_table
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = T{6859, "Unemployed"}, index = index, max = #objs}
	end
end

function TraitCycle(trait, dome)
	local trait_def = DataInstances.Trait[trait]
	if not trait_def then return end
	return function(obj)
		local objs = {}
		local array = dome and dome.labels[trait] or UICity.labels.Colonist or empty_table
		for _, colonist in ipairs(array) do
			if colonist.traits[trait] then
				objs[#objs + 1] = colonist
			end
		end
		local index = type(objs) == "table" and table.find(objs, obj)
		if index then
			return index, objs, T{7679, "<name><right><index> / <max>", name = trait_def.display_name, index = index, max = #objs}
		end
	end
end

function WorkplaceCycle(obj)
	local workplace = obj and obj.workplace
	if not workplace then return end
	local objs = {}
	local colonists = workplace:GetUnitsInShifts()
	for _, workshift in ipairs(colonists) do
		for _, worker in ipairs(workshift) do
			objs[#objs + 1] = worker
		end
	end
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = workplace.display_name, index = index, max = #objs}
	end
end

function CommandCenterDroneCycle(obj)
	local center = obj.command_center
	local objs = center and center.drones
	local index = type(objs) == "table" and table.find(objs, obj)
	if index then
		return index, objs, T{7679, "<name><right><index> / <max>", name = center:GetDisplayName(), index = index, max = #objs}
	end
end

function InfopanelCycleUpdate(infopanel)
	-- updates idCycleText, idCyclePrev and idCycleNext buttons
	local index, objs, text = GetCycleInfo(infopanel.context)
	
	infopanel.idCycleText:SetText(text or "")
	-- find and update prev/next buttons
	local idPrev = infopanel.idMainButtons:ResolveId("idPrev")
	if idPrev then
		idPrev:SetVisible(index)
	end
	local idNext = infopanel.idMainButtons:ResolveId("idNext")
	if idNext then
		idNext:SetVisible(index)
	end
end