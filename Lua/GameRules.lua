function ReloadGameRules()
	local rules = Presets.GameRules and Presets.GameRules.Default
	if rules then
		table.sort(rules, function (a, b)
			local k1, k2 = a.SortKey, b.SortKey
			if not k1 and k2 then
				return false --items with no SortKey go last
			elseif k1 and not k2 then
				return true --items with no SortKey go last
			elseif k1 ~= k2 then
				return k1 < k2
			end
			return a.id < b.id
		end)
		MissionParams.idGameRules.items = rules
	end
end

function ToggleGameRule(id, dialog)
	local rules = g_CurrentMissionParams.idGameRules
	if rules[id] then
		rules[id] = nil
		ObjModified(g_DiffBonusObj)
		return false
	else
		rules[id] = true
		for rule_id,_ in pairs(rules or empty_table) do
			local exclusions = Presets.GameRules.Default[rule_id].exclusionlist or ""
			if rule_id ~= id then
				if string.match(exclusions, "^.*" .. id .. ".*$") then
					rules[rule_id] = nil
				end
			else
				for i in string.gmatch(exclusions, "%a+") do
					rules[i] = nil
				end
			end
		end
		UpdateGameRulesList(dialog)
		ObjModified(g_DiffBonusObj)
		return true
	end
end

OnMsg.DataLoaded = ReloadGameRules
OnMsg.ModsLoaded = ReloadGameRules

function UpdateGameRulesList(dialog)
	for k,v in ipairs(dialog) do
		v:UpdateImage()
	end
end

function CalcGameRulesChallengeMod()
	local mod = 0
	local rule_presets = Presets.GameRules.Default
	local rules = g_CurrentMissionParams.idGameRules or empty_table
	for rule_id,_ in pairs(rules) do
		mod = mod + rule_presets[rule_id].challenge_mod
	end
	return mod
end

function GetIncompatibleGameRulesNames(id)
	local names = {} 
	local rules = g_CurrentMissionParams.idGameRules
	for rule_id,_ in pairs(GameRulesMap or empty_table) do
		local exclusions = GameRulesMap[rule_id].exclusionlist or ""
		if rule_id ~= id then
			if string.match(exclusions, "^.*" .. id .. ".*$") then
					names[rule_id] = GameRulesMap[rule_id].display_name
			end
		else
			for exclusion in string.gmatch(exclusions, "%a+") do
				names[exclusion] = GameRulesMap[exclusion].display_name
			end
		end
	end
	local all_names = table.concat(table.values(names), "\n")
	if all_names == "" then
		return ""
	else
		return "\n\n"..T{3942, "Incompatible"}..":\n"..all_names
	end
end

function GetGameRulesNames()
	local text = {}
	local rules = g_CurrentMissionParams.idGameRules
	for rule_id,_ in pairs(rules or empty_table) do
		text[#text + 1] = Presets.GameRules.Default[rule_id].display_name
	end
	return table.concat(text, "\n")
end

function IsGameRuleActive(rule)
	return g_CurrentMissionParams.idGameRules and g_CurrentMissionParams.idGameRules[rule]
end

function GetActiveGameRules()
	return table.keys(g_CurrentMissionParams.idGameRules)
end