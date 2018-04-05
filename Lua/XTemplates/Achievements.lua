-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "Achievements",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'Dock', false,
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
parent:SetMaxWidth(550)
parent:SetHAlign("right")
parent:SetPadding(box(80,50,80,80))
UIShowParadoxFeeds(nil, false)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
UIShowParadoxFeeds(nil, true)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModTitle",
			'TextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{856797454991, --[[XTemplate Achievements Text]] "ACHIEVEMENTS"},
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
			'__context', function (parent, context) return {unlocked = GetUnlockedAchievementsCount(), total=#DataInstances.Achievement} end,
			'__class', "XText",
			'Dock', "top",
			'HAlign', "right",
			'TextFont', "PGModAuthorDate",
			'TextColor', RGBA(119, 198, 255, 255),
			'RolloverTextColor', RGBA(119, 198, 255, 255),
			'Translate', true,
			'Text', T{599355083725, --[[XTemplate Achievements Text]] "Unlocked <white><unlocked> / <total>"},
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate Achievements ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
			'__condition', function (parent, context) return not GetXDialog("IGMainMenu") end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate Achievements ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "mode",
			'__condition', function (parent, context) return GetXDialog("IGMainMenu") end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'Margins', box(-60, 10, 0, 10),
			'BorderWidth', 0,
			'LayoutVSpacing', 10,
			'UniformRowHeight', true,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
			'MouseScroll', false,
		}, {
			PlaceObj('XTemplateForEach', {
				'array', function (parent, context) return DataInstances.Achievement end,
				'condition', function (parent, context, item, i) return IsDlcAvailable(item.dlc) end,
				'__context', function (parent, context, item, i, n) return item end,
				'run_after', function (child, context, item, i, n)
child.idImage:SetImage("UI/Achievements/" .. item.image .. ".tga")
if not GetAchievementFlags(item.name) then
	-- gray out locked ones
	child.idPad:SetEnabled(false)
	child.idImage:SetEnabled(false)
	child.idTitle:SetEnabled(false)
	child.idText:SetEnabled(false)
end
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "achievement item",
					'IdNode', true,
					'RolloverZoom', 1050,
					'HandleMouse', true,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idPad",
						'Margins', box(200, 0, 0, 0),
						'Dock', "box",
						'HAlign', "left",
						'VAlign', "top",
						'ScaleModifier', point(450, 300),
						'Image', "UI/Common/bm_buildings_pad.tga",
						'Angle', 10800,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idImage",
						'Dock', "left",
						'HAlign', "left",
						'VAlign', "top",
						'Image', "UI/Common/mission_yes.tga",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idTitle",
						'Margins', box(6, 6, 0, 0),
						'Dock', "top",
						'HAlign', "left",
						'VAlign', "center",
						'MinWidth', 200,
						'TextFont', "PGModTags",
						'TextColor', RGBA(244, 228, 117, 255),
						'RolloverTextColor', RGBA(244, 228, 117, 255),
						'DisabledTextColor', RGBA(100, 100, 100, 255),
						'DisabledRolloverTextColor', RGBA(100, 100, 100, 255),
						'Translate', true,
						'Text', T{583679719179, --[[XTemplate Achievements Text]] "<display_name>"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idText",
						'Margins', box(6, -10, 0, 0),
						'Padding', box(2, 0, 2, 0),
						'HAlign', "left",
						'VAlign', "center",
						'MinWidth', 200,
						'TextFont', "Version",
						'TextColor', RGBA(255, 255, 255, 255),
						'RolloverTextColor', RGBA(255, 255, 255, 255),
						'DisabledTextColor', RGBA(140, 140, 140, 255),
						'DisabledRolloverTextColor', RGBA(140, 140, 140, 255),
						'Translate', true,
						'Text', T{611518845262, --[[XTemplate Achievements Text]] "<CompleteText>"},
						'TextVAlign', "center",
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

