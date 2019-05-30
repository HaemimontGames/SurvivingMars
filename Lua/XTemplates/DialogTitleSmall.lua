-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "DialogTitleSmall",
	PlaceObj('XTemplateWindow', {
		'IdNode', true,
		'Margins', box(45, 0, 0, 0),
		'Dock', "top",
		'HAlign', "left",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idFrame",
			'Margins', box(-328, 0, -40, 0),
			'Dock', "box",
			'MinWidth', 580,
			'Image', "UI/CommonNew/pg_header_small.tga",
			'FrameBox', box(31, 0, 74, 0),
			'TileFrame', true,
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'VAlign', "center",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idTitle",
				'Padding', box(0, 0, 0, 0),
				'HandleMouse', false,
				'TextStyle', "MediumHeader",
				'Translate', true,
				'HideOnEmpty', true,
			}),
			}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
			self.idTitle:SetText(value)
		end,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "BigImage",
		'Set', function (self, value)
			if value then
				self.idFrame:SetImage("UI/CommonNew/pg_header_small_tall.tga")
			end
		end,
	}),
})

