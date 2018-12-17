-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "TransportationOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "transportation",
		'InternalModes', "transportation",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
local dlg = GetDialog(parent)
if dlg then
	dlg.OnShortcut = function(dlg, shortcut, source)
		if shortcut == "RightShoulder" and rawget(dlg, "idList") then
			if not dlg.idList:IsFocused(true) then
				dlg.idList:SetFocus()
				dlg.idList:SetSelection(rawget(dlg, "last_list_focus") or 1)
				return "break"
			end
		elseif shortcut == "LeftShoulder" and rawget(dlg, "idButtons") then
			if not dlg.idButtons:IsFocused(true) then
				rawset(dlg, "last_list_focus", dlg.idList.focused_item)
				dlg.idButtons[1]:SetFocus()
				return "break"
			end
		end
		return XDialog.OnShortcut(dlg, shortcut, source)
	end
end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T(684392855007, --[[XTemplate TransportationOverview Title]] "TRANSPORTATION"),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
			'IdNode', false,
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "drone prefabs",
				'__class', "XContextWindow",
				'ZOrder', 0,
				'Margins', box(115, 0, 0, 10),
				'Dock', "top",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'MinHeight', 40,
					'MaxHeight', 40,
					'Image', "UI/Icons/Buildings/drone.tga",
					'ImageFit', "smallest",
					'Columns', 2,
				}),
				PlaceObj('XTemplateWindow', {
					'__context', function (parent, context) return { n = function() return UICity.drone_prefabs end } end,
					'__class', "XText",
					'Id', "idDronePrefabs",
					'Margins', box(12, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "CCCFilterItem",
					'Translate', true,
					'Text', T(518310821309, --[[XTemplate TransportationOverview Text]] "AVAILABLE DRONE PREFABS: <em><n></em>"),
				}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "ScrollbarNew",
				'Id', "idButtonsScroll",
				'ZOrder', 1,
				'Margins', box(87, 0, 0, 0),
				'Target', "idButtonsScrollArea",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XScrollArea",
				'Id', "idButtonsScrollArea",
				'IdNode', false,
				'Dock', "left",
				'VScroll', "idButtonsScroll",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContextWindow",
					'Id', "idButtons",
					'Margins', box(12, 0, 0, 0),
					'LayoutMethod', "VList",
					'OnContextUpdate', function (self, context, ...)
for _, child in ipairs(self) do
	child:OnContextUpdate(context, ...)
end
XContextWindow.OnContextUpdate(self, context, ...)
end,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
return CCC_ButtonListOnShortcut(self, shortcut, source)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "drone_hubs",
						'__template', "CommandCenterButton",
						'RolloverTitle', T(259870368403, --[[XTemplate TransportationOverview RolloverTitle]] "Drone Hubs"),
						'Margins', box(-12, 0, 0, -14),
						'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local drone_hubs = dlg.context.drone_hubs
self:SetIcon(drone_hubs == false and "UI/Icons/ColonyControlCenter/drone_hub_r.tga" or "UI/Icons/ColonyControlCenter/drone_hub_g.tga")
self:SetRolloverText(GetTransportationFilterRollover(context, T(11632, "Toggle filtering of Drone Hubs.")))
self:SetRolloverHint(drone_hubs ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = drone_hubs ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(drone_hubs ~= false)
end,
						'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "drone_hubs", true)
end,
						'Icon', "UI/Icons/Buildings/drone_hub.tga",
						'Text', T(694591832026, --[[XTemplate TransportationOverview Text]] "DRONE HUBS"),
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "drone_assemblers",
						'__template', "CommandCenterButton",
						'RolloverTitle', T(397662043481, --[[XTemplate TransportationOverview RolloverTitle]] "Drone Assemblers"),
						'Margins', box(-12, 0, 0, -14),
						'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local drone_assemblers = dlg.context.drone_assemblers
self:SetIcon(not drone_assemblers and "UI/Icons/ColonyControlCenter/workshop_r.tga" or "UI/Icons/ColonyControlCenter/workshop_g.tga")
self:SetRolloverText(GetTransportationFilterRollover(context, T(11633, "Toggle filtering of Drone Assemblers.")))
self:SetRolloverHint(drone_assemblers ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = drone_assemblers ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not drone_assemblers)
end,
						'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "drone_assemblers", false)
end,
						'Icon', "UI/Icons/Buildings/workshop.tga",
						'Text', T(814571150239, --[[XTemplate TransportationOverview Text]] "DRONE ASSEMBLERS"),
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "rockets",
						'__template', "CommandCenterButton",
						'RolloverTitle', T(296967872321, --[[XTemplate TransportationOverview RolloverTitle]] "Rockets"),
						'Margins', box(-12, 0, 0, 10),
						'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local rockets = dlg.context.rockets
self:SetIcon(not rockets and "UI/Icons/ColonyControlCenter/rocket_r.tga" or "UI/Icons/ColonyControlCenter/rocket_g.tga")
self:SetRolloverText(GetTransportationFilterRollover(context, T(11635, "Toggle filtering of Rockets.")))
self:SetRolloverHint(rockets ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = rockets ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not rockets)
end,
						'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "rockets", false)
end,
						'Icon', "UI/Icons/Buildings/rocket.tga",
						'Text', T(216365787860, --[[XTemplate TransportationOverview Text]] "ROCKETS"),
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "rovers",
						'__template', "CommandCenterButton",
						'RolloverTitle', T(951182332337, --[[XTemplate TransportationOverview RolloverTitle]] "RC Rovers"),
						'Margins', box(-12, 0, 0, 10),
						'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local rovers = dlg.context.rovers
self:SetIcon(rovers == false and "UI/Icons/ColonyControlCenter/rcrover_r.tga" or "UI/Icons/ColonyControlCenter/rcrover_g.tga")
self:SetRolloverText(GetTransportationFilterRollover(context, T(11636, "Toggle filtering of RC Rovers.")))
self:SetRolloverHint(rovers ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = rovers ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(rovers ~= false)
end,
						'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "rovers", false)
end,
						'Icon', "UI/Icons/Buildings/rcrover.tga",
						'Text', T(513103441365, --[[XTemplate TransportationOverview Text]] "RC ROVERS"),
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "shuttle_hubs",
						'__template', "CommandCenterButton",
						'RolloverTitle', T(606206203249, --[[XTemplate TransportationOverview RolloverTitle]] "Shuttle Hubs"),
						'Margins', box(-12, 0, 0, -14),
						'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local shuttle_hubs = dlg.context.shuttle_hubs
self:SetIcon(not shuttle_hubs and "UI/Icons/ColonyControlCenter/shuttle_hub_r.tga" or "UI/Icons/ColonyControlCenter/shuttle_hub_g.tga")
self:SetRolloverText(GetTransportationFilterRollover(context, T(11647, "Toggle filtering of Shuttle Hubs.")))
self:SetRolloverHint(shuttle_hubs ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = shuttle_hubs ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not shuttle_hubs)
end,
						'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "shuttle_hubs", false)
end,
						'Icon', "UI/Icons/Buildings/shuttle_hub.tga",
						'Text', T(418837943438, --[[XTemplate TransportationOverview Text]] "SHUTTLE HUBS"),
					}),
					PlaceObj('XTemplateCode', {
						'comment', "focus first",
						'run', function (self, parent, context)
if GetUIStyleGamepad() then
	local first = parent[1]
	CreateRealTimeThread(function(first)
		if first.window_state ~= "destroying" then
			first:SetFocus()
		end
	end, first)
end
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XSizeConstrainedWindow",
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(115, 0, 0, 15),
					'Padding', box(63, 0, 0, 0),
					'Dock', "top",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 250,
						'MaxWidth', 250,
						'HandleMouse', false,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(1000037, --[[XTemplate TransportationOverview Text]] "Name"),
						'TextVAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 140,
						'MaxWidth', 140,
						'HandleMouse', false,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(688745762460, --[[XTemplate TransportationOverview Text]] "Info"),
						'TextHAlign', "center",
						'TextVAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 120,
						'MaxWidth', 120,
						'HandleMouse', false,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(885629433850, --[[XTemplate TransportationOverview Text]] "Workload"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 110,
						'MaxWidth', 110,
						'HandleMouse', false,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(1000178, --[[XTemplate TransportationOverview Text]] "Actions"),
						'TextHAlign', "center",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Margins', box(99, 0, 0, 0),
					'Target', "idList",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'MinWidth', 683,
					'MaxWidth', 683,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
					'GamepadInitialSelection', false,
				}, {
					PlaceObj('XTemplateForEach', {
						'comment', "transportation",
						'array', function (parent, context) local transportation = GetCommandCenterTransportsList(context); parent:ResolveId("idTitle"):SetTitle(T{9814, "<white><count></white> TRANSPORTATION", count = #transportation}) return transportation end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "TransportationOverviewRow", 683, 46)
end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idNoResults",
					'Dock', "box",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'HandleMouse', false,
					'TextStyle', "InGameTitle",
					'Translate', true,
					'Text', T(591853191640, --[[XTemplate TransportationOverview Text]] "Empty list"),
				}),
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
local list = parent:ResolveId("idList")
parent:ResolveId("idNoResults"):SetVisible(#list == 0)
end,
				}),
				}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T(4254, --[[XTemplate TransportationOverview ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "reset",
			'ActionName', T(550362230354, --[[XTemplate TransportationOverview ActionName]] "RESET FILTERS"),
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonX",
			'OnAction', function (self, host, source)
host.context.drone_hubs = nil
host.context.drone_assemblers = nil
host.context.commanders = nil
host.context.rockets = nil
host.context.transports = nil
host.context.explorers = nil
host.context.constructor = nil
host.context.driller = nil
host.context.harvester = nil
host.context.seeker = nil
host.context.generator = nil
host.context.shuttle_hubs = nil
host:ResolveId("idContent"):RespawnContent()
end,
		}),
		}),
})

