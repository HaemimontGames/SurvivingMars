-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idContent end,
	__is_kind_of = "XSection",
	group = "Infopanel",
	id = "InfopanelSection",
	PlaceObj('XTemplateWindow', {
		'__class', "XSection",
		'RolloverTemplate', "InfopanelSectionRollover",
		'RolloverAnchor', "left",
		'Padding', box(32, 0, 0, 0),
		'LayoutMethod', "VList",
		'FoldWhenHidden', true,
		'RolloverOnFocus', true,
		'RelativeFocusOrder', "new-line",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idBackground",
			'IdNode', false,
			'Margins', box(-12, -12, 0, -13),
			'Dock', "box",
			'Image', "UI/CommonNew/ip_header.tga",
			'FrameBox', box(12, 12, 0, 12),
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Highlight(self, highlight)",
			'func', function (self, highlight)
if self.idSectionTitle.visible then
		self.idHighlight:SetVisible(highlight)
		PlayFX("UIInfoPanelItemHover", highlight and "start" or "end", self, self.Id)
	end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus(self)",
			'func', function (self)
self:Highlight(true)
return XWindow.OnSetFocus(self)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnKillFocus(self)",
			'func', function (self)
self:Highlight(false)
return XWindow.OnKillFocus(self)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idIcon",
			'IdNode', false,
			'ZOrder', 2,
			'Margins', box(-28, -2, 0, 0),
			'Shape', "InHHex",
			'Dock', "left",
			'VAlign', "top",
			'MinWidth', 30,
			'MaxHeight', 46,
			'HandleMouse', true,
			'Image', "UI/Icons/Sections/dome.tga",
			'ImageFit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idHighlight",
				'IdNode', false,
				'Margins', box(-3, -3, -3, -3),
				'Dock', "box",
				'Visible', false,
				'Image', "UI/Common/Hex_small_shine_3.tga",
				'ImageFit', "smallest",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'Margins', box(2, 0, 20, 4),
			'Padding', box(5, 5, 0, 0),
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSectionTitle",
				'Id', "idSectionTitle",
				'Padding', box(2, 2, 2, 4),
				'MaxHeight', 40,
				'FoldWhenHidden', true,
				'Shorten', true,
			}),
			}),
		}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
self.idSectionTitle:SetText(value)
end,
		'Get', function (self)
return self.idSectionTitle:GetText()
end,
	}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Icon",
		'editor', "text",
		'default', "UI/Icons/Sections/dome.tga",
		'translate', false,
		'Set', function (self, value)
self.idIcon:SetImage(value ~= "" and value or "UI/Icons/Sections/dome.tga")
self.idIcon:SetVisible(value ~= "")
end,
	}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "TitleHAlign",
		'editor', "text",
		'default', "center",
		'translate', false,
		'Set', function (self, value)
self.idSectionTitle:SetHAlign(value)
end,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "StretchFrameRight",
		'Set', function (self, value)
if value then
	local m = self.idBackground:GetMargins()
	self.idBackground:SetMargins(box(m:minx(), m:miny(), m:maxx() - 300, m:maxy()))
end
end,
	}),
})

