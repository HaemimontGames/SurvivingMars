-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 180,
	Moment = "pre-hit-ground",
	Radius = 4000,
	StartColor = -21191,
	Target = "ignore",
	Time = 2000,
	handle = 1000801603,
})

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "pre-hit-ground",
	Radius = 10000,
	StartColor = -21191,
	Target = "ignore",
	Time = 2000,
	handle = 702392828,
})

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 180,
	Moment = "start",
	Radius = 4000,
	StartColor = -21191,
	Target = "ignore",
	Time = 3000,
	handle = 1225925578,
})

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "start",
	Radius = 10000,
	StartColor = -21191,
	Target = "ignore",
	Time = 3000,
	handle = 1483904626,
})

PlaceObj('ActionFXLight', {
	Action = "ArtificialSunCharge",
	Attach = true,
	Color = -22784,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -39424,
	FadeOutIntensity = 98,
	Intensity = 120,
	Moment = "start",
	Offset = point(0, 0, 1250),
	Radius = 50000,
	StartColor = -22784,
	StartIntensity = 199,
	Target = "ignore",
	handle = 1654828722,
})

PlaceObj('ActionFXLight', {
	Action = "ArtificialSunProduce",
	Attach = true,
	Color = -22784,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -39424,
	FadeOutIntensity = 98,
	Intensity = 200,
	Moment = "start",
	Offset = point(0, 0, 1250),
	Radius = 50000,
	StartColor = -22784,
	StartIntensity = 199,
	Target = "ignore",
	handle = 903760782,
})

PlaceObj('ActionFXLight', {
	Action = "Land",
	Actor = "AttackRover",
	Attach = true,
	Behavior = "BehaviorDetach",
	BehaviorMoment = "end",
	Color = -42752,
	Delay = 1500,
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -42752,
	Intensity = 200,
	Moment = "start",
	OffsetDir = "SourceAxisY",
	Radius = 10000,
	StartColor = -42752,
	Time = 3000,
	handle = 1999013964,
})

PlaceObj('ActionFXLight', {
	Action = "MeteorExplosion",
	Color = -27392,
	Delay = 30,
	FadeIn = 100,
	FadeOut = 1000,
	FadeOutColor = -47104,
	GameTimeAnimated = true,
	Intensity = 255,
	Moment = "start",
	Radius = 10000,
	Source = "ActionPos",
	StartColor = -27392,
	Target = "ignore",
	Time = 200,
})

PlaceObj('ActionFXLight', {
	Action = "RocketLand",
	Actor = "FXRocket",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 220,
	Moment = "pre-hit-ground",
	Radius = 6000,
	StartColor = -21191,
	Target = "ignore",
	Time = 10500,
	handle = 229179243,
})

PlaceObj('ActionFXLight', {
	Action = "RocketLaunch",
	Actor = "SupplyRocket",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 4000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "start",
	Radius = 6000,
	StartColor = -21191,
	Target = "ignore",
	Time = 10000,
	handle = 949919425,
})

PlaceObj('ActionFXLight', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Color = -16755201,
	Delay = 3500,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOutColor = -16755201,
	FadeOutIntensity = 255,
	Intensity = 200,
	Moment = "start",
	Radius = 10000,
	Spot = "Projector",
	StartColor = -16755201,
	StartIntensity = 255,
})

PlaceObj('ActionFXLight', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Color = -16755201,
	Delay = 3500,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOutColor = -16755201,
	FadeOutIntensity = 120,
	Intensity = 220,
	Moment = "start",
	Offset = point(0, 0, 500),
	Radius = 50000,
	StartColor = -16755201,
	StartIntensity = 220,
})

