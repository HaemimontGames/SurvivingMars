-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "GamepadCursorDlg",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return g_GamepadObjects end,
		'__class', "XDialog",
		'HAlign', "center",
		'VAlign', "center",
		'LayoutMethod', "VList",
		'FadeInTime', 50,
		'FadeOutTime', 500,
		'HandleKeyboard', false,
		'ChildrenHandleMouse', false,
		'OnContextUpdate', function (self, context, ...)
			self.idImage:OnContextUpdate(context)
		end,
		'FocusOnOpen', "",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idImage",
			'Margins', box(0, 35, 0, 0),
			'Dock', "top",
			'ImageFit', "stretch",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open(self, ...)",
				'func', function (self, ...)
					XImage.Open(self, ...)
					self:OnContextUpdate(self.parent.context)
					-- Thread to update and cursor size depending on camera angle
					self:CreateThread("UpdateThread", function(self)
						while true do
							WaitMsg("OnRender")
							
							local h = CalculateGamepadCursorSize(self)
							self:SetMinHeight(h)
							self:SetMaxHeight(h)
						end
					end, self)
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnContextUpdate(self, context)",
				'func', function (self, context)
					self:SetImage(GetPlatformSpecificImagePath(context:GetCursorStateImage()))
				end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'Id', "idButtonsContainer",
			'Dock', "bottom",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idImageY",
				'Dock', "left",
				'HAlign', "left",
				'VAlign', "top",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self:SetVisible(context:IsButtonActive("ButtonY"))
				end,
				'Translate', true,
				'Text', T(649120194813, --[[XTemplate GamepadCursorDlg Text]] "<ButtonY>"),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idImageX",
				'Dock', "left",
				'HAlign', "left",
				'VAlign', "top",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self:SetVisible(context:IsButtonActive("ButtonX"))
				end,
				'Translate', true,
				'Text', T(500955334824, --[[XTemplate GamepadCursorDlg Text]] "<ButtonX>"),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idImageA",
				'Dock', "left",
				'HAlign', "left",
				'VAlign', "top",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self:SetVisible(context:IsButtonActive("ButtonA"))
				end,
				'Translate', true,
				'Text', T(262988649795, --[[XTemplate GamepadCursorDlg Text]] "<ButtonA>"),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idImageB",
				'Dock', "left",
				'HAlign', "left",
				'VAlign', "top",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
					self:SetVisible(context:IsButtonActive("ButtonB"))
				end,
				'Translate', true,
				'Text', T(278990799792, --[[XTemplate GamepadCursorDlg Text]] "<ButtonB>"),
			}),
			}),
		}),
})

