-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idFrame end,
	__is_kind_of = "XDialog",
	group = "Default",
	id = "NewOverlayDlg",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Id', "idOverlayDlg",
		'Dock', "left",
	}, {
		PlaceObj('XTemplateWindow', {
			'Id', "idFrame",
			'Margins', box(0, 68, 0, 25),
			'HandleMouse', true,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					XFrame.Open(self, ...)
					local pad = self:GetPadding()
					local margin = GetSafeMargins(pad)
					self:SetPadding(margin)
				end,
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "ActionBarNew",
				'Margins', box(115, 0, 0, 0),
			}),
			}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInGameInterfaceLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return not g_CommandCenterOpen end,
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XCameraLockLayer",
		}),
		}),
})

