-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "IGMainMenu",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "SetMode(self, mode, mode_param)",
			'func', function (self, mode, mode_param)
if self.Mode == mode or mode ~= "" then
	XDialog.SetMode(self, mode, mode_param)
	return
end
CreateRealTimeThread(function(self, mode, mode_param)
	self.context.savegame_count = WaitCountSaveGames()
	XDialog.SetMode(self, mode, mode_param)
end, self, mode, mode_param)
end,
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "ScreenBlur",
			'layer_id', "idBlur",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
		}, {
			PlaceObj('XTemplateMode', nil, {
				PlaceObj('XTemplateLayer', {
					'__condition', function (parent, context) return GetUIStyleGamepad() end,
					'layer', "GamepadControlsOverview",
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "Open",
						'func', function (self, ...)
XOpenLayer.Open(self, ...)
self.dialog.idContent:SetMargins(box(175, 0, 0, 0))
end,
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "XIGMenu",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Options",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "OptionsDlg",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Save",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "SaveLoadDlg",
					'InitialMode', "save",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Load",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "SaveLoadDlg",
					'InitialMode', "load",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Encyclopedia",
			}, {
				PlaceObj('XTemplateLayer', {
					'layer', "XHideInGameInterfaceLayer",
				}),
				PlaceObj('XTemplateLayer', {
					'layer', "XPauseLayer",
				}),
				PlaceObj('XTemplateLayer', {
					'layer', "XCameraLockLayer",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "Encyclopedia",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Achievements",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "Achievements",
				}),
				}),
			}),
		}),
})

