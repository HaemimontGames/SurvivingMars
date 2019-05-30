-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customStirlingGenerator",
	PlaceObj('XTemplateTemplate', {
		'comment', "open/close",
		'__context_of_kind', "StirlingGenerator",
		'__template', "InfopanelButton",
		'RolloverText', T(323140771762, --[[XTemplate customStirlingGenerator RolloverText]] "Opening the generator increases Power produced but leaves it vulnerable to dust contamination.<newline><newline>Current status: <em><UIOpenStatus></em>"),
		'RolloverTitle', T(962425882475, --[[XTemplate customStirlingGenerator RolloverTitle]] "Open/Close"),
		'OnContextUpdate', function (self, context, ...)
			self:SetEnabled(not context:RepairNeeded() and (context:IsOpened() or context:CanBeOpened()))
			if context:IsOpened() then
				self:SetIcon("UI/Icons/IPButtons/open.tga")
				self:SetRolloverHint(T(7648, "<left_click> Close <newline><em>Ctrl + <left_click></em> Close all <display_name_pl>"))
				self:SetRolloverHintGamepad(T(7649, "<ButtonA> Close <newline><ButtonX> Close all <display_name_pl>"))
			else
				self:SetIcon("UI/Icons/IPButtons/close.tga")
				self:SetRolloverHint(T(10879, "<left_click> Open <newline><em>Ctrl + <left_click></em> Open all <display_name_pl>"))
				self:SetRolloverHintGamepad(T(7651, "<ButtonA> Open <newline><ButtonX> Open all <display_name_pl>"))	
			end
		end,
		'OnPressParam', "ToggleOpenedState",
		'OnPress', function (self, gamepad)
			self.context:ToggleOpenedState(not gamepad and IsMassUIModifierPressed())
		end,
		'AltPress', true,
		'OnAltPress', function (self, gamepad)
			if gamepad then
				self.context:ToggleOpenedState(true)
			end
		end,
		'Icon', "UI/Icons/IPButtons/open.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "StirlingGenerator",
		'__template', "InfopanelSection",
		'RolloverText', T(441, --[[XTemplate customStirlingGenerator RolloverText]] "Stirling Generators produce more Power when opened."),
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(not context:RepairNeeded() and not context:IsOpened() and context:CanBeOpened())
		end,
		'Title', T(277, --[[XTemplate customStirlingGenerator Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(447, --[[XTemplate customStirlingGenerator Text]] "Will produce <power(AdditionalProduction)> more Power if opened"),
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "StirlingGenerator",
		'__template', "InfopanelSection",
		'RolloverText', T(10450, --[[XTemplate customStirlingGenerator RolloverText]] "Stirling Generators outside Domes cannot be opened during Dust Storms."),
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(not context:IsOpened() and not context:CanBeOpened())
		end,
		'Title', T(277, --[[XTemplate customStirlingGenerator Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(10451, --[[XTemplate customStirlingGenerator Text]] "Cannot be opened during Dust Storms if placed outside."),
		}),
		}),
})

