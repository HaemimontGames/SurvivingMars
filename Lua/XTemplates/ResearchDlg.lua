-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResearchDlg",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
	}, {
		PlaceObj('XTemplateFunc', {
			'comment', "Disable hint",
			'name', "OnDelete(self)",
			'func', function (self)
ContextAwareHintShow("HintResearch", false)
local hintdlg = GetOnScreenHintDlg()
if (HintsEnabled or g_Tutorial) and hintdlg then
	hintdlg:SetParent(GetInGameInterface())
	hintdlg:SetHiddenMinimized(false)
end
end,
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(0, 0, -90, 0),
			'Background', RGBA(0, 0, 0, 255),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Image', "UI/Icons/Research/rm_background.tga",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(0, 0, -2000, -2000),
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
			startRect = box(0, 0, 10, 10),
			endRect = box(0, 0, 10, 10) + point(-500, -200),
			--easing = const.Easing.SinInOut,
			flags = const.intfPingPong + const.intfLooping,
}
end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(0, 40, 0, 40),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFitContent",
					'IdNode', false,
					'Fit', "height",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XScrollArea",
						'Id', "idArea",
						'LayoutMethod', "VList",
						'Clip', false,
						'HScroll', "idHScroll",
						'MouseScroll', false,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XScroll",
							'Id', "idHScroll",
							'Dock', "ignore",
							'Visible', false,
						}),
						PlaceObj('XTemplateCode', {
							'comment', "scroll",
							'run', function (self, parent, context)
if GetUIStyleGamepad() then return end
parent:CreateThread(function ()
	while true do
		Sleep(8)
		local win = parent
		if win.desktop.last_mouse_pos then
			local x, y = win.desktop.last_mouse_pos:xy()
			local max_x, max_y = win.desktop.content_box:maxxyz()
			local dx
			local threshold = ScaleXY(win.scale, 100)
			if x < threshold then dx = - 10 end
			if x > max_x - threshold then dx = 10 end
			if not dx and g_ResearchDlgPendingScrollOffsetX ~= 0 then
				dx = g_ResearchDlgPendingScrollOffsetX
			end
			if dx then
				local new_offset = Clamp(win.OffsetX + dx, 0, win.scroll_range_x - win.content_box:sizex() + 100)
				win:ScrollTo(new_offset, win.OffsetY, true)
				g_ResearchDlgPendingScrollOffsetX = 0
			end
		end
	end
end)
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "field",
							'array', function (parent, context) return Presets.TechFieldPreset.Default end,
							'condition', function (parent, context, item, i) return item.show_in_field == "" end,
							'__context', function (parent, context, item, i, n) return item end,
						}, {
							PlaceObj('XTemplateWindow', {
								'IdNode', true,
								'MinHeight', 236,
								'MaxHeight', 236,
								'RolloverOnFocus', true,
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnSetRollover(self, rollover)",
									'func', function (self, rollover)
self.idFieldName:SetRollover(self.rollover)
for _, win in ipairs(self.idFieldTech) do
	win.idContent:AddInterpolation{
			id = "zoom-field",
			type = const.intRect,
			duration = 200,
			startRect = win.idContent:CalcZoomedBox(1000),
			startRectAutoZoom = 1000,
			endRect = win.idContent:CalcZoomedBox(1050),
			endRectAutoZoom = 1050,
			flags = not self.rollover and const.intfInverse or nil,
			autoremove = not self.rollover or nil,
		}
end
if self.rollover then
	self.idFieldTech:RemoveModifier("desat")
else
	self.idFieldTech:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 140}
end
PlayFX("TechFieldMouseIn", self.rollover and "start" or "end")
end,
								}),
								PlaceObj('XTemplateWindow', {
									'Margins', box(-20, 0, -300, 0),
									'Dock', "box",
									'LayoutMethod', "VList",
									'HandleMouse', true,
								}, {
									PlaceObj('XTemplateWindow', {
										'comment', "upper line",
										'__class', "XFrame",
										'Dock', "top",
										'MinHeight', 84,
										'Image', "UI/Common/bm_pad.tga",
										'FrameBox', box(300, 10, 300, 0),
										'FlipY', true,
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "lower line",
										'__class', "XFrame",
										'Dock', "bottom",
										'MinHeight', 84,
										'Image', "UI/Common/bm_pad.tga",
										'FrameBox', box(300, 10, 300, 0),
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'comment', "field name",
									'__class', "XLabel",
									'Id', "idFieldName",
									'Padding', box(80, 2, 2, 2),
									'Dock', "left",
									'VAlign', "center",
									'MinWidth', 260,
									'TextFont', "MarsMenuItemButton",
									'TextColor', RGBA(119, 198, 255, 255),
									'RolloverTextColor', RGBA(255, 255, 255, 255),
									'Translate', true,
									'Text', T{135513074411, --[[XTemplate ResearchDlg Text]] "<display_name>"},
								}),
								PlaceObj('XTemplateWindow', {
									'Id', "idFieldTech",
									'IdNode', true,
									'MinHeight', 236,
									'LayoutMethod', "HList",
									'LayoutHSpacing', -50,
									'HandleMouse', true,
								}, {
									PlaceObj('XTemplateCode', {
										'comment', "inactive desat",
										'run', function (self, parent, context)
parent:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 140}
end,
									}),
									PlaceObj('XTemplateForEach', {
										'comment', "tech",
										'array', function (parent, context) return UICity:UITechField(context.id) end,
										'map', function (parent, context, array, i) return TechDef[array[i]] end,
										'__context', function (parent, context, item, i, n) return item end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XTechControl",
										}),
										}),
									}),
								}),
							}),
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
			'RolloverTemplate', "RolloverConst",
			'RolloverText', T{942201510325, --[[XTemplate ResearchDlg RolloverText]] "In exchange for <funding(OutsourceResearchCost)> Funding, outsourced researchers will contribute <ResearchPoints(OutsourceResearch)> in the next <time(OutsourceResearchTime)>."},
			'ActionId', "outsource",
			'ActionName', T{889032422791, --[[XTemplate ResearchDlg ActionName]] "OUTSOURCE"},
			'ActionToolbar', "ActionBar",
			'ActionGamepad', "ButtonY",
			'ActionState', function (self, host)
if (g_Consts.OutsourceDisabled or 0) > 0 then
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
					title = T{6882, "Warning"},
					text = T{7876, "Are you sure you want to outsource research to Earth?"}, 
					choice1 = T{7877, "Outsource <ResearchPoints(points)> for <funding(price)> in the next <time(sols)>", points = g_Consts.OutsourceResearch, price = g_Consts.OutsourceResearchCost, sols = g_Consts.OutsourceResearchTime},
					choice2 = multiple_outsource_allowed and T{7877, "Outsource <ResearchPoints(points)> for <funding(price)> in the next <time(sols)>", points = g_Consts.OutsourceResearch * multiplier, price = g_Consts.OutsourceResearchCost * multiplier, sols = g_Consts.OutsourceResearchTime} or nil,
					image = "UI/Messages/outsource.tga",
				}
				if multiple_outsource_allowed then
					params.choice3 = T{1139, "No"}
				else
					params.choice2 = T{1139, "No"}
				end
				local res = WaitPopupNotification(false, params, false, host)
				if res == 1 or (multiple_outsource_allowed and res == 2) then
					multiplier = (res == 1) and 1 or multiplier
					UICity:ChangeFunding(-g_Consts.OutsourceResearchCost * multiplier, "OutsourceResearch")
					UICity:OutsourceResearch(g_Consts.OutsourceResearch * multiplier, g_Consts.OutsourceResearchTime, multiplier)
				end
			else
				CreateMarsMessageBox(T{6902, "Warning"}, T{10456, "You are not allowed to outsource more research to Earth at this time!"}, T{1000136, "OK"})
			end
		else
			CreateMarsMessageBox(T{6902, "Warning"}, T{7562, "Insufficient funding! <funding(price)> required for outsourcing!", price = g_Consts.OutsourceResearchCost}, T{1000136, "OK"}, host)
		end
end)
end,
			'FXMouseIn', "OutsourceButtonHover",
			'FXPress', "OutsourceButtonClick",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate ResearchDlg ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateFunc', {
			'comment', "focus the first tech with gamepad",
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
self.idArea:ScrollTo(g_ResearchScroll)
if GetUIStyleGamepad() then
	CreateRealTimeThread(function(self)
		local first_tech = self:GetRelativeFocus(g_ResearchFocus, "exact")
		first_tech = first_tech or self:GetRelativeFocus(point(1, 1), "exact")
		if first_tech then
			first_tech:SetFocus(true)
		end
	end, self)
end
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
			'comment', "save the scroll pos and focus",
			'name', "OnDelete",
			'func', function (self, ...)
g_ResearchScroll = self.idArea.OffsetX
local focus = GetKeyboardFocus()
local focus_order = focus and focus:GetFocusOrder()
if focus_order and focus ~= self:GetRelativeFocus(focus_order, "exact") then
	focus_order = nil
end
g_ResearchFocus = focus_order or point(1, 1)
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return UICity end,
			'__template', "OverlayDlg",
			'HostInParent', true,
			'FocusOnOpen', "",
			'Transparent', false,
			'Vertical', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'Dock', "top",
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'HAlign', "right",
					'TextFont', "PGModTitle",
					'TextColor', RGBA(119, 198, 255, 255),
					'Translate', true,
					'Text', T{4530, --[[XTemplate ResearchDlg Text]] "RESEARCH"},
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'HAlign', "right",
					'HandleMouse', false,
					'TextFont', "PGModAuthorDate",
					'TextColor', RGBA(119, 198, 255, 255),
					'Translate', true,
					'Text', T{4531, --[[XTemplate ResearchDlg Text]] "Available Funding <white><funding(Funding)>"},
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'HAlign', "right",
					'HandleMouse', false,
					'TextFont', "PGModAuthorDate",
					'TextColor', RGBA(119, 198, 255, 255),
					'Translate', true,
					'Text', T{4532, --[[XTemplate ResearchDlg Text]] "Research per Sol <white><ResearchPoints(EstimatedRP)>"},
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-80, 6, -160, -100),
					'VAlign', "top",
					'Transparency', 100,
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 170, 0),
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Sponsor",
					'__template', "InfopanelText",
					'Text', T{4533, --[[XTemplate ResearchDlg Text]] "Sponsor<right><ResearchPoints(EstimatedRP_Sponsor)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Outsource",
					'__template', "InfopanelText",
					'Text', T{4534, --[[XTemplate ResearchDlg Text]] "Outsourcing<right><ResearchPoints(EstimatedRP_Outsource)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Lab",
					'__template', "InfopanelText",
					'Text', T{10137, --[[XTemplate ResearchDlg Text]] "Research Labs<right><ResearchPoints(EstimatedRP_ResearchLab)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Hawking",
					'__template', "InfopanelText",
					'Text', T{4536, --[[XTemplate ResearchDlg Text]] "Hawking Institutes<right><ResearchPoints(EstimatedRP_ScienceInstitute)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Genius",
					'__template', "InfopanelText",
					'Text', T{4537, --[[XTemplate ResearchDlg Text]] "Genius Colonists<right><ResearchPoints(EstimatedRP_Genius)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Explorer",
					'__condition', function (parent, context) return context:IsTechResearched("ExplorerAI") end,
					'__template', "InfopanelText",
					'Text', T{4538, --[[XTemplate ResearchDlg Text]] "Explorers<right><ResearchPoints(EstimatedRP_Explorer)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Power",
					'__condition', function (parent, context) return g_Consts.ElectricityForResearchPoint ~= 0 end,
					'__template', "InfopanelText",
					'Text', T{4539, --[[XTemplate ResearchDlg Text]] "Excess Power<right><ResearchPoints(EstimatedRP_SuperconductingComputing)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'comment', "RP Omega",
					'__context', function (parent, context) return GetOmegaTelescope() end,
					'__condition', function (parent, context) return context end,
					'__template', "InfopanelText",
					'Text', T{556459376226, --[[XTemplate ResearchDlg Text]] "<display_name><right><em><ResearchBoostPercent>%"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "AddAdditionalResearchPointsTexts",
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 40, 0, 20),
				}, {
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GetUIStyleGamepad() end,
						'__class', "XText",
						'HAlign', "right",
						'VAlign', "center",
						'Translate', true,
						'Text', T{634036540793, --[[XTemplate ResearchDlg Text]] "<RB>"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Dock', "right",
						'TextFont', "PGModTitle",
						'TextColor', RGBA(119, 198, 255, 255),
						'Translate', true,
						'Text', T{4540, --[[XTemplate ResearchDlg Text]] "RESEARCH QUEUE"},
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "queue",
				'__context', function (parent, context) return UICity:GetResearchQueue() end,
				'__class', "XContentTemplateList",
				'Margins', box(-60, 0, 0, 0),
				'BorderWidth', 0,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'RelativeFocusOrder', "skip",
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'ShowPartialItems', false,
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
	child:SetIcon(item.icon)
	if n == 1 then
		child.idIcon:SetScaleModifier(point(2000,2000))
		child.idIcon:SetMargins(box(-22,-2,0,0))
		child:SetRolloverTitle(T{7609, "<display_name> (<FieldDisplayName>) <percent(p)>", p = UICity:GetResearchProgress()})
	end
	local cost = item:ResearchQueueCost(n)
	child.idTechText:SetText(T{4543, "<FieldDisplayName><right><ResearchPoints(cost)>", cost = cost})
end
child:SetFocusOrder(point(1000, n))
end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__condition', function (parent, context) return context end,
						'__template', "InfopanelSection",
						'RolloverTemplate', "Rollover",
						'RolloverText', T{3921, --[[XTemplate ResearchDlg RolloverText]] "<description><newline><newline>Research cost<right><ResearchPoints(cost)>"},
						'RolloverTitle', T{3917, --[[XTemplate ResearchDlg RolloverTitle]] "<display_name> (<FieldDisplayName>)"},
						'RolloverHint', T{3922, --[[XTemplate ResearchDlg RolloverHint]] "<right_click> Remove from Research queue"},
						'RolloverHintGamepad', T{3924, --[[XTemplate ResearchDlg RolloverHintGamepad]] "<ButtonX> Remove from research queue"},
						'FoldWhenHidden', false,
						'InternalLeftRightNav', false,
						'Title', T{460245435559, --[[XTemplate ResearchDlg Title]] "<display_name>"},
						'TitleHAlign', "left",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "InfopanelText",
							'Id', "idTechText",
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnActivate(self, context)",
							'parent', function (parent, context) return parent.parent end,
							'func', function (self, context)
if UICity:DequeueResearch(context.id) then
	PlayFX("DequeueResearch", "start")
end
end,
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnAltActivate(self, context)",
								'func', function (self, context)
self:OnActivate(context)
end,
							}),
							}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__condition', function (parent, context) return not context end,
						'__template', "InfopanelSection",
						'FoldWhenHidden', false,
						'Title', T{385959075356, --[[XTemplate ResearchDlg Title]] "Empty slot"},
						'Icon', "UI/Icons/Research/rm_unknown.tga",
						'TitleHAlign', "left",
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnActivate(self, context)",
							'parent', function (parent, context) return parent.parent end,
							'func', function (self, context)
PlayFX("UIDisabledButtonPressed", "start")
end,
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
parent.idSectionTitle:SetTextColor(RGB(96, 135, 185))
parent.idSectionTitle:SetRolloverTextColor(RGB(96, 135, 185))
end,
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__context', function (parent, context) return UICity end,
					'__parent', function (parent, context) return parent[1].idContent end,
					'__condition', function (parent, context) return UICity:GetResearchQueue()[1] end,
					'__template', "SimpleProgress",
					'Id', "idProgress",
					'Margins', box(0, 4, 0, 4),
					'MinWidth', 260,
					'MaxWidth', 260,
					'BindTo', "ResearchProgress",
				}),
				}),
			}),
		}),
})

