DefineClass.FitService = {
	__parents = { "Service" },
	flags = { efWalkable = true },
}

function FitService:Service(unit, duration)
	Service.Service(self, unit, duration)
	if not unit.traits.Fit then
		if self:Random(100) < TraitPresets.Fit.param then
			unit:AddTrait("Fit")
		end
	end
end

DefineClass.OpenAirGym = {
	__parents = { "FitService" },
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