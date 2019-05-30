-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "LifeSupportGridsOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "lifesupport",
		'InternalModes', "lifesupport",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T(738333831460, --[[XTemplate LifeSupportGridsOverview Title]] "LIFE SUPPORT GRIDS"),
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
						'VAlign', "top",
						'MinWidth', 250,
						'MaxWidth', 250,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(550311643207, --[[XTemplate LifeSupportGridsOverview Text]] "Name"),
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "production",
						'__class', "XText",
						'MinWidth', 200,
						'MaxWidth', 200,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(80, --[[XTemplate LifeSupportGridsOverview Text]] "Production"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "consumption",
						'__class', "XText",
						'MinWidth', 200,
						'MaxWidth', 200,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(347, --[[XTemplate LifeSupportGridsOverview Text]] "Consumption"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "stored power",
						'__class', "XText",
						'MinWidth', 200,
						'MaxWidth', 200,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(359672804540, --[[XTemplate LifeSupportGridsOverview Text]] "Stored Resources"),
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "change",
						'__class', "XText",
						'MinWidth', 200,
						'MaxWidth', 200,
						'TextStyle', "OverviewItemSection",
						'Translate', true,
						'Text', T(655663611091, --[[XTemplate LifeSupportGridsOverview Text]] "Change"),
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
							'comment', "life support grids",
							'array', function (parent, context) return GetCommandCenterLifeSupportGrids(context) end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_after', function (child, context, item, i, n)
								child.idTitle:SetText(T{11629, "GRID <i>", i = i})
								child.idButtonIcon:SetImage("UI/Icons/Sections/Water_1.tga")
								child.idButtonIcon:SetColumns(1)
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "LifeSupportGridsOverviewRow",
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
						'Text', T(12189, --[[XTemplate LifeSupportGridsOverview Text]] "No objects to show."),
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
			'ActionName', T(4254, --[[XTemplate LifeSupportGridsOverview ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		}),
})

