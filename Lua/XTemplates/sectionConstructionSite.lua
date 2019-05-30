-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionConstructionSite",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "ConstructionSite",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(626, --[[XTemplate sectionConstructionSite RolloverText]] "All resources have to be delivered to the site. Construction is performed by Drones."),
			'OnContextUpdate', function (self, context, ...)
				--XTemplateTemplate.OnContextUpdate(self, context, ...)
				if IsKindOf(context, "LandscapeConstructionSiteBase") then
					self:SetTitle(T(12613, "Landscaping progress"))
					self:SetRolloverText(T(12614, "Waste Rock has to be delivered or removed from the site. Landscaping is perfomed by Drones or RC Dozers."))
				end
			end,
			'Title', T(394, --[[XTemplate sectionConstructionSite Title]] "Construction progress"),
			'Icon', "UI/Icons/Sections/construction.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return IsKindOf(context, "LandscapeConstructionSiteBase") end,
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 15, 10, 14),
				'FoldWhenHidden', true,
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'BindTo', "TotalLandscapeProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(796206581420, --[[XTemplate sectionConstructionSite Text]] "<IPStatus>"),
			}),
			PlaceObj('XTemplateWindow', {
				'__condition', function (parent, context) return not IsKindOf(context, "LandscapeConstructionSiteBase") end,
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 15, 10, 14),
				'FoldWhenHidden', true,
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'OnContextUpdate', function (self, context, ...)
					XFrameProgress.OnContextUpdate(self, context, ...)
					local show = context:IsBlockerClearenceCompleteUIOnly() and not context:IsWaitingResources()
					self:SetVisible(show)
				end,
				'BindTo', "ConstructionBuildPointsProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Quick build",
			'ActionToolbar', "cheats",
			'OnAction', function (self, host, source)
				local obj = host.context
				obj = obj:GetConstructionGroupLeader()
				if obj then
					obj:Complete(true)
				end
			end,
		}),
		}),
})

