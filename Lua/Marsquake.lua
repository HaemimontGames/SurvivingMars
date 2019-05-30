DefineClass.MapSettings_Marsquake = {
	__parents = { "PropertyObject" },
}

GlobalVar("g_MarsquakeActive", false)

local function grid_obj_filter(obj)
	return obj:DoesRequireMaintenance() and not obj:IsMalfunctioned() and not obj.destroyed
end

local function SelectBuildings(epicenter_label, radius, targets_count)
	local label = UICity.labels[epicenter_label]
	if not label or not next(label) then return end
	local center_building = table.rand(label)
	
	--prefer working buildings (TODO ask windmiller)
	if not center_building.working then
		for i,bld in ipairs(label) do
			if bld.working then
				center_building = bld
				break
			end
		end
	end
	
	--no working buildings
	if not center_building.working then return end
	
	--find all surrounding buildings
	local q, r = WorldToHex(center_building:GetPos())
	local buildings_in_range = HexGridGetObjectsInRange(ObjectGrid, q, r, radius, "RequiresMaintenance", nil, grid_obj_filter)
	
	targets_count = Min(targets_count, #buildings_in_range)
	
	--choose buildings to destroy
	local affected_buildings = { }
	for i=1,targets_count do
		affected_buildings[i] = buildings_in_range[i]
	end
	for i=targets_count+1,#buildings_in_range do
		local j = AsyncRand(i)
		if j <= targets_count then
			affected_buildings[j] = buildings_in_range[i]
		end
	end
	
	return center_building, affected_buildings
end

function TriggerMarsquake(epicenter_label, radius, targets_count)
	if g_MarsquakeActive then return end

	local center_building, affected_buildings = SelectBuildings(epicenter_label, radius, targets_count)
	if not center_building then return end
	
	local destroy_force = 500
	local shake_force = destroy_force / 2
	
	local durations = { }
	local total_duration = 0
	for i=1,#affected_buildings do
		local duration = 300 + AsyncRand(1200)
		table.insert(durations, duration)
		total_duration = total_duration + duration
	end
	
	g_MarsquakeActive = true
	PlayFX("Marsquake", "start", center_building)
	MarsquakeShakeCamera(durations[1], 0, shake_force)
	CreateGameTimeThread(MarsquakeShakeCamera, total_duration, shake_force)
	for i=1,#affected_buildings do
		Sleep(durations[i])
		local bld = affected_buildings[i]
		if IsValid(bld) then
			PlayFXAroundBuilding(bld, "Demolish")
			PlayFX("MarsquakeMalfunction", "start", bld)
			bld:SetMalfunction()
		end
	end
	
	AddOnScreenNotification("Marsquake", nil, { count = #affected_buildings }, affected_buildings)
	
	PlayFX("Marsquake", "end", center_building)
	MarsquakeShakeCamera(2000, shake_force, 0)
	g_MarsquakeActive = false
end

function MarsquakeShakeCamera(total_time, start_force, end_force)
	total_time = total_time or 1000
	start_force = start_force or 300
	end_force = end_force or start_force
	local force_lerp = ValueLerp(start_force, end_force, total_time)
	
	local starting_pos, starting_lookat, dir2D_original
	if not IsCameraLocked() and not CameraTransitionThread then
		starting_pos, starting_lookat = cameraRTS.GetPosLookAt()
		dir2D_original = starting_lookat:SetZ(0)- starting_pos:SetZ(0)
	end
	
	local shake = true
	
	local start_time = now()
	local end_time = now() + total_time
	while true do
		local passed_time = now() - start_time
		if passed_time >= total_time then
			break
		end
		
		if not IsCameraLocked() and not CameraTransitionThread then
			local dir2D
			local next_pos, next_lookat
			
			if starting_pos and starting_lookat then
				--calculate where the camera will move next
				if shake then
					--calculate interpolated force
					local force = force_lerp(passed_time)
					local offset = MulDivRound(force, guim, 100)
					dir2D = SetLen(dir2D_original, offset)
					next_pos = starting_pos + dir2D
					next_lookat = starting_lookat + dir2D
				else
					--return to starting position
					next_pos, next_lookat = starting_pos, starting_lookat
				end
				
				--shake the camera
				cameraRTS.SetCamera(next_pos, next_lookat)
			else
				starting_pos, starting_lookat = cameraRTS.GetPosLookAt()
				dir2D = starting_lookat:SetZ(0)- starting_pos:SetZ(0)
			end
			
			local duration = 30 + AsyncRand(40)
			Sleep(duration)
			
			--allow the player to control the camera
			local cam_pos, cam_lookat = cameraRTS.GetPosLookAt()
			
			if not IsCameraLocked() and not CameraTransitionThread then
				if cam_pos ~= next_pos or cam_lookat ~= next_lookat then
					if shake then
						starting_pos = cam_pos - dir2D
						starting_lookat = cam_lookat - dir2D
					else
						starting_pos = cam_pos
						starting_lookat = cam_lookat
					end
					dir2D_original = starting_lookat:SetZ(0)- starting_pos:SetZ(0)
				end
			else
				starting_pos, starting_lookat = false, false
			end
			
			shake = not shake
		else
			Sleep(100)
		end
	end
	
	if starting_pos and starting_lookat then
		cameraRTS.SetCamera(starting_pos, starting_lookat)
	end
end

function CheatTriggerMarsquake(settings_name)
	local settings = DataInstances.MapSettings_Marsquake[settings_name]
	local range, targets_count = DetermineMarsquakeParams(settings)
	CreateGameTimeThread(TriggerMarsquake, "Building", range, targets_count)
end
