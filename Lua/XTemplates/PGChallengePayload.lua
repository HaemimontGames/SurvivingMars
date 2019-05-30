-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGChallengePayload",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return not GameState.gameplay and RocketPayloadObjectCreateAndLoad("pregame") or context end,
		'__class', "XDialog",
		'Id', "idPayload",
		'Padding', box(60, 68, 0, 25),
		'ContextUpdateOnOpen', true,
		'InitialMode', "items",
		'InternalModes', "items,prefabs",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				XDialog.Open(self, ...)
				self:SetPadding(GetSafeMargins(self:GetPadding()))
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
				if GameState.gameplay then
					if UICity then
						--UICity.launch_elevator_mode = false
						UICity.launch_mode = false
					end
				end
			end,
		}),
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return not GameState.gameplay end,
			'layer', "EarthPlanetCloseup",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnContextUpdate(self, context)",
			'func', function (self, context)
				RocketPayload_CalcCargoWeightCost()
			end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBarNew",
			'Margins', box(55, 0, 0, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'HAlign', "left",
			'MinWidth', 600,
			'MaxWidth', 600,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleNew",
				'Id', "",
				'Margins', box(55, 0, 0, 0),
				'Title', T(668912375628, --[[XTemplate PGChallengePayload Title]] "ROCKET PAYLOAD"),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Dock', "top",
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Margins', box(17, 30, 0, 0),
						'HAlign', "left",
						'MaxHeight', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'TextStyle', "PGLandingPosDetails",
						'Translate', true,
						'Text', T(454729036303, --[[XTemplate PGChallengePayload Text]] "<RocketName>"),
						'Shorten', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
							'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
								local host = GetDialog(self)
								host.context:RenameRocket(host)
							end,
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate PGChallengePayload ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
						'OnActionParam', "landing",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "rename",
						'ActionName', T(10120, --[[XTemplate PGChallengePayload ActionName]] "RENAME"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightThumbClick",
						'OnAction', function (self, host, source)
							host.context:RenameRocket(host)
						end,
						'__condition', function (parent, context) return not UICity or UICity.launch_mode ~= "elevator" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "start",
						'ActionName', T(537700422104, --[[XTemplate PGChallengePayload ActionName]] "START"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
							CreateRealTimeThread(function()
								WaitWarnAboutSkippedMods()
								MarkNameAsUsed("Rocket", g_CurrentMapParams.rocket_name_base)
								GenerateCurrentRandomMap()
							end)
						end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "prefabs",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Margins', box(17, 30, 0, 0),
						'HAlign', "left",
						'TextStyle', "LandingPosName",
						'Translate', true,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate PGChallengePayload ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(55, 0, 0, 0),
				'Dock', "top",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 40,
			}, {
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGLandingPosDetails",
						'Translate', true,
						'Text', T(3499, --[[XTemplate PGChallengePayload Text]] "Cargo Capacity"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGLandingPosDetails",
						'Translate', true,
						'Text', T(3613, --[[XTemplate PGChallengePayload Text]] "Funding"),
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGChallengeDescription",
						'Translate', true,
						'Text', T(270405570569, --[[XTemplate PGChallengePayload Text]] "<Capacity> kg"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGChallengeDescription",
						'Translate', true,
						'Text', T(134782360990, --[[XTemplate PGChallengePayload Text]] "<funding(Funding)>"),
					}),
					}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleSmall",
				'Id', "idTitle",
				'Margins', box(55, 0, 0, 0),
			}),
			PlaceObj('XTemplateWindow', {
				'Dock', "top",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'Padding', box(15, 2, 2, 2),
					'LayoutVSpacing', 6,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
					'OnContextUpdate', function (self, context, ...)
						XContentTemplateList.OnContextUpdate(self, context, ...)
						if self.focused_item then
							self.focused_item =  Min(self.focused_item, #self)
							self:DeleteThread("select")
							self:CreateThread("select", function()
								self:SetSelection(self.focused_item)
							end)
						end
					end,
					'RespawnOnContext', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "items",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
								parent:ResolveId("idTitle"):SetTitle(T(11442, "SELECT PAYLOAD"))
							end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and not context:IsLocked(item.id) and not context:IsBlacklisted(item) and not BuildingTemplates[item.id] end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
								local rollover = context:GetRollover(item.id)
								if rollover then
									child:SetRolloverTitle(rollover.title)
									child:SetRolloverText(rollover.descr)
									child:SetRolloverHint(rollover.hint)
									child:SetRolloverHintGamepad(rollover.gamepad_hint)
								end
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropPayload",
								'RolloverTemplate', "Rollover",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idRollover",
									'ZOrder', 0,
									'Margins', box(-25, -13, 0, -3),
									'Dock', "box",
									'HAlign', "left",
									'MinWidth', 514,
									'Visible', false,
									'Image', "UI/CommonNew/pg_selection.tga",
									'FrameBox', box(50, 0, 178, 0),
									'TileFrame', true,
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "prefabs",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
								parent:ResolveId("idTitle"):SetTitle(T(4068, "PREFABS"))
							end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and not context:IsLocked(item.id) and not context:IsBlacklisted(item) and BuildingTemplates[item.id] end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
								local rollover = context:GetRollover(item.id)
								if rollover then
									child:SetRolloverTitle(rollover.title)
									child:SetRolloverText(rollover.descr)
									child:SetRolloverHint(rollover.hint)
									child:SetRolloverHintGamepad(rollover.gamepad_hint)
								end
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropPayload",
								'RolloverTemplate', "Rollover",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idRollover",
									'ZOrder', 0,
									'Margins', box(-25, -13, 0, -3),
									'Dock', "box",
									'HAlign', "left",
									'MinWidth', 514,
									'Visible', false,
									'Image', "UI/CommonNew/pg_selection.tga",
									'FrameBox', box(50, 0, 178, 0),
									'TileFrame', true,
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Target', "idList",
				}),
				}),
			}),
		}),
})

