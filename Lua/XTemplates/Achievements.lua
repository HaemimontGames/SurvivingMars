-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "Achievements",
	PlaceObj('XTemplateWindow', {
		'__condition', function (parent, context) return not GameState.gameplay end,
		'__class', "XDialog",
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'__condition', function (parent, context) return not GameState.gameplay end,
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "margins",
				'Margins', box(0, 68, 0, 25),
				'HAlign', "left",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
						XWindow.Open(self, ...)
						self:SetMargins(GetSafeMargins(self:GetMargins()))
					end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(115, 0, 0, 0),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "AchievementsContent",
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return GameState.gameplay end,
		'__template', "NewOverlayDlg",
		'Dock', false,
		'HAlign', "left",
		'HandleMouse', true,
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
		PlaceObj('XTemplateTemplate', {
			'__template', "AchievementsContent",
		}),
		}),
})

