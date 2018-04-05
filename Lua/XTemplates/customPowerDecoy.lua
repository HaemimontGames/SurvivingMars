-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customPowerDecoy",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "PowerDecoy",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "turn to metals",
			'__template', "InfopanelButton",
			'RolloverTitle', T{448, --[[XTemplate customPowerDecoy RolloverTitle]] "Turn into Metals"},
			'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled()
self:SetEnabled(enabled)
if enabled then
	self:SetRolloverText(T{449, "Convert the Mirror Sphere into Metals."})
else
	self:SetRolloverText(reason)
end
end,
			'OnPressParam', "ActionTurnToMetal",
			'Icon', "UI/Icons/IPButtons/metals.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "turn to rare metals",
			'__template', "InfopanelButton",
			'RolloverTitle', T{450, --[[XTemplate customPowerDecoy RolloverTitle]] "Turn into Rare Metals"},
			'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled()
self:SetEnabled(enabled)
if enabled then
	self:SetRolloverText(T{451, "Convert the Mirror Sphere into Rare Metals."})
else
	self:SetRolloverText(reason)
end
end,
			'OnPressParam', "ActionTurnToRareMetals",
			'Icon', "UI/Icons/IPButtons/rare_metals.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "turn to polymers",
			'__template', "InfopanelButton",
			'RolloverTitle', T{452, --[[XTemplate customPowerDecoy RolloverTitle]] "Turn into Polymers"},
			'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled()
self:SetEnabled(enabled)
if enabled then
	self:SetRolloverText(T{453, "Convert the Mirror Sphere into Polymers."})
else
	self:SetRolloverText(reason)
end
end,
			'OnPressParam', "ActionTurnToPolymer",
			'Icon', "UI/Icons/IPButtons/polymers.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{494974125688, --[[XTemplate customPowerDecoy Title]] "Status"},
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{729918620182, --[[XTemplate customPowerDecoy Text]] "<ActionText>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{424501571924, --[[XTemplate customPowerDecoy RolloverText]] "Decomposition progress"},
			'RolloverTitle', T{380271014404, --[[XTemplate customPowerDecoy RolloverTitle]] "Progress"},
			'Icon', "UI/Icons/Sections/electricity_4.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelProgress",
				'BindTo', "ActionProgress",
			}),
			}),
		}),
})

