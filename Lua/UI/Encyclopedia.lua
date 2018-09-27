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
		Margins = box(0, 30, 100, 50),
	}, self)
	container.Open = function(self, ...)
		XWindow.Open(self, ...)
		self:SetMargins(GetSafeMargins(self:GetMargins()))
	end
	--title
	XText:new({
		Id = "idTitle",
		HAlign = "right",
		Dock = "top",
		TextFont = "PGTags",
		Translate = true,
		HandleMouse = false,
		TextColor = RGBA(119, 198, 255, 255),
	}, container)
	--action bar
	XActionBar:new({
		MinWidth = 300,
	}, container)
	--right column
	local window_right = XWindow:new({
		Dock = "right",
	}, container)
	XImage:new({
		Image = "UI/Common/pm_pad_small.tga",
		Margins = box(0,2,-40,-70),
		Dock = "top",
	}, window_right)
	XList:new({
		Id = "idList",
		BorderWidth = 0,
		MinWidth = 500,
		MaxWidth = 500,
		LayoutVSpacing = 12,
		Clip = false,
		MouseScroll = true,
		Background = RGBA(0,0,0,0),
		FocusedBackground = RGBA(0,0,0,0),
		ShowPartialItems = false,
		UniformRowHeight = true,
		VScroll = "idScroll",
	}, window_right)
	local scroll = XScrollThumb:new({
		Id = "idScroll",
		ZOrder = 10,
		Padding = box(5, 0, 5, 0),
		Dock = "right",
		MinWidth = 18,
		MaxWidth = 18,
		Visible = false,
		FoldWhenHidden = false,
		MouseCursor = "UI/Cursors/Rollover.tga",
		FullPageAtEnd = true,
		SnapToItems = true,
		AutoHide = true,
		MinThumbSize = 30,
		FixedSizeThumb = false,
		Margins = box(0,5,10,25),
		Target = "idList",
	}, window_right)
	XFrame:new({
		Dock = "box",
		Image = "UI/Common/scrollbar_line.tga",
		FrameBox = box(0, 5, 0, 5),
	}, scroll)
	XFrame:new({
		Id = "idThumb",
		Image = "UI/Common/scrollbar.tga",
		ImageScale = point(400, 400),
		FrameBox = box(0, 10, 0, 10),
		SqueezeX = false,
	}, scroll)
	--left upper line
	local left_line = XImage:new({
		Image = "UI/Common/bm_pad.tga",
		ImageFit = "stretch-x",
		Margins = box(-250,0,-250,-102),
		Dock = "top",
	}, container)
	left_line:SetTransparency(150)
	--left description window
	local desc_window = XWindow:new({
		Id = "idDescrWindow",
		Margins = box(0,0,0,-60),
		Padding = box(90, 0, 150, 0),
		LayoutMethod = "VList",
	}, container)
	desc_window:SetVisible(false)
	XText:new({
		Id = "idArticleTitle",
		Dock = "top",
		HAlign = "center",
		Padding = box(62,2,2,2),
		TextFont = "EncyclopediaArticleTitle",
		Translate = true,
		HandleMouse = false,
		TextColor = RGBA(255, 255, 255, 255),
		ShadowSize = 2,
		ShadowColor = RGBA(0, 0, 0, 255),
	}, desc_window)
	--description image
	local win = XWindow:new({
		Padding = box(60,0,0,0),
		Dock = "top",
	}, desc_window)
	local shadow_frame = XFrame:new({
		Id = "idShadowFrame",
		IdNode = false,
		FoldWhenHidden = true,
		Padding = box(20,20,20,20),
		HAlign = "center",
		VAlign = "top",
		MaxHeight = 403,
		Image = "UI/Common/mod_image_shadow.tga",
		Background = RGBA(48, 117, 255, 255),
		FrameBox = box(20,20,20,20),
	}, win)
	XImage:new({
		Id = "idImage",
		Image = "UI/Encyclopedia/Concrete.tga",
		ImageFit = "smallest",
	}, shadow_frame)
	shadow_frame:SetVisible(false)
	local scroll_area = XScrollArea:new({
		Id = "idDescrTextArea",
		Margins = box(0,20,0,0),
		IdNode = false,
		VScroll = "idArticleScroll",
		MouseWheelStep = 40,
	}, desc_window)
	local article_scroll = XScrollThumb:new({
		Id = "idArticleScroll",
		ZOrder = 10,
		Padding = box(5, 0, 5, 0),
		Dock = "left",
		MinWidth = 18,
		MaxWidth = 18,
		Visible = false,
		FoldWhenHidden = false,
		MouseCursor = "UI/Cursors/Rollover.tga",
		FullPageAtEnd = true,
		SnapToItems = true,
		AutoHide = true,
		MinThumbSize = 30,
		FixedSizeThumb = false,
		Margins = box(0,5,5,5),
		Target = "idDescrTextArea",
	}, scroll_area)
	XFrame:new({
		Dock = "box",
		Image = "UI/Common/scrollbar_line.tga",
		FrameBox = box(0, 5, 0, 5),
	}, article_scroll)
	XFrame:new({
		Id = "idThumb",
		Image = "UI/Common/scrollbar.tga",
		ImageScale = point(400, 400),
		FrameBox = box(0, 10, 0, 10),
		SqueezeX = false,
	}, article_scroll)
	XText:new({
		Id = "idDescription",
		TextFont = "EncyclopediaArticleDescr",
		TextColor = RGBA(240, 235, 198, 255),
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
		self.idTitle:SetText(T{5473, "ENCYCLOPEDIA"})
	elseif mode == "items" then
		self.idTitle:SetText(self.mode_param.title_text_upper)
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
			Padding = box(0,2,0,2),
			HAlign = "right",
			Background = RGBA(0,0,0,0),
			FocusedBackground = RGBA(0,0,0,0),
			RolloverBackground = RGBA(0,0,0,0),
			PressedBackground = RGBA(0,0,0,0),
			MouseCursor = "UI/Cursors/Rollover.tga",
			FXMouseIn = "MenuItemHover",
			FXPress = "MenuItemClick",
			FXPressDisabled = "UIDisabledButtonPressed",
			TextFont = "PGListItem",
			TextColor = RGBA(221, 215, 170, 255),
			RolloverTextColor = RGBA(255,255,255,255),
			DisabledTextColor = RGBA(94,94,94,255),
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
				Margins = box(0,0,5,0),
				Dock = "left",
				VAlign = "center",
				HandleKeyboard = false,
				HandleMouse = false,
				Image = "UI/Common/submenu.tga",
				ColumnsUse = "abaa",
			}, button)
		end
		local rollover_image = XImage:new({
			Id = "idRollover",
			ZOrder = 0,
			Margins = box(-60,0,-60,-6),
			Dock = "box",
			Image = "UI/Common/bm_buildings_pad.tga",
			ImageFit = "stretch",
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
	self:UpdateActionViews(self.idActionBar)
end

function Encyclopedia:SetDescription(article)
	self.idDescrTextArea:ScrollTo(0, 0)
	self.idArticleTitle:SetText(article.title_text)
	local has_image = article.image and article.image ~= ""
	if has_image then
		self.idImage:SetImage(article.image)
	end
	self.idShadowFrame:SetVisible(has_image)
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