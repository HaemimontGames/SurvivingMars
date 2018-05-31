-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "CCC",
	id = "Graph",
	PlaceObj('XTemplateWindow', {
		'IdNode', true,
		'HAlign', "right",
		'LayoutMethod', "VList",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Margins', box(38, 0, 0, 5),
			'HAlign', "left",
			'VAlign', "top",
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{857640145534, --[[XTemplate Graph Text]] "<caption>"},
		}),
		PlaceObj('XTemplateWindow', {
			'MinWidth', 738,
			'MinHeight', 364,
			'MaxWidth', 738,
			'MaxHeight', 364,
			'LayoutMethod', "HList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "box",
				'Image', "UI/Common/diagram.tga",
			}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(37, 0, 0, 59),
				'Dock', "box",
				'LayoutMethod', "VList",
				'LayoutVSpacing', 52,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Margins', box(0, 0, 0, 42),
					'Dock', "bottom",
					'Image', "UI/Common/diagram_line.tga",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContextWindow",
				'IdNode', true,
				'Margins', box(0, 0, 0, 59),
				'Dock', "box",
				'HAlign', "left",
				'VAlign', "bottom",
				'MinWidth', 39,
				'MaxWidth', 39,
				'LayoutMethod', "VList",
				'LayoutVSpacing', 30,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
for i = 1, 6 do
	self["idScale" .. i]:SetText(tostring(context.unit * i))
end
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale1",
					'Padding', box(0, 0, 0, 30),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale2",
					'Padding', box(0, 0, 0, 22),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale3",
					'Padding', box(0, 0, 0, 22),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale4",
					'Padding', box(0, 0, 0, 22),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale5",
					'Padding', box(0, 0, 0, 22),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idScale6",
					'Padding', box(0, 0, 0, 22),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XList",
				'Id', "idList",
				'Margins', box(39, 0, 0, 27),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 700,
				'MaxWidth', 700,
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
	local dlg = GetXDialog(self)
	local scroll_area = dlg.idContent.idScrollArea
	local parent_graph = self.parent.parent
	local idx = table.find(scroll_area, parent_graph)
	local next_id = dir == "down" and idx + 1 or idx - 1
	if scroll_area[next_id] then
		rawset(dlg, "focused_graph", next_id)
		local graph = scroll_area[next_id]
		scroll_area:ScrollIntoView(graph)
		graph.idList:SetFocus()
		graph.idList:SetSelection(self.focused_item or 1)
	end
	return "break"
end
return XList.OnShortcut(self, shortcut, source)
end,
				}),
				PlaceObj('XTemplateForEach', {
					'array', function (parent, context) return context.data end,
					'condition', function (parent, context, item, i) return context.columns == 1 end,
					'run_after', function (child, context, item, i, n)
child.idBar:SetMinHeight(item[1])
child.idBar:SetMaxHeight(item[1])
child:SetRolloverText(T{8985, "Sol <sol>: <value>", sol = item[5], value = item[2]})
end,
				}, {
					PlaceObj('XTemplateWindow', {
						'RolloverTemplate', "GraphRollover",
						'RolloverAnchor', "center-top",
						'IdNode', true,
						'VAlign', "bottom",
						'MinWidth', 14,
						'MaxWidth', 14,
						'RolloverOnFocus', true,
						'HandleMouse', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
if rollover then
	self.idBar:SetImage("UI/Common/diagram_column_shine.tga")
else
	self.idBar:SetImage("UI/Common/diagram_column.tga")
end
XWindow.OnSetRollover(self, rollover)
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
							'__class', "XImage",
							'Id', "idBar",
							'HAlign', "left",
							'VAlign', "bottom",
							'MinWidth', 14,
							'MaxWidth', 14,
							'Image', "UI/Common/diagram_column.tga",
							'ImageFit', "stretch",
						}),
						}),
					}),
				PlaceObj('XTemplateForEach', {
					'array', function (parent, context) return context.data end,
					'condition', function (parent, context, item, i) return context.columns == 2 end,
					'run_after', function (child, context, item, i, n)
child.idBarLeft:SetMinHeight(item[1])
child.idBarLeft:SetMaxHeight(item[1])

child.idBarRight:SetMinHeight(item[3])
child.idBarRight:SetMaxHeight(item[3])
child:SetRolloverText(T{8986, "Sol <sol>: <value1>/<value2>", sol = item[5], value1 = item[2], value2 = item[4]})
end,
				}, {
					PlaceObj('XTemplateWindow', {
						'RolloverTemplate', "GraphRollover",
						'RolloverAnchor', "center-top",
						'IdNode', true,
						'VAlign', "bottom",
						'MinWidth', 14,
						'MaxWidth', 14,
						'LayoutMethod', "HList",
						'RolloverOnFocus', true,
						'HandleMouse', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
if rollover then
	self.idBarLeft:SetImage("UI/Common/diagram_column_shine_2.tga")
	self.idBarRight:SetImage("UI/Common/diagram_column_shine.tga")
else
	self.idBarLeft:SetImage("UI/Common/diagram_column_2.tga")
	self.idBarRight:SetImage("UI/Common/diagram_column.tga")
end
XWindow.OnSetRollover(self, rollover)
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
							'__class', "XImage",
							'Id', "idBarLeft",
							'HAlign', "left",
							'VAlign', "bottom",
							'MinWidth', 7,
							'MaxWidth', 7,
							'Image', "UI/Common/diagram_column_2.tga",
							'ImageFit', "stretch",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idBarRight",
							'HAlign', "left",
							'VAlign', "bottom",
							'MinWidth', 7,
							'MaxWidth', 7,
							'Image', "UI/Common/diagram_column.tga",
							'ImageFit', "stretch",
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Margins', box(39, 0, 0, 0),
				'Padding', box(0, 0, 0, 0),
				'Dock', "bottom",
				'HAlign', "left",
				'VAlign', "center",
				'MinHeight', 29,
				'MaxHeight', 29,
				'HandleMouse', false,
				'TextFont', "Version",
				'TextColor', RGBA(140, 156, 178, 255),
				'Translate', true,
				'Text', T{357591184896, --[[XTemplate Graph Text]] "<legend>"},
				'TextVAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContextWindow",
				'IdNode', true,
				'Margins', box(0, 0, 0, 1),
				'Dock', "box",
				'VAlign', "bottom",
				'LayoutHSpacing', 53,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local sol = UICity.day
sol = Max(sol - 5, 46)
for i = 10, 1, -1 do
	self["idLegend" .. i]:SetText(tostring(sol))
	sol = sol - 5
end
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "left",
					'VAlign', "center",
					'MinWidth', 39,
					'MaxWidth', 39,
					'HandleMouse', false,
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
					'Translate', true,
					'Text', T{774267355675, --[[XTemplate Graph Text]] "Sol"},
					'TextHAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend1",
					'Margins', box(39, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend2",
					'Margins', box(109, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend3",
					'Margins', box(179, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend4",
					'Margins', box(249, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend5",
					'Margins', box(319, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend6",
					'Margins', box(389, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend7",
					'Margins', box(459, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend8",
					'Margins', box(529, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend9",
					'Margins', box(599, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLegend10",
					'Margins', box(669, 0, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextFont', "Version",
					'TextColor', RGBA(140, 156, 178, 255),
				}),
				}),
			}),
		}),
})

