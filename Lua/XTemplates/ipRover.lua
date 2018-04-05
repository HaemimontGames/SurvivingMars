-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipRover",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "BaseRover",
		'__template', "Infopanel",
		'Description', T{313911890683, --[[XTemplate ipRover Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "move",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{677988939612, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'RolloverTitle', T{4422, --[[XTemplate ipRover RolloverTitle]] "Move / Interact"},
			'RolloverDisabledTitle', T{738958862221, --[[XTemplate ipRover RolloverDisabledTitle]] "Move / Interact"},
			'OnPressParam', "ToggleControlMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "deploy drones",
			'__context_of_kind', "RCRover",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{806760132448, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "ToggleSiegeMode",
			'OnPress', function (self, gamepad)
self.context:ToggleSiegeMode(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleSiegeMode(true)
end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "load",
			'__context_of_kind', "RCTransport",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{504147094031, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "LoadResource",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "unload",
			'__context_of_kind', "RCTransport",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{381999431042, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "UnloadResource",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "route",
			'__context_of_kind', "RCTransport",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{266581508662, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "ToggleCreateRouteMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "recharge",
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{221351751895, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "ToggleRechargeMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "Demolishable",
			'__condition', function (parent, context) return context:CanDemolish() end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{124367847840, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'RolloverTitle', T{3973, --[[XTemplate ipRover RolloverTitle]] "Salvage"},
			'RolloverHintGamepad', T{7657, --[[XTemplate ipRover RolloverHintGamepad]] "<ButtonY> Activate"},
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
			'__context_of_kind', "RCRover",
			'__template', "sectionServiceArea",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{49, --[[XTemplate ipRover Title]] "Status"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{51, --[[XTemplate ipRover Text]] "<ui_command>"},
			}),
			PlaceObj('XTemplateWindow', {
				'__context_of_kind', "ExplorerRover",
				'__class', "XFrameProgress",
				'Margins', box(10, 15, 10, 14),
				'FoldWhenHidden', true,
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.command == "Analyze")
XFrameProgress.OnContextUpdate(self, context, ...)
end,
				'BindTo', "ScanAnomalyProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrameProgress",
				'Margins', box(10, 15, 10, 14),
				'FoldWhenHidden', true,
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.command == "Malfunction")
XFrameProgress.OnContextUpdate(self, context, ...)
end,
				'BindTo', "MalfunctionRepairProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "ExplorerRover",
			'__template', "InfopanelSection",
			'RolloverText', T{765045268446, --[[XTemplate ipRover RolloverText]] "Contributes to the currently selected research project.<newline><newline>Lifetime research<right><research(research_points_lifetime)>"},
			'RolloverTitle', T{308, --[[XTemplate ipRover RolloverTitle]] "Research Project <percent(ResearchProgress)>"},
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(UICity:IsTechResearched("ExplorerAI"))
XSection.OnContextUpdate(self, context, ...)
end,
			'Title', T{526919900594, --[[XTemplate ipRover Title]] "<UIResearchProject>"},
			'Icon', "UI/Icons/Sections/research_1.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{445070088246, --[[XTemplate ipRover Text]] "Research per Sol<right><research(EstimatedDailyProduction)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{8017, --[[XTemplate ipRover Text]] "Collaboration loss<right><research(EstimatedDailyLoss)>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCRover",
			'__condition', function (parent, context) return (rawget(context, "black_cube_interaction_perc_for_ui") or 0) > 0 end,
			'__template', "InfopanelSection",
			'RolloverText', T{4489, --[[XTemplate ipRover RolloverText]] "Proximity to a high number of Black Cubes may cause malfunctions"},
			'Title', T{405, --[[XTemplate ipRover Title]] "Proximity to Black Cubes"},
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{407, --[[XTemplate ipRover Text]] "<em><percent(black_cube_interaction_perc_for_ui)></em> chance to malfunction"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCRover",
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.command ~= "Malfunction" and not context.sieged_state)
end,
			'Title', T{277, --[[XTemplate ipRover Title]] "Attention"},
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{4490, --[[XTemplate ipRover Text]] "All Drones were recalled and will remain in the Rover until deployed"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCRover",
			'__template', "InfopanelSection",
			'RolloverText', T{4492, --[[XTemplate ipRover RolloverText]] "Total number of Drones in the RC Rover."},
			'RolloverTitle', T{517, --[[XTemplate ipRover RolloverTitle]] "Drones"},
			'OnContextUpdate', function (self, context, ...)
				self:SetVisible(context.command ~= "Dead")
				XSection.OnContextUpdate(self, context, ...)
end,
			'Title', T{4491, --[[XTemplate ipRover Title]] "Drones<right><count(drones)>/<MaxDrones>"},
			'Icon', "UI/Icons/Sections/drone.tga",
			'TitleHAlign', "stretch",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{935141416350, --[[XTemplate ipRover Text]] "<DronesStatusText>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.dust_devils)
XText.OnContextUpdate(self, context, ...)
end,
				'Text', T{4447, --[[XTemplate ipRover Text]] "Slowed down <red><percent(DustDevilPenalty)></red> by a Dust Devil"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCTransport",
			'__template', "InfopanelSection",
			'RolloverText', T{917384214249, --[[XTemplate ipRover RolloverText]] "Basic and Advanced resources available from this vehicle"},
			'Title', T{704943662903, --[[XTemplate ipRover Title]] "Resources carried"},
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{343032565187, --[[XTemplate ipRover Text]] "Concrete<right><concrete(Stored_Concrete)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{455677282700, --[[XTemplate ipRover Text]] "Metals<right><metals(Stored_Metals)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{788345915802, --[[XTemplate ipRover Text]] "Food<right><food(Stored_Food)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{925417865592, --[[XTemplate ipRover Text]] "Rare Metals<right><preciousmetals(Stored_PreciousMetals)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{157677153453, --[[XTemplate ipRover Text]] "Polymers<right><polymers(Stored_Polymers)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{624861249564, --[[XTemplate ipRover Text]] "Electronics<right><electronics(Stored_Electronics)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{407728864620, --[[XTemplate ipRover Text]] "Machine Parts<right><machineparts(Stored_MachineParts)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{317815331128, --[[XTemplate ipRover Text]] "Fuel<right><fuel(Stored_Fuel)>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCTransport",
			'__template', "InfopanelSection",
			'RolloverText', T{725519231960, --[[XTemplate ipRover RolloverText]] "Available storage space. This vehicle will stop gathering resources once full."},
			'RolloverTitle', T{109035890389, --[[XTemplate ipRover RolloverTitle]] "Capacity"},
			'Title', T{452762661451, --[[XTemplate ipRover Title]] "Capacity<right><resource(StoredAmount)>/<resource(max_shared_storage)>"},
			'Icon', "UI/Icons/Sections/storage.tga",
			'TitleHAlign', "stretch",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{39, --[[XTemplate ipRover RolloverText]] "Vehicles can recharge their batteries from active Power grids. Vehicles are also able to recharge each other, equalizing the Power in their batteries.<newline><newline><left><battery_ui_str>"},
			'RolloverTitle', T{38, --[[XTemplate ipRover RolloverTitle]] "Battery  <percent(BatteryPerc)>"},
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.command ~= "Dead")
end,
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
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

