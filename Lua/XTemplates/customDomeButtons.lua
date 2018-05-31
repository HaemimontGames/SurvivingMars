-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customDomeButtons",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "Dome",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "colonists",
			'__template', "InfopanelButton",
			'RolloverText', T{9681, --[[XTemplate customDomeButtons RolloverText]] "Inspect Colonists residing in this dome in the Command Center."},
			'RolloverTitle', T{425452845742, --[[XTemplate customDomeButtons RolloverTitle]] "Inspect Residents"},
			'OnPress', function (self, gamepad)
OpenCommandCenter({dome = self.context}, "Colonists")
end,
			'Icon', "UI/Icons/IPButtons/colonist_section.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "buildings",
			'__template', "InfopanelButton",
			'RolloverText', T{9682, --[[XTemplate customDomeButtons RolloverText]] "Inspect buildings in this dome in the Command Center."},
			'RolloverTitle', T{393977632582, --[[XTemplate customDomeButtons RolloverTitle]] "Inspect Buildings"},
			'OnPress', function (self, gamepad)
OpenCommandCenter({dome = self.context}, "Buildings")
end,
			'Icon', "UI/Icons/IPButtons/dome_buildings.tga",
		}),
		}),
})

