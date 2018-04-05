-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idFrame end,
	__is_kind_of = "XDialog",
	group = "Default",
	id = "OverlayDlg",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Dock', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idFrame",
			'IdNode', false,
			'Padding', box(80, 80, 80, 80),
			'HandleMouse', true,
			'Image', "UI/Common/menu_pad_1.tga",
			'FrameBox', box(86, 0, 0, 0),
			'TileFrame', true,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
XFrame.Open(self, ...)
local pad = self:GetPadding()
local margin = GetSafeMargins(pad)
self:SetPadding(box(pad:minx(), margin:miny(), margin:maxx(), margin:maxy()))
end,
			}),
			PlaceObj('XTemplateWindow', {
				'Dock', "bottom",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Id', "idToolbarFrame",
					'Margins', box(-80, -50, -155, -10),
					'VAlign', "bottom",
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 165, 0),
					'SqueezeY', false,
					'FlipY', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XToolBar",
					'Id', "idToolbar",
					'HAlign', "right",
					'VAlign', "bottom",
					'LayoutHSpacing', 60,
					'Background', RGBA(0, 0, 0, 0),
					'Toolbar', "ActionBar",
					'Show', "text",
					'ButtonTemplate', "InGameMenuEntry",
				}),
				}),
			}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideInGameInterfaceLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XPauseLayer",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XCameraLockLayer",
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'category', "Visual",
		'id', "Transparent",
		'default', true,
		'Set', function (self, value)
self.idFrame:SetImage(value and "UI/Common/menu_pad_1.tga" or "UI/Common/menu_pad_1a.tga")
end,
	}),
	PlaceObj('XTemplateProperty', {
		'category', "Visual",
		'id', "Vertical",
		'Set', function (self, value)
self.idToolbar:SetLayoutMethod(value and "VList" or "HList")
end,
	}),
})

