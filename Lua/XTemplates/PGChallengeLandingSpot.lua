-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGChallengeLandingSpot",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return LandingSiteObjectCreateAndLoad{challenge_mode = true, landing_preset_group = "Challenges"} end,
		'__class', "XDialog",
		'Id', "idLandingSpot",
		'Padding', box(70, 68, 0, 25),
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
			'Text', T(4132, --[[XTemplate PGChallengeLandingSpot Text]] "<LS> Select landing spot"),
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
			'Text', T(4133, --[[XTemplate PGChallengeLandingSpot Text]] "<left_click> Select landing spot"),
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
			'ActionId', "back",
			'ActionName', T(4254, --[[XTemplate PGChallengeLandingSpot ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnAction', function (self, host, source)
CreateRealTimeThread(function()
	OpenPreGameMainMenu()
end)
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "summary",
			'ActionName', T(193636721608, --[[XTemplate PGChallengeLandingSpot ActionName]] "SUMMARY"),
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
			'ActionId', "list",
			'ActionName', T(437247068170, --[[XTemplate PGChallengeLandingSpot ActionName]] "LIST"),
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonY",
			'OnActionEffect', "mode",
			'OnActionParam', "gallery",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "next",
			'ActionName', T(613161619069, --[[XTemplate PGChallengeLandingSpot ActionName]] "NEXT"),
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
			'__template', "ActionBarNew",
			'Margins', box(45, 0, 0, 0),
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
					'Title', T(10880, --[[XTemplate PGChallengeLandingSpot Title]] "CHALLENGES"),
					'Subtitle', T(545701017966, --[[XTemplate PGChallengeLandingSpot Subtitle]] "Completed <CompletedChallenges>/<TotalChallenges>"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleSmall",
					'Margins', box(45, 20, 0, 0),
					'Title', T(482503373345, --[[XTemplate PGChallengeLandingSpot Title]] "<white><Coord></white>"),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Margins', box(45, 8, 0, 0),
					'Dock', "top",
					'HAlign', "left",
					'MinHeight', 350,
					'MaxWidth', 350,
					'MaxHeight', 350,
					'FoldWhenHidden', true,
					'HandleMouse', false,
					'TextStyle', "PGChallengeDescription",
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.snapped_id)
end,
					'Translate', true,
					'Text', T(11440, --[[XTemplate PGChallengeLandingSpot Text]] "Challenge yourself to accomplish a specific objective within a time limit.\n\n\nMission parameters and colony site are predetermined."),
					'HideOnEmpty', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextWindow",
					'MinHeight', 235,
					'MaxHeight', 235,
					'Visible', false,
					'FoldWhenHidden', true,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.snapped_id)
end,
				}),
				PlaceObj('XTemplateWindow', {
					'Id', "idContent",
					'LayoutMethod', "VList",
					'Visible', false,
					'FoldWhenHidden', true,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Margins', box(45, 8, 0, 0),
						'Dock', "top",
						'HAlign', "left",
						'MinHeight', 66,
						'MaxWidth', 400,
						'HandleMouse', false,
						'TextStyle', "PGChallengeDescription",
						'Translate', true,
						'Text', T(643061748800, --[[XTemplate PGChallengeLandingSpot Text]] "<ChallengeDescr>"),
						'HideOnEmpty', true,
					}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(45, 20, 0, 3),
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
								'Text', T(764324332877, --[[XTemplate PGChallengeLandingSpot Text]] "Deadline"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(862915989275, --[[XTemplate PGChallengeLandingSpot Text]] "Perfect Time"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(3474, --[[XTemplate PGChallengeLandingSpot Text]] "Mission Sponsor"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(3478, --[[XTemplate PGChallengeLandingSpot Text]] "Commander Profile"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(8800, --[[XTemplate PGChallengeLandingSpot Text]] "Game Rules"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(3486, --[[XTemplate PGChallengeLandingSpot Text]] "Mystery"),
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
								'Text', T(225737815082, --[[XTemplate PGChallengeLandingSpot Text]] "Sol <DeadlineCompleted>"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T(756685042373, --[[XTemplate PGChallengeLandingSpot Text]] "Sol <DeadlinePerfected>"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T(557585078425, --[[XTemplate PGChallengeLandingSpot Text]] "<MissionSponsor>"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T(682229755647, --[[XTemplate PGChallengeLandingSpot Text]] "<CommanderProfile>"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T(639503956525, --[[XTemplate PGChallengeLandingSpot Text]] "<GameRulesList>"),
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'HandleMouse', false,
								'TextStyle', "PGChallengeDescription",
								'Translate', true,
								'Text', T(7072, --[[XTemplate PGChallengeLandingSpot Text]] "None"),
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'Id', "idSiteSummary",
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
								'Text', T(4271, --[[XTemplate PGChallengeLandingSpot Text]] "THREATS"),
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
								'Text', T(4270, --[[XTemplate PGChallengeLandingSpot Text]] "RESOURCES"),
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
					PlaceObj('XTemplateWindow', {
						'Id', "idChallengeSummary",
						'MinHeight', 310,
						'MaxHeight', 310,
						'LayoutMethod', "VList",
						'Visible', false,
						'FoldWhenHidden', true,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "DialogTitleSmall",
							'Title', T(193636721608, --[[XTemplate PGChallengeLandingSpot Title]] "SUMMARY"),
						}),
						PlaceObj('XTemplateWindow', {
							'Padding', box(0, 10, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XScrollArea",
								'Id', "idEffectsTextArea",
								'IdNode', false,
								'Padding', box(29, 0, 0, 0),
								'LayoutMethod', "VList",
								'VScroll', "idScrollbar",
								'MouseWheelStep', 40,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Clip', false,
									'HandleMouse', false,
									'TextStyle', "PGMissionEffects",
									'Translate', true,
									'Text', T(591728743894, --[[XTemplate PGChallengeLandingSpot Text]] "<MissionSponsorEffect><newline><CommanderEffect><newline><GameRuleEffects>"),
								}),
								}),
							PlaceObj('XTemplateTemplate', {
								'__template', "ScrollbarNew",
								'Id', "idScrollbar",
								'Target', "idEffectsTextArea",
							}),
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
	PlaceObj('XTemplateWindow', {
		'Margins', box(0, 22, 0, 0),
		'VAlign', "top",
		'LayoutMethod', "VList",
		'LayoutVSpacing', 30,
	}),
})

