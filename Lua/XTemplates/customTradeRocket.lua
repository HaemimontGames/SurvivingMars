-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customTradeRocket",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "SupplyRocket",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(414, --[[XTemplate customTradeRocket RolloverText]] "Current status of the Rocket."),
			'Title', T(49, --[[XTemplate customTradeRocket Title]] "Status"),
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(301951063645, --[[XTemplate customTradeRocket Text]] "<UIRocketStatus>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(416, --[[XTemplate customTradeRocket RolloverText]] "Payload of the Rocket."),
			'OnContextUpdate', function (self, context, ...)
				self:SetVisible(context.cargo)
			end,
			'Title', T(415, --[[XTemplate customTradeRocket Title]] "Payload"),
			'Icon', "UI/Icons/Sections/storage.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(417, --[[XTemplate customTradeRocket Text]] "<CargoManifest>"),
			}),
			}),
		}),
})

