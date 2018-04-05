-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLayer",
	group = "Layers",
	id = "Version",
	PlaceObj('XTemplateWindow', {
		'__class', "XLayer",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XLayer.Open(self, ...)
self:SetMargins(GetSafeMargins())
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return _G end,
			'__class', "XText",
			'Id', "idVersion",
			'Margins', box(50, 0, 0, 20),
			'HAlign', "left",
			'VAlign', "bottom",
			'HandleKeyboard', false,
			'HandleMouse', false,
			'TextFont', "Version",
			'TextColor', RGBA(158, 158, 158, 255),
			'Translate', true,
			'Text', T{986382737958, --[[XTemplate Version Text]] "Version: <u(LuaRevision)>"},
			'Shorten', true,
		}),
		}),
})

