-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XCameraLockLayer",
	group = "Layers",
	id = "MarsPlanet",
	PlaceObj('XTemplateWindow', {
		'__class', "XCameraLockLayer",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				XCameraLockLayer.Open(self, ...)
				SetPlanetCamera("PlanetMars")
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
				ClosePlanetCamera("PlanetMars")
				XLayer.Close(self, ...)
			end,
		}),
		}),
})

