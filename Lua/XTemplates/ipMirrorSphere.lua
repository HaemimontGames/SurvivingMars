-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipMirrorSphere",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MirrorSphere",
		'__template', "Infopanel",
		'Description', T(313911890683, --[[XTemplate ipMirrorSphere Description]] "<description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(1197, --[[XTemplate ipMirrorSphere RolloverText]] "Progress <right><percent(ProgressPct)>"),
			'RolloverTitle', T(1196, --[[XTemplate ipMirrorSphere RolloverTitle]] "Sphere Powering Up"),
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
			'__template', "sectionCheats",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Freeze",
			'ActionToolbar', "cheats",
			'OnAction', function (self, host, source)
host.context:SetCommand("ColdWaveCmd")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Split",
			'ActionToolbar', "cheats",
			'OnAction', function (self, host, source)
host.context:SetCommand("SplitCmd")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Charge 10%",
			'ActionToolbar', "cheats",
			'OnAction', function (self, host, source)
host.context:SetCharge(host.context.sphere_charge + MulDivRound(host.context.max_progress, 10, 100))
ObjModified(host.context)
end,
		}),
		}),
})

