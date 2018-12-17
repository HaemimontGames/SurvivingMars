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
			'__class', "XImage",
			'Dock', "box",
			'Image', "UI/CommonNew/menu_background.tga",
			'ImageFit', "stretch",
			'ImageColor', RGBA(255, 255, 255, 96),
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
			'ActionName', T(4254, --[[XTemplate PGChallengeList ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "mode",
			'OnActionParam', "landing",
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(60, 68, 0, 25),
			'HAlign', "left",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
			}),
			PlaceObj('XTemplateWindow', nil, {
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T(761033847359, --[[XTemplate PGChallengeList Title]] "CHALLENGES"),
					'Subtitle', T(545701017966, --[[XTemplate PGChallengeList Subtitle]] "Completed <CompletedChallenges>/<TotalChallenges>"),
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(0, 10, 0, 10),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XList",
						'Id', "idChallengeList",
						'Margins', box(10, 0, 20, 0),
						'BorderWidth', 0,
						'Padding', box(0, 0, 0, 0),
						'HAlign', "left",
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
						'Target', "idChallengeList",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(55, 0, 0, 0),
				}),
				}),
			}),
		}),
})

