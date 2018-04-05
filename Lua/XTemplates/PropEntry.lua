-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropEntry",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "bool" end,
		'__template', "PropBool",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "number" end,
		'__template', "PropNumber",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "dropdown" or context.prop_meta.editor == "choice" end,
		'__template', "PropChoice",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "checkbox" end,
		'__template', "PropCheckbox",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "textinput" end,
		'__template', "PropTextInput",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "url" end,
		'__template', "PropUrl",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.prop_meta.editor == "hotkey" end,
		'__template', "PropKeybinding",
	}),
})

