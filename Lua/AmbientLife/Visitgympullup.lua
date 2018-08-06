-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitgympullup"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PlayState("standPullUpStart")
	unit:PlayState("standPullUpIdle", 3 + bld:Random(3), const.eDontCrossfade)
	unit:PlayState("standPullUpEnd", 1, const.eDontCrossfade)
end
