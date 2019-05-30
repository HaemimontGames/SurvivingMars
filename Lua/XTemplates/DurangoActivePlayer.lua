-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLayer",
	group = "Layers",
	id = "DurangoActivePlayer",
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
			'__class', "XFrame",
			'Margins', box(-150, 0, 0, 155),
			'Padding', box(130, 5, 0, 5),
			'Dock', "bottom",
			'HAlign', "left",
			'Image', "UI/Common/rollover_tiny_a.tga",
			'FrameBox', box(20, 0, 20, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return { tag = Untranslated(Durango.GetGamertag(XPlayerActive)) } end,
				'__class', "XText",
				'Id', "idActivePlayer",
				'Margins', box(100, 0, 20, 0),
				'HAlign', "right",
				'VAlign', "center",
				'TextStyle', "NameTag",
				'Translate', true,
				'Text', T(410148310585, --[[XTemplate DurangoActivePlayer Text]] "<tag>"),
			}),
			}),
		}),
})

