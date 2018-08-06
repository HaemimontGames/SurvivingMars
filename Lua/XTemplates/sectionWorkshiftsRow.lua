-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XSection",
	group = "Infopanel Sections",
	id = "sectionWorkshiftsRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "InfopanelActiveSection",
		'RolloverHint', T{7415, --[[XTemplate sectionWorkshiftsRow RolloverHint]] "<left_click> Toggle workshift\n<em>Ctrl + <left_click></em> Toggle workshift on all <display_name_pl>\n"},
		'RolloverHintGamepad', T{7416, --[[XTemplate sectionWorkshiftsRow RolloverHintGamepad]] "<ButtonA> Toggle workshift\n<ButtonX> Toggle workshift on all <display_name_pl>\n"},
		'OnContextUpdate', function (self, context, ...)
UIWorkshiftUpdate(self, ResolvePropObj(context), context.shift)
end,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XContextControl",
			'Id', "idWorkers",
			'HAlign', "center",
			'VAlign', "center",
			'LayoutMethod', "HOverlappingList",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XTextButton",
			'RolloverTemplate', "Rollover",
			'RolloverText', T{7417, --[[XTemplate sectionWorkshiftsRow RolloverText]] "Working on a heavy workload will increase the building performance but inflicts Sanity and Health penalties on the Worker.<newline><newline>Current status: <em><UIOvertimeText></em>"},
			'RolloverTitle', T{4211, --[[XTemplate sectionWorkshiftsRow RolloverTitle]] "Toggle Workload"},
			'RolloverHint', T{736926488042, --[[XTemplate sectionWorkshiftsRow RolloverHint]] "<left_click> Toggle Overtime  <newline><em>Ctrl + <left_click></em> Toggle Overtime for all <display_name_pl>"},
			'RolloverHintGamepad', T{762021223496, --[[XTemplate sectionWorkshiftsRow RolloverHintGamepad]] "<ButtonA> Toggle Overtime <newline><newline><ButtonX> Toggle Overtime for all <display_name_pl>"},
			'Id', "idOvertime",
			'Dock', "right",
			'VAlign', "center",
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'FocusOrder', point(1000, 1),
			'OnPress', function (self, gamepad)
local building = ResolvePropObj(self.context)
local broadcast = not gamepad and IsMassUIModifierPressed()
building:ToggleOvertime(self.context.shift, broadcast)
ObjModified(building)
XCreateRolloverWindow(self, gamepad, true)
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	local building = ResolvePropObj(self.context)
	building:ToggleOvertime(self.context.shift, true)
	ObjModified(building)
	XCreateRolloverWindow(self, gamepad, true)
end
end,
			'Image', "UI/Infopanel/infopanel_workshift_time.tga",
			'ImageScale', point(800, 800),
			'Rows', 2,
			'ColumnsUse', "abbbb",
		}),
		}),
})

