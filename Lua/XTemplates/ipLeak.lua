-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipLeak",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "BreakableSupplyGridElement",
		'__template', "Infopanel",
		'Description', T{313911890683, --[[XTemplate ipLeak Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{49, --[[XTemplate ipLeak Title]] "Status"},
			'Icon', "UI/Icons/Sections/warning.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__context_of_kind', "ElectricityGridObject",
				'__context', function (parent, context) return context.electricity end,
				'__condition', function (parent, context) return context end,
				'__template', "InfopanelText",
				'Text', T{185932970385, --[[XTemplate ipLeak Text]] "Losing <red><power(current_consumption)></red> each hour."},
			}),
			PlaceObj('XTemplateTemplate', {
				'__context_of_kind', "LifeSupportGridObject",
				'__context', function (parent, context) return context.water end,
				'__condition', function (parent, context) return context end,
				'__template', "InfopanelText",
				'Text', T{275032650428, --[[XTemplate ipLeak Text]] "Losing <red><water(current_consumption)></red> each hour."},
			}),
			PlaceObj('XTemplateTemplate', {
				'__context_of_kind', "LifeSupportGridObject",
				'__context', function (parent, context) return context.air end,
				'__condition', function (parent, context) return context end,
				'__template', "InfopanelText",
				'Text', T{958364317965, --[[XTemplate ipLeak Text]] "Losing <red><air(current_consumption)></red> each hour."},
			}),
			}),
		}),
})

