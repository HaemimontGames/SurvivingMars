-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionCold",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "ColdSensitive",
		'__condition', function (parent, context) return context:IsFreezing() or context.frozen end,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(8543, --[[XTemplate sectionCold RolloverText]] "Buildings in cold environment will freeze if left without power.<newline><newline>Freezing progress<right><percent(FreezeProgress)><newline><left>Status<right><FreezeStatus>"),
			'RolloverTitle', T(3875, --[[XTemplate sectionCold RolloverTitle]] "Freezing"),
			'Icon', "UI/Icons/Sections/cold.tga",
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
					'BindTo', "FreezeProgress",
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				}),
			}),
		}),
})

