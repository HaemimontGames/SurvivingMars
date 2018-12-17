-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customRocketExpedition",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "SupplyRocket",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "cancel expedition",
			'__condition', function (parent, context) return context:CanCancel() end,
			'__template', "InfopanelButton",
			'RolloverText', T(786602256921, --[[XTemplate customRocketExpedition RolloverText]] "Cancel the current expedition"),
			'RolloverTitle', T(311734996852, --[[XTemplate customRocketExpedition RolloverTitle]] "Cancel Expedition"),
			'Id', "idCancelExpedition",
			'FoldWhenHidden', true,
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:CanCancel())
end,
			'OnPress', function (self, gamepad)
CancelExpedition(self.context)
end,
			'Icon', "UI/Icons/IPButtons/cancel.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "auto export",
			'__condition', function (parent, context) return context:IsLaunchValid() and context.expedition and context.expedition.route_id end,
			'__template', "InfopanelButton",
			'RolloverHint', T(10110, --[[XTemplate customRocketExpedition RolloverHint]] "<left_click> Activate<newline><em>"),
			'OnContextUpdate', function (self, context, ...)
if context.expedition and not context.expedition.route then
	self:SetIcon("UI/Icons/IPButtons/automated_mode_off.tga")
	self:SetRolloverTitle(T(7814, "Automated Mode"))
	self:SetRolloverText(T(7815, "Automated Mode not possible while Rare Metal exports are forbidden."))
	self:SetEnabled(false)
else
	self:SetEnabled(true)
	if context.auto_export then
		self:SetIcon("UI/Icons/IPButtons/automated_mode_on.tga")
		self:SetRolloverTitle(T(7814, "Automated Mode"))
		self:SetRolloverText(T{11648, "If Automated mode is activated the Rocket will repeatedly travel to the Rival Colony and back while exchanging the negotiated resources. It'll land on the same amount and will launch to the rival when the cargo hold is full and the rocket is refueld.", context})
		self:SetRolloverHint(T(10111, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Activate Manual Mode <newline><em>"))
		self:SetRolloverHintGamepad(T(10112, "<ButtonA> Activate Manual Mode <newline><em>"))
	else
		self:SetIcon("UI/Icons/IPButtons/automated_mode_off.tga")
		self:SetRolloverTitle(T(7814, "Automated Mode"))
		self:SetRolloverText(T{11648, "If Automated mode is activated the Rocket will repeatedly travel to the Rival Colony and back while exchanging the negotiated resources. It'll land on the same amount and will launch to the rival when the cargo hold is full and the rocket is refueld.", context})
		self:SetRolloverHint(T(8724, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Activate Automated Mode <newline><em>"))
		self:SetRolloverHintGamepad(T(10113, "<ButtonA> Activate Automated Mode <newline><em>"))
	end
end
end,
			'OnPressParam', "ToggleAutoExport",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "drones",
			'__template', "InfopanelSection",
			'RolloverText', T(260933228141, --[[XTemplate customRocketExpedition RolloverText]] "Drones commanded by the Rocket ship."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.landed and not context.cargo)
end,
			'Title', T(963695586350, --[[XTemplate customRocketExpedition Title]] "Drones<right><drone(DronesCount)>"),
			'Icon', "UI/Icons/Sections/drone.tga",
			'TitleHAlign', "stretch",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(134923339494, --[[XTemplate customRocketExpedition Text]] "<DronesStatusText>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "status",
			'__template', "InfopanelSection",
			'RolloverText', T(414, --[[XTemplate customRocketExpedition RolloverText]] "Current status of the Rocket."),
			'Title', T(49, --[[XTemplate customRocketExpedition Title]] "Status"),
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(301951063645, --[[XTemplate customRocketExpedition Text]] "<UIRocketStatus>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "payload",
			'__template', "InfopanelSection",
			'RolloverText', T(416, --[[XTemplate customRocketExpedition RolloverText]] "Payload of the Rocket."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.cargo)
end,
			'Title', T(415, --[[XTemplate customRocketExpedition Title]] "Payload"),
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(417, --[[XTemplate customRocketExpedition Text]] "<CargoManifest>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "expedition cargo",
			'__template', "InfopanelSection",
			'RolloverText', T(11252, --[[XTemplate customRocketExpedition RolloverText]] "The following payload is needed for the succesful completion of the mission. The Rocket won't launch itself until everything is loaded."),
			'OnContextUpdate', function (self, context, ...)
local visible = false
local expedition = context.expedition
if expedition and (expedition.export
	or expedition.num_drones or expedition.num_crew
	or expedition.rover_type) then
	visible = true
end
self:SetVisible(visible)
end,
			'Title', T(585890281334, --[[XTemplate customRocketExpedition Title]] "Required Payload"),
			'Icon', "UI/Icons/Sections/basic.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'comment', "metals",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.Metals or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(807216337504, --[[XTemplate customRocketExpedition Text]] "<resource('Metals' )><right><metals(ExportAmount_Metals, ExportTarget_Metals)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "concrete",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.Concrete or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(669532297816, --[[XTemplate customRocketExpedition Text]] "<resource('Concrete' )><right><concrete(ExportAmount_Concrete,ExportTarget_Concrete)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "food",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.Food or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(611737732106, --[[XTemplate customRocketExpedition Text]] "<resource('Food' )><right><food(ExportAmount_Food, ExportTarget_Food)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "polymers",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.Polymers or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(936245422528, --[[XTemplate customRocketExpedition Text]] "<resource('Polymers' )><right><polymers(ExportAmount_Polymers, ExportTarget_Polymers)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "electronics",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.Electronics or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(884086661379, --[[XTemplate customRocketExpedition Text]] "<resource('Electronics' )><right><electronics(ExportAmount_Electronics, ExportTarget_Electronics)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "machine parts",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local export = context.expedition and context.expedition.export
local amount = export and export.MachineParts or 0
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(357955187464, --[[XTemplate customRocketExpedition Text]] "<resource('MachineParts' )><right><machineparts(ExportAmount_MachineParts, ExportTarget_MachineParts)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "drones",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local n = context.expedition and context.expedition.num_drones or 0
self:SetVisible(n > 0)
self:SetText(self.Text)
end,
				'Text', T(851695389532, --[[XTemplate customRocketExpedition Text]] "Drones<right><drone(Crew_Drones, CrewTarget_Drones)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "colonists",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local expedition = context.expedition or empty_table
self:SetVisible((expedition.num_crew or 0) > 0)
self:SetText(self.Text)
end,
				'Text', T(917780390790, --[[XTemplate customRocketExpedition Text]] "<Crew_Specialization><right><colonist(Crew_Num, Crew_TargetNum)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "rover",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local rover = context.expedition and context.expedition.rover_type
self:SetVisible(not not rover)
self:SetText(self.Text)
end,
				'Text', T(382859997979, --[[XTemplate customRocketExpedition Text]] "<CrewRoverType><right><Crew_Rover>/<CrewTarget_Rover>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(145440802511, --[[XTemplate customRocketExpedition RolloverText]] "Determines the amount of tradable resource to load.\n\nExport Amount<right><resource(TradeAmount)>"),
			'RolloverHintGamepad', T(11553, --[[XTemplate customRocketExpedition RolloverHintGamepad]] "<LB> / <RB>    change export amount"),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:CanChangeTradeAmount())
end,
			'Title', T(504954621520, --[[XTemplate customRocketExpedition Title]] "Export Amount"),
			'Icon', "UI/Icons/Sections/facility.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSlider",
				'BindTo', "TradeAmount",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "unload",
			'__template', "InfopanelSection",
			'RolloverText', T(11253, --[[XTemplate customRocketExpedition RolloverText]] "The following cargo is not necessary for the mission and it's waiting to be unloaded. If you force launch the Rocket, the cargo will be dumped in orbit to provide space for the mission."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:HasExtraFuel() or context:GetStoredAmount() > 0)
end,
			'Title', T(761527590297, --[[XTemplate customRocketExpedition Title]] "Unloading"),
			'Icon', "UI/Icons/Sections/advanced.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'comment', "metals",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("Metals")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(696833816815, --[[XTemplate customRocketExpedition Text]] "<resource('Metals' )><right><metals(Stored_Metals)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "concrete",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("Concrete")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(729899810633, --[[XTemplate customRocketExpedition Text]] "<resource('Concrete' )><right><concrete(Stored_Concrete)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "food",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("Food")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(511, --[[XTemplate customRocketExpedition Text]] "<resource('Food' )><right><food(Stored_Food)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "precious metals",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("PreciousMetals")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(563702272918, --[[XTemplate customRocketExpedition Text]] "<resource('PreciousMetals' )><right><preciousmetals(Stored_PreciousMetals)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "polymers",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("Polymers")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(512, --[[XTemplate customRocketExpedition Text]] "<resource('Polymers' )><right><polymers(Stored_Polymers)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "electronics",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("Electronics")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(513, --[[XTemplate customRocketExpedition Text]] "<resource('Electronics' )><right><electronics(Stored_Electronics)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "machine parts",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local amount = context:GetStoredAmount("MachineParts")
self:SetVisible(amount > 0)
self:SetText(self.Text)
end,
				'Text', T(514, --[[XTemplate customRocketExpedition Text]] "<resource('MachineParts' )><right><machineparts(Stored_MachineParts)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "fuel",
				'__template', "InfopanelText",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:HasExtraFuel())
self:SetText(self.Text)
end,
				'Text', T(398402985264, --[[XTemplate customRocketExpedition Text]] "<resource('Fuel' )><right><fuel(Stored_Fuel)>"),
			}),
			}),
		}),
})

