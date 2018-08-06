-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "BuildingOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverText', T{345376930850, --[[XTemplate BuildingOverviewRow RolloverText]] "<OverviewInfo>"},
		'OnContextUpdate', function (self, context, ...)
UpdateUICommandCenterRow(self, context, "building")
XContextControl.OnContextUpdate(self, context, ...)
end,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
local upgrade_win = self.idUpgrades
UICreateUpgradeButtons(upgrade_win, self.context, true)
for _, win in ipairs(upgrade_win) do
	win:SetRolloverAnchorId("node")
end
XContextControl.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idEffects",
			'LayoutMethod', "HList",
			'FoldWhenHidden', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Margins', box(10, 0, 0, 0),
				'Padding', box(0, 0, 0, 0),
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 290,
				'MaxWidth', 290,
				'TextFont', "InfopanelTitle",
				'TextColor', RGBA(255, 248, 233, 255),
				'RolloverTextColor', RGBA(255, 248, 233, 255),
				'Translate', true,
				'Text', T{7412, --[[XTemplate BuildingOverviewRow Text]] "<DisplayName>"},
				'Shorten', true,
			}),
			PlaceObj('XTemplateWindow', {
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 230,
				'MaxWidth', 230,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idConsumption",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 248, 233, 255),
					'RolloverTextColor', RGBA(255, 248, 233, 255),
					'Translate', true,
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idNoConsumption",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'Image', "UI/Common/line.tga",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 230,
				'MaxWidth', 230,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idProduction",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 248, 233, 255),
					'RolloverTextColor', RGBA(255, 248, 233, 255),
					'Translate', true,
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idNoProduction",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'Image', "UI/Common/line.tga",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 220,
				'MaxWidth', 220,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idBuildingEffects",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 248, 233, 255),
					'RolloverTextColor', RGBA(255, 248, 233, 255),
					'Translate', true,
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idNoBuildingEffects",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'Image', "UI/Common/line.tga",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idUpgrades",
				'MinWidth', 177,
				'MaxWidth', 177,
				'ScaleModifier', point(770, 770),
				'LayoutMethod', "HList",
				'LayoutHSpacing', 10,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idShifts",
			'Visible', false,
			'FoldWhenHidden', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__context_of_kind', "ShiftsBuilding",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateForEach', {
					'array', function (parent, context) return nil, 1, 3 end,
					'map', function (parent, context, array, i) return i end,
					'item_in_context', "shift",
					'run_after', function (child, context, item, i, n)
child:SetRelativeFocusOrder("next-in-line")
child.idBackground:SetMargins(box(0,0,0,0))
child.idActive:SetMargins(box(0,0,0,0))
child.idRollover2:SetMargins(box(0,37,0,-8))
child.idIcon:SetMargins(box(-28,0,0,0))
child.idContent:SetMargins(box(2, 3, 20, 0))
CreateRealTimeThread(function(child)
	if child.window_state == "destroying" then return end
	for _, win in ipairs(child.idWorkers) do
		win:SetRolloverAnchor("left")
		win:SetRolloverAnchorId("idRow")
	end
	child.idOvertime:SetRolloverAnchor("left")
	child.idOvertime:SetRolloverAnchorId("idRow")
end, child)
end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "sectionWorkshiftsRow",
						'RolloverAnchorId', "node",
						'MinWidth', 372,
						'MaxWidth', 372,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__context_of_kind', "Residence",
				'HAlign', "center",
				'VAlign', "center",
				'MinWidth', 1116,
				'MaxWidth', 1116,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "sectionResidenceList",
					'LayoutMethod', "HOverlappingList",
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "Open",
						'func', function (self, ...)
XContextControl.Open(self, ...)
for _, win in ipairs(self) do
	win:SetRolloverAnchor("left")
	win:SetRolloverAnchorId("idRow")
end
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return not IsKindOfClasses(context, "ShiftsBuilding", "Residence") end,
				'MinWidth', 1116,
				'MaxWidth', 1116,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Margins', box(0, 5, 0, 0),
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'HandleMouse', false,
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 248, 233, 255),
					'RolloverTextColor', RGBA(255, 248, 233, 255),
					'Translate', true,
					'Text', T{130, --[[XTemplate BuildingOverviewRow Text]] "N/A"},
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		}),
})

