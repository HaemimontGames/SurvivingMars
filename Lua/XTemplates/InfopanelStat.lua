-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XFrameProgress",
	group = "Infopanel",
	id = "InfopanelStat",
	PlaceObj('XTemplateWindow', {
		'__class', "XFrameProgress",
		'Id', "idProgress",
		'Margins', box(10, 15, 10, 14),
		'Image', "UI/Infopanel/progress_bar.tga",
		'FrameBox', box(5, 0, 5, 0),
		'MaxProgress', 100000,
		'MinProgressSize', 8,
		'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
		'ProgressFrameBox', box(4, 0, 4, 0),
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnContextUpdate",
			'func', function (self, ...)
				XFrameProgress.OnContextUpdate(self, ...)
				local image = "UI/Infopanel/progress_bar_green.tga"
				if self.Progress < g_Consts.LowStatLevel then
				  image = "UI/Infopanel/progress_bar_red.tga"
				elseif self.Progress < g_Consts.HighStatLevel then
					image = "UI/Infopanel/progress_bar_orange.tga"
				end
				self:SetProgressImage(image)
			end,
		}),
		}),
})

