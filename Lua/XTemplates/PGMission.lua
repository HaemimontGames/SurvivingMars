-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMission",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PGMissionObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Id', "PGMission",
		'InitialMode', "sponsor",
		'InternalModes', "sponsor,payload,landing",
	}, {
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
if self:IsThreadRunning("FadeThread") then return end
self:CreateThread("FadeThread", function(self, ...)
	local fade_window = self.desktop.idFade
	if self.Mode ~= "" then
		fade_window:SetVisible(true)
		Sleep(450)
	end
	XDialog.SetMode(self, ...)
	ObjModified(g_TitleObj)
	fade_window:SetVisible(false)
	Sleep(450)
end, self, ...)
end,
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "TitleLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'RespawnOnContext', false,
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "sponsor",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMissionSponsor",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "payload",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMissionPayload",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "landing",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMissionLandingSpot",
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateWindow', {
		'__parent', function (parent, context) return terminal.desktop end,
		'Id', "idFade",
		'ZOrder', 100000000,
		'Dock', "box",
		'Background', RGBA(0, 0, 0, 255),
		'FadeInTime', 450,
		'FadeOutTime', 450,
	}),
})

