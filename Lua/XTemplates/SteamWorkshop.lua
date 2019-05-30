-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLayer",
	group = "Layers",
	id = "SteamWorkshop",
	PlaceObj('XTemplateWindow', {
		'__class', "XLayer",
		'Margins', box(0, 40, 0, 0),
		'Padding', box(0, 0, -465, 0),
		'HAlign', "right",
		'VAlign', "bottom",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				XLayer.Open(self, ...)
				self:SetMargins(GetSafeMargins(self:GetMargins()))
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Image', "UI/Common/bm_pad_watermark.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Image', "UI/Common/bm_pad.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Margins', box(0, -40, 240, 0),
			'HandleMouse', true,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'Image', "UI/Common/mod_steam_workshop.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnMouseButtonDown(self, pos, button)",
				'func', function (self, pos, button)
					if button == "L" then
						OpenUrl("http://steamcommunity.com/app/464920/workshop/")
					end
				end,
			}),
			}),
		}),
})

