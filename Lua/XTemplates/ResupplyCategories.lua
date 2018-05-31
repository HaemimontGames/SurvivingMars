-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResupplyCategories",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Id', "idCategories",
		'Padding', box(0, 65, 100, 50),
		'ContextUpdateOnOpen', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
self:SetPadding(GetSafeMargins(self:GetPadding()))
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBar",
			'MinWidth', 550,
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'Margins', box(0, 65, 0, 0),
			'HAlign', "right",
			'MinWidth', 550,
			'MaxWidth', 550,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Dock', "top",
				'HAlign', "right",
				'TextFont', "PGLandingPosDetails",
				'TextColor', RGBA(118, 163, 222, 255),
				'Translate', true,
				'Text', T{407610261475, --[[XTemplate ResupplyCategories Text]] "<RocketTypeTitle>"},
				'TextHAlign', "right",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Dock', "top",
				'HAlign', "right",
				'TextFont', "PGLandingPosDetails",
				'TextColor', RGBA(118, 163, 222, 255),
				'RolloverTextColor', RGBA(118, 163, 222, 255),
				'Translate', true,
				'Text', T{198049262709, --[[XTemplate ResupplyCategories Text]] "Cargo Capacity <white><Capacity> kg</white><newline>Funding <white><funding(Funding)></white><newline>Available Rockets <white><AvailableRockets>/<TotalRockets></white>"},
				'TextHAlign', "right",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(-340, 20, -40, -126),
				'Dock', "top",
				'Image', "UI/Common/pm_pad_large.tga",
				'FrameBox', box(320, 0, 40, 0),
				'SqueezeY', false,
				'FlipY', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XLabel",
				'Id', "idTitle",
				'Padding', box(22, 2, 2, 2),
				'Dock', "top",
				'HAlign', "left",
				'TextFont', "PGMissionDescrTitle",
				'TextColor', RGBA(96, 135, 185, 255),
				'Translate', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplateList",
				'Id', "idList",
				'BorderWidth', 0,
				'Dock', "top",
				'LayoutVSpacing', 10,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
				'OnContextUpdate', function (self, context, ...)
XContentTemplateList.OnContextUpdate(self, context, ...)
if self.focused_item then
	self.focused_item =  Min(self.focused_item, #self)
	self:DeleteThread("select")
	self:CreateThread("select", function()
		self:SetSelection(self.focused_item)
	end)
end
end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "MenuEntrySmall",
					'RolloverTemplate', "Rollover",
					'RolloverDisabledText', T{628712416014, --[[XTemplate ResupplyCategories RolloverDisabledText]] "Rockets unavailable."},
					'Id', "idCargo",
					'HAlign', "right",
					'OnContextUpdate', function (self, context, ...)
if g_UIAvailableRockets <= 0 or (g_Tutorial and not g_Tutorial.EnableCargoRockets) then
	self:SetEnabled(false)
end
end,
					'FXMouseIn', "RocketTypeItemHover",
					'FXPress', "RocketTypeItemClick",
					'OnPress', function (self, gamepad)
local host = GetXDialog(self)
host:SetMode("cargo")
end,
					'DisabledRolloverTextColor', RGBA(130, 130, 130, 255),
					'Text', T{1115, --[[XTemplate ResupplyCategories Text]] "Cargo Rocket"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "MenuEntrySmall",
					'RolloverTemplate', "Rollover",
					'RolloverDisabledText', T{8541, --[[XTemplate ResupplyCategories RolloverDisabledText]] "<PassengerRocketDisabledRolloverText>"},
					'RolloverDisabledTitle', T{8542, --[[XTemplate ResupplyCategories RolloverDisabledTitle]] "<PassengerRocketDisabledRolloverTitle>"},
					'Id', "idPassenger",
					'HAlign', "right",
					'OnContextUpdate', function (self, context, ...)
if g_UIAvailableRockets <= 0 or not AreNewColonistsAccepted() then
	self:SetEnabled(false)
end
end,
					'FXMouseIn', "RocketTypeItemHover",
					'FXPress', "RocketTypeItemClick",
					'OnPress', function (self, gamepad)
local host = GetXDialog(self)
host:SetMode("passengers")
end,
					'DisabledRolloverTextColor', RGBA(130, 130, 130, 255),
					'Text', T{1116, --[[XTemplate ResupplyCategories Text]] "Passenger Rocket"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return UICity and #(UICity.labels.SpaceElevator or empty_table) > 0 and UICity.labels.SpaceElevator[1].working end,
					'__template', "MenuEntrySmall",
					'RolloverTemplate', "Rollover",
					'RolloverDisabledText', T{855487073078, --[[XTemplate ResupplyCategories RolloverDisabledText]] "Space Elavator Unavailable."},
					'Id', "idElevator",
					'HAlign', "right",
					'FXMouseIn', "RocketTypeItemHover",
					'FXPress', "RocketTypeItemClick",
					'OnPress', function (self, gamepad)
if UICity then
	UICity.launch_elevator_mode = true
end
local host = GetXDialog(self)
host:SetMode("cargo")
end,
					'DisabledRolloverTextColor', RGBA(130, 130, 130, 255),
					'Text', T{1120, --[[XTemplate ResupplyCategories Text]] "Space Elevator"},
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "buyRocket",
					'ActionName', T{5454, --[[XTemplate ResupplyCategories ActionName]] "BUY ROCKET"},
					'ActionToolbar', "ActionBar",
					'ActionGamepad', "ButtonY",
					'OnAction', function (self, host, source, toggled)
BuyRocket(host)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "close",
					'ActionName', T{4523, --[[XTemplate ResupplyCategories ActionName]] "CLOSE"},
					'ActionToolbar', "ActionBar",
					'ActionShortcut', "Escape",
					'ActionGamepad', "ButtonB",
					'OnAction', function (self, host, source, toggled)
host.parent.parent:Close()
end,
				}),
				}),
			}),
		}),
})

