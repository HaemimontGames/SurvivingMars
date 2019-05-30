-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idList end,
	__is_kind_of = "XWindow",
	group = "Mods",
	id = "ModsUIChecksList",
	PlaceObj('XTemplateWindow', {
		'IdNode', true,
		'Margins', box(0, 20, 0, 20),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'BorderWidth', 0,
			'Padding', box(0, 0, 0, 0),
			'UniformRowHeight', true,
			'Background', RGBA(255, 255, 255, 0),
			'FocusedBackground', RGBA(255, 255, 255, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					self:SetFocus()
					XList.Open(self, ...)
				end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "Scrollbar",
			'Id', "idScroll",
			'FoldWhenHidden', true,
			'Target', "idList",
		}),
		}),
})

