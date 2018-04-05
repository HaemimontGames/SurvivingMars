DefineClass.XCreditsWindow = {
	__parents = { "XScrollArea" },
	paused = false,
	time_step = 100, 
	Clip = "self",
	Background  = RGBA(0, 0, 0, 58),
	Margins = box(0, 0, 0, -200),
	ChildrenHandleMouse =  false,
	VScroll =  "idScrollCredits",
}

function XCreditsWindow:Init()
	XText:new({
		Id = "idCredits",
		HAlign =  "center",
		ChildrenHandleMouse =  false,
		TextFont = "UICredits",
		TextColor =  RGBA(250, 243, 204, 255),
		ShadowColor = RGBA(74,58,32,255),
		TextHAlign = "center",
	}, self)
	XScroll:new({
		Id = "idScrollCredits",
	}, self)
	self:SetTextData()
	self:MoveThread()	
	self:SetFocus()
end

function XCreditsWindow:SetTextData()	
	local texts = {}
	local lang = GetLanguage()
	local voice_lang = GetVoiceLanguage()
	for i = 1, #CreditContents do
		local section = CreditContents[i]
		
		if (not section.platform or Platform[section.platform])
			and (not section.language or section.language == lang)
			and (not section.voice_language or section.voice_language == voice_lang)
		then
			if section.company_name then
				texts[#texts + 1] = _InternalTranslate("<font UICreditsCompanyName>" .. section.company_name .. "</font>")
				texts[#texts + 1] = "\n\n\n\n\n\n\n\n\n\n\n\n\n"
			end
			for _, text in ipairs(section) do
				local translated = _InternalTranslate(text)
				if translated and translated ~= "" and translated ~= "-" then
					texts[#texts + 1] = translated
					texts[#texts + 1] = "\n\n\n\n\n\n\n\n\n\n\n\n\n"
				end
			end
			if section.footer then
				texts[#texts + 1] = _InternalTranslate(section.footer)
				texts[#texts + 1] = "\n\n\n\n\n\n\n\n\n\n\n\n\n"
			end
			texts[#texts + 1] = "\n\n\n\n\n\n\n\n"
		end
	end
	self.idCredits:SetText(table.concat(texts))
end

function XCreditsWindow:MoveThread()	
	self:CreateThread("scroll", function()
		local text_ctrl = self.idCredits
		local height = text_ctrl.text_height
		local tStart = GetPreciseTicks()
		local screeny = UIL.GetScreenSize():y()
		local per_second = screeny * 60 / 1000
		self:ScrollTo(0, -screeny)
		local pos = -screeny
		while pos < height do
			if self.paused then
				while self.paused do
					Sleep(self.time_step)
					tStart = tStart + self.time_step					
				end
				tStart = tStart - self.time_step
			end
			pos = -screeny + (GetPreciseTicks() - tStart) * per_second / 1000
			self:ScrollTo(0, pos)
			text_ctrl:AddInterpolation{
				id = "pos",
				type = const.intRect,
				duration = 2*self.time_step,
				startRect = text_ctrl.box,
				endRect = Offset(text_ctrl.box, point(0, -per_second *2*self.time_step / 1000)),
			}
			Sleep(self.time_step)
		end
		SetBackDialogMode(self.parent)
	end)
end

function XCreditsWindow:OnMouseButtonUp(pt, button)
	if button == "L" then
		self.paused = not self.paused
		return "break"
	end
	if button == "R" then
		SetBackDialogMode(self.parent)
		return "break"
	end
end

function XCreditsWindow:OnShortcut(shortcut, source)
	if shortcut == "Space" or shortcut == "ButtonA" then
		self.paused = not self.paused
		return "break"
	elseif  shortcut == "Escape" or shortcut == "ButtonB" then
		SetBackDialogMode(self.parent)
		return "break"
	end
end
