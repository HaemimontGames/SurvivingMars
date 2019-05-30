-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResearchDlg",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInGameInterfaceLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XCameraLockLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Dock', "box",
			'Image', "UI/Icons/Research/rm_background.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(0, 0, -2000, -2000),
			'Dock', "box",
			'Image', "UI/Icons/Research/rm_mist.tga",
			'ImageScale', point(1500, 1500),
			'TileFrame', true,
		}, {
			PlaceObj('XTemplateCode', {
				'comment', "mist scroll",
				'run', function (self, parent, context)
					parent:AddInterpolation{
								type = const.intRect,
								duration = 120000,
								originalRect = box(0, 0, 10, 10),
								targetRect = box(0, 0, 10, 10) + point(-500, -200),
								--easing = const.Easing.SinInOut,
								flags = const.intfPingPong + const.intfLooping,
					}
				end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(60, 68, 0, 0),
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					XWindow.Open(self, ...)
					self:SetMargins(GetSafeMargins(self:GetMargins()))
				end,
			}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(0, 0, 30, 0),
				'Dock', "left",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(55, 0, 0, 25),
					'MinWidth', 350,
				}),
				PlaceObj('XTemplateTemplate', {
					'__context', function (parent, context) return UICity end,
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T(4530, --[[XTemplate ResearchDlg Title]] "RESEARCH"),
					'Subtitle', T(620411210441, --[[XTemplate ResearchDlg Subtitle]] "Completed <ResearchedTechCount>/<DiscoveredTechCount>"),
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(55, 0, 0, 0),
					'Dock', "top",
					'HAlign', "left",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-350, 0, 0, 0),
						'Dock', "box",
						'MinWidth', 794,
						'Image', "UI/CommonNew/pg_action_bar.tga",
						'FrameBox', box(42, 0, 341, 0),
						'TileFrame', true,
						'SqueezeY', false,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'HandleMouse', false,
						'TextStyle', "MediumHeader",
						'Translate', true,
						'Text', T(672871268807, --[[XTemplate ResearchDlg Text]] "RESEARCH POINTS"),
						'HideOnEmpty', true,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__context', function (parent, context) return UICity end,
					'Id', "idRPTextsContainer",
					'Margins', box(55, 0, 0, 0),
					'Dock', "top",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 40,
				}, {
					PlaceObj('XTemplateWindow', {
						'Id', "idRPTitles",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(10403, --[[XTemplate ResearchDlg Text]] "Sponsor"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(1594, --[[XTemplate ResearchDlg Text]] "Outsourcing"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(859904119665, --[[XTemplate ResearchDlg Text]] "Research Buildings"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(158661700550, --[[XTemplate ResearchDlg Text]] "Genius Colonists"),
						}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return context:IsTechResearched("ExplorerAI") end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(766237973263, --[[XTemplate ResearchDlg Text]] "Explorers"),
						}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return g_Consts.ElectricityForResearchPoint ~= 0 end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(455577215954, --[[XTemplate ResearchDlg Text]] "Excess Power"),
						}),
						PlaceObj('XTemplateWindow', {
							'__context', function (parent, context) return GetOmegaTelescope() end,
							'__condition', function (parent, context) return context end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchQueue",
							'Translate', true,
							'Text', T(135513074411, --[[XTemplate ResearchDlg Text]] "<display_name>"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Margins', box(0, 10, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchPerSol",
							'Translate', true,
							'Text', T(660684301735, --[[XTemplate ResearchDlg Text]] "RESEARCH PER SOL"),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'Id', "idRPValues",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "RP Sponsor",
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(718216359852, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_Sponsor)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Outsource",
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(547994597354, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_Outsource)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Lab",
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(730678043634, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_ResearchBuildings)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Genius",
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(12608, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_Genius)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Explorer",
							'__condition', function (parent, context) return context:IsTechResearched("ExplorerAI") end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(12609, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_Explorer)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Power",
							'__condition', function (parent, context) return g_Consts.ElectricityForResearchPoint ~= 0 end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(12610, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP_SuperconductingComputing)>"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "RP Omega",
							'__context', function (parent, context) return GetOmegaTelescope() end,
							'__condition', function (parent, context) return context end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "OverviewItemValue",
							'Translate', true,
							'Text', T(12611, --[[XTemplate ResearchDlg Text]] "<ResearchBoostPercent>%"),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "Research per sol",
							'__class', "XText",
							'Margins', box(0, 10, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "ResearchPerSolValue",
							'Translate', true,
							'Text', T(701756270440, --[[XTemplate ResearchDlg Text]] "<ResearchPoints(EstimatedRP)>"),
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(55, 0, 0, 0),
					'Dock', "top",
					'HAlign', "left",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-350, 0, 0, 0),
						'Dock', "box",
						'MinWidth', 794,
						'Image', "UI/CommonNew/pg_action_bar.tga",
						'FrameBox', box(42, 0, 341, 0),
						'TileFrame', true,
						'SqueezeY', false,
					}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "HList",
						'LayoutHSpacing', 20,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "MediumHeader",
							'Translate', true,
							'Text', T(4540, --[[XTemplate ResearchDlg Text]] "RESEARCH QUEUE"),
							'HideOnEmpty', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return GetUIStyleGamepad() end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "MediumHeader",
							'Translate', true,
							'Text', T(12016, --[[XTemplate ResearchDlg Text]] "<LB>"),
							'HideOnEmpty', true,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "queue",
					'__context', function (parent, context) return UICity:GetResearchQueue() end,
					'__class', "XContentTemplateList",
					'Id', "idResearchQueueList",
					'Margins', box(55, 0, 0, 0),
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'HAlign', "left",
					'LayoutVSpacing', 4,
					'Background', RGBA(0, 0, 0, 0),
					'RelativeFocusOrder', "skip",
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'MouseScroll', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
							return XActionsHost.OnShortcut(self, shortcut, source)
						end,
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "research queue",
						'array', function (parent, context) return UICity:GetResearchQueue(), 1, const.ResearchQueueSize+1 end,
						'map', function (parent, context, array, i) return TechDef[array[i]] end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
							if item then 
								child.idTechIcon:SetImage(item.icon)
								local cost = item:ResearchQueueCost(n)
								local rollover_title = T(3917, "<display_name> (<FieldDisplayName>)")
								if n == 1 then
									rollover_title = T{7609, "<display_name> (<FieldDisplayName>) <percent(p)>", p = UICity:GetResearchProgress()}
									child.idTechText:SetText(T{4543, "<FieldDisplayName><right><ResearchPoints(cost)>", cost = cost})
									child.idTallFrame:SetVisible(true)
									child.idSmallFrame:SetVisible(false)
									child.idContent:SetPadding(box(0, 10, 0, 5))
									child.idProgress:SetVisible(true)
								else
									child.idResearchCost:SetVisible(true)
									child.idResearchCost:SetText(T{12612, "<ResearchPoints(cost)>", cost = cost})
								end
								child:SetRolloverTitle(rollover_title)
								child:SetRolloverHint(T(3922, "<right_click> Remove from Research queue"))
								child:SetRolloverHintGamepad(T(3924, "<ButtonX> Remove from research queue"))
								child:SetRolloverText(T{3921, "<description>\n\nResearch cost<right><ResearchPoints(cost)>", cost = cost})
							end
							child.idNumber:SetText(n)
							child:SetFocusOrder(point(0, n))
						end,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XContextWindow",
							'RolloverTemplate', "Rollover",
							'IdNode', true,
							'LayoutMethod', "HList",
							'LayoutHSpacing', 3,
							'RolloverOnFocus', true,
							'HandleMouse', true,
							'RelativeFocusOrder', "new-line",
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnSetRollover(self, rollover)",
								'func', function (self, rollover)
									XContextWindow.OnSetRollover(self, rollover)
									local col = self.context and rollover and 2 or 1
									self.idNumberPad:SetColumn(col)
									self.idSmallFrame:SetColumn(col)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "Highlight(self, highlight)",
								'func', function (self, highlight)
									self.idHighlight:SetVisible(highlight)
									PlayFX("UIInfoPanelItemHover", highlight and "start" or "end", self, self.Id)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnSetFocus(self)",
								'func', function (self)
									self:Highlight(true)
									return XContextWindow.OnSetFocus(self)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnKillFocus(self)",
								'func', function (self)
									self:Highlight(false)
									return XContextWindow.OnKillFocus(self)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnShortcut(self, shortcut, source)",
								'func', function (self, shortcut, source)
									if shortcut == "ButtonX" then
										self:Dequeue()
										return "break"
									end
									return XContextWindow.OnShortcut(self, shortcut, source)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnMouseButtonDown(self, pos, button)",
								'func', function (self, pos, button)
									if button == "R" then
										self:Dequeue()
										return "break"
									end
									return XContextWindow.OnMouseButtonDown(self, pos, button)
								end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "Dequeue",
								'func', function (self, ...)
									if self. context then
										if UICity:DequeueResearch(self.context.id) then
											PlayFX("DequeueResearch", "start")
										end
									else
										PlayFX("UIDisabledButtonPressed", "start")
									end
								end,
							}),
							PlaceObj('XTemplateWindow', {
								'HAlign', "left",
								'VAlign', "top",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idNumberPad",
									'Shape', "InHHex",
									'MaxHeight', 46,
									'Image', "UI/Icons/Research/rm_hex.tga",
									'ImageFit', "smallest",
									'Columns', 2,
								}),
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return context end,
									'__class', "XLabel",
									'Id', "idNumber",
									'Padding', box(0, 0, 0, 0),
									'HAlign', "center",
									'VAlign', "center",
									'TextStyle', "ActiveSectionTitle",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "CalcTextColor",
										'func', function (self, ...)
											return self.enabled and 
													(self:ResolveId("node").rollover and self.RolloverTextColor or self.TextColor)
													or self.DisabledTextColor
										end,
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return not context end,
									'__class', "XLabel",
									'Id', "idNumber",
									'Padding', box(0, 0, 0, 0),
									'HAlign', "center",
									'VAlign', "center",
									'TextStyle', "ResearchQueue",
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'VAlign', "top",
								'MinWidth', 390,
								'MaxWidth', 390,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idSmallFrame",
									'Margins', box(15, 0, 0, 2),
									'Dock', "box",
									'FoldWhenHidden', true,
									'Image', "UI/Icons/Research/rm_queue_others.tga",
									'FrameBox', box(0, 0, 20, 0),
									'Columns', 2,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idTallFrame",
									'Margins', box(15, 0, 0, 2),
									'Dock', "box",
									'Visible', false,
									'FoldWhenHidden', true,
									'Image', "UI/Icons/Research/rm_queue_first.tga",
									'FrameBox', box(0, 20, 20, 0),
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idTechIcon",
									'IdNode', false,
									'Margins', box(0, -2, 0, 0),
									'Shape', "InHHex",
									'Dock', "left",
									'VAlign', "top",
									'MaxHeight', 50,
									'HandleMouse', true,
									'Image', "UI/Icons/Research/rm_unknown.tga",
									'ImageFit', "smallest",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XImage",
										'Id', "idHighlight",
										'IdNode', false,
										'Margins', box(-3, -3, -3, -3),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/Common/Hex_small_shine_3.tga",
										'ImageFit', "smallest",
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return not context end,
									'__class', "XText",
									'Margins', box(10, 0, 0, 0),
									'Padding', box(0, 0, 0, 0),
									'HAlign', "left",
									'VAlign', "center",
									'TextStyle', "ResearchQueue",
									'Translate', true,
									'Text', T(385959075356, --[[XTemplate ResearchDlg Text]] "Empty slot"),
								}),
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return context end,
									'Id', "idContent",
									'Margins', box(10, 0, 20, 0),
									'VAlign', "center",
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Padding', box(0, 0, 0, 0),
										'HAlign', "left",
										'VAlign', "center",
										'TextStyle', "ResearchQueueTitle",
										'Translate', true,
										'Text', T(135513074411, --[[XTemplate ResearchDlg Text]] "<display_name>"),
									}, {
										PlaceObj('XTemplateFunc', {
											'name', "CalcTextColor",
											'func', function (self, ...)
												return self.enabled and 
														(self:ResolveId("node").rollover and self.RolloverTextColor or self.TextColor)
														or self.DisabledTextColor
											end,
										}),
										}),
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idTechText",
										'Padding', box(0, 0, 0, 0),
										'HandleMouse', false,
										'TextStyle', "CCCFilterItem",
										'Translate', true,
										'HideOnEmpty', true,
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idResearchCost",
										'Padding', box(0, 0, 0, 0),
										'Dock', "right",
										'VAlign', "center",
										'Visible', false,
										'FoldWhenHidden', true,
										'HandleMouse', false,
										'TextStyle', "CCCFilterItem",
										'Translate', true,
									}),
									PlaceObj('XTemplateWindow', {
										'Id', "idProgress",
										'Visible', false,
										'FoldWhenHidden', true,
									}, {
										PlaceObj('XTemplateTemplate', {
											'__context', function (parent, context) return UICity end,
											'__template', "SimpleProgress",
											'Margins', box(0, 5, 0, 5),
											'HAlign', "left",
											'MinWidth', 200,
											'MaxWidth', 200,
											'Image', "UI/Icons/Research/rm_progress_bar_pad.tga",
											'BindTo', "ResearchProgress",
											'ProgressImage', "UI/Icons/Research/rm_progress_bar.tga",
											'ProgressFrameBox', box(6, 0, 10, 0),
										}),
										PlaceObj('XTemplateWindow', {
											'__context', function (parent, context) return {progress = UICity:GetResearchProgress()} end,
											'__class', "XText",
											'Padding', box(0, 0, 0, 0),
											'Dock', "right",
											'HandleMouse', false,
											'TextStyle', "CCCFilterItem",
											'Translate', true,
											'Text', T(12562, --[[XTemplate ResearchDlg Text]] "<percent(progress)>"),
											'HideOnEmpty', true,
										}),
										}),
									}),
								}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idResearchTreeWrapper",
				'Margins', box(0, 12, 0, 0),
				'HAlign', "center",
				'MaxWidth', 1500,
				'Clip', "parent & self",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFitContent",
					'Id', "idResearchFit",
					'IdNode', false,
					'Margins', box(0, 0, 80, 0),
					'LayoutMethod', "VList",
					'Fit', "width",
				}, {
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 16, 0, 16),
						'Dock', "top",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "field",
							'array', function (parent, context) return GetAvailablePresets(Presets.TechFieldPreset.Default) end,
							'condition', function (parent, context, item, i) return (item.id or "") ~= "" and item.show_in_field == "" end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_after', function (child, context, item, i, n)
								child[2]:SetId(string.format("id%sTitle", item.id))
							end,
						}, {
							PlaceObj('XTemplateWindow', nil, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Margins', box(0, -20, 0, -20),
									'Transparency', 130,
									'Image', "UI/CommonNew/bm.tga",
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XContextWindow",
									'IdNode', true,
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnSetRollover(self, rollover)",
										'func', function (self, rollover)
											XWindow.OnSetRollover(self, rollover)
											self.idText:SetRollover(rollover)
											local field = self:ResolveId(string.format("id%sField", self.context.id))
											if field and field.rollover ~= rollover then
												field:SetRollover(rollover)
											end
										end,
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "field name",
										'__class', "XText",
										'Id', "idText",
										'Padding', box(0, 0, 0, 0),
										'HAlign', "center",
										'VAlign', "center",
										'MinWidth', 260,
										'MaxWidth', 260,
										'Clip', false,
										'MouseCursor', "UI/Cursors/Rollover.tga",
										'TextStyle', "ResearchFieldTitle",
										'Translate', true,
										'Text', T(135513074411, --[[XTemplate ResearchDlg Text]] "<display_name>"),
										'TextHAlign', "center",
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XFrame",
										'Id', "idRollover",
										'ZOrder', -1,
										'Margins', box(0, -16, 0, -8000),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/Icons/Research/rm_column_selection.tga",
										'FrameBox', box(14, 85, 14, 5),
									}),
									}),
								}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XScrollArea",
						'Id', "idArea",
						'IdNode', false,
						'LayoutMethod', "HList",
						'VScroll', "idScroll",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "field",
							'array', function (parent, context) return GetAvailablePresets(Presets.TechFieldPreset.Default) end,
							'condition', function (parent, context, item, i) return (item.id or "") ~= "" and item.show_in_field == "" end,
							'__context', function (parent, context, item, i, n) return SubContext(item, {field_pos = i}) end,
							'run_after', function (child, context, item, i, n)
								child:SetId(string.format("id%sField", item.id))
							end,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XContextWindow",
								'IdNode', true,
								'MinWidth', 260,
								'MaxWidth', 260,
								'RolloverOnFocus', true,
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnSetRollover(self, rollover)",
									'func', function (self, rollover)
										if self.window_state == "destroying" then return end
										XContextWindow.OnSetRollover(self, rollover)
										local title = self.parent:ResolveId(string.format("id%sTitle", self.context.id))
										if title then
											title:SetRollover(rollover)
										end
										for _, win in ipairs(self.idFieldTech) do
											win.idContent:AddInterpolation{
													id = "zoom-field",
													type = const.intRect,
													duration = 200,
													originalRect = win.idContent:CalcZoomedBox(1000),
													originalRectAutoZoom = 1000,
													targetRect = win.idContent:CalcZoomedBox(1050),
													targetRectAutoZoom = 1050,
													flags = not self.rollover and const.intfInverse or nil,
													autoremove = not self.rollover or nil,
												}
										end
										PlayFX("TechFieldMouseIn", self.rollover and "start" or "end")
									end,
								}),
								PlaceObj('XTemplateWindow', {
									'Id', "idFieldTech",
									'IdNode', true,
									'LayoutMethod', "VList",
									'LayoutVSpacing', 4,
									'HandleMouse', true,
								}, {
									PlaceObj('XTemplateForEach', {
										'comment', "tech",
										'array', function (parent, context) return UICity:UITechField(context.id) end,
										'map', function (parent, context, array, i) return TechDef[array[i]] end,
										'__context', function (parent, context, item, i, n) return SubContext(item, {field_pos = context.field_pos}) end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XTechControl",
											'MinWidth', 170,
											'MaxWidth', 170,
											'MouseCursor', "UI/Cursors/Rollover.tga",
										}),
										}),
									}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "top padding",
							'Dock', "top",
							'MinHeight', 40,
							'MaxHeight', 40,
							'Visible', false,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "bottom padding",
							'Dock', "bottom",
							'MinHeight', 55,
							'MaxHeight', 55,
							'Visible', false,
						}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__template', "ScrollbarNew",
						'Id', "idScroll",
						'Margins', box(0, 40, 0, 55),
						'Dock', "right",
						'MinWidth', 18,
						'MaxWidth', 18,
						'Target', "idArea",
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateFunc', {
			'comment', "controller LS/RS",
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
				return ResearchDlgOnShortcut(self, shortcut, source)
			end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T(4523, --[[XTemplate ResearchDlg ActionName]] "CLOSE"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateAction', {
			'RolloverTemplate', "RolloverConst",
			'RolloverText', T(942201510325, --[[XTemplate ResearchDlg RolloverText]] "In exchange for <funding(OutsourceResearchCost)> Funding, outsourced researchers will contribute <ResearchPoints(OutsourceResearch)> in the next <time(OutsourceResearchTime)>."),
			'ActionId', "outsource",
			'ActionName', T(889032422791, --[[XTemplate ResearchDlg ActionName]] "OUTSOURCE"),
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonY",
			'ActionState', function (self, host)
				if (g_Consts.OutsourceDisabled or 0) > 0 or UICity.paused_outsource_research_end_time then
					return "disabled"
				end
			end,
			'OnAction', function (self, host, source)
				if host:IsThreadRunning("outsource") then
					host:DeleteThread("outsource")
				end
				host:CreateThread("outsource", function()
						local funding = UICity:GetFunding()
						if funding >= g_Consts.OutsourceResearchCost then
							local max_orders = g_Consts.OutsourceMaxOrderCount
							local orders = UICity.OutsourceResearchOrders and UICity.OutsourceResearchOrders[1] or 0
							if orders < max_orders then
								local multiplier = max_orders
								local multiple_outsource_allowed = orders == 0 and funding >= g_Consts.OutsourceResearchCost * multiplier
								local params = {
									title = T(6882, "Warning"),
									text = T(7876, "Are you sure you want to outsource research to Earth?"), 
									choice1 = T{7877, "Outsource <ResearchPoints(points)> for <funding(price)> in the next <time(sols)>", points = g_Consts.OutsourceResearch, price = g_Consts.OutsourceResearchCost, sols = g_Consts.OutsourceResearchTime},
									choice2 = multiple_outsource_allowed and T{7877, "Outsource <ResearchPoints(points)> for <funding(price)> in the next <time(sols)>", points = g_Consts.OutsourceResearch * multiplier, price = g_Consts.OutsourceResearchCost * multiplier, sols = g_Consts.OutsourceResearchTime} or nil,
									image = "UI/Messages/outsource.tga",
									start_minimized = false,
									no_ccc_button = true,
								}
								if multiple_outsource_allowed then
									params.choice3 = T(1139, "No")
								else
									params.choice2 = T(1139, "No")
								end
								local res = WaitPopupNotification(false, params, false, host)
								if res == 1 or (multiple_outsource_allowed and res == 2) then
									multiplier = (res == 1) and 1 or multiplier
									UICity:ChangeFunding(-g_Consts.OutsourceResearchCost * multiplier, "OutsourceResearch")
									UICity:OutsourceResearch(g_Consts.OutsourceResearch * multiplier, g_Consts.OutsourceResearchTime, multiplier)
								end
							else
								CreateMarsMessageBox(T(6902, "Warning"), T(10456, "You are not allowed to outsource more research to Earth at this time!"), T(1000136, "OK"))
							end
						else
							CreateMarsMessageBox(T(6902, "Warning"), T{7562, "Insufficient funding! <funding(price)> required for outsourcing!", price = g_Consts.OutsourceResearchCost}, T(1000136, "OK"), host)
						end
				end)
			end,
			'FXMouseIn', "OutsourceButtonHover",
			'FXPress', "OutsourceButtonClick",
		}),
		PlaceObj('XTemplateFunc', {
			'comment', "focus the first tech with gamepad",
			'name', "Open",
			'func', function (self, ...)
				XDialog.Open(self, ...)
				CreateRealTimeThread(function(self)
					if GetUIStyleGamepad() then
						local first_tech = self:GetRelativeFocus(g_ResearchFocus, "exact")
						first_tech = first_tech or self:GetRelativeFocus(point(1, 1), "exact")
						if first_tech then
							first_tech:SetFocus(true)
						end
					else
						self.idArea:ScrollTo(0, g_ResearchScroll)
					end
				end, self)
				----- Trigger hint
				local hintdlg = GetOnScreenHintDlg()
				if (HintsEnabled or g_Tutorial) and hintdlg then
					if HintsEnabled then
						ContextAwareHintShow("HintResearch", true)
					end
					hintdlg:SetParent(self)
					hintdlg:SetHiddenMinimized(true)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'comment', "save the scroll pos and focus, disable hint",
			'name', "OnDelete",
			'func', function (self, ...)
				g_ResearchScroll = self.idArea.OffsetY
				local focus = GetKeyboardFocus()
				local focus_order = focus and focus:GetFocusOrder()
				if focus_order and focus ~= self:GetRelativeFocus(focus_order, "exact") then
					focus_order = nil
				end
				g_ResearchFocus = focus_order or point(1, 1)
				
				-- disable hint
				ContextAwareHintShow("HintResearch", false)
				local hintdlg = GetOnScreenHintDlg()
				if (HintsEnabled or g_Tutorial) and hintdlg then
					hintdlg:SetParent(GetInGameInterface())
					hintdlg:SetHiddenMinimized(false)
				end
				
				TechLastSeen = GameTime()
			end,
		}),
		}),
})

