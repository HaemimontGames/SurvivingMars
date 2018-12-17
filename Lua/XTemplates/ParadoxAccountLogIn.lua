-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "Paradox",
	id = "ParadoxAccountLogIn",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrame",
		'IdNode', false,
		'HAlign', "center",
		'VAlign', "center",
		'MinWidth', 400,
		'Image', "UI/Mods/Circle32White.tga",
		'ImageScale', point(500, 500),
		'FrameBox', box(15, 15, 15, 15),
		'SqueezeX', false,
		'SqueezeY', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'Padding', box(40, 40, 12, 20),
			'HAlign', "center",
			'VAlign', "center",
			'LayoutMethod', "VList",
			'LayoutVSpacing', 20,
			'HandleKeyboard', false,
			'HandleMouse', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "close",
				'__condition', function (parent, context) return not GetUIStyleGamepad() end,
				'__class', "XTextButton",
				'Id', "idClose",
				'IdNode', false,
				'Margins', box(0, 0, 28, 0),
				'Dock', "top",
				'HAlign', "right",
				'VAlign', "center",
				'Background', RGBA(0, 0, 0, 0),
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'OnPressEffect', "action",
				'OnPressParam', "back",
				'RolloverBackground', RGBA(0, 0, 0, 0),
				'PressedBackground', RGBA(0, 0, 0, 0),
				'Icon', "UI/Mods/x_large.tga",
				'IconRows', 2,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'IdNode', false,
				'Margins', box(0, 0, 0, 20),
				'Dock', "top",
				'HAlign', "center",
				'Image', "UI/Mods/platypus-black.tga",
				'ImageScale', point(450, 450),
			}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(0, 0, 0, 20),
				'Dock', "top",
				'LayoutMethod', "VList",
				'LayoutVSpacing', 5,
			}, {
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return not g_ParadoxAccountLoggedIn end,
					'__class', "XLabel",
					'IdNode', false,
					'HAlign', "center",
					'TextStyle', "LogInTitle",
					'Translate', true,
					'Text', T(678897362235, --[[XTemplate ParadoxAccountLogIn Text]] "Login with your"),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'IdNode', false,
					'HAlign', "center",
					'TextStyle', "LogInTitle",
					'Translate', true,
					'Text', T(972281009488, --[[XTemplate ParadoxAccountLogIn Text]] "Paradox Account"),
				}),
				}),
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateWindow', {
					'__class', "XScrollArea",
					'Id', "idScrollArea",
					'IdNode', false,
					'LayoutMethod', "VList",
					'LayoutVSpacing', 20,
					'VScroll', "idScroll",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "email address",
						'__condition', function (parent, context) return not g_ParadoxAccountLoggedIn end,
						'__class', "XPropControl",
						'BindTo', "Email",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XEdit",
							'Id', "idEdit",
							'Padding', box(20, 15, 20, 15),
							'MinWidth', 400,
							'MaxWidth', 400,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "new-line",
							'TextStyle', "LogInEdit",
							'ConsoleKeyboardTitle', T(10400, --[[XTemplate ParadoxAccountLogIn ConsoleKeyboardTitle]] "Email address"),
							'MaxLen', 128,
							'AutoSelectAll', true,
							'NegFilter', "<>",
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnShortcut(self, shortcut, source)",
								'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
	self:OpenControllerTextInput()
	return "break"
end
return XEdit.OnShortcut(self, shortcut, source)
end,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnTextChanged",
								'func', function (self, ...)
XEdit.OnTextChanged(self, ...)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetText())
end,
							}),
							}),
						PlaceObj('XTemplateFunc', {
							'name', "OnPropUpdate(self, context, prop_meta, value)",
							'func', function (self, context, prop_meta, value)
value = value or ""
self.idEdit:SetText(value)
self.idEdit:SetPassword(prop_meta.password)
if prop_meta.disabled and prop_meta.disabled() then
	self:SetEnabled(false)
end
end,
						}),
						}),
					PlaceObj('XTemplateWindow', nil, {
						PlaceObj('XTemplateWindow', {
							'comment', "password",
							'__condition', function (parent, context) return not g_ParadoxAccountLoggedIn end,
							'__class', "XPropControl",
							'BindTo', "Password",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XEdit",
								'Id', "idEdit",
								'Padding', box(20, 15, 20, 15),
								'MinWidth', 400,
								'MaxWidth', 400,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'RelativeFocusOrder', "new-line",
								'TextStyle', "LogInEdit",
								'ConsoleKeyboardTitle', T(311056524649, --[[XTemplate ParadoxAccountLogIn ConsoleKeyboardTitle]] "Password"),
								'MaxLen', 128,
								'AutoSelectAll', true,
								'NegFilter', "<>",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnShortcut(self, shortcut, source)",
									'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
	self:OpenControllerTextInput()
	return "break"
end
return XEdit.OnShortcut(self, shortcut, source)
end,
								}),
								PlaceObj('XTemplateFunc', {
									'name', "OnTextChanged",
									'func', function (self, ...)
XEdit.OnTextChanged(self, ...)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetText())
end,
								}),
								}),
							PlaceObj('XTemplateFunc', {
								'name', "OnPropUpdate(self, context, prop_meta, value)",
								'func', function (self, context, prop_meta, value)
value = value or ""
self.idEdit:SetText(value)
self.idEdit:SetPassword(prop_meta.password)
if prop_meta.disabled and prop_meta.disabled() then
	self:SetEnabled(false)
end
end,
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return false end,
							'__class', "XTextButton",
							'Id', "idForgot",
							'Margins', box(0, 0, 5, 0),
							'Padding', box(18, 0, 18, 0),
							'HAlign', "right",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'Image', "UI/Mods/button_forgot.tga",
							'FrameBox', box(18, 18, 18, 18),
							'TextStyle', "DarkButtons",
							'Translate', true,
							'Text', T(151898836203, --[[XTemplate ParadoxAccountLogIn Text]] "FORGOT?"),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return g_ParadoxAccountLoggedIn end,
						'LayoutMethod', "VList",
						'LayoutVSpacing', 20,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'TextStyle', "AccountTextConsole",
							'Translate', true,
							'Text', T(684020821358, --[[XTemplate ParadoxAccountLogIn Text]] "<LoggedInAs>"),
							'HideOnEmpty', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'TextStyle', "AccountTextConsole",
							'Translate', true,
							'Text', T(674217821028, --[[XTemplate ParadoxAccountLogIn Text]] "<LinkedTo>"),
							'HideOnEmpty', true,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "read terms",
						'__class', "XTextButton",
						'HAlign', "left",
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'FocusedBackground', RGBA(246, 246, 246, 255),
						'OnPress', function (self, gamepad)
OpenParadoxTermsURL()
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'TextStyle', "LogInText",
						'Translate', true,
						'Text', T(269897111890, --[[XTemplate ParadoxAccountLogIn Text]] "Read Terms of Use"),
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idUnderline",
							'Margins', box(0, -5, 0, 0),
							'Dock', "bottom",
							'MinHeight', 1,
							'MaxHeight', 1,
							'Visible', false,
							'Background', RGBA(66, 151, 222, 255),
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
self.idUnderline:SetVisible(rollover)
XTextButton.OnSetRollover(self, rollover)
end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnShortcut(self, shortcut, source)",
							'func', function (self, shortcut, source)
if shortcut == "ButtonX" then return end
return XTextButton.OnShortcut(self, shortcut, source)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "read policy",
						'__class', "XTextButton",
						'HAlign', "left",
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'FocusedBackground', RGBA(246, 246, 246, 255),
						'OnPress', function (self, gamepad)
OpenParadoxPrivacyPolicyURL()
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'TextStyle', "LogInText",
						'Translate', true,
						'Text', T(233932331790, --[[XTemplate ParadoxAccountLogIn Text]] "Read Privacy Policy"),
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idUnderline",
							'Margins', box(0, -5, 0, 0),
							'Dock', "bottom",
							'MinHeight', 1,
							'MaxHeight', 1,
							'Visible', false,
							'Background', RGBA(66, 151, 222, 255),
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnSetRollover(self, rollover)",
							'func', function (self, rollover)
self.idUnderline:SetVisible(rollover)
XTextButton.OnSetRollover(self, rollover)
end,
						}),
						PlaceObj('XTemplateFunc', {
							'name', "OnShortcut(self, shortcut, source)",
							'func', function (self, shortcut, source)
if shortcut == "ButtonX" then return end
return XTextButton.OnShortcut(self, shortcut, source)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not GetUIStyleGamepad() end,
						'HAlign', "center",
						'VAlign', "center",
						'LayoutMethod', "HList",
						'LayoutHSpacing', 20,
					}, {
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return ShowParadoxLoginButton() end,
							'__class', "XTextButton",
							'Id', "idLogIn",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'DisabledBackground', RGBA(255, 255, 255, 255),
							'OnPressEffect', "action",
							'OnPressParam', "login",
							'Image', "UI/Mods/green_button.tga",
							'FrameBox', box(18, 18, 18, 18),
							'Columns', 2,
							'TextStyle', "LightButtons",
							'Translate', true,
							'Text', T(781049228700, --[[XTemplate ParadoxAccountLogIn Text]] "LOGIN"),
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
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return ShowParadoxConnectButton() end,
							'__class', "XTextButton",
							'Id', "idLink",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'DisabledBackground', RGBA(255, 255, 255, 255),
							'OnPressEffect', "action",
							'OnPressParam', "link",
							'Image', "UI/Mods/green_button.tga",
							'FrameBox', box(18, 18, 18, 18),
							'Columns', 2,
							'TextStyle', "LightButtons",
							'Translate', true,
							'Text', T(832052210088, --[[XTemplate ParadoxAccountLogIn Text]] "LINK"),
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
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return ShowParadoxDisconnectButton() end,
							'__class', "XTextButton",
							'Id', "idDisconnect",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'OnPressEffect', "action",
							'OnPressParam', "disconnect",
							'Image', "UI/Mods/green_button.tga",
							'FrameBox', box(18, 18, 18, 18),
							'Columns', 2,
							'TextStyle', "LightButtons",
							'Translate', true,
							'Text', T(921730739055, --[[XTemplate ParadoxAccountLogIn Text]] "UNLINK"),
							'ColumnsUse', "abaaa",
						}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return ShowParadoxLogOutButton() end,
							'__class', "XTextButton",
							'Id', "idLogOut",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'OnPressEffect', "action",
							'OnPressParam', "logout",
							'Image', "UI/Mods/green_button.tga",
							'FrameBox', box(18, 18, 18, 18),
							'Columns', 2,
							'TextStyle', "LightButtons",
							'Translate', true,
							'Text', T(392324073070, --[[XTemplate ParadoxAccountLogIn Text]] "LOG OUT"),
							'ColumnsUse', "abaaa",
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not GetUIStyleGamepad() and not g_ParadoxAccountLoggedIn end,
						'LayoutMethod', "HList",
						'LayoutHSpacing', 10,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Margins', box(-20, 0, -20, 20),
							'Dock', "top",
							'MinHeight', 1,
							'MaxHeight', 1,
							'Background', RGBA(236, 235, 235, 255),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'IdNode', false,
							'VAlign', "center",
							'RolloverDrawOnTop', true,
							'Enabled', false,
							'TextStyle', "LogInText",
							'Translate', true,
							'Text', T(105754088378, --[[XTemplate ParadoxAccountLogIn Text]] "Dont't have a Paradox account?"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idSignUp",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "new-line",
							'OnPressEffect', "action",
							'OnPressParam', "signup",
							'Image', "UI/Mods/button_black_border.tga",
							'FrameBox', box(18, 18, 18, 18),
							'TextStyle', "DarkButtons",
							'Translate', true,
							'Text', T(571213680646, --[[XTemplate ParadoxAccountLogIn Text]] "SIGN UP"),
						}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "Scrollbar",
					'Id', "idScroll",
					'Margins', box(10, 0, 0, 0),
					'Target', "idScrollArea",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idSpinner",
			'Visible', false,
			'FoldWhenHidden', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Background', RGBA(255, 255, 255, 125),
				'HandleMouse', true,
				'FocusedBackground', RGBA(255, 255, 255, 125),
				'Image', "UI/Mods/Circle32Black.tga",
				'ImageScale', point(500, 500),
				'FrameBox', box(15, 15, 15, 15),
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'FoldWhenHidden', true,
				'Image', "UI/Mods/PDX_spinner_anim.tga",
				'Columns', 16,
				'Animate', true,
				'FPS', 25,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'Image', "UI/Mods/PDX_spinner_logo.tga",
			}),
			PlaceObj('XTemplateCode', {
				'run', function (self, parent, context)
local spinner = parent:ResolveId("idSpinner")
spinner:SetVisible(context.loading or g_PopsAttemptingLogin)
end,
			}),
			}),
		}),
})

