-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XCameraLockLayer",
	group = "Layers",
	id = "EarthPlanetCloseup",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return {} end,
		'__class', "XCameraLockLayer",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XCameraLockLayer.Open(self, ...)
SetPlanetCamera("PlanetEarthCloseup")
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
ClosePlanetCamera("PlanetEarthCloseup")
XLayer.Close(self, ...)
end,
		}),
		}),
})

