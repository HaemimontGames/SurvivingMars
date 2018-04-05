-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "PreGame",
	id = "Credits",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "Version",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
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
					'__template', "ActionBar",
					'MinWidth', 300,
				}),
				PlaceObj('XTemplateWindow', {
					'HAlign', "right",
					'MinWidth', 500,
					'MinHeight', 500,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContentTemplate",
					}, {
						PlaceObj('XTemplateWindow', {
							'__parent', function (parent, context) return GetDialog(parent) end,
							'__class', "XCreditsWindow",
							'Id', "idCreditsWindow",
							'ZOrder', 0,
							'MouseScroll', false,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "close",
							'ActionName', T{328491723397, --[[XTemplate Credits ActionName]] "CLOSE"},
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnActionEffect', "close",
							'OnAction', function (self, host, source, toggled)
if host then 
SetBackDialogMode(host.context.dlg)
host:Close()
end
end,
						}),
						}),
					}),
				}),
			}),
		}),
})

