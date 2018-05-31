-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipColonist",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Colonist",
		'__template', "Infopanel",
		'Description', T{10, --[[XTemplate ipColonist Description]] "<Description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverDisabledText', T{8762, --[[XTemplate ipColonist RolloverDisabledText]] "Can't be assigned."},
			'OnPressParam', "ToggleInteraction",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverText', T{116030124982, --[[XTemplate ipColonist RolloverText]] "Selects the previous colonist in the group."},
			'RolloverTitle', T{102770097492, --[[XTemplate ipColonist RolloverTitle]] "Previous Colonist"},
			'Id', "idPrev",
			'OnContextUpdate', function (self, context, ...)
InfopanelCycleUpdate(self:ResolveId("node"))
end,
			'OnPress', function (self, gamepad)
local obj = self.context
if obj then
	obj:CyclePrev(gamepad)
end
end,
			'Icon', "UI/Icons/IPButtons/prev.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelButton",
			'RolloverText', T{232261691824, --[[XTemplate ipColonist RolloverText]] "Selects the next colonist in the group."},
			'RolloverTitle', T{388769879592, --[[XTemplate ipColonist RolloverTitle]] "Next Colonist"},
			'Id', "idNext",
			'OnPress', function (self, gamepad)
local obj = self.context
if obj then
	obj:CycleNext(gamepad)
end
end,
			'Icon', "UI/Icons/IPButtons/next.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:IsDying() end,
			'__template', "InfopanelSection",
			'RolloverText', T{4352, --[[XTemplate ipColonist RolloverText]] "The cause of death of this Colonist."},
			'Title', T{4351, --[[XTemplate ipColonist Title]] "Cause of death"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'HAlign', "center",
				'Text', T{766618008675, --[[XTemplate ipColonist Text]] "<UIDeathReason>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{298540224971, --[[XTemplate ipColonist RolloverText]] "<UIInfo>"},
			'Title', T{4290, --[[XTemplate ipColonist Title]] "Colonist"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{4358, --[[XTemplate ipColonist Text]] "Age Group<right><Age>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{4359, --[[XTemplate ipColonist Text]] "Specialization<right><Specialization>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{9612, --[[XTemplate ipColonist Text]] "Dome<right><h SelectDome InfopanelSelect><DomeDisplayName></h>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{4360, --[[XTemplate ipColonist Text]] "Residence<right><h SelectResidence InfopanelSelect><ResidenceDisplayName></h>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{213479829949, --[[XTemplate ipColonist Text]] "<UIWorkplaceLine>"},
			}),
			}),
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return ColonistStatList end,
			'run_after', function (child, context, item, i, n)
child.OnContextUpdate = function(self, context)
	context:UIStatUpdate(self, item)
end
end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelSection",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrameProgress",
					'Id', "idBar",
					'Margins', box(10, 15, 10, 14),
					'FoldWhenHidden', true,
					'Image', "UI/Infopanel/progress_bar.tga",
					'FrameBox', box(5, 0, 5, 0),
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{100898279423, --[[XTemplate ipColonist RolloverText]] "<UITraitsRollover>"},
			'Title', T{235, --[[XTemplate ipColonist Title]] "Traits"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{868555682819, --[[XTemplate ipColonist Text]] "<UITraitsList>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionWarning",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

