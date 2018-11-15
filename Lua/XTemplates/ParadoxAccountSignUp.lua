-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "Paradox",
	id = "ParadoxAccountSignUp",
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
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
PDXAccountFillBirthDataCombos(self)
self:ResolveId("idCountry").idCombo:SetItems(ParadoxCountriesCombo())
return XFrame.Open(self,...)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'Padding', box(40, 40, 12, 20),
			'HAlign', "center",
			'VAlign', "center",
			'LayoutMethod', "VList",
			'LayoutVSpacing', 20,
			'HandleKeyboard', false,
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
				'Margins', box(0, 0, 0, 20),
				'Dock', "top",
				'LayoutMethod', "VList",
				'LayoutVSpacing', 5,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'IdNode', false,
					'HAlign', "center",
					'TextStyle', "LogInTitle",
					'Translate', true,
					'Text', T{437347877065, --[[XTemplate ParadoxAccountSignUp Text]] "Sign up to enjoy all of Paradox"},
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
						'LayoutMethod', "VList",
						'LayoutVSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "fill email",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "left",
								'VAlign', "center",
								'TextStyle', "SignUpFieldLabel",
								'Translate', true,
								'Text', T{454693490675, --[[XTemplate ParadoxAccountSignUp Text]] "E-mail"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "email address",
							'__class', "XPropControl",
							'BindTo', "Email",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XEdit",
								'Id', "idEdit",
								'Padding', box(20, 15, 20, 15),
								'HAlign', "left",
								'MinWidth', 530,
								'MaxWidth', 530,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'RelativeFocusOrder', "new-line",
								'FocusedBorderColor', RGBA(83, 150, 52, 255),
								'TextStyle', "LogInEdit",
								'ConsoleKeyboardTitle', T{10400, --[[XTemplate ParadoxAccountSignUp ConsoleKeyboardTitle]] "Email address"},
								'MaxLen', 128,
								'AutoSelectAll', true,
								'NegFilter', "<>",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnTextChanged",
									'func', function (self, ...)
XEdit.OnTextChanged(self, ...)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetText())
end,
								}),
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
						}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "VList",
						'LayoutVSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "fill passward",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "left",
								'VAlign', "center",
								'TextStyle', "SignUpFieldLabel",
								'Translate', true,
								'Text', T{311056524649, --[[XTemplate ParadoxAccountSignUp Text]] "Password"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "password",
							'__class', "XPropControl",
							'BindTo', "Password",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XEdit",
								'Id', "idEdit",
								'Padding', box(20, 15, 20, 15),
								'HAlign', "left",
								'MinWidth', 530,
								'MaxWidth', 530,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'RelativeFocusOrder', "new-line",
								'FocusedBorderColor', RGBA(83, 150, 52, 255),
								'TextStyle', "LogInEdit",
								'ConsoleKeyboardTitle', T{311056524649, --[[XTemplate ParadoxAccountSignUp ConsoleKeyboardTitle]] "Password"},
								'MaxLen', 128,
								'AutoSelectAll', true,
								'NegFilter', "<>",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnTextChanged",
									'func', function (self, ...)
XEdit.OnTextChanged(self, ...)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetText())
end,
								}),
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
						}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "VList",
						'LayoutVSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "fill birth date",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "left",
								'VAlign', "center",
								'TextStyle', "SignUpFieldLabel",
								'Translate', true,
								'Text', T{550188014991, --[[XTemplate ParadoxAccountSignUp Text]] "Date of Birth"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'LayoutMethod', "HList",
							'LayoutHSpacing', 15,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XPropControl",
								'Id', "idDay",
								'BindTo', "Date",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XCombo",
									'Id', "idCombo",
									'Padding', box(20, 10, 20, 10),
									'MinWidth', 100,
									'MouseCursor', "UI/Cursors/Rollover.tga",
									'RelativeFocusOrder', "new-line",
									'TextStyle', "ComboTextPC",
									'Items', {},
									'MaxItems', 13,
									'ArbitraryValue', false,
									'ButtonTemplate', "ParadoxUIComboButton",
									'ListItemTemplate', "ParadoxAccountComboListItem",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnValueChanged(self, value)",
										'func', function (self, value)
local parent = self.parent
if parent.window_state == "destroying" then return end
XCombo.OnValueChanged(self, value)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(parent.context)
obj:SetProperty(prop_meta.id, value)
end,
									}),
									}),
								PlaceObj('XTemplateFunc', {
									'name', "OnPropUpdate(self, context, prop_meta, value)",
									'func', function (self, context, prop_meta, value)
self.idCombo:SetValue(value)
end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XPropControl",
								'Id', "idMonth",
								'BindTo', "Month",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XCombo",
									'Id', "idCombo",
									'Padding', box(20, 10, 20, 10),
									'MinWidth', 300,
									'MouseCursor', "UI/Cursors/Rollover.tga",
									'RelativeFocusOrder', "next-in-line",
									'TextStyle', "ComboTextPC",
									'Items', {},
									'ArbitraryValue', false,
									'ButtonTemplate', "ParadoxUIComboButton",
									'ListItemTemplate', "ParadoxAccountComboListItem",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnValueChanged(self, value)",
										'func', function (self, value)
local parent = self.parent
if parent.window_state == "destroying" then return end
XCombo.OnValueChanged(self, value)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(parent.context)
obj:SetProperty(prop_meta.id, value)
end,
									}),
									}),
								PlaceObj('XTemplateFunc', {
									'name', "OnPropUpdate(self, context, prop_meta, value)",
									'func', function (self, context, prop_meta, value)
self.idCombo:SetValue(value)
end,
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XPropControl",
								'Id', "idYear",
								'BindTo', "Year",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XCombo",
									'Id', "idCombo",
									'Padding', box(20, 10, 20, 10),
									'MinWidth', 100,
									'MouseCursor', "UI/Cursors/Rollover.tga",
									'RelativeFocusOrder', "next-in-line",
									'TextStyle', "ComboTextPC",
									'Items', {},
									'MaxItems', 13,
									'ArbitraryValue', false,
									'ButtonTemplate', "ParadoxUIComboButton",
									'ListItemTemplate', "ParadoxAccountComboListItem",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnValueChanged(self, value)",
										'func', function (self, value)
local parent = self.parent
if parent.window_state == "destroying" then return end
XCombo.OnValueChanged(self, value)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(parent.context)
obj:SetProperty(prop_meta.id, value)
end,
									}),
									}),
								PlaceObj('XTemplateFunc', {
									'name', "OnPropUpdate(self, context, prop_meta, value)",
									'func', function (self, context, prop_meta, value)
self.idCombo:SetValue(value)
end,
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "VList",
						'LayoutVSpacing', 5,
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "fill country",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "left",
								'VAlign', "center",
								'TextStyle', "SignUpFieldLabel",
								'Translate', true,
								'Text', T{736319381475, --[[XTemplate ParadoxAccountSignUp Text]] "Country"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XPropControl",
							'Id', "idCountry",
							'BindTo', "Country",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XCombo",
								'Id', "idCombo",
								'Padding', box(20, 10, 20, 10),
								'HAlign', "left",
								'MinWidth', 530,
								'MaxWidth', 530,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'RelativeFocusOrder', "new-line",
								'TextStyle', "ComboTextPC",
								'Items', {},
								'MaxItems', 10,
								'ArbitraryValue', false,
								'ButtonTemplate', "ParadoxUIComboButton",
								'ListItemTemplate', "ParadoxAccountComboListItem",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnValueChanged(self, value)",
									'func', function (self, value)
local parent = self.parent
if parent.window_state == "destroying" then return end
XCombo.OnValueChanged(self, value)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(parent.context)
obj:SetProperty(prop_meta.id, self:GetValue())
end,
								}),
								}),
							PlaceObj('XTemplateFunc', {
								'name', "OnPropUpdate(self, context, prop_meta, value)",
								'func', function (self, context, prop_meta, value)
value = value or ""
self.idCombo:SetValue(value)
end,
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "read terms",
						'__class', "XTextButton",
						'HAlign', "left",
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
OpenParadoxTermsURL()
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'TextStyle', "LogInText",
						'Translate', true,
						'Text', T{7716, --[[XTemplate ParadoxAccountSignUp Text]] "Read Terms of Use"},
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
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "read policy",
						'__class', "XTextButton",
						'HAlign', "left",
						'Background', RGBA(0, 0, 0, 0),
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'RelativeFocusOrder', "new-line",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'OnPress', function (self, gamepad)
OpenParadoxPrivacyPolicyURL()
end,
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'TextStyle', "LogInText",
						'Translate', true,
						'Text', T{7717, --[[XTemplate ParadoxAccountSignUp Text]] "Read Privacy Policy"},
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
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "terms of use",
						'__class', "XPropControl",
						'Padding', box(0, 3, 0, 3),
						'MaxWidth', 490,
						'RolloverOnFocus', true,
						'BindTo', "Terms",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XCheckButton",
							'Id', "idCheck",
							'LayoutHSpacing', 10,
							'Background', RGBA(255, 255, 255, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "new-line",
							'Icon', "UI/Mods/checkbox.tga",
							'IconScale', point(1000, 1000),
							'IconColor', RGBA(255, 255, 255, 255),
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
if GetUIStyleGamepad() then
	self:SetRolloverBackground(RGBA(235,235,235,255))
	self:SetPressedBackground(RGBA(235,235,235,255))
end
XCheckButton.Open(self,...)
end,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Enabled', false,
								'TextStyle', "LogInText",
								'Translate', true,
								'Text', T{838793210805, --[[XTemplate ParadoxAccountSignUp Text]] "I have read and accept the Terms of Use "},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnChange(self, check)",
								'func', function (self, check)
XCheckButton.OnChange(self, check)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetCheck())
end,
							}),
							}),
						PlaceObj('XTemplateFunc', {
							'name', "OnPropUpdate(self, context, prop_meta, value)",
							'func', function (self, context, prop_meta, value)
self.idCheck:SetCheck(value)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "privacy policy",
						'__class', "XPropControl",
						'Padding', box(0, 3, 0, 3),
						'MaxWidth', 490,
						'RolloverOnFocus', true,
						'BindTo', "Policy",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XCheckButton",
							'Id', "idCheck",
							'LayoutHSpacing', 10,
							'Background', RGBA(255, 255, 255, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "new-line",
							'Icon', "UI/Mods/checkbox.tga",
							'IconScale', point(1000, 1000),
							'IconColor', RGBA(255, 255, 255, 255),
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
if GetUIStyleGamepad() then
	self:SetRolloverBackground(RGBA(235,235,235,255))
	self:SetPressedBackground(RGBA(235,235,235,255))
end
XCheckButton.Open(self,...)
end,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Enabled', false,
								'TextStyle', "LogInText",
								'Translate', true,
								'Text', T{479560164468, --[[XTemplate ParadoxAccountSignUp Text]] "I have read and understood the Privacy Policy"},
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'IdNode', false,
								'Dock', "right",
								'VAlign', "center",
								'TextStyle', "SignUpRequired",
								'Translate', true,
								'Text', T{482718759015, --[[XTemplate ParadoxAccountSignUp Text]] "REQUIRED"},
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnChange(self, check)",
								'func', function (self, check)
XCheckButton.OnChange(self, check)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetCheck())
end,
							}),
							}),
						PlaceObj('XTemplateFunc', {
							'name', "OnPropUpdate(self, context, prop_meta, value)",
							'func', function (self, context, prop_meta, value)
self.idCheck:SetCheck(value)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "newsletter",
						'__class', "XPropControl",
						'Padding', box(0, 3, 0, 3),
						'MaxWidth', 490,
						'RolloverOnFocus', true,
						'BindTo', "Newsletter",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XCheckButton",
							'Id', "idCheck",
							'LayoutHSpacing', 10,
							'Background', RGBA(255, 255, 255, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "new-line",
							'Icon', "UI/Mods/checkbox.tga",
							'IconScale', point(1000, 1000),
							'IconColor', RGBA(255, 255, 255, 255),
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
if GetUIStyleGamepad() then
	self:SetRolloverBackground(RGBA(235,235,235,255))
	self:SetPressedBackground(RGBA(235,235,235,255))
end
XCheckButton.Open(self,...)
end,
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Enabled', false,
								'TextStyle', "LogInText",
								'Translate', true,
								'Text', T{644311688887, --[[XTemplate ParadoxAccountSignUp Text]] "I want to receive news and offers from Survivng Mars and Paradox Interactive"},
							}),
							PlaceObj('XTemplateFunc', {
								'name', "OnChange(self, check)",
								'func', function (self, check)
XCheckButton.OnChange(self, check)
local prop_meta = self.parent.prop_meta
local obj = ResolvePropObj(self.parent.context)
obj:SetProperty(prop_meta.id, self:GetCheck())
end,
							}),
							}),
						PlaceObj('XTemplateFunc', {
							'name', "OnPropUpdate(self, context, prop_meta, value)",
							'func', function (self, context, prop_meta, value)
self.idCheck:SetCheck(value)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return not GetUIStyleGamepad() end,
						'__class', "XTextButton",
						'Id', "idCreateAccount",
						'Padding', box(18, 0, 18, 0),
						'HAlign', "center",
						'RolloverOnFocus', false,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'DisabledBackground', RGBA(255, 255, 255, 255),
						'OnPressEffect', "action",
						'OnPressParam', "signup",
						'Image', "UI/Mods/green_button.tga",
						'FrameBox', box(18, 18, 18, 18),
						'Columns', 2,
						'TextStyle', "LightButtons",
						'Translate', true,
						'Text', T{816278241152, --[[XTemplate ParadoxAccountSignUp Text]] "CREATE ACCOUNT"},
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
						'__condition', function (parent, context) return not GetUIStyleGamepad() end,
						'LayoutMethod', "HList",
						'LayoutHSpacing', 10,
					}, {
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return not GetUIStyleGamepad() end,
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
							'Text', T{332525583029, --[[XTemplate ParadoxAccountSignUp Text]] "Already have a Paradox account?"},
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idLogIn",
							'Padding', box(18, 0, 18, 0),
							'HAlign', "center",
							'VAlign', "center",
							'LayoutMethod', "Box",
							'LayoutHSpacing', 0,
							'RolloverOnFocus', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'OnPressEffect', "action",
							'OnPressParam', "login",
							'Image', "UI/Mods/button_black_border.tga",
							'FrameBox', box(18, 18, 18, 18),
							'TextStyle', "DarkButtons",
							'Translate', true,
							'Text', T{507473038910, --[[XTemplate ParadoxAccountSignUp Text]] "LOGIN"},
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
spinner:SetVisible(context.creating_account)
end,
			}),
			}),
		}),
})

