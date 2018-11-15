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
				'Margins', box(60, 68, 0, 25),
				'Dock', "left",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(55, 0, 0, 0),
					'MinWidth', 300,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T{1129, --[[XTemplate ModManager Title]] "MOD MANAGER"},
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
							'__condition', function (parent, context) return GetDialogModeParam(parent) end,
							'__template', "DialogTitleSmall",
							'Id', "idTitleSmall",
							'Margins', box(55, 0, 0, 0),
						}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "tags",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "DialogTitleSmall",
							'Id', "idTitleSmall",
							'Margins', box(55, 0, 0, 0),
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'Padding', box(0, 0, 250, 0),
					'Dock', "left",
				}, {
					PlaceObj('XTemplateWindow', nil, {
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
if mode_param then
	parent:ResolveId("idTitleSmall"):SetTitle(T{1125, "TAG: <tag>", tag = mode_param.display_name})
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
									'OnAction', function (self, host, source)
AllModsOn(host)
end,
									'__condition', function (parent, context) return not GetDialogModeParam(parent) end,
								}),
								PlaceObj('XTemplateAction', {
									'ActionId', "all_off",
									'ActionName', T{5459, --[[XTemplate ModManager ActionName]] "ALL OFF"},
									'ActionToolbar', "ActionBar",
									'ActionGamepad', "RightTrigger",
									'OnAction', function (self, host, source)
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
									'OnAction', function (self, host, source)
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
local host = GetDialog(parent)
host.idTitleSmall:SetTitle(T{5460, "FILTER"})
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
							'Dock', "top",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XContentTemplateList",
								'Id', "idList",
								'Margins', box(-20, 0, 20, 0),
								'BorderWidth', 0,
								'Padding', box(0, 0, 0, 0),
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
	child.idValue:SetTextStyle("PGListItemValueCorrupted")
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
	ShowModDescription(self.context, GetDialog(self))
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
							PlaceObj('XTemplateTemplate', {
								'__template', "ScrollbarNew",
								'Id', "idScroll",
								'Target', "idList",
							}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idModInfo",
				'Padding', box(0, 90, 0, 0),
				'HAlign', "left",
				'LayoutMethod', "VList",
				'Visible', false,
				'FadeInTime', 200,
				'FadeOutTime', 200,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idImage",
					'Padding', box(20, 20, 20, 10),
					'Dock', "top",
					'HAlign', "left",
					'VAlign', "top",
					'MaxHeight', 360,
					'Image', "UI/Common/Placeholder.tga",
					'ImageFit', "smallest",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'IdNode', false,
					'Margins', box(5, 0, 0, 0),
					'Padding', box(35, 18, 40, 10),
					'Dock', "top",
					'HAlign', "left",
					'VAlign', "top",
					'MaxHeight', 83,
					'Image', "UI/CommonNew/pg_header_small.tga",
					'FrameBox', box(31, 0, 74, 0),
					'TileFrame', true,
					'SqueezeY', false,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idModTitle",
						'Padding', box(0, 0, 0, 0),
						'HAlign', "center",
						'VAlign', "center",
						'MaxWidth', 800,
						'HandleMouse', false,
						'TextStyle', "ItemTitle",
						'Translate', true,
						'HideOnEmpty', true,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XScrollArea",
					'Id', "idDescriptionTextArea",
					'IdNode', false,
					'Margins', box(-30, 0, 0, 0),
					'VAlign', "center",
					'VScroll', "idModDescriptionScroller",
					'MouseWheelStep', 40,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XVerticalScroller",
						'Id', "idModDescriptionScroller",
						'Dock', "left",
						'Target', "idDescriptionTextArea",
					}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(17, 0, 0, 0),
						'HAlign', "left",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'LayoutMethod', "HList",
						}, {
							PlaceObj('XTemplateWindow', {
								'Padding', box(0, 0, 50, 0),
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idAuthor",
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr1",
									'Translate', true,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idLastUpdate",
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr1",
									'Translate', true,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idTags",
									'Clip', false,
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr1",
									'Translate', true,
									'Shorten', true,
									'HideOnEmpty', true,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idAuthorVal",
									'MaxHeight', 600,
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr2",
									'Translate', true,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idLastUpdateVal",
									'MaxHeight', 600,
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr2",
									'Translate', true,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Id', "idTagsVal",
									'MaxHeight', 600,
									'Clip', false,
									'HandleMouse', false,
									'TextStyle', "SaveLoadDescr2",
									'Translate', true,
									'Shorten', true,
									'HideOnEmpty', true,
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idWarning",
							'HAlign', "left",
							'HandleMouse', false,
							'TextStyle', "SaveLoadDescr1",
							'Translate', true,
							'HideOnEmpty', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idDescription",
							'Padding', box(2, 22, 2, 2),
							'VAlign', "center",
							'MaxWidth', 800,
							'Clip', false,
							'HandleMouse', false,
							'TextStyle', "SaveLoadDescr2",
							'Translate', true,
							'HideOnEmpty', true,
						}),
						}),
					}),
				}),
			}),
		}),
})

