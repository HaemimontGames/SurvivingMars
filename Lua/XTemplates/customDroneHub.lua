-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customDroneHub",
	PlaceObj('XTemplateTemplate', {
		'comment', "build drone",
		'__condition', function (parent, context) return IsKindOf(context, "DroneHub") end,
		'__template', "InfopanelButton",
		'RolloverText', T(8460, --[[XTemplate customDroneHub RolloverText]] "Unpack an existing Drone Prefab to build a new Drone. Drone Prefabs can be created from existing Drones or in a Drone Assembler (requires research). This action can be used to quickly reassign Drones between controllers.<newline><newline>Available Drone Prefabs: <drone(available_drone_prefabs)>"),
		'RolloverTitle', T(349, --[[XTemplate customDroneHub RolloverTitle]] "Unpack Drone"),
		'RolloverHint', T(8461, --[[XTemplate customDroneHub RolloverHint]] "<left_click> Unpack Drone <em>Ctrl + <left_click></em> Unpack five Drones"),
		'RolloverHintGamepad', T(8462, --[[XTemplate customDroneHub RolloverHintGamepad]] "<ButtonA> Unpack Drone <ButtonX> Unpack five Drones"),
		'OnContextUpdate', function (self, context, ...)
self:SetEnabled(UICity.drone_prefabs > 0)
end,
		'OnPressParam', "UseDronePrefab",
		'OnPress', function (self, gamepad)
	self.context:UseDronePrefab(not gamepad and IsMassUIModifierPressed())
end,
		'AltPress', true,
		'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:UseDronePrefab(true)
end
end,
		'Icon', "UI/Icons/IPButtons/drone_assemble.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'comment', "convert drone to drone prefab",
		'__condition', function (parent, context) return IsKindOf(context, "DroneHub") end,
		'__template', "InfopanelButton",
		'RolloverText', T(8665, --[[XTemplate customDroneHub RolloverText]] "Recalls a Drone and packs it into a Drone Prefab. Can be used to reassign Drones between controllers."),
		'RolloverDisabledText', T(8666, --[[XTemplate customDroneHub RolloverDisabledText]] "No available Drones."),
		'RolloverTitle', T(8667, --[[XTemplate customDroneHub RolloverTitle]] "Pack Drone for Reassignment"),
		'RolloverHint', T(8668, --[[XTemplate customDroneHub RolloverHint]] "<left_click> Pack Drone for reassignment <em>Ctrl + <left_click></em> Pack five Drones"),
		'RolloverHintGamepad', T(8669, --[[XTemplate customDroneHub RolloverHintGamepad]] "<ButtonA> Pack Drone for reassignment <ButtonX> Pack five Drones"),
		'OnContextUpdate', function (self, context, ...)
self:SetEnabled(not not context:FindDroneToConvertToPrefab())
end,
		'OnPressParam', "ConvertDroneToPrefab",
		'OnPress', function (self, gamepad)
	self.context:ConvertDroneToPrefab(not gamepad and IsMassUIModifierPressed())
end,
		'AltPress', true,
		'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ConvertDroneToPrefab(true)
end
end,
		'Icon', "UI/Icons/IPButtons/drone_dismantle.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "DroneHub",
		'__template', "InfopanelSection",
		'RolloverText', T(359011926905, --[[XTemplate customDroneHub RolloverText]] "<UISectionDroneHubRollover>"),
		'RolloverTitle', T(167050805716, --[[XTemplate customDroneHub RolloverTitle]] "Drones Status"),
		'Title', T(732959546527, --[[XTemplate customDroneHub Title]] "Drones<right><drone(DronesCount,MaxDronesCount)>"),
		'Icon', "UI/Icons/Sections/drone.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(935141416350, --[[XTemplate customDroneHub Text]] "<DronesStatusText>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'FoldWhenHidden', true,
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.total_requested_drones > 0)
XText.OnContextUpdate(self, context, ...)
end,
			'Text', T(8463, --[[XTemplate customDroneHub Text]] "<OrderedDronesCount>"),
		}),
		}),
})

