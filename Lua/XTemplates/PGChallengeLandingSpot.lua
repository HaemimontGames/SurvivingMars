-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGChallengeLandingSpot",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return LandingSiteObjectCreateAndLoad{challenge_mode = true, landing_preset_group = "Challenges"} end,
		'__class', "XDialog",
		'Id', "idLandingSpot",
		'Padding', box(0, 65, 100, 50),
		'LayoutMethod', "VList",
		'HandleMouse', true,
		'OnContextUpdate', function (self, context, ...)
self.idSiteSummary:SetVisible(not context.challenge_summary)
self.idChallengeSummary:SetVisible(context.challenge_summary)
self:ResolveId("idEffectsTextArea"):ScrollTo(0,0)
end,
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
			'Text', T{4132, --[[XTemplate PGChallengeLandingSpot Text]] "<LS> Select landing spot"},
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
			'Text', T{4133, --[[XTemplate PGChallengeLandingSpot Text]] "<left_click> Select landing spot"},
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
local select_spot = GetDialog(self.parent).context.select_spot
if select_spot then
	self.context:SelectChallengeSpot(select_spot)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "list",
			'ActionName', T{437247068170, --[[XTemplate PGChallengeLandingSpot ActionName]] "LIST"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonY",
			'OnActionEffect', "mode",
			'OnActionParam', "gallery",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "summary",
			'ActionName', T{193636721608, --[[XTemplate PGChallengeLandingSpot ActionName]] "SUMMARY"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonA",
			'ActionState', function (self, host)
if not host.context.snapped_id then
	return "disabled"
end
end,
			'OnAction', function (self, host, source)
host.context.challenge_summary = not host.context.challenge_summary
ObjModified(host.context)
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate PGChallengeLandingSpot ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnAction', function (self, host, source)
host:SetMode("")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "next",
			'ActionName', T{613161619069, --[[XTemplate PGChallengeLandingSpot ActionName]] "NEXT"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonX",
			'ActionState', function (self, host)
if not host.context.snapped_id then
	return "disabled"
end
end,
			'OnActionEffect', "mode",
			'OnActionParam', "payload",
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
			'MinWidth', 470,
			'MaxWidth', 470,
			'MaxHeight', 770,
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
					'Text', T{482503373345, --[[XTemplate PGChallengeLandingSpot Text]] "<white><Coord></white>"},
					'HideOnEmpty', true,
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
self:SetVisible(not context.snapped_id)
end,
					'Translate', true,
					'Text', T{554914047909, --[[XTemplate PGChallengeLandingSpot Text]] "Challenge yourself to accomplish a specific objective within a time limit.\n\nMission parameters and colony site are predetermined."},
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
						'Dock', "top",
						'HAlign', "right",
						'MinHeight', 103,
						'MaxWidth', 400,
						'TextFont', "PGLandingPosDetails",
						'TextColor', RGBA(118, 163, 222, 255),
						'RolloverTextColor', RGBA(118, 163, 222, 255),
						'Translate', true,
						'Text', T{206656418718, --[[XTemplate PGChallengeLandingSpot Text]] "<white><ChallengeDescr></white>\nDeadline <white>Sol <DeadlineCompleted></white>"},
						'TextHAlign', "right",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-340, 20, -40, -130),
						'Dock', "top",
						'Image', "UI/Common/pm_pad_large.tga",
						'FrameBox', box(320, 0, 40, 0),
						'SqueezeY', false,
						'FlipY', true,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Dock', "top",
						'HAlign', "right",
						'MaxWidth', 400,
						'TextFont', "PGLandingPosDetails",
						'TextColor', RGBA(118, 163, 222, 255),
						'RolloverTextColor', RGBA(118, 163, 222, 255),
						'Translate', true,
						'Text', T{764324332877, --[[XTemplate PGChallengeLandingSpot Text]] "Mission Sponsor <white><MissionSponsor></white>\nCommander Profile <white><CommanderProfile></white>\nGame Rules <white><GameRulesList></white>\nMystery <white>None</white>"},
						'TextHAlign', "right",
					}),
					PlaceObj('XTemplateWindow', {
						'Id', "idSiteSummary",
						'Dock', "top",
						'MinHeight', 465,
						'MaxHeight', 465,
						'LayoutMethod', "VList",
						'FoldWhenHidden', true,
					}, {
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
							'Text', T{4270, --[[XTemplate PGChallengeLandingSpot Text]] "RESOURCES"},
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
							'Text', T{4271, --[[XTemplate PGChallengeLandingSpot Text]] "THREATS"},
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
						'Id', "idChallengeSummary",
						'MinHeight', 465,
						'MaxHeight', 465,
						'LayoutMethod', "VList",
						'Visible', false,
						'FoldWhenHidden', true,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Margins', box(-340, 20, -40, -130),
							'Dock', "top",
							'Image', "UI/Common/pm_pad_large.tga",
							'FrameBox', box(320, 0, 40, 0),
							'SqueezeY', false,
							'FlipY', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Margins', box(0, 0, 0, 20),
							'Dock', "top",
							'HAlign', "right",
							'TextFont', "PGMissionDescrTitle",
							'TextColor', RGBA(96, 135, 185, 255),
							'Translate', true,
							'Text', T{598247262120, --[[XTemplate PGChallengeLandingSpot Text]] "SUMMARY"},
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XScrollArea",
							'Id', "idEffectsTextArea",
							'IdNode', false,
							'LayoutMethod', "VList",
							'VScroll', "idScrollbar",
							'MouseWheelStep', 40,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'HAlign', "right",
								'MinWidth', 400,
								'MaxWidth', 400,
								'Clip', false,
								'TextFont', "PGChallengeSummary",
								'TextColor', RGBA(118, 163, 222, 255),
								'RolloverTextColor', RGBA(118, 163, 222, 255),
								'Translate', true,
								'Text', T{591728743894, --[[XTemplate PGChallengeLandingSpot Text]] "<MissionSponsorEffect><newline><CommanderEffect><newline><GameRuleEffects>"},
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "Scrollbar",
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
		}),
})

