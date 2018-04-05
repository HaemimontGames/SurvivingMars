DefineClass.CasinoComplex = {
	__parents = { "ElectricityConsumer", "ServiceWorkplace" },
}
function CasinoComplex:Service(unit, duration)
	if unit.traits.Gambler then
		if self:Random(100) < 50 then
			local trait = DataInstances.Trait.Gambler
			unit:ChangeSanity(-trait.param * const.Scale.Stat, trait.name)
		end
	end
	ServiceWorkplace.Service(self, unit, duration)
end