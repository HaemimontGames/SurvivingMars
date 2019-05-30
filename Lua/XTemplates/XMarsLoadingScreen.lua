-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "XMarsLoadingScreen",
	PlaceObj('XTemplateWindow', {
		'__class', "MarsLoadingScreen",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idImage",
				'Image', "UI/SplashScreen.tga",
				'ImageFit', "stretch",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Margins', box(0, 0, 130, 90),
				'HAlign', "right",
				'VAlign', "bottom",
				'Image', "UI/loading_anim.tga",
				'Columns', 30,
				'Animate', true,
				'FPS', 12,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
						XImage.Open(self, ...)
						self:SetMargins(GetSafeMargins(self:GetMargins()))
					end,
				}),
				}),
			}),
		}),
})

