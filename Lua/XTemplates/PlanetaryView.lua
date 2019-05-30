-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "PlanetaryView",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return LandingSiteObjectCreateAndLoad{planetary_view = true, landing_preset_group = "MarsScreen", map_params = MarsScreenMapParams, expedition_rocket = context and context.rocket} end,
		'__class', "XDialog",
		'Id', "idLandingSpot",
		'Padding', box(60, 68, 0, 25),
		'LayoutMethod', "VList",
		'HandleMouse', true,
		'InitialMode', "initial",
		'InternalModes', "initial, rockets, routes",
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "XHideNonEssentialUILayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInfopanelLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInfobarLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideMapOverviewCurtainsLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return not g_CommandCenterOpen end,
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XCameraLockLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XSuppressInputLayer",
		}),
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
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'MinWidth', 500,
			'MaxWidth', 500,
			'Clip', false,
			'TextStyle', "PlanetCoordinates",
			'Translate', true,
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
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				HideGamepadCursor("planetary_view")
				XDialog.Open(self, ...)
				self.context:InitData(self)
				local padding = GetSafeMargins(self:GetPadding())
				self:SetPadding(padding)
				self.idtxtCoord:SetMargins(box(-250-padding:minx(), -padding:miny()+40, 0, 0))
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
				return self.context:OnShortcut(shortcut, source)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
				ShowGamepadCursor("planetary_view")
				Msg("ClosePlanetaryView")
				XDialog.Close(self, ...)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetMode",
			'func', function (self, ...)
				XDialog.SetMode(self, ...)
				self.context:ShowContent()
			end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBarNew",
			'Margins', box(55, 0, 0, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 570,
			'MaxHeight', 890,
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XSizeConstrainedWindow",
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T(931381024216, --[[XTemplate PlanetaryView Title]] "PLANETARY VIEW"),
					'SmallImage', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplate",
					'IdNode', false,
					'OnContextUpdate', function (self, context, ...)
						XContentTemplate.OnContextUpdate(self, context, ...)
						self.context:ShowContent()
					end,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "initial",
					}, {
						PlaceObj('XTemplateAction', {
							'ActionId', "close",
							'ActionName', T(4523, --[[XTemplate PlanetaryView ActionName]] "CLOSE"),
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "close",
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "expedition",
							'ActionName', T(960994412922, --[[XTemplate PlanetaryView ActionName]] "SEND EXPEDITION"),
							'ActionToolbar', "ActionBar",
							'ActionGamepad', "ButtonX",
							'ActionState', function (self, host)
								local spot = host.context.selected_spot
								return spot and (spot.spot_type == "anomaly"  or (spot.spot_type=="project" and spot:PrerequisiteToStart())) and not spot.rocket or "hidden"
							end,
							'OnAction', function (self, host, source)
								if PlanetaryExpeditionPossible("use in orbit") then
									local context = host.context
									if context.expedition_rocket then
										SendExpeditionAction(context.expedition_rocket, context.selected_spot, host)
										return
									end
									host:SetMode("rockets")
								else
									PromptNoAvailableRockets()
								end
							end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "cancelExpedition",
							'ActionName', T(762629505520, --[[XTemplate PlanetaryView ActionName]] "CANCEL EXPEDITION"),
							'ActionToolbar', "ActionBar",
							'ActionGamepad', "ButtonX",
							'ActionState', function (self, host)
								local spot = host.context.selected_spot
								return spot and (spot.spot_type == "anomaly" or spot.spot_type == "project") and spot.rocket or "hidden"
							end,
							'OnAction', function (self, host, source)
								CancelExpedition(host.context.selected_spot.rocket, host, host.context.selected_spot)
							end,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "DialogTitleSmall",
							'Margins', box(55, 0, 0, 0),
							'Title', T(482503373345, --[[XTemplate PlanetaryView Title]] "<white><Coord></white>"),
							'BigImage', true,
						}),
						PlaceObj('XTemplateWindow', {
							'Id', "idContent",
							'MinHeight', 613,
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "POIAdditionalContent",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(55, 20, 0, 0),
								'Padding', box(0, 0, 0, 0),
								'HAlign', "left",
								'MaxWidth', 500,
								'HandleMouse', false,
								'TextStyle', "PGLandingPosDetails",
								'Translate', true,
								'Text', T(717906085951, --[[XTemplate PlanetaryView Text]] "<AnomalyDescription>"),
								'HideOnEmpty', true,
							}),
							PlaceObj('XTemplateWindow', {
								'__condition', function (parent, context) return not context.selected_spot end,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XList",
									'Id', "idPOIList",
									'Margins', box(39, 20, 0, 0),
									'BorderWidth', 0,
									'Padding', box(0, 0, 0, 0),
									'LayoutVSpacing', 6,
									'UniformRowHeight', true,
									'Clip', false,
									'Background', RGBA(0, 0, 0, 0),
									'FocusedBackground', RGBA(0, 0, 0, 0),
									'VScroll', "idScroll",
									'ShowPartialItems', false,
									'LeftThumbScroll', false,
								}, {
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return GetSortedMarsPointsOfInterest() end,
										'__context', function (parent, context, item, i, n) return item end,
										'run_after', function (child, context, item, i, n)
											child:SetText(item.display_name)
										end,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__template', "MenuEntrySmall",
											'OnPress', function (self, gamepad)
												local obj = GetDialog(self).context
												obj:MoveToSelection(self.context.latitude * 60, self.context.longitude * 60, nil, true)
												obj:CalcMarkersVisibility()
											end,
										}),
										}),
									}),
								PlaceObj('XTemplateTemplate', {
									'__template', "ScrollbarNew",
									'Id', "idScroll",
									'Target', "idPOIList",
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "project",
								'__condition', function (parent, context) return context.selected_spot and context.selected_spot.spot_type == "project" end,
								'Margins', box(55, 20, 0, 0),
								'LayoutMethod', "HList",
								'LayoutHSpacing', 50,
							}, {
								PlaceObj('XTemplateWindow', {
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "additional inventory",
										'__condition', function (parent, context) return next(context.selected_spot:GetRocketResources()) end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(387987656324, --[[XTemplate PlanetaryView Text]] "Additional Inventory"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "expedition time",
										'__condition', function (parent, context) return not context.selected_spot.rocket end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(874227567877, --[[XTemplate PlanetaryView Text]] "Expedition time"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "outcome",
										'__condition', function (parent, context) return context.selected_spot:ShowOutcomeText() end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(130571839539, --[[XTemplate PlanetaryView Text]] "Outcome"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "destroyed rocket",
										'__condition', function (parent, context) return context.selected_spot and Presets.POI.Default[context.selected_spot.project_id].consume_rocket end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(918384704159, --[[XTemplate PlanetaryView Text]] "<newline><em>The rocket will be lost!</em>"),
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return next(context.selected_spot:GetRocketResources()) end,
										'__class', "XText",
										'Id', "idInventory",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return not context.selected_spot.rocket end,
										'__class', "XText",
										'Id', "idExpeditionTime",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot:ShowOutcomeText() end,
										'__class', "XText",
										'Id', "idOutcome",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									}),
								PlaceObj('XTemplateCode', {
									'run', function (self, parent, context)
										context:SetUIProjectParams()
									end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "anomaly",
								'__condition', function (parent, context) return context.selected_spot and context.selected_spot.spot_type == "anomaly" end,
								'Margins', box(55, 20, 0, 0),
								'LayoutMethod', "HList",
								'LayoutHSpacing', 50,
							}, {
								PlaceObj('XTemplateWindow', {
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "crew",
										'__condition', function (parent, context) return context.selected_spot.requirements and context.selected_spot.requirements.num_crew end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12011, --[[XTemplate PlanetaryView Text]] "Crew"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "specialization",
										'__condition', function (parent, context) return context.selected_spot.requirements and context.selected_spot.requirements.num_crew end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(240, --[[XTemplate PlanetaryView Text]] "Specialization"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "additional inventory",
										'__condition', function (parent, context) return context.selected_spot.requirements and (context.selected_spot.requirements.num_drones or context.selected_spot.requirements.rover_type  or context.selected_spot.requirements.required_resources and next(context.selected_spot.requirements.required_resources)) end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(387987656324, --[[XTemplate PlanetaryView Text]] "Additional Inventory"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "expedition time",
										'__condition', function (parent, context) return not context.selected_spot.rocket end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(874227567877, --[[XTemplate PlanetaryView Text]] "Expedition time"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "outcome",
										'__condition', function (parent, context) return context.selected_spot:ShowOutcomeText() end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(130571839539, --[[XTemplate PlanetaryView Text]] "Outcome"),
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.requirements and context.selected_spot.requirements.num_crew end,
										'__class', "XText",
										'Id', "idCrew",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.requirements and context.selected_spot.requirements.num_crew end,
										'__class', "XText",
										'Id', "idSpecialization",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.requirements and (context.selected_spot.requirements.num_drones or context.selected_spot.requirements.rover_type  or context.selected_spot.requirements.required_resources and next(context.selected_spot.requirements.required_resources)) end,
										'__class', "XText",
										'Id', "idInventory",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return not context.selected_spot.rocket end,
										'__class', "XText",
										'Id', "idExpeditionTime",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot:ShowOutcomeText() end,
										'__class', "XText",
										'Id', "idOutcome",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									}),
								PlaceObj('XTemplateCode', {
									'run', function (self, parent, context)
										context:SetUIAnomalyParams()
									end,
								}),
								}),
							PlaceObj('XTemplateGroup', {
								'comment', "project",
								'__condition', function (parent, context) return context.selected_spot and context.selected_spot.spot_type == "project" and (context.selected_spot.rocket or not context.selected_spot:PrerequisiteToStart()) end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "DialogTitleSmall",
									'Dock', false,
									'Title', T(12012, --[[XTemplate PlanetaryView Title]] "PROGRESS"),
								}),
								PlaceObj('XTemplateWindow', {
									'Margins', box(55, 0, 0, 0),
									'MaxWidth', 630,
									'LayoutMethod', "Grid",
									'LayoutHSpacing', 30,
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "Current Stage",
										'__condition', function (parent, context) return context.selected_spot.rocket or not context.selected_spot:PrerequisiteToStart() end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12013, --[[XTemplate PlanetaryView Text]] "Current Stage"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "Remaining Time",
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.expedition_return_time end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'GridY', 2,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12014, --[[XTemplate PlanetaryView Text]] "Remaining Time"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "Expedition delayed",
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.is_paused end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'GridY', 3,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12015, --[[XTemplate PlanetaryView Text]] "Expedition delayed"),
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.rocket or not context.selected_spot:PrerequisiteToStart() end,
										'__class', "XText",
										'Id', "idStage",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 400,
										'GridX', 2,
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.expedition_return_time end,
										'__class', "XText",
										'Id', "idRemainingTime",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 400,
										'GridX', 2,
										'GridY', 2,
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateCode', {
										'run', function (self, parent, context)
											context:SetUIProjectProgress()
										end,
									}),
									}),
								}),
							PlaceObj('XTemplateGroup', {
								'comment', "anomaly",
								'__condition', function (parent, context) return context.selected_spot and context.selected_spot.spot_type == "anomaly" and context.selected_spot.rocket end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "DialogTitleSmall",
									'Dock', false,
									'Title', T(12012, --[[XTemplate PlanetaryView Title]] "PROGRESS"),
								}),
								PlaceObj('XTemplateWindow', {
									'Margins', box(55, 0, 0, 0),
									'MaxWidth', 630,
									'LayoutMethod', "Grid",
									'LayoutHSpacing', 30,
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "Current Stage",
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12013, --[[XTemplate PlanetaryView Text]] "Current Stage"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "Remaining Time",
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.expedition_return_time end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'GridY', 2,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12014, --[[XTemplate PlanetaryView Text]] "Remaining Time"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "Expedition delayed",
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.is_paused end,
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 200,
										'GridY', 3,
										'HandleMouse', false,
										'TextStyle', "PGLandingPosDetails",
										'Translate', true,
										'Text', T(12015, --[[XTemplate PlanetaryView Text]] "Expedition delayed"),
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idStage",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 400,
										'GridX', 2,
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__condition', function (parent, context) return context.selected_spot.rocket and context.selected_spot.rocket.expedition_return_time end,
										'__class', "XText",
										'Id', "idRemainingTime",
										'Padding', box(0, 0, 0, 0),
										'MaxWidth', 400,
										'GridX', 2,
										'GridY', 2,
										'HandleMouse', false,
										'TextStyle', "PGChallengeDescription",
										'Translate', true,
									}),
									PlaceObj('XTemplateCode', {
										'run', function (self, parent, context)
											context:SetUIAnomalyProgress()
										end,
									}),
									}),
								}),
							PlaceObj('XTemplateGroup', {
								'comment', "our colony",
								'__condition', function (parent, context) return context.selected_spot and context.selected_spot.spot_type == "our_colony" end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PlanetaryViewResources",
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "rockets",
					}, {
						PlaceObj('XTemplateWindow', {
							'Dock', "top",
							'VAlign', "top",
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateWindow', {
								'comment', "trade part",
								'__condition', function (parent, context) local dlg = GetDialog(parent) local param = GetDialogModeParam(dlg) return IsKindOf(param, "MarsTradeRoute") end,
								'Id', "idTradePart",
								'LayoutMethod', "VList",
								'FoldWhenHidden', true,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "DialogTitleSmall",
									'Margins', box(55, 0, 0, 0),
									'Dock', false,
									'Title', T(669520482581, --[[XTemplate PlanetaryView Title]] "Trade"),
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XList",
									'Id', "idTradePropsList",
									'IdNode', false,
									'BorderWidth', 0,
									'Padding', box(0, 0, 0, 0),
									'LayoutVSpacing', 6,
									'BorderColor', RGBA(255, 255, 255, 0),
									'Background', RGBA(255, 255, 255, 0),
									'FocusedBorderColor', RGBA(255, 255, 255, 0),
									'FocusedBackground', RGBA(255, 255, 255, 0),
									'DisabledBorderColor', RGBA(255, 255, 255, 0),
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XControl",
										'Id', "idExportAmount",
										'Margins', box(55, 0, 0, 0),
										'LayoutMethod', "HList",
										'RolloverOnFocus', true,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__template', "PropName",
											'Id', "",
											'Text', T(822920410783, --[[XTemplate PlanetaryView Text]] "Export Amount"),
										}),
										PlaceObj('XTemplateWindow', {
											'__condition', function (parent, context) return GetUIStyleGamepad() end,
											'__class', "XText",
											'Id', "idLB",
											'ScaleModifier', point(1300, 1300),
											'ContextUpdateOnOpen', true,
											'OnContextUpdate', function (self, context, ...)
												self:SetVisible(GetUIStyleGamepad() and self:IsFocused(true))
											end,
											'Translate', true,
											'Text', T(12016, --[[XTemplate PlanetaryView Text]] "<LB>"),
											'TextHAlign', "center",
											'TextVAlign', "center",
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XScrollThumb",
											'Id', "idSlider",
											'VAlign', "center",
											'MinWidth', 240,
											'MouseCursor', "UI/Cursors/Rollover.tga",
											'RelativeFocusOrder', "new-line",
											'Target', "idAmount",
											'Min', 5000,
											'Max', 50000,
											'PageSize', 5000,
											'StepSize', 5000,
											'Horizontal', true,
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XFrame",
												'ZOrder', 0,
												'Image', "UI/Infopanel/progress_bar.tga",
												'FrameBox', box(5, 0, 5, 0),
												'SqueezeY', false,
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XImage",
												'Id', "idThumb",
												'Image', "UI/Infopanel/progress_bar_slider.tga",
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'__condition', function (parent, context) return GetUIStyleGamepad() end,
											'__class', "XText",
											'Id', "idRB",
											'ScaleModifier', point(1300, 1300),
											'ContextUpdateOnOpen', true,
											'OnContextUpdate', function (self, context, ...)
												self:SetVisible(GetUIStyleGamepad() and self:IsFocused(true))
											end,
											'Translate', true,
											'Text', T(634036540793, --[[XTemplate PlanetaryView Text]] "<RB>"),
											'TextHAlign', "center",
											'TextVAlign', "center",
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XText",
											'Id', "idAmount",
											'TextStyle', "PGListItemValue",
											'Translate', true,
											'TextHAlign', "center",
											'TextVAlign', "center",
										}, {
											PlaceObj('XTemplateFunc', {
												'name', "OnScrollTo",
												'func', function (self, ...)
													local args = {...}
													local dlg = GetDialog(self)
													local resource = dlg.mode_param.import
													local value = args[1]
													self:SetText(T{11592, "<num>", num = FormatResource(empty_table, value, resource)})
												end,
											}),
											}),
										PlaceObj('XTemplateWindow', {
											'__class', "XImage",
											'Id', "idRollover",
											'ZOrder', 0,
											'Margins', box(-35, -3, 0, -5),
											'Dock', "box",
											'HAlign', "left",
											'MaxHeight', 32,
											'Visible', false,
											'Image', "UI/CommonNew/pg_selection.tga",
										}),
										PlaceObj('XTemplateFunc', {
											'name', "Open",
											'func', function (self, ...)
												XWindow.Open(self)
												local dlg= GetDialog(self)
												local scroll = self.idSlider
												local value = const.MaxTradeAmount * const.ResourceScale
												scroll:SetScroll(value)
												local resource = dlg.mode_param.import
												local amount = self.idAmount
												amount:SetText(T{11592, "<num>", num = FormatResource(empty_table, value, resource)})
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnShortcut(self, shortcut, source)",
											'func', function (self, shortcut, source)
												if shortcut == "LeftShoulder" or shortcut == "RightShoulder" then	
													local scroll = self.idSlider
													local value = scroll:GetScroll()
													local step = scroll.StepSize
													local min = scroll.Min
													local max = scroll.Max
													value = (shortcut == "LeftShoulder" ) and Max(min, value - step) or Min(max, value + step)
													scroll:ScrollTo(value)
												end
												return XControl.OnShortcut(self, shortcut, source)
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "SetSelected(self, selected)",
											'func', function (self, selected)
												if GetUIStyleGamepad() then
													self:SetFocus(selected)
													local lb = self:ResolveId("idLB")
													if lb then lb:SetVisible(selected) end	
													local rb = self:ResolveId("idRB")
													if rb then rb:SetVisible(selected) end	
												end
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnSetFocus",
											'func', function (self, ...)
												XCreateRolloverWindow(self, true)
												XWindow.OnSetFocus(self, ...)
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnKillFocus",
											'func', function (self, ...)
												self:SetSelected(false)
												XWindow.OnKillFocus(self, ...)
											end,
										}),
										}),
									PlaceObj('XTemplateWindow', {
										'__class', "XControl",
										'Id', "idAutomateMode",
										'Margins', box(55, 0, 0, 0),
										'LayoutMethod', "HList",
										'RolloverOnFocus', true,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__template', "PropName",
											'Id', "",
											'Text', T(121343378374, --[[XTemplate PlanetaryView Text]] "Automated Mode"),
										}),
										PlaceObj('XTemplateWindow', {
											'__condition', function (parent, context) return GetUIStyleGamepad() end,
											'__class', "XText",
											'Id', "idLB",
											'ScaleModifier', point(1300, 1300),
											'ContextUpdateOnOpen', true,
											'OnContextUpdate', function (self, context, ...)
												self:SetVisible(GetUIStyleGamepad() and self:IsFocused(true))
											end,
											'Translate', true,
											'Text', T(12016, --[[XTemplate PlanetaryView Text]] "<LB>"),
											'HideOnEmpty', true,
											'TextHAlign', "center",
											'TextVAlign', "center",
										}),
										PlaceObj('XTemplateTemplate', {
											'__template', "PropValue",
											'Id', "idOn",
											'Visible', false,
											'FoldWhenHidden', true,
											'TextStyle', "ListItem4",
											'Text', T(6847, --[[XTemplate PlanetaryView Text]] "On"),
										}),
										PlaceObj('XTemplateTemplate', {
											'__template', "PropValue",
											'Id', "idOff",
											'FoldWhenHidden', true,
											'TextStyle', "ListItem4",
											'Text', T(6844, --[[XTemplate PlanetaryView Text]] "Off"),
										}),
										PlaceObj('XTemplateWindow', {
											'__condition', function (parent, context) return GetUIStyleGamepad() end,
											'__class', "XText",
											'Id', "idRB",
											'ScaleModifier', point(1300, 1300),
											'ContextUpdateOnOpen', true,
											'OnContextUpdate', function (self, context, ...)
												self:SetVisible(GetUIStyleGamepad() and self:IsFocused(true))
											end,
											'Translate', true,
											'Text', T(634036540793, --[[XTemplate PlanetaryView Text]] "<RB>"),
											'HideOnEmpty', true,
											'TextHAlign', "center",
											'TextVAlign', "center",
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XImage",
											'Id', "idRollover",
											'ZOrder', 0,
											'Margins', box(-35, -3, 0, -5),
											'Dock', "box",
											'HAlign', "left",
											'MaxHeight', 32,
											'Visible', false,
											'Image', "UI/CommonNew/pg_selection.tga",
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnMouseButtonDown(self, pos, button)",
											'func', function (self, pos, button)
												if button == "L" then	
													local on = self.idOn
													local off = self.idOff
													on:SetVisible(not on:GetVisible())
													off:SetVisible(not off:GetVisible())
													return "break"
												end
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnShortcut(self, shortcut, source)",
											'func', function (self, shortcut, source)
												if shortcut == "LeftShoulder" or shortcut == "RightShoulder" then
												  return self:OnMouseButtonDown(nil, "L")
												end
												return XControl.OnShortcut(self, shortcut, source)
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "SetSelected(self, selected)",
											'func', function (self, selected)
												if GetUIStyleGamepad() then
													self:SetFocus(selected)
													local lb = self:ResolveId("idLB")
													if lb then lb:SetVisible(selected) end	
													local rb = self:ResolveId("idRB")
													if rb then rb:SetVisible(selected) end	
												end
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnSetFocus",
											'func', function (self, ...)
												XCreateRolloverWindow(self, true)
												XControl.OnSetFocus(self, ...)
											end,
										}),
										PlaceObj('XTemplateFunc', {
											'name', "OnKillFocus",
											'func', function (self, ...)
												self:SetSelected(false)
												XWindow.OnKillFocus(self, ...)
											end,
										}),
										}),
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source)",
										'func', function (self, shortcut, source)
											if shortcut == "Down"  and self.focused_item==#self then
												local dlg = GetDialog(self)
												local list = dlg:ResolveId("idList")
											 		self:SetSelection(false)
													 list:SetFocus()
													list:SetSelection(1)
													dlg:UpdateActionViews(dlg.idActionBar)
												return "break"
											end
											return XList.OnShortcut(self,shortcut,source)
										end,
									}),
									}),
								}),
							PlaceObj('XTemplateTemplate', {
								'__template', "DialogTitleSmall",
								'Margins', box(55, 0, 0, 0),
								'Dock', false,
								'Title', T(11718, --[[XTemplate PlanetaryView Title]] "Select Rocket"),
							}),
							PlaceObj('XTemplateWindow', {
								'Id', "idContent",
								'MinHeight', 482,
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Margins', box(55, 0, 0, 0),
									'Dock', "top",
									'HandleMouse', false,
									'TextStyle', "PGLandingPosDetails",
									'Translate', true,
									'Text', T(795779197869, --[[XTemplate PlanetaryView Text]] "Available rockets on Earth <white><AvailableRockets></white>"),
									'HideOnEmpty', true,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XList",
									'Id', "idList",
									'Margins', box(39, 30, 0, 0),
									'BorderWidth', 0,
									'Padding', box(0, 0, 0, 0),
									'LayoutVSpacing', 6,
									'UniformRowHeight', true,
									'Clip', false,
									'Background', RGBA(0, 0, 0, 0),
									'FocusedBackground', RGBA(0, 0, 0, 0),
									'VScroll', "idScroll",
									'ShowPartialItems', false,
									'GamepadInitialSelection', false,
								}, {
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return context:GetRocketsForExpedition() end,
										'condition', function (parent, context, item, i) return (item.name or "") ~= "" end,
										'__context', function (parent, context, item, i, n) return item end,
										'run_after', function (child, context, item, i, n)
											child:SetText(T{11251, "<name> <white><status></white>", name = item:GetDisplayName(), status = GetRocketExpeditionStatus(item)})
											child:SetEnabled(item:IsRocketLanded())
										end,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__template', "ResupplyCategoryItem",
											'OnPress', function (self, gamepad)
												local dlg = GetDialog(self)
												local additional_params
												local trade_part = dlg:ResolveId("idTradePart")
												if trade_part and trade_part:GetVisible() then
												 	additional_params = {auto_export = dlg.idAutomateMode.idOn:GetVisible(), trade_amount = dlg.idExportAmount.idSlider:GetScroll()}
												end
												SendExpeditionAction(self.context, dlg.context.selected_spot, dlg, nil, additional_params)
											end,
										}, {
											PlaceObj('XTemplateFunc', {
												'name', "OnMouseButtonDoubleClick(self, pos, button)",
												'func', function (self, pos, button)
													if button == "L" then
														self:Press()
													end
												end,
											}),
											PlaceObj('XTemplateFunc', {
												'name', "OnMouseButtonDown(self, pos, button)",
												'func', function (self, pos, button)
													if button == "L" then
														local parent = self.parent
														parent:SetSelection(table.find(parent, self))
														local dlg = GetDialog(parent)
														dlg:UpdateActionViews(dlg.idActionBar)
													end
												end,
											}),
											PlaceObj('XTemplateFunc', {
												'name', "IsSelectable(self)",
												'func', function (self)
													return self:GetEnabled()
												end,
											}),
											}),
										}),
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source)",
										'func', function (self, shortcut, source)
											if shortcut == "Up" and self.focused_item == 1 then
												local dlg = GetDialog(self)
												local trade_part = dlg:ResolveId("idTradePart")
												if trade_part and trade_part:GetVisible() then
											 		self:SetSelection(false)
													 local list = dlg.idTradePropsList
													 list:SetFocus()
													list:SetSelection(#list)
													dlg:UpdateActionViews(dlg.idActionBar)
													return "break"
												end
											end
											return XList.OnShortcut(self, shortcut, source)
										end,
									}),
									}),
								PlaceObj('XTemplateTemplate', {
									'__template', "ScrollbarNew",
									'Id', "idScroll",
									'Target', "idList",
								}),
								}),
							}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
								local dlg = GetDialog(parent)
								local obj = dlg.context
								local content = dlg:ResolveId("idContent")
								local trade_part = dlg:ResolveId("idTradePart")
								local list = parent:ResolveId("idList")
								if not trade_part then
									list:SetGamepadInitialSelection()
									content:SetMinHeight(642)
								end
								if obj.expedition_rocket then
									list:SetForceInitialSelection(true)
								end
							end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "back",
							'ActionName', T(4254, --[[XTemplate PlanetaryView ActionName]] "BACK"),
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "back",
							'OnAction', function (self, host, source)
								local param = GetDialogModeParam(host) 
								if param and param.cooldown_action then
									g_NegotiationHistory[host.context.selected_spot.id][param.cooldown_action] = nil
								end
								SetBackDialogMode(host)
							end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "send",
							'ActionName', T(221817248681, --[[XTemplate PlanetaryView ActionName]] "SEND"),
							'ActionToolbar', "ActionBar",
							'ActionGamepad', "ButtonA",
							'ActionState', function (self, host)
								local list = host:ResolveId("idList")
								if list and list.focused_item and list[list.focused_item]:GetEnabled() then return end
								return "disabled"
							end,
							'OnAction', function (self, host, source)
								local list = host:ResolveId("idList")
								local item = list and list.focused_item
								if item then
									list[item]:Press()
								end
							end,
						}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__template', "PlanetaryViewAdditionalModes",
					}),
					}),
				}),
			}),
		}),
})

