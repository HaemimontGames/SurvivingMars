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
				'Margins', box(0, 68, 0, 25),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(115, 0, 0, 0),
					'SmallImage', true,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(115, 0, 0, 0),
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
		'__template', "NewOverlayDlg",
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
		PlaceObj('XTemplateTemplate', {
			'__template', "DialogTitleNew",
			'Margins', box(115, 0, 0, 0),
			'SmallImage', true,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "OptionsContentWindow",
		}),
		}),
})

