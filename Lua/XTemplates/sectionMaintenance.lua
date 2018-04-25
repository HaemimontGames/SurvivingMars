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
			'RolloverText', T{241499798174, --[[XTemplate sectionMaintenance RolloverText]] "The condition of buildings deteriorates over time. Martian dust and disasters contribute to deterioration of outside buildings. Deteriorated buildings will need to be serviced by a Drone and supplied with their required maintenance resource or they will malfunction.<newline><newline>Current deterioration<right><percent(MaintenanceProgress)><newline><left>Last serviced<right><LastMaintenance>"},
			'RolloverTitle', T{619281504128, --[[XTemplate sectionMaintenance RolloverTitle]] "Maintenance"},
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
					'Dock', "right",
					'Text', T{601912665358, --[[XTemplate sectionMaintenance Text]] "<resource(maintenance_resource_amount, maintenance_resource_type)>"},
				}),
				}),
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
	local has_assigned_drones = context.maintenance_phase	and 
			(context.maintenance_work_request:GetTargetAmount() ~= context.maintenance_work_request:GetActualAmount() or
			context.maintenance_resource_request:GetTargetAmount() ~= context.maintenance_resource_request:GetActualAmount())
	self:SetVisible(has_assigned_drones)
	self:SetDock(not has_assigned_drones and "ignore" or false)
end,
					'Text', T{7878, --[[XTemplate sectionMaintenance Text]] "A drone is on the way to repair this building."},
				}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context:IsMalfunctioned() and context.last_maintenance_points_full_ts and not (ResolveValue(context, "UIWarning") and true ))
end,
			'Title', T{277, --[[XTemplate sectionMaintenance Title]] "Attention"},
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{581, --[[XTemplate sectionMaintenance Text]] "This building has deteriorated and will stop working soon unless it receives maintenance."},
				'TextHAlign', "center",
			}),
			}),
		}),
})

