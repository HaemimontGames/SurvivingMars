-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMissionLandingSpot",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return LandingSiteObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Padding', box(70, 68, 0, 25),
		'LayoutMethod', "VList",
		'HandleMouse', true,
		'InitialMode', "items",
		'InternalModes', "items,prefabs",
	}, {
		PlaceObj('XTemplateWindow', {
			'Id', "idSelector",
			'Dock', "ignore",
			'HAlign', "left",
			'VAlign', "top",
			'MinWidth', 73,
			'MinHeight', 62,
			'MaxWidth', 73,
			'MaxHeight', 62,
			'Visible', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "DrawContent(self)",
				'func', function (self)
self.parent.context:DrawSelector(self)
end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idSpotTemplate",
			'Dock', "ignore",
			'HAlign', "left",
			'VAlign', "top",
			'Visible', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "DrawContent(self)",
				'func', function (self)
self.parent.context:DrawSpot(self)
end,
			}),
			}),
		PlaceObj('XTemplateLayer', {
			'layer', "MarsPlanet",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idtxtCoord",
			'Margins', box(-150, -35, 0, 0),
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'MinWidth', 300,
			'MaxWidth', 300,
			'Clip', false,
			'TextStyle', "PlanetCoordinates",
			'Translate', true,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__condition', function (parent, context) return GetUIStyleGamepad() end,
			'__class', "XText",
			'Id', "idHint",
			'Margins', box(-300, -65, 0, 0),
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'MinWidth', 600,
			'MaxWidth', 600,
			'Clip', false,
			'TextStyle', "PlanetCoordinates",
			'Translate', true,
			'Text', T{4132, --[[XTemplate PGMissionLandingSpot Text]] "<LS> Select landing spot"},
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__condition', function (parent, context) return not GetUIStyleGamepad() end,
			'__class', "XText",
			'Id', "idHint",
			'Margins', box(-300, -65, 0, 0),
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'MinWidth', 600,
			'MaxWidth', 600,
			'Clip', false,
			'TextStyle', "PlanetCoordinates",
			'Translate', true,
			'Text', T{4133, --[[XTemplate PGMissionLandingSpot Text]] "<left_click> Select landing spot"},
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
self.context:MouseButtonDown(pos, button)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonUp(self, pos, button)",
			'func', function (self, pos, button)
self.context:MouseButtonUp(pos, button)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMousePos(self, pos)",
			'func', function (self, pos)
self.context:MousePos(pos)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnKbdKeyDown(self, virtual_key, repeated)",
			'func', function (self, virtual_key, repeated)
self.context:KbdKeyDown(virtual_key, repeated)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnKbdKeyUp(self, char, virtual_key, repeated)",
			'func', function (self, char, virtual_key, repeated)
self.context:KbdKeyUp(char, virtual_key, repeated)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
self:DeleteThread("drag")
self:DeleteThread("spin")
self:DeleteThread("easing")
self:DeleteThread("visibility")
self:DeleteThread("gamepad")
g_SelectedSpotChallengeMods = false
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
g_SelectedSpotChallengeMods = {}
g_CurrentMissionParams.SelectedSpotChallengeMods = g_SelectedSpotChallengeMods
XDialog.Open(self, ...)
self.context:InitData(self)
local padding = GetSafeMargins(self:GetPadding())
self:SetPadding(padding)
self.idHint:SetMargins(box(-300-padding:minx(), -padding:miny(), 0, 0))
self.idtxtCoord:SetMargins(box(-150-padding:minx(), -padding:miny()+30, 0, 0))
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate PGMissionLandingSpot ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "mode",
			'OnActionParam', "payload",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "custom",
			'ActionName', T{5462, --[[XTemplate PGMissionLandingSpot ActionName]] "CUSTOM"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "LeftTrigger",
			'OnAction', function (self, host, source)
host.context:Custom()
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "random",
			'ActionName', T{5461, --[[XTemplate PGMissionLandingSpot ActionName]] "RANDOM"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonY",
			'OnAction', function (self, host, source)
host.context:Random()
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "start",
			'ActionName', T{5452, --[[XTemplate PGMissionLandingSpot ActionName]] "START"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonX",
			'ActionState', function (self, host)
if not g_CurrentMapParams.latitude
	or not g_CurrentMapParams.longitude then
	return "disabled"
end
end,
			'OnAction', function (self, host, source)
MarkNameAsUsed("Rocket", g_CurrentMapParams.rocket_name_base)
GenerateCurrentRandomMap()
end,
			'FXPress', "StartGameButtonClick",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBarNew",
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(0, 0, 0, 20),
			'Dock', "left",
			'VAlign', "center",
			'MinWidth', 600,
			'MaxWidth', 600,
			'MaxHeight', 848,
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFitContent",
				'IdNode', false,
				'LayoutMethod', "VList",
				'Fit', "height",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(45, -29, 0, 0),
					'Title', T{10894, --[[XTemplate PGMissionLandingSpot Title]] "COLONY SITE"},
					'Subtitle', T{774720837511, --[[XTemplate PGMissionLandingSpot Subtitle]] "Difficulty Challenge <percent(DifficultyBonus)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleSmall",
					'Margins', box(45, 20, 0, 0),
					'Title', T{482503373345, --[[XTemplate PGMissionLandingSpot Title]] "<white><Coord></white>"},
					'BigImage', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Margins', box(45, 11, 0, 0),
					'Dock', "top",
					'HAlign', "left",
					'MinHeight', 350,
					'MaxWidth', 350,
					'MaxHeight', 350,
					'FoldWhenHidden', true,
					'HandleMouse', false,
					'TextStyle', "PGChallengeDescription",
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.lat)
end,
					'Translate', true,
					'Text', T{563905386684, --[[XTemplate PGMissionLandingSpot Text]] "Map topology, threats and available resources will be determined by the chosen site. You can replay a game on the same map by entering the same custom coordinates."},
					'HideOnEmpty', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextWindow",
					'MinHeight', 202,
					'MaxHeight', 202,
					'Visible', false,
					'FoldWhenHidden', true,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.lat)
end,
				}),
				PlaceObj('XTemplateWindow', {
					'Id', "idContent",
					'LayoutMethod', "VList",
					'Visible', false,
					'FoldWhenHidden', true,
				}, {
					PlaceObj('XTemplateWindow', {
						'Margins', box(45, 20, 0, 140),
						'Dock', "top",
						'LayoutMethod', "HList",
						'LayoutHSpacing', 50,
					}, {
						PlaceObj('XTemplateWindow', {
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T{11441, --[[XTemplate PGMissionLandingSpot Text]] "Average Altitude"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T{240235194104, --[[XTemplate PGMissionLandingSpot Text]] "Mean Temperature"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T{284813068603, --[[XTemplate PGMissionLandingSpot Text]] "Topography"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T{612693411923, --[[XTemplate PGMissionLandingSpot Text]] "<Altitude> m"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T{890132817809, --[[XTemplate PGMissionLandingSpot Text]] "<Temperature>°C"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T{187145140709, --[[XTemplate PGMissionLandingSpot Text]] "<MapDifficulty>"},
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(45, 0, 0, 0),
						'Dock', "top",
						'MinHeight', 310,
						'MaxHeight', 310,
						'LayoutMethod', "HList",
						'LayoutHSpacing', 40,
						'FoldWhenHidden', true,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Margins', box(-300, 0, 0, 0),
							'Dock', "box",
							'VAlign', "top",
							'MinWidth', 568,
							'Image', "UI/CommonNew/pg_action_bar.tga",
							'FrameBox', box(42, 0, 341, 0),
							'TileFrame', true,
							'SqueezeY', false,
						}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 22, 0, 0),
							'VAlign', "top",
							'LayoutMethod', "VList",
							'LayoutVSpacing', 30,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'Padding', box(0, 0, 0, 0),
								'TextStyle', "MediumHeader",
								'Translate', true,
								'Text', T{4271, --[[XTemplate PGMissionLandingSpot Text]] "THREATS"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XContentTemplateList",
								'BorderWidth', 0,
								'LayoutVSpacing', 10,
								'Clip', false,
								'Background', RGBA(0, 0, 0, 0),
								'FocusedBackground', RGBA(0, 0, 0, 0),
								'VScroll', "idScroll",
								'ShowPartialItems', false,
							}, {
								PlaceObj('XTemplateForEach', {
									'comment', "item",
									'array', function (parent, context) return context:GetProperties() end,
									'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and item.category == "Threats" end,
									'item_in_context', "prop_meta",
									'run_after', function (child, context, item, i, n)
child:SetRolloverTitle(item.rollover.title)
child:SetRolloverText(item.rollover.descr)
end,
								}, {
									PlaceObj('XTemplateTemplate', {
										'__template', "PropLandingParam",
										'RolloverTemplate', "Rollover",
									}),
									}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 22, 0, 0),
							'VAlign', "top",
							'LayoutMethod', "VList",
							'LayoutVSpacing', 30,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'Padding', box(0, 0, 0, 0),
								'TextStyle', "MediumHeader",
								'Translate', true,
								'Text', T{4270, --[[XTemplate PGMissionLandingSpot Text]] "RESOURCES"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XContentTemplateList",
								'BorderWidth', 0,
								'LayoutVSpacing', 10,
								'Clip', false,
								'Background', RGBA(0, 0, 0, 0),
								'FocusedBackground', RGBA(0, 0, 0, 0),
								'VScroll', "idScroll",
								'ShowPartialItems', false,
							}, {
								PlaceObj('XTemplateForEach', {
									'comment', "item",
									'array', function (parent, context) return context:GetProperties() end,
									'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and item.category == "Resources" end,
									'item_in_context', "prop_meta",
									'run_after', function (child, context, item, i, n)
child:SetRolloverTitle(item.rollover.title)
child:SetRolloverText(item.rollover.descr)
end,
								}, {
									PlaceObj('XTemplateTemplate', {
										'__template', "PropLandingParam",
										'RolloverTemplate', "Rollover",
									}),
									}),
								}),
							}),
						}),
					}),
				}),
			}),
		}),
})

