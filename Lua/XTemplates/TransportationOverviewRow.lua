-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "TransportationOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverHint', T(115984499466, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click><left_click> Select"),
		'RolloverHintGamepad', T(764097870353, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Select"),
		'OnContextUpdate', function (self, context, ...)
UpdateUICommandCenterRow(self, context, "transportation")
XContextControl.OnContextUpdate(self, context, ...)
end,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 250,
			'MaxWidth', 250,
			'TextStyle', "OverviewItemName",
			'Translate', true,
			'Text', T(7305, --[[XTemplate TransportationOverviewRow Text]] "<DisplayName>"),
			'Shorten', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__context_of_kind', "DroneControl",
			'__class', "XText",
			'Id', "idDroneCount",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 140,
			'HandleMouse', false,
			'TextStyle', "OverviewItemValue",
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__context_of_kind', "ShuttleHub",
			'__class', "XText",
			'Id', "idShuttleCount",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 140,
			'HandleMouse', false,
			'TextStyle', "OverviewItemValue",
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__context_of_kind', "DroneFactory",
			'__class', "XText",
			'Id', "idQueuedPrefabs",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 140,
			'HandleMouse', false,
			'TextStyle', "OverviewItemValue",
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__context_of_kind', "RCTransport",
			'__class', "XText",
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 140,
			'HandleMouse', false,
			'TextStyle', "OverviewItemValue",
			'Translate', true,
			'Text', T(982829389071, --[[XTemplate TransportationOverviewRow Text]] "<resource(StoredAmount)>/<resource(max_shared_storage)>"),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idLoad",
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 120,
			'MaxWidth', 120,
			'MaxHeight', 30,
			'Visible', false,
			'ImageFit', "smallest",
		}),
		PlaceObj('XTemplateWindow', {
			'MinWidth', 110,
			'MaxWidth', 110,
		}, {
			PlaceObj('XTemplateWindow', {
				'HAlign', "center",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 10,
			}, {
				PlaceObj('XTemplateGroup', {
					'__condition', function (parent, context) return context:GetUIInteractionState() end,
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "unpack drone",
						'__condition', function (parent, context) return IsKindOfClasses(context, "DroneHub", "RCRover") end,
						'__class', "XTextButton",
						'RolloverTemplate', "Rollover",
						'RolloverAnchor', "right",
						'RolloverAnchorId', "node",
						'RolloverText', T(8460, --[[XTemplate TransportationOverviewRow RolloverText]] "Unpack an existing Drone Prefab to build a new Drone. Drone Prefabs can be created from existing Drones or in a Drone Assembler (requires research). This action can be used to quickly reassign Drones between controllers.<newline><newline>Available Drone Prefabs: <drone(available_drone_prefabs)>"),
						'RolloverTitle', T(349, --[[XTemplate TransportationOverviewRow RolloverTitle]] "Unpack Drone"),
						'RolloverHint', T(8461, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click> Unpack Drone <em>Ctrl + <left_click></em> Unpack five Drones"),
						'RolloverHintGamepad', T(8462, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Unpack Drone <ButtonX> Unpack five Drones"),
						'ZOrder', 100000,
						'VAlign', "center",
						'LayoutHSpacing', 0,
						'Background', RGBA(0, 0, 0, 0),
						'Transparency', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(UICity.drone_prefabs > 0)
end,
						'FXMouseIn', "MenuItemHover",
						'FXPress', "MenuItemClick",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
self.context:UseDronePrefab(not gamepad and IsMassUIModifierPressed())
BulkObjModifiedInCityLabels("DroneHub", "RCRover")
end,
						'AltPress', true,
						'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:UseDronePrefab(true)
	BulkObjModifiedInCityLabels("DroneHub", "RCRover")
end
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idButtonIcon",
							'IdNode', false,
							'ZOrder', 2,
							'Shape', "InHHex",
							'Dock', "left",
							'HandleMouse', true,
							'Image', "UI/Icons/IPButtons/drone_assemble.tga",
							'ImageFit', "smallest",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'IdNode', false,
								'Margins', box(-3, -3, -3, -3),
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "smallest",
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "pack drone",
						'__condition', function (parent, context) return IsKindOfClasses(context, "DroneHub", "RCRover") end,
						'__class', "XTextButton",
						'RolloverTemplate', "Rollover",
						'RolloverAnchor', "right",
						'RolloverAnchorId', "node",
						'RolloverText', T(8665, --[[XTemplate TransportationOverviewRow RolloverText]] "Recalls a Drone and packs it into a Drone Prefab. Can be used to reassign Drones between controllers."),
						'RolloverDisabledText', T(8666, --[[XTemplate TransportationOverviewRow RolloverDisabledText]] "No available Drones."),
						'RolloverTitle', T(8667, --[[XTemplate TransportationOverviewRow RolloverTitle]] "Pack Drone for Reassignment"),
						'RolloverHint', T(8668, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click> Pack Drone for reassignment <em>Ctrl + <left_click></em> Pack five Drones"),
						'RolloverHintGamepad', T(8669, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Pack Drone for reassignment <ButtonX> Pack five Drones"),
						'ZOrder', 100000,
						'VAlign', "center",
						'LayoutHSpacing', 0,
						'Background', RGBA(0, 0, 0, 0),
						'Transparency', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(not not context:FindDroneToConvertToPrefab())
end,
						'FXMouseIn', "MenuItemHover",
						'FXPress', "MenuItemClick",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
self.context:ConvertDroneToPrefab(not gamepad and IsMassUIModifierPressed())
BulkObjModifiedInCityLabels("DroneHub", "RCRover")
end,
						'AltPress', true,
						'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ConvertDroneToPrefab(true)
	BulkObjModifiedInCityLabels("DroneHub", "RCRover")
end
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idButtonIcon",
							'IdNode', false,
							'ZOrder', 2,
							'Shape', "InHHex",
							'Dock', "left",
							'HandleMouse', true,
							'Image', "UI/Icons/IPButtons/drone_dismantle.tga",
							'ImageFit', "smallest",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'IdNode', false,
								'Margins', box(-3, -3, -3, -3),
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "smallest",
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "make shuttles",
						'__context_of_kind', "ShuttleHub",
						'__class', "XTextButton",
						'RolloverTemplate', "Rollover",
						'RolloverAnchor', "right",
						'RolloverAnchorId', "node",
						'RolloverTitle', T(821612835210, --[[XTemplate TransportationOverviewRow RolloverTitle]] "Construct a Shuttle"),
						'RolloverHint', T(860716957818, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click> Construct a new Shuttle<newline><right_click> Cancel a Shuttle construction"),
						'RolloverHintGamepad', T(9745, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Construct a new Shuttle\n<ButtonX> Cancel a Shuttle construction"),
						'ZOrder', 100000,
						'VAlign', "center",
						'LayoutHSpacing', 0,
						'Background', RGBA(0, 0, 0, 0),
						'Transparency', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
local can_construct = context.max_shuttles - (#context.shuttle_infos + context.queued_shuttles_for_construction) > 0
local texts = {}
if can_construct then
	texts[#texts + 1] = T(324514950847, "The construction of a new Shuttle costs:<newline><SingleShuttleCostStr>")
else
	texts[#texts + 1] = T(174054841334, "No more shuttles can be constructed.")
end
if context.queued_shuttles_for_construction ~= 0 then
	texts[#texts + 1] = T(726161435938, "Shuttle construction<right><queued_shuttles_for_construction>")
end
self:SetRolloverText(table.concat(texts, "<newline><left>"))
end,
						'FXMouseIn', "MenuItemHover",
						'FXPress', "MenuItemClick",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
self.context:QueueConstructShuttle(1)
ObjModified(self.context)
end,
						'AltPress', true,
						'OnAltPress', function (self, gamepad)
self.context:QueueConstructShuttle(-1)
ObjModified(self.context)
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idButtonIcon",
							'IdNode', false,
							'ZOrder', 2,
							'Shape', "InHHex",
							'Dock', "left",
							'HandleMouse', true,
							'Image', "UI/Icons/IPButtons/shuttle.tga",
							'ImageFit', "smallest",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'IdNode', false,
								'Margins', box(-3, -3, -3, -3),
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "smallest",
							}),
							}),
						}),
					PlaceObj('XTemplateGroup', {
						'comment', "drone factory",
						'__context_of_kind', "DroneFactory",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "make drones",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "right",
							'RolloverAnchorId', "node",
							'RolloverText', T(644918672836, --[[XTemplate TransportationOverviewRow RolloverText]] "Drone prefabs can be used to order new drones in Drone Hubs. Drone Prefabs cost:<newline><resource(ConstructResource)><right><resource(ConstructDroneCost, ConstructResource)>"),
							'RolloverTitle', T(8645, --[[XTemplate TransportationOverviewRow RolloverTitle]] "Construct Drone Prefab"),
							'RolloverHint', T(9746, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click> Construct Drone Prefab\n<right_click> Cancel Drone Prefab"),
							'RolloverHintGamepad', T(9747, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Construct Drone Prefab\n<ButtonX> Cancel Drone Prefab"),
							'ZOrder', 100000,
							'VAlign', "center",
							'LayoutHSpacing', 0,
							'Background', RGBA(0, 0, 0, 0),
							'Transparency', 50,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
self.context:ConstructDrone(1)
ObjModified(self.context)
end,
							'AltPress', true,
							'OnAltPress', function (self, gamepad)
self.context:ConstructDrone(-1)
ObjModified(self.context)
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idButtonIcon",
								'IdNode', false,
								'ZOrder', 2,
								'Shape', "InHHex",
								'Dock', "left",
								'HandleMouse', true,
								'Image', "UI/Icons/IPButtons/drone.tga",
								'ImageFit', "smallest",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idRollover",
									'IdNode', false,
									'Margins', box(-3, -3, -3, -3),
									'Dock', "box",
									'Visible', false,
									'Image', "UI/Common/Hex_small_shine.tga",
									'ImageFit', "smallest",
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "make androids",
							'__condition', function (parent, context) return UICity:IsTechResearched("ThePositronicBrain") end,
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "right",
							'RolloverAnchorId', "node",
							'RolloverText', T(702517856120, --[[XTemplate TransportationOverviewRow RolloverText]] "Construction of a new Biorobot costs:<newline><resource(ConstructResource)><right><resource(ConstructAndroidCost, ConstructResource)>"),
							'RolloverTitle', T(6738, --[[XTemplate TransportationOverviewRow RolloverTitle]] "Construct Biorobot"),
							'RolloverHint', T(9748, --[[XTemplate TransportationOverviewRow RolloverHint]] "<left_click> Construct Biorobot\n<right_click> Cancel Biorobot"),
							'RolloverHintGamepad', T(9749, --[[XTemplate TransportationOverviewRow RolloverHintGamepad]] "<ButtonA> Construct Biorobot\n<ButtonX> Cancel Biorobot"),
							'ZOrder', 100000,
							'VAlign', "center",
							'LayoutHSpacing', 0,
							'Background', RGBA(0, 0, 0, 0),
							'Transparency', 50,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
self.context:ConstructAndroid(1)
ObjModified(self.context)
end,
							'AltPress', true,
							'OnAltPress', function (self, gamepad)
self.context:ConstructAndroid(-1)
ObjModified(self.context)
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idButtonIcon",
								'IdNode', false,
								'ZOrder', 2,
								'Shape', "InHHex",
								'Dock', "left",
								'HandleMouse', true,
								'Image', "UI/Icons/IPButtons/biorobot.tga",
								'ImageFit', "smallest",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idRollover",
									'IdNode', false,
									'Margins', box(-3, -3, -3, -3),
									'Dock', "box",
									'Visible', false,
									'Image', "UI/Common/Hex_small_shine.tga",
									'ImageFit', "smallest",
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not context:GetUIInteractionState() end,
					'__class', "XText",
					'Margins', box(0, 5, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'HandleMouse', false,
					'TextStyle', "OverviewItemName",
					'Translate', true,
					'Text', T(892860717791, --[[XTemplate TransportationOverviewRow Text]] "Gone Rogue"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		}),
})

