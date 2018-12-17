-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XListItem",
	group = "Mods",
	id = "ModsUIInstalledMod",
	PlaceObj('XTemplateWindow', {
		'__class', "XListItem",
		'BorderWidth', 0,
		'Padding', box(3, 3, 3, 3),
		'RolloverZoom', 1015,
		'RolloverDrawOnTop', true,
		'RolloverOnFocus', true,
		'HandleMouse', true,
		'OnContextUpdate', function (self, context, ...)
XListItem.OnContextUpdate(self, context, ...)
self.idModTitle:SetText(context.DisplayName or "")
self.idAuthor:SetText(context.Author or "")
self.idModVersion:SetText(T{10484, "v.<version>", version = Untranslated(context.ModVersion)})
local obj = GetDialog(self).context
local mod_id = context.ModID
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
local enabled = obj.enabled[mod_id]
if not corrupted then
	if not GetUIStyleGamepad() and rawget(self.idEnabled, "idEnabled") then
		self.idEnabled:SetVisible(true)
		self.idEnabled:SetCheck(enabled)
		self.idEnabled.idEnabled:SetVisible(enabled)
		self.idEnabled.idDisabled:SetVisible(not enabled)
	elseif rawget(self, "idEnabledTick") then
		self.idEnabledTick:SetVisible(enabled)
		self.idEnabled:SetVisible(enabled)
		self.idDisabled:SetVisible(not enabled)
	end
end
if context.Thumbnail then
	self.idImage:SetImage(context.Thumbnail)
end
local size = self:ResolveId("idFileSize")
if size then
	local context = self.context
	size:SetVisible(context.FileSize)
	if context.FileSize then
		size:SetText(T(10487, "<FormatSize(FileSize, 2)>"))
	end
end
local current_rating_win = self:ResolveId("idCurrentRating")
if context.Rating and current_rating_win then
	for i = 1, context.Rating do
		current_rating_win[i]:SetImage("UI/Mods/rate-orange.tga")
	end
	current_rating_win:SetVisible(true)
end
end,
		'SelectionBackground', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
self.idBorder:SetVisible(rollover)
XContextWindow.OnSetRollover(self, rollover)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
XListItem.SetSelected(self, selected)
self:SetFocus(selected)
if selected then
	local changed = ModsUISetSelectedMod(self.context.ModID)
	if changed then
		local dlg = GetDialog(self)
		dlg:UpdateActionViews(dlg)
	end
end
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
		PlaceObj('XTemplateWindow', {
			'Background', RGBA(34, 34, 34, 255),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idImage",
				'Dock', "left",
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 200,
				'MaxWidth', 200,
				'Image', "UI/Common/Placeholder.tga",
				'ImageFit', "largest",
			}),
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return GetUIStyleGamepad() end,
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 0, 0, 0),
					'VAlign', "center",
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "title",
						'__class', "XText",
						'Id', "idModTitle",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ModsUIItemTitleConsole",
					}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "HList",
						'LayoutHSpacing', 8,
					}, {
						PlaceObj('XTemplateWindow', {
							'Id', "idCurrentRating",
							'Margins', box(0, 0, 15, 0),
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
									'ImageScale', point(150, 150),
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "author",
							'__class', "XLabel",
							'Id', "idAuthor",
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitleConsole",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "middle dot",
							'__class', "XLabel",
							'Margins', box(20, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "ModsUIDotConsole",
							'Text', "·",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "version",
							'__class', "XLabel",
							'Id', "idModVersion",
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitleConsole",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "middle dot",
							'__condition', function (parent, context) return context.FileSize end,
							'__class', "XLabel",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "ModsUIDotConsole",
							'Text', "·",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "file size",
							'__class', "XLabel",
							'Id', "idFileSize",
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitleConsole",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idWarning",
							'Margins', box(20, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextStyle', "ModsUIItemStatusWarningConsole",
							'Translate', true,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 0, 20, 0),
					'Dock', "right",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 8,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idEnabledTick",
						'Visible', false,
						'FoldWhenHidden', true,
						'Image', "UI/Mods/tick.tga",
						'ImageScale', point(310, 310),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idEnabled",
						'Margins', box(0, 0, 5, 0),
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'HandleMouse', false,
						'TextStyle', "ModsUIItemStatusEnabledConsole",
						'Translate', true,
						'Text', T(259958195040, --[[XTemplate ModsUIInstalledMod Text]] "ENABLED"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idDisabled",
						'Margins', box(0, 0, 5, 0),
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'Visible', false,
						'FoldWhenHidden', true,
						'HandleMouse', false,
						'TextStyle', "ModsUIItemStatusdisabledConsole",
						'Translate', true,
						'Text', T(815663365744, --[[XTemplate ModsUIInstalledMod Text]] "DISABLED"),
					}),
					}),
				}),
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 0, 0, 0),
					'VAlign', "center",
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "title",
						'__class', "XText",
						'Id', "idModTitle",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ModsUIItemTitlePC",
					}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "HList",
						'LayoutHSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'Id', "idCurrentRating",
							'Margins', box(0, 0, 15, 0),
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
									'ImageScale', point(150, 150),
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "author",
							'__class', "XLabel",
							'Id', "idAuthor",
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitlePC",
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "version",
							'__class', "XLabel",
							'Id', "idModVersion",
							'Margins', box(10, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitlePC",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "file size",
							'__class', "XLabel",
							'Id', "idFileSize",
							'Padding', box(0, 0, 0, 0),
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemSubtitlePC",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idWarning",
							'Margins', box(20, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'Visible', false,
							'FoldWhenHidden', true,
							'TextStyle', "ModsUIItemStatusInstalledWarningPC",
							'Translate', true,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 0, 20, 0),
					'Dock', "right",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 20,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XCheckButton",
						'Id', "idEnabled",
						'Padding', box(-5, 2, 10, 2),
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
							'TextStyle', "ModsUIItemStatusInstalledEnabledPC",
							'Translate', true,
							'Text', T(460479110814, --[[XTemplate ModsUIInstalledMod Text]] "Enabled"),
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
							'TextStyle', "ModsUIItemStatusInstalledEnabledPC",
							'Translate', true,
							'Text', T(847439380056, --[[XTemplate ModsUIInstalledMod Text]] "Disabled"),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not context.Local end,
						'__class', "XTextButton",
						'Id', "idRemove",
						'Padding', box(-5, 2, 10, 2),
						'HAlign', "center",
						'VAlign', "center",
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

