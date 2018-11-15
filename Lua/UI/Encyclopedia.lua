EncyclopediaCategoryNames = {
	{value = "Buildings", text = T{3980, "Buildings"}},
	{value = "Units", text = T{3981, "Units"}},
	{value = "Deposits", text = T{3982, "Deposits"}},
	{value = "Disasters", text = T{3983, "Disasters"}},
	{value = "Anomalies", text = T{3984, "Anomalies"}},
}


function OpenEncyclopedia(encyclopedia_id)
	if GameState.gameplay then
		CreateRealTimeThread(function() WaitEncyclopedia(encyclopedia_id) end)
	end
end

function WaitEncyclopedia(encyclopedia_id, opened_from_menu)
	WaitDialog("Encyclopedia", nil, {encyclopedia_id = encyclopedia_id})
end

DefineClass.Encyclopedia = {
	__parents = {"XDialog"},
	InternalModes = "categories, items",
	HandleMouse = true,
}

function Encyclopedia:Init(parent, context)
	self.context = context or {}
	if parent == self.desktop then
		--layers
		XHideInGameInterfaceLayer:new({}, self)
		XPauseLayer:new({}, self)
		XCameraLockLayer:new({}, self)
	end
	--background image
	XImage:new({
		Dock = "box",
		Image = "UI/Encyclopedia Background.tga",
		ImageFit = "largest",
	}, self)
	--margins window
	local container = XWindow:new({
		Margins = box(60, 68, 0, 25),
	}, self)
	container.Open = function(self, ...)
		XWindow.Open(self, ...)
		self:SetMargins(GetSafeMargins(self:GetMargins()))
	end
	--title
	local ctrl = XTemplateSpawn("DialogTitleNew", container, self.context)
	ctrl:SetId("idTitle")
	ctrl:SetMargins(box(55, 0, 0, 0))
	ctrl:SetTitle(T{5473, "ENCYCLOPEDIA"})
	--action bar
	ctrl = XTemplateSpawn("ActionBarNew", container, self.context)
	ctrl:SetMargins(box(55, 0, 0, 0))
	--left column
	local window_left = XWindow:new({
		Dock = "left",
		Padding = box(0, 40, 0, 0),
	}, container)
	XList:new({
		Id = "idList",
		Margins = box(35, 0, 20, 0),
		BorderWidth = 0,
		MinWidth = 500,
		MaxWidth = 500,
		Clip = false,
		MouseScroll = true,
		Background = RGBA(0,0,0,0),
		FocusedBackground = RGBA(0,0,0,0),
		ShowPartialItems = false,
		UniformRowHeight = true,
		VScroll = "idScroll",
	}, window_left)
	ctrl = XTemplateSpawn("ScrollbarNew", window_left, self.context)
	ctrl:SetId("idScroll")
	ctrl:SetTarget("idList")
	--right description window
	local desc_window = XWindow:new({
		Id = "idDescrWindow",
		Padding = box(0, 48, 150, 0),
		LayoutMethod = "VList",
	}, container)
	desc_window:SetVisible(false)
	XText:new({
		Id = "idArticleTitle",
		Padding = box(18, 0, 0, 0),
		Dock = "top",
		TextStyle = "MediumHeader",
		Translate = true,
		HandleMouse = false,
	}, desc_window)
	--description image
	local win = XWindow:new({
		Padding = box(0,-10,0,5),
		Dock = "top",
	}, desc_window)
	XImage:new({
		Id = "idImage",
		Image = "UI/Encyclopedia/Concrete.tga",
		ImageFit = "smallest",
		FoldWhenHidden = true,
		Dock = "top",
		Padding = box(20,20,20,20),
		HAlign = "left",
		VAlign = "top",
		MaxHeight = 403,
	}, win)
	local scroll_area = XScrollArea:new({
		Id = "idDescrTextArea",
		IdNode = false,
		VScroll = "idArticleScroll",
		MouseWheelStep = 40,
	}, desc_window)
	ctrl = XTemplateSpawn("ScrollbarNew", desc_window, self.context)
	ctrl:SetId("idArticleScroll")
	ctrl:SetTarget("idDescrTextArea")
	ctrl:SetPadding(box(0, 0, 10, 0))
	XText:new({
		Id = "idDescription",
		TextStyle = "EncyclopediaArticleDescr",
		HandleMouse = false,
		Translate = true,
	}, scroll_area)
end

function Encyclopedia:Open(...)
	local enc_id = self.context.encyclopedia_id or ""
	local cat_id
	if enc_id ~= "" then
		local article
		ForEachPreset(EncyclopediaArticle, function(preset, list)
			if preset.title_id == enc_id then
				article = preset
			end
		end)
		cat_id = article and article.group
		cat_id = cat_id or BuildingTemplates[enc_id] and "Buildings"
		cat_id = cat_id or table.find(DataInstances.OnScreenHint, "name", enc_id) and "Hints"
	end
	XDialog.Open(self, ...)
	self:SetMode(cat_id and "items" or "categories", {category_id = cat_id})
end

function Encyclopedia:OnDialogModeChange(mode, dialog)
	self:RespawnListContent()
	self:RebuildActionbar()
	if mode == "categories" then
		self.idTitle:SetSubtitle(T{1117, "CATEGORIES"})
	elseif mode == "items" then
		self.idTitle:SetSubtitle(self.mode_param.title_text_upper)
	end
end

function Encyclopedia:RespawnListContent()
	local list = self.idList
	list:Clear()
	local items = self:GetListItems()
	local i = 0
	for k, v in ipairs(items or empty_table) do
		i = i + 1
		local is_category = v.category_id and v.title_id == ""
		local button = XTextButton:new({
			Translate = true,
			Background = RGBA(0,0,0,0),
			FocusedBackground = RGBA(0,0,0,0),
			RolloverBackground = RGBA(0,0,0,0),
			PressedBackground = RGBA(0,0,0,0),
			MouseCursor = "UI/Cursors/Rollover.tga",
			FXMouseIn = "MenuItemHover",
			FXPress = "MenuItemClick",
			FXPressDisabled = "UIDisabledButtonPressed",
			TextStyle = "ListItem2",
			FocusOrder = point(0,i),
			OnPress = function(button, gamepad)
				local n = button.FocusOrder:y()
				if is_category then
					self:SetMode("items", {category_id = v.category_id, title_text_upper = v.title_text_upper})
					self.context.encyclopedia_id = v.category_id
				elseif not gamepad and (not list.selection or list.selection[1] ~= n) then
					list:SetSelection(n)
				end
			end,
			OnShortcut = function(button, shortcut, source)
				if shortcut == "Enter" or shortcut == "Space" or shortcut == "ButtonA" then
					button:Press(false)
					return "break"
				end
			end,
		}, list)
		button:SetText(v.title_text)
		if is_category then
			XTextButton:new({
				Id = "idArrow",
				Margins = box(-24,0,5,0),
				Dock = "left",
				VAlign = "center",
				HandleKeyboard = false,
				HandleMouse = false,
				TextStyle = "ListItem2",
				Image = "UI/Common/submenu.tga",
				ColumnsUse = "abaa",
			}, button)
		end
		local rollover_image = XImage:new({
			Id = "idRollover",
			ZOrder = 0,
			Margins = box(-15, -10, 0, -10),
			Dock = "box",
			HAlign = "left",
			Image = "UI/CommonNew/pg_selection.tga",
		}, button)
		rollover_image:SetVisible(false)
		button.SetSelected = function(button, selected)
			button:SetFocus(selected)
			if selected then
				self:SetDescription(v)
			end
		end
		button.OnSetFocus = function(button, ...)
			XCreateRolloverWindow(button, true)
			XTextButton.OnSetFocus(button, ...)
		end
		if is_category then
			button.OnSetRollover = function(button, rollover)
				XTextButton.OnSetRollover(button, rollover)
				button.idArrow:OnSetRollover(rollover)
				local n = button.FocusOrder:y()
				if rollover and not terminal.desktop.inactive and (not list.selection or list.selection[1] ~= n) then
					list:SetSelection(n)
					self:SetDescription(v)
				end
			end
		end
	end
	local item, idx
	local enc_id = self.context.encyclopedia_id or ""
	if enc_id ~= "" then
		item, idx = table.find_value(items, "id", enc_id)
	end
	if item then
		list:SetSelection(idx)
		self.context.encyclopedia_id = item.category_id
	else
		list:SetInitialSelection()
	end
end

function Encyclopedia:RebuildActionbar()
	--delete old actions
	local actions = self.actions
	for i = #actions, 1, -1 do
		local action = actions[i]
		if action.ActionToolbar == "ActionBar" then
			actions[i]:delete()
			table.remove(actions, i)
		end
	end
	local close_effect = self.parent ~= self.desktop and "mode" or "close"
	if self.mode_param and self.mode_param.category_id then
		XAction:new({
			ActionName = T{4254, "BACK"},
			ActionId = "back",
			ActionToolbar = "ActionBar",
			ActionShortcut = "Escape",
			ActionGamepad = "ButtonB",
			OnActionEffect = "mode",
			OnActionParam = "categories",
		}, self)
		XAction:new({
			ActionName = T{4523, "CLOSE"},
			ActionId = "close",
			ActionToolbar = "ActionBar",
			ActionGamepad = "ButtonX",
			OnActionEffect = close_effect,
		}, self)
	else
		XAction:new({
			ActionName = T{4523, "CLOSE"},
			ActionId = "close",
			ActionToolbar = "ActionBar",
			ActionShortcut = "Escape",
			ActionGamepad = "ButtonB",
			OnActionEffect = close_effect,
		}, self)
	end
	XAction:new({
		ActionId = "actionScrollAreaDown",
		ActionGamepad = "RightThumbDown",
		OnAction = function(self, host, source)
			if host.idDescrTextArea:GetVisible() then
				return host.idDescrTextArea:OnMouseWheelBack()
			end
		end,
	}, self)
	XAction:new({
		ActionId = "actionScrollAreaUp",
		ActionGamepad = "RightThumbUp",
		OnAction = function(self, host, source)
			if host.idDescrTextArea:GetVisible() then
				return host.idDescrTextArea:OnMouseWheelForward()
			end
		end,
	}, self)
	self:UpdateActionViews(self.idActionBar)
end

function Encyclopedia:SetDescription(article)
	self.idDescrTextArea:ScrollTo(0, 0)
	self.idArticleTitle:SetText(article.title_text)
	local has_image = article.image and article.image ~= ""
	if has_image then
		self.idImage:SetImage(article.image)
	end
	self.idImage:SetVisible(has_image)
	self.idDescription:SetText(article.text)
	self.idDescrWindow:SetVisible(true)
end

function Encyclopedia:GetListItems()
	local items = {}
	local param = self.mode_param
	local cat_id = param and param.category_id
	if cat_id then
		if cat_id == "Buildings" then
			param.title_text_upper = T{1152, "BUILDINGS"}
			local buildings = table.values(BuildingTemplates or empty_table)
			TSort(buildings, "display_name")
			for _, template in ipairs(buildings) do
				if template.encyclopedia_id == template.id then
					local construction_cost = GetConstructionDescription(template, nil, true)
					local class = g_Classes[template.template_class]
					local description = class and class.GetIPDescription(template) or T{template.description, template}
					if construction_cost~="" then
						description = description..Untranslated("\n\n")..construction_cost
					end
					local text = template.encyclopedia_text
					if text ~= "" then
						description = description .. Untranslated("\n\n") .. text
					end
					local image = template.encyclopedia_image ~= "" and template.encyclopedia_image or "UI/Common/Placeholder.tga"
					items[#items + 1] = {
						id = template.id,
						title_text = template.display_name,
						text = description,
						image = image,
						category_id = cat_id,
					}
				end	
			end
		elseif cat_id == "Hints" then
			param.title_text_upper = T{5402, "HINTS"}
			local hints = DataInstances.OnScreenHint
			local tutorial = g_Tutorial and g_Tutorial.Map or "none"
			local check_if_passed = (tutorial ~= "none")
			for k, v in ipairs(hints) do
				if v.tutorial == tutorial then
					if not check_if_passed or g_ActiveHints[v.name] then
						local body_text = (GetUIStyleGamepad() and v.gamepad_text ~= "") and v.gamepad_text or v.text
						body_text = T{body_text, g_Classes[v.name]}
						local text = (v.voiced_text ~= "") and (v.voiced_text.."\n\n"..body_text) or body_text
						items[#items + 1] = {
							id = v.name,
							title_text = v.title,
							text = text,
							image = v.encyclopedia_image ~= "" and v.encyclopedia_image or "UI/Encyclopedia/Hints.tga",
							category_id = cat_id,
						}
					end
				end
			end
		else
			ForEachPreset(EncyclopediaArticle, function(article, list)
				if article.group == cat_id then
					if article.title_id and article.title_id ~= "" then
						items[#items + 1] = {
							id = article.title_id,
							title_text = article.title_text,
							text = article.text,
							image = article.image,
							category_id = cat_id,
						}
					else
						param.title_text_upper = article.title_text_upper
					end
				end
			end)
		end
	else
		--categories
		ForEachPreset(EncyclopediaArticle, function(article, list)
			if article.title_id == "" or not article.title_id then
				items[#items + 1] = {
					id = article.group,
					category_id = article.group,
					title_id = article.title_id or "",
					title_text = article.title_text,
					title_text_upper = article.title_text_upper,
					text = article.text,
					image = article.image,
				}
			end
		end)
	end
	return items
end