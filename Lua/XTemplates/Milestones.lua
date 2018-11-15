-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "Milestones",
	PlaceObj('XTemplateTemplate', {
		'__template', "NewOverlayDlg",
		'Dock', false,
		'HAlign', "left",
		'MaxWidth', 800,
	}, {
		PlaceObj('XTemplateLayer', {
			'layer', "ScreenBlur",
			'layer_id', "idBlur",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return {rating = 100 + CalcChallengeRating()} end,
			'__template', "DialogTitleNew",
			'Margins', box(115, 0, 0, 0),
			'Title', T{433085262825, --[[XTemplate Milestones Title]] "MILESTONES"},
			'Subtitle', T{700087753666, --[[XTemplate Milestones Subtitle]] "DIFFICULTY CHALLENGE <white><percent(rating)>"},
			'BigImage', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__context', function (parent, context) return Presets.Milestone.Default end,
				'__class', "XText",
				'Padding', box(0, 0, 0, 0),
				'HandleMouse', false,
				'TextStyle', "MediumHeader",
				'Translate', true,
				'Text', T{841674688207, --[[XTemplate Milestones Text]] "SCORE <white><sum(0, 'ChallengeScore')>"},
			}),
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
			'Margins', box(60, 20, 0, 20),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XList",
				'Id', "idList",
				'Margins', box(39, 0, 0, 0),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'LayoutVSpacing', 8,
				'UniformRowHeight', true,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
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
							'__class', "XLabel",
							'Id', "idName",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'MinWidth', 200,
							'TextStyle', "MilestoneName",
							'Translate', true,
							'Text', T{611518845262, --[[XTemplate Milestones Text]] "<CompleteText>"},
						}),
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
elseif sol then
	parent:ResolveId("idName"):SetTextStyle("MilestoneNameCompleted")
end
parent:SetVisible(sol ~= nil)
end,
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 0, 15, 0),
							'Dock', "left",
							'MinWidth', 60,
							'MaxWidth', 60,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XLabel",
								'HAlign', "right",
								'VAlign', "center",
								'TextStyle', "MilestoneScore",
								'Translate', true,
								'Text', T{940959765296, --[[XTemplate Milestones Text]] "<def(ChallengeScore,'')>"},
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 0, 15, 0),
							'Dock', "left",
							'MinWidth', 75,
							'MaxWidth', 75,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(2, 0, 2, 0),
								'HAlign', "right",
								'VAlign', "center",
								'HandleMouse', false,
								'TextStyle', "MilestoneScore",
								'Translate', true,
								'Text', T{663189700951, --[[XTemplate Milestones Text]] "<research(reward_research)>"},
								'WordWrap', false,
							}),
							}),
						}),
					}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "ScrollbarNew",
				'Id', "idScroll",
				'Target', "idList",
			}),
			}),
		}),
})

