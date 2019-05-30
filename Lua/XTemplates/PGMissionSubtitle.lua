-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContentTemplate",
	group = "PreGame",
	id = "PGMissionSubtitle",
	PlaceObj('XTemplateWindow', {
		'__class', "XContentTemplate",
		'Dock', "top",
		'RespawnOnContext', false,
	}, {
		PlaceObj('XTemplateMode', {
			'mode', "items",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleSmall",
				'Id', "idTitle",
				'Margins', box(55, 1, 0, 0),
			}),
			PlaceObj('XTemplateCode', {
				'run', function (self, parent, context)
					parent.idTitle:SetTitle(GetDialogModeParam(parent).title)
				end,
			}),
			}),
		}),
})

