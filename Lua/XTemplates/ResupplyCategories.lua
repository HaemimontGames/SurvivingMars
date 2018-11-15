-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResupplyCategories",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Id', "idCategories",
		'Padding', box(60, 68, 0, 25),
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
			'__template', "ActionBarNew",
			'Margins', box(55, 0, 0, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'HAlign', "left",
			'MinWidth', 550,
			'MaxWidth', 550,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleNew",
				'Margins', box(55, 0, 0, 0),
				'Title', T{561537249557, --[[XTemplate ResupplyCategories Title]] "RESUPPLY"},
				'SmallImage', true,
			}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(55, 30, 0, 30),
				'Dock', "top",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 40,
			}, {
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem1",
						'Translate', true,
						'Text', T{3499, --[[XTemplate ResupplyCategories Text]] "Cargo Capacity"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem1",
						'Translate', true,
						'Text', T{3613, --[[XTemplate ResupplyCategories Text]] "Funding"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem1",
						'Translate', true,
						'Text', T{620347027255, --[[XTemplate ResupplyCategories Text]] "Available Rockets"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem1",
						'Translate', true,
						'Text', T{602355606532, --[[XTemplate ResupplyCategories Text]] "Available Supply Pods"},
					}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GetMissionSponsor().passenger_pod_class end,
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem1",
						'Translate', true,
						'Text', T{704448862257, --[[XTemplate ResupplyCategories Text]] "Passenger Pods"},
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem4",
						'Translate', true,
						'Text', T{270405570569, --[[XTemplate ResupplyCategories Text]] "<Capacity> kg"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem4",
						'Translate', true,
						'Text', T{134782360990, --[[XTemplate ResupplyCategories Text]] "<funding(Funding)>"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem4",
						'Translate', true,
						'Text', T{778838088243, --[[XTemplate ResupplyCategories Text]] "<AvailableRockets>/<TotalRockets>"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem4",
						'Translate', true,
						'Text', T{443216200399, --[[XTemplate ResupplyCategories Text]] "<AvailableSupplyPods>/<TotalSupplyPods>"},
					}),
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GetMissionSponsor().passenger_pod_class end,
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'HandleMouse', false,
						'TextStyle', "ListItem4",
						'Translate', true,
						'Text', T{115432375938, --[[XTemplate ResupplyCategories Text]] "<AvailablePassengerPods>"},
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(55, 0, 0, 0),
				'Dock', "top",
				'HAlign', "left",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-350, 0, 0, 0),
					'Dock', "box",
					'MinWidth', 794,
					'Image', "UI/CommonNew/pg_action_bar.tga",
					'FrameBox', box(42, 0, 341, 0),
					'TileFrame', true,
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'HandleMouse', false,
					'TextStyle', "MediumHeader",
					'Translate', true,
					'Text', T{4067, --[[XTemplate ResupplyCategories Text]] "SELECT ROCKET"},
					'HideOnEmpty', true,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(0, 25, 0, 20),
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Target', "idList",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'Margins', box(39, 0, 0, 0),
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'LayoutVSpacing', 10,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
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
						'__template', "ResupplyCategoryItem",
						'RolloverDisabledText', T{628712416014, --[[XTemplate ResupplyCategories RolloverDisabledText]] "Rockets unavailable."},
						'RolloverDisabledTitle', T{1115, --[[XTemplate ResupplyCategories RolloverDisabledTitle]] "Cargo Rocket"},
						'Id', "idCargo",
						'OnContextUpdate', function (self, context, ...)
if g_UIAvailableRockets <= 0 or (g_Tutorial and not g_Tutorial.EnableCargoRockets) then
	self:SetEnabled(false)
end
end,
						'OnPress', function (self, gamepad)
if UICity then
	UICity.launch_mode = "rocket"
end
if g_CargoMode ~= "rocket" then
	ClearRocketCargo()
	g_CargoMode = "rocket"
end
local host = GetDialog(self)
host:SetMode("cargo", "resupply")
end,
						'Icon', "UI/CommonNew/re_icon_rocket.tga",
						'Text', T{357083234594, --[[XTemplate ResupplyCategories Text]] "CARGO ROCKET"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "ResupplyCategoryItem",
						'RolloverDisabledText', T{8541, --[[XTemplate ResupplyCategories RolloverDisabledText]] "<PassengerRocketDisabledRolloverText>"},
						'RolloverDisabledTitle', T{8542, --[[XTemplate ResupplyCategories RolloverDisabledTitle]] "<PassengerRocketDisabledRolloverTitle>"},
						'Id', "idPassenger",
						'OnContextUpdate', function (self, context, ...)
if g_UIAvailableRockets <= 0 or not AreNewColonistsAccepted() then
	self:SetEnabled(false)
end
end,
						'OnPress', function (self, gamepad)
if UICity then
	UICity.launch_mode = "rocket"
end
local host = GetDialog(self)
host:SetMode("passengers")
end,
						'Icon', "UI/CommonNew/re_icon_rocket.tga",
						'Text', T{11630, --[[XTemplate ResupplyCategories Text]] "PASSENGER ROCKET"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__condition', function (parent, context) return UICity and #(UICity.labels.SpaceElevator or empty_table) > 0 and UICity.labels.SpaceElevator[1].working end,
						'__template', "ResupplyCategoryItem",
						'RolloverDisabledText', T{10457, --[[XTemplate ResupplyCategories RolloverDisabledText]] "Space Elevator is unavailable"},
						'RolloverDisabledTitle', T{1120, --[[XTemplate ResupplyCategories RolloverDisabledTitle]] "Space Elevator"},
						'Id', "idElevator",
						'OnContextUpdate', function (self, context, ...)
if g_UIAvailableRockets <= 0 or not AreNewColonistsAccepted() then
	self:SetEnabled(false)
end
end,
						'OnPress', function (self, gamepad)
if UICity then
	UICity.launch_mode = "elevator"
end
if g_CargoMode ~= "elevator" then
	ClearRocketCargo()
	g_CargoMode = "elevator"
end
local host = GetDialog(self)
host:SetMode("cargo", "resupply")
end,
						'Icon', "UI/CommonNew/re_icon_space_elevator.tga",
						'Text', T{11631, --[[XTemplate ResupplyCategories Text]] "SPACE ELEVATOR"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__condition', function (parent, context) return GetMissionSponsor().pod_class end,
						'__template', "ResupplyCategoryItem",
						'RolloverDisabledText', T{10872, --[[XTemplate ResupplyCategories RolloverDisabledText]] "Pods are unavailable."},
						'RolloverDisabledTitle', T{10873, --[[XTemplate ResupplyCategories RolloverDisabledTitle]] "<PodItemText>"},
						'Id', "idCargoPod",
						'OnContextUpdate', function (self, context, ...)
if context:GetNumAvailablePods("SupplyPod") == 0 and UICity.funding < GetMissionSponsor().pod_price then
	self:SetEnabled(false)
end
end,
						'OnPress', function (self, gamepad)
if UICity then
	UICity.launch_mode = "pod"
end
if g_CargoMode ~= "pod" then
	ClearRocketCargo()
	g_CargoMode = "pod"
end

if self.context:GetNumAvailablePods("SupplyPod") == 0 then
	CreateRefundablePod(GetMissionSponsor().pod_class, "SupplyPod")
end

local host = GetDialog(self)
host:SetMode("cargo", "resupply")
end,
						'Icon', "UI/CommonNew/re_icon_drop_pod.tga",
						'Text', T{10873, --[[XTemplate ResupplyCategories Text]] "<PodItemText>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "AddAdditionalSupplyCategories",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "close",
						'ActionName', T{4523, --[[XTemplate ResupplyCategories ActionName]] "CLOSE"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source)
host.parent.parent:Close()
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "buyRocket",
						'ActionName', T{5454, --[[XTemplate ResupplyCategories ActionName]] "BUY ROCKET"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnAction', function (self, host, source)
BuyRocket(host)
end,
					}),
					}),
				}),
			}),
		}),
})

