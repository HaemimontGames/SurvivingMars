-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColonistsOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "colonists",
		'InternalModes', "colonists, domes, traits",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
				local dlg = GetDialog(parent)
				if dlg then
					dlg.OnShortcut = function(dlg, shortcut, source)
						if shortcut == "RightShoulder" and rawget(dlg, "idList") then
							if not dlg.idList:IsFocused(true) then
								dlg.idList:SetFocus()
								dlg.idList:SetSelection(rawget(dlg, "last_list_focus") or 1)
								return "break"
							end
						elseif shortcut == "LeftShoulder" and rawget(dlg, "idButtons") then
							if not dlg.idButtons:IsFocused(true) then
								rawset(dlg, "last_list_focus", dlg.idList.focused_item)
								dlg.idButtons[1]:SetFocus()
								return "break"
							end
						end
						return XDialog.OnShortcut(dlg, shortcut, source)
					end
				end
			end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Title', T(106988210968, --[[XTemplate ColonistsOverview Title]] "COLONISTS"),
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return context or {} end,
			'__class', "XContentTemplate",
			'Id', "idContent",
			'IdNode', false,
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "colonists",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idButtonsScroll",
					'ZOrder', 0,
					'Margins', box(87, 0, 0, 0),
					'Target', "idButtonsScrollArea",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XScrollArea",
					'Id', "idButtonsScrollArea",
					'IdNode', false,
					'Dock', "left",
					'VScroll', "idButtonsScroll",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContextWindow",
						'Id', "idButtons",
						'Margins', box(12, 0, 0, 0),
						'LayoutMethod', "VList",
						'OnContextUpdate', function (self, context, ...)
							for _, child in ipairs(self) do
								child:OnContextUpdate(context, ...)
							end
							XContextWindow.OnContextUpdate(self, context, ...)
						end,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnShortcut(self, shortcut, source)",
							'func', function (self, shortcut, source)
								return CCC_ButtonListOnShortcut(self, shortcut, source)
							end,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterDomeFilter",
							'Margins', box(-12, 0, 0, 10),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "able to work",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(9673, --[[XTemplate ColonistsOverview RolloverTitle]] "Able to Work"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local able_to_work = dlg.context.able_to_work
								self:SetIcon(able_to_work == false and "UI/Icons/ColonyControlCenter/working_age_off.tga" or "UI/Icons/ColonyControlCenter/working_age_on.tga")
								self:SetRolloverText(GetColonistsFilterRollover(context, T(515632937650, "Toggle filtering of Colonists that are able to work.")))
								self:SetRolloverHint(able_to_work ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
								local hint_gamepad = able_to_work ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
								hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
								self:SetToggled(not not able_to_work)
							end,
							'OnPress', function (self, gamepad)
								ToggleCommandCenterFilter(self, "able_to_work", true)
							end,
							'Icon', "UI/Icons/ColonyControlCenter/working_age_off.tga",
							'Text', T(9673, --[[XTemplate ColonistsOverview Text]] "Able to Work"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "unable to work",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(731124482973, --[[XTemplate ColonistsOverview RolloverTitle]] "Unable to Work"),
							'Margins', box(-12, 0, 0, 10),
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local unable_to_work = dlg.context.unable_to_work
								self:SetIcon(not unable_to_work and "UI/Icons/ColonyControlCenter/unable_to_work_off.tga" or "UI/Icons/ColonyControlCenter/unable_to_work_on.tga")
								self:SetRolloverText(GetColonistsFilterRollover(context, T(9674, "Toggle filtering of Colonists that are unable to work.")))
								self:SetRolloverHint(unable_to_work and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
								local hint_gamepad = unable_to_work and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
								hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
								self:SetToggled(not not unable_to_work)
							end,
							'OnPress', function (self, gamepad)
								ToggleCommandCenterFilter(self, "unable_to_work")
							end,
							'Icon', "UI/Icons/ColonyControlCenter/unable_to_work_off.tga",
							'Text', T(731124482973, --[[XTemplate ColonistsOverview Text]] "Unable to Work"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "homeless",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(9665, --[[XTemplate ColonistsOverview RolloverTitle]] "Homeless colonists"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local homeless = dlg.context.homeless
								self:SetIcon(not homeless and "UI/Icons/ColonyControlCenter/homeless_off.tga" or "UI/Icons/ColonyControlCenter/homeless_on.tga")
								self:SetRolloverText(GetColonistsFilterRollover(context, T(9676, "Toggle filtering of Homeless Colonists.")))
								self:SetRolloverHint(homeless and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
								local hint_gamepad = homeless and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
								hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
								self:SetToggled(not not homeless)
							end,
							'OnPress', function (self, gamepad)
								ToggleCommandCenterFilter(self, "homeless")
							end,
							'Icon', "UI/Icons/ColonyControlCenter/homeless_off.tga",
							'Text', T(9665, --[[XTemplate ColonistsOverview Text]] "Homeless colonists"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "unemployed",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(9666, --[[XTemplate ColonistsOverview RolloverTitle]] "Unemployed colonists"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local unemployed = dlg.context.unemployed
								self:SetIcon(not unemployed and "UI/Icons/ColonyControlCenter/unemployed_off.tga" or "UI/Icons/ColonyControlCenter/unemployed_on.tga")
								self:SetRolloverText(GetColonistsFilterRollover(context, T(9677, "Toggle filtering of Unemployed Colonists.")))
								self:SetRolloverHint(unemployed and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
								local hint_gamepad = unemployed and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
								hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
								self:SetToggled(not not unemployed)
							end,
							'OnPress', function (self, gamepad)
								ToggleCommandCenterFilter(self, "unemployed")
							end,
							'Icon', "UI/Icons/ColonyControlCenter/unemployed_off.tga",
							'Text', T(9666, --[[XTemplate ColonistsOverview Text]] "Unemployed colonists"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "problematic colonists",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(7934, --[[XTemplate ColonistsOverview RolloverTitle]] "Problematic colonists"),
							'Margins', box(-12, 0, 0, 10),
							'OnContextUpdate', function (self, context, ...)
								local dlg = GetDialog(self)
								local problematic = dlg.context.problematic_colonists
								self:SetIcon(not problematic and "UI/Icons/ColonyControlCenter/problematic_colonists_off.tga" or "UI/Icons/ColonyControlCenter/problematic_colonists_on.tga")
								self:SetRolloverText(GetColonistsFilterRollover(context, T(9678, "Toggle filtering of Colonists suffering from status effects.")))
								self:SetRolloverHint(problematic and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
								local hint_gamepad = problematic and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
								hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
								self:SetToggled(not not problematic)
							end,
							'OnPress', function (self, gamepad)
								ToggleCommandCenterFilter(self, "problematic_colonists")
							end,
							'Icon', "UI/Icons/ColonyControlCenter/problematic_colonists_off.tga",
							'Text', T(7934, --[[XTemplate ColonistsOverview Text]] "Problematic colonists"),
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverTitle', T(11607, --[[XTemplate ColonistsOverview RolloverTitle]] "Age Group"),
							'Id', "idAge",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(9672, "Filter by Age Group.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "Age Group")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local trait = self.context["trait_Age Group"]
									local trait_name = trait and trait.display_name or T(11679, "No filter")
									self:SetText(T{11608, "AGE GROUP: <em><trait></em>", trait = trait_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverTitle', T(11609, --[[XTemplate ColonistsOverview RolloverTitle]] "Specialization"),
							'Id', "idSpec",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(11610, "Filter by Specialization.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "Specialization")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local trait = self.context.trait_Specialization
									local trait_name = trait and trait.display_name or T(11679, "No filter")
									self:SetText(T{11611, "SPECIALIZATION: <em><trait></em>", trait = trait_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverTitle', T(12302, --[[XTemplate ColonistsOverview RolloverTitle]] "Interest"),
							'Id', "idInterest",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(11834, "Filter by Interest.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "interest")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local interest = self.context.trait_interest
									local interest_name = interest and interest.display_name or T(11679, "No filter")
									self:SetText(T{11835, "INTEREST: <em><interest></em>", interest = interest_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverTitle', T(11612, --[[XTemplate ColonistsOverview RolloverTitle]] "Perks"),
							'Id', "idPerk",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(11613, "Filter by Perks.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "Positive")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local trait = self.context.trait_Positive
									local trait_name = trait and trait.display_name or T(11679, "No filter")
									self:SetText(T{11614, "PERK: <em><trait></em>", trait = trait_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverTitle', T(11615, --[[XTemplate ColonistsOverview RolloverTitle]] "Quirk"),
							'Id', "idQuirk",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(11616, "Filter by Quirk.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "other")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local trait = self.context.trait_other
									local trait_name = trait and trait.display_name or T(11679, "No filter")
									self:SetText(T{11617, "QUIRK: <em><trait></em>", trait = trait_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterButton",
							'RolloverText', T(372599874431, --[[XTemplate ColonistsOverview RolloverText]] "Filter by Flaw"),
							'RolloverTitle', T(583453649364, --[[XTemplate ColonistsOverview RolloverTitle]] "Flaw"),
							'Id', "idFlaw",
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
								XTextButton.OnContextUpdate(self, context, ...)
								self:SetRolloverText(GetColonistsFilterRollover(context, T(11618, "Filter by Flaw.")))
								local hint_gamepad = T(507431830973, "<ButtonA> Set filter") .. " " .. T(9802, "<RB> Inspect")
								self:SetRolloverHintGamepad(hint_gamepad)
							end,
							'OnPress', function (self, gamepad)
								SpawnTraitsPopup(self, "Negative")
							end,
							'Image', "UI/CommonNew/ccc_categories_small.tga",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idText",
								'Margins', box(15, 0, 0, 0),
								'VAlign', "center",
								'TextStyle', "CCCFilterItem",
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
									local trait = self.context.trait_Negative
									local trait_name = trait and trait.display_name or T(11679, "No filter")
									self:SetText(T{11619, "FLAW: <em><trait></em>", trait = trait_name})
								end,
								'Translate', true,
							}),
							}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
								if GetUIStyleGamepad() then
									local first = parent[1]
									CreateRealTimeThread(function(first)
										if first.window_state ~= "destroying" then
											first:SetFocus()
										end
									end, first)
								end
							end,
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XSizeConstrainedWindow",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Target', "idList",
				}),
				PlaceObj('XTemplateMode', {
					'mode', "colonists",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate ColonistsOverview ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "prev",
						'ActionName', T(129795472601, --[[XTemplate ColonistsOverview ActionName]] "PREVIOUS DOME"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "LeftTrigger",
						'OnAction', function (self, host, source)
							SelectCommandCenterNextDome(host, -1)
						end,
						'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "next",
						'ActionName', T(9679, --[[XTemplate ColonistsOverview ActionName]] "NEXT DOME"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightTrigger",
						'OnAction', function (self, host, source)
							SelectCommandCenterNextDome(host, 1)
						end,
						'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "interests",
						'ActionName', T(663581795644, --[[XTemplate ColonistsOverview ActionName]] "INTERESTS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
							return host.context.interests and "hidden"
						end,
						'OnAction', function (self, host, source)
							ToggleColonistsTraitsInterests(host)
							host:UpdateActionViews(host.idActionBar)
						end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "traits",
						'ActionName', T(265445412858, --[[XTemplate ColonistsOverview ActionName]] "TRAITS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
							return not host.context.interests and "hidden"
						end,
						'OnAction', function (self, host, source)
							ToggleColonistsTraitsInterests(host)
							host:UpdateActionViews(host.idActionBar)
						end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "reset",
						'ActionName', T(550362230354, --[[XTemplate ColonistsOverview ActionName]] "RESET FILTERS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
							host.context.dome = nil
							host.context.able_to_work = nil
							host.context.unable_to_work = nil
							host.context.homeless = nil
							host.context.unemployed = nil
							host.context.problematic_colonists = nil
							host.context["trait_Age Group"] = nil
							host.context["trait_Negative"] = nil
							host.context["trait_Specialization"] = nil
							host.context["trait_other"] = nil
							host.context["trait_Positive"] = nil
							host.context.sort_type = nil
							host.context.sort_ascending = nil
							host:ResolveId("idContent"):RespawnContent()
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "column titles",
						'Margins', box(83, 0, 0, 15),
						'Dock', "top",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "name",
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'MinWidth', 200,
							'MaxWidth', 200,
							'HandleMouse', false,
							'TextStyle', "OverviewItemSection",
							'Translate', true,
							'Text', T(547, --[[XTemplate ColonistsOverview Text]] "Colonists"),
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "stats: health",
							'__class', "XTextButton",
							'Margins', box(10, 0, 0, 0),
							'MinWidth', 36,
							'MinHeight', 31,
							'MaxWidth', 36,
							'MaxHeight', 31,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'OnPress', function (self, gamepad)
								SetColonistsSorting(self, "stat_health")
							end,
							'Image', "UI/Icons/Sections/health.tga",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "stats: stress",
							'__class', "XTextButton",
							'Margins', box(25, 0, 0, 0),
							'MinWidth', 36,
							'MinHeight', 31,
							'MaxWidth', 36,
							'MaxHeight', 31,
							'OnPress', function (self, gamepad)
								SetColonistsSorting(self, "stat_sanity")
							end,
							'Image', "UI/Icons/Sections/stress.tga",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "stats: comfort",
							'__class', "XTextButton",
							'Margins', box(25, 0, 0, 0),
							'MinWidth', 36,
							'MinHeight', 31,
							'MaxWidth', 36,
							'MaxHeight', 31,
							'OnPress', function (self, gamepad)
								SetColonistsSorting(self, "stat_comfort")
							end,
							'Image', "UI/Icons/Sections/comfort.tga",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "stats: morale",
							'__class', "XTextButton",
							'Margins', box(25, 0, 0, 0),
							'MinWidth', 36,
							'MinHeight', 31,
							'MaxWidth', 36,
							'MaxHeight', 31,
							'OnPress', function (self, gamepad)
								SetColonistsSorting(self, "stat_morale")
							end,
							'Image', "UI/Icons/Sections/morale.tga",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "traits",
							'__class', "XText",
							'Id', "idTraitsTitle",
							'Margins', box(30, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 370,
							'MaxWidth', 370,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextStyle', "OverviewItemSection",
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
								self:SetVisible(not context.interests)
								XText.OnContextUpdate(self, context, ...)
							end,
							'Translate', true,
							'Text', T(235, --[[XTemplate ColonistsOverview Text]] "Traits"),
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "interests",
							'__class', "XText",
							'Id', "idInterestsTitle",
							'Margins', box(30, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 370,
							'MaxWidth', 370,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextStyle', "OverviewItemSection",
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
								self:SetVisible(context.interests)
								XText.OnContextUpdate(self, context, ...)
							end,
							'Translate', true,
							'Text', T(186933092758, --[[XTemplate ColonistsOverview Text]] "Interests"),
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplateList",
						'Id', "idList",
						'Margins', box(4, 0, 0, 0),
						'BorderWidth', 0,
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 1013,
						'MaxWidth', 1013,
						'UniformRowHeight', true,
						'Clip', false,
						'Background', RGBA(0, 0, 0, 0),
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'VScroll', "idScroll",
						'ShowPartialItems', false,
						'MouseScroll', true,
						'GamepadInitialSelection', false,
						'OnContextUpdate', function (self, context, ...)
							XContentTemplateList.OnContextUpdate(self, context, ...)
							self:ResolveId("idNoResults"):SetVisible(#self == 0)
						end,
						'RespawnOnDialogMode', false,
					}, {
						PlaceObj('XTemplateMode', {
							'mode', "colonists",
						}, {
							PlaceObj('XTemplateForEach', {
								'comment', "colonists",
								'array', function (parent, context) local colonists = GetCommandCenterColonists(context); parent:ResolveId("idTitle"):SetTitle(T{9811, "<white><count></white> COLONISTS", count = #colonists}) return colonists end,
								'__context', function (parent, context, item, i, n) return item end,
								'run_before', function (parent, context, item, i, n)
									NewXVirtualContent(parent, context, "ColonistOverviewRow", 1013, 46)
								end,
							}),
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
						'Text', T(9763, --[[XTemplate ColonistsOverview Text]] "No objects matching current filters."),
					}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local list = parent:ResolveId("idList")
							parent:ResolveId("idNoResults"):SetVisible(#list == 0)
						end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "domes",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "CommandCenterDomeList",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "traits",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplateList",
						'Id', "idList",
						'BorderWidth', 0,
						'Padding', box(0, 0, 0, 0),
						'LayoutVSpacing', 16,
						'UniformRowHeight', true,
						'Clip', false,
						'Background', RGBA(0, 0, 0, 0),
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'VScroll', "idScroll",
						'ShowPartialItems', false,
						'MouseScroll', true,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'OnPress', function (self, gamepad)
								local dlg = GetDialog(self)
								dlg.context["trait_" .. dlg.mode_param.trait_group] = nil
								SetBackDialogMode(self)
							end,
							'Text', T(652319561018, --[[XTemplate ColonistsOverview Text]] "All Traits"),
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "traits",
							'array', function (parent, context) local dlg = GetDialog(parent); return GetTSortedTraits(dlg.mode_param and dlg.mode_param.trait_group) end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_after', function (child, context, item, i, n)
								child:SetRolloverTitle(item.display_name)
								child:SetRolloverText(item.description)
							end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "MenuEntrySmall",
								'RolloverTemplate', "Rollover",
								'RolloverAnchor', "left",
								'OnPress', function (self, gamepad)
									local dlg = GetDialog(self)
									dlg.context["trait_" .. dlg.mode_param.trait_group] = self.context
									SetBackDialogMode(self)
								end,
								'Text', T(583679719179, --[[XTemplate ColonistsOverview Text]] "<display_name>"),
							}),
							}),
						PlaceObj('XTemplateAction', {
							'ActionId', "back",
							'ActionName', T(4254, --[[XTemplate ColonistsOverview ActionName]] "BACK"),
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "back",
						}),
						}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							parent:ResolveId("idScroll"):SetMargins(box(99,0,0,0))
						end,
					}),
					}),
				}),
			}),
		}),
})

