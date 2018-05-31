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
		PlaceObj('XTemplateFunc', {
			'name', "Highlight(self, highlight)",
			'func', function (self, highlight)
if self.idSectionTitle.visible then
		self.idHighlight:SetVisible(highlight)
		self.idHighlight2:SetVisible(highlight)
		local b = self.idHighlight2.box
		self.idHighlight2:AddInterpolation{
			type = const.intRect,
			duration = self.idHighlight2:GetFadeInTime(),
			startRect = b,
			endRect = sizebox(b:minx(), b:miny(), 40, b:sizey()),
			flags = const.intfInverse,
			autoremove = true,
		}
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
			'comment', "section background",
			'Dock', "box",
			'HandleMouse', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Margins', box(0, -1, 0, 0),
				'VAlign', "top",
				'Image', "UI/Infopanel/section.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idHighlight2",
				'IdNode', false,
				'Margins', box(0, 22, 0, 0),
				'VAlign', "top",
				'Visible', false,
				'FadeInTime', 150,
				'Image', "UI/Infopanel/section _shine.tga",
				'ImageFit', "stretch-x",
			}),
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
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSectionTitle",
				'Id', "idSectionTitle",
				'Padding', box(2, 2, 2, 4),
				'FoldWhenHidden', true,
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
})

