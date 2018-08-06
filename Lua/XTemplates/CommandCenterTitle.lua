-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "CCC",
	id = "CommandCenterTitle",
	PlaceObj('XTemplateWindow', {
		'IdNode', true,
		'Dock', "top",
		'LayoutMethod', "VList",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTitle",
			'HAlign', "right",
			'VAlign', "bottom",
			'HandleMouse', false,
			'TextFont', "PGTags",
			'TextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{431862968979, --[[XTemplate CommandCenterTitle Text]] "COMMAND CENTER"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(0, 0, -30, -80),
			'VAlign', "top",
			'Image', "UI/Common/pm_pad_small.tga",
			'FrameBox', box(205, 0, 30, 0),
			'SqueezeY', false,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Title",
		'editor', "text",
		'Set', function (self, value)
self.idTitle:SetText(value)
end,
	}),
	PlaceObj('XTemplateCode', {
		'run', function (self, parent, context)
local dlg = GetDialog(parent)
local old_open = dlg.Open
dlg.Open = function (self, ...)
	local p = self.idFrame:GetPadding()
	self.idFrame:SetPadding(box(30, p:miny(), p:maxx(), p:maxy()))
	local m = self.idToolbarFrame:GetMargins()
	self.idToolbarFrame:SetMargins(box(-30, m:miny(), m:maxx(), m:maxy()))
	old_open(self, ...)
end
end,
	}),
})

