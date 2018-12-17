local l_traits_rollover_for_domes = T(1143, "Colonists with <em>MORE</em> of the desired traits will prefer this Dome.<newline><newline>Colonists with <em>ANY</em> of the undesired traits will leave, provided there is <em>available living space</em> elsewhere.<newline><newline>Colonists can walk to closely positioned Domes but will need Shuttles to reach distant Domes.")
local l_traits_rollover_for_rocket = T(1144, "Applicants with <em>MORE</em> of the desired traits will board the Rocket.<newline><newline>Applicants with <em>ANY</em> of the undesired traits will be rejected.")
local function TraitCategoryItems(self, cat_id)
	local items = {}
	items[#items + 1] = {
		cat_id = cat_id,
		leave_space = true,
		value = "all",
		name = T(7642, "ALL TRAITS"),
		add_count_in_name = true,
	}
	local gamepad_hint = T(7580, "<DPadLeft> Change value <DPadRight>")
	local hint
	if self.dome then
		gamepad_hint = gamepad_hint .. T(7776, "<newline><ButtonX> to select colonists")
		hint = T(7777, "<left_click><left_click> to select colonists")
	end
	local dome_filter = self.dome or false
	ForEachPreset(TraitPreset, function(trait, group_list)
		if cat_id == trait.group
			and not g_HiddenTraits[trait.id] 
			and IsTraitAvailable(trait, UICity, "unlocked") 
			and (dome_filter or not trait.dome_filter_only)
		then
			items[#items + 1] = {
				cat_id = cat_id,
				value = trait.id,
				name = trait.display_name,
				add_count_in_name = true,
				rollover = {
					title = trait.display_name,
					descr = trait.description .. "<newline><newline>" .. (self.dome and l_traits_rollover_for_domes or l_traits_rollover_for_rocket),
					hint = hint,
					gamepad_hint = gamepad_hint,
				},
			}
		end
	end)
	return items
end

function CycleFilterTraits(obj, dir, category)
	local domes = UICity.labels.Dome or {}
	local idx = table.find(domes, obj.dome	)
	local count = #domes
	local next_dome = idx and domes[idx + dir] or domes[dir == 1 and 1 or count]
	if not idx or not domes[idx + dir] then
		idx = dir == 1 and 1 or count
	end	
	while next_dome and not next_dome:GetUIInteractionState() do	
		idx = idx + dir
		if idx<1 or idx>count then
			idx = dir == 1 and 1 or count
		end	
		next_dome = domes[idx]		
	end
	if next_dome then
		next_dome:OpenFilterTraits(category)
	end
end

DefineClass.TraitsObject = {
	__parents = { "PropertyObject" },
	properties = {
		{id =  "Age Group", items = function(self) return TraitCategoryItems(self, "Age Group") end, name = T(3929, "Age Group"), title = T(3929, "Age Group"), descr = T(3930, "Colonists are divided into five Age Groups. Children and seniors cannot work."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
		{id =  "Specialization", items = function(self) return TraitCategoryItems(self, "Specialization") end, name = T(240, "Specialization"), title = T(240, "Specialization"), descr = T(3931, "Specialized Colonists perform better at certain workplaces."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
		{id =  "Gender", items = function(self) return TraitCategoryItems(self, "Gender") end, name = T(3932, "Sex"), title = T(3932, "Sex"), descr = T(3933, "The sex of the Colonist. The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
		{id =  "Positive", items = function(self) return TraitCategoryItems(self, "Positive") end, name = T(3934, "Perks"), title = T(3934, "Perks"), descr = T(3935, "Beneficial traits, representing various talents and abilities of the Colonist."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
		{id =  "Negative", items = function(self) return TraitCategoryItems(self, "Negative") end, name = T(3936, "Flaws"), title = T(3936, "Flaws"), descr = T(3937, "Detrimental traits, representing various flaws and disabilities of the Colonist."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
		{id =  "other", items = function(self) return TraitCategoryItems(self, "other") end, name = T(3938, "Quirks"), title = T(3938, "Quirks"), descr = T(3939, "Traits that don't fit into any of the other groups."), editor = "dropdown", default = "", gamepad_hint = T(1145, "<DPadLeft> Expand this category <DPadRight>"), hint = T(1146, "<left_click> Expand this category"), submenu = true,},
	},
	dialog = false,
	dome = false,
	colonists = false,
	matching_applicants = false,
	locked_applicants = false,
	applicants_invalid = true,
	colonist_count = false,
	filter = false,
	categories = false,
	approved_applicants = false,
	approved_per_trait = false,
}

function TraitsObject:InitData(context)
	self.approved_applicants = {}
	if context then
		self.dome = context.dome
		self.colonists = context.colonists
		self.filter = table.copy(context.filter)
	else
		self.colonists = g_ApplicantPool
		self.locked_applicants = {}
		self.filter = g_ApplicantPoolFilter
	end
	self:CountTraitsPerCategory()
	self:CountColonists()
	if context then
		self:CountApprovedColonistsForCategory(context.category)
	end
end

function TraitsObject:SetDialog(dialog)
	self.dialog = dialog
end

function TraitsObject:GetCategoryRollover(item)
	return {
		title = item.title,
		descr = item.descr .. "<newline><newline>" .. (self.dome and l_traits_rollover_for_domes or l_traits_rollover_for_rocket),
		hint = item.hint,
		gamepad_hint = item.gamepad_hint,
	}
end

function TraitsObject:GetMatchingColonistsCount()
	local colonists = self.colonists
	local count = 0
	local all = #colonists
	local filter = self.filter
	local label = not not self.dome
	for i = 1, all do
		local colonist = label and colonists[i] or colonists[i][1]
		if TraitFilterColonist(filter, colonist.traits) >= 0 then
			count = count + 1
		end
	end
	return count, all
end

function TraitsObject:GetApprovedColonists()
	if self.applicants_invalid then
		self:ResolveApplicantLists()
	end
	return #(self.approved_applicants or "")
end

function TraitsObject:GetPassengerCapacity(launch_mode)
	launch_mode = launch_mode or UICity and UICity.launch_mode
	return launch_mode == "passenger_pod" and g_Consts.MaxColonistsPerPod or g_Consts.MaxColonistsPerRocket
end

function TraitsObject:SetUIResupplyParams(win)
	local capacity = self:GetPassengerCapacity()
	local capacity_win = win:ResolveId("idCapacity")
	if capacity_win then capacity_win:SetText(T{11592, "<num>", num = capacity}) end
	local count, all = self:GetMatchingColonistsCount()
	local matching_win = win:ResolveId("idMatchingColonists")
	if matching_win then matching_win:SetText(T{11593, "<count>/<all>", count = count, all = all}) end
	local residences_win = win:ResolveId("idResidences")
	if residences_win then residences_win:SetText(T{11592, "<num>", num = GetAvailableResidences(UICity)}) end
end

function TraitsObject:GetDomeSubtitle()
	local labels = self.dome.labels
	local count, all = self:GetMatchingColonistsCount()
	return T{7645, "Matching Colonists <white><count>/<all></white><newline>Unemployed Colonists <white><unemployed></white><newline>Homeless Colonists <white><homeless></white>",
		unemployed = labels.Unemployed and #labels.Unemployed or 0, homeless = labels.Homeless and #labels.Homeless or 0, count = count, all = all}
end

function TraitsObject:GetPropTraitDisplayName(prop_meta)
	local id = prop_meta.value == "all" and prop_meta.cat_id or prop_meta.value or prop_meta.id
	local approved = self.approved_per_trait and self.approved_per_trait[id] or 0
	return T{7646, "<name> (<approved>/<count>)", name = prop_meta.name, approved = approved, count = self.colonist_count[id] or 0}
end

function TraitsObject:FilterTrait(prop_meta, state)
	local filter = self.filter
	local cat_id = prop_meta.cat_id or prop_meta.id
	local all = prop_meta.value == "all" or prop_meta.submenu
	if all then
		local categories = self.categories
		local positive = categories[cat_id].__true == categories[cat_id].count
		local mix_positive = not positive and (categories[cat_id].__true or 0) >= 1
		local negative = categories[cat_id].__false == categories[cat_id].count
		local mix_negative = not negative and (categories[cat_id].__false or 0) >= 1
		if (positive or mix_positive) and state then
			local current_state = mix_positive and true or nil
			self:SetFilter(prop_meta, nil, current_state)
		elseif (negative or mix_negative) and not state then
			local current_state = mix_negative and false or nil
			self:SetFilter(prop_meta, nil, current_state)
		else
			self:SetFilter(prop_meta, state)
		end
	elseif filter[prop_meta.value] == state then
		self:SetFilter(prop_meta, nil)
	else
		self:SetFilter(prop_meta, state)
	end
	self:CountTraitsPerCategory()
	self:CountApprovedColonistsForCategory(cat_id)
	ObjModified(self)
	self.dialog:UpdateActionViews(self.dialog.idActionBar)
end

function TraitsObject:SetFilter(prop_meta, state, current_state)
	self:InvalidateApplicants()
	local filter = self.filter
	local cat_id = prop_meta.cat_id or prop_meta.id
	local all = prop_meta.value == "all" or prop_meta.submenu
	if all then
		ForEachPreset(TraitPreset, function(trait, group_list)
			if trait.group == cat_id and (current_state == nil or filter[trait.id] == current_state) then
				filter[trait.id] = state
			end
		end)
	else
		filter[prop_meta.value] = state
	end
end

function TraitsObject:UpdateImages(ctrl, prop_meta)
	local filter = self.filter
	local categories = self.categories
	local positive, negative, mix_positive, mix_negative
	local cat_id = prop_meta.cat_id or prop_meta.id
	local all = prop_meta.value == "all" or prop_meta.submenu
	if all then
		positive = categories[cat_id].__true == categories[cat_id].count
		negative = categories[cat_id].__false == categories[cat_id].count
		mix_positive = not positive and (categories[cat_id].__true or 0) >= 1
		mix_negative = not negative and (categories[cat_id].__false or 0) >= 1
	else
		positive = filter[prop_meta.value] == true
		negative = filter[prop_meta.value] == false
	end
	ctrl.idPositive:SetImage(mix_positive and "UI/Icons/traits_random_approve.tga" or positive and "UI/Icons/traits_approve.tga" or "UI/Icons/traits_approve_disable.tga")
	ctrl.idNegative:SetImage(mix_negative and "UI/Icons/traits_random_disapprove.tga" or negative and "UI/Icons/traits_disapprove.tga" or "UI/Icons/traits_disapprove_disable.tga")
end

function TraitsObject:CountTraitsPerCategory()
	self.categories = {}
	local filter = self.filter
	ForEachPreset(TraitPreset, function(trait, group_list)
		self.categories[trait.group] = self.categories[trait.group] or {}
		local cat_t = self.categories[trait.group]
		if filter[trait.id] then
			cat_t.__true = (cat_t.__true or 0) + 1
		elseif filter[trait.id] == false then
			cat_t.__false = (cat_t.__false or 0) + 1
		end
		cat_t.count = (cat_t.count or 0) + 1
	end)
end

function TraitsObject:CountApprovedColonistsForCategory(category)
	if category then
		self.approved_per_trait = {}
		local colonists = self.colonists
		local traits_def = TraitPresets
		local label = not not self.dome
		for i = 1, #colonists do
			local colonist = label and colonists[i] or colonists[i][1]
			local traits = colonist.traits or {}
			local cat_counted = false
			local eval = TraitFilterColonist(self.filter, traits)
			for k, v in sorted_pairs(traits) do
				local cat = traits_def[k] and traits_def[k].group
				if cat == category then
					if eval >= 0 then
						if not cat_counted then
							self.approved_per_trait[category] = (self.approved_per_trait[category] or 0) + 1
							cat_counted = true
						end
						self.approved_per_trait[k] = (self.approved_per_trait[k] or 0) + 1
					end
				end
			end
		end
	end
end

function TraitsObject:CountColonists()
	self.colonist_count = {}
	local colonists = self.colonists
	local traits_def = TraitPresets
	local label = not not self.dome
	for i = 1, #colonists do
		local colonist = label and colonists[i] or colonists[i][1]
		local traits = colonist.traits or {}
		local cat_counted = {}
		for k, v in sorted_pairs(traits) do
			local cat = traits_def[k] and traits_def[k].group
			if cat then
				if not cat_counted[cat] then
					self.colonist_count[cat] = (self.colonist_count[cat] or 0) + 1
					cat_counted[cat] = true
				end
				self.colonist_count[k] = (self.colonist_count[k] or 0) + 1
			end
		end
	end
end

function TraitsObject:ClearTraits(prop_meta)
	self:InvalidateApplicants()
	local filter = self.filter
	local traits = TraitPresets
	if prop_meta then
		for k, v in sorted_pairs(filter) do
			if traits[k] and traits[k].group == prop_meta.id then
				filter[k] = nil
			end
		end
		self:CountApprovedColonistsForCategory(prop_meta.id)
	else
		self.filter = {}
	end
	self:CountTraitsPerCategory()
	ObjModified(self)
	self.dialog:UpdateActionViews(self.dialog.idActionBar)
end

function TraitsObject:InvalidateApplicants()
	self.applicants_invalid = true
end

function TraitsObject:ResolveApplicantLists()
	self.matching_applicants = {}
	local applicants = self.matching_applicants
	local approved = self.approved_applicants
	--remove all unlocked colonists from the approved list
	for i = #approved, 1, -1 do
		local item = approved[i]
		if not self.locked_applicants[item] then
			table.remove_entry(approved, item)
		end
	end
	local eval_t = {}
	for _, item in ipairs(self.colonists) do --iterate over the entire applicant pool
		local colonist = item[1]
		local eval = TraitFilterColonist(self.filter, colonist.traits)
		if eval >= 0 then
			if not self.locked_applicants[item] then
				applicants[#applicants + 1] = item
				eval_t[item] = -eval
			end
		end
	end
	table.sortby(applicants, eval_t)
	--fill remaining slots in the approved list
	local free_capacity = self:GetPassengerCapacity() - #approved
	for i = 1, free_capacity do
		if not applicants[1] then break end
		self:ApproveApplicant(applicants[1], "dont_lock")
	end
	self.applicants_invalid = false
end

function TraitsObject:CreateUIListItems(colonists, selected)
	local items = {}
	for _, item in ipairs(colonists) do --iterate over the entire applicant pool
		local colonist = item[1]
		local name = colonist.name
		local specialist = GetSpecialization(colonist.specialist).display_name
		local nation = table.find_value(Nations, "value", colonist.birthplace)
		local flag = nation and nation.flag			
		local rollover_description =  T{1148, "Birthplace <right><flag><newline><left>Sex<right><gender><newline><left>Age<right><Age><newline><left>Specialization<right><specialist>", 
					name = name, specialist = specialist, 
					gender = Colonist.GetGender(colonist), Age = Colonist.GetAge(colonist),
					flag = flag and "<image "..flag.." 1400>" or nation.text}
					
		local traits = {}
		for trait_id in pairs(colonist.traits) do
			local trait = TraitPresets[trait_id]
			if trait and trait.show_in_traits_ui then
				traits[#traits + 1] = T{7373, "<em><trait></em>: <descr>", trait = trait.display_name, descr = trait.description}
			end
		end
		if next(traits) then
			rollover_description = rollover_description..T(1150, "<newline><left><center>Traits<newline><left>")..table.concat(traits,"<newline><newline><left>")
		end
		local info  = (colonist.traits.Child or colonist.traits.Senior) and Colonist.GetAge(colonist) or specialist
		local hint, gamepad_hint
		if selected then
			rollover_description = rollover_description .. T(11594, "<newline><newline><lock_icon> Locked passengers will remain selected when the filter changes.")
			local t = {}
			t[#t + 1] = T(11595, "<ButtonA> Remove")
			t[#t + 1] = T(11596, "<ButtonY> Toggle Lock")
			gamepad_hint = table.concat(t, "<newline>")
			t = {}
			t[#t + 1] = T(11597, "<left_click> Remove")
			t[#t + 1] = T(11598, "<right_click> Toggle Lock")
			hint = table.concat(t, "<newline>")
		else
			gamepad_hint = T(11599, "<ButtonA> Add")
			hint = T(11600, "<left_click> Add")
		end
		items[#items + 1] = {
			name = T{1151, "<name> (<info>)",name = name, info = info},
			applicant = item,
			rollover = {
				title = name,
				descr = rollover_description,
				gamepad_hint = gamepad_hint,
				hint = hint,
			},
		}
	end
	return items
end

function TraitsObject:GetMatchingApplicantsList()
	if self.applicants_invalid then
		self:ResolveApplicantLists()
	end
	return self:CreateUIListItems(self.matching_applicants)
end

function TraitsObject:GetApprovedApplicantsList()
	if self.applicants_invalid then
		self:ResolveApplicantLists()
	end
	return self:CreateUIListItems(self.approved_applicants, true)
end

function TraitsObject:ApproveApplicant(applicant, dont_lock)
	local approved = self.approved_applicants
	local colonists = self.matching_applicants
	approved[#approved + 1] = applicant
	table.remove_entry(colonists, applicant)
	if not dont_lock then
		self:LockApplicant(applicant)
		ObjModified(self)
	end
end

function TraitsObject:RemoveApprovedApplicant(applicant)
	local approved = self.approved_applicants
	local colonists = self.matching_applicants
	colonists[#colonists + 1] = applicant
	table.remove_entry(approved, applicant)
	self:UnlockApplicant(applicant)
	ObjModified(self)
end

function TraitsObject:LockApplicant(applicant)
	self.locked_applicants[applicant] = applicant
	return true
end

function TraitsObject:UnlockApplicant(applicant)
	self.locked_applicants[applicant] = nil
end

function TraitsObject:ToggleLockApplicant(applicant)
	local locked = self.locked_applicants
	if locked[applicant] then
		return self:UnlockApplicant(applicant)
	else
		return self:LockApplicant(applicant)
	end
end

function TraitsObject:IsApplicantLocked(prop_meta)
	return self.locked_applicants[prop_meta.applicant]
end

function TraitsObject:UpdateRocketName(host)
	host.idTop.idRocketName:SetText(self:GetRocketName())
end

function TraitsObject:RenameRocket(host)
	g_RenameRocketObj:RenameRocket(host, function() self:UpdateRocketName(host) end)
end

function TraitsObject:GetRocketName()
	local name = g_RenameRocketObj:GetRocketHyperlink()
	return GetCargoSumTitle(name)
end

function TraitsObject:GetDomeName()
	local name = self.dome:GetDisplayName()
	return GetCargoSumTitle(name)
end

function TraitsObject:CanApplyFilter(category_id)
	local filter = self.filter
	local dome_filter = self.dome.traits_filter
	if category_id then
		local found = false
		ForEachPreset(TraitPreset, function(trait, group_list)
			if trait.group == category_id and filter[trait.id] ~= dome_filter[trait.id] then
				found = true
			end
		end)
		return found
	else
		return (next(filter) or next(dome_filter)) and (not table.is_subset(filter, dome_filter) or not table.is_subset(dome_filter, filter))
	end
end

function TraitsObject:CanClearFilter(category_id)
	if category_id then
		local filter = self.filter
		local found = false
		ForEachPreset(TraitPreset, function(trait, group_list)
			if trait.group == category_id and filter[trait.id] ~= nil then
				found = true
			end
		end)
		return found
	else
		return next(self.filter) and true or false
	end
end

function TraitsObject:ApplyDomeFilter(category_id)
	if not category_id then
		self.dome.traits_filter = table.copy(self.filter)
	else
		local dome_traits = self.dome.traits_filter
		ForEachPreset(TraitPreset, function(trait, group_list)
			if trait.group == category_id then
				dome_traits[trait.id] = self.filter[trait.id]
			end
		end)
	end
	self.dome:ApplyTraitsFilter()
	self.dialog:UpdateActionViews(self.dialog.idActionBar)
end

function TraitsObject:WaitAskToApplyTraitsFilter()
	if self:CanApplyFilter() then
		if WaitMarsQuestion(self.dialog, T(1000599, "Warning"), T(8715, "The new filters have not been applied. Do you want to apply the changes?"), T(8716, "Apply the changes"), T(8717, "Discard the changes")) == "ok" then
			self:ApplyDomeFilter()
		end
	end
end

function TraitsObject:SelectColonistsInDome(trait)
	local colonists = self.dome.labels[trait]
	local colonist = colonists and colonists[1]
	if colonist then
		SelectObjWithCycle(colonist, TraitCycle(trait, self.dome))
		ViewObjectMars(colonist:GetLogicalPos())
		self.dialog:Close()
	end
end

function TraitsObject:CountApprovedCheck()
	local count = self:GetApprovedColonists()
	local capacity = self:GetPassengerCapacity()

	return count > 0 and count <= capacity
end

function TraitsObject:GetPassengerRocketLaunchIssue()
	local approved = self.approved_applicants
	if #(approved or "") > 0 then
		return not self:CountApprovedCheck() and "capacity"
	end
end

function TraitsObjectCreateAndLoad(context)
	local obj = TraitsObject:new()
	obj:InitData(context)
	return obj
end

function BuyApplicants(host)
	CreateRealTimeThread(function()
		local price = GetMissionSponsor().applicants_price
		local count = const.BuyApplicantsCount
		if UICity:GetFunding() >= price then
			if WaitMarsQuestion(host, T(6882, "Warning"), T{6883, "Are you sure you want to buy <count> applicants for <funding(price)>?", count = count, price = price}, T(1138, "Yes"), T(1139, "No"), "UI/Messages/death.tga") == "ok" then
				UICity:ChangeFunding(-price, "Applicants")
				local now = GameTime()
				for i=1,count do
					GenerateApplicant(now)
				end
				local obj = host.context
				obj.colonists = g_ApplicantPool
				obj:CountColonists()
				ObjModified(obj)
				host:UpdateActionViews(host.idActionBar)
			end
		else
			CreateMarsMessageBox(T(6902, "Warning"), T{7547, "Insufficient funding! You need <funding(price)> to recruit applicants!", price = price}, T(1000136, "OK"), host)
		end
	end)
end

function LaunchPassengerRocket(host)
	local obj = ResolvePropObj(host.context)
	local issue = obj:GetPassengerRocketLaunchIssue()
	if issue then
		local caption, text
		if issue == "capacity" then
			text = T(11601, "Too many selected applicants")
		end
		CreateMessageBox(T(11603, "Launch Failed"), text, nil, host)
		return
	end
	
	local mode = UICity.launch_mode
	local label = SetupLaunchLabel(mode)

	CreateRealTimeThread(function(obj, mode, label)
		g_ApplicantPoolFilter = obj.filter
		local capacity = obj:GetPassengerCapacity(mode)
		local amount, data = PrepareApplicantsForTravel(UICity, host, capacity)
		if not amount then return end
		Msg("PassengerRocketLaunched", label)
		local cargo = {}
		cargo.rocket_name = g_RenameRocketObj.rocket_name
		MarkNameAsUsed("Rocket", g_RenameRocketObj.rocket_name_base)
		if amount > 0 then
			cargo[1] = {class = "Passengers", amount = amount, applicants_data = data}
			cargo[2] = {class = "Food", amount = MulDivRound(amount, g_Consts.FoodPerRocketPassenger, const.ResourceScale)}
		end
		host.parent.parent:Close()

		-- mark progress for colony viability
		if amount > 0 and g_ColonyNotViableUntil == -3 then
			g_ColonyNotViableUntil = -2
			AccountStorage.DisablePlayTutorialPopup = true
			SaveAccountStorage(5000)
		end
		
		CreateGameTimeThread(function(mode, label) -- let the new rockets properly GameInit so they can actually be used by OrderLanding
			Sleep(1)
			UICity:OrderLanding(cargo, 0, false, label)
		end, mode, label)
	end, obj, mode, label)
end




if FirstLoad then
	g_RareTraits = {}
	g_NoneRareTraits = {}
	g_HiddenTraitsDefault = {}
end

local function PostprocessTraits()
	g_RareTraits = {}
	g_NoneRareTraits = {}
	g_HiddenTraitsDefault = {}
	ForEachPreset(TraitPreset, function(trait, group_list)
		trait:AddIncompatible()
		trait._incompatible = string.gsub(trait._incompatible, " ", "")
		local tbl = string.tokenize(trait._incompatible, ",", false, true)
		for _, val in ipairs(tbl) do
			local class = TraitPresets[val]
			class:AddIncompatible()
			assert(class, "Invalid trait:", val)
			rawset(trait.incompatible, val, true)
			rawset(class.incompatible, trait.id, true)
		end
		if trait.rare then 
			g_RareTraits[trait.id] = true
		else
			g_NoneRareTraits[trait.id] = true
		end
		if trait.hidden_on_start then
			g_HiddenTraitsDefault[trait.id] = true
		end

		-- save compatiblity
		trait.name = trait.id
		trait.category = trait.group
	end)
end

function OnMsg.DataLoaded()
	PostprocessTraits()
	-- save compatibility
	DataInstances.Trait = TraitPresets
end

function OnMsg.ModsReloaded()
	PostprocessTraits()
end

GlobalVar("g_SchoolTraits", false)
GlobalVar("g_SanatoriumTraits", false)
GlobalVar("g_HiddenTraits", g_HiddenTraitsDefault)

local function GenerateBuildingTraitLists()
	--Generate anew the lists that can have mod-added traits in them
	
	g_SchoolTraits = table.copy(const.SchoolTraits)
	g_SanatoriumTraits = table.copy(const.SanatoriumTraits)
	
	ForEachPreset(TraitPreset, function(trait, category)
		if IsKindOf(trait, "ModItemTraitPreset") then
			if trait.school_trait then
				table.insert(g_SchoolTraits, trait.id)
			end
			if trait.sanatorium_trait then
				table.insert(g_SanatoriumTraits, trait.id)
			end
		end
		
		--Mark as 'hidden' trait
		if trait.hidden_on_start then
			g_HiddenTraits[trait.id] = true
		end
	end)
end

function OnMsg.NewMapLoaded()
	GenerateBuildingTraitLists()
end

function OnMsg.LoadGame()
	if not (g_SchoolTraits and g_SanatoriumTraits) then
		GenerateBuildingTraitLists()
	end
end

-- rare and none rare are changed after execution
function GetCompatibleTraits(compatible, nonerare, rare, category)
	if not next(rare) or not next(nonerare) then
		 nonerare, rare =  table.keys(g_NoneRareTraits),table.keys(g_RareTraits)
	end

	if not next(compatible) and category==nil then 
		return nonerare, rare 
	end
	if category=="Rare" then
		nonerare = {}
	elseif category=="Common" then
		rare = {}	
	end
	for idx, tbl in pairs({nonerare, rare}) do
		for i=#tbl, 1, -1 do 
			local name = tbl[i]
			local trait = TraitPresets[name]
			if category == "Rare" then
				if not trait.rare then
					table.remove(tbl, i)
				end
			elseif category~=nil and trait.group ~= category then
				table.remove(tbl,i)
			end
			
			if type(compatible) == "string" then
				if name==compatible or trait.incompatible[compatible] then
					table.remove(tbl,i) 
				end	
			elseif type(compatible) == "table" then
				for trait2,val in pairs(compatible) do				
					assert(type(trait2)=="string" and type(val)=="boolean")
					if name==trait2 or trait.incompatible[trait2] then
						table.remove(tbl,i) 
						break
					end
				end					
			end	
		end		
	end	
	return nonerare, rare
end

-- rare and none rare are changed after execution
function GetRandomTrait(compatible, nonerare, rare, category, base_only, rare_weight_mod)
	nonerare, rare = GetCompatibleTraits(compatible, nonerare, rare, category)
	rare_weight_mod = 100 + (rare_weight_mod or 0)
	
	local total_weights = 0
	for _, trait_id in ipairs(nonerare) do
		local trait  = TraitPresets[trait_id]
		if not g_HiddenTraits[trait_id] and (not base_only or trait.auto) and IsTraitAvailable(trait) then
			total_weights = total_weights + trait.weight
		end
	end
	
	for _, trait_id in ipairs(rare) do
		local trait  = TraitPresets[trait_id]
		if not g_HiddenTraits[trait_id] and (not base_only or trait.auto) and IsTraitAvailable(trait) then
			total_weights = total_weights + MulDivRound(trait.weight, rare_weight_mod, 100)
		end
	end
	
	local rand = Random(0, total_weights-1, "Traits")
	local w, found = 0, false
	for _, trait_id in ipairs(nonerare) do
		local trait  = TraitPresets[trait_id]
		if not g_HiddenTraits[trait_id] and (not base_only or trait.auto) and IsTraitAvailable(trait) then
			if rand < w + trait.weight then
				return trait_id
			end
			w = w +  trait.weight
		end
	end
	for _, trait_id in ipairs(rare) do
		local trait  = TraitPresets[trait_id]
		if not g_HiddenTraits[trait_id] and (not base_only or trait.auto) and IsTraitAvailable(trait) then
			local weight = MulDivRound(trait.weight, rare_weight_mod, 100)
			if rand < w + weight then
				return trait_id
			end
			w = w +  weight
		end	
	end
end

-- traits - list of trait ids ({trait1,trait2,trait3})
-- compatible_with table of traits from coonist ({trait_id=true. trait_id2=true})
-- exclude duplicated
function FilterCompatibleTraitsWith(traits, compatible_with)
	local compatible = {}
	for i=1, #traits do
		local trait_id =traits[i]
		local trait = TraitPresets[trait_id]
		local is_compatible = true
		if trait then
			for trait2,val in pairs(compatible_with) do
				if trait.incompatible[trait2] or trait_id == trait2 then
					is_compatible = false
					break
				end
			end
		end
		if is_compatible then
			compatible[#compatible+1] = trait_id
		end
	end	
	return compatible
end

function TraitFilterColonist(trait_filter, unit_traits)
	local match = 0
	for trait, value in pairs(trait_filter or empty_table) do
		if unit_traits[trait] then
			match = match + (value and 1 or -1000)
		end
	end
	return match
end

TraitFilterUnit = TraitFilterColonist --old fn. name (for savegame compatibility)

function GetTSortedTraits(group)
	local t = {}
	local presets_list = group and Presets.TraitPreset[group] or TraitPresets
	for i, trait in ipairs(presets_list) do
		if not g_HiddenTraits[trait.id] then
			table.insert(t, trait)
		end
	end
	TSort(t, "display_name")
	return t
end

-- a Guru only gives out traits from these categories
GuruTraitCategories = {
	Positive = true,
	Negative = true,
	other = true,
}

-- a Guru never gives out these traits
GuruTraitBlacklist = {
	Guru = true,
	Martianborn = true,
	Tourist = true,
	Clone = true,
	ChronicCondition = true,
	Founder = true,
	Android = true,
	Refugee = true,
}

function GuruDailyUpdate(guru)
	if not guru.dome then return end
	
	local trait_presets = TraitPresets
	local guru_traits = {}
	local guru_trait_categories, guru_trait_blacklist = GuruTraitCategories, GuruTraitBlacklist
	for trait_id in pairs(guru.traits) do
		local trait = trait_presets[trait_id]
		if trait and guru_trait_categories[trait.group] and not guru_trait_blacklist[trait_id] then
			guru_traits[#guru_traits+1] = trait_id
		end
	end
	if #guru_traits == 0 then return end
	
	local trait
	local colonists = guru.dome.labels.Colonist
	local n = #colonists
	local start_idx = guru:Random(n)+1
	for i=1,n do
		local colonist = colonists[ (start_idx+i)%n + 1]
		local colonist_traits = colonist.traits
		if not colonist_traits.Child then
			local ntraits = 0
			for trait_id in pairs(colonist_traits) do
				local trait = trait_presets[trait_id]
				if trait and guru_trait_categories[trait.group] then
					ntraits = ntraits + 1
				end
			end
			if ntraits < 3 then			
				local compatible = FilterCompatibleTraitsWith(guru_traits, colonist_traits)
				if #compatible>0 then
					colonist:AddTrait(table.rand(compatible))
					return
				end
			end
		end
	end
end

GlobalVar("g_StartVaccinating", false)
function InfectedDailyUpdate(colonist)
	if g_StartVaccinating then return end
	if not colonist.dome then return end
		
	local infection_chance = colonist:Random(100)
	if infection_chance < 30 then
		local trait
		local colonists = colonist.dome.labels.Colonist
		local n = #colonists
		local start_idx = colonist:Random(n)+1
		for i=1,n do
			local unit = colonists[ (start_idx+i)%n + 1]
			if not unit.traits.Infected then
				unit:AddTrait("Infected")
				return
			end
		end
	end
end

function OnMsg.Mystery8_BeginHealing()
	g_StartVaccinating = true
end

function OnMsg.TechResearched(tech_id, city)
	local morale = TraitPresets.Nerd.param*const.Scale.Stat
	local id = TraitPresets.Nerd.id
	local def = TechDef[tech_id]
	local mod_id = id..tech_id
	local display_text = T{3955, "<green><tech_name> researched! +<amount> (Nerd)</green>",tech_name = def.display_name}
	local nerds = {}
	for _, dome in ipairs(city.labels.Dome or empty_table) do
		for _, colonist in ipairs(dome.labels.Nerd or empty_table) do
			colonist:SetModifier("base_morale", mod_id, morale, 0, display_text)
			nerds[#nerds+1] = colonist
		end
	end
	if #nerds > 0 then
		CreateGameTimeThread( function()
			Sleep(3*const.DayDuration)
			for _, colonist in ipairs(nerds) do
				if IsValid(colonist) then
					colonist:SetModifier("base_morale", mod_id, 0, 0)
				end
			end
		end)
	end
	
	if tech_id == "NeuralEmpathy" then
		-- find some colonists to make them empath
		local list = city.labels.Colonist or empty_table
		local eligible = {}
		for i = 1, #list do
			local traits = list[i].traits
			local num_traits = 0 -- only counts traits of certain categories
			for id, _ in pairs(traits) do
				local trait = TraitPresets[id]
				local category = trait and trait.group
				if category == "Positive" or category == "Negative" or category == "other" then
					num_traits = num_traits + 1
				end
			end
			
			if num_traits <= def.param1 then
				eligible[#eligible + 1] = list[i]
			end
		end
		g_HiddenTraits["Empath"] = nil
		local num = city:Random(def.param2, def.param3)
		while num > 0 and #eligible > 0 do
			local unit, idx = city:TableRand(eligible)
			unit:AddTrait("Empath")
			table.remove(eligible, idx)
			num = num - 1
		end
	end
end

GlobalVar("TraitLocks", {})

--[[@@@
Locks a trait - it is not visible in interfaces and can not be added to colonists.

@function void Gameplay@LockTrait(string trait_name, string lock_reason)
@param string trait_name - internal unique trait name.
@param string lock_reason - the unique reason of the lock. Use it to unlock the trait. To unlock a trait all unique lock reasons must be removed.
]]
function LockTrait(trait_id, lock_reason)
	local locks = TraitLocks[trait_id] or {}
	TraitLocks[trait_id] = locks
	locks[lock_reason] = true
end

--[[@@@
	Removes a lock reason or  all lock reasons from a trait. If all lock reasons are removed, the trait is fully unlocked and is available for setting to colonist.

	@function void Gameplay@UnlockTrait(string trait_name[, string lock_reason])
	@param string trait_name - internal unique trait name.
	@param string lock_reason - lock reason that is locked with. In not specified all lock reasons are removed and the trait is fully unlocked.
]]
function UnlockTrait(trait_id, lock_reason)
	trait_id = trait_id or false
	if not lock_reason then
		TraitLocks[trait_id] = nil
	else
		local locks = TraitLocks[trait_id]
		if locks then
			locks[lock_reason] = nil
			if next(locks) == nil then
				TraitLocks[trait_id] = nil
			end
		end
	end
end

--[[@@@
	Tests trait lock state controlled by LockTrait/UnlockTrait functions.

	@function bool available Gameplay@IsTraitAvailable(string trait_name)
	@param string trait_name - internal unique trait name.
	@result bool available - true if the trait is unlocked.
]]

function IsTraitAvailable(trait, city)
	city = city or UICity
	local trait_id = type(trait) == "string" and trait or trait.id
	return not TraitLocks[trait_id]
end

DefineModItemPreset("TraitPreset", {
	properties = {
		{ id = "school_trait",     name = T(8627, "Is School Trait"),     editor = "bool", default = false, help = "If this trait will be added to the list of traits taught by the School." },
		{ id = "sanatorium_trait", name = T(8628, "Is Sanatorium Trait"), editor = "bool", default = false, help = "If this trait will be added to the list of traits cured by the Sanatorium." },
	},
	EditorName = "Trait",
})

------------------------------------------------------------

local function GetTraitCategoriesCombo()
	local items = {}
	for i, prop in ipairs(TraitsObject.properties) do
		items[#items + 1] = {
			text = prop.name,
			value = prop.id,
		}
	end
	return items
end

DefineClass.ModItemTrait = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ id = "name",        name = T(1000037, "Name"),         editor = "text" },
		{ id = "display_name",name = T(1000067, "Display Name"), editor = "text", translate = true, default = "" },		
		{ id = "category",    name = T(1000097, "Category"),     editor = "combo" , items = GetTraitCategoriesCombo , default = "" },
		{ id = "description", name = T(1000017, "Description"),  editor = "text", translate = true, default = "" },
		{ id = "display_icon",name = T(94, "Icon"),         editor = "browse",folder = {"UI/", "CommonAssets/UI/"}, object_update = true,  default = "" },
		{ id = "rare",        name = T(3940, "Rare"),         editor = "bool", default = false},
		{ id = "weight",      name = T(3941, "Rarity weight"),editor = "number", default = 300},
		{ id = "_incompatible",name = T(3942, "Incompatible"),editor = "text", default = "", help = "Comma separated traits this one is incompatible with (like Lazy and Workaholic)"},
		{ id = "auto",        name = T(3943, "Used in base auto generated"),  editor = "bool", default = true},
		{ id = "initial_filter", name = T(3944, "Initial Filter Down"),  editor = "bool", default = false},-- checked in rocket initial fileter down
		{ id = "initial_filter_up", name = T(10378, "Initial Filter Up"),  editor = "bool", default = false},-- checked in rocket initial fileter up
		{ id = "hidden_on_start", name = T(3945, "Hidden on start"),  editor = "bool", default = false},-- not shown/used before unlocked
		{ id = "show_in_traits_ui", name = T(3946, "Show in traits UI"),  editor = "bool", default = true},-- colonist infopanel and counted traits for ProjectMorpheus
		{ id = "dome_filter_only", name = T(6863, "Show in traits Dome filters UI but not in Applicants filters"),  editor = "bool", default = false},		
		{ id = "add_interest",    name = T(3947, "Add interest"),editor = "combo", default = "", items = function() return ServiceInterestsList end, },
		{ id = "remove_interest", name = T(3948, "Remove interest"),editor = "combo", default = "", items = function() return ServiceInterestsList end, },
		{ id = "param", name = T(3949, "Parameter"), editor = "number", default = 0 },
		{ id = "daily_update_func", name = T(3950, "Update every sol func(colonist, trait)"), editor = "func", params = "colonist, trait", default = false },
		{ id = "apply_func", name = T(3951, "Apply func(colonist, trait, init)"), editor = "func", params = "colonist, trait, init", default = false },
		{ id = "unapply_func", name = T(3952, "Remove func(colonist, trait)"), editor = "func", params = "colonist, trait", default = false },
		{ id = "modify_target", name = T(930, "Modifier target"), editor = "combo", items = { "", "self", "dome colonists" }, default = "" },
		{ id = "modify_trait", name = T(3953, "Target only Colonists with trait"), editor = "combo", items = DataInstanceCombo("Trait"), default = "" },
		{ id = "modify_property", name = T(931, "Modified property"), editor = "combo", items = function() return ClassModifiablePropsCombo(Colonist) end, default = "" },
		{ id = "modify_amount", name = T(932, "Modification amount"), editor = "number", default = 0,},
		{ id = "modify_percent", name = T(933, "Modification percent"), editor = "number", default = 0,},
		{ id = "infopanel_effect_text", name = T(3954, "Infopanel effect text"), editor = "text", translate = true, default = "" }
	},
	EditorMenubarName = "",
}

function ModItemTrait:OnModLoad()
	local mod = self.mod
	local new = ModItemTraitPreset:new{
		id = self.name,
		display_name = self.display_name,
		group = self.category,
		description = self.description,
		display_icon = self.display_icon,
		rare = self.rare,
		weight = self.weight,
		_incompatible = self._incompatible,
		auto = self.auto,
		initial_filter_up = self.initial_filter_up,
		hidden_on_start = self.hidden_on_start,
		show_in_traits_ui = self.show_in_traits_ui,
		dome_filter_only = self.dome_filter_only,
		add_interest = self.add_interest,
		remove_interest = self.remove_interest,
		param = self.param,
		daily_update_func = self.daily_update_func,
		apply_func = self.apply_func,
		unapply_func = self.unapply_func,
		modify_target = self.modify_target,
		modify_trait = self.modify_trait,
		modify_property = self.modify_property,
		modify_percent = self.modify_percent,
		infopanel_effect_text = self.infopanel_effect_text,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end
