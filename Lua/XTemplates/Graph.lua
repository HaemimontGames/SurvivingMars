-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "CCC",
	id = "Graph",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'Padding', box(12, 12, 12, 12),
		'HAlign', "left",
		'Image', "UI/CommonNew/ccc_graph.tga",
		'FrameBox', box(57, 30, 30, 47),
	}, {
		PlaceObj('XTemplateWindow', {
			'comment', "title",
			'__class', "XText",
			'Id', "idTitle",
			'Margins', box(30, 20, 0, 5),
			'HAlign', "left",
			'VAlign', "top",
			'TextStyle', "OverviewItemSection",
			'Translate', true,
			'Text', T(857640145534, --[[XTemplate Graph Text]] "<caption>"),
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "graph elements",
			'MinWidth', 999,
			'MinHeight', 357,
			'MaxWidth', 999,
			'MaxHeight', 357,
			'LayoutMethod', "HList",
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "graph lines",
				'Margins', box(102, 0, 0, 34),
				'Dock', "box",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 57),
					'Dock', "bottom",
					'HAlign', "left",
					'MinWidth', 842,
					'MaxWidth', 842,
					'Image', "UI/CommonNew/ccc_graph_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 57),
					'Dock', "bottom",
					'HAlign', "left",
					'MinWidth', 842,
					'MaxWidth', 842,
					'Image', "UI/CommonNew/ccc_graph_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 57),
					'Dock', "bottom",
					'HAlign', "left",
					'MinWidth', 842,
					'MaxWidth', 842,
					'Image', "UI/CommonNew/ccc_graph_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 57),
					'Dock', "bottom",
					'HAlign', "left",
					'MinWidth', 842,
					'MaxWidth', 842,
					'Image', "UI/CommonNew/ccc_graph_line.tga",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "graph Y numbers",
				'__class', "XContextWindow",
				'IdNode', true,
				'Margins', box(23, 0, 0, 59),
				'Dock', "box",
				'HAlign', "left",
				'VAlign', "bottom",
				'MinWidth', 39,
				'MaxWidth', 39,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
for i = 1, 4 do
	self["idScale" .. i]:SetText(tostring(context.unit * i))
end
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale1",
					'Margins', box(0, 0, 0, 40),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextStyle', "GraphScale",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale2",
					'Margins', box(0, 0, 0, 37),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextStyle', "GraphScale",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale3",
					'Margins', box(0, 0, 0, 37),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextStyle', "GraphScale",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale4",
					'Margins', box(0, 0, 0, 37),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextStyle', "GraphScale",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "bars list",
				'__class', "XList",
				'Id', "idList",
				'Margins', box(102, 0, 0, 34),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 842,
				'MaxWidth', 842,
				'LayoutMethod', "HOverlappingList",
				'UniformColumnWidth', true,
				'BorderColor', RGBA(0, 0, 0, 0),
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'GamepadInitialSelection', false,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "OnShortcut(self, shortcut, source)",
					'func', function (self, shortcut, source)
if XShortcutToRelation[shortcut] == "down" or XShortcutToRelation[shortcut] == "up" then
	local dir = XShortcutToRelation[shortcut]
	local dlg = GetDialog(self)
	local content = dlg.idContent
	local parent_graph = self.parent.parent
	local idx = table.find(content, parent_graph)
	local next_id = dir == "down" and idx + 1 or idx - 1
	if content[next_id] then
		rawset(dlg, "focused_graph", next_id)
		local graph = content[next_id]
		graph.idList:SetFocus()
		graph.idList:SetSelection(self.focused_item or 1)
	end
	return "break"
end
return XList.OnShortcut(self, shortcut, source)
end,
				}),
				PlaceObj('XTemplateForEach', {
					'comment', "single bars",
					'array', function (parent, context) return context.data end,
					'condition', function (parent, context, item, i) return context.columns == 1 end,
					'run_after', function (child, context, item, i, n)
local value = item[1]
local height = Max(5, value)
child.idBar:SetMinHeight(height)
child.idBar:SetMaxHeight(height)
if value < 5 then
	child.idBar:SetScaleModifier(point(1000, MulDivRound(1000, value, 5)))
end

child:SetRolloverText(T{8985, "Sol <sol>: <value>", sol = item[5], value = item[2]})
end,
				}, {
					PlaceObj('XTemplateWindow', {
						'RolloverTemplate', "GraphRollover",
						'RolloverAnchor', "center-top",
						'RolloverAnchorId', "idBar",
						'IdNode', true,
						'VAlign', "bottom",
						'MinWidth', 17,
						'MaxWidth', 17,
						'RolloverOnFocus', true,
						'HandleMouse', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
if rollover then
	self.idBar:SetImage("UI/CommonNew/ccc_graph_indicator_blue1.tga")
else
	self.idBar:SetImage("UI/CommonNew/ccc_graph_indicator_blue.tga")
end
XWindow.OnSetRollover(self, rollover)
PlayFX("MenuItemHover", "start", self)
self:Invalidate()
end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "SetSelected(self, selected)",
							'func', function (self, selected)
self:SetFocus(selected)
end,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Id', "idBar",
							'HAlign', "center",
							'VAlign', "bottom",
							'MinWidth', 8,
							'MaxWidth', 8,
							'Image', "UI/CommonNew/ccc_graph_indicator_blue.tga",
							'FrameBox', box(0, 5, 0, 0),
						}),
						}),
					}),
				PlaceObj('XTemplateForEach', {
					'comment', "colored bars",
					'array', function (parent, context) return context.data end,
					'condition', function (parent, context, item, i) return context.columns == 2 end,
					'run_after', function (child, context, item, i, n)
local value = item[1]
local height = Max(5, value)
child.idBarLeft:SetMinHeight(height)
child.idBarLeft:SetMaxHeight(height)
if value < 5 then
	child.idBarLeft:SetScaleModifier(point(1000, MulDivRound(1000, value, 5)))
end

local value = item[3]
local height = Max(5, value)
child.idBarRight:SetMinHeight(height)
child.idBarRight:SetMaxHeight(height)
if value < 5 then
	child.idBarRight:SetScaleModifier(point(1000, MulDivRound(1000, value, 5)))
end

child:SetRolloverText(T{8986, "Sol <sol>: <value1>/<value2>", sol = item[5], value1 = item[2], value2 = item[4]})
end,
				}, {
					PlaceObj('XTemplateWindow', {
						'RolloverTemplate', "GraphRollover",
						'RolloverAnchor', "center-top",
						'IdNode', true,
						'VAlign', "bottom",
						'MinWidth', 17,
						'MaxWidth', 17,
						'LayoutMethod', "HList",
						'RolloverOnFocus', true,
						'HandleMouse', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
if rollover then
	self.idBarLeft:SetImage("UI/CommonNew/ccc_graph_indicator_green1.tga")
	self.idBarRight:SetImage("UI/CommonNew/ccc_graph_indicator_blue1.tga")
else
	self.idBarLeft:SetImage("UI/CommonNew/ccc_graph_indicator_green.tga")
	self.idBarRight:SetImage("UI/CommonNew/ccc_graph_indicator_blue.tga")
end
XWindow.OnSetRollover(self, rollover)
PlayFX("MenuItemHover", "start", self)
self:Invalidate()
end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "SetSelected(self, selected)",
							'func', function (self, selected)
self:SetFocus(selected)
end,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Id', "idBarLeft",
							'VAlign', "bottom",
							'MinWidth', 8,
							'MaxWidth', 8,
							'Image', "UI/CommonNew/ccc_graph_indicator_green.tga",
							'FrameBox', box(0, 5, 0, 0),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Id', "idBarRight",
							'VAlign', "bottom",
							'MinWidth', 8,
							'MaxWidth', 8,
							'Image', "UI/CommonNew/ccc_graph_indicator_blue.tga",
							'FrameBox', box(0, 5, 0, 0),
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "graph X numbers",
				'__class', "XContextWindow",
				'IdNode', true,
				'Margins', box(20, 0, 0, 15),
				'Dock', "box",
				'VAlign', "bottom",
				'LayoutHSpacing', 53,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local sol = UICity.day
sol = Max(sol - 1, 50)
for i = 3, 1, -1 do
	local label = self["idLegend" .. i]
	local text = tostring(sol)
	label:SetText(text)
	local circle = self["idLegendCircle" .. i]
	local spacing = 
	circle:SetMargins(box(40 + (i - 1) * 447, 0, 0, 0))
	sol = sol - 25
end
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "units text",
					'__class', "XText",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "left",
					'VAlign', "center",
					'MinWidth', 39,
					'MaxWidth', 39,
					'HandleMouse', false,
					'TextStyle', "GraphScale",
					'Translate', true,
					'Text', T(774267355675, --[[XTemplate Graph Text]] "Sol"),
					'TextHAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idLegendCircle1",
					'IdNode', false,
					'HAlign', "left",
					'MinWidth', 32,
					'MinHeight', 32,
					'MaxWidth', 32,
					'MaxHeight', 32,
					'Image', "UI/CommonNew/ccc_graph_circle.tga",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idLegend1",
						'HAlign', "center",
						'VAlign', "center",
						'TextStyle', "GraphScale",
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idLegendCircle2",
					'IdNode', false,
					'HAlign', "left",
					'MinWidth', 32,
					'MinHeight', 32,
					'MaxWidth', 32,
					'MaxHeight', 32,
					'Image', "UI/CommonNew/ccc_graph_circle.tga",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idLegend2",
						'HAlign', "center",
						'VAlign', "center",
						'TextStyle', "GraphScale",
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idLegendCircle3",
					'IdNode', false,
					'HAlign', "left",
					'MinWidth', 32,
					'MinHeight', 32,
					'MaxWidth', 32,
					'MaxHeight', 32,
					'Image', "UI/CommonNew/ccc_graph_circle.tga",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idLegend3",
						'HAlign', "center",
						'VAlign', "center",
						'TextStyle', "GraphScale",
					}),
					}),
				}),
			}),
		}),
})

