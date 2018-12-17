-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColonyStats",
	PlaceObj('XTemplateTemplate', {
		'__template', "NewOverlayDlg",
		'HostInParent', true,
		'InternalModes', "graph",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T(282240748525, --[[XTemplate ColonyStats Title]] "GRAPHS"),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XDialog",
				'InternalModes', "graph",
			}, {
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
parent:CreateThread("DailyUpdate", function(dlg, day)
	for _, win in ipairs(dlg.idContent) do
		win.idTitle:SetText(win.idTitle:GetText())
	end
end, parent, UICity.day)
local dlg = GetDialog(parent)
if dlg then
	dlg.OnShortcut = function(dlg, shortcut, source)
		if shortcut == "RightShoulder" then
			local content = dlg.idContent
			if not content:IsFocused(true) then
				local graph = content[rawget(dlg, "focused_graph") or 1]
				graph.idList:SetFocus()
				graph.idList:SetSelection(rawget(dlg, "last_list_focus") or 1)
				return "break"
			end
		elseif (shortcut == "LeftShoulder" or shortcut == "ButtonB") and rawget(dlg, "idButtons") then
			local buttons = dlg.idButtons
			if not buttons:IsFocused(true) then
				rawset(dlg, "last_list_focus", dlg.idContent[rawget(dlg, "focused_graph") or 1].idList.focused_item)
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
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idButtonsScroll",
					'ZOrder', 0,
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
						'Id', "idButtons",
						'IdNode', true,
						'ZOrder', 2,
						'Margins', box(12, 0, 0, 0),
						'LayoutMethod', "VList",
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
child:SetId("idButton" .. i)
if item.button_caption then
	child:SetText(item.button_caption)
	child:SetRolloverTitle(item.button_caption)
	child:SetRolloverText(item.button_text)
end
child:SetIcon(item.off_icon)
local parent_dlg = GetDialog(GetDialog(child).parent)
local parent_context = parent_dlg.context
if (not parent_context.graph_id and i == 1) or parent_context.graph_id == item.id then
	child.EnableFX = false
	child:Press()
	child.EnableFX = true
	if GetUIStyleGamepad() then
		CreateRealTimeThread(function()
			if child.window_state ~= "destroying" then
				child:SetFocus()
			end
		end)
	end
end
local hint_gamepad = child.RolloverHintGamepad
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
child:SetRolloverHintGamepad(hint_gamepad)
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "CommandCenterButton",
								'Margins', box(-12, 0, 0, -14),
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

for i=1,#self.parent do
	if IsKindOf(self.parent[i], "XToggleButton") then
		self.parent[i]:SetToggled(false)
	end
end
XToggleButton.OnPress(self)
end,
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnSetFocus",
									'func', function (self, ...)
self:Press()
XToggleButton.OnSetFocus(self, ...)
end,
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XSizeConstrainedWindow",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplate",
						'Id', "idContent",
						'Padding', box(16, 0, 0, 0),
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateMode', {
							'mode', "graph",
						}, {
							PlaceObj('XTemplateForEach', {
								'array', function (parent, context) return GetDialog(parent).context end,
								'__context', function (parent, context, item, i, n) local data, unit = TimeSeries_GetGraphValueHeights(item.data, UICity.day, 50, 240, 4); return SubContext(item, {data = data, unit = unit, columns = #(item.data)}) end,
								'run_after', function (child, context, item, i, n)
if i ~= 1 then
	child:SetMargins(box(0,15,0,0))
end
end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "Graph",
									'Margins', box(0, -12, 0, 0),
								}),
								}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateAction', {
				'ActionId', "back",
				'ActionName', T(4254, --[[XTemplate ColonyStats ActionName]] "BACK"),
				'ActionToolbar', "ActionBar",
				'ActionShortcut', "Escape",
				'ActionGamepad', "ButtonB",
				'OnActionEffect', "back",
			}),
			}),
		}),
})

