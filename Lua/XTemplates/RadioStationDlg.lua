-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "RadioStationDlg",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return OptionsCreateAndLoad() end,
		'__template', "OverlayDlg",
		'MaxWidth', 800,
		'InitialMode', "radio",
		'InternalModes', "radio",
	}, {
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
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Dock', "top",
			'HAlign', "right",
			'TextStyle', "OverlayTitle",
			'Translate', true,
			'Text', T{702142953137, --[[XTemplate RadioStationDlg Text]] "RADIO STATION"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-80, 6, -160, -100),
			'Dock', "top",
			'Transparency', 100,
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 170, 0),
			'SqueezeY', false,
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
			'__context', function (parent, context) return Music end,
			'__class', "XContentTemplateList",
			'Id', "idList",
			'BorderWidth', 0,
			'LayoutVSpacing', 6,
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
					'HAlign', "right",
					'OnPress', function (self, gamepad)
self.parent.parent.parent.context:SetRadioStation(self.context.id)
end,
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
			'__template', "Scrollbar",
			'Id', "idScroll",
			'Target', "idList",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "MenuEntrySmall",
			'Id', "idVolume",
			'Dock', "bottom",
			'ChildrenHandleMouse', true,
			'Text', T{717950591874, --[[XTemplate RadioStationDlg Text]] "Volume"},
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSlider",
				'Id', "idSlider",
				'Margins', box(20, 16, 0, 16),
				'Dock', "right",
				'MinWidth', 200,
				'BindTo', "Music",
				'StepSize', 50,
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
})

