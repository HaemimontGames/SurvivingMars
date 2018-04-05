if FirstLoad then
	SelectionShapes, SelectionShapesByHash = {}, {}
end

--calcs the dist between each point in the array of points,
--and then sticks the total dist up to that point in the z member
--clones the first point and sets it as last with the appropriate dist for less checks c side.
function PreparePointsArrayForAnimTrajectoryInput(points)
	local totalDist = 0
	points[#points + 1] = point(points[1]:x(), points[1]:y(), 0)
	for i = 2, #points do
		totalDist = totalDist + points[i-1]:Dist2D(points[i])
		points[i] = points[i]:SetZ(totalDist)
	end
	
	points[1] = points[1]:SetZ(0) --force 0 or it will be max int
end

--Reload the selection shapes for all entities
function RebuildSelectionShapes()
	local surface_mask = EntitySurfaces["Selection"]
	local all_entities = GetAllEntities()
	for entity,_ in pairs(all_entities) do
		if HasAnySurfaces(entity, surface_mask) then
			local all_states = GetStates(entity)
			for _,state in ipairs(all_states) do
				local state_idx = GetStateIdx(state)
				local shape, hash = GetSelectionShape(entity, state_idx)
				
				if shape and #shape > 1 then
					local referenced_entity = SelectionShapesByHash[hash]
					if referenced_entity ~= nil then
						SelectionShapes[entity]  = SelectionShapes[referenced_entity]
					else
						--Shapes are encoded as strings, before storage
						PreparePointsArrayForAnimTrajectoryInput(shape)
						local encoded_shape = EncodePointsToString(shape)
						SelectionShapes[entity] = encoded_shape
						SelectionShapesByHash[hash] = entity
					end
					break
				end
			end
		end
	end
end

OnMsg.EntitiesLoaded = RebuildSelectionShapes
GlobalVar("building_selection_particle", false) --selobj is a global var, so it seems appropriate for this to be as well.

local particle_name_override = { --[entity] = { p1, p2 }
	Excavator = { "Selection_Buildings_Double_01", "Selection_Buildings_Double_02", "Selection_Buildings_Base" },
	Default = { "Selection_Buildings", "Selection_Buildings_Base" },
}

CObject.GetSelectionAngle = CObject.GetAngle

function AddSelectionParticlesToObj(obj)
	building_selection_particle = building_selection_particle or {}
	local s_i = #building_selection_particle + 1
	local e = obj:GetEntity()
	local s = GetEntityOutlineShape(e)
	local s_s = SelectionShapes[e]
	local x, y, z = obj:GetVisualPosXYZ()
	local a = obj:GetSelectionAngle()
	
	if #s == 1 then
		table.insert(building_selection_particle, PlaceParticles("Selection_Buildings_Single"))
		a = a + 30*60 -- fix wrong particle form (Iva made me do it)
	elseif s_s then
		local names = particle_name_override[e] or particle_name_override.Default
		local p
		for _, name in ipairs(names) do
			p = PlaceParticles(name)
			p:SetPolylineAsString(s_s)
			table.insert(building_selection_particle, p)
		end
	end
	
	for i = s_i, #building_selection_particle do
		local p = building_selection_particle[i]
		p:SetPos(x, y, z)
		p:SetAngle(a)
	end
end

--This object will be selectable and will show selection particles around it
DefineClass.SelectableWithParticles = {
	__parents = { "CObject" },
	enum_flags = { efSelectable = true },
}

function OnMsg.SelectedObjChange(obj, prev)
	if building_selection_particle then
		for _, obj in ipairs(building_selection_particle) do
			DoneObject(obj)
		end
		building_selection_particle = false
	end
	
	if (IsKindOf(obj, "SupplyGridSwitch") and obj.is_switch) or
		(IsKindOf(obj, "BreakableSupplyGridElement") and obj.auto_connect) or
		(IsKindOf(obj, "LifeSupportGridElement") and obj.pillar) or
		(IsKindOf(obj, "Building") and not obj.disable_selection and obj.use_shape_selection) or
		(IsKindOf(obj, "SelectableWithParticles"))
	then
		AddSelectionParticlesToObj(obj)
		if IsKindOf(obj, "ConstructionSite") and IsKindOf(obj.building_class_proto, "Tunnel") or IsKindOf(obj, "Tunnel") then
			AddSelectionParticlesToObj(obj.linked_obj)
		end
		if IsKindOf(obj, "Passage") then
			--passage is in first element pos, so sel last
			local el = obj:GetEndElement()
			AddSelectionParticlesToObj(el)
		end
	end
end
