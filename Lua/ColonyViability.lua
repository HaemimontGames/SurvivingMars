DefineClass.SavedGlobalVars = {
	__parents = { "Object" },
	flags = { gofPermanent = true },
	properties = {
		{ id = "Walkable", dont_save = true },
		{ id = "Collision", dont_save = true },
		{ id = "ApplyToGrids", dont_save = true },
		
		{ id = "g_ColonyNotViableUntil", editor = "number", default = {}, no_edit = true },
		{ id = "MilestoneCompleted", editor = "prop table", default = {}, no_edit = true },
	},
}

function OnMsg.PreSaveMap()
	if not mapdata.GameLogic then
		return
	end
	local saved = MapGet("detached", "SavedGlobalVars")[1] or SavedGlobalVars:new()
	for _, prop_meta in ipairs(saved:GetProperties()) do
		saved[prop_meta.id] = rawget(_G, prop_meta.id)
	end
end

function OnMsg.NewMapLoaded()
	local saved = MapGet("detached", "SavedGlobalVars")[1]
	if saved then
		for _, prop_meta in ipairs(saved:GetProperties()) do
			local saved_value = rawget(saved, prop_meta.id) 
			if saved_value ~= nil then
				_G[prop_meta.id] = saved_value
			end
		end
	end
end
 
local SpecificTraits = {"Enthusiast", "Whiner", "Coward", "Idiot", "Alcoholic", "Gambler",}
GlobalVar("g_FoundersTraitsCheckThread", false)
local function CheckFirstColonistWithTrait()
	if g_FoundersTraitsCheckThread then return end
	g_FoundersTraitsCheckThread = CreateGameTimeThread(function()
		Sleep(Random(4,6)*const.DayDuration)
		local shown = {}
		local found = false
		local count = 0
		while count<#SpecificTraits do
			found = false
			for _, dome in ipairs(UICity.labels.Dome or empty_table) do
				for _, trait_id in ipairs(SpecificTraits) do				
					local traits_label = dome.labels[trait_id] or empty_table
					if not shown[trait_id] and next(traits_label) then
						-- colonist message
						for _, colonist in ipairs(traits_label) do
							if colonist.traits.Founder then
								CreateRealTimeThread(
									function() 
										local res = WaitPopupNotification("FirstFounder"..trait_id,  {params = {colonist = colonist, name = colonist:GetDisplayName()}})
										if res==1 then ViewAndSelectObject(colonist) end
									end)
								shown[trait_id] = true
								count = count + 1
								found = true
								break
							end
						end
					end
					if found then break end
				end
				if found then break end
			end
			Sleep(4*const.DayDuration)
		end
		g_FoundersTraitsCheckThread = true
	end, "traitscheck")	
end

-- Colony stages encoded in g_ColonyNotViableUntil:
-- before first passenger rocket is launched = -3
-- first passenger rocket is in transit = -2
-- colony viable = -1
-- first passenger rocket has landed, rockets forbidden = GameTime() when rockets will be allowed again

GlobalVar("g_ColonyNotViableUntil", -3)

function OnMsg.NewHour()
	local now = GameTime()
	if now > g_ColonyNotViableUntil and g_ColonyNotViableUntil > 0 then
		if IsGameRuleActive("TheLastArk") then
			CreateRealTimeThread(WaitPopupNotification, "ColonyViabilityExit_Delay_LastArk")
		else
			CreateRealTimeThread(WaitPopupNotification, "ColonyViabilityExit_Delay")
		end
		--@@@msg ColonyApprovalPassed - fired when the _Founder Stage_ has been passed successfully.
		Msg("ColonyApprovalPassed")
		g_ColonyNotViableUntil = -1
	end
end

const.ColonyViableByDelay = 10*const.DayDuration

function AreNewColonistsAccepted()
	if g_Tutorial and not g_Tutorial.EnablePassengerRockets then return false end
	if IsGameRuleActive("IronColonists") then return true end
	return g_ColonyNotViableUntil == -3 or (g_ColonyNotViableUntil == -1 and not IsGameRuleActive("TheLastArk"))
end

function OnMsg.RocketLanded(rocket)
	local passengers_idx = table.find(rocket.cargo, "class", "Passengers") 
	if not passengers_idx then return end 
	local applicants  = rocket.cargo[passengers_idx].applicants_data
	local is_founder = g_ColonyNotViableUntil == -2 
	if is_founder then
		if IsGameRuleActive("IronColonists") then
			Msg("ColonyApprovalPassed")
			g_ColonyNotViableUntil = -1	
		else
			CreateRealTimeThread(WaitPopupNotification, "FirstPassengerRocket")		
			g_ColonyNotViableUntil = GameTime() + const.ColonyViableByDelay
			CheckFirstColonistWithTrait()
			AddOnScreenNotification("FounderStageDuration", nil, {start_time = GameTime(), expiration = const.ColonyViableByDelay})
		end
	end
	for _, applicant in ipairs(applicants) do
		if is_founder then 
			applicant.traits.Founder = true 
			applicant.pin_on_start = true
		end
		for trait_id, _ in pairs(applicant.traits) do
			if g_RareTraits[trait_id] then
				applicant.pin_on_start = true
			end
		end
	end
end

function OnMsg.ColonistBorn(colonist, event)
	if GameTime() < g_ColonyNotViableUntil and not colonist.traits.Clone and event == "born" then
		if IsGameRuleActive("TheLastArk") then
			CreateRealTimeThread(WaitPopupNotification, "ColonyViabilityExit_MartianBorn_LastArk")
		else
			CreateRealTimeThread(WaitPopupNotification, "ColonyViabilityExit_MartianBorn")
		end
		RemoveOnScreenNotification("FounderStageDuration")
		Msg("ColonyApprovalPassed")
		g_ColonyNotViableUntil = -1
	end
end

GlobalVar("g_ColonistsDied", 0)

function CountColonistsWithTrait(trait)
	local count = 0
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		count = count + (colonist.traits[trait] and 1 or 0)
	end
	return count
end

GlobalVar("g_FounderDiedOfOldAge", false)
GlobalVar("g_LastFounderDies", false)
function OnMsg.ColonistDied(colonist, reason)
	if not IsGameOver(colonist) then
		if colonist.traits.Founder then
			if CountColonistsWithTrait("Founder") == 0 and not g_LastFounderDies then
				CreateRealTimeThread(
					function() 
						local ret = WaitPopupNotification("LastFounderDies", { params = { colonist = colonist, reason = DeathReasons[reason] or ""  } })
						if ret==1 then ViewAndSelectObject(colonist) end
					end)
				g_LastFounderDies = true
				return
			elseif not g_FounderDiedOfOldAge and reason == "Old age" then
				CreateRealTimeThread(
					function()
						local ret = WaitPopupNotification, "FirstFounderDiesOfOldAge", { params = { colonist = colonist } }
						if ret==1 then ViewAndSelectObject(colonist) end
					end)
				g_FounderDiedOfOldAge = true
				return
			end
		end
		if g_ColonistsDied == 0 then
			CreateRealTimeThread(
				function()
					local ret = WaitPopupNotification("FirstColonistDeath", { params = { colonist = colonist, reason = DeathReasons[reason] or "" } })
					if ret==1 then ViewAndSelectObject(colonist) end
				end)
		end
	end
	g_ColonistsDied = g_ColonistsDied + 1
end

function OnMsg.ColonistLeavingMars(colonist, rocket)
	if not IsGameOver(colonist) then
		if colonist.traits.Founder then
			if CountColonistsWithTrait("Founder") == 0 then
				CreateRealTimeThread(
				function()
					local ret = WaitPopupNotification("LastFounderLeavingMars", { params = { colonist = colonist } })
					if ret==1 then ViewAndSelectObject(colonist) end
				end)
				
			end
		end
	end
end

GlobalVar("g_StatusEffectNotificationsShown", {})
GlobalVar("g_StatusEffectGroupShownTime", {})

function OnMsg.ColonistStatusEffect(colonist, effect, value, time)
	local params = g_StatusEffectNotificationsShown[effect]
	if value then
		local class = _G[effect]
		if class.popup_on_first then
			if params then
				if type(params) == "table" then
					table.insert_unique(params.colonists, colonist)
				end
				return
			end
			params = {}
			g_StatusEffectNotificationsShown[effect] = params
			params.colonists = {colonist}
			params.thread = CreateGameTimeThread(function()
				Sleep(class.popup_display_delay)
				local popup_group = class.popup_group or ""
				if popup_group ~= "" then
					while true do
						local elapsed = GameTime() - (g_StatusEffectGroupShownTime[popup_group] or 0)
						if elapsed >= class.popup_group_delay then
							break
						end
						Sleep(class.popup_group_delay - elapsed)
					end
					g_StatusEffectGroupShownTime[class.popup_group] = GameTime()
				end
				g_StatusEffectNotificationsShown[effect] = true
				colonist = params.colonists[1] or colonist
				local res = WaitPopupNotification(class.popup_on_first, { params = { colonist = colonist } })
				if res==1 then ViewAndSelectObject(colonist) end
			end)
		end
	else
		local thread = params
		if type(params) == "table" then
			table.remove_value(params.colonists, colonist)
			if #params.colonists > 0 then
				return
			end
			thread = params.thread
		end
		if IsValidThread(thread) then
			DeleteThread(thread)
			g_StatusEffectNotificationsShown[effect] = false
		end
	end
end

local FounderGainsTraitCategories = {
	"Positive",
	"Negative",
	"Specialization"
}

function OnMsg.ColonistAddTrait(colonist, trait_id, init)
	if not init and 
		colonist.traits.Founder and 
		TraitPresets[trait_id] and FounderGainsTraitCategories[TraitPresets[trait_id].group] then
		AddOnScreenNotification("FounderGainsTrait", nil, { founder = colonist, trait = trait_id }, { colonist })
	end
end