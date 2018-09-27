-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "MarsRenameControl",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Padding', box(0, 200, 0, 0),
		'HAlign', "center",
		'VAlign', "center",
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "XSuppressInputLayer",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "box",
			'HAlign', "center",
			'VAlign', "top",
			'Image', "UI/Common/paradox_account.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idRenameTitle",
			'Dock', "top",
			'HAlign', "center",
			'TextFont', "ParadoxAccountItemTitle",
			'TextColor', RGBA(129, 202, 233, 255),
			'RolloverTextColor', RGBA(129, 202, 233, 255),
			'Translate', true,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "MarsEdit",
			'Margins', box(0, 15, 0, 0),
			'MinWidth', 428,
			'MaxWidth', 428,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
			'Id', "idToolbar",
			'IdNode', false,
			'Margins', box(0, 20, 0, 0),
			'Dock', "top",
			'HAlign', "center",
			'LayoutHSpacing', 120,
			'Background', RGBA(0, 0, 0, 0),
			'Toolbar', "RenameActionBar",
			'Show', "text",
			'ButtonTemplate', "MenuEntry",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "ok",
			'ActionName', T{6895, --[[XTemplate MarsRenameControl ActionName]] "OK"},
			'ActionToolbar', "RenameActionBar",
			'ActionShortcut', "Enter",
			'ActionGamepad', "ButtonA",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "rename",
			'ActionName', T{10120, --[[XTemplate MarsRenameControl ActionName]] "RENAME"},
			'ActionToolbar', "RenameActionBar",
			'ActionGamepad', "ButtonY",
			'__condition', function (parent, context) return (Platform.console or (Platform.steam and GetUIStyleGamepad())) and context and context.console_show end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "cancel",
			'ActionName', T{5450, --[[XTemplate MarsRenameControl ActionName]] "CANCEL"},
			'ActionToolbar', "RenameActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		}),
})

