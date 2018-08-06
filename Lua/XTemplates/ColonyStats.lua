-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColonyStats",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'HostInParent', true,
		'InternalModes', "graph",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T{9680, --[[XTemplate ColonyStats Title]] "COLONY STATS"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XDialog",
				'Margins', box(30, 0, 0, 0),
				'InternalModes', "graph",
			}, {
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
parent:CreateThread("DailyUpdate", function(dlg, day)
	while true do
		if day ~= UICity.day then
			day = UICity.day
			dlg:SetMode(dlg.Mode, dlg.mode_param)
		end
		for _, win in ipairs(dlg.idContent.idScrollArea) do
			win.idLegend:SetText(win.idLegend:GetText())
		end
		Sleep(1000)
	end
end, parent, UICity.day)
local dlg = GetDialog(parent)
if dlg then
	dlg.OnShortcut = function(dlg, shortcut, source)
		if shortcut == "RightShoulder" then
			local scroll_area = dlg.idContent.idScrollArea
			if not scroll_area:IsFocused(true) then
				local graph = scroll_area[rawget(dlg, "focused_graph") or 1]
				scroll_area:ScrollIntoView(graph)
				graph.idList:SetFocus()
				graph.idList:SetSelection(rawget(dlg, "last_list_focus") or 1)
				return "break"
			end
		elseif shortcut == "LeftShoulder" and rawget(dlg, "idButtons") then
			local buttons = dlg.idButtons
			if not buttons:IsFocused(true) then
				rawset(dlg, "last_list_focus", dlg.idContent.idScrollArea[rawget(dlg, "focused_graph") or 1].idList.focused_item)
				local item
				local mode_param = dlg.mode_param
				if mode_param then
					item = table.find(buttons, "Id", mode_param.pressed)
				end
				buttons[item or 1]:SetFocus()
				return "break"
			end
		end
		return XDialog.OnShortcut(dlg, shortcut, source)
	end
end
end,
				}),
				PlaceObj('XTemplateWindow', {
					'Id', "idButtons",
					'IdNode', true,
					'ZOrder', 2,
					'Dock', "top",
					'HAlign', "center",
					'VAlign', "top",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
return CCC_ButtonListOnShortcut(self, shortcut, source)
end,
					}),
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return UICity:GetColonyStatsButtons() end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
if item.margin_right then
	child:SetMargins(box(0,0,item.margin_right, 0))
end
child:SetId("idButton" .. i)
if item.button_caption then
	child:SetRolloverTitle(item.button_caption)
	child:SetRolloverText(item.button_text)
end
child:SetIcon(item.off_icon)
local parent_dlg = GetDialog(GetDialog(child).parent)
local parent_context = parent_dlg.context
if (not parent_context.graph_id and i == 1) or parent_context.graph_id == item.id then
	child:Press()
	if GetUIStyleGamepad() then
		CreateRealTimeThread(function()
			if child.window_state ~= "destroying" then
				child:SetFocus()
			end
		end)
	end
end
local hint_gamepad = child.RolloverHintGamepad
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
child:SetRolloverHintGamepad(hint_gamepad)
end,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "node",
							'RolloverHint', T{549700209969, --[[XTemplate ColonyStats RolloverHint]] "<left_click> Show Graphs"},
							'RolloverHintGamepad', T{968517701277, --[[XTemplate ColonyStats RolloverHintGamepad]] "<ButtonA> Show Graphs"},
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1200,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
local context = self.context
dlg:SetContext(context)
local mode_param = GetDialogModeParam(dlg)
if mode_param then
	local pressed = self:ResolveId(mode_param.pressed)
	pressed:SetIcon(pressed.context.off_icon)
end
dlg:SetMode("graph", {pressed = self.Id})
self:SetIcon(context.on_icon)
local parent_dlg = GetDialog(dlg.parent)
parent_dlg.context.graph_id = context.id
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplate",
					'Id', "idContent",
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "graph",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "Scrollbar",
							'Id', "idScroll",
							'Margins', box(10, 0, 0, 0),
							'Target', "idScrollArea",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XScrollArea",
							'Id', "idScrollArea",
							'Margins', box(0, 15, 0, 0),
							'Padding', box(90, 0, 90, 0),
							'VAlign', "center",
							'LayoutMethod', "VList",
							'VScroll', "idScroll",
						}, {
							PlaceObj('XTemplateForEach', {
								'array', function (parent, context) return GetDialog(parent).context end,
								'__context', function (parent, context, item, i, n) local data, unit = TimeSeries_GetGraphValueHeights(item.data, UICity.day, 50, 270, 6); return SubContext(item, {data = data, unit = unit, columns = #(item.data)}) end,
								'run_after', function (child, context, item, i, n)
if i ~= 1 then
	child:SetMargins(box(0,15,0,0))
end
end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "Graph",
								}),
								}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateAction', {
				'ActionId', "back",
				'ActionName', T{4254, --[[XTemplate ColonyStats ActionName]] "BACK"},
				'ActionToolbar', "ActionBar",
				'ActionShortcut', "Escape",
				'ActionGamepad', "ButtonB",
				'OnActionEffect', "back",
			}),
			}),
		}),
})

