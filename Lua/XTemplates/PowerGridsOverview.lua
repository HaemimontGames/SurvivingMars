-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "PowerGridsOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "powergrids",
		'InternalModes', "powergrids",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T(682644919979, --[[XTemplate PowerGridsOverview Title]] "POWER GRIDS"),
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "content",
			'__class', "XContentTemplate",
			'Id', "idContent",
			'IdNode', false,
			'Margins', box(15, 0, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XSizeConstrainedWindow",
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(103, 0, 0, 15),
					'Dock', "top",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "name",
						'__class', "XLabel",
						'Margins', box(60, 0, 0, 0),
						'MinWidth', 250,
						'MaxWidth', 250,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(550311643207, --[[XTemplate PowerGridsOverview Text]] "Name"),
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "production",
						'__class', "XText",
						'MinWidth', 150,
						'MaxWidth', 150,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(996334672198, --[[XTemplate PowerGridsOverview Text]] "Production"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "consumption",
						'__class', "XText",
						'MinWidth', 150,
						'MaxWidth', 150,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(400347448588, --[[XTemplate PowerGridsOverview Text]] "Consumption"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "stored power",
						'__class', "XText",
						'MinWidth', 150,
						'MaxWidth', 150,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(562101525799, --[[XTemplate PowerGridsOverview Text]] "Stored Power"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "change",
						'__class', "XText",
						'MinWidth', 150,
						'MaxWidth', 150,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(655663611091, --[[XTemplate PowerGridsOverview Text]] "Change"),
						'TextHAlign', "center",
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XSizeConstrainedWindow",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "ScrollbarNew",
						'Id', "idScroll",
						'ZOrder', 0,
						'Margins', box(87, 0, 0, 0),
						'Target', "idList",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplateList",
						'Id', "idList",
						'BorderWidth', 0,
						'Padding', box(0, 0, 0, 0),
						'Background', RGBA(255, 255, 255, 0),
						'FocusedBackground', RGBA(255, 255, 255, 0),
						'VScroll', "idScroll",
						'MouseScroll', true,
						'OnContextUpdate', function (self, context, ...)
for _, child in ipairs(self) do
	child:OnContextUpdate(context, ...)
end
XContextWindow.OnContextUpdate(self, context, ...)
end,
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "electricity grids",
							'array', function (parent, context) return GetCommandCenterPowerGrids(context) end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_after', function (child, context, item, i, n)
child.idTitle:SetText(T{11629, "GRID <i>", i = i})
child.idButtonIcon:SetImage("UI/Icons/Sections/electricity_1.tga")
child.idButtonIcon:SetColumns(1)
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PowerGridsOverviewRow",
							}),
							}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
if GetUIStyleGamepad() and #parent > 0 then
	parent[1]:SetFocus()
end
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
						'Text', T(591853191640, --[[XTemplate PowerGridsOverview Text]] "Empty list"),
					}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
local list = parent:ResolveId("idList")
parent:ResolveId("idNoResults"):SetVisible(#list == 0)
end,
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T(4254, --[[XTemplate PowerGridsOverview ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		}),
})

