-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGParadox",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PDXAccountObjectCreateAndLoad() end,
		'__class', "XDialog",
		'HandleMouse', true,
		'InitialMode', "link",
		'InternalModes', "link,create,items,legal",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
context:SetDialog(parent)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
g_ParadoxMenuContextObj = false
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "margins",
				'Margins', box(0, 30, 100, 50),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitle",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBar",
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 40, 0, 40),
					'Dock', "top",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplateList",
						'Id', "idList",
						'BorderWidth', 0,
						'HAlign', "right",
						'MinWidth', 620,
						'MaxWidth', 620,
						'LayoutVSpacing', 16,
						'Clip', false,
						'Background', RGBA(0, 0, 0, 0),
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'VScroll', "idScroll",
						'ShowPartialItems', false,
						'MouseScroll', true,
					}, {
						PlaceObj('XTemplateMode', {
							'mode', "link",
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
local title = T{4525, "PARADOX ACCOUNT"}
if g_PopsAttemptingLogin then
	title = T{8670, "PARADOX ACCOUNT - LOGGING IN..."}
elseif g_ParadoxAccountLinked then
	title = T{8540, "PARADOX ACCOUNT - LOGGED IN"}
	if Platform.steam or Platform.durango or Platform.ps4 then
		title = T{7732, "PARADOX ACCOUNT - LINKED"}
	end
end
parent:ResolveId("idTitle"):SetTitle(title)
end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "unlink",
								'ActionName', T{240206219367, --[[XTemplate PGParadox ActionName]] "UNLINK ACCOUNT"},
								'ActionToolbar', "ActionBar",
								'ActionGamepad', "ButtonX",
								'OnAction', function (self, host, source)
local obj = host.context
obj:Disconnect()
end,
								'__condition', function (parent, context) return g_ParadoxAccountLinked and (Platform.steam or Platform.durango or Platform.ps4) end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "log out",
								'ActionName', T{180804794360, --[[XTemplate PGParadox ActionName]] "LOG OUT"},
								'ActionToolbar', "ActionBar",
								'ActionGamepad', "ButtonX",
								'OnAction', function (self, host, source)
local obj = host.context
obj:Disconnect()
end,
								'__condition', function (parent, context) return g_ParadoxAccountLinked and not (Platform.steam or Platform.durango or Platform.ps4) end,
							}),
							PlaceObj('XTemplateGroup', {
								'__condition', function (parent, context) return not g_PopsAttemptingLogin and not g_ParadoxAccountLinked end,
							}, {
								PlaceObj('XTemplateAction', {
									'ActionId', "new_account",
									'ActionName', T{816278241153, --[[XTemplate PGParadox ActionName]] "NEW ACCOUNT"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonY",
									'OnActionEffect', "mode",
									'OnActionParam', "create",
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "link",
									'ActionName', T{143709976272, --[[XTemplate PGParadox ActionName]] "LINK ACCOUNT"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnAction', function (self, host, source)
local obj = host.context
obj:Login()
end,
									'__condition', function (parent, context) return Platform.steam or Platform.durango or Platform.ps4 end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "log in",
									'ActionName', T{696496147405, --[[XTemplate PGParadox ActionName]] "LOG IN"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnAction', function (self, host, source)
local obj = host.context
obj:Login()
end,
									'__condition', function (parent, context) return not (Platform.steam or Platform.durango or Platform.ps4) end,
								}),
								}),
							PlaceObj('XTemplateAction', {
								'ActionId', "close",
								'ActionName', T{4523, --[[XTemplate PGParadox ActionName]] "CLOSE"},
								'ActionToolbar', "ActionBar",
								'ActionShortcut', "Escape",
								'ActionGamepad', "ButtonB",
								'OnActionEffect', "back",
							}),
							PlaceObj('XTemplateForEach', {
								'comment', "property",
								'array', function (parent, context) return context:GetProperties() end,
								'condition', function (parent, context, item, i) return not g_PopsAttemptingLogin and (item.category == "" or item.category == "Legal") and (not item.filter or item.filter()) end,
								'item_in_context', "prop_meta",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PropEntry",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XImage",
										'Id', "idRollover",
										'ZOrder', 0,
										'Margins', box(-60, 0, -60, -6),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/Common/bm_buildings_pad.tga",
										'ImageFit', "stretch",
									}),
									}),
								}),
							}),
						PlaceObj('XTemplateMode', {
							'mode', "create",
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetTitle(T{816278241152, "CREATE ACCOUNT"})
parent:SetUniformRowHeight(false)
end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "create",
								'ActionName', T{816278241152, --[[XTemplate PGParadox ActionName]] "CREATE ACCOUNT"},
								'ActionToolbar', "ActionBar",
								'ActionGamepad', "ButtonY",
								'ActionState', function (self, host)
local obj = ResolvePropObj(host.context)
if not obj:CanCreateAccount() then
	return "disabled"
end
end,
								'OnAction', function (self, host, source)
local obj = host.context
obj:CreateAccount()
end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "back",
								'ActionName', T{4254, --[[XTemplate PGParadox ActionName]] "BACK"},
								'ActionToolbar', "ActionBar",
								'ActionShortcut', "Escape",
								'ActionGamepad', "ButtonB",
								'OnActionEffect', "back",
							}),
							PlaceObj('XTemplateForEach', {
								'comment', "property",
								'array', function (parent, context) return context:GetProperties() end,
								'condition', function (parent, context, item, i) return not item.filter or item.filter() end,
								'item_in_context', "prop_meta",
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "PropEntry",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XImage",
										'Id', "idRollover",
										'ZOrder', 0,
										'Margins', box(-60, 0, -60, -6),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/Common/bm_buildings_pad.tga",
										'ImageFit', "stretch",
									}),
									}),
								}),
							}),
						PlaceObj('XTemplateMode', {
							'mode', "items",
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetTitle(GetDialogModeParam(parent).name)
parent:SetUniformRowHeight(true)
end,
							}),
							PlaceObj('XTemplateAction', {
								'ActionId', "back",
								'ActionName', T{4254, --[[XTemplate PGParadox ActionName]] "BACK"},
								'ActionToolbar', "ActionBar",
								'ActionShortcut', "Escape",
								'ActionGamepad', "ButtonB",
								'OnActionEffect', "back",
							}),
							PlaceObj('XTemplateForEach', {
								'comment', "item",
								'array', function (parent, context) return GetDialogModeParam(parent).items() end,
								'__context', function (parent, context, item, i, n) return item end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "MenuEntrySmall",
									'HAlign', "right",
									'OnPress', function (self, gamepad)
local prop_meta = GetDialogModeParam(self)
SetProperty(GetDialogContext(self), prop_meta.id, self.context.value)
SetBackDialogMode(self)
end,
									'TextColor', RGBA(221, 215, 170, 255),
									'Text', T{730563403228, --[[XTemplate PGParadox Text]] "<text>"},
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__template', "Scrollbar",
						'Id', "idScroll",
						'Target', "idList",
					}),
					}),
				}),
			}),
		}),
})

