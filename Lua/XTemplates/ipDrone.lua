-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipDrone",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Drone",
		'__template', "Infopanel",
		'Description', T{313911890683, --[[XTemplate ipDrone Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{308379151314, --[[XTemplate ipDrone RolloverDisabledText]] "Vehicle Inactive."},
			'RolloverTitle', T{4422, --[[XTemplate ipDrone RolloverTitle]] "Move / Interact"},
			'RolloverDisabledTitle', T{485959427490, --[[XTemplate ipDrone RolloverDisabledTitle]] "Move / Interact"},
			'OnPressParam', "ToggleControlMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{750759453664, --[[XTemplate ipDrone RolloverDisabledText]] "Vehicle Inactive."},
			'RolloverTitle', T{4427, --[[XTemplate ipDrone RolloverTitle]] "Reassign"},
			'RolloverDisabledTitle', T{926548406718, --[[XTemplate ipDrone RolloverDisabledTitle]] "Reassign"},
			'OnPressParam', "ToggleReassignInteractionMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{136037016366, --[[XTemplate ipDrone RolloverDisabledText]] "Vehicle Inactive."},
			'RolloverTitle', T{8725, --[[XTemplate ipDrone RolloverTitle]] "Reassign All"},
			'RolloverDisabledTitle', T{8725, --[[XTemplate ipDrone RolloverDisabledTitle]] "Reassign All"},
			'OnPressParam', "ToggleReassignAllInteractionMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{136037016366, --[[XTemplate ipDrone RolloverDisabledText]] "Vehicle Inactive."},
			'RolloverTitle', T{4433, --[[XTemplate ipDrone RolloverTitle]] "Perform Maintenance"},
			'RolloverDisabledTitle', T{636653157928, --[[XTemplate ipDrone RolloverDisabledTitle]] "Perform Maintenance"},
			'OnPressParam', "ToggleMaintenanceInteractionMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverText', T{4432, --[[XTemplate ipDrone RolloverText]] "Drops any carried resource."},
			'RolloverDisabledText', T{448814888293, --[[XTemplate ipDrone RolloverDisabledText]] "<DropCarriedResourceFromUIDisabledRollover>"},
			'RolloverTitle', T{4431, --[[XTemplate ipDrone RolloverTitle]] "Drop Carried Resource"},
			'RolloverDisabledTitle', T{404479069795, --[[XTemplate ipDrone RolloverDisabledTitle]] "Drop Carried Resource"},
			'OnPressParam', "DropCarriedResourceFromUI",
			'Icon', "UI/Icons/IPButtons/unload.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "Demolishable",
			'__condition', function (parent, context) return context:ShouldShowDemolishButton() end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{367823728879, --[[XTemplate ipDrone RolloverDisabledText]] "Vehicle inactive."},
			'RolloverTitle', T{3973, --[[XTemplate ipDrone RolloverTitle]] "Salvage"},
			'RolloverDisabledTitle', T{640517755907, --[[XTemplate ipDrone RolloverDisabledTitle]] "Salvage"},
			'RolloverHintGamepad', T{7657, --[[XTemplate ipDrone RolloverHintGamepad]] "<ButtonY> Activate"},
			'OnContextUpdate', function (self, context, ...)
local refund = context:GetRefundResources() or empty_table
local rollover = T{7824, "Destroy this Drone."}
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
			'Title', T{49, --[[XTemplate ipDrone Title]] "Status"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{51, --[[XTemplate ipDrone Text]] "<ui_command>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{584248706535, --[[XTemplate ipDrone Text]] "Carrying<right><ResourceAmount>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{682763161598, --[[XTemplate ipDrone Text]] "<DestName>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{643657264628, --[[XTemplate ipDrone Title]] "<left>Commanded by<right><h SelectCommandCenter InfopanelSelect><CommandCenterName></h>"},
			'Icon', "UI/Icons/Sections/facility.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{4445, --[[XTemplate ipDrone RolloverText]] "Drones will seek a recharge station on low battery. Powered down Drones can be recharged by maintenance Drones or RC Commanders."},
			'RolloverTitle', T{7608, --[[XTemplate ipDrone RolloverTitle]] "Battery  <percent(battery,battery_max)>"},
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
				'BindTo', "BatteryProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return g_ColdWave end,
				'__template', "InfopanelText",
				'Text', T{544163488314, --[[XTemplate ipDrone Text]] "Using <red><percent(ColdPenalty)></red> more Power due to freezing weather"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context.dust_devils end,
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
self:SetVisible(not not context.dust_devils)
XText.OnContextUpdate(self, context, ...)
end,
				'Text', T{222599397553, --[[XTemplate ipDrone Text]] "Slowed down <red><percent(DustDevilPenalty)></red> by a Dust Devil"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{4449, --[[XTemplate ipDrone RolloverText]] "Dust Accumulated<right><percent(dust)>"},
			'RolloverTitle', T{4448, --[[XTemplate ipDrone RolloverTitle]] "Dust"},
			'Icon', "UI/Icons/Sections/dust.tga",
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
if self.Progress > 90 then
  image = "UI/Infopanel/progress_bar_red.tga"
end
self:SetProgressImage(image)
end,
				'BindTo', "dust",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWarning",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

