DefineClass.InteriorAmbientLife = {
	__parents = { "InitDone" },
	interior = {"InfirmaryInterior"},
	spots = {"Visitorsit","Visitorlay" },
	anims = {"infirmarySitIdle","layLounge"},
}

function InteriorAmbientLife:GameInit()
	--self:InitAmbientLife()
end

function InteriorAmbientLife:AttachToSpotIdx(attach, spot_idx, state, all)
	local rnd = InteractionRand(100, "interior_al")
	if all or rnd>70 then
		local colonist = AttachToObjectSpotIdx(attach, "Male", spot_idx)
		colonist:SetState(state)
		return colonist
	end	
end

function InteriorAmbientLife:InitAmbientLife()
	for k = 1, #self.interior do
		local attaches = self:GetAttaches(self.interior[k]) or {}
		for i=1, #attaches do
			local attach = attaches[i]
			for i=1, #self.spots do
				local spot_beg, spot_end = attach:GetSpotRange("idle", self.spots[i])
				local all = false
				local anim = self.anims[i]	
				local anim_data = self.anims[i]		
				if type(anim_data)=="table" then
					all = anim_data.all
					anim = anim_data.anim	
				end
				for j = spot_beg, spot_end do					
					self:AttachToSpotIdx(attach, j, anim, all)	
				end
			end
		end
	end
	for i=1, #self.spots do
		local spot_beg, spot_end = self:GetSpotRange("idle", self.spots[i])
		for j = spot_beg, spot_end do
			self:AttachToSpotIdx(self, j, self.anims[i])	
		end
	end
end


