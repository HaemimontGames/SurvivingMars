-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "ChallengeListItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverText', T{431702306266, --[[XTemplate ChallengeListItem RolloverText]] "<description>\nDeadline Sol <GetDeadline>\n\n<if(Completed)>\n<GetCompletedText></if>"},
		'RolloverTitle', T{559796896496, --[[XTemplate ChallengeListItem RolloverTitle]] "<title>"},
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextStyle', "ListItem",
		'Translate', true,
		'Text', T{752346534878, --[[XTemplate ChallengeListItem Text]] "<title>"},
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-10, 0, 0, 0),
			'Dock', "box",
			'Visible', false,
			'Image', "UI/CommonNew/action_bar.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idStar",
			'Margins', box(0, 0, 10, 0),
			'Padding', box(0, 6, 0, 7),
			'Dock', "left",
			'VAlign', "center",
			'Image', "UI/Common/star_silver.tga",
		}),
		}),
})

