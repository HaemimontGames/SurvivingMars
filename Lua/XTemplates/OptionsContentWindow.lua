-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "OptionsContentWindow",
	PlaceObj('XTemplateWindow', {
		'HAlign', "left",
		'MinWidth', 550,
		'MinHeight', 550,
	}, {
		PlaceObj('XTemplateWindow', {
			'Margins', box(60, 40, 0, 40),
			'Dock', "top",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplateList",
				'Id', "idList",
				'Margins', box(39, 0, 0, 0),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'LayoutVSpacing', 10,
				'UniformRowHeight', true,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
				'MouseScroll', true,
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "options",
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local title = T(1131, --[[XTemplate OptionsDlg Title]] "OPTIONS")
							if GameState.gameplay then
								parent:ResolveId("idTitle"):SetTitle(title)
							else
								parent:ResolveId("idTitle"):SetTitle(title)
							end
						end,
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "categories",
						'array', function (parent, context) return OptionsCategories end,
						'condition', function (parent, context, item, i) return not item.filter or item.filter() end,
						'__context', function (parent, context, item, i, n) return item end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'OnPress', function (self, gamepad)
								if self.context.run and type(self.context.run) == "function" then
									self.context.run()
								elseif self.context.id == "Credits" then
									SetDialogMode(self, "credits", self.context)
								elseif self.context.id == "ModOptions" then
									SetDialogMode(self, "mod_choice", self.context)
								else
									SetDialogMode(self, "properties", self.context)
								end
							end,
							'TextStyle', "ListItem3",
							'Text', T(526116656618, --[[XTemplate OptionsContentWindow Text]] "<display_name>"),
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "close",
						'ActionName', T(4523, --[[XTemplate OptionsContentWindow ActionName]] "CLOSE"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "properties",
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local title = GetDialogModeParam(parent).caps_name
							if GameState.gameplay then
								parent:ResolveId("idTitle"):SetTitle(title)
							else
								parent:ResolveId("idTitle"):SetTitle(title)
							end
						end,
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "property",
						'array', function (parent, context) return context:GetProperties() end,
						'condition', function (parent, context, item, i) item.items = item.items or OptionsData.Options[item.id] return item.category == GetDialogModeParam(parent).id and FilterGameOption(item) end,
						'item_in_context', "prop_meta",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "PropEntry",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XFrame",
								'Id', "idRollover",
								'ZOrder', 0,
								'Margins', box(-35, -15, 0, -5),
								'Dock', "box",
								'HAlign', "left",
								'MinWidth', 448,
								'Visible', false,
								'Image', "UI/CommonNew/pg_selection.tga",
								'FrameBox', box(50, 0, 178, 0),
								'TileFrame', true,
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not GameState.gameplay and GetUIStyleGamepad() and GetDialogModeParam(parent).id == "Controls" end,
						'__class', "XPropControl",
						'RolloverOnFocus', true,
						'FXMouseIn', "MenuItemHover",
						'FXPress', "MenuItemClick",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "PropValue",
							'TextStyle', "ListItem3",
						}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
								parent.idValue:SetText(Platform.ps4 and T(7874, "Wireless Controller Layout") or T(1142, "Controller Layout"))
							end,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Id', "idRollover",
							'ZOrder', 0,
							'Margins', box(-35, -15, 0, -5),
							'Dock', "box",
							'HAlign', "left",
							'MinWidth', 448,
							'Visible', false,
							'Image', "UI/CommonNew/pg_selection.tga",
							'FrameBox', box(50, 0, 178, 0),
							'TileFrame', true,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnMouseButtonDown(self, pos, button)",
							'func', function (self, pos, button)
								XPropControl.OnMouseButtonDown(self, pos, button)
								if button == "L" then
								  SetDialogMode(self, "controller")
								end
							end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnShortcut(self, shortcut, source)",
							'func', function (self, shortcut, source)
								if shortcut == "ButtonA" then
									self:OnMouseButtonDown(nil, "L")
								end
							end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "SetSelected(self, selected)",
							'func', function (self, selected)
								if GetUIStyleGamepad() then
									self:SetFocus(selected)
								end
							end,
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "cancelOptions",
						'ActionName', T(5450, --[[XTemplate OptionsContentWindow ActionName]] "CANCEL"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source)
							CancelOptions(host)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id ~= "Display" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "cancelDisplayOptions",
						'ActionName', T(5450, --[[XTemplate OptionsContentWindow ActionName]] "CANCEL"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source)
							CancelDisplayOptions(host)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id == "Display" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "autoDetect",
						'ActionName', T(5470, --[[XTemplate OptionsContentWindow ActionName]] "AUTO DETECT"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnAction', function (self, host, source)
							Options.Autodetect(EngineOptions)
							local obj = ResolvePropObj(host.context)
							obj:SetVideoPreset(EngineOptions.VideoPreset)
							ObjModified(obj)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id == "Video" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "restoreDefaults",
						'ActionName', T(5469, --[[XTemplate OptionsContentWindow ActionName]] "RESET"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnAction', function (self, host, source)
							local obj = ResolvePropObj(host.context)
							obj:ResetOptionsByCategory(GetDialogModeParam(host).id)
							ObjModified(obj)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id == "Keybindings" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "resetToDefaults",
						'ActionName', T(5469, --[[XTemplate OptionsContentWindow ActionName]] "RESET"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnAction', function (self, host, source)
							local obj = ResolvePropObj(host.context)
							obj:ResetOptionsByCategory(GetDialogModeParam(host).id)
							ObjModified(obj)
						end,
						'__condition', function (parent, context) local category = GetDialogModeParam(parent).id return category == "Audio" or category == "Controls" or category == "Gameplay" or category == "Display" or category == "ModOptions" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "applyOptions",
						'ActionName', T(5447, --[[XTemplate OptionsContentWindow ActionName]] "APPLY"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
							ApplyOptions(host)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id ~= "Display" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "applyDisplayOptions",
						'ActionName', T(5447, --[[XTemplate OptionsContentWindow ActionName]] "APPLY"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
							ApplyDisplayOptions(host)
						end,
						'__condition', function (parent, context) return GetDialogModeParam(parent).id == "Display" end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local title = GetDialogModeParam(parent).name
							if GameState.gameplay then
								parent:ResolveId("idTitle"):SetTitle(title)
							else
								parent:ResolveId("idTitle"):SetTitle(title)
							end
						end,
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "item",
						'array', function (parent, context) return GetDialogModeParam(parent).items end,
						'condition', function (parent, context, item, i) return not item.not_selectable end,
						'__context', function (parent, context, item, i, n) return item end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'OnPress', function (self, gamepad)
								local prop_meta = GetDialogModeParam(self)
								SetProperty(prop_meta.context_override or GetDialogContext(self), prop_meta.id, self.context.value)
								SetBackDialogMode(self)
							end,
							'TextStyle', "ListItem3",
							'Text', T(730563403228, --[[XTemplate OptionsContentWindow Text]] "<text>"),
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "cancel",
						'ActionName', T(5450, --[[XTemplate OptionsContentWindow ActionName]] "CANCEL"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "mod_choice",
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local title = T(12551, --[[XTemplate OptionsDlg Title]] "MOD OPTIONS")
							parent:ResolveId("idTitle"):SetTitle(title)
						end,
					}),
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return ModsLoaded end,
						'condition', function (parent, context, item, i) return IsKindOf(item.options, "ModOptionsObject") end,
						'__context', function (parent, context, item, i, n) return item end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'OnPress', function (self, gamepad)
								local options = self.context.options
								self.parent:ResolveId("idOriginalModOptions"):SetContext(options:Clone())
								SetDialogMode(self, "mod_options", self.context)
							end,
							'TextStyle', "ListItem3",
							'Text', T(333279788004, --[[XTemplate OptionsContentWindow Text]] "<u(title)>"),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return #parent == 0 end,
						'__class', "XText",
						'Id', "idNoModsText",
						'TextStyle', "ListItem4",
						'Text', "Mod options are not yet available.",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(108518605856, --[[XTemplate OptionsContentWindow ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "mod_options",
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							local title = T(12551, --[[XTemplate OptionsDlg Title]] "MOD OPTIONS")
							parent:ResolveId("idTitle"):SetTitle(title)
						end,
					}),
					PlaceObj('XTemplateGroup', {
						'__context', function (parent, context) return GetDialogModeParam(parent).options end,
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "property",
							'array', function (parent, context) return context:GetProperties() end,
							'__context', function (parent, context, item, i, n) return ModOptionEditorContext(context, item) end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropEntry",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idRollover",
									'ZOrder', 0,
									'Margins', box(-35, -15, 0, -5),
									'Dock', "box",
									'HAlign', "left",
									'MinWidth', 448,
									'Visible', false,
									'Image', "UI/CommonNew/pg_selection.tga",
									'FrameBox', box(50, 0, 178, 0),
									'TileFrame', true,
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "cancel",
						'ActionName', T(5450, --[[XTemplate OptionsContentWindow ActionName]] "CANCEL"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
						'OnAction', function (self, host, source)
							CancelModOptions(host)
						end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "reset",
						'ActionName', T(849084517790, --[[XTemplate OptionsContentWindow ActionName]] "RESET"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnActionEffect', "back",
						'OnAction', function (self, host, source)
							ResetModOptions(host)
						end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "applyOptions",
						'ActionName', T(5447, --[[XTemplate OptionsContentWindow ActionName]] "APPLY"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
							ApplyModOptions(host)
						end,
					}),
					}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "ScrollbarNew",
				'Id', "idScroll",
				'Target', "idList",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "controller",
			}, {
				PlaceObj('XTemplateLayer', {
					'layer', "GamepadControlsOverview",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "back",
					'ActionName', T(4254, --[[XTemplate OptionsContentWindow ActionName]] "BACK"),
					'ActionToolbar', "ActionBar",
					'ActionShortcut', "Escape",
					'ActionGamepad', "ButtonB",
					'OnActionEffect', "back",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "credits",
			}, {
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
						OpenDialog("Credits", nil, {dlg = parent})
					end,
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateWindow', {
		'__class', "XContextWindow",
		'Id', "idOriginalModOptions",
		'Dock', "ignore",
	}),
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) OptionsObjOriginal = OptionsCreateAndLoad() return OptionsObjOriginal end,
		'__class', "XContextWindow",
		'Id', "idOriginalOptions",
		'Dock', "ignore",
	}),
})

