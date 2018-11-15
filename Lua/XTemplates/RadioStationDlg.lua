-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "RadioStationDlg",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return OptionsCreateAndLoad() end,
		'__template', "NewOverlayDlg",
		'Dock', false,
		'HAlign', "left",
		'MaxWidth', 800,
		'InitialMode', "radio",
		'InternalModes', "radio",
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "ScreenBlur",
			'layer_id', "idBlur",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContextWindow",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnDelete",
				'func', function (self, ...)
self.context:SaveToTables()
SaveAccountStorage(5000)
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "DialogTitleNew",
			'Margins', box(115, 0, 0, 0),
			'Title', T{702142953137, --[[XTemplate RadioStationDlg Title]] "RADIO STATION"},
			'SmallImage', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate RadioStationDlg ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(60, 40, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return Music end,
				'__class', "XContentTemplateList",
				'Id', "idList",
				'Margins', box(39, 0, 0, 0),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'LayoutVSpacing', 12,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
				'MouseScroll', true,
				'OnContextUpdate', function (self, context, ...)
local focus = self.focused_item
XContentTemplate.OnContextUpdate(self, context, ...)
if focus then
	self:SetSelection(focus)
end
end,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "OnShortcut(self, shortcut, source)",
					'func', function (self, shortcut, source)
local prev_item = self.focused_item
local ret = XList.OnShortcut(self, shortcut, source)
if shortcut == "Down" and prev_item == #self then
	local dlg = GetDialog(self)
	dlg.idVolume:SetFocus()
	return "break"
end
return ret
end,
				}),
				PlaceObj('XTemplateForEach', {
					'comment', "radio station",
					'array', function (parent, context) return GetRadioStations() end,
					'__context', function (parent, context, item, i, n) return item end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "MenuEntrySmall",
						'OnPress', function (self, gamepad)
GetDialog(self).context:SetRadioStation(self.context.id)
end,
						'TextStyle', "ListItem3",
						'Text', T{460245435559, --[[XTemplate RadioStationDlg Text]] "<display_name>"},
					}, {
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return context.id == ActiveRadioStation end,
							'__class', "XImage",
							'Id', "idActive",
							'ZOrder', 0,
							'ScaleModifier', point(750, 750),
							'Image', "UI/Common/submenu.tga",
							'Columns', 2,
							'Column', 2,
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
		PlaceObj('XTemplateWindow', {
			'Margins', box(115, 0, 0, 30),
			'Dock', "bottom",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(-350, 0, 0, 0),
				'Dock', "box",
				'MinWidth', 794,
				'Image', "UI/CommonNew/pg_header_big1.tga",
				'FrameBox', box(50, 0, 500, 0),
				'TileFrame', true,
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XTextButton",
				'Id', "idVolume",
				'VAlign', "center",
				'LayoutMethod', "VList",
				'Background', RGBA(0, 0, 0, 0),
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'ChildrenHandleMouse', true,
				'FXMouseIn', "MenuItemHover",
				'FXPress', "MenuItemClick",
				'FXPressDisabled', "UIDisabledButtonPressed",
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'RolloverBackground', RGBA(0, 0, 0, 0),
				'PressedBackground', RGBA(0, 0, 0, 0),
				'Translate', true,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idText",
					'Padding', box(0, 0, 0, 0),
					'TextStyle', "ListItem5",
					'Translate', true,
					'Text', T{717950591874, --[[XTemplate RadioStationDlg Text]] "Volume"},
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "CalcTextColor",
						'func', function (self, ...)
local list = GetDialog(self):ResolveId("idList")
return self.enabled and 
			((self.parent.rollover or (list and list.focused_item == ResolveValue(self.context, "number")))
				and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSlider",
					'Id', "idSlider",
					'HAlign', "left",
					'MinWidth', 300,
					'MaxWidth', 300,
					'BindTo', "Music",
					'StepSize', 50,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "OnSetFocus",
					'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "SetSelected(self, selected)",
					'func', function (self, selected)
self:SetFocus(selected)
end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "OnShortcut(self, shortcut, source)",
					'func', function (self, shortcut, source)
if shortcut == "DPadUp" or shortcut == "LeftThumbUp" then
	local obj = GetDialog(self)
	obj.idList:SetFocus()
	obj.idList:SetSelection(#obj.idList)
elseif shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" then
	local slider = self.idSlider
	slider:ScrollTo(slider.Scroll - slider.StepSize)
elseif shortcut == "DPadRight" or shortcut == "LeftThumbRight" then
	local slider = self.idSlider
	slider:ScrollTo(slider.Scroll + slider.StepSize)
end
end,
				}),
				}),
			}),
		}),
})

