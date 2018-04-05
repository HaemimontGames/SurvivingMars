-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipAnomaly",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SubsurfaceAnomaly",
		'__template', "Infopanel",
		'Description', T{7418, --[[XTemplate ipAnomaly Description]] "<Description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible((context.scanning_progress or 0) > 0)
end,
			'Title', T{427664763631, --[[XTemplate ipAnomaly Title]] "Scan Progress"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 16, 10, 16),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'BindTo', "scanning_progress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
self:SetVisible((context.expiration_time or 0) > 0)
end,
			'Title', T{666653736105, --[[XTemplate ipAnomaly Title]] "Expiration"},
			'Icon', "UI/Icons/Sections/sensor.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrameProgress",
				'Id', "idExpiration",
				'Margins', box(10, 16, 10, 16),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'BindTo', "expiration_progress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

