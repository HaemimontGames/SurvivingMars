-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Infopanel",
	id = "InfopanelButton",
	PlaceObj('XTemplateWindow', {
		'__parent', function (parent, context) return GetActionsHost(parent).idMainButtons end,
		'__condition', function (parent, context) return parent end,
		'__class', "XTextButton",
		'RolloverTemplate', "InfopanelRollover",
		'RolloverAnchor', "left",
		'RolloverHint', T(10989, --[[XTemplate InfopanelButton RolloverHint]] "<left_click> Activate"),
		'RolloverHintGamepad', T(643294919927, --[[XTemplate InfopanelButton RolloverHintGamepad]] "<ButtonA> Activate"),
		'ScaleModifier', point(700, 700),
		'LayoutMethod', "Box",
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "next-in-line",
		'OnContextUpdate', function (self, context, ...)
			local param_update = self.OnPressParam .. "_Update"
			if context:HasMember(param_update) then
				context[param_update](context, self)
			end
		end,
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
			local param = self.OnPressParam
			local obj = self.context
			if param ~= "" and obj:HasMember(param) then
				obj[param](obj, 1)
				RebuildInfopanel(obj)
			end
		end,
		'OnAltPress', function (self, gamepad)
			local param = self.OnPressParam
			local obj = self.context
			if param ~= "" and obj:HasMember(param) then
				obj[param](obj, -1)
				RebuildInfopanel(obj)
			end
		end,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'Margins', box(-5, -5, -5, -5),
			'Visible', false,
			'FadeInTime', 100,
			'FadeOutTime', 100,
			'FXMouseIn', "MenuItemHovers",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'Image', "UI/Common/Hex_small_shine.tga",
			'ImageFit', "stretch",
		}),
		}),
})

