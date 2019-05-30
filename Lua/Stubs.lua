DefineClass("MapSettings_RainsDisaster", "PropertyObject")
DefineClass("ToxicPoolDecal", "Object")
DefineClass("ToxicPool")

DefineClass("RCConstructor")
DefineClass("RCDriller")
DefineClass("RCHarvester")
DefineClass("RCSensor")
DefineClass("RCSolar")
DefineClass("RCTerraformer")

DefineClass("TradePad")
DefineClass("ForeignTradeRocket")

DefineClass("VegetationPlant")
DefineClass("Pasture")
DefineClass("Pet")

KillVegetationInHex = empty_func

if FirstLoad then
	OpenAirBuildings = false
	BreathableAtmosphere = false
	ColdWavesDisabled = false
	DustStormsDisabled = false
	MeteorStormsDisabled = false
end

AreColdWavesEnabled = function() return not ColdWavesDisabled end
AreDustStormsEnabled = function() return not DustStormsDisabled end
AreMeteorStormsEnabled = function() return not MeteorStormsDisabled end

IsObjlist = function(obj)
	return type(obj) == "table"
end

DbgToggleBuildableGrid = empty_func
DbgLastBuildableGrid = false

MsgObjCleanup = empty_func