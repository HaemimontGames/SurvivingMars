-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "Milestones",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'MaxWidth', 800,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModTitle",
			'TextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{433085262825, --[[XTemplate Milestones Text]] "MILESTONES"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-80, 6, -155, -100),
			'Dock', "top",
			'VAlign', "top",
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 165, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return {rating = CalcChallengeRating()} end,
			'__class', "XText",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModAuthorDate",
			'TextColor', RGBA(119, 198, 255, 255),
			'RolloverTextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{700087753666, --[[XTemplate Milestones Text]] "DIFFICULTY BONUS <white><percent(rating)>"},
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return Presets.Milestone.Default end,
			'__class', "XText",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModAuthorDate",
			'TextColor', RGBA(119, 198, 255, 255),
			'RolloverTextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{841674688207, --[[XTemplate Milestones Text]] "SCORE <white><sum(0, 'ChallengeScore')>"},
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate Milestones ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'Margins', box(0, 10, 0, 10),
			'BorderWidth', 0,
			'LayoutVSpacing', 12,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
			'MouseScroll', false,
		}, {
			PlaceObj('XTemplateCode', {
				'run', function (self, parent, context)
ForEachPreset("Milestone", function(preset, group, self, parent)
	self:EvalChildren(parent, preset)
end, self, parent)
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "milestone item",
					'IdNode', true,
					'RolloverZoom', 1050,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Dock', "left",
						'Image', "UI/Common/mission_yes.tga",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
local sol = context:CompleteSol()
if sol == false then
	parent:SetImage("UI/Common/mission_no.tga")
end
parent:SetVisible(sol ~= nil)
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(6, 0, 0, 0),
						'MinWidth', 200,
						'TextFont', "PGModAuthorDate",
						'TextColor', RGBA(221, 215, 170, 255),
						'Translate', true,
						'Text', T{611518845262, --[[XTemplate Milestones Text]] "<CompleteText>"},
					}),
					PlaceObj('XTemplateWindow', {
						'Dock', "right",
						'MinWidth', 120,
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'HAlign', "right",
							'TextFont', "PGModAuthorDate",
							'TextColor', RGBA(221, 215, 170, 255),
							'Translate', true,
							'Text', T{940959765296, --[[XTemplate Milestones Text]] "<def(ChallengeScore,'')>"},
						}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XPageScroll",
			'Id', "idScroll",
			'Dock', "bottom",
			'Target', "idList",
		}),
		}),
})

