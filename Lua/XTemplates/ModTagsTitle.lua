-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "ModTagsTitle",
	PlaceObj('XTemplateWindow', {
		'Id', "idTitle",
		'IdNode', true,
		'Dock', "top",
		'HAlign', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-400, -80, -40, 0),
			'Image', "UI/Common/pm_pad_large.tga",
			'FrameBox', box(320, 0, 40, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "MenuEntry",
			'Id', "idTitle",
			'OnPress', function (self, gamepad)
				SetBackDialogMode(GetDialog(self))
			end,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
			self.idTitle:SetText(value)
		end,
	}),
})

