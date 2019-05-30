-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Paradox",
	id = "ParadoxAccountDialog",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PDXAccountObjectCreateAndLoad() end,
		'__class', "XDialog",
		'InitialMode', "login",
		'InternalModes', "login,signup",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
				context:SetDialog(parent)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
				g_ParadoxMenuContextObj = false
				XDialog.OnDelete(self, ...)
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateWindow', {
				'Padding', box(108, 50, 108, 50),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
						XWindow.Open(self, ...)
						self:SetPadding(GetSafeMargins(self:GetPadding()))
					end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplate",
					'IdNode', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "login",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "ParadoxAccountLogIn",
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "login",
							'ActionName', T(598975766059, --[[XTemplate ParadoxAccountDialog ActionName]] "Login"),
							'ActionToolbar', "ActionBarLeft",
							'ActionShortcut', "Enter",
							'ActionGamepad', "ButtonY",
							'ActionState', function (self, host)
								return (host.context.loading or g_PopsAttemptingLogin) and "disabled"
							end,
							'OnAction', function (self, host, source)
								local obj = ResolvePropObj(host.context)
								obj:Login()
							end,
							'__condition', function (parent, context) return ShowParadoxLoginButton() end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "link",
							'ActionName', T(777283990085, --[[XTemplate ParadoxAccountDialog ActionName]] "Link"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonX",
							'OnAction', function (self, host, source)
								local obj = ResolvePropObj(host.context)
								obj:Connect()
							end,
							'__condition', function (parent, context) return ShowParadoxConnectButton() end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "disconnect",
							'ActionName', T(10990, --[[XTemplate ParadoxAccountDialog ActionName]] "Unlink"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonX",
							'OnAction', function (self, host, source)
								local obj = ResolvePropObj(host.context)
								obj:Disconnect()
							end,
							'__condition', function (parent, context) return ShowParadoxDisconnectButton() end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "logout",
							'ActionName', T(870730357845, --[[XTemplate ParadoxAccountDialog ActionName]] "Log Out"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonY",
							'OnAction', function (self, host, source)
								local obj = ResolvePropObj(host.context)
								obj:LogOut()
							end,
							'__condition', function (parent, context) return ShowParadoxLogOutButton() end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "signup",
							'ActionName', T(12310, --[[XTemplate ParadoxAccountDialog ActionName]] "Create Account"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonX",
							'OnAction', function (self, host, source)
								ResolvePropObj(host.context):ClearSavedParams()
								host:SetMode("signup")
								host:UpdateActionViews(host)
							end,
							'__condition', function (parent, context) return not g_ParadoxAccountLoggedIn end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "lost password",
							'ActionName', T(480995957868, --[[XTemplate ParadoxAccountDialog ActionName]] "Forgot Password?"),
							'ActionToolbar', "ActionBarRight",
							'ActionGamepad', "LeftTrigger",
							'__condition', function (parent, context) return false end,
						}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "signup",
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "ParadoxAccountSignUp",
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "signup",
							'ActionName', T(12310, --[[XTemplate ParadoxAccountDialog ActionName]] "Create Account"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonY",
							'ActionState', function (self, host)
								local obj = ResolvePropObj(host.context)
								if not obj:CanCreateAccount() or obj.creating_account then
									return "disabled"
								end
							end,
							'OnAction', function (self, host, source)
								local obj = ResolvePropObj(host.context)
								obj:CreateAccount()
							end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "login",
							'ActionName', T(598975766059, --[[XTemplate ParadoxAccountDialog ActionName]] "Login"),
							'ActionToolbar', "ActionBarLeft",
							'ActionGamepad', "ButtonX",
							'OnAction', function (self, host, source)
								ResolvePropObj(host.context):ClearSavedParams()
								host:SetMode("login")
								host:UpdateActionViews(host)
							end,
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(1011, --[[XTemplate ParadoxAccountDialog ActionName]] "Close"),
						'ActionToolbar', "ActionBarRight",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ParadoxUIActionBars",
				}),
				}),
			}),
		}),
})

