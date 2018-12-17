-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "Mods",
	id = "ModsUIFlag",
	PlaceObj('XTemplateTemplate', {
		'__template', "ModsUIPopupBase",
	}, {
		PlaceObj('XTemplateWindow', {
			'Padding', box(30, 10, 30, 30),
			'HAlign', "center",
			'VAlign', "center",
			'MaxWidth', 650,
			'LayoutMethod', "VList",
			'LayoutVSpacing', 30,
			'HandleKeyboard', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
local button = self:ResolveId("idSubmit")
if button then
	local context = GetDialogModeParam(self)
	button:SetEnabled(not not context.flag_reason)
end
XWindow.Open(self, ...)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'LayoutMethod', "VList",
				'LayoutVSpacing', 10,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'IdNode', false,
					'Margins', box(-30, 0, -30, 0),
					'MinHeight', 1,
					'MaxHeight', 1,
					'Background', RGBA(236, 235, 235, 255),
					'HandleKeyboard', false,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idText",
					'TextStyle', "ModsUIDescription",
					'Translate', true,
					'Text', T(826179659507, --[[XTemplate ModsUIFlag Text]] "If you believe this mod violates our Terms and Conditions, help us review it by flagging it for moderation. Please fill in the details below and we'll submit it to our QA team for analysis. Thank you for helping make Paradox better and safer."),
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "reason",
				'LayoutMethod', "VList",
				'LayoutVSpacing', 5,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'TextStyle', "ModsUIDescription",
					'Translate', true,
					'Text', T(393143003550, --[[XTemplate ModsUIFlag Text]] "REASON"),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XList",
					'Id', "idReasons",
					'IdNode', false,
					'Margins', box(-20, 0, 0, 0),
					'BorderWidth', 0,
					'Background', RGBA(255, 255, 255, 0),
					'FocusedBackground', RGBA(255, 255, 255, 0),
				}, {
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return PopsModsUIFlagReasons end,
						'run_after', function (child, context, item, i, n)
child:SetText(item.name)
child:SetCheck(item.id == context.flag_reason)
child.OnChange = function(this, check)
	local parent = this.parent
	for _, ctrl in ipairs(parent) do
		ctrl:SetCheck(this == ctrl)
	end
	local submit_button = this:ResolveId("idSubmit")
	if submit_button and not submit_button.enabled then
		submit_button:SetEnabled(true)
	end
	local has_reason = context.flag_reason
	context.flag_reason = item.id
	if not has_reason then
		local dlg = GetDialog(this)
		dlg:UpdateActionViews(dlg)
	end
end
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "ModsUIChecksListItem",
							'Icon', "UI/Mods/radio_button.tga",
							'IconScale', point(500, 500),
							'TextStyle', "ModsUIDescription",
						}),
						}),
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
if shortcut == "Down" and self.focused_item == #self then
	self:ResolveId("idComment"):SetFocus()
	return "break"
end
return XList.OnShortcut(self, shortcut, source)
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "comment",
				'LayoutMethod', "VList",
				'LayoutVSpacing', 5,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'TextStyle', "ModsUIDescription",
					'Translate', true,
					'Text', T(230479009069, --[[XTemplate ModsUIFlag Text]] "COMMENT"),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XMultiLineEdit",
					'Id', "idComment",
					'TextStyle', "LogInEdit",
					'MinVisibleLines', 8,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "Open",
						'func', function (self, ...)
XMultiLineEdit.Open(self, ...)
local context = GetDialogModeParam(self)
self:SetText(context.flag_description or "")
end,
					}),
					PlaceObj('XTemplateFunc', {
						'name', "OnTextChanged",
						'func', function (self, ...)
XMultiLineEdit.OnTextChanged(self, ...)
local context = GetDialogModeParam(self)
context.flag_description = self:GetText()
end,
					}),
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
if shortcut == "DPadUp" or shortcut == "LeftThumbUp" then
	local list = self:ResolveId("idReasons")
	list:SetFocus()
	list:SetSelection(#list)
	return "break"
elseif shortcut == "ButtonA" then
	self:OpenControllerTextInput()
	return "break"
end
return XMultiLineEdit.OnShortcut(self, shortcut, source)
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'__class', "XTextButton",
				'Id', "idSubmit",
				'Padding', box(18, 0, 18, 0),
				'HAlign', "center",
				'RolloverOnFocus', false,
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'DisabledBackground', RGBA(255, 255, 255, 255),
				'OnPress', function (self, gamepad)
ModsUIFlagMod(self)
end,
				'Image', "UI/Mods/green_button.tga",
				'FrameBox', box(18, 18, 18, 18),
				'Columns', 2,
				'TextStyle', "LightButtons",
				'Translate', true,
				'Text', T(666956815682, --[[XTemplate ModsUIFlag Text]] "SUBMIT"),
				'ColumnsUse', "abaaa",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "SetEnabled(self, enabled)",
					'func', function (self, enabled)
XTextButton.SetEnabled(self, enabled)
self:SetDesaturation(enabled and 0 or 255)
end,
				}),
				}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T(4165, --[[XTemplate ModsUIFlag ActionName]] "Back"),
			'ActionToolbar', "ActionBarRight",
			'ActionShortcut', "Escape",
			'OnAction', function (self, host, source)
ModsUIClosePopup(host)
end,
			'__condition', function (parent, context) return not GetUIStyleGamepad() end,
		}),
		}),
})

