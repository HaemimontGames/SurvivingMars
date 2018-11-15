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
				'__template', "sectionWorkshiftsRow",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__condition', function (parent, context) return IsKindOfClasses(context, "Workplace", "Workshop") end,
			'__class', "XFrame",
			'IdNode', false,
			'Margins', box(17, -12, 0, -13),
			'Padding', box(0, 12, 0, 12),
			'LayoutMethod', "VList",
			'Image', "UI/CommonNew/ip_header.tga",
			'FrameBox', box(12, 12, 0, 12),
		}, {
			PlaceObj('XTemplateTemplate', {
				'__context_of_kind', "Workplace",
				'__template', "InfopanelText",
				'Margins', box(52, 0, 20, 4),
				'Text', T{143236127522, --[[XTemplate sectionWorkshifts Text]] "Building performance<right><em><performance></em><nbsp><nbsp>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__context_of_kind', "Workshop",
				'__template', "InfopanelText",
				'Margins', box(52, 0, 20, 4),
				'Text', T{434307444387, --[[XTemplate sectionWorkshifts Text]] "Workers in Workshops<right><em><percent(WorkshopWorkersPercent)></em><nbsp><nbsp>"},
			}),
			}),
		}),
})

