-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "PreGame",
	id = "OptionsDlg",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) OptionsObj = OptionsObj or OptionsCreateAndLoad() return OptionsObj end,
		'__condition', function (parent, context) return not GameState.gameplay end,
		'__class', "XDialog",
		'HandleMouse', true,
		'InitialMode', "options",
		'InternalModes', "options,properties,items,controller, credits",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
OptionsObj = false
OptionsObjOriginal = false
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDialogModeChange",
			'func', function (self, ...)
local mode = ...
self.idTitle:SetVisible(mode ~= "controller" and mode ~= "credits")
self.idScroll:SetVisible(mode ~= "controller" and mode ~= "credits")
self.idActionBar:SetVisible(mode ~= "credits")
end,
		}),
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
				'Margins', box(0, 80, 100, 80),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitle",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBar",
					'MinWidth', 300,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "OptionsContentWindow",
				}),
				}),
			}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) OptionsObj = OptionsObj or OptionsCreateAndLoad() return OptionsObj end,
		'__condition', function (parent, context) return GameState.gameplay end,
		'__template', "OverlayDlg",
		'HandleMouse', true,
		'InitialMode', "options",
		'InternalModes', "options,properties,items",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
OptionsObj = false
OptionsObjOriginal = false
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'parent', function (parent, context) return GetDialog(parent) end,
			'func', function (self, ...)
XDialog.Open(self, ...)
local pad = self.idFrame:GetPadding()
self.idFrame:SetPadding(box(pad:minx() + 90, pad:miny(), pad:maxx(), pad:maxy()))
local margins = self.idToolbarFrame:GetMargins()
self.idToolbarFrame:SetMargins(box(margins:minx()-90, margins:miny(), margins:maxx(), margins:maxy()))
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idTitle",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModTitle",
			'TextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-170, 6, -155, -100),
			'Dock', "top",
			'VAlign', "top",
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 165, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "OptionsContentWindow",
		}),
		}),
})

