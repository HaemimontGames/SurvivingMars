-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIMainContent",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'Image', "UI/Mods/Circle32Black.tga",
		'ImageScale', point(500, 500),
		'FrameBox', box(15, 15, 15, 15),
		'SqueezeX', false,
		'SqueezeY', false,
	}),
	PlaceObj('XTemplateWindow', {
		'Id', "idContentWrapper",
	}, {
		PlaceObj('XTemplateWindow', {
			'comment', "content",
			'Id', "idContent",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "tabs",
				'Padding', box(60, 0, 60, 0),
				'Dock', "top",
				'VAlign', "top",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 30,
			}, {
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not Platform.steam and GetUIStyleGamepad() end,
					'__class', "XTextButton",
					'Id', "idLeftTrigger",
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
self:ResolveId("idBrowse"):Press()
end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
				}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not Platform.steam end,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "browse",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idBrowse",
							'Padding', box(0, 30, 0, 30),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ModsUISetDialogMode(self, "browse")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
							'TextStyle', "ModsUITabBold",
							'Translate', true,
							'Text', T(10125, --[[XTemplate ModsUIMainContent Text]] "Browse All"),
						}),
						PlaceObj('XTemplateWindow', {
							'Id', "idBrowseUnderline",
							'Dock', "box",
							'VAlign', "bottom",
							'MinHeight', 1,
							'MaxHeight', 1,
							'Background', RGBA(246, 246, 246, 255),
						}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "installed",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idBrowse",
							'Padding', box(0, 30, 0, 30),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ModsUISetDialogMode(self, "browse")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
							'TextStyle', "ModsUITab",
							'Translate', true,
							'Text', T(10125, --[[XTemplate ModsUIMainContent Text]] "Browse All"),
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', nil, {
					PlaceObj('XTemplateMode', {
						'mode', "browse",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idInstalled",
							'Padding', box(0, 30, 0, 30),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ModsUISetDialogMode(self, "installed")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
							'TextStyle', "ModsUITab",
							'Translate', true,
							'Text', T(10126, --[[XTemplate ModsUIMainContent Text]] "Installed Mods"),
						}, {
							PlaceObj('XTemplateWindow', {
								'Margins', box(15, 0, 10, 0),
								'VAlign', "center",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Margins', box(-10, 0, -10, 0),
									'Image', "UI/Mods/pad_red.tga",
									'FrameBox', box(12, 0, 12, 0),
									'SqueezeX', false,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Padding', box(0, 0, 0, 0),
									'HAlign', "center",
									'VAlign', "center",
									'HandleMouse', false,
									'TextStyle', "ModsUIInstalledCount",
									'Translate', true,
									'Text', T(335190217572, --[[XTemplate ModsUIMainContent Text]] "<InstalledModsCount>"),
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "installed",
					}, {
						PlaceObj('XTemplateWindow', {
							'Id', "idInstalledUnderline",
							'Dock', "box",
							'VAlign', "bottom",
							'MinHeight', 1,
							'MaxHeight', 1,
							'Background', RGBA(246, 246, 246, 255),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idInstalled",
							'Padding', box(0, 30, 0, 30),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ModsUISetDialogMode(self, "installed")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
							'TextStyle', "ModsUITabBold",
							'Translate', true,
							'Text', T(10126, --[[XTemplate ModsUIMainContent Text]] "Installed Mods"),
						}, {
							PlaceObj('XTemplateWindow', {
								'Margins', box(15, 0, 10, 0),
								'VAlign', "center",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Margins', box(-10, 0, -10, 0),
									'Image', "UI/Mods/pad_red.tga",
									'FrameBox', box(12, 0, 12, 0),
									'SqueezeX', false,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XText",
									'Padding', box(0, 0, 0, 0),
									'HAlign', "center",
									'VAlign', "center",
									'HandleMouse', false,
									'TextStyle', "ModsUIInstalledCount",
									'Translate', true,
									'Text', T(150610842665, --[[XTemplate ModsUIMainContent Text]] "<InstalledModsCount>"),
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not Platform.steam and GetUIStyleGamepad() end,
					'__class', "XTextButton",
					'Id', "idRightTrigger",
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
self:ResolveId("idInstalled"):Press()
end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
				}),
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
if GetUIStyleGamepad() then
	local left = parent:ResolveId("idLeftTrigger")
	if left then
		left:SetIcon(GetPlatformSpecificImagePath("LT"))
	end
	local right = parent:ResolveId("idRightTrigger")
	if right then
		right:SetIcon(GetPlatformSpecificImagePath("RT"))
	end
end
end,
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "close button",
					'__condition', function (parent, context) return not GetUIStyleGamepad() end,
					'__class', "XTextButton",
					'Margins', box(0, 35, 0, 0),
					'Dock', "right",
					'VAlign', "top",
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
ModsUIDialogEnd(GetDialog(self))
end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
					'Icon', "UI/Mods/x_large.tga",
					'IconRows', 2,
					'IconRow', 2,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "back",
					'ActionName', T(4165, --[[XTemplate ModsUIMainContent ActionName]] "Back"),
					'ActionShortcut', "Escape",
					'OnAction', function (self, host, source)
local shown = ModsUIIsPopupShown(host)
if shown then
	if shown == "sort" and not GetUIStyleGamepad() then
		ModsUIToggleSortPC(host)
	else
		ModsUIClosePopup(host)
	end
else
	ModsUIDialogEnd(host)
end
end,
					'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "line",
				'Dock', "top",
				'MinHeight', 1,
				'MaxHeight', 1,
				'Background', RGBA(40, 40, 40, 255),
			}),
			PlaceObj('XTemplateWindow', {
				'Padding', box(60, 0, 22, 30),
				'LayoutMethod', "HList",
				'LayoutHSpacing', 22,
			}, {
				PlaceObj('XTemplateWindow', nil, {
					PlaceObj('XTemplateWindow', {
						'comment', "info sort",
						'Padding', box(0, 0, 38, 30),
						'Dock', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XContentTemplate",
							'IdNode', false,
						}, {
							PlaceObj('XTemplateWindow', {
								'Padding', box(0, 30, 0, 0),
							}, {
								PlaceObj('XTemplateWindow', {
									'comment', "line",
									'Margins', box(0, 30, 0, 0),
									'Dock', "bottom",
									'MinHeight', 1,
									'MaxHeight', 1,
									'Background', RGBA(40, 40, 40, 255),
								}),
								PlaceObj('XTemplateMode', {
									'mode', "installed",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idTextInstalled",
										'VAlign', "center",
										'FoldWhenHidden', true,
										'HandleMouse', false,
										'TextStyle', "ModsUIText",
										'Translate', true,
										'Text', T(10127, --[[XTemplate ModsUIMainContent Text]] "<InstalledModsCount> mods installed"),
									}),
									}),
								PlaceObj('XTemplateMode', {
									'mode', "browse",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idTextAvailable",
										'VAlign', "center",
										'FoldWhenHidden', true,
										'HandleMouse', false,
										'TextStyle', "ModsUIText",
										'Translate', true,
										'Text', T(10128, --[[XTemplate ModsUIMainContent Text]] "<ModsCount> mods available"),
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'comment', "sort",
									'Id', "idCtrlsSort",
									'Dock', "right",
									'VAlign', "center",
									'LayoutMethod', "HList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XImage",
										'Id', "idSortBack",
										'IdNode', false,
										'Margins', box(-10, -10, 0, -10),
										'Dock', "box",
										'Visible', false,
										'Background', RGBA(246, 246, 246, 255),
									}),
									PlaceObj('XTemplateGroup', {
										'__condition', function (parent, context) return not GetUIStyleGamepad() end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XLabel",
											'Id', "idSortLabel",
											'VAlign', "center",
											'TextStyle', "ModsUISortTitle",
											'Translate', true,
											'Text', T(10129, --[[XTemplate ModsUIMainContent Text]] "SORT"),
										}),
										PlaceObj('XTemplateMode', {
											'mode', "browse",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XTextButton",
												'Id', "idSortButton",
												'Padding', box(0, 0, 10, 0),
												'Background', RGBA(0, 0, 0, 0),
												'MouseCursor', "UI/Cursors/Rollover.tga",
												'FocusedBackground', RGBA(0, 0, 0, 0),
												'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
ModsUIToggleSortPC(dlg.idContentWrapper)
end,
												'RolloverBackground', RGBA(0, 0, 0, 0),
												'PressedBackground', RGBA(0, 0, 0, 0),
												'TextStyle', "ModsUISortText",
												'Translate', true,
												'Text', T(10130, --[[XTemplate ModsUIMainContent Text]] "<SortTextUppercase>"),
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XImage",
													'Id', "idSortTriangle",
													'VAlign', "center",
													'Image', "UI/Mods/triangle.tga",
													'Rows', 2,
												}),
												}),
											}),
										PlaceObj('XTemplateMode', {
											'mode', "installed",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XTextButton",
												'Id', "idSortButton",
												'Padding', box(0, 0, 10, 0),
												'Background', RGBA(0, 0, 0, 0),
												'MouseCursor', "UI/Cursors/Rollover.tga",
												'FocusedBackground', RGBA(0, 0, 0, 0),
												'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
ModsUIToggleSortPC(dlg.idContentWrapper)
end,
												'RolloverBackground', RGBA(0, 0, 0, 0),
												'PressedBackground', RGBA(0, 0, 0, 0),
												'TextStyle', "ModsUISortText",
												'Translate', true,
												'Text', T(662491165788, --[[XTemplate ModsUIMainContent Text]] "<InstalledSortTextUppercase>"),
											}, {
												PlaceObj('XTemplateWindow', {
													'__class', "XImage",
													'Id', "idSortTriangle",
													'VAlign', "center",
													'Image', "UI/Mods/triangle.tga",
													'Rows', 2,
												}),
												}),
											}),
										}),
									PlaceObj('XTemplateGroup', {
										'__condition', function (parent, context) return GetUIStyleGamepad() end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__condition', function (parent, context) return GetUIStyleGamepad() end,
											'__class', "XLabel",
											'VAlign', "center",
											'TextStyle', "ModsUISortTitle",
											'Translate', true,
											'Text', T(10131, --[[XTemplate ModsUIMainContent Text]] "SORTED"),
										}),
										PlaceObj('XTemplateMode', {
											'mode', "browse",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'TextStyle', "ModsUISortText",
												'Translate', true,
												'Text', T(10130, --[[XTemplate ModsUIMainContent Text]] "<SortTextUppercase>"),
											}),
											}),
										PlaceObj('XTemplateMode', {
											'mode', "installed",
										}, {
											PlaceObj('XTemplateWindow', {
												'__class', "XText",
												'TextStyle', "ModsUISortText",
												'Translate', true,
												'Text', T(662491165788, --[[XTemplate ModsUIMainContent Text]] "<InstalledSortTextUppercase>"),
											}),
											}),
										}),
									}),
								}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'Id', "idAboveList",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "Scrollbar",
							'Id', "idScroll",
							'Margins', box(20, 0, 0, 0),
							'Target', "idList",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XContentTemplateList",
							'Id', "idList",
							'BorderWidth', 0,
							'Padding', box(0, 0, 0, 0),
							'MinWidth', 1174,
							'MinHeight', 732,
							'MaxWidth', 1174,
							'MaxHeight', 732,
							'GridStretchX', false,
							'GridStretchY', false,
							'LayoutMethod', "Grid",
							'LayoutHSpacing', 4,
							'LayoutVSpacing', 4,
							'UniformColumnWidth', true,
							'UniformRowHeight', true,
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'VScroll', "idScroll",
							'MouseScroll', true,
							'OnContextUpdate', function (self, context, ...)
local mode = GetDialogMode(self)
if mode == "browse" then
	self:ResolveId("idListSpinner"):SetVisible(not context.counted)
	if g_ParadoxAccountLoggedIn then
		self:ResolveId("idNoResults"):SetVisible(context.counted and context:GetModsCount() == 0)
	end
	self:ResolveId("idLoginPrompt"):SetVisible(not g_ParadoxAccountLoggedIn and not g_PopsAttemptingLogin)
elseif mode == "installed" then
	self:ResolveId("idListSpinner"):SetVisible(not context.installed_retrieved)
	self:ResolveId("idNoInstalledMods"):SetVisible(context.installed_retrieved and context:GetInstalledModsCount() == 0)
end
XContentTemplateList.OnContextUpdate(self, context, ...)
if #self == 0 then
	ModsUISetSelectedMod(false)
end
end,
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
if GetUIStyleGamepad() then
	self:SetMinWidth(1584)
	self:SetMaxWidth(1584)
	self:SetMinHeight(620)
	self:SetMaxHeight(620)
end
XContentTemplateList.Open(self, ...)
local context = self.context
local mode = GetDialogMode(self)
if mode == "browse" then
	self:ResolveId("idListSpinner"):SetVisible(not context.counted)
	self:ResolveId("idNoResults"):SetVisible(g_ParadoxAccountLoggedIn and context.counted and context:GetModsCount() == 0)
	self:ResolveId("idLoginPrompt"):SetVisible(not g_ParadoxAccountLoggedIn and not g_PopsAttemptingLogin)
elseif mode == "installed" then
	self:ResolveId("idListSpinner"):SetVisible(not context.installed_retrieved)
	self:ResolveId("idNoInstalledMods"):SetVisible(context.installed_retrieved and context:GetInstalledModsCount() == 0)
end
end,
							}),
							PlaceObj('XTemplateMode', {
								'mode', "browse",
							}, {
								PlaceObj('XTemplateForEach', {
									'array', function (parent, context) return context.mods end,
									'run_before', function (parent, context, item, i, n)
local width, height = 387, 269
if GetUIStyleGamepad() then
	width, height = 524,367
end
local child = NewXVirtualContent(parent, item, "ModsUIBrowseListItem", width, height)
child:SetGridX((i-1)%3 + 1)
child:SetGridY((i-1)/3 + 1)
child:SetHAlign("left")
end,
								}),
								}),
							PlaceObj('XTemplateMode', {
								'mode', "installed",
							}, {
								PlaceObj('XTemplateForEach', {
									'array', function (parent, context) return context.installed_mods end,
									'run_before', function (parent, context, item, i, n)
local width, height = 1174, 92
if GetUIStyleGamepad() then
	width, height = 1583,100
end
local child = NewXVirtualContent(parent, item, "ModsUIInstalledMod", width, height)
child:SetGridX(1)
child:SetGridY(i)
end,
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'Id', "idListSpinner",
							'FoldWhenHidden', true,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Dock', "box",
								'HAlign', "center",
								'VAlign', "center",
								'FoldWhenHidden', true,
								'Image', "UI/Mods/PDX_spinner_anim.tga",
								'Columns', 16,
								'Animate', true,
								'FPS', 25,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Dock', "box",
								'HAlign', "center",
								'VAlign', "center",
								'Image', "UI/Mods/PDX_spinner_logo.tga",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idNoResults",
							'Dock', "box",
							'HAlign', "center",
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextStyle', "ModsUITabSelected",
							'Translate', true,
							'Text', T(850495104319, --[[XTemplate ModsUIMainContent Text]] "No mods match the search criteria"),
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idNoInstalledMods",
							'Dock', "box",
							'HAlign', "center",
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextStyle', "ModsUITabSelected",
							'Translate', true,
							'Text', T(897422645672, --[[XTemplate ModsUIMainContent Text]] "No installed mods match the search criteria"),
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'Id', "idLoginPrompt",
							'Dock', "box",
							'HAlign', "center",
							'VAlign', "center",
							'LayoutMethod', "VList",
							'LayoutVSpacing', 10,
							'Visible', false,
							'FoldWhenHidden', true,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'HAlign', "center",
								'VAlign', "center",
								'LayoutMethod', "VList",
								'HandleMouse', false,
								'TextStyle', "ModsUITabSelected",
								'Translate', true,
								'Text', T(961541164547, --[[XTemplate ModsUIMainContent Text]] "You need to be logged in to browse mods."),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__condition', function (parent, context) return not GetUIStyleGamepad() end,
								'__class', "XTextButton",
								'Id', "idLogIn",
								'Padding', box(18, 0, 18, 0),
								'HAlign', "center",
								'VAlign', "center",
								'RolloverOnFocus', false,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'OnPress', function (self, gamepad)
local host = GetDialog(self)
ModsUIOpenLoginPopup(host.idContentWrapper)
host:UpdateActionViews(host)
end,
								'Image', "UI/Mods/green_button.tga",
								'FrameBox', box(18, 18, 18, 18),
								'Columns', 2,
								'TextStyle', "LightButtons",
								'Translate', true,
								'Text', T(507473038910, --[[XTemplate ModsUIMainContent Text]] "LOGIN"),
								'ColumnsUse', "abaaa",
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not GetUIStyleGamepad() end,
					'MinWidth', 350,
					'MinHeight', 854,
					'MaxWidth', 350,
					'MaxHeight', 854,
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "search box",
						'__condition', function (parent, context) return not GetUIStyleGamepad() end,
						'Margins', box(25, 16, 25, 16),
						'Padding', box(0, 25, 0, 30),
						'Dock', "top",
						'HAlign', "right",
						'VAlign', "bottom",
						'MinWidth', 300,
						'MaxWidth', 300,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Margins', box(-25, -16, -25, -16),
							'Image', "UI/Mods/search_pad.tga",
							'FrameBox', box(25, 16, 25, 16),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XEdit",
							'Id', "idSearch",
							'BorderWidth', 0,
							'Padding', box(0, 0, 30, 0),
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'TextStyle', "ModsUISerachPC",
							'MaxLen', 255,
							'AutoSelectAll', true,
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnShortcut(self, shortcut, source)",
								'func', function (self, shortcut, source)
if shortcut == "Enter" then
	self:ResolveId("idSearchButton"):Press()
	return "break"
end
return XEdit.OnShortcut(self, shortcut, source)
end,
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idSearchButton",
							'HAlign', "right",
							'VAlign', "center",
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'OnPress', function (self, gamepad)
local mode = GetDialogMode(self)
local context = self.context
local text = self:ResolveId("idSearch"):GetText()
if text == _InternalTranslate(T(10485, "Search mods...")) then
	text = ""
end
local old_query = mode == "browse" and context.query or context.installed_query
if old_query ~= text then
	if mode == "browse" then
		context.query = text
		context:GetMods()
	else
		context.installed_query = text
		context:GetInstalledMods()
	end
end
end,
							'Image', "UI/Mods/magnifying_glass.tga",
						}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
local mode = GetDialogMode(parent)
local query = mode == "browse" and context.query or context.installed_query
query = query ~= "" and query or _InternalTranslate(T(10485, "Search mods..."))
parent:ResolveId("idSearch"):SetText(query)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(0, 8, 0, 20),
						'Padding', box(0, 0, 0, 0),
						'Dock', "top",
						'TextStyle', "ModsUITagsTitle",
						'Translate', true,
						'Text', T(10132, --[[XTemplate ModsUIMainContent Text]] "TAGS"),
					}),
					PlaceObj('XTemplateWindow', nil, {
						PlaceObj('XTemplateWindow', {
							'comment', "tags list",
							'__class', "XList",
							'Id', "idTagsList",
							'BorderWidth', 0,
							'Padding', box(0, 0, 0, 0),
							'LayoutVSpacing', 10,
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'VScroll', "idTagsScroll",
						}, {
							PlaceObj('XTemplateForEach', {
								'array', function (parent, context) return PredefinedModTags end,
								'run_after', function (child, context, item, i, n)
local mode = GetDialogMode(child)
local temp_table = (mode == "installed") and "temp_installed_tags" or "temp_tags"
local tags_table = (mode == "installed") and "set_installed_tags" or "set_tags"
local name = item.display_name
child.idCheck:SetText(name)
child.idCheck:SetCheck(context[tags_table][name])
child.idCheck.OnChange = function(self, check)
	context[temp_table][name] = check or nil
	if mode == "installed" then
		ModsUISetInstalledTags()
		context:GetInstalledMods()
	else
		ModsUISetTags()
		context:GetMods()
	end
end
end,
							}, {
								PlaceObj('XTemplateTemplate', {
									'__template', "ModsUITagListItem",
								}),
								}),
							}),
						PlaceObj('XTemplateTemplate', {
							'__template', "Scrollbar",
							'Id', "idTagsScroll",
							'Target', "idTagsList",
						}),
						}),
					}),
				}),
			}),
		}),
})

