-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XListItem",
	group = "Mods",
	id = "ModsUIBrowseListItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XListItem",
		'BorderWidth', 0,
		'Padding', box(3, 3, 3, 3),
		'HAlign', "left",
		'VAlign', "center",
		'RolloverZoom', 1015,
		'RolloverDrawOnTop', true,
		'RolloverOnFocus', true,
		'HandleMouse', true,
		'OnContextUpdate', function (self, context, ...)
XListItem.OnContextUpdate(self, context, ...)
self.idModTitle:SetText(context.DisplayName or "")
self.idAuthor:SetText(context.Author or "")
local mod_id = context.ModID
self.idListSpinner:SetVisible(not next(context) or g_PopsDownloadingMods[mod_id])
local obj = GetDialog(self).context
if next(context) then
	if context.Thumbnail then
		self.idImage:SetImage(context.Thumbnail)
	end
	if obj.installed_retrieved then
		local enabled = obj.enabled[mod_id]
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
			self.idWarning:SetText(warning or "")
			self.idWarning:SetVisible(corrupted)
			if not corrupted then
				if rawget(self, "idEnabledTick") then
					self.idEnabledTick:SetVisible(enabled)
					self.idEnabled:SetVisible(enabled)
					self.idDisabled:SetVisible(not enabled)
				else
					self.idEnabled:SetCheck(enabled)
					self.idEnabled:SetVisible(true)
					self.idEnabled.idEnabled:SetVisible(enabled)
					self.idEnabled.idDisabled:SetVisible(not enabled)
				end
			end
		end
		if rawget(self, "idInstall") then
			self.idInstall:SetVisible(not installed and not g_PopsDownloadingMods[mod_id])
			self.idRemove:SetVisible(installed)
		end
	end
	if self.selected and self:IsFocused() and obj.selected_mod_id ~= mod_id then
		self:SetSelected(true)
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
	local size = self:ResolveId("idFileSize")
	if size then
		local context = self.context
		size:SetVisible(context.FileSize)
		if context.FileSize then
			size:SetText(T(10487, "<FormatSize(FileSize, 2)>"))
		end
	end
elseif obj.counted then
	ModsUILoadModInfo((self.parent.GridY -1)*3 + self.parent.GridX)
end
end,
		'SelectionBackground', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
self.idBorder:SetVisible(rollover)
XListItem.OnSetRollover(self, rollover)
self.idGradient:SetVisible(rollover)
self.idDarkOverlay:SetVisible(not rollover)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
XListItem.SetSelected(self, selected)
if selected then
	local changed = ModsUISetSelectedMod(self.context.ModID)
	if changed and GetUIStyleGamepad() then
		local dlg = GetDialog(self)
		dlg:UpdateActionViews(dlg)
	end
	if not self:IsFocused() then
		self:SetFocus()
	end
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XListItem.Open(self, ...)
self.idDarkOverlay:SetVisible(true, true)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
if button == "L" and not GetUIStyleGamepad() then
	ModsUISetDialogMode(GetDialog(self), "details", self.context)
	return "break"
end
end,
		}),
		PlaceObj('XTemplateWindow', nil, {
			PlaceObj('XTemplateWindow', {
				'comment', "mod image",
				'__class', "XImage",
				'Id', "idImage",
				'Dock', "box",
				'Image', "UI/Common/Placeholder.tga",
				'ImageFit', "largest",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "gradient pc",
				'__condition', function (parent, context) return GetUIStyleGamepad() end,
				'__class', "XImage",
				'Id', "idGradient",
				'Dock', "box",
				'VAlign', "top",
				'Visible', false,
				'FoldWhenHidden', true,
				'FadeOutTime', 300,
				'Image', "UI/Mods/gradient_black.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "gradient console",
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'__class', "XImage",
				'Id', "idGradient",
				'Dock', "box",
				'VAlign', "bottom",
				'Visible', false,
				'FoldWhenHidden', true,
				'FadeOutTime', 300,
				'Image', "UI/Mods/gradient_black_rotated.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'Id', "idDarkOverlay",
				'Dock', "box",
				'FoldWhenHidden', true,
				'Background', RGBA(0, 0, 0, 190),
				'FadeInTime', 300,
				'FadeOutTime', 300,
			}),
			PlaceObj('XTemplateWindow', {
				'Id', "idListSpinner",
				'Dock', "box",
				'ScaleModifier', point(400, 400),
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
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(15, 18, 15, 0),
					'VAlign', "top",
					'MinHeight', 47,
					'LayoutMethod', "HList",
					'LayoutHSpacing', 5,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idWarning",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'HandleMouse', false,
						'TextStyle', "ModsUIItemStatusWarningPC",
						'Translate', true,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XTextButton",
						'Id', "idInstall",
						'Padding', box(-3, 2, 5, 0),
						'Dock', "right",
						'HAlign', "center",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
ModsUIInstallMod(self.context)
self:SetVisible(false)
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'Icon', "UI/Mods/install_mod.tga",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XCheckButton",
						'Id', "idEnabled",
						'Padding', box(5, 2, -5, 0),
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'OnPress', function (self, gamepad)
ModsUIToggleEnabled(self.context, self)
end,
						'Rows', 2,
						'SqueezeY', true,
						'Icon', "UI/Mods/enable_disable.tga",
						'IconScale', point(1000, 1000),
						'IconColor', RGBA(255, 255, 255, 255),
						'Check', true,
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
							'Margins', box(5, 0, 0, 0),
							'HAlign', "center",
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemStatusEnabledPC",
							'Text', "Enabled",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idDisabled",
							'Margins', box(5, 0, 0, 0),
							'HAlign', "center",
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemStatusEnabledPC",
							'Text', "Disabled",
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XTextButton",
						'Id', "idRemove",
						'Padding', box(-3, 2, 5, 0),
						'Dock', "right",
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
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 0, 0, 20),
					'VAlign', "bottom",
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idModTitle",
						'VAlign', "bottom",
						'HandleMouse', false,
						'TextStyle', "ModsUIItemTitlePC",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idAuthor",
						'Margins', box(0, 0, 0, 15),
						'VAlign', "bottom",
						'TextStyle', "ModsUIItemSubtitlePC",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "current rating",
						'VAlign', "bottom",
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
					}),
				}),
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return GetUIStyleGamepad() end,
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(30, 30, 0, 0),
					'VAlign', "top",
					'LayoutMethod', "VList",
					'LayoutVSpacing', 10,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idModTitle",
						'VAlign', "bottom",
						'HandleMouse', false,
						'TextStyle', "ModsUIItemTitleConsole",
					}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "HList",
						'LayoutHSpacing', 10,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idAuthor",
							'TextStyle', "ModsUIItemSubtitleConsole",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "middle dot",
							'__condition', function (parent, context) return context.FileSize end,
							'__class', "XLabel",
							'Margins', box(20, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "ModsUIDotConsole",
							'Text', "·",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idFileSize",
							'TextStyle', "ModsUIItemSubtitleConsole",
							'Translate', true,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "current rating",
						'VAlign', "bottom",
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
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 0, 0, 15),
					'VAlign', "bottom",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idEnabledTick",
						'Margins', box(10, 0, 0, 10),
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'Image', "UI/Mods/tick.tga",
						'ImageScale', point(450, 450),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idEnabled",
						'Margins', box(10, 0, 0, 10),
						'HAlign', "center",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusEnabledConsole",
						'Translate', true,
						'Text', T(259958195040, --[[XTemplate ModsUIBrowseListItem Text]] "ENABLED"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idDisabled",
						'Margins', box(10, 0, 0, 10),
						'HAlign', "center",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'TextStyle', "ModsUIItemStatusdisabledConsole",
						'Translate', true,
						'Text', T(815663365744, --[[XTemplate ModsUIBrowseListItem Text]] "DISABLED"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idWarning",
						'Margins', box(10, 0, 0, 10),
						'HAlign', "center",
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'HandleMouse', false,
						'TextStyle', "ModsUIItemStatusWarningBrawseConsole",
						'Translate', true,
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idBorder",
			'Margins', box(-3, -3, -3, -3),
			'BorderWidth', 3,
			'Visible', false,
			'BorderColor', RGBA(125, 125, 125, 255),
		}),
		}),
})

