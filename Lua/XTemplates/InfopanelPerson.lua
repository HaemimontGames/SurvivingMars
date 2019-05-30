-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Infopanel",
	id = "InfopanelPerson",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverTitle', T(840063956526, --[[XTemplate InfopanelPerson RolloverTitle]] "<DisplayName>"),
		'Margins', box(-9, 0, -9, 0),
		'ScaleModifier', point(700, 700),
		'Background', RGBA(0, 0, 0, 0),
		'RolloverZoom', 1100,
		'RolloverDrawOnTop', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "next-in-line",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
			if self.context then
				self.context:Select()
			end
		end,
		'AltPress', true,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'Icon', "UI/Infopanel/colonist_empty.tga",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idSpecialization",
			'Dock', "box",
		}),
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
				if context then
					parent:SetIcon(context:GetInfopanelIcon())
					parent.idSpecialization:SetImage(context.ip_specialization_icon)
				end
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Dock', "box",
			'Visible', false,
			'Image', "UI/Infopanel/colonist_shine.tga",
		}),
		}),
})

