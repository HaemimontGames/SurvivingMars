-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "PhotoMode",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PhotoObjectCreateAndLoad() end,
		'__class', "XDialog",
		'InitialMode', "properties",
		'InternalModes', "properties, items",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
self.context:Pause()
if GetTimeFactor() == 0 then
	local dlg = GetMarsPauseDlg()
	if dlg then
		dlg:SetParent(GetInGameInterface())
	end
end
XDialog.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
ClosePhotoMode()
PhotoModeEnd()
XDialog.Close(self, ...)
if GetTimeFactor() == 0 then
	local dlg = GetMarsPauseDlg()
	if dlg then
		dlg:SetParent(terminal.desktop)
	end
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "BlinkFilePath(self, path)",
			'func', function (self, path)
self:DeleteThread("path")
self:CreateThread("path", function(path)
	self.idPath:SetText(path)
	self.idPath:SetVisible(true)
	Sleep(3000)
	self.idPath:SetVisible(false)
end, path)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "ToggleUI",
			'func', function (self, ...)
local value = not self.idFrame:GetVisible()
self.idFrame:SetVisible(value)
if Platform.console then
	self.idActionBar:SetVisible(value)
	self.idFreeCameraWarning:SetVisible(value)
end
if value then
	self.idList:SetSelection(self.idList.focused_item or 1)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if not self.idActionBar:GetVisible() and (shortcut == "Start" or shortcut == "ButtonB") then
	self:ToggleUI()
	return "break"
elseif shortcut == "Alt" and cameraFly.IsActive() then
	SetMouseDeltaMode(false)
	return "break"
elseif shortcut == "-Alt" and cameraFly.IsActive() then
	SetMouseDeltaMode(true)
	return "break"
end
return XDialog.OnShortcut(self, shortcut, source)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'HAlign', "right",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "XHideInGameInterfaceLayer",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idFrame",
				'IdNode', false,
				'Padding', box(80, 80, 80, 80),
				'HAlign', "right",
				'MinWidth', 550,
				'LayoutMethod', "VList",
				'HandleMouse', true,
				'Image', "UI/Common/menu_pad_1.tga",
				'FrameBox', box(86, 0, 0, 0),
				'TileFrame', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XFrame.Open(self, ...)
local pad = self:GetPadding()
local margin = GetSafeMargins(pad)
self:SetPadding(box(pad:minx(), margin:miny(), margin:maxx(), margin:maxy()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGModTitle",
					'TextColor', RGBA(119, 198, 255, 255),
					'Translate', true,
					'Text', T{919878375490, --[[XTemplate PhotoMode Text]] "PHOTO MODE"},
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-80, 6, -155, -100),
					'VAlign', "top",
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 165, 0),
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'Margins', box(0, 30, 0, 0),
					'BorderWidth', 0,
					'LayoutVSpacing', 16,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'LeftThumbScroll', false,
					'OnContextUpdate', function (self, context, ...)
XContentTemplateList.OnContextUpdate(self, context, ...)
if self.focused_item then
	self.focused_item =  Min(self.focused_item, #self)
	self:DeleteThread("select")
	self:CreateThread("select", function()
		self:SetSelection(self.focused_item)
	end)
end
end,
					'RespawnOnContext', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "properties",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "props",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return not item.filter or item.filter() end,
							'item_in_context', "prop_meta",
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropEntry",
								'RolloverTemplate', "Rollover",
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
						PlaceObj('XTemplateAction', {
							'ActionId', "close",
							'ActionName', T{4523, --[[XTemplate PhotoMode ActionName]] "CLOSE"},
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "close",
						}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "items",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return GetDialogModeParam(parent).items() end,
							'condition', function (parent, context, item, i) return not item.not_selectable end,
							'__context', function (parent, context, item, i, n) return item end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "MenuEntrySmall",
								'RolloverTemplate', "Rollover",
								'Padding', box(0, 0, 0, 0),
								'HAlign', "right",
								'OnPress', function (self, gamepad)
local prop_meta = GetDialogModeParam(self)
local obj = GetDialogContext(self)
SetProperty(obj, prop_meta.id, self.context.value)
SetBackDialogMode(self)
end,
								'TextColor', RGBA(221, 215, 170, 255),
								'Text', T{730563403228, --[[XTemplate PhotoMode Text]] "<text>"},
							}),
							}),
						PlaceObj('XTemplateAction', {
							'ActionId', "back",
							'ActionName', T{4254, --[[XTemplate PhotoMode ActionName]] "BACK"},
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "back",
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XPageScroll",
					'Id', "idScroll",
					'Margins', box(0, 30, 0, 80),
					'Dock', "bottom",
					'VAlign', "bottom",
					'MinHeight', 42,
					'Visible', false,
					'FoldWhenHidden', false,
					'Target', "idList",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idActionBar",
				'Margins', box(170, 0, 80, 80),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-170, 0, -155, -10),
					'VAlign', "bottom",
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 165, 0),
					'SqueezeY', false,
					'FlipY', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XToolBar",
					'Id', "idToolbar",
					'HAlign', "right",
					'VAlign', "bottom",
					'LayoutHSpacing', 60,
					'Background', RGBA(0, 0, 0, 0),
					'Toolbar', "ActionBar",
					'Show', "text",
					'ButtonTemplate', "InGameMenuEntry",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'__class', "XText",
				'Id', "idFreeCameraWarning",
				'Margins', box(0, 0, 80, 20),
				'HAlign', "right",
				'VAlign', "bottom",
				'Visible', false,
				'HandleMouse', false,
				'TextFont', "PhotoModeFilePath",
				'TextColor', RGBA(221, 215, 170, 255),
				'ShadowType', "outline",
				'ShadowSize', 1,
				'ShadowColor', RGBA(0, 0, 0, 255),
				'Translate', true,
				'Text', T{522319645304, --[[XTemplate PhotoMode Text]] "<em><ShortcutName('actionPanUp')>, <ShortcutName('actionPanDown')>, <ShortcutName('actionPanLeft')>, <ShortcutName('actionPanRight')></em> - move, hold <em>Ctrl</em> - move faster, hold <em>Alt</em> - release mouse cursor."},
			}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return GetUIStyleGamepad() end,
				'__class', "XText",
				'Id', "idFreeCameraWarning",
				'Margins', box(0, 0, 80, 20),
				'HAlign', "right",
				'VAlign', "bottom",
				'Visible', false,
				'HandleMouse', false,
				'TextFont', "PhotoModeFilePath",
				'TextColor', RGBA(221, 215, 170, 255),
				'ShadowType', "outline",
				'ShadowSize', 1,
				'ShadowColor', RGBA(0, 0, 0, 255),
				'Translate', true,
				'Text', T{650277449050, --[[XTemplate PhotoMode Text]] "<LS> - move, <RS> - rotate."},
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idTakeScreenshot",
				'ActionName', T{954580699514, --[[XTemplate PhotoMode ActionName]] "TAKE SCREENSHOT"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "LeftTrigger",
				'OnAction', function (self, host, source, toggled)
PhotoModeTake()
end,
				'__condition', function (parent, context) return not Platform.console end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idToggleUI",
				'ActionName', T{357021532351, --[[XTemplate PhotoMode ActionName]] "TOGGLE UI"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "ButtonX",
				'OnAction', function (self, host, source, toggled)
host:ToggleUI()
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idPause",
				'ActionName', T{494688646361, --[[XTemplate PhotoMode ActionName]] "PAUSE"},
				'ActionToolbar', "ActionBar",
				'ActionShortcut', "Space",
				'ActionGamepad', "ButtonY",
				'ActionState', function (self, host)
return GetTimeFactor() == 0 and "hidden"
end,
				'OnAction', function (self, host, source, toggled)
host.context:Pause()
host.idList:RespawnContent()
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idResume",
				'ActionName', T{326024522451, --[[XTemplate PhotoMode ActionName]] "RESUME"},
				'ActionToolbar', "ActionBar",
				'ActionShortcut', "Space",
				'ActionGamepad', "ButtonY",
				'ActionState', function (self, host)
return GetTimeFactor() ~= 0 and "hidden"
end,
				'OnAction', function (self, host, source, toggled)
host.context:Resume()
host.idList:RespawnContent()
end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idPath",
			'Margins', box(0, 0, 0, 200),
			'HAlign', "center",
			'VAlign', "bottom",
			'Visible', false,
			'TextFont', "PhotoModeFilePath",
			'TextColor', RGBA(221, 215, 170, 255),
			'RolloverTextColor', RGBA(221, 215, 170, 255),
			'ShadowType', "outline",
			'ShadowColor', RGBA(0, 0, 0, 255),
		}),
		}),
})

