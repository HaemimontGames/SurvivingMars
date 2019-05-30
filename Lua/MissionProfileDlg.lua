
DefineClass.MissionProfileDlg = {
	__parents = { "XDialog" },
}
function MissionProfileDlg:Init(...)
	XPauseLayer:new(nil, self)
	XCameraLockLayer:new(nil, self)
	XSuppressInputLayer:new(nil, self)
	XHideInGameInterfaceLayer:new(nil, self)
end

function MissionProfileDlg:Open(...)
	XDialog.Open(self,...)
	local logo = g_CurrentMissionParams.idMissionLogo 
	local data = Presets.MissionLogoPreset.Default[logo] or Presets.MissionLogoPreset.Default[1]
	if data then
		self.idLogo:SetImage(data.image)
	end
	self:SetMargins(GetSafeMargins(self:GetMargins()))
	self.idDescription:SetText(self:GetMissonProfileText())
	self:FillGoalsList()
end

function MissionProfileDlg:GetMissonProfileText()
	local sponsor = GetMissionSponsor()
	local commander = GetCommanderProfile()
	local gamerules = GetGameRulesNames()
	local texts = {}
	texts[#texts + 1] = T{10104, "Mission Sponsor: <em><display_name></em>", sponsor}
	if g_CurrentMapParams.latitude and g_CurrentMapParams.longitude then
		local lat, long, lat_dir, long_dir = FormatCoordinates(g_CurrentMapParams.latitude, g_CurrentMapParams.longitude)
		local coord = T{4199, "<lat>°<lat_dir> <long>°<long_dir>", lat = lat, long = long, lat_dir = lat_dir, long_dir = long_dir}
		texts[#texts + 1] = T{11466, "Coordinates: <em><coord></em>", coord = coord}
	end
	
	--combining descr and sponsor to create context to resolve tags from sponsor.effect
	local context = GetModifiedConsts(sponsor, commander)
	for _, prop in ipairs(sponsor:GetProperties()) do
		context[prop.id] = sponsor:GetProperty(prop.id)
	end
	context.challenge_rating = sponsor.challenge_mod and Untranslated(string.format("%3.2f", (sponsor.challenge_mod + 100)/100.0))	
	texts[#texts + 1] = T{sponsor.effect, context}
	texts[#texts + 1] = Untranslated("\n")

	texts[#texts + 1] = T{10105, "Commander Profile: <white><display_name></white>", commander}
	texts[#texts + 1] = commander.effect
	texts[#texts + 1] = Untranslated("\n")

	local rules = g_CurrentMissionParams.idGameRules or empty_table
	if next(rules) then
		texts[#texts +1 ] = T(8800, "Game Rules")
		for rule_id,_ in pairs(rules) do
			local rule = GameRulesMap[rule_id]
			texts[#texts + 1] = T{10106, "- <em><display_name></em> - <description>", rule}
		end
	end
	return table.concat(texts, "\n")
end

function ConvertParam(param, plural)
	param = tonumber(param) or param
	if type(param)=="string" then
		-- try for trait id
		local trait	= TraitPresets[param]
		if trait then
			local specialization = const.ColonistSpecialization[param]
			if specialization then 
				return plural and specialization.display_name_plural or  specialization.display_name
			end	
			return trait.display_name
		end	
		-- try resource name
		local resdescr = table.find_value(ResourceDescription, "name", param)
		if resdescr then
			return resdescr.display_name
		end
		
		-- try tech field
		for _, field in ipairs(Presets.TechFieldPreset.Default) do
			if field.id == param then
				return field.display_name
			end	
		end	
		
		-- try for building template
		local template = BuildingTemplates[param]
		if template then 
			return plural and template.display_name_pl or template.display_name
		end
		-- try any class
		local class = g_Classes[param]
		if class then
			return class:GetDisplayName()
		end
	end
	return param
end

function GetGoalDescription(sponsor, idx)
	local id = sponsor:GetProperty("sponsor_goal_"..idx)
	if not id then return "" end

	local goal = Presets.SponsorGoals.Default[id]
	if not goal then return "" end
	local param1 = sponsor:GetProperty(string.format("goal_%d_param_1", idx))
	local param2 = sponsor:GetProperty(string.format("goal_%d_param_2", idx))
	local param3 = sponsor:GetProperty(string.format("goal_%d_param_3", idx))
	param1 = ConvertParam(param1)
	param2 = ConvertParam(param2, type(param1)=="number" and param1>0)
	param3 = ConvertParam(param3, type(param2)=="number" and param2>0)
	local progress = ""
	local goalprogress = SponsorGoalProgress[idx]
	if goalprogress and goalprogress.progress then
		progress = Untranslated(" ")..T{10496, "(<GetProgressText>/<GetTargetText>)", goalprogress}
	end
	return T{goal.description, param1 = param1, param2 = param2, param3 = param3}..progress
end

function MissionProfileDlg:FillGoalItem(sponsor, idx, item)
	local id = sponsor:GetProperty("sponsor_goal_"..idx)
	if not id then return end

	item.idDescription:SetText(GetGoalDescription(sponsor, idx))
	local image = sponsor:GetProperty("goal_image_"..idx)
	if (image or "") ~= "" then
		item.idImage:SetImage(image)
	end
	local icon = sponsor:GetProperty("goal_pin_image_"..idx)
	if (icon or "") ~= "" then
		item.idPinIcon:SetImage(icon)
	end
	local reward = sponsor:GetProperty("reward_effect_"..idx)
	item.idReward:SetText(reward and T{reward.Description, reward} or T(6761, "None"))
	local res = SponsorGoalProgress[idx].state
	item.idGoalResult:SetImage(res == "fail" and "UI/Common/mission_no.tga" or res and "UI/Common/mission_yes.tga" or "")
	if res == "fail" then
		item.idImage:SetTransparency(100)
		item.idTitleFrame:SetTransparency(100)
		item.idDescription:SetTransparency(100)
		item.idBottomWindow:SetTransparency(100)
		item.idPinIcon:SetTransparency(100)
	end
end

function MissionProfileDlg:FillGoalsList()
	local list =  self.idList
	list:DeleteChildren()

	local sponsor = GetMissionSponsor()
	for idx = 1, g_Consts.SponsorGoalsCount do
		local id = sponsor:GetProperty("sponsor_goal_"..idx)
		if Presets.SponsorGoals.Default[id] then
			local item = XTemplateSpawn("GoalItem",list)
			self:FillGoalItem(sponsor, idx, item)
		end
	end
end

function OpenMissionProfileDlg()
	OpenDialog("MissionProfileDlg")
end