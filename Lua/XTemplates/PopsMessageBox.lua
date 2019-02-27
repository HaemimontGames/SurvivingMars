-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "PopsMessageBox",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'Background', RGBA(255, 255, 255, 185),
		'HandleMouse', true,
		'FocusedBackground', RGBA(255, 255, 255, 185),
		'Image', "UI/Mods/Circle32Black.tga",
		'ImageScale', point(500, 500),
		'FrameBox', box(15, 15, 15, 15),
		'SqueezeX', false,
		'SqueezeY', false,
	}),
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'Id', "idParentFrame",
		'IdNode', false,
		'Margins', box(0, 30, 0, 30),
		'HAlign', "center",
		'VAlign', "center",
		'MinWidth', 792,
		'MaxWidth', 792,
		'LayoutMethod', "VList",
		'HandleMouse', true,
		'Image', "UI/Mods/Circle32White.tga",
		'ImageScale', point(500, 500),
		'FrameBox', box(15, 15, 15, 15),
		'SqueezeX', false,
		'SqueezeY', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idTitle",
			'Margins', box(20, 20, 0, 0),
			'FoldWhenHidden', true,
			'TextStyle', "ModsUIPopupTitle",
			'Translate', true,
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(0, 10, 0, 10),
			'MinHeight', 1,
			'MaxHeight', 1,
			'Background', RGBA(235, 235, 235, 255),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idDescription",
			'Margins', box(20, 20, 20, 20),
			'MinHeight', 100,
			'TextStyle', "ModsUIDescription",
			'Translate', true,
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(0, 10, 0, 10),
			'MinHeight', 1,
			'MaxHeight', 1,
			'Background', RGBA(235, 235, 235, 255),
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idBottomFrameWindow",
			'Margins', box(0, 0, 0, 20),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XList",
				'Id', "idList",
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
child:SetEnabled(item:ActionState(GetActionsHost(child)) ~= "disabled")
child.idNumber:SetText(tostring(i) .. ".")
end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "PopsMessageButton",
					}),
					}),
				}),
			}),
		}),
	PlaceObj('XTemplateCode', {
		'run', function (self, parent, context)
parent.override_valign = "stretch"
end,
	}),
	PlaceObj('XTemplateFunc', {
		'name', "RecalculateMargins",
		'func', function (self, ...)
self:SetMargins(GetSafeMargins())
end,
	}),
})

