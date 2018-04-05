-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionUpgrades",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "UpgradableBuilding",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
local upgrades = context.upgrades_under_construction
local show
for i = 1, 3 do
	local id = context:GetUpgradeID(i)
	show = show or upgrades and upgrades[id] and not upgrades[id].canceled
end
self:SetVisible(show)
end,
		'Title', T{962812330186, --[[XTemplate sectionUpgrades Title]] "Upgrade Construction"},
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
UICreateUpgradeButtons(GetActionsHost(parent).idUpgrades, context)
end,
		}),
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return nil, 1, 3 end,
			'map', function (parent, context, array, i) return context:GetUpgradeID(i) end,
			'condition', function (parent, context, item, i) return item end,
			'item_in_context', "upgrade",
			'run_before', function (parent, context, item, i, n)
context.i = i
end,
			'run_after', function (child, context, item, i, n)
child.idProgress:SetBindTo("UpgradeConstructionProgress"..i)
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContextControl",
				'FoldWhenHidden', true,
				'OnContextUpdate', function (self, context, ...)
local uinfo = context.upgrades_under_construction and context.upgrades_under_construction[context.upgrade]
	local show_upgrade = uinfo and not uinfo.canceled
	self:SetVisible(show_upgrade)
	self.idCost:SetVisible(uinfo and not uinfo.construction_start_ts)
	self.idProgress:SetVisible(uinfo and uinfo.construction_start_ts)
end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Dock', "left",
					'Text', T{622222701550, --[[XTemplate sectionUpgrades Text]] "<GetUpgradeDisplayName(i)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Id', "idCost",
					'HAlign', "right",
					'FoldWhenHidden', true,
					'Text', T{395198263790, --[[XTemplate sectionUpgrades Text]] "<UpgradeCosts(i)>"},
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelProgress",
					'HAlign', "right",
					'FoldWhenHidden', true,
				}),
				}),
			}),
		}),
})

