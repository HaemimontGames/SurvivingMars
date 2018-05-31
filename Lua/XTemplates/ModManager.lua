-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "PreGame",
	id = "ModManager",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'HandleMouse', true,
		'InitialMode', "mods",
		'InternalModes', "mods,tags",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
ModManagerStart(self)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'__condition', function (parent, context) return Platform.steam end,
				'layer', "SteamWorkshop",
			}),
			PlaceObj('XTemplateLayer', {
				'__condition', function (parent, context) return not GameState.gameplay end,
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
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplate",
					'IdNode', false,
					'Dock', "top",
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "mods",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__condition', function (parent, context) return not GetDialogModeParam(parent) end,
							'__template', "DialogTitle",
						}),
						PlaceObj('XTemplateTemplate', {
							'__condition', function (parent, context) return GetDialogModeParam(parent) end,
							'__template', "ModTagsTitle",
						}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "tags",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "DialogTitle",
						}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBar",
					'MinWidth', 300,
				}),
				PlaceObj('XTemplateWindow', {
					'Dock', "right",
				}, {
					PlaceObj('XTemplateWindow', {
						'MinWidth', 500,
						'MaxWidth', 500,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XContentTemplate",
							'Id', "idTopContent",
							'Dock', "top",
						}, {
							PlaceObj('XTemplateMode', {
								'mode', "mods",
							}, {
								PlaceObj('XTemplateCode', {
									'run', function (self, parent, context)
local mode_param = GetDialogModeParam(parent)
if not mode_param then
	parent:ResolveId("idTitle"):SetTitle(T{1129, "MOD MANAGER"})
else
	parent:ResolveId("idTitle"):SetTitle(T{1125, "TAG: <tag>", tag = mode_param.display_name})
end
end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "filter",
									'ActionName', T{5460, --[[XTemplate ModManager ActionName]] "FILTER"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "ButtonX",
									'OnActionEffect', "mode",
									'OnActionParam', "tags",
									'__condition', function (parent, context) return not GetDialogModeParam(parent) end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "all_on",
									'ActionName', T{5458, --[[XTemplate ModManager ActionName]] "ALL ON"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "LeftTrigger",
									'OnAction', function (self, host, source, toggled)
AllModsOn(host)
end,
									'__condition', function (parent, context) return not GetDialogModeParam(parent) end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "all_off",
									'ActionName', T{5459, --[[XTemplate ModManager ActionName]] "ALL OFF"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightTrigger",
									'OnAction', function (self, host, source, toggled)
AllModsOff(host)
end,
									'__condition', function (parent, context) return not GetDialogModeParam(parent) end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "back",
									'ActionName', T{4254, --[[XTemplate ModManager ActionName]] "BACK"},
									'ActionToolbar', "ActionBar",
									'ActionShortcut', "Escape",
									'ActionGamepad', "ButtonB",
									'OnAction', function (self, host, source, toggled)
if not GetDialogModeParam(host) then
	ModManagerEnd(host)
else
	SetBackDialogMode(host)
end
end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "tags",
							}, {
								PlaceObj('XTemplateCode', {
									'run', function (self, parent, context)
local host = GetXDialog(parent)
host.idTitle:SetTitle(T{5460, "FILTER"})
host.idModInfo:SetVisible(false)
end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "back",
									'ActionName', T{4254, --[[XTemplate ModManager ActionName]] "BACK"},
									'ActionToolbar', "ActionBar",
									'ActionShortcut', "Escape",
									'ActionGamepad', "ButtonB",
									'OnActionEffect', "back",
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XContentTemplateList",
							'Id', "idList",
							'Margins', box(0, 40, 0, 10),
							'BorderWidth', 0,
							'Dock', "top",
							'LayoutVSpacing', 6,
							'Clip', false,
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'VScroll', "idScroll",
							'ShowPartialItems', false,
							'RespawnOnContext', false,
						}, {
							PlaceObj('XTemplateMode', {
								'mode', "mods",
							}, {
								PlaceObj('XTemplateForEach', {
									'comment', "mods",
									'array', function (parent, context) local param = GetDialogModeParam(parent) return GetModsListForTag(param and param.id) end,
									'__context', function (parent, context, item, i, n) return item end,
									'run_before', function (parent, context, item, i, n)
item.number = n
end,
									'run_after', function (child, context, item, i, n)
child.idValue:SetText(item.title)
if item.corrupted then
	child.idCorrupted:SetVisible(true)
	child.idValue:SetTextColor(RGBA(203,41,41,255))
else
	local found = table.find(AccountStorage.LoadMods, item.id)
	child.idCheckbox:SetImage(GetCheckboxImage(found))
	child.idCheckbox:SetVisible(true)
end
end,
								}, {
									PlaceObj('XTemplateTemplate', {
										'__template', "ModItem",
									}, {
										PlaceObj('XTemplateFunc', {
											'name', "OnSetRollover(self, rollover)",
											'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
if rollover then
	ShowModDescription(self.context, GetXDialog(self))
end
end,
										}),
										}),
									}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "tags",
							}, {
								PlaceObj('XTemplateForEach', {
									'comment', "tags",
									'array', function (parent, context) return GetModTags() end,
									'__context', function (parent, context, item, i, n) return item end,
									'run_before', function (parent, context, item, i, n)
item.number = n
end,
									'run_after', function (child, context, item, i, n)
child.idValue:SetText(item.text)
end,
								}, {
									PlaceObj('XTemplateTemplate', {
										'__template', "ModItem",
									}, {
										PlaceObj('XTemplateFunc', {
											'name', "OnPress(self)",
											'func', function (self)
SetDialogMode(self, "mods", self.context)
end,
										}),
										}),
									}),
								}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XPageScroll",
						'Id', "idScroll",
						'Dock', "bottom",
						'Target', "idList",
						'ForceFocusFirstItem', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnPageChanged",
							'func', function (self, ...)
GetXDialog(self).idModInfo:SetVisible(false)
end,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'Id', "idModInfo",
					'Padding', box(0, 0, 0, 10),
					'HAlign', "center",
					'MinWidth', 950,
					'MaxWidth', 950,
					'LayoutMethod', "VList",
					'Clip', "self",
					'Visible', false,
				}, {
					PlaceObj('XTemplateWindow', {
						'Padding', box(30, 0, 0, 0),
						'Dock', "top",
						'HAlign', "center",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idModTitle",
							'Dock', "top",
							'HAlign', "center",
							'VAlign', "center",
							'HandleMouse', false,
							'TextFont', "PGModTitle",
							'TextColor', RGBA(255, 255, 255, 255),
							'ShadowType', "outline",
							'ShadowSize', 1,
							'ShadowColor', RGBA(32, 32, 32, 255),
							'Translate', true,
							'TextHAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'IdNode', false,
							'Padding', box(20, 20, 20, 20),
							'HAlign', "center",
							'VAlign', "top",
							'MaxHeight', 370,
							'Image', "UI/Common/mod_image_shadow.tga",
							'FrameBox', box(20, 20, 20, 20),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idImage",
								'Image', "UI/Mods/Placeholder.tga",
								'ImageFit', "smallest",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'Padding', box(20, 0, 20, 0),
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idAuthor",
								'Margins', box(0, 0, 80, 0),
								'Dock', "left",
								'HandleMouse', false,
								'TextFont', "PGModAuthorDate",
								'TextColor', RGBA(158, 158, 158, 255),
								'ShadowType', "outline",
								'ShadowSize', 1,
								'ShadowColor', RGBA(32, 32, 32, 255),
								'Translate', true,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idLastUpdate",
								'Dock', "right",
								'HandleMouse', false,
								'TextFont', "PGModAuthorDate",
								'TextColor', RGBA(158, 158, 158, 255),
								'ShadowType', "outline",
								'ShadowSize', 1,
								'ShadowColor', RGBA(32, 32, 32, 255),
								'Translate', true,
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 20, 0, 0),
						'Dock', "top",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idWarning",
							'Margins', box(60, 0, 0, 10),
							'Dock', "top",
							'HandleMouse', false,
							'TextFont', "PGModWarning",
							'TextColor', RGBA(203, 41, 41, 255),
							'ShadowType', "outline",
							'ShadowSize', 1,
							'ShadowColor', RGBA(32, 32, 32, 255),
							'Translate', true,
							'HideOnEmpty', true,
							'TextHAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 10, 0, 0),
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XScrollArea",
								'Id', "idDescriptionTextArea",
								'IdNode', false,
								'VAlign', "center",
								'VScroll', "idModDescriptionScroller",
								'MouseWheelStep', 40,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XVerticalScroller",
									'Id', "idModDescriptionScroller",
									'Margins', box(0, 0, 10, 0),
									'Dock', "left",
									'Target', "idDescriptionTextArea",
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idDescription",
									'VAlign', "center",
									'Clip', false,
									'HandleMouse', false,
									'TextFont', "PGMissionDescr",
									'TextColor', RGBA(240, 235, 198, 255),
									'ShadowType', "outline",
									'ShadowSize', 1,
									'ShadowColor', RGBA(32, 32, 32, 255),
									'Translate', true,
									'HideOnEmpty', true,
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idTags",
							'Margins', box(60, 10, 0, 0),
							'Dock', "bottom",
							'MaxHeight', 80,
							'Clip', false,
							'HandleMouse', false,
							'TextFont', "PGModTags",
							'TextColor', RGBA(158, 158, 158, 255),
							'ShadowType', "outline",
							'ShadowSize', 1,
							'ShadowColor', RGBA(32, 32, 32, 255),
							'Translate', true,
							'Shorten', true,
							'HideOnEmpty', true,
						}),
						}),
					}),
				}),
			}),
		}),
})

