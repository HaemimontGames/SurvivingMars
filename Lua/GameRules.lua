function ReloadGameRules()
	local rules = Presets.GameRules and Presets.GameRules.Default
	if rules then
		rules = table.copy(rules)
		MissionParams.idGameRules.items = rules
	end
end

function ToggleGameRule(id, dialog)
	local rules = g_CurrentMissionParams.idGameRules
	if rules[id] then
		rules[id] = nil
		ObjModified(g_TitleObj)
		return false
	else
		rules[id] = true
		for rule_id,_ in pairs(rules or empty_table) do
			local exclusions = GameRulesMap[rule_id].exclusionlist or ""
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
		ObjModified(g_TitleObj)
		return true
	end
end

function UpdateGameRulesList(dialog)
	for k,v in ipairs(dialog) do
		if IsKindOf(v, "XTextButton") then
			v:UpdateImage()
		end
	end
end

function CalcGameRulesChallengeMod(new_rule)
	local mod = 0
	local rules = g_CurrentMissionParams.idGameRules or empty_table
	for rule_id,_ in pairs(rules) do
		mod = mod + (GameRulesMap[rule_id] and GameRulesMap[rule_id].challenge_mod or 0)
		if new_rule and rule_id == new_rule then
			new_rule = nil
		end
	end
	local new_rule_mod = GameRulesMap[new_rule] and GameRulesMap[new_rule].challenge_mod or 0
	return mod + new_rule_mod
end

function GetGameRuleIncompatibleText(id)
	local preset = GameRulesMap[id]
	local disabled_text = preset:GetDisabledText()
	if (disabled_text or "") ~= "" then
		return "\n\n" .. disabled_text
	end
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
				names[exclusion] = GameRulesMap[exclusion] and GameRulesMap[exclusion].display_name
			end
		end
	end
	for _, sponsor in ipairs(Presets.MissionSponsorPreset.Default or empty_table) do
		if table.find(sponsor.incompatible_game_rules, id) then
			names[sponsor.id] = T(3474, "Mission Sponsor") .. ": " .. sponsor.display_name
		end
	end
	for _, commander in ipairs(Presets.CommanderProfilePreset.Default or empty_table) do
		if table.find(commander.incompatible_game_rules, id) then
			names[commander.id] = T(3478, "Commander Profile") .. ": " .. commander.display_name
		end
	end
	local all_names = table.concat(table.values(names), "\n")
	if all_names == "" then
		return ""
	else
		return "\n\n"..T(3942, "Incompatible")..":\n"..all_names
	end
end

function GetGameRulesNames()
	local text = {}
	local rules = g_CurrentMissionParams.idGameRules
	for rule_id,_ in pairs(rules or empty_table) do
		text[#text + 1] = GameRulesMap[rule_id].display_name
	end
	return table.concat(text, "\n")
end

function IsGameRuleActive(rule)
	assert(DbgAreDlcsMissing() or GameRulesMap[rule])
	return g_CurrentMissionParams.idGameRules and g_CurrentMissionParams.idGameRules[rule] and true or false
end

function GetActiveGameRules()
	return table.keys(g_CurrentMissionParams.idGameRules)
end

function GetCheckboxImage(state)
	return state and "UI/Icons/Research/researched.tga" or "UI/Common/mod_button.tga"
end