-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWarning",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "InfopanelObj",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(ResolveValue(context, "UIWarning") and true)
		end,
		'Title', T(47, --[[XTemplate sectionWarning Title]] "<red>Warning</red>"),
		'Icon', "UI/Icons/Sections/warning.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'HAlign', "left",
			'Text', T(584, --[[XTemplate sectionWarning Text]] "<UIWarning>"),
		}),
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
				local background = parent.parent.idBackground
				background:SetImage("UI/CommonNew/warning.tga")
				background:SetFrameBox(box(0,3,0,3))
				background:SetMargins(box(0,0,0,0))
			end,
		}),
		}),
})

