-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipPassage",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Passage",
		'__template', "Infopanel",
	}, {
		PlaceObj('XTemplateGroup', {
			'comment', "-- construction",
			'__context', function (parent, context) return context and #context.elements_under_construction>0  and context.elements_under_construction[1] end,
			'__condition', function (parent, context) return context end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "sectionConstructionSite",
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "priority",
				'__context', function (parent, context) return context:HasMember("construction_group") and context.construction_group and context.construction_group[1] or context end,
				'__condition', function (parent, context) return context.prio_button end,
				'__template', "InfopanelButton",
				'RolloverText', T(370449987367, --[[XTemplate ipPassage RolloverText]] "Priority affects how often this building is serviced by Drones as well as its share of Power and life support. Notifications are not shown for buildings with low priority.<newline><newline>Current priority: <em><UIPriority></em>"),
				'RolloverTitle', T(369, --[[XTemplate ipPassage RolloverTitle]] "Change Priority"),
				'RolloverHint', T(7658, --[[XTemplate ipPassage RolloverHint]] "<left><left_click> Increase priority<right><right_click> Decrease priority<newline><center><em>Ctrl + <left_click></em> Change priority of all <display_name_pl>"),
				'RolloverHintGamepad', T(7659, --[[XTemplate ipPassage RolloverHintGamepad]] "<ButtonA> Change priority<newline><ButtonX> Change priority of all <display_name_pl>"),
				'OnContextUpdate', function (self, context, ...)
if context.priority == 1 then
	self:SetIcon("UI/Icons/IPButtons/normal_priority.tga")
elseif context.priority == 2 then
	self:SetIcon("UI/Icons/IPButtons/high_priority.tga")
else
	self:SetIcon("UI/Icons/IPButtons/urgent_priority.tga")
end
end,
				'OnPress', function (self, gamepad)
PlayFX("UIChangePriority")
self.context:TogglePriority(1, not gamepad and IsMassUIModifierPressed())
ObjModified(self.context)
end,
				'AltPress', true,
				'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:TogglePriority(1, true)
else
	self.context:TogglePriority(-1, IsMassUIModifierPressed())
end
ObjModified(self.context)
end,
				'Translate', true,
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "on/off",
				'__template', "InfopanelButton",
				'RolloverText', T(382329017655, --[[XTemplate ipPassage RolloverText]] "Buildings that are turned off do not function and never consume Power or resources.<newline><newline>Current status: <em><UIWorkingStatus></em>"),
				'RolloverDisabledText', T(635932171778, --[[XTemplate ipPassage RolloverDisabledText]] "This building is currently disabled"),
				'RolloverTitle', T(627191661712, --[[XTemplate ipPassage RolloverTitle]] "Turn On/Off"),
				'RolloverHint', T(238148642034, --[[XTemplate ipPassage RolloverHint]] "<left_click> Activate <newline><em>Ctrl + <left_click></em> Activate for all <display_name_pl>"),
				'RolloverHintGamepad', T(919224409562, --[[XTemplate ipPassage RolloverHintGamepad]] "<ButtonA> Activate <newline><ButtonX> Activate for all <display_name_pl>"),
				'OnPressParam', "ToggleWorking",
				'OnPress', function (self, gamepad)
self.context:ToggleWorking(not gamepad and IsMassUIModifierPressed())
ObjModified(self.context)
end,
				'AltPress', true,
				'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleWorking(true)
	ObjModified(self.context)
end
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWarning",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "Demolishable",
			'__condition', function (parent, context) return context:ShouldShowDemolishButton() end,
			'__template', "InfopanelButton",
			'RolloverTitle', T(3973, --[[XTemplate ipPassage RolloverTitle]] "Salvage"),
			'RolloverHintGamepad', T(7657, --[[XTemplate ipPassage RolloverHintGamepad]] "<ButtonY> Activate"),
			'OnContextUpdate', function (self, context, ...)
local refund = context:GetRefundResources() or empty_table
local rollover = T(7822, "Destroy this building.")
if #refund > 0 then
	rollover = rollover .. "<newline><newline>" .. T(7823, "<UIRefundRes> will be refunded upon salvage.")
end
self:SetRolloverText(rollover)
context:ToggleDemolish_Update(self)
end,
			'OnPressParam', "ToggleDemolish",
			'Icon', "UI/Icons/IPButtons/salvage_1.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonDown(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonDown(false)
elseif button == "ButtonX" then
	return self:OnButtonDown(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonUp(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonUp(false)
elseif button == "ButtonX" then
	return self:OnButtonUp(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

