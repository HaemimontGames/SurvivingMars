DefineClass.OpenAirGym = {
	__parents = { "Service" },
	enum_flags = { efWalkable = true },
}

function OpenAirGym:OnDestroyed()
	self:DestroyAttaches("DecOpenAirGymBase")
	Service.OnDestroyed(self)
end

function OpenAirGym:GetEntranceFallback(target)
	local radius = self:GetRadius()
	local pt = GetRandomPassableAround(self:GetPos(), 2*radius/3, radius/4, self.city)
	return { pt }, pt
end

function OpenAirGym:Service(unit, duration)
	Service.Service(self, unit, duration)
	if not unit.traits.Fit then
		if self:Random(100) < DataInstances.Trait.Fit.param then
			unit:AddTrait("Fit")
		end
	end
end