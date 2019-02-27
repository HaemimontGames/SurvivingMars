-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customSupplyRocket",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "SupplyRocket",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "force launch",
			'__template', "InfopanelButton",
			'RolloverText', T(625375195830, --[[XTemplate customSupplyRocket RolloverText]] "Initiates launch sequence for the return trip to Earth. Note that the rocket has to be refueled and any remaining resources on board will be lost.<newline><newline>Status: <em><UILaunchStatus></em>"),
			'RolloverTitle', T(526598507877, --[[XTemplate customSupplyRocket RolloverTitle]] "Return to Earth"),
			'Id', "idLaunch",
			'OnPressParam', "UILaunch",
			'Icon', "UI/Icons/IPButtons/force_launch.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "auto export",
			'__template', "InfopanelButton",
			'RolloverHint', T(10110, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Activate<newline><em>"),
			'OnContextUpdate', function (self, context, ...)
if not context.allow_export then
	self:SetIcon("UI/Icons/IPButtons/automated_mode_off.tga")
	self:SetRolloverTitle(T(7814, "Automated Mode"))
	self:SetRolloverText(T(7815, "Automated Mode not possible while Rare Metal exports are forbidden."))
	self:SetEnabled(false)
else
	self:SetEnabled(true)
	if context.auto_export then
		self:SetIcon("UI/Icons/IPButtons/automated_mode_on.tga")
		self:SetRolloverTitle(T(7814, "Automated Mode"))
		self:SetRolloverText(T{7816, "If Automated mode is activated the Rocket will repeatedly travel to Earth and back. It will land on the same spot and won't carry any imports or passengers from Earth. The Rocket will launch to Earth when the cargo hold is full and the rocket is refueled.\n\nCurrent status: <em><on_off(auto_export)></em>", context})
		self:SetRolloverHint(T(10111, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Activate Manual Mode <newline><em>"))
		self:SetRolloverHintGamepad(T(10112, "<ButtonA> Activate Manual Mode <newline><em>"))
	else
		self:SetIcon("UI/Icons/IPButtons/automated_mode_off.tga")
		self:SetRolloverTitle(T(7814, "Automated Mode"))
		self:SetRolloverText(T{7816, "If Automated mode is activated the Rocket will repeatedly travel to Earth and back. It will land on the same spot and won't carry any imports or passengers from Earth. The Rocket will launch to Earth when the cargo hold is full and the rocket is refueled.\n\nCurrent status: <em><on_off(auto_export)></em>", context})
		self:SetRolloverHint(T(8724, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Activate Automated Mode <newline><em>"))
		self:SetRolloverHintGamepad(T(10113, "<ButtonA> Activate Automated Mode <newline><em>"))
	end
end
end,
			'OnPressParam', "ToggleAutoExport",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "alllow/forbid export",
			'__template', "InfopanelButton",
			'OnContextUpdate', function (self, context, ...)
if context.allow_export then
	self:SetIcon("UI/Icons/IPButtons/forbid_exports_on.tga")
	self:SetRolloverTitle(T(8040, "Allow/Forbid Exports"))
	self:SetRolloverText(T(12133, "Allow or forbid the exports of Precious Metals to Earth. If precious metals are exported, the colony will gain Funding in exchange.\n\nCurrent status: Exports are <em>allowed</em>."))
	self:SetRolloverHint(T(10114, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Forbid Exports<newline><em>Ctrl + <left_click></em> Forbid Exports in all Rockets"))
	self:SetRolloverHintGamepad(T(10115, --[[XTemplate customSupplyRocket RolloverHintGamepad]] "<ButtonA> Forbid Exports<newline><ButtonX> Forbid Exports in all Rockets"))
else
	self:SetIcon("UI/Icons/IPButtons/forbid_exports_off.tga")
	self:SetRolloverTitle(T(8040, "Allow/Forbid Exports"))
	self:SetRolloverText(T(12134, "Allow or forbid the exports of Precious Metals to Earth. If precious metals are exported, the colony will gain Funding in exchange.\n\nCurrent status: Exports are <em>forbidden</em>."))
	self:SetRolloverHint(T(8109, --[[XTemplate customSupplyRocket RolloverHint]] "<left_click> Allow Exports<newline><em>Ctrl + <left_click></em> Allow Exports in all Rockets"))
	self:SetRolloverHintGamepad(T(8110, --[[XTemplate customSupplyRocket RolloverHintGamepad]] "<ButtonA> Allow Exports<newline><ButtonX> Allow Exports in all Rockets"))
end
end,
			'OnPressParam', "ToggleAllowExport",
			'OnPress', function (self, gamepad)
self.context:ToggleAllowExport(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleAllowExport(true)
end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "send on expedition",
			'__condition', function (parent, context) return not g_Tutorial and UICity.next_anomaly_day and context:IsRocketLanded() end,
			'__template', "InfopanelButton",
			'RolloverText', T(758333922831, --[[XTemplate customSupplyRocket RolloverText]] "Send this rocket on an expedition\n\nStatus: <em><UILaunchStatus></em>"),
			'RolloverTitle', T(949636784531, --[[XTemplate customSupplyRocket RolloverTitle]] "Send on Expedition"),
			'Id', "idExpedition",
			'OnPress', function (self, gamepad)
OpenPlanetaryView({rocket = self.context})
end,
			'Icon', "UI/Icons/IPButtons/send_on_expedition.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "drones",
			'__template', "InfopanelSection",
			'RolloverText', T(260933228141, --[[XTemplate customSupplyRocket RolloverText]] "Drones commanded by the Rocket ship."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.landed and not context.cargo)
end,
			'Title', T(963695586350, --[[XTemplate customSupplyRocket Title]] "Drones<right><drone(DronesCount)>"),
			'Icon', "UI/Icons/Sections/drone.tga",
			'TitleHAlign', "stretch",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(134923339494, --[[XTemplate customSupplyRocket Text]] "<DronesStatusText>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "status",
			'__template', "InfopanelSection",
			'RolloverText', T(414, --[[XTemplate customSupplyRocket RolloverText]] "Current status of the Rocket."),
			'Title', T(49, --[[XTemplate customSupplyRocket Title]] "Status"),
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(301951063645, --[[XTemplate customSupplyRocket Text]] "<UIRocketStatus>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "payload",
			'__template', "InfopanelSection",
			'RolloverText', T(416, --[[XTemplate customSupplyRocket RolloverText]] "Payload of the Rocket."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.cargo)
end,
			'Title', T(415, --[[XTemplate customSupplyRocket Title]] "Payload"),
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(931298770139, --[[XTemplate customSupplyRocket Text]] "<CargoManifest>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "basic resources",
			'__template', "InfopanelSection",
			'RolloverText', T(495, --[[XTemplate customSupplyRocket RolloverText]] "Stored Basic Resources."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.landed and not context.cargo)
end,
			'Title', T(494, --[[XTemplate customSupplyRocket Title]] "Basic Resources"),
			'Icon', "UI/Icons/Sections/basic.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(509, --[[XTemplate customSupplyRocket Text]] "<resource('Metals' )><right><metals(Stored_Metals)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(510, --[[XTemplate customSupplyRocket Text]] "<resource('Concrete' )><right><concrete(Stored_Concrete)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(511, --[[XTemplate customSupplyRocket Text]] "<resource('Food' )><right><food(Stored_Food)>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "advanced resources",
			'__template', "InfopanelSection",
			'RolloverText', T(501, --[[XTemplate customSupplyRocket RolloverText]] "Stored Advanced Resources."),
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.landed and not context.cargo)
end,
			'Title', T(500, --[[XTemplate customSupplyRocket Title]] "Advanced Resources"),
			'Icon', "UI/Icons/Sections/advanced.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(512, --[[XTemplate customSupplyRocket Text]] "<resource('Polymers' )><right><polymers(Stored_Polymers)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(513, --[[XTemplate customSupplyRocket Text]] "<resource('Electronics' )><right><electronics(Stored_Electronics)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(514, --[[XTemplate customSupplyRocket Text]] "<resource('MachineParts' )><right><machineparts(Stored_MachineParts)>"),
			}),
			}),
		}),
})

