DefineClass.DreamMystery = {
	__parents = {"MysteryBase"},
	
	scenario_name = "Mystery 4",
	
	display_name = T{1180, "Inner Light (Easy)"},
	rollover_text = T{1181, '"Seize the time... Live now! Make now always the most precious time. Now will never come again."<newline><right>- Jean-Luc Picard'},
	challenge_mod = 20,
	order_pos = 2,
	
	dream_index = 0,
	state = "not started",  -- not started, running, ended
}

GlobalVar("g_MysteryDream", false)

function Dream_StartMirages()
	assert(UICity.mystery.state ~= "running")
	UICity.mystery.state = "running"
	CreateGameTimeThread( function()
		Sleep(1000) -- give the scenario execution time to progress and reach WaitMsg("MysteryDream")
		while UICity.mystery.state == "running" do
			if IsDisasterPredicted() or IsDisasterActive() then
				Sleep(5000)
			else
				Dream(UICity)
				Sleep(AsyncRand(const.DayDuration*3) + const.DayDuration*4)
			end
		end
	end )
end

function Dream_StopMirages()
	assert(UICity.mystery.state == "running")
	UICity.mystery.state = "ended"
	Msg("MysteryDreamEnded")
	
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		local dreamers = dome.labels.Dreamer or empty_table
		for i = #dreamers, 1, -1 do
			local colonist = dreamers[i]
			colonist:RemoveTrait("Dreamer")
			colonist:AddTrait("DreamerPostMystery")
		end
	end
	g_HiddenTraits["Dreamer"] = true
end

function ShowMirage(enable)
	enable = enable or false
	if g_MysteryDream == enable then
		return
	end
	g_MysteryDream = enable
	SetDisasterLightmodelList(GetDisasterLightmodelList(), 1000)
	hr.RenderMirage = enable and 1 or 0
end

function OnMsg.ChangeMap()
	hr.RenderMirage = 0
end

function OnMsg.LoadGame()
	if g_MysteryDream then
		hr.RenderMirage = 1
	end
end


function Dream(city)
	city.mystery.dream_index = city.mystery.dream_index + 1
	
	ShowMirage(true)
	Msg("MysteryDream")
	
	local mystery_ended = WaitMsg("MysteryDreamEnded", city:Random(const.DayDuration) + const.DayDuration)
	
	ShowMirage(false)
	if mystery_ended then
		assert(UICity.mystery.state == "ended")
		return
	end
	Msg("MysteryDreamEnded")
	
	if city.mystery.dream_index >= 2 then
		local current_dreamers = 0	
		for _, dome in ipairs(city.labels.Dome or empty_table) do
			current_dreamers = current_dreamers + #(dome.labels.Dreamer or empty_table)
		end
		if current_dreamers < 20 then
			Dream_CreateDreamers(5, current_dreamers)
		end
	end
end

function Dream_CreateDreamers(n, current_dreamers)
	if not current_dreamers then
		current_dreamers = 0
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			current_dreamers = current_dreamers + #(dome.labels.Dreamer or empty_table)
		end
	end
	local total_colonists = #(UICity.labels.Colonist or empty_table)
	for i=1,Min(n, total_colonists - current_dreamers) do
		local start_index = AsyncRand(total_colonists)
		for j=1,total_colonists do
			local index = (start_index + j) % total_colonists + 1
			local colonist = UICity.labels.Colonist[index]
			if not colonist.traits.Dreamer then
				colonist:AddTrait("Dreamer")
				break
			end
		end
	end
end

function IsDreamMystery()
	return UICity.mystery and UICity.mystery:IsKindOf("DreamMystery")
end