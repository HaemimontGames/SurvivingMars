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
			'Margins', box(0, 0, 50, 20),
			'HAlign', "right",
			'VAlign', "bottom",
			'HandleKeyboard', false,
			'HandleMouse', false,
			'TextStyle', "UIVersion",
			'Translate', true,
			'Text', T{986382737958, --[[XTemplate Version Text]] "Version: <u(LuaRevision)>"},
			'Shorten', true,
		}),
		}),
})

