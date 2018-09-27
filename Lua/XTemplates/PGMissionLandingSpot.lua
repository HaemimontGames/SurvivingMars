-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMissionLandingSpot",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return LandingSiteObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Padding', box(0, 65, 100, 50),
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
			'TextFont', "PreGamePlanetCoordinates",
			'TextColor', RGBA(250, 236, 208, 255),
			'RolloverTextColor', RGBA(250, 236, 208, 255),
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
			'TextFont', "PreGamePlanetCoordinates",
			'TextColor', RGBA(250, 236, 208, 255),
			'RolloverTextColor', RGBA(250, 236, 208, 255),
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
			'TextFont', "PreGamePlanetCoordinates",
			'TextColor', RGBA(250, 236, 208, 255),
			'RolloverTextColor', RGBA(250, 236, 208, 255),
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
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate PGMissionLandingSpot ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "mode",
			'OnActionParam', "payload",
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
			'__template', "ActionBar",
			'MinWidth', 550,
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(0, 0, 0, 20),
			'Dock', "box",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 350,
			'MaxWidth', 470,
			'MaxHeight', 670,
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFitContent",
				'IdNode', false,
				'LayoutMethod', "VList",
				'Fit', "height",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGLandingPosDetails",
					'TextColor', RGBA(118, 163, 222, 255),
					'RolloverTextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{482503373345, --[[XTemplate PGMissionLandingSpot Text]] "<white><Coord></white>"},
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Margins', box(0, 15, 0, 0),
					'Dock', "top",
					'HAlign', "right",
					'FoldWhenHidden', true,
					'TextFont', "PGResource",
					'TextColor', RGBA(96, 135, 185, 255),
					'RolloverTextColor', RGBA(96, 135, 185, 255),
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.lat)
end,
					'Translate', true,
					'Text', T{563905386684, --[[XTemplate PGMissionLandingSpot Text]] "Map topology, threats and available resources will be determined by the chosen site. You can replay a game on the same map by entering the same custom coordinates."},
					'HideOnEmpty', true,
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateWindow', {
					'Id', "idContent",
					'LayoutMethod', "VList",
					'Visible', false,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'HAlign', "right",
						'TextFont', "PGLandingPosDetails",
						'TextColor', RGBA(118, 163, 222, 255),
						'RolloverTextColor', RGBA(118, 163, 222, 255),
						'Translate', true,
						'Text', T{609979737076, --[[XTemplate PGMissionLandingSpot Text]] "Average Altitude <white><Altitude> m</white><newline>Mean Temperature <white><Temperature>°C</white><newline>Topography <white><MapDifficulty></white>"},
						'TextHAlign', "right",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-340, 20, -40, -130),
						'Image', "UI/Common/pm_pad_large.tga",
						'FrameBox', box(320, 0, 40, 0),
						'SqueezeY', false,
						'FlipY', true,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(0, 0, 0, 20),
						'HAlign', "right",
						'TextFont', "PGMissionDescrTitle",
						'TextColor', RGBA(96, 135, 185, 255),
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
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-340, 20, -40, -130),
						'Image', "UI/Common/pm_pad_large.tga",
						'FrameBox', box(320, 0, 40, 0),
						'SqueezeY', false,
						'FlipY', true,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(0, 0, 0, 20),
						'HAlign', "right",
						'TextFont', "PGMissionDescrTitle",
						'TextColor', RGBA(96, 135, 185, 255),
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
				}),
			}),
		}),
	PlaceObj('XTemplateFunc', {
		'name', "Open",
	}),
})

