-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColorSchemeOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "colorschemes",
		'InternalModes', "colorschemes",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T{208980427650, --[[XTemplate ColorSchemeOverview Title]] "BUILDING COLORS"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
			'IdNode', false,
		}, {
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
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return Presets.ColonyColorScheme.Default end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
child.idLabel:SetMargins(box(15,0,0,0))
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'Margins', box(-2, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
self:SetToggled(g_CurrentCCS == context)
end,
							'OnPress', function (self, gamepad)
if g_CurrentCCS ~= self.context then --ReapplyPalettes is slow
	g_CurrentCCS = self.context
	ReapplyPalettes()
	local content = self:ResolveId("idContent")
	content:RespawnContent()
end
end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
							'IconColumns', 2,
							'Text', T{437462750091, --[[XTemplate ColorSchemeOverview Text]] "<display_name>"},
						}),
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
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate ColorSchemeOverview ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		}),
})

