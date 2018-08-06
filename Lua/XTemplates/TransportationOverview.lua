-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "TransportationOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "OverlayDlg",
		'MinWidth', 500,
		'InitialMode', "transportation",
		'InternalModes', "transportation",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Id', "idTitle",
			'Title', T{684392855007, --[[XTemplate TransportationOverview Title]] "TRANSPORTATION"},
		}),
		PlaceObj('XTemplateWindow', {
			'Padding', box(63, 0, 0, 0),
			'Dock', "top",
			'LayoutMethod', "HList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 250,
				'MaxWidth', 250,
				'HandleMouse', false,
				'TextFont', "InfopanelTitle",
				'TextColor', RGBA(119, 198, 255, 255),
				'Translate', true,
				'Text', T{1000037, --[[XTemplate TransportationOverview Text]] "Name"},
				'TextVAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 140,
				'MaxWidth', 140,
				'HandleMouse', false,
				'TextFont', "InfopanelTitle",
				'TextColor', RGBA(119, 198, 255, 255),
				'Translate', true,
				'Text', T{688745762460, --[[XTemplate TransportationOverview Text]] "Info"},
				'TextHAlign', "center",
				'TextVAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 120,
				'MaxWidth', 120,
				'HandleMouse', false,
				'TextFont', "InfopanelTitle",
				'TextColor', RGBA(119, 198, 255, 255),
				'Translate', true,
				'Text', T{885629433849, --[[XTemplate TransportationOverview Text]] "Load"},
				'TextHAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Padding', box(0, 0, 0, 0),
				'MinWidth', 110,
				'MaxWidth', 110,
				'HandleMouse', false,
				'TextFont', "InfopanelTitle",
				'TextColor', RGBA(119, 198, 255, 255),
				'Translate', true,
				'Text', T{1000178, --[[XTemplate TransportationOverview Text]] "Actions"},
				'TextHAlign', "center",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'BorderWidth', 0,
			'Padding', box(0, 0, 0, 0),
			'MinWidth', 683,
			'MaxWidth', 683,
			'LayoutVSpacing', 1,
			'UniformRowHeight', true,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateForEach', {
				'comment', "transportation",
				'array', function (parent, context) local transportation = GetCommandCenterTransportsList(); parent:ResolveId("idTitle"):SetTitle(T{9814, "<color 255 248 233><count></color> TRANSPORTATION", count = #transportation}) return transportation end,
				'__context', function (parent, context, item, i, n) return item end,
				'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "TransportationOverviewRow", 683, 46)
end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idNoResults",
			'Dock', "box",
			'HAlign', "center",
			'VAlign', "center",
			'Visible', false,
			'HandleMouse', false,
			'TextFont', "PGLogo",
			'TextColor', RGBA(255, 255, 255, 255),
			'Translate', true,
			'Text', T{591853191640, --[[XTemplate TransportationOverview Text]] "Empty list"},
		}),
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
local list = parent:ResolveId("idList")
parent:ResolveId("idNoResults"):SetVisible(#list == 0)
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "Scrollbar",
			'Id', "idScroll",
			'Target', "idList",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate TransportationOverview ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		}),
})

