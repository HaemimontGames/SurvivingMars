-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipResourcePile",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
		'Description', T(10, --[[XTemplate ipResourcePile Description]] "<Description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "priority",
			'__context_of_kind', "BlackCubeStockpileBase",
			'__template', "InfopanelButton",
			'RolloverText', T(370449987367, --[[XTemplate ipResourcePile RolloverText]] "Priority affects how often this building is serviced by Drones as well as its share of Power and life support. Notifications are not shown for buildings with low priority.<newline><newline>Current priority: <em><UIPriority></em>"),
			'RolloverTitle', T(369, --[[XTemplate ipResourcePile RolloverTitle]] "Change Priority"),
			'RolloverHint', T(577516035564, --[[XTemplate ipResourcePile RolloverHint]] "<left><left_click> Increase priority<right><right_click> Decrease priority"),
			'RolloverHintGamepad', T(870954837374, --[[XTemplate ipResourcePile RolloverHintGamepad]] "<left><ButtonA> Increase priority<right><ButtonX> Decrease priority"),
			'FoldWhenHidden', true,
			'OnContextUpdate', function (self, context, ...)
if context.priority == 1 then
	self:SetIcon("UI/Icons/IPButtons/normal_priority.tga")
elseif context.priority == 2 then
	self:SetIcon("UI/Icons/IPButtons/high_priority.tga")
else
	self:SetIcon("UI/Icons/IPButtons/urgent_priority.tga")
end

	self:SetVisible(UICity.mystery and UICity.mystery.class == "BlackCubeMystery" and UICity.mystery.can_destroy_cubes)
end,
			'OnPressParam', "TogglePriority",
			'AltPress', true,
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "BlackCubeStockpileBase",
			'__condition', function (parent, context) return UICity.mystery and UICity.mystery_id=="BlackCubeMystery" and UICity.mystery.can_destroy_cubes end,
			'__template', "InfopanelButton",
			'RolloverHintGamepad', T(7657, --[[XTemplate ipResourcePile RolloverHintGamepad]] "<ButtonY> Activate"),
			'OnContextUpdate', function (self, context, ...)
self:SetIcon(context.is_being_destroyed and "UI/Icons/IPButtons/cancel.tga" or "UI/Icons/IPButtons/demolition.tga")
if context.is_being_destroyed then
	self:SetRolloverTitle(T(6764, "Cancel"))
	self:SetRolloverText(T(699, "Cancel demolition."))
else
	self:SetRolloverTitle(T(697, "Destroy"))
	self:SetRolloverText(T(698, "Destroy this pile of cubes."))
end
end,
			'OnPress', function (self, gamepad)
self.context:Destroy()
ObjModified(self.context)
end,
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
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(not IsKindOf(context, "BlackCubeStockpileBase") or UICity.mystery.can_destroy_cubes == true )
end,
			'Title', T(489, --[[XTemplate ipResourcePile Title]] "Available resources"),
			'Icon', "UI/Icons/Sections/deposit.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(3674, --[[XTemplate ipResourcePile Text]] "<resource(resource)><right><resource(StoredAmount,resource)>"),
			}),
			}),
		}),
})

