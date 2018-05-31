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
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
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
			}),
		}),
})

