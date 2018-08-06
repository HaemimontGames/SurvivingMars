-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipMirrorSphereBuilding",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MirrorSphereBuilding",
		'__template', "Infopanel",
	}, {
		PlaceObj('XTemplateGroup', {
			'__condition', function (parent, context) return context.scanned and context:GetProgressPct() < 100 end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSection",
				'Title', T{49, --[[XTemplate ipMirrorSphereBuilding Title]] "Status"},
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T{768796577102, --[[XTemplate ipMirrorSphereBuilding Text]] "<ActionDescr>"},
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrameProgress",
					'Margins', box(10, 15, 10, 14),
					'FoldWhenHidden', true,
					'Image', "UI/Infopanel/progress_bar.tga",
					'FrameBox', box(5, 0, 5, 0),
					'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.action)
return XFrameProgress.OnContextUpdate(self, context, ...)
end,
					'BindTo', "ActionProgress",
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSection",
				'RolloverText', T{1197, --[[XTemplate ipMirrorSphereBuilding RolloverText]] "Progress <right><percent(ProgressPct)>"},
				'RolloverTitle', T{1196, --[[XTemplate ipMirrorSphereBuilding RolloverTitle]] "Sphere Powering Up"},
				'Icon', "UI/Icons/Sections/electricity_4.tga",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrameProgress",
					'Id', "idProgress",
					'Margins', box(10, 15, 10, 14),
					'Image', "UI/Infopanel/progress_bar.tga",
					'FrameBox', box(5, 0, 5, 0),
					'BindTo', "ProgressPct",
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				}),
			PlaceObj('XTemplateTemplate', {
				'comment', "pierce",
				'__template', "InfopanelButton",
				'RolloverTitle', T{1204, --[[XTemplate ipMirrorSphereBuilding RolloverTitle]] "Attempt to Pierce the Shell"},
				'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled("PierceTheShell")
self:SetRolloverText(enabled and T{1205, "Attempt to penetrate the outer shell of the Mirror Sphere with several Drones in the area."} or reason)

self:SetEnabled(enabled or context.action == "PierceTheShell")
if enabled or context.action ~= "PierceTheShell" then
	self:SetIcon("UI/Icons/IPButtons/pierce.tga")
else
	self:SetIcon("UI/Icons/IPButtons/cancel.tga")
end
end,
				'OnPressParam', "ActionPierceTheShell",
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "communicate",
				'__template', "InfopanelButton",
				'RolloverTitle', T{1206, --[[XTemplate ipMirrorSphereBuilding RolloverTitle]] "Attempt to Communicate"},
				'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled("Communicate")
self:SetRolloverText(enabled and T{1207, "Attempt to communicate with the Mirror Sphere via a nearby Sensor Tower."} or reason)

self:SetEnabled(enabled or context.action == "Communicate")
if enabled or context.action ~= "Communicate" then
	self:SetIcon("UI/Icons/IPButtons/communicate.tga")
else
	self:SetIcon("UI/Icons/IPButtons/cancel.tga")
end
end,
				'OnPressParam', "ActionCommunicate",
			}),
			PlaceObj('XTemplateTemplate', {
				'comment', "feed",
				'__template', "InfopanelButton",
				'RolloverTitle', T{1208, --[[XTemplate ipMirrorSphereBuilding RolloverTitle]] "Feed with Power"},
				'OnContextUpdate', function (self, context, ...)
local enabled, reason = context:IsActionEnabled("FeedPower")
self:SetRolloverText(enabled and T{1209, "Divert energy towards the Mirror Sphere from a nearby Power Accumulator."} or reason)

self:SetEnabled(enabled or context.action == "FeedPower")
if enabled or context.action ~= "FeedPower" then
	self:SetIcon("UI/Icons/IPButtons/power.tga")
else
	self:SetIcon("UI/Icons/IPButtons/cancel.tga")
end
end,
				'OnPressParam', "ActionFeedPower",
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "Enable all",
				'ActionToolbar', "cheats",
				'OnAction', function (self, host, source)
host.context.dbg_enable_all = true
RebuildInfopanel(host.context)
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "Finish action",
				'ActionToolbar', "cheats",
				'OnAction', function (self, host, source)
Wakeup(host.context.action_thread)
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "Escavate",
				'ActionToolbar', "cheats",
				'OnAction', function (self, host, source)
host.context:SetProgressPct(100)
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "PlaceAnomaly",
			'ActionToolbar', "cheats",
			'OnAction', function (self, host, source)
host.context:PlaceAnomaly(true)
end,
			'__condition', function (parent, context) return not context.scanned end,
		}),
		}),
})

