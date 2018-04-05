--black cube building interactions attempted impl. as mod
GlobalVar("solar_panel_bc_modifiers", false) --[perc] -> multyobjmod - so we would have at most 50 modifiers for all panels on the map

local work_thread = false
local max_objects_per_tick = 100 --max objects to iterate before yielding to avoid game freeze
local max_cubes_to_consider = 100
local radius_of_effect = 100 * guim
local member_perc_for_ui = "black_cube_interaction_perc_for_ui"

local function GetModifier(perc)
	if not solar_panel_bc_modifiers[perc] then
		solar_panel_bc_modifiers[perc] = MultipleObjectsModifier:new{id = "black cube building production modifier",
																					percent = perc,
																					prop = "electricity_production",}
	end
	return solar_panel_bc_modifiers[perc]
end

local total_cubes_for_obj = 0 --the counter var
local function black_cube_counter_filter(o)
	if IsKindOf(o, "BlackCubeStockpileBase") then
		--cube stock, just add up the stockpiled amount
		total_cubes_for_obj = total_cubes_for_obj + o:GetStoredAmount() / const.ResourceScale
	elseif IsKindOf(o, "ConstructionSite") then
		local delivered_res = 0
		if (o.construction_costs_at_start and o.construction_costs_at_start["BlackCube"] or 0) > 0 then
			delivered_res = delivered_res + (o.construction_costs_at_start["BlackCube"] - o.construction_resources["BlackCube"]:GetActualAmount())
		end
		
		total_cubes_for_obj = total_cubes_for_obj + delivered_res / const.ResourceScale
	else
		--building, determine costs, and add that
		local building_cost = 0
		building_cost = building_cost + UICity:GetConstructionCost(o, "BlackCube")
		
		if o.in_dome_construction_modifier ~= 100 and IsObjInDome(o) then
			building_cost = MulDivRound(building_cost, o.in_dome_construction_modifier, 100)
		end
		
		total_cubes_for_obj = total_cubes_for_obj + building_cost / const.ResourceScale
	end

	return total_cubes_for_obj >= max_cubes_to_consider and "break" or true
end

local black_cube_counter_query = {classes = {"BlackCubeStockpileBase", "Building"}, 
											area = false, 
											arearadius = radius_of_effect,
											filter = black_cube_counter_filter,}

--this will get called every hour
function BlackCubeBuildingInteractionsModHourlyUpdate()
	assert(not IsValidThread(work_thread)) --op took more then an hour!
	if not g_BlackCubesActive then
		--proc every 1 hour, do work
		work_thread = CreateGameTimeThread(function()
			--first deal with solar panels,
			--kill all old mods, easiest to manage them
			for k, v in pairs(solar_panel_bc_modifiers) do
				DoneObject(v) --provoke destro, cleanup from objects
			end
			
			solar_panel_bc_modifiers = {}
			
			--now iterate all panels on map and set modifiers
			local panels = GetObjects{class = "SolarPanel", area = "realm",}
			
			for i = 1, #panels do
				--for each panel, check the number of cubes in 100m radius
				local panel = panels[i]
				rawset(panel, member_perc_for_ui, nil) --cleanup ui
				
				if IsValid(panel) then --since we yield in this thread, there is no guarantee the panel will be alive
					--count cubes in stockpiles, completed buildings and construction sites
					total_cubes_for_obj = 0
					black_cube_counter_query.area = panel
					GetObjects(black_cube_counter_query)
					black_cube_counter_query.area = false
											
					if total_cubes_for_obj > 0 then
						total_cubes_for_obj = Clamp(total_cubes_for_obj, 0, max_cubes_to_consider)
						local perc = total_cubes_for_obj / 2 --this is the formula.
						if perc > 0 then
							local mod = GetModifier(perc)
							mod:AddTarget(panel)
							rawset(panel, member_perc_for_ui, perc) --set ui
						end
					end
				end
				
				if i % max_objects_per_tick == 0 then
					Sleep(1) --sleep(0) does not yield.
				end
			end
		end)
	else
		if next(solar_panel_bc_modifiers) then
			--solar panel mods cleanup
			for k, v in pairs(solar_panel_bc_modifiers) do
				for i = 1, #v.targets do
					rawset(v.targets[i], member_perc_for_ui, nil)
				end
				DoneObject(v) --provoke destro, cleanup from objects
			end
			
			solar_panel_bc_modifiers = {}
		end
		
		work_thread = CreateGameTimeThread(function()
			--all panels done, now iterate rovers/dronehubs and break them
			local control_centers = GetObjects{class = "DroneControl", area = "realm", filter = function(o) return not o:IsMalfunctioned() end}
			
			for i = 1, #control_centers do
				local cc = control_centers[i]
				rawset(cc, member_perc_for_ui, nil) --cleanup ui
				
				if IsValid(cc) then
					total_cubes_for_obj = 0
					black_cube_counter_query.area = cc
					GetObjects(black_cube_counter_query)
					black_cube_counter_query.area = false
					
					if total_cubes_for_obj > 0 then
						total_cubes_for_obj = Clamp(total_cubes_for_obj, 0, max_cubes_to_consider)
						local malf_chance = total_cubes_for_obj / 20 --5% per 100 cubes,
						if malf_chance > 0 then
							rawset(cc, member_perc_for_ui, malf_chance) --set ui
							if InteractionRand(100, "BlackCubeBreakingDroneControl") < malf_chance then
								if IsKindOf(cc, "RCRover") then
									cc:SetCommand("Malfunction")
								else
									cc:SetMalfunction()
								end
							end
						end
					end
				end
				
				if i % max_objects_per_tick == 0 then
					Sleep(1) --yield
				end
			end
		end)
	end
end

function OnMsg.MysteryChosen()
	if UICity.mystery_id ~= "BlackCubeMystery" then return end --black cubes only exist in this mystery
	--init
	solar_panel_bc_modifiers = {}
	CreateGameTimeThread(function()
		while true do
			Sleep(const.HourDuration)
			BlackCubeBuildingInteractionsModHourlyUpdate()
		end
	end)
end
