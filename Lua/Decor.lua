function DecimateParticles(particle_classes, keep_percent, filter) end
function DecimateObjects(object_classes, keep_percent, filter) end
NotNeededForScreenshot = {}

DefineClass("#Test_01", "Object", "Deposition")

DefineClass.BuildingEntityClass =
{
	__parents = { "EntityClass", "AutoAttachObject", "NightLightObject", "WaypointsObj" },
	enum_flags = { efSelectable = true },
	__hierarchy_cache = true,
}

DefineClass.CropEntityClass =
{
	__parents = { "EntityClass" },
	enum_flags = { efSelectable = true },
	__hierarchy_cache = true,
}

DefineClass.BakedTerrainDecalLarge = 
{
	__parents = { "EntityClass", "AutoAttachObject" },
	enum_flags = { efBakedTerrainDecal = true, efBakedTerrainDecalLarge = true, efVisible = false  },
	class_flags = { cfDecal = true, cfConstructible = false, cfAudible = false, cfTerrainObject = true }
}

DefineClass.BakedTerrainDecalOutside = 
{
	__parents = { "EntityClass", "AutoAttachObject" },
	enum_flags = { efBakedTerrainDecal = true, efVisible = false },
	class_flags = { cfDecal = true, cfConstructible = false, cfAudible = false, cfTerrainObject = true },
	game_flags = { gofBakedTerrainDecalOutside = true },
}

DefineClass.BakedTerrainDecalOutsideLarge = 
{
	__parents = { "BakedTerrainDecalOutside", "BakedTerrainDecalLarge" }
}

DefineClass.AnimatedTextureObject = 
{
	__parents = { "ComponentCustomData", "ClassTemplateObject" },
}

function AnimatedTextureObject:Init()
	self:InitTextureAnimation()
end

DefineClass.BakedDomeDecal = 
{
	__parents = { "EntityClass", "AutoAttachObject", "BakedTerrainDecal" },
	class_flags = { cfDetailedDecal = true },
}

DefineClass.BakedDomeDecalLarge = 
{
	__parents = { "BakedDomeDecal", "BakedTerrainDecalLarge" },
}

DefineClass.NonTerrainDecal = 
{
	__parents = { "EntityClass", "AutoAttachObject" },
}

DefineClass.TerrainObject = 
{
	__parents = { "EntityClass", "AutoAttachObject" },
	class_flags = { cfTerrainObject = true },
}

DefineClass.NonTerrainObject = 
{
	__parents = { "EntityClass", "AutoAttachObject" },
}

DefineClass.StoneSmall = {
	enum_flags = { efRemoveUnderConstruction = true },
	game_flags = { gofTemporalConstructionBlock = true },
	__parents = { "EntityClass" },
}

GroundDetailClassGroups = {}

DefineClass.Garden = {
	__parents = { "EntityClass", "AutoAttachObject" },
}

DefineClass.LightSphereHalo = {
	__parents = { "EntityClass" },
	game_flags = { gofSpecialOrientMode = true },
	orient_mode = "facing",
}

DefineClass.LightPillarHalo = {
	__parents = { "EntityClass" },
	game_flags = { gofSpecialOrientMode = true },
	orient_mode = "facing_vertical",
}

DefineClass.DecCrater = {
	__parents = { "BakedTerrainDecal" },
	enum_flags = { efRemoveUnderConstruction = true },
	game_flags = { gofTemporalConstructionBlock = true },
	creation_time = 0,
}

DefineClass("DecCrater_01", "DecCrater")
DefineClass("DecCrater_02", "DecCrater")
DefineClass("DecCrater_03", "DecCrater")
DefineClass("DecCrater_04", "DecCrater")
DefineClass("DecCrater_05", "DecCrater")

DefineClass.DecDebris = {
	__parents = { "BakedTerrainDecal" },
	enum_flags = { efRemoveUnderConstruction = true },
}
DefineClass("DecDebris_01", "DecDebris")
DefineClass("DecDebris_02", "DecDebris")
DefineClass("DecDebris_03", "DecDebris")

DefineClass.WasteRockObstructorSmall = {
	__parents = { "WasteRockObstructor" },
}

DefineClass.Bush = {
	__parents = { "EntityClass" },
}

DefineClass.UIAttach = {
	__parents = { "CObject" },
	game_flags = { gofUIAttach = true },
}

DefineClass.CliffDark_01_100 = {
	__parents = { "Deposition" },
	entity = "CliffDark_01",
}

DefineClass.CliffDark_02_100 = {
	__parents = { "Deposition" },
	entity = "CliffDark_02",
}

DefineClass.CliffDark_03_100 = {
	__parents = { "Deposition" },
	entity = "CliffDark_03",
}

DefineClass.Cliff_01_100 = {
	__parents = { "Deposition" },
	entity = "Cliff_01",
}

DefineClass.Cliff_02_100 = {
	__parents = { "Deposition" },
	entity = "Cliff_02",
}

DefineClass.Cliff_03_100 = {
	__parents = { "Deposition" },
	entity = "Cliff_03",
}

DefineClass.Rocks_01_100 = {
	__parents = { "Deposition" },
	entity = "Rocks_01",
}

DefineClass.Rocks_02_100 = {
	__parents = { "Deposition" },
	entity = "Rocks_02",
}

DefineClass.Rocks_03_100 = {
	__parents = { "Deposition" },
	entity = "Rocks_03",
}

DefineClass.RocksDark_05_AutoRemove = {
	__parents = { "RocksDark_05", "AutoRemoveObj" },
	entity = "RocksDark_05",
}

DefineClass.DecCrater_01_AutoRemove = {
	__parents = { "DecCrater_01", "AutoRemoveObj" },
	entity = "DecCrater_01",
}

DefineClass.DecCrater_03_AutoRemove = {
	__parents = { "DecCrater_03", "AutoRemoveObj" },
	entity = "DecCrater_03",
}

DefineClass.DecCrater_04_AutoRemove = {
	__parents = { "DecCrater_04", "AutoRemoveObj" },
	entity = "DecCrater_04",
}