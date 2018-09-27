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
			'comment', "build drone",
			'__context_of_kind', "RCRover",
			'__template', "InfopanelButton",
			'RolloverText', T{8460, --[[XTemplate ipRover RolloverText]] "Unpack an existing Drone Prefab to build a new Drone. Drone Prefabs can be created from existing Drones or in a Drone Assembler (requires research). This action can be used to quickly reassign Drones between controllers.<newline><newline>Available Drone Prefabs: <drone(available_drone_prefabs)>"},
			'RolloverTitle', T{349, --[[XTemplate ipRover RolloverTitle]] "Unpack Drone"},
			'RolloverHint', T{8461, --[[XTemplate ipRover RolloverHint]] "<left_click> Unpack Drone <em>Ctrl + <left_click></em> Unpack five Drones"},
			'RolloverHintGamepad', T{8462, --[[XTemplate ipRover RolloverHintGamepad]] "<ButtonA> Unpack Drone <ButtonX> Unpack five Drones"},
			'OnContextUpdate', function (self, context, ...)
self:SetEnabled(UICity.drone_prefabs > 0)
end,
			'OnPressParam', "UseDronePrefab",
			'OnPress', function (self, gamepad)
	self.context:UseDronePrefab(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:UseDronePrefab(true)
end
end,
			'Icon', "UI/Icons/IPButtons/drone_assemble.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "convert drone to drone prefab",
			'__context_of_kind', "RCRover",
			'__template', "InfopanelButton",
			'RolloverText', T{8665, --[[XTemplate ipRover RolloverText]] "Recalls a Drone and packs it into a Drone Prefab. Can be used to reassign Drones between controllers."},
			'RolloverDisabledText', T{8666, --[[XTemplate ipRover RolloverDisabledText]] "No available Drones."},
			'RolloverTitle', T{8667, --[[XTemplate ipRover RolloverTitle]] "Pack Drone for Reassignment"},
			'RolloverHint', T{8668, --[[XTemplate ipRover RolloverHint]] "<left_click> Pack Drone for reassignment <em>Ctrl + <left_click></em> Pack five Drones"},
			'RolloverHintGamepad', T{8669, --[[XTemplate ipRover RolloverHintGamepad]] "<ButtonA> Pack Drone for reassignment <ButtonX> Pack five Drones"},
			'OnContextUpdate', function (self, context, ...)
	self:SetEnabled(not not context:FindDroneToConvertToPrefab())
end,
			'OnPressParam', "ConvertDroneToPrefab",
			'OnPress', function (self, gamepad)
	self.context:ConvertDroneToPrefab(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ConvertDroneToPrefab(true)
end
end,
			'Icon', "UI/Icons/IPButtons/drone_dismantle.tga",
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
			'__condition', function (parent, context) return context:ShouldShowRouteButton() end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{266581508662, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'OnPressParam', "ToggleCreateRouteMode",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__context_of_kind', "Demolishable",
			'__condition', function (parent, context) return context:ShouldShowDemolishButton() end,
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
			'comment', "toggle auto mode",
			'__context_of_kind', "BaseRover",
			'__condition', function (parent, context) return context.has_auto_mode and g_RoverAIResearched end,
			'__template', "InfopanelButton",
			'RolloverText', T{325361555787, --[[XTemplate ipRover RolloverText]] "If Automated Mode is activated the RC Explorer will look for revealed anomalies and move to analyze them.<newline><newline>Current Status: <on_off(auto_mode_on)>"},
			'RolloverDisabledText', T{806760132448, --[[XTemplate ipRover RolloverDisabledText]] "Vehicle inactive."},
			'RolloverTitle', T{370544347739, --[[XTemplate ipRover RolloverTitle]] "Automated Mode"},
			'RolloverHint', T{7656, --[[XTemplate ipRover RolloverHint]] "<left_click> Toggle Automated Mode\n<em>Ctrl + <left_click></em> Toggle for all Rovers"},
			'RolloverHintGamepad', T{148065038595, --[[XTemplate ipRover RolloverHintGamepad]] "<ButtonA> Toggle Automated Mode\n<ButtonX> Toggle for all Rovers"},
			'OnPressParam', "ToggleAutoMode",
			'OnPress', function (self, gamepad)
self.context:ToggleAutoMode(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleAutoMode(true)
end
end,
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
			'RolloverText', T{10118, --[[XTemplate ipRover RolloverText]] "Contributes to the currently selected research project.<newline><newline>Lifetime research<right><research(research_points_lifetime)>"},
			'RolloverTitle', T{10119, --[[XTemplate ipRover RolloverTitle]] "Research Project <percent(ResearchProgress)>"},
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
			'RolloverText', T{4489, --[[XTemplate ipRover RolloverText]] "Proximity to a high number of Black Cubes may cause malfunctions."},
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
				'Text', T{4490, --[[XTemplate ipRover Text]] "All Drones were recalled and will remain in the Commander until deployed"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "RCRover",
			'__template', "InfopanelSection",
			'RolloverText', T{4492, --[[XTemplate ipRover RolloverText]] "Total number of Drones in the RC Commander."},
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
			'RolloverText', T{917384214249, --[[XTemplate ipRover RolloverText]] "Basic and Advanced resources available from this vehicle."},
			'Title', T{704943662903, --[[XTemplate ipRover Title]] "Resources carried"},
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Concrete") end,
				'__template', "InfopanelText",
				'Text', T{343032565187, --[[XTemplate ipRover Text]] "Concrete<right><concrete(Stored_Concrete)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Metals") end,
				'__template', "InfopanelText",
				'Text', T{455677282700, --[[XTemplate ipRover Text]] "Metals<right><metals(Stored_Metals)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Food") end,
				'__template', "InfopanelText",
				'Text', T{788345915802, --[[XTemplate ipRover Text]] "Food<right><food(Stored_Food)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_PreciousMetals") end,
				'__template', "InfopanelText",
				'Text', T{925417865592, --[[XTemplate ipRover Text]] "Rare Metals<right><preciousmetals(Stored_PreciousMetals)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Polymers") end,
				'__template', "InfopanelText",
				'Text', T{157677153453, --[[XTemplate ipRover Text]] "Polymers<right><polymers(Stored_Polymers)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Electronics") end,
				'__template', "InfopanelText",
				'Text', T{624861249564, --[[XTemplate ipRover Text]] "Electronics<right><electronics(Stored_Electronics)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_MachineParts") end,
				'__template', "InfopanelText",
				'Text', T{407728864620, --[[XTemplate ipRover Text]] "Machine Parts<right><machineparts(Stored_MachineParts)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return context:HasMember("GetStored_Fuel") end,
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
			'__template', "sectionPowerProduction",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionPowerGrid",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWarning",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

