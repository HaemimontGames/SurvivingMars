-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "Resupply",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return RocketPayloadObjectCreateAndLoad() end,
		'__class', "XDialog",
		'HandleMouse', true,
		'InitialMode', "categories",
		'InternalModes', "categories,cargo,passengers",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
ResupplyDialogOpen(self, ...)
XDialog.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
ResupplyDialogClose(self, ...)
XDialog.Close(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
local window = self.desktop.idFade
if window.window_state ~= "destroying" then
	window:delete()
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetMode",
			'func', function (self, ...)
if self.Mode == "" then
	if self:IsThreadRunning("FadeThread") then return end
	self:CreateThread("FadeThread", function(self, ...)
		local fade_window = self.desktop.idFade
		XDialog.SetMode(self, ...)
		ObjModified(g_TitleObj)
		fade_window:SetVisible(true, true)
		fade_window:SetVisible(false)
		Sleep(450)
	end, self, ...)
else
	XDialog.SetMode(self, ...)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnXButtonDown(self, button, controller_id)",
			'func', function (self, button, controller_id)
if button == "Back" or button == "TouchPadClick" then
	if DismissCurrentOnScreenHint() then
		return "break"
	end
end
	
return XDialog.OnXButtonDown(self, button, controller_id)
end,
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "TitleLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "EarthPlanet",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInGameInterfaceLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideMapOverviewCurtainsLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XCameraLockLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idTemplate",
			'RespawnOnContext', false,
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "categories",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ResupplyCategories",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "cargo",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMissionPayload",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "passengers",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ResupplyPassengers",
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateWindow', {
		'__parent', function (parent, context) return terminal.desktop end,
		'Id', "idFade",
		'ZOrder', 100000000,
		'Dock', "box",
		'Visible', false,
		'Background', RGBA(0, 0, 0, 255),
		'FadeInTime', 450,
		'FadeOutTime', 450,
	}),
})

