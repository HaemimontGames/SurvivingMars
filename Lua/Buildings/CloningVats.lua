DefineClass.CloningVats = {
	__parents = { "ElectricityConsumer", "Workplace" },
	progress = false,
}

function CloningVats:Init()
	self.progress = 0
end

function CloningVats:BuildingUpdate(dt, ...)
	if self.working then
		local points = MulDivRound(self.performance,g_Consts.cloning_points, 100)
		self.progress = self.progress + points
		if self.progress >= 1000 then
			local colonist_table = GenerateColonistData(self.city, "Child", "martianborn")
			colonist_table.dome = self.parent_dome
			colonist_table.traits["Clone"] = true
			if UICity.mystery and UICity.mystery:IsKindOf("DreamMystery") then
				colonist_table.traits["Dreamer"] = true
			end
			local colonist = Colonist:new(colonist_table)
			colonist:SetOutside(false)
			self:OnEnterUnit(colonist)
			Msg("ColonistBorn", colonist, "cloned")
			self.progress = 0
			self.parent_dome.clones_created = self.parent_dome.clones_created + 1
		end
	end	
end

function CloningVats:GetCloningProgress()
	return MulDivRound(self.progress,100, 1000)
end