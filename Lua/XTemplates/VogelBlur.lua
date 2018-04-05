-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLayer",
	group = "Layers",
	id = "VogelBlur",
	PlaceObj('XTemplateWindow', {
		'__class', "XLayer",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XLayer.Open(self, ...)
table.change(hr, "BackgroundBlur", {
	EnablePostProcVogelBlur = 1
})
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
table.restore(hr, "BackgroundBlur")
XLayer.Close(self, ...)
end,
		}),
		}),
})

