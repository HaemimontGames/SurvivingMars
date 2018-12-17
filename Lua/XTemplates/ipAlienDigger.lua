-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipAlienDigger",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "AlienDigger",
		'__template', "Infopanel",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__condition', function (parent, context) return UICity.mystery.can_destroy_diggers end,
			'__template', "InfopanelButton",
			'OnContextUpdate', function (self, context, ...)
if context.is_being_destroyed then
	self:SetIcon("UI/Icons/IPButtons/cancel.tga")
	self:SetRolloverTitle(T(1176, "Cancel Destroy"))
	self:SetRolloverText(T(1178, "Cancel the order to destroy the alien Dredger."))
else
	self:SetIcon("UI/Icons/IPButtons/demolition.tga")
	self:SetRolloverTitle(T(1175, "Destroy"))
	self:SetRolloverText(T(1177, "Destroy this Dredger by sending a Drone to overload the fuel ignition systems."))
end
end,
			'OnPressParam', "ToggleDestroyFromUI",
		}),
		}),
})

