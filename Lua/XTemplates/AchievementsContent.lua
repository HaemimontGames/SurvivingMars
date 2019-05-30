-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "AchievementsContent",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) local total = 0 				ForEachPreset(Achievement, function(achievement, group_list) total = total + 1 end) 				return {unlocked = GetUnlockedAchievementsCount(), total=total} end,
		'__template', "DialogTitleNew",
		'Margins', box(115, 0, 0, 0),
		'Title', T(856797454991, --[[XTemplate AchievementsContent Title]] "ACHIEVEMENTS"),
		'Subtitle', T(599355083725, --[[XTemplate AchievementsContent Subtitle]] "Unlocked <white><unlocked> / <total>"),
	}),
	PlaceObj('XTemplateGroup', {
		'__condition', function (parent, context) return GameState.gameplay and not GetInGameMainMenu() end,
	}, {
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return GameState.gameplay end,
			'layer', "ScreenBlur",
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T(4523, --[[XTemplate AchievementsContent ActionName]] "CLOSE"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "close",
		'ActionName', T(4523, --[[XTemplate AchievementsContent ActionName]] "CLOSE"),
		'ActionToolbar', "ActionBar",
		'ActionShortcut', "Escape",
		'ActionGamepad', "ButtonB",
		'OnActionEffect', "mode",
		'__condition', function (parent, context) return GetInGameMainMenu() or not GameState.gameplay end,
	}),
	PlaceObj('XTemplateWindow', {
		'Margins', box(60, 10, 0, 10),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XList",
			'Id', "idList",
			'Margins', box(39, 0, 0, 0),
			'BorderWidth', 0,
			'Padding', box(0, 0, 0, 0),
			'MaxWidth', 450,
			'LayoutVSpacing', 10,
			'UniformRowHeight', true,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateForEach', {
				'array', function (parent, context)
					-- do not just table.values() it, because we need to keep the sort order
					local t = {}
					ForEachPreset(Achievement, function(achievement, group_list) table.insert(t, achievement) end)
					return t
				end,
				'__context', function (parent, context, item, i, n) return item end,
				'run_after', function (child, context, item, i, n)
					child.idImage:SetImage("UI/Achievements/" .. item.image .. ".tga")
					if not GetAchievementFlags(item.id) then
						-- gray out locked ones
						child.idPad:SetDesaturation(255)
						child.idImage:SetEnabled(false)
						child.idTitle:SetEnabled(false)
						child.idText:SetEnabled(false)
					end
				end,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "achievement item",
					'IdNode', true,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idImage",
						'Dock', "left",
						'HAlign', "left",
						'VAlign', "top",
						'Image', "UI/Common/mission_yes.tga",
					}),
					PlaceObj('XTemplateWindow', nil, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Id', "idPad",
							'Dock', "box",
							'VAlign', "top",
							'ScaleModifier', point(280, 300),
							'DisabledBackground', RGBA(255, 255, 255, 255),
							'Image', "UI/Common/bm_buildings_pad.tga",
							'SqueezeY', false,
							'FlipY', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XLabel",
							'Id', "idTitle",
							'Margins', box(6, 6, 0, 0),
							'Dock', "top",
							'HAlign', "left",
							'VAlign', "center",
							'MinWidth', 200,
							'TextStyle', "AchievementTitle",
							'Translate', true,
							'Text', T(583679719179, --[[XTemplate AchievementsContent Text]] "<display_name>"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idText",
							'Margins', box(6, -10, 0, 0),
							'Padding', box(2, 0, 2, 0),
							'HAlign', "left",
							'VAlign', "center",
							'MinWidth', 200,
							'HandleMouse', false,
							'TextStyle', "AchievementDescr",
							'Translate', true,
							'Text', T(611518845262, --[[XTemplate AchievementsContent Text]] "<CompleteText>"),
							'TextVAlign', "center",
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
		PlaceObj('XTemplateAction', {
			'ActionId', "idScrollDown",
			'ActionGamepad', "RightThumbDown",
			'OnAction', function (self, host, source)
				local list_area = host:ResolveId("idList")
				if list_area:GetVisible() then
					return list_area:OnMouseWheelBack()
				end
			end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "idScrollUp",
			'ActionGamepad', "RightThumbUp",
			'OnAction', function (self, host, source)
				local list_area = host:ResolveId("idList")
				if list_area:GetVisible() then
					return list_area:OnMouseWheelForward()
				end
			end,
		}),
		}),
})

