-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ModItemAttachmentDialog",
	PlaceObj('XTemplateWindow', {
		'__class', "ModItemAttachmentDialog",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idtxtConstructionStatus",
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'Clip', false,
			'HandleMouse', false,
			'TextStyle', "OnScreenStatus",
			'Translate', true,
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "determine vertical size",
			'__context', function (parent, context) return parent end,
			'Id', "idBottom",
			'VAlign', "bottom",
			'MinHeight', 90,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idMiddle",
				'IdNode', false,
				'Padding', box(120, 12, 120, 0),
				'HAlign', "center",
				'MinWidth', 400,
				'Image', "UI/CommonNew/Hud.tga",
				'FrameBox', box(43, 42, 43, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "align buttons",
					'Padding', box(0, 5, 0, 5),
					'HAlign', "center",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 10,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idStatus",
						'Margins', box(0, 0, 0, 5),
						'HandleMouse', false,
						'TextStyle', "ModAttachmentStatus",
						'Translate', true,
						'TextHAlign', "center",
						'TextVAlign', "bottom",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRight",
				'IdNode', false,
				'Margins', box(0, 12, 0, 0),
				'HAlign', "right",
				'MinWidth', 350,
				'Image', "UI/CommonNew/options.tga",
				'ImageFit', "stretch",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "align buttons",
					'Margins', box(0, 5, 25, 5),
					'HAlign', "right",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 10,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(499310226724, --[[XTemplate ModItemAttachmentDialog RolloverText]] "Control Parent Object"),
						'Id', "idParent",
						'Margins', box(-15, 0, 0, 0),
						'Image', "UI/Icons/mod_0.tga",
						'Rows', 2,
						'OnPress', function (self, gamepad)
XToggleButton.OnPress(self, gamepad)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(302524790741, --[[XTemplate ModItemAttachmentDialog RolloverText]] "Control X Axis of Anchored Object"),
						'Id', "idAxisX",
						'Margins', box(-15, 0, 0, 0),
						'Image', "UI/Icons/mod_x.tga",
						'Rows', 2,
						'OnPress', function (self, gamepad)
XToggleButton.OnPress(self, gamepad)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(878726048776, --[[XTemplate ModItemAttachmentDialog RolloverText]] "Control Y Axis of Anchored Object"),
						'Id', "idAxisY",
						'Margins', box(-15, 0, 0, 0),
						'Image', "UI/Icons/mod_y.tga",
						'Rows', 2,
						'OnPress', function (self, gamepad)
XToggleButton.OnPress(self, gamepad)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(376069459657, --[[XTemplate ModItemAttachmentDialog RolloverText]] "Control Z Axis of Anchored Object"),
						'Id', "idAxisZ",
						'Margins', box(-15, 0, 0, 0),
						'Image', "UI/Icons/mod_z.tga",
						'Rows', 2,
						'OnPress', function (self, gamepad)
XToggleButton.OnPress(self, gamepad)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'Id', "idHelpButton",
						'Margins', box(50, 0, 0, 0),
						'ScaleModifier', point(650, 650),
						'Image', "UI/HUD/encyclopedia.tga",
						'OnPress', function (self, gamepad)
self.context.idHelpWindow:SetVisible(not self.context.idHelpWindow:GetVisible(),true)
end,
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idHelpWindow",
			'Margins', box(0, 0, 20, 80),
			'Padding', box(40, 13, 40, 13),
			'HAlign', "right",
			'VAlign', "bottom",
			'MaxWidth', 500,
			'Visible', false,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(-40, -13, -40, -13),
				'Transparency', 70,
				'Image', "UI/CommonNew/autosaving.tga",
				'FrameBox', box(40, 40, 40, 40),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idHelpText",
				'Padding', box(20, 20, 20, 20),
				'HandleMouse', false,
				'TextStyle', "ModHelp",
				'Translate', true,
			}),
			}),
		}),
})

