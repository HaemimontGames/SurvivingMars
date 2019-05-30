-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColonyControlCenter",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return context or {} end,
		'__class', "XDialog",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
				g_CommandCenterSavedContext = self:GetContext()
				g_CommandCenterSavedMode = self:GetMode()		
				local mode_dlg = GetInGameInterfaceModeDlg()
				mode_dlg:SetParent(GetInGameInterface())
				g_CommandCenterOpen = false
				XDialog.Close(self, ...)
			end,
		}),
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return GameState.gameplay end,
			'layer', "ScreenBlur",
			'layer_id', "idBlur",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInfopanelLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
			'HandleMouse', true,
		}, {
			PlaceObj('XTemplateMode', nil, {
				PlaceObj('XTemplateTemplate', {
					'__template', "CommandCenterCategories",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "ColonyStats",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ColonyStats",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Buildings",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "BuildingsOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Domes",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "DomesOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Colonists",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ColonistsOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Transportation",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "TransportationOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "PowerGrids",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PowerGridsOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "LifeSupportGrids",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "LifeSupportGridsOverview",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "ColorScheme",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ColorSchemeOverview",
				}),
				}),
			}),
		}),
})

