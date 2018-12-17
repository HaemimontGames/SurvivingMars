-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipSubsurfaceDeposit",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SubsurfaceDeposit",
		'__template', "Infopanel",
		'Description', T(7419, --[[XTemplate ipSubsurfaceDeposit Description]] "<Description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T(489, --[[XTemplate ipSubsurfaceDeposit Title]] "Available resources"),
			'Icon', "UI/Icons/Sections/deposit.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(810, --[[XTemplate ipSubsurfaceDeposit Text]] "<ResourceName><right><resource(Amount,max_amount,resource)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(787, --[[XTemplate ipSubsurfaceDeposit Text]] "Grade<right><grade_name>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context.depth_layer > 1 and not IsDeepExploitable(context.resource) end,
			'__template', "InfopanelSection",
			'Title', T(47, --[[XTemplate ipSubsurfaceDeposit Title]] "<red>Warning</red>"),
			'Icon', "UI/Icons/Sections/warning.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(788, --[[XTemplate ipSubsurfaceDeposit Text]] "<center>The deposit is not exploitable with our current technology"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

