-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIModDetails",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'Image', "UI/Mods/Circle32White.tga",
		'ImageScale', point(500, 500),
		'FrameBox', box(15, 15, 15, 15),
		'SqueezeX', false,
		'SqueezeY', false,
	}),
	PlaceObj('XTemplateWindow', {
		'Id', "idContentWrapper",
		'MinWidth', 1704,
		'MinHeight', 980,
		'MaxWidth', 1704,
		'MaxHeight', 980,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
if GetUIStyleGamepad() then
	self:SetMinHeight(868)
	self:SetMaxHeight(868)
	self:ResolveId("idScrollAreaWrapper"):SetMaxHeight(755)
end
XWindow.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "content",
			'__context', function (parent, context) return GetDialogModeParam(parent) end,
			'__class', "XContextWindow",
			'Id', "idContent",
			'LayoutMethod', "VList",
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
XContextWindow.OnContextUpdate(self, context, ...)
local spinner = self:ResolveId("idSpinner")
spinner:SetVisible(not context.details_retrieved)
if not context.details_retrieved then
	ModsUIRetrieveModDetails(context)
end
local obj = GetDialog(self).context
self:ResolveId("idTitle"):SetText(context.DisplayName or "")
local author = context.Author or ""
if author ~= "" then
	author = T{10486, "by <author>", author = Untranslated(author)}
end
self:ResolveId("idAuthor"):SetText(author)
local game_version_win = self:ResolveId("idSuggestedVersionWindow")
if game_version_win then
	game_version_win:SetVisible(context.RequiredVersion and context.RequiredVersion ~= "")
	self:ResolveId("idSuggestedVersion"):SetText(context.RequiredVersion or "")
end
local current_rating_win = self:ResolveId("idCurrentRating")
if context.Rating and current_rating_win then
	for i = 1, context.Rating do
		current_rating_win[i]:SetImage("UI/Mods/rate-orange.tga")
	end
	current_rating_win:SetVisible(true)
	local ratings_total = self:ResolveId("idRatingsTotal")
	ratings_total:SetText("(" .. context.RatingsTotal .. ")")
	ratings_total:SetVisible(true)
end
local mod_id = context.ModID
if obj.installed_retrieved then
	local installed = obj.installed[mod_id] and not g_PopsDownloadingMods[mod_id]
	if installed then
		local corrupted, warning = context.Corrupted, context.Warning
		if corrupted == nil then
			local mod_def = obj.mod_defs[mod_id]
			if mod_def then
				corrupted, warning = ModsUIGetModCorruptedStatus(mod_def)
				context.Corrupted, context.Warning = corrupted, warning
			end
		end
		local warning_label = self:ResolveId("idWarning")
		warning_label:SetText(warning or "")
		warning_label:SetVisible(corrupted)
		if not corrupted then
			local enabled = obj.enabled[mod_id]
			local status = self:ResolveId("idStatus")
			if status then				
				if status then status:SetVisible(installed) end
				status.idTick:SetVisible(enabled)
				status.idEnabled:SetVisible(enabled)
				status.idDisabled:SetVisible(not enabled)
			end
			if not GetUIStyleGamepad() then
				local check_button = self:ResolveId("idEnabled")
				if check_button then
					check_button:SetCheck(enabled)
					check_button:SetVisible(true)
					check_button.idEnabled:SetVisible(enabled)
					check_button.idDisabled:SetVisible(not enabled)
				end
			end
		end
	end
	local install_button = self:ResolveId("idInstall")
	if not GetUIStyleGamepad() and install_button then
		install_button:SetVisible(not installed)
		install_button:SetEnabled(not g_PopsDownloadingMods[mod_id])
		self:ResolveId("idRemove"):SetVisible(installed)
	end
end
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "title",
				'Padding', box(100, 0, 60, 0),
				'Dock', "top",
				'VAlign', "top",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 10,
				'Background', RGBA(26, 26, 26, 255),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idTitle",
					'Margins', box(10, 0, 0, 0),
					'Padding', box(0, 30, 0, 30),
					'VAlign', "center",
					'TextStyle', "ModsUIDetailsTitle",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idAuthor",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "ModsUIDetailsSubtitle",
					'Translate', true,
				}),
				PlaceObj('XTemplateGroup', {
					'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "close button",
						'__class', "XTextButton",
						'Margins', box(0, 35, 0, 0),
						'Dock', "right",
						'VAlign', "top",
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
SetBackDialogMode(GetDialog(self))
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'Icon', "UI/Mods/x_large.tga",
						'IconRows', 2,
						'IconRow', 2,
					}),
					PlaceObj('XTemplateWindow', {
						'Id', "idSuggestedVersionWindow",
						'Margins', box(0, 0, 30, 0),
						'Dock', "right",
						'VAlign', "center",
						'LayoutMethod', "VList",
						'Visible', false,
						'FoldWhenHidden', true,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'TextStyle', "ModsUIDetailsVersionPC",
							'Translate', true,
							'Text', T(10133, --[[XTemplate ModsUIModDetails Text]] "SUGGESTED GAME VERSION"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idSuggestedVersion",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "ModsUIDetailsVersion",
							'TextHAlign', "right",
							'TextVAlign', "center",
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'Id', "idVersionWindow",
						'Margins', box(0, 0, 40, 0),
						'Dock', "right",
						'VAlign', "center",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'TextStyle', "ModsUIDetailsVersionPC",
							'Translate', true,
							'Text', T(895813825388, --[[XTemplate ModsUIModDetails Text]] "VERSION"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idVersion",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "ModsUIDetailsVersion",
							'TextHAlign', "right",
							'TextVAlign', "center",
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return GetUIStyleGamepad() end,
					'__class', "XFrame",
					'Id', "idStatus",
					'Margins', box(90, 0, 0, 0),
					'Padding', box(35, 15, 35, 15),
					'Dock', "right",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 2,
					'Visible', false,
					'FoldWhenHidden', true,
					'Image', "UI/Mods/button_black_border.tga",
					'ImageScale', point(1300, 1300),
					'FrameBox', box(25, 0, 25, 0),
					'SqueezeX', false,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idTick",
						'HAlign', "left",
						'Visible', false,
						'FoldWhenHidden', true,
						'Image', "UI/Mods/tick.tga",
						'ImageScale', point(450, 450),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idEnabled",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusDetailsEnabledConsole",
						'Translate', true,
						'Text', T(650897364803, --[[XTemplate ModsUIModDetails Text]] "ENABLED"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idDisabled",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusDetailsEnabledConsole",
						'Translate', true,
						'Text', T(921319243836, --[[XTemplate ModsUIModDetails Text]] "DISABLED"),
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return GetUIStyleGamepad() end,
					'__class', "XLabel",
					'Id', "idWarning",
					'Dock', "right",
					'VAlign', "center",
					'Visible', false,
					'FoldWhenHidden', true,
					'TextStyle', "ModsUIItemStatusWarningConsole",
					'Translate', true,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "back",
					'ActionName', T(4165, --[[XTemplate ModsUIModDetails ActionName]] "Back"),
					'ActionShortcut', "Escape",
					'ActionState', function (self, host)
return ModsUIIsPopupShown(host) and "hidden"
end,
					'OnActionEffect', "back",
					'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "buttons and rating",
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'Padding', box(100, 0, 100, 0),
				'Dock', "top",
				'VAlign', "top",
				'MinHeight', 81,
				'LayoutMethod', "HList",
				'LayoutHSpacing', 20,
				'Background', RGBA(235, 235, 235, 255),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XCheckButton",
					'Id', "idEnabled",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'FoldWhenHidden', true,
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'OnPress', function (self, gamepad)
ModsUIToggleEnabled(self.context, self)
end,
					'Icon', "UI/Mods/enable_disable.tga",
					'IconScale', point(1000, 1000),
					'IconColor', RGBA(255, 255, 255, 255),
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnChange(self, check)",
						'func', function (self, check)
self.idEnabled:SetVisible(check)
self.idDisabled:SetVisible(not check)
end,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idEnabled",
						'Margins', box(0, 0, 5, 0),
						'Padding', box(0, 0, 0, 0),
						'Dock', "left",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusDetailsEnabledPC",
						'Translate', true,
						'Text', T(460479110814, --[[XTemplate ModsUIModDetails Text]] "Enabled"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idDisabled",
						'Margins', box(0, 0, 5, 0),
						'Padding', box(0, 0, 0, 0),
						'Dock', "left",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusDetailsEnabledPC",
						'Translate', true,
						'Text', T(847439380056, --[[XTemplate ModsUIModDetails Text]] "Disabled"),
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not context.Local end,
					'__class', "XTextButton",
					'Id', "idInstall",
					'Margins', box(0, 8, 0, 8),
					'Padding', box(25, 0, 22, 0),
					'ScaleModifier', point(1300, 1300),
					'LayoutHSpacing', 6,
					'Visible', false,
					'FoldWhenHidden', true,
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'DisabledBackground', RGBA(255, 255, 255, 255),
					'OnPress', function (self, gamepad)
ModsUIInstallMod(self.context)
self:SetEnabled(false)
end,
					'Image', "UI/Mods/install.tga",
					'FrameBox', box(18, 18, 18, 18),
					'Columns', 2,
					'SqueezeX', true,
					'Icon', "UI/Mods/plus.tga",
					'IconScale', point(150, 150),
					'TextStyle', "ModsUIInstall",
					'Translate', true,
					'Text', T(722656647207, --[[XTemplate ModsUIModDetails Text]] "INSTALL"),
					'ColumnsUse', "abaaa",
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "SetEnabled(self, enabled)",
						'func', function (self, enabled)
XTextButton.SetEnabled(self, enabled)
self:SetDesaturation(enabled and 0 or 255)
end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not context.Local end,
					'__class', "XTextButton",
					'Id', "idRemove",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'FoldWhenHidden', true,
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
ModsUIUninstallMod(self.context)
end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
					'Icon', "UI/Mods/remove.tga",
					'IconColor', RGBA(125, 125, 125, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not context.Local end,
					'MinWidth', 1,
					'MaxWidth', 1,
					'Background', RGBA(224, 224, 244, 255),
				}),
				PlaceObj('XTemplateWindow', {
					'Id', "idFileSizeWindow",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 10,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'TextStyle', "ModsUIDetailsVersionConsole",
						'Translate', true,
						'Text', T(326044431931, --[[XTemplate ModsUIModDetails Text]] "SIZE"),
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "file size",
						'__class', "XLabel",
						'Id', "idSize",
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'TextStyle', "ModsUIDetailsVersionConsole",
						'Translate', true,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idWarning",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'Visible', false,
					'FoldWhenHidden', true,
					'TextStyle', "ModsUIItemStatusWarningConsole",
					'Translate', true,
				}),
				PlaceObj('XTemplateWindow', {
					'Dock', "right",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 20,
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "current rating",
						'LayoutMethod', "HList",
						'LayoutHSpacing', 10,
					}, {
						PlaceObj('XTemplateWindow', {
							'Id', "idCurrentRating",
							'VAlign', "center",
							'LayoutMethod', "HList",
							'LayoutHSpacing', 4,
							'Visible', false,
							'FoldWhenHidden', true,
						}, {
							PlaceObj('XTemplateForEach', {
								'array', function (parent, context) return nil, 1, 5 end,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Image', "UI/Mods/rate-gray.tga",
									'ImageScale', point(230, 230),
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idRatingsTotal",
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIDetailsRatingsTotal",
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not context.Local end,
						'__class', "XTextButton",
						'Id', "idRate",
						'Padding', box(30, 0, 30, 0),
						'HAlign', "center",
						'VAlign', "center",
						'RolloverOnFocus', false,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
ModsUIChooseModRating(dlg.idContentWrapper)
dlg:UpdateActionViews(dlg)
end,
						'Image', "UI/Mods/button_black_border.tga",
						'FrameBox', box(18, 18, 18, 18),
						'SqueezeX', true,
						'Icon', "UI/Mods/rate-black_small.tga",
						'IconScale', point(240, 240),
						'TextStyle', "DarkButtons",
						'Translate', true,
						'Text', T(295399897675, --[[XTemplate ModsUIModDetails Text]] "RATE"),
					}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not context.Local end,
						'MinWidth', 1,
						'MaxWidth', 1,
						'Background', RGBA(224, 224, 244, 255),
					}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not context.Local end,
						'__class', "XTextButton",
						'Id', "idFlag",
						'Padding', box(30, 0, 30, 0),
						'HAlign', "center",
						'VAlign', "center",
						'RolloverOnFocus', false,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
ModsUIChooseFlagReason(dlg.idContentWrapper)
dlg:UpdateActionViews(dlg)
end,
						'Image', "UI/Mods/button_black_border.tga",
						'FrameBox', box(18, 18, 18, 18),
						'SqueezeX', true,
						'Icon', "UI/Mods/flag-black.tga",
						'IconScale', point(240, 240),
						'TextStyle', "DarkButtons",
						'Translate', true,
						'Text', T(656241940093, --[[XTemplate ModsUIModDetails Text]] "FLAG"),
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idScrollAreaWrapper",
				'Margins', box(100, 0, 12, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XScrollArea",
					'Id', "idScrollArea",
					'IdNode', false,
					'VScroll', "idScroll",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplate",
						'IdNode', false,
						'LayoutMethod', "HList",
						'LayoutHSpacing', 130,
						'OnContextUpdate', function (self, context, ...)
XContentTemplate.OnContextUpdate(self, context, ...)
self:SetContentTexts()
end,
						'RespawnOnDialogMode', false,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "Open",
							'func', function (self, ...)
XContentTemplate.Open(self, ...)
self:SetContentTexts()
end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "SetContentTexts",
							'func', function (self, ...)
local context = self.context
local description = self:ResolveId("idDescription")
description:SetText(context.LongDescription or "")
description:SetVisible(context.LongDescription)

self:ResolveId("idRequirements"):SetVisible(context.RequiredMods or context.RequiredDlcs)
self:ResolveId("idDlcs"):SetVisible(context.RequiredDlcs)
self:ResolveId("idMods"):SetVisible(context.RequiredMods)

self:ResolveId("idChangelog"):SetVisible(context.ChangeLog and #context.ChangeLog > 0)
if context.Thumbnail then
	self:ResolveId("idThumbnail"):SetImage(context.Thumbnail)
	local thumb_small = self:ResolveId("idThumbSmall")
	if thumb_small then
		thumb_small:SetImage(context.Thumbnail)
	end
end
local size_win = self:ResolveId("idFileSizeWindow")
size_win:SetVisible(context.FileSize)
if context.FileSize then
	self:ResolveId("idSize"):SetText(T(10487, "<FormatSize(FileSize, 2)>"))
end
local version_win = self:ResolveId("idVersionWindow")
version_win:SetVisible(context.ModVersion and context.ModVersion ~= "")
self:ResolveId("idVersion"):SetText(context.ModVersion or "")
end,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "left column",
							'Margins', box(0, 40, 0, 40),
							'MinWidth', 974,
							'MaxWidth', 974,
							'LayoutMethod', "VList",
							'LayoutVSpacing', 20,
						}, {
							PlaceObj('XTemplateWindow', {
								'__condition', function (parent, context) return context.Thumbnail end,
								'__class', "XImage",
								'Id', "idThumbnail",
								'HAlign', "center",
								'VAlign', "center",
								'MinHeight', 450,
								'MaxWidth', 974,
								'MaxHeight', 450,
								'ImageFit', "smallest",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "screenshots",
								'__condition', function (parent, context) return #(context.ScreenshotPaths or "") > 0 end,
								'__class', "XList",
								'IdNode', false,
								'BorderWidth', 0,
								'Padding', box(10, 10, 10, 10),
								'HAlign', "center",
								'LayoutMethod', "HList",
								'LayoutHSpacing', 10,
								'Background', RGBA(235, 235, 235, 255),
								'FocusedBackground', RGBA(235, 235, 235, 255),
							}, {
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return context.Thumbnail end,
									'__class', "XImage",
									'Id', "idThumbSmall",
									'MinWidth', 150,
									'MinHeight', 100,
									'MaxWidth', 150,
									'MaxHeight', 100,
									'HandleMouse', true,
									'MouseCursor', "UI/Cursors/Rollover.tga",
									'ImageFit', "largest",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnMouseButtonDown(self, pos, button)",
										'func', function (self, pos, button)
if button == "L" then
	self:ResolveId("idThumbnail"):SetImage(self:GetImage())
	return "break"
end
return XImage.OnMouseButtonDown(self, pos, button)
end,
									}),
									}),
								PlaceObj('XTemplateForEach', {
									'array', function (parent, context) return context.ScreenshotPaths end,
									'run_after', function (child, context, item, i, n)
child:SetImage(item)
end,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XImage",
										'MinWidth', 150,
										'MinHeight', 100,
										'MaxWidth', 150,
										'MaxHeight', 100,
										'HandleMouse', true,
										'MouseCursor', "UI/Cursors/Rollover.tga",
										'ImageFit', "largest",
									}, {
										PlaceObj('XTemplateFunc', {
											'name', "OnMouseButtonDown(self, pos, button)",
											'func', function (self, pos, button)
if button == "L" then
	self:ResolveId("idThumbnail"):SetImage(self:GetImage())
	return "break"
end
return XImage.OnMouseButtonDown(self, pos, button)
end,
										}),
										}),
									}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idDescription",
								'TextStyle', "ModsUIDetailsDescription",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
									'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
OpenUrl(argument)
end,
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "right column",
							'Margins', box(0, 40, 0, 40),
							'MinWidth', 400,
							'MaxWidth', 400,
							'LayoutMethod', "VList",
						}, {
							PlaceObj('XTemplateWindow', {
								'LayoutMethod', "HList",
								'LayoutHSpacing', 20,
							}, {
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return GetUIStyleGamepad() end,
									'Id', "idFileSizeWindow",
									'LayoutMethod', "VList",
									'Visible', false,
									'FoldWhenHidden', true,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XLabel",
										'Padding', box(0, 0, 0, 0),
										'VAlign', "top",
										'TextStyle', "ModsUIDetailsVersionConsole",
										'Translate', true,
										'Text', T(326044431931, --[[XTemplate ModsUIModDetails Text]] "SIZE"),
									}),
									PlaceObj('XTemplateWindow', {
										'comment', "file size",
										'__class', "XLabel",
										'Id', "idSize",
										'Margins', box(0, 0, 0, 20),
										'Padding', box(0, 0, 0, 0),
										'VAlign', "top",
										'TextStyle', "ModsUIDetailsVersionConsole",
										'Translate', true,
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'__condition', function (parent, context) return GetUIStyleGamepad() end,
									'Id', "idVersionWindow",
									'Margins', box(0, 0, 40, 0),
									'VAlign', "top",
									'LayoutMethod', "VList",
									'FoldWhenHidden', true,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XLabel",
										'Padding', box(0, 0, 0, 0),
										'VAlign', "center",
										'TextStyle', "ModsUIDetailsVersionConsole",
										'Translate', true,
										'Text', T(895813825388, --[[XTemplate ModsUIModDetails Text]] "VERSION"),
									}),
									PlaceObj('XTemplateWindow', {
										'__class', "XLabel",
										'Id', "idVersion",
										'Padding', box(0, 0, 0, 0),
										'VAlign', "top",
										'TextStyle', "ModsUIDetailsVersionNumber",
									}),
									}),
								}),
							PlaceObj('XTemplateWindow', {
								'Id', "idRequirements",
								'Margins', box(0, 0, 0, 40),
								'LayoutMethod', "VList",
								'FoldWhenHidden', true,
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XLabel",
									'Id', "idRequirementsLabel",
									'TextStyle', "ModsUIDetailsColumnHeadings",
									'Translate', true,
									'Text', T(346268031765, --[[XTemplate ModsUIModDetails Text]] "REQUIREMENTS"),
								}),
								PlaceObj('XTemplateWindow', {
									'comment', "line",
									'Margins', box(0, 20, 0, 20),
									'MinHeight', 1,
									'MaxHeight', 1,
									'Background', RGBA(235, 235, 235, 255),
								}),
								PlaceObj('XTemplateWindow', {
									'comment', "dlcs",
									'Id', "idDlcs",
									'LayoutMethod', "VList",
									'FoldWhenHidden', true,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XLabel",
										'TextStyle', "ModsUIDetailsColumnHeadings",
										'Translate', true,
										'Text', T(428472374324, --[[XTemplate ModsUIModDetails Text]] "DLCs"),
									}),
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return context.RequiredDlcs end,
										'run_after', function (child, context, item, i, n)
child:SetText(item)
end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XText",
											'HandleMouse', false,
											'TextStyle', "ModsUIDetailsColumnItems",
										}),
										}),
									PlaceObj('XTemplateWindow', {
										'comment', "line",
										'Margins', box(0, 20, 0, 20),
										'MinHeight', 1,
										'MaxHeight', 1,
										'Background', RGBA(235, 235, 235, 255),
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'comment', "mods",
									'Id', "idMods",
									'LayoutMethod', "VList",
									'FoldWhenHidden', true,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XLabel",
										'TextStyle', "ModsUIDetailsColumnHeadings",
										'Translate', true,
										'Text', T(265664686175, --[[XTemplate ModsUIModDetails Text]] "Mods"),
									}),
									PlaceObj('XTemplateForEach', {
										'array', function (parent, context) return context.RequiredMods end,
										'run_after', function (child, context, item, i, n)
child:SetText(item)
end,
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XText",
											'HandleMouse', false,
											'TextStyle', "ModsUIDetailsColumnItems",
										}),
										}),
									PlaceObj('XTemplateWindow', {
										'comment', "line",
										'Margins', box(0, 20, 0, 20),
										'MinHeight', 1,
										'MaxHeight', 1,
										'Background', RGBA(235, 235, 235, 255),
									}),
									}),
								}),
							PlaceObj('XTemplateWindow', {
								'comment', "changelog",
								'Id', "idChangelog",
								'LayoutMethod', "VList",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XLabel",
									'Margins', box(0, 0, 0, 20),
									'TextStyle', "ModsUIDetailsColumnHeadings",
									'Translate', true,
									'Text', T(933609987631, --[[XTemplate ModsUIModDetails Text]] "CHANGELOG"),
								}),
								PlaceObj('XTemplateForEach', {
									'array', function (parent, context) return context.ChangeLog end,
									'__context', function (parent, context, item, i, n) return item end,
									'run_after', function (child, context, item, i, n)
child.idReleasedVersion:SetText(T{10488, "v<ModVersion> - Released <Released>", ModVersion = Untranslated(item.ModVersion), Released = Untranslated(item.Released)})
child.idDetails:SetText(item.Details)
end,
								}, {
									PlaceObj('XTemplateWindow', {
										'IdNode', true,
										'LayoutMethod', "VList",
									}, {
										PlaceObj('XTemplateWindow', {
											'__class', "XText",
											'Id', "idReleasedVersion",
											'HandleMouse', false,
											'TextStyle', "ModsUIDescription",
											'Translate', true,
										}),
										PlaceObj('XTemplateWindow', {
											'__class', "XText",
											'Id', "idDetails",
											'HandleMouse', false,
											'TextStyle', "ModsUIDetailsChangelog",
											'HideOnEmpty', true,
										}),
										PlaceObj('XTemplateWindow', {
											'comment', "line",
											'Margins', box(0, 20, 0, 20),
											'MinHeight', 1,
											'MaxHeight', 1,
											'Background', RGBA(235, 235, 235, 255),
										}),
										}),
									}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "Scrollbar",
					'Id', "idScroll",
					'Margins', box(70, 0, 0, 0),
					'Target', "idScrollArea",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idScrollDown",
					'ActionGamepad', "RightThumbDown",
					'OnAction', function (self, host, source)
local scroll_area = host:ResolveId("idScrollArea")
if scroll_area:GetVisible() then
	return scroll_area:OnMouseWheelBack()
end
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idScrollUp",
					'ActionGamepad', "RightThumbUp",
					'OnAction', function (self, host, source)
local scroll_area = host:ResolveId("idScrollArea")
if scroll_area:GetVisible() then
	return scroll_area:OnMouseWheelForward()
end
end,
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idSpinner",
			'FoldWhenHidden', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Background', RGBA(255, 255, 255, 185),
				'FocusedBackground', RGBA(255, 255, 255, 185),
				'Image', "UI/Mods/Circle32Black.tga",
				'ImageScale', point(500, 500),
				'FrameBox', box(15, 15, 15, 15),
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'FoldWhenHidden', true,
				'Image', "UI/Mods/PDX_spinner_anim.tga",
				'Columns', 16,
				'ImageColor', RGBA(128, 128, 128, 255),
				'Animate', true,
				'FPS', 25,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'Image', "UI/Mods/PDX_spinner_logo.tga",
				'ImageColor', RGBA(128, 128, 128, 255),
			}),
			}),
		}),
})

