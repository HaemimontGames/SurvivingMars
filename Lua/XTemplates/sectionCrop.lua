-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionCrop",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "Farm",
	}, {
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return nil, 1, 3 end,
			'map', function (parent, context, array, i) return i end,
			'item_in_context', "crop_index",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelActiveSection",
				'RolloverHint', T(369967558050, --[[XTemplate sectionCrop RolloverHint]] "<left_click> Select new crop<newline><em>Ctrl + <left_click> on crop</em> Select in all <display_name_pl>"),
				'RolloverHintGamepad', T(764818637741, --[[XTemplate sectionCrop RolloverHintGamepad]] "<ButtonA> Select new crop<newline><em><ButtonX> on crop</em> Select in all <display_name_pl>"),
				'OnContextUpdate', function (self, context, ...)
UICropUpdate(self, ResolvePropObj(context), context.crop_index)
end,
				'Title', T(495262708189, --[[XTemplate sectionCrop Title]] "Select new crop"),
				'TitleHAlign', "left",
			}, {
				PlaceObj('XTemplateWindow', {
					'__context', function (parent, context) return {} end,
					'__class', "XText",
					'Id', "idCropProduction",
					'Dock', "right",
					'VAlign', "center",
					'FoldWhenHidden', true,
					'TextStyle', "FarmCropLine",
					'Translate', true,
					'Text', T(7414, --[[XTemplate sectionCrop Text]] "<warn><prod>.<frac><icon>"),
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrameProgress",
					'Id', "idProgress",
					'VAlign', "center",
					'FoldWhenHidden', true,
					'Image', "UI/Infopanel/progress_bar.tga",
					'FrameBox', box(5, 0, 5, 0),
					'BindTo', "GrowthProgress",
					'MinProgressSize', 8,
					'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
					'ProgressFrameBox', box(4, 0, 4, 0),
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'IdNode', false,
			'Margins', box(17, -12, 0, -13),
			'Padding', box(0, 12, 0, 12),
			'LayoutMethod', "VList",
			'Image', "UI/CommonNew/ip_header.tga",
			'FrameBox', box(12, 12, 0, 12),
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Margins', box(52, 0, 20, 0),
				'Text', T(911264109357, --[[XTemplate sectionCrop Text]] "Stored <ui_current_crop_resource_type_display_name><right><resource(amount_stored, max_storage, ui_current_crop_resource_type)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__condition', function (parent, context) return not context.hydroponic end,
				'__template', "InfopanelText",
				'Margins', box(52, 0, 20, 4),
				'Text', T(679970579843, --[[XTemplate sectionCrop Text]] "Soil Quality<right><UISoilQuality>%"),
			}),
			}),
		}),
})

