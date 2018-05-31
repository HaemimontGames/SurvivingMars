-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idContent end,
	__is_kind_of = "XContextControl",
	group = "Infopanel",
	id = "InfopanelActiveSection",
	PlaceObj('XTemplateWindow', {
		'__class', "XSection",
		'RolloverTemplate', "InfopanelSectionRollover",
		'RolloverAnchor', "left",
		'Padding', box(32, 0, 0, 0),
		'LayoutMethod', "VList",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
XWindow.OnSetRollover(self, rollover)
self.idRollover2:SetVisible(self.idSectionTitle.visible and rollover)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "section background",
			'Dock', "box",
			'HandleMouse', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Margins', box(0, -2, 0, 0),
				'VAlign', "top",
				'Image', "UI/Infopanel/section.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idActive",
				'Margins', box(0, -2, 0, 1),
				'VAlign', "top",
				'Visible', false,
				'Image', "UI/Infopanel/section_light.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRollover2",
				'IdNode', false,
				'Margins', box(0, 32, 0, -8),
				'VAlign', "top",
				'Visible', false,
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
			'FXMouseIn', "ActionButtonHover",
			'Image', "UI/Icons/Sections/dome.tga",
			'ImageFit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRollover",
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
			'Margins', box(2, 5, 20, 0),
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSectionTitle",
				'Id', "idSectionTitle",
				'FoldWhenHidden', true,
				'TextColor', RGBA(220, 220, 220, 255),
			}),
			}),
		}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
self.idSectionTitle:SetText(value)
self.idSectionTitle:SetVisible(value~="")
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

