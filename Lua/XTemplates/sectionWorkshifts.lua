-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWorkshifts",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "ShiftsBuilding",
	}, {
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return nil, 1, 3 end,
			'map', function (parent, context, array, i) return i end,
			'item_in_context', "shift",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelActiveSection",
				'RolloverHint', T{7415, --[[XTemplate sectionWorkshifts RolloverHint]] "<left><left_click> Toggle workshift<newline><em>Ctrl + <left_click></em> Toggle workshift on all <display_name_pl>"},
				'RolloverHintGamepad', T{7416, --[[XTemplate sectionWorkshifts RolloverHintGamepad]] "<left><ButtonA> Toggle workshift<newline><ButtonX> Toggle workshift on all <display_name_pl>"},
				'OnContextUpdate', function (self, context, ...)
UIWorkshiftUpdate(self, ResolvePropObj(context), context.shift)
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'Id', "idWorkers",
					'HAlign', "center",
					'VAlign', "center",
					'LayoutMethod', "HList",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XTextButton",
					'RolloverTemplate', "Rollover",
					'RolloverText', T{7417, --[[XTemplate sectionWorkshifts RolloverText]] "Working on a heavy workload will increase the building performance but inflicts Sanity and Health penalties on the Worker.<newline><newline>Current status: <em><UIOvertimeText></em>"},
					'RolloverTitle', T{4211, --[[XTemplate sectionWorkshifts RolloverTitle]] "Toggle Workload"},
					'RolloverHint', T{736926488042, --[[XTemplate sectionWorkshifts RolloverHint]] "<left_click> Toggle Overtime  <newline><em>Ctrl + <left_click></em> Toggle Overtime for all <display_name_pl>"},
					'RolloverHintGamepad', T{762021223496, --[[XTemplate sectionWorkshifts RolloverHintGamepad]] "<ButtonA> Toggle Overtime <newline><newline><ButtonX> Toggle Overtime for all <display_name_pl>"},
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
end,
					'AltPress', true,
					'OnAltPress', function (self, gamepad)
if gamepad then
	local building = ResolvePropObj(self.context)
	building:ToggleOvertime(self.context.shift, true)
	ObjModified(building)
end
end,
					'Image', "UI/Infopanel/infopanel_workshift_time.tga",
					'ImageScale', point(800, 800),
					'Rows', 2,
					'ColumnsUse', "abbbb",
				}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "Workplace",
			'__template', "InfopanelText",
			'Margins', box(52, 0, 20, 4),
			'Text', T{143236127522, --[[XTemplate sectionWorkshifts Text]] "Building performance<right><em><performance></em><nbsp><nbsp>"},
		}),
		}),
})

