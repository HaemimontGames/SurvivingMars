-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionMaintenance",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "RequiresMaintenance",
		'__condition', function (parent, context) return context:DoesRequireMaintenance() end,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{10556, --[[XTemplate sectionMaintenance RolloverText]] "<MaintenanceRolloverText>"},
			'RolloverTitle', T{619281504128, --[[XTemplate sectionMaintenance RolloverTitle]] "Maintenance"},
			'Id', "idSectionMaintenance",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:DoesRequireMaintenance())
end,
			'Icon', "UI/Icons/Sections/facility.tga",
		}, {
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrameProgress",
					'Id', "idProgress",
					'Margins', box(10, 15, 10, 14),
					'Image', "UI/Infopanel/progress_bar.tga",
					'FrameBox', box(5, 0, 5, 0),
					'OnContextUpdate', function (self, context, ...)
XFrameProgress.OnContextUpdate(self, context, ...)
local image = "UI/Infopanel/progress_bar_green.tga"
if self.Progress > 66 then
  image = "UI/Infopanel/progress_bar_red.tga"
elseif self.Progress > 33 then
	image = "UI/Infopanel/progress_bar_orange.tga"
end
self:SetProgressImage(image)
end,
					'BindTo', "MaintenanceProgress",
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'__condition', function(parent, context)
						return context.maintenance_resource_type ~= "no_resource" and context.maintenance_resource_type ~= "no_maintenance"
					end,
					'Dock', "right",
					'Text', T{601912665358, --[[XTemplate sectionMaintenance Text]] "<resource(maintenance_resource_amount, maintenance_resource_type)>"},
				}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "attention",
			'__condition', function (parent, context) return not  IsGameRuleActive("EasyMaintenance") end,
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context:IsMalfunctioned() and context.last_maintenance_points_full_ts and not (ResolveValue(context, "UIWarning") and true ))
end,
			'Title', T{277, --[[XTemplate sectionMaintenance Title]] "Attention"},
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{581, --[[XTemplate sectionMaintenance Text]] "This building has deteriorated and will stop working soon unless it receives maintenance.<EasyMaintenanceText()>"},
				'TextHAlign', "center",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "attention  - easy maintenance game rule",
			'__condition', function (parent, context) return IsGameRuleActive("EasyMaintenance") end,
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context:IsMalfunctioned() and context.last_maintenance_points_full_ts and not (ResolveValue(context, "UIWarning") and true ))
end,
			'Title', T{277, --[[XTemplate sectionMaintenance Title]] "Attention"},
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{746855187624, --[[XTemplate sectionMaintenance Text]] "This building needs maintenance and is waiting for <resource(maintenance_resource_amount, maintenance_resource_type)>"},
				'TextHAlign', "center",
			}),
			}),
		}),
})

