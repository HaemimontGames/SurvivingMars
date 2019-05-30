-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "InGame",
	id = "MissionProfileDlg",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PGTitleObjectCreate() end,
		'__class', "MissionProfileDlg",
		'Margins', box(60, 68, 0, 25),
		'HandleMouse', true,
		'ContextUpdateOnOpen', true,
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "MarsPlanet",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideMapOverviewCurtainsLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'LayoutMethod', "HPanel",
		}, {
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(55, 0, 0, 0),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idLogo",
					'Margins', box(500, -13, 0, 0),
					'Dock', "box",
					'HAlign', "left",
					'VAlign', "top",
					'MinWidth', 180,
					'MinHeight', 180,
					'MaxWidth', 180,
					'MaxHeight', 180,
					'Image', "CommonAssets/UI/Controls/Image.tga",
					'ImageFit', "stretch",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T(708805240891, --[[XTemplate MissionProfileDlg Title]] "MISSION GOALS"),
					'Subtitle', T(774720837511, --[[XTemplate MissionProfileDlg Subtitle]] "Difficulty Challenge <percent(DifficultyBonus)>"),
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "close",
					'ActionName', T(4523, --[[XTemplate MissionProfileDlg ActionName]] "CLOSE"),
					'ActionToolbar', "ActionBar",
					'ActionShortcut', "Escape",
					'ActionGamepad', "ButtonB",
					'OnActionEffect', "close",
				}),
				PlaceObj('XTemplateWindow', {
					'MinWidth', 610,
					'MaxWidth', 610,
					'Background', RGBA(0, 255, 0, 0),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplate",
						'IdNode', false,
						'Margins', box(0, 50, 0, 0),
						'RespawnOnContext', false,
					}, {
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 0, 0, 30),
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XScrollArea",
								'Id', "idEffectsTextArea",
								'IdNode', false,
								'Margins', box(39, 0, 0, 0),
								'LayoutMethod', "VList",
								'VScroll', "idScrollbar",
								'MouseWheelStep', 40,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idDescription",
									'HandleMouse', false,
									'TextStyle', "PGMissionEffects",
									'Translate', true,
								}),
								}),
							PlaceObj('XTemplateTemplate', {
								'__template', "ScrollbarNew",
								'Id', "idScrollbar",
								'Target', "idEffectsTextArea",
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "actionScrollAreaDown",
								'ActionGamepad', "RightThumbDown",
								'OnAction', function (self, host, source)
									local text_area = host:ResolveId("idEffectsTextArea")
									if text_area:GetVisible() then
										return text_area:OnMouseWheelBack()
									end
								end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "actionScrollAreaUp",
								'ActionGamepad', "RightThumbUp",
								'OnAction', function (self, host, source)
									local text_area = host:ResolveId("idEffectsTextArea")
									if text_area:GetVisible() then
										return text_area:OnMouseWheelForward()
									end
								end,
							}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(0, 70, 0, 20),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XSizeConstrainedWindow",
					'Id', "idList",
					'HAlign', "center",
					'VAlign', "center",
					'LayoutMethod', "VList",
					'LayoutVSpacing', 20,
					'UniformRowHeight', true,
					'BorderColor', RGBA(0, 0, 0, 0),
					'HandleKeyboard', false,
					'ChildrenHandleMouse', false,
				}),
				}),
			}),
		}),
})

