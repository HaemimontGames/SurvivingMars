-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIParadoxAccount",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return PDXAccountObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Id', "idPopUp",
		'HostInParent', true,
		'InitialMode', "login",
		'InternalModes', "login,signup",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
local content = self:ResolveId("idContent")
if content then
	content:SetChildrenHandleMouse(false)
end
XDialog.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
local content = self:ResolveId("idContent")
if content then
	content:SetChildrenHandleMouse(true)
end
ModsUIClosePopup(self.parent)
XDialog.OnDelete(self, ...)
end,
		}),
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
context:SetDialog(parent)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Background', RGBA(255, 255, 255, 185),
			'FocusedBackground', RGBA(255, 255, 255, 185),
			'Image', "UI/Mods/Circle32Black.tga",
			'ImageScale', point(500, 500),
			'FrameBox', box(15, 15, 15, 15),
			'SqueezeX', false,
			'SqueezeY', false,
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
					'ActionName', T{598975766059, --[[XTemplate ModsUIParadoxAccount ActionName]] "Login"},
					'ActionToolbar', "ActionBarLeft",
					'ActionShortcut', "Enter",
					'ActionGamepad', "ButtonY",
					'ActionState', function (self, host)
local obj = ResolvePropObj(host.idPopUp.context)
return (obj.loading or g_PopsAttemptingLogin) and "disabled"
end,
					'OnAction', function (self, host, source)
local obj = ResolvePropObj(host.idPopUp.context)
obj:Login()
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "signup",
					'ActionName', T{373509942742, --[[XTemplate ModsUIParadoxAccount ActionName]] "Sign Up"},
					'ActionToolbar', "ActionBarLeft",
					'ActionGamepad', "ButtonX",
					'OnAction', function (self, host, source)
host.idPopUp:SetMode("signup")
host:UpdateActionViews(host)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "lost password",
					'ActionName', T{480995957868, --[[XTemplate ModsUIParadoxAccount ActionName]] "Forgot Password?"},
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
					'ActionName', T{373509942742, --[[XTemplate ModsUIParadoxAccount ActionName]] "Sign Up"},
					'ActionToolbar', "ActionBarLeft",
					'ActionGamepad', "ButtonY",
					'ActionState', function (self, host)
local obj = ResolvePropObj(host.idPopUp.context)
if not obj:CanCreateAccount() or obj.creating_account then
	return "disabled"
end
end,
					'OnAction', function (self, host, source)
local obj = ResolvePropObj(host.idPopUp.context)
obj:CreateAccount()
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "login",
					'ActionName', T{598975766059, --[[XTemplate ModsUIParadoxAccount ActionName]] "Login"},
					'ActionToolbar', "ActionBarLeft",
					'ActionGamepad', "ButtonX",
					'OnAction', function (self, host, source)
host.idPopUp:SetMode("login")
host:UpdateActionViews(host)
end,
				}),
				}),
			PlaceObj('XTemplateAction', {
				'ActionId', "cancel",
				'ActionName', T{3687, --[[XTemplate ModsUIParadoxAccount ActionName]] "Cancel"},
				'ActionToolbar', "ActionBarRight",
				'ActionShortcut', "Escape",
				'ActionGamepad', "ButtonB",
				'OnAction', function (self, host, source)
ModsUIClosePopup(host)
host:UpdateActionViews(host)
end,
			}),
			}),
		}),
})

