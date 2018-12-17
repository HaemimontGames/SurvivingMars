-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "GoalItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XListItem",
		'VAlign', "center",
		'MinHeight', 180,
		'HandleKeyboard', false,
		'ChildrenHandleMouse', false,
		'FocusedBorderColor', RGBA(32, 32, 32, 0),
		'DisabledBorderColor', RGBA(0, 0, 0, 0),
		'SelectionBackground', RGBA(204, 232, 255, 0),
	}, {
		PlaceObj('XTemplateWindow', {
			'VAlign', "top",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idImage",
					'Dock', "box",
					'Image', "UI/Messages/Goals/mission_goal_01.tga",
				}),
				PlaceObj('XTemplateWindow', {
					'HAlign', "left",
					'VAlign', "top",
					'MinWidth', 150,
					'MaxWidth', 650,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Id', "idTitleFrame",
						'IdNode', false,
						'Margins', box(0, 0, 0, -12),
						'Dock', "box",
						'Image', "UI/CommonNew/mg_title.tga",
						'FrameBox', box(20, 20, 130, 40),
						'SqueezeY', false,
					}),
					PlaceObj('XTemplateWindow', {
						'Dock', "left",
						'VAlign', "center",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Dock', "box",
							'Image', "UI/CommonNew/check_slot_hex.tga",
							'ImageScale', point(500, 500),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XImage",
							'Id', "idGoalResult",
							'Image', "UI/Common/mission_yes.tga",
							'ImageScale', point(700, 700),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idDescription",
						'HAlign', "left",
						'VAlign', "center",
						'TextStyle', "GoalDescription",
						'Translate', true,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idBottomWindow",
				'HAlign', "right",
				'MinWidth', 400,
				'MaxWidth', 664,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Id', "idBottom",
					'IdNode', false,
					'Image', "UI/CommonNew/mg_reward.tga",
					'FrameBox', box(40, 10, 20, 20),
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "reward",
					'Margins', box(50, 0, 100, 0),
					'HAlign', "left",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 5,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(0, 0, 5, 0),
						'Padding', box(0, 0, 0, 0),
						'Dock', "left",
						'VAlign', "center",
						'TextStyle', "GoalRewardLabel",
						'Translate', true,
						'Text', T(128569337702, --[[XTemplate GoalItem Text]] "Reward:"),
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idReward",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "GoalReward",
						'Translate', true,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idPinIcon",
				'Margins', box(0, 0, 0, 4),
				'Dock', "box",
				'HAlign', "right",
				'VAlign', "bottom",
				'Image', "UI/Icons/Buildings/funding.tga",
				'Columns', 2,
				'Column', 2,
				'ImageScale', point(650, 650),
			}),
			}),
		}),
})

