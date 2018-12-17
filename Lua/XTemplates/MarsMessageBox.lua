-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "MarsMessageBox",
	PlaceObj('XTemplateWindow', {
		'Margins', box(0, 20, 0, 20),
		'Padding', box(25, 0, 25, 0),
		'Dock', "box",
		'HAlign', "center",
		'VAlign', "center",
		'MinWidth', 911,
		'MaxWidth', 911,
		'LayoutMethod', "VList",
	}, {
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return not GetDialog("PlanetaryView") and GameState.gameplay end,
			'layer', "ScreenBlur",
			'layer_id', "idBlur",
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "XHideNonEssentialUILayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idBackground",
			'Dock', "top",
			'Image', "UI/Messages/message_picture_01.tga",
			'ImageFit', "smallest",
		}),
		PlaceObj('XTemplateWindow', {
			'Padding', box(1, 0, 1, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "stretched background",
				'__class', "XFrame",
				'IdNode', false,
				'Image', "UI/CommonNew/hud_message.tga",
				'FrameBox', box(12, 3, 12, 150),
			}, {
				PlaceObj('XTemplateWindow', {
					'Padding', box(20, 5, 40, 5),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XScrollArea",
						'Id', "idScrollArea",
						'IdNode', false,
						'VScroll', "idScroll",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idDescription",
							'Padding', box(0, 0, 0, 0),
							'HandleMouse', false,
							'TextStyle', "MessageText",
							'Translate', true,
						}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__template', "ScrollbarNew",
						'Id', "idScroll",
						'Margins', box(0, 0, 4, 0),
						'Target', "idScrollArea",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "actionScrollAreaDown",
						'ActionGamepad', "RightThumbDown",
						'OnAction', function (self, host, source)
local text_area = host:ResolveId("idScrollArea")
if text_area:GetVisible() then
	return text_area:OnMouseWheelBack()
end
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "actionScrollAreaUp",
						'ActionGamepad', "RightThumbUp",
						'OnAction', function (self, host, source)
local text_area = host:ResolveId("idScrollArea")
if text_area:GetVisible() then
	return text_area:OnMouseWheelForward()
end
end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(20, 12, 40, 0),
					'Dock', "top",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idTitle",
						'Margins', box(20, 0, 0, 10),
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'MaxHeight', 52,
						'TextStyle', "MessageTitle",
						'Translate', true,
					}),
					PlaceObj('XTemplateTemplate', {
						'__condition', function (parent, context) return GameState.gameplay and not context.no_ccc_button end,
						'__template', "HUDButtonTemplate",
						'RolloverText', T(8980, --[[XTemplate MarsMessageBox RolloverText]] "Provides historical stats and tools to inspect and manage Buildings, Domes, Colonists and transportation."),
						'RolloverTitle', T(137542936955, --[[XTemplate MarsMessageBox RolloverTitle]] "Command Center"),
						'RolloverHint', T(568152691543, --[[XTemplate MarsMessageBox RolloverHint]] "<em><ShortcutName('actionColonyControlCenter')></em> Тoggle Command Center"),
						'Id', "idCommandControlCenter",
						'Dock', "right",
						'Image', "UI/HUD/command_center.tga",
						'ImageShine', "UI/HUD/command_center_shine.tga",
						'FXPress', "ColonyControlCenterButtonClick",
						'OnPress', function (self, gamepad)
HUD.idColonyControlCenterOnPress()
end,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnPress(self)",
							'func', function (self)
CreateRealTimeThread(function()
	local dlg = OpenCommandCenter()
	dlg:SetModal()
	WaitMsg("CommandCenterClosed")
	local dialog = self:ResolveId("node")
	if dialog then
		dialog:SetModal()
	end
end)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return parent:ResolveId("idCommandControlCenter") and (GetUIStyleGamepad() or (context and context.force_ui_style == "gamepad")) end,
						'__class', "XImage",
						'Margins', box(10, 0, 10, 0),
						'Dock', "right",
						'ScaleModifier', point(550, 550),
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:SetImage(GetPlatformSpecificImagePath("ButtonY"))
end,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XList",
					'Id', "idList",
					'Margins', box(2, -1, 2, 0),
					'BorderWidth', 0,
					'Padding', box(25, 6, 12, 25),
					'Dock', "bottom",
					'LayoutVSpacing', -10,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'ShowPartialItems', false,
				}, {
					PlaceObj('XTemplateForEachAction', {
						'toolbar', "MessageButtons",
						'run_after', function (child, context, action, n)
local gamepad_visuals = GetUIStyleGamepad() or (context and context.force_ui_style == "gamepad")
child.idGamepadSelectedIcon:SetImage(GetPlatformSpecificImagePath("ButtonA"))
if gamepad_visuals and action.ActionGamepad ~= "" then
	child.idGamepadButtonIcon:SetImage(GetPlatformSpecificImagePath(action.ActionGamepad))
	child.idGamepadButtonIcon:SetVisible(true)
elseif action.ActionIcon ~= "" then
	child.idButtonIcon:SetImage(action.ActionIcon)
end
child:SetText(action.ActionName)
if action.RolloverText ~= "" then
	child:SetRolloverTitle(action.RolloverTitle)
	child:SetRolloverText(action.RolloverText)
	child:SetRolloverHint(action.RolloverHint)
	child:SetRolloverHintGamepad(action.RolloverHintGamepad)
end
child.OnPress = function()
	action:OnAction(GetDialog(child), child)
end
local enabled = action:ActionState(GetActionsHost(child)) ~= "disabled"
child:SetEnabled(enabled)
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MarsMessageButton",
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnSetRollover(self, rollover)",
								'func', function (self, rollover)
XImage.OnSetRollover(self, rollover)
local idRollover = self:ResolveValue("idRollover")
	if idRollover and not self:GetEnabled() then
		idRollover:SetVisible(false)
	end
end,
							}),
							}),
						}),
					}),
				}),
			}),
		}),
})

