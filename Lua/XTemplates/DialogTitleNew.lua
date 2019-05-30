-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idTexts end,
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "DialogTitleNew",
	PlaceObj('XTemplateWindow', {
		'Id', "idTitle",
		'IdNode', true,
		'Dock', "top",
		'HAlign', "left",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idFrame",
			'Margins', box(-350, 0, 0, 0),
			'Dock', "box",
			'MinWidth', 794,
			'MinHeight', 153,
			'Image', "UI/CommonNew/pg_header_big.tga",
			'FrameBox', box(50, 0, 500, 0),
			'TileFrame', true,
			'SqueezeX', false,
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idTexts",
			'VAlign', "center",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idTitle",
				'Padding', box(0, 0, 0, 0),
				'HandleMouse', false,
				'TextStyle', "LargeHeader",
				'Translate', true,
				'HideOnEmpty', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idSubtitle",
				'Padding', box(0, 0, 0, 0),
				'HandleMouse', false,
				'TextStyle', "SubHeader",
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
		'id', "Subtitle",
		'editor', "text",
		'Set', function (self, value)
			self.idSubtitle:SetText(value)
		end,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "BigImage",
		'Set', function (self, value)
			if value then
				local frame = self:ResolveId("idFrame")
				frame:SetImage("UI/CommonNew/pg_header_big_tall.tga")
				frame:SetMinHeight(193)
				frame:SetFrameBox(box(55, 0, 495, 0))
			end
		end,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "SmallImage",
		'Set', function (self, value)
			if value then
				local frame = self:ResolveId("idFrame")
				frame:SetImage("UI/CommonNew/pg_header_big1.tga")
				frame:SetMinHeight(121)
				frame:SetFrameBox(box(55, 0, 495, 0))
			end
		end,
	}),
})

