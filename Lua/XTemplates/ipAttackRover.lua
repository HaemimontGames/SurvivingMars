-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipAttackRover",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "AttackRover",
		'__template', "Infopanel",
		'Description', T{10, --[[XTemplate ipAttackRover Description]] "<Description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "move",
			'__condition', function (parent, context) return context.reclaimed and not context:CanBeRepaired() end,
			'__template', "InfopanelButton",
			'RolloverTitle', T{4422, --[[XTemplate ipAttackRover RolloverTitle]] "Move / Interact"},
			'OnPressParam', "ToggleControlMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "repair",
			'__condition', function (parent, context) return context:CanBeRepaired() and UICity.mystery and UICity.mystery.enable_rover_repair and context.can_repair end,
			'__template', "InfopanelButton",
			'OnPressParam', "ToggleRepair",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "Demolishable",
			'__condition', function (parent, context) return context:CanDemolish() end,
			'__template', "InfopanelButton",
			'RolloverTitle', T{3973, --[[XTemplate ipAttackRover RolloverTitle]] "Salvage"},
			'RolloverHintGamepad', T{7657, --[[XTemplate ipAttackRover RolloverHintGamepad]] "<ButtonY> Activate"},
			'OnContextUpdate', function (self, context, ...)
local refund = context:GetRefundResources() or empty_table
local rollover = T{7825, "Destroy this Rover."}
if #refund > 0 then
	rollover = rollover .. "<newline><newline>" .. T{7823, "<UIRefundRes> will be refunded upon salvage."}
end
self:SetRolloverText(rollover)
context:ToggleDemolish_Update(self)
end,
			'OnPressParam', "ToggleDemolish",
			'Icon', "UI/Icons/IPButtons/salvage_1.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonDown(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonDown(false)
elseif button == "ButtonX" then
	return self:OnButtonDown(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonUp(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonUp(false)
elseif button == "ButtonX" then
	return self:OnButtonUp(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{49, --[[XTemplate ipAttackRover Title]] "Status"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{51, --[[XTemplate ipAttackRover Text]] "<ui_command>"},
			}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return context.command == "Malfunction" or context.command == "NoBattery" end,
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 15, 10, 14),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'BindTo', "MalfunctionRepairProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return UICity.mystery and UICity.mystery.can_shoot_rovers end,
			'__template', "InfopanelSection",
			'RolloverText', T{944541850261, --[[XTemplate ipAttackRover RolloverText]] "The structural integrity of this vehicle will decrease on each missile hit. The vehicle will be disabled at 0 integrity."},
			'RolloverTitle', T{678706263894, --[[XTemplate ipAttackRover RolloverTitle]] "Structural Integrity <percent(current_health, max_health)>"},
			'Icon', "UI/Icons/Sections/construction.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__context_of_kind', "AttackRover",
				'__class', "XFrameProgress",
				'Id', "idHealth",
				'Margins', box(10, 15, 10, 14),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'BindTo', "HpProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context.reclaimed end,
			'__template', "InfopanelSection",
			'RolloverText', T{7606, --[[XTemplate ipAttackRover RolloverText]] "Vehicles can recharge their batteries from active Power grids. Vehicles are also able to recharge each other, equalizing the Power in their batteries.<newline><newline>Power<right><percent(BatteryPerc)><newline><left><battery_ui_str>"},
			'RolloverTitle', T{7607, --[[XTemplate ipAttackRover RolloverTitle]] "Battery"},
			'Icon', "UI/Icons/Sections/batery.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 15, 10, 14),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'OnContextUpdate', function (self, context, ...)
XFrameProgress.OnContextUpdate(self, context, ...)
local image = "UI/Infopanel/progress_bar_green.tga"
if self.Progress < 10 then
  image = "UI/Infopanel/progress_bar_red.tga"
end
self:SetProgressImage(image)
end,
				'BindTo', "BatteryPerc",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWarning",
		}),
		}),
})

