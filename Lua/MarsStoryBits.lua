-- game-specific implementations for StoryBits.lua

DefineStoryBitTrigger("Building constructed", "ConstructionComplete")
DefineStoryBitTrigger("Colonist became Youth", "ColonistBecameYouth")
DefineStoryBitTrigger("Tech researched", "TechResearchedTrigger")
DefineStoryBitTrigger("Sanity breakdown", "SanityBreakdown")

DefineStoryBitTrigger("Cold Wave", "ColdWave")
DefineStoryBitTrigger("Dust Storm", "DustStorm")
DefineStoryBitTrigger("Meteor Storm", "MeteorStorm")

DefineStoryBitTrigger("Cold Wave Ended", "ColdWaveEnded")
DefineStoryBitTrigger("Dust Storm Ended", "DustStormEnded")
DefineStoryBitTrigger("Meteor Storm Ended", "MeteorStormEnded")

DefineStoryBitTrigger("Construction Prefab Placed", "ConstructionPrefabPlaced")
DefineStoryBitTrigger("Colonist Death", "ColonistDied")

DefineStoryBitTrigger("Rocket Manual Launch", "RocketManualLaunch")
DefineStoryBitTrigger("Rocket Landing Attempt", "RocketLandAttempt")

DefineStoryBitTrigger("Repaired", "Repaired")

function IsStoryBitsDisabled()
	return g_Tutorial or IsGameRuleActive("StoryBitsDisabled")
end

function IsStoryBitObjectValid(obj)
	if obj:IsKindOf("Building") then
		return ValidateBuilding(obj)
	end
	if obj:IsKindOf("Colonist") then
		return not obj:IsDying()
	end
	if obj:IsKindOf("CObject") then
		return IsValid(obj)
	end
	return true
end

function AddStoryBitNotification(id, title, text, dismissable, callback)
	AddCustomOnScreenNotification(id, title, text, nil, callback, { dismissable = dismissable })
end

function RemoveStoryBitNotification(id)
	RemoveOnScreenNotification(id)
end

function WaitStoryBitPopup(title, voiced_text, text, actor, image, choices, choice_enabled, choice_extra_texts, object)
	local context = {
		-- we ignore 'actor' in Mars
		is_storybit = true,
		title = title,
		voiced_text = voiced_text,
		text = text,
		image = image,
		start_minimized = false,
		disallow_escape = #(choices or empty_table) > 1,
		disabled = {},
	}
	local choices_count = #(choices or empty_table)
	for i, choice in ipairs(choices or empty_table) do
		context["choice" .. i] = T{10551, "<choice><newline><extra_text>", choice = choices[i], extra_text = choice_extra_texts[i]}
		context.disabled[i] = not choice_enabled[i]
	end
	if IsKindOf(object, "CObject") and object:IsValidPos() then
		ViewAndSelectObject(object)
	end
	PlayFX("UIMenuNotificationStoryBit", "start")
	return WaitPopupNotification(false, context)
end

function OnStoryBitStateActivated(storybit_state)
	local storybit_id = storybit_state.id
	local storybit = StoryBits[storybit_id]
	TelemetryStoryBitTriggered(storybit_id, storybit.Category)
end

function StoryBitFormatCost(cost)
	return T{11237, "<funding(cost)>", cost = cost}
end

function StoryBitCheckCost(cost)
	return UICity:GetFunding() >= cost
end

function StoryBitPayCost(cost)
	UICity:ChangeFunding(-cost)
end

function StoryBitFormatGameTime()
	return "Sol" .. UICity.day .. " h" .. UICity.hour
end

----

function RemoveShuttles(count, idle_shuttles_first, logical_object_only)
	local k1 = idle_shuttles_first and 1 or 2
	for k=k1,2 do
		-- first pass try to remove only idle shuttles
		local infos = {}
		for _, hub in ipairs(UICity.labels.ShuttleHub) do
			for _, info in ipairs(hub.shuttle_infos or empty_table) do
				if k > 1 or not info.shuttle_obj then
					assert(info.hub)
					infos[#infos + 1] = info
				end
			end
		end
		while count > 0 do
			local info, idx = table.rand(infos)
			if not info then
				break
			end
			table.remove(infos, idx)
			table.remove_entry(info.hub.shuttle_infos, info)
			RebuildInfopanel(info.hub)
			info.hub = false
			if not logical_object_only and IsValid(info.shuttle_obj) then
				DoneObject(info.shuttle_obj)
			end
			DoneObject(info)
			count = count - 1
			if count == 0 then
				return
			end
		end
	end
end

----

local ColonistDeathStatSols = 10
GlobalVar("ColonistDeathStats", {})

function OnMsg.ColonistDie(colonist, reason)
	local now = GameTime()
	local stats = ColonistDeathStats
	local stat_time = ColonistDeathStatSols * const.DayDuration
	stats[#stats + 1] = {now, reason}
	while now - stats[1][1] > stat_time do
		table.remove(stats, 1)
	end
end

function CountColonistDeaths(reasons, sols)
	sols = sols or ColonistDeathStatSols
	assert(sols <= ColonistDeathStatSols)
	local start_time = GameTime() - sols * const.DayDuration
	local stats = ColonistDeathStats
	local count = 0
	for i=#stats,1,-1 do
		local stat = stats[i]
		if stat[1] < start_time then
			break
		end
		if not reasons or reasons[stat[2]] then
			count = count + 1
		end
	end
	return count
end

function StoryBits_GetMaintenanceResourcesDropDownItems()
	local ret = GetMaintenanceResourcesDropDownItems()	
	table.insert(ret, 1, {text = T(11033, "Default maintenance"), value = "default"})
	return ret
end

local ColonistSpecializationComboList
function ColonistSpecializationCombo()
	if not ColonistSpecializationComboList then
		ColonistSpecializationComboList = table.copy(ColonistSpecializationList)
		table.insert(ColonistSpecializationComboList, 1, false)
	end
	return ColonistSpecializationComboList
end

local RoverTypesComboList
function RoverTypesCombo()
	if not RoverTypesComboList then
		RoverTypesComboList = GetAvailableRovers()
		table.insert(RoverTypesComboList, 1, false)
	end
	return RoverTypesComboList
end

function GetRandomResearchableTech(field, only_discovered, include_repeatables)
	local available_techs = {}
	if field == "Breakthroughs" then
		available_techs = UICity:GetUnregisteredBreakthroughs()
	else
		local status = UICity.tech_status
		for field_i, techs in pairs(UICity.tech_field) do
			if field == "" or field_i == field then
				for _,tech in ipairs(techs) do
					local ts = status[tech]
					if (not only_discovered or ts.discovered) and (not ts.researched or include_repeatables and ts.repeatable) then
						available_techs[#available_techs + 1] = tech
					end
				end
			end
		end
		if #available_techs == 0 and not include_repeatables then
			return GetRandomResearchableTech(field, only_discovered, true)
		end
	end
	return table.rand(available_techs)
end

function GetRandomDiscoverableTechField()
	local fields = {}
	for name, field in pairs(TechFields) do
		if field.discoverable then
			fields[#fields + 1] = name
		end
	end
	return table.rand(fields)
end