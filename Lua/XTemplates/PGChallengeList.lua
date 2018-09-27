-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGChallengeList",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return ChallengeGalleryObjectCreateAndLoad() end,
		'IdNode', true,
		'HandleMouse', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "box",
			'Image', "UI/LoadingScreens/005.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idImage",
			'Dock', "box",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idFade",
			'Dock', "box",
			'Visible', false,
			'Background', RGBA(0, 0, 0, 255),
			'FadeInTime', 300,
			'FadeOutTime', 300,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T{4254, --[[XTemplate PGChallengeList ActionName]] "BACK"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "mode",
			'OnActionParam', "landing",
		}),
		PlaceObj('XTemplateWindow', {
			'Dock', "right",
			'MinWidth', 800,
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "list background",
				'__class', "XImage",
				'Margins', box(0, -2, 0, -2),
				'Dock', "box",
				'Image', "UI/CommonNew/menu_background.tga",
				'ImageFit', "stretch",
				'Angle', 10800,
			}),
			PlaceObj('XTemplateWindow', {
				'HAlign', "right",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 0, 0, 20),
					'Dock', "top",
					'MinHeight', 100,
					'MaxHeight', 100,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Dock', "box",
						'Image', "UI/CommonNew/title_pad.tga",
						'ImageFit', "stretch",
						'Angle', 10800,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idChallenges",
						'Margins', box(42, 0, 0, 20),
						'Padding', box(0, 0, 0, 0),
						'HAlign', "left",
						'VAlign', "bottom",
						'Clip', false,
						'RolloverOnFocus', true,
						'TextStyle', "OverlayTitle",
						'Translate', true,
						'Text', T{761033847359, --[[XTemplate PGChallengeList Text]] "CHALLENGES"},
						'Shorten', true,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XList",
					'Id', "idChallengeList",
					'Margins', box(0, 0, 20, 0),
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'LayoutVSpacing', 6,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
				}, {
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return Presets.Challenge.Default end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
local completed = item:Completed()
if completed and completed.time <= item.time_perfected then
	child.idStar:SetImage("UI/Common/star_gold.tga")
end
child.idStar:SetVisible(not not completed)
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "ChallengeListItem",
							'RolloverTemplate', "Rollover",
							'OnPress', function (self, gamepad)
GetDialog(self):SetMode("landing")
GetDialog(self).context.select_spot = self.context.id
end,
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnSetRollover(self, rollover)",
								'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
if rollover and GalleryList then
	local item = table.find_value(GalleryList, "displayname", self.context.id)
	RequestGalleryScreenshotLoad(self:ResolveId("node"):ResolveId("node"), item and item.savename)
end
end,
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Margins', box(0, 0, 10, 0),
					'Target', "idChallengeList",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(0, 0, 100, 50),
				}),
				}),
			}),
		}),
})

