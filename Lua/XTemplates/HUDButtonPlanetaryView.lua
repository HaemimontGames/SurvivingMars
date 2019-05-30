-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "HUDButtonPlanetaryView",
	PlaceObj('XTemplateTemplate', {
		'__template', "HUDButtonTemplate",
		'RolloverText', T(11031, --[[XTemplate HUDButtonPlanetaryView RolloverText]] "Interact with Planetary Anomalies located far from our colony."),
		'RolloverTitle', T(11030, --[[XTemplate HUDButtonPlanetaryView RolloverTitle]] "Planetary View"),
		'RolloverHint', T(11847, --[[XTemplate HUDButtonPlanetaryView RolloverHint]] "<em><ShortcutName('actionPlanetaryView', 'keyboard')></em> Open Planetary View"),
		'RolloverHintGamepad', T(11032, --[[XTemplate HUDButtonPlanetaryView RolloverHintGamepad]] "<em><ShortcutName('actionPlanetaryView')></em> Open Planetary View"),
		'Id', "idPlanetaryView",
		'Image', "UI/HUD/mars_screen.tga",
		'ImageShine', "UI/HUD/goals_shine.tga",
		'FXPress', "BuildMenuButtonClick",
		'OnPress', function (self, gamepad)
			HUD.idPlanetaryViewOnPress()
		end,
		'OnContextUpdate', function (self, context, ...)
			self:SetEnabled(not g_Tutorial)
			HUD.UpdateDesatModifier(self)
		end,
	}),
})

