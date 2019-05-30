-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "PreGame",
	id = "PGTutorial",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'HAlign', "right",
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'HAlign', "right",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'__condition', function (parent, context) return not GameState.gameplay end,
				'layer', "PGVideoBackground",
			}),
			}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'Id', "idOverlay",
		'HandleMouse', true,
		'HostInParent', true,
		'InitialMode', "tutorial",
		'InternalModes', "tutorial",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'parent', function (parent, context) return GetDialog(parent) end,
			'func', function (self, ...)
				XDialog.Open(self, ...)
				local pad = self.idFrame:GetPadding()
				self.idFrame:SetPadding(box(pad:minx() + 90, pad:miny(), pad:maxx(), pad:maxy()))
				local margins = self.idToolbarFrame:GetMargins()
				self.idToolbarFrame:SetMargins(box(margins:minx()-90, margins:miny(), margins:maxx(), margins:maxy()))
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idTitle",
			'Dock', "top",
			'HAlign', "right",
			'TextStyle', "UITitle",
			'Translate', true,
			'Text', T(135662133117, --[[XTemplate PGTutorial Text]] "TUTORIAL"),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-170, 6, -155, -100),
			'Dock', "top",
			'VAlign', "top",
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 165, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "TutorialContentWindow",
		}),
		}),
})

