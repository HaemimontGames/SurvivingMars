-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "DialogTitle",
	PlaceObj('XTemplateWindow', {
		'Id', "idTitle",
		'IdNode', true,
		'Dock', "top",
		'HAlign', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-400, -80, -40, 0),
			'Image', "UI/Common/pm_pad_large.tga",
			'FrameBox', box(320, 0, 40, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTitle",
			'VAlign', "bottom",
			'TextStyle', "UITitle",
			'Translate', true,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
self.idTitle:SetText(value)
end,
	}),
})

