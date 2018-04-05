-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "MarsMessageBox",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'IdNode', false,
		'HAlign', "left",
		'MinWidth', 470,
		'MinHeight', 30,
		'MaxWidth', 650,
		'MaxHeight', 30,
		'Transparency', 30,
		'Image', "UI/Common/rollover_up.tga",
		'FrameBox', box(3, 0, 20, 0),
		'SqueezeY', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTitle",
			'Margins', box(20, 0, 0, 0),
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(254, 237, 122, 255),
			'RolloverTextColor', RGBA(254, 237, 122, 255),
			'Translate', true,
		}),
		}),
	PlaceObj('XTemplateWindow', {
		'__class', "XImage",
		'Id', "idBackground",
		'Image', "UI/Messages/message_picture_01.tga",
	}),
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'IdNode', false,
		'Image', "UI/Common/message_description_pad.tga",
		'SqueezeX', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Image', "UI/Common/rollover_watermark_3.tga",
			'FrameBox', box(2, 0, 2, 0),
			'TileFrame', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idDescription",
			'Margins', box(20, 20, 20, 20),
			'TextFont', "PopupDescr",
			'TextColor', RGBA(233, 242, 255, 255),
			'RolloverTextColor', RGBA(233, 242, 255, 255),
			'ShadowSize', 1,
			'ShadowColor', RGBA(0, 0, 0, 255),
			'Translate', true,
		}),
		}),
	PlaceObj('XTemplateWindow', {
		'comment', "upper line",
		'__class', "XImage",
		'Image', "UI/Common/message_choice_up.tga",
	}),
	PlaceObj('XTemplateWindow', {
		'comment', "lower end",
		'__class', "XImage",
		'Id', "idBottomLine",
		'Dock', "bottom",
		'Image', "UI/Common/message_choice_up.tga",
	}),
	PlaceObj('XTemplateWindow', {
		'Id', "idBottomFrameWindow",
		'Margins', box(-25, 0, 0, 0),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(25, 0, 0, 0),
			'Image', "UI/Common/message_choice_middle.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(25, 0, 0, 0),
			'Image', "UI/Common/message_choice_watermark_1.tga",
			'TileFrame', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'Margins', box(0, -2, 0, -2),
			'BorderWidth', 0,
			'Padding', box(0, 0, 0, 0),
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateForEach', {
				'comment', "item",
				'array', function (parent, context) return GetDialog(parent).actions end,
				'run_after', function (child, context, item, i, n)
local gamepad_visuals = GetUIStyleGamepad() or (context and context.force_ui_style == "gamepad")
child.idGamepadSelectedIcon:SetImage(GetPlatformSpecificImagePath("ButtonA"))
if gamepad_visuals and item.ActionGamepad ~= "" then
	child.idGamepadButtonIcon:SetImage(GetPlatformSpecificImagePath(item.ActionGamepad))
	child.idGamepadButtonIcon:SetVisible(true)
elseif item.ActionIcon ~= "" then
	child.idButtonIcon:SetImage(item.ActionIcon)
end
child:SetText(item.ActionName)
if item.RolloverText ~= "" then
	child:SetRolloverTitle(item.RolloverTitle)
	child:SetRolloverText(item.RolloverText)
	child:SetRolloverHint(item.RolloverHint)
	child:SetRolloverHintGamepad(item.RolloverHintGamepad)
end
child.OnPress = function()
	item:OnAction(GetDialog(child), child)
end
end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "MarsMessageButton",
				}),
				}),
			}),
		}),
})

