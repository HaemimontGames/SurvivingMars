DefineClass.SpireBase = {
	__parents = { "Building" },
	
	properties = {
		{template = true, name = T{764, "Spire Frame Entity"}, id = "spire_frame_entity", editor = "text", category = "Misc", default = "none"},
	},
}

function SpireBase:Done()
	-- compatibility code:
	if rawget(self, "frame_obj") then
		DoneObject(self.frame_obj)
	end
end

function SpireBase:GameInit()
	self:UpdateFrame()
end

function SpireBase:UpdateFrame()
	if self.destroyed then
		return
	end
	local frame_entity = self.spire_frame_entity
	if frame_entity == "none" then
		return
	end
	if not IsValidEntity(frame_entity) then
		assert(false, "Specified Spire Frame Entity does not exist!")
		return
	end
	local dome = IsObjInDome(self)
	assert(dome)
	if not dome then
		return
	end
	local frame
	local attaches = self:GetAttaches("Shapeshifter") or empty_table
	for _, attach in ipairs(attaches) do
		if attach:GetEntity() == frame_entity then
			frame = attach
			break
		end
	end
	if not IsValid(frame) then
		frame = PlaceObject("Shapeshifter")
		frame:ChangeEntity(self.spire_frame_entity)
		CopyColorizationMaterial(self, frame)
		self:Attach(frame, self:GetSpotBeginIndex("Origin"))
		self:NightLightDisableAttaches("all attaches")
	end
	local spot = dome:GetNearestSpot("idle", "Spireframe", self)
	local pos = dome:GetSpotPos(spot)
	frame:SetAttachOffset( pos - self:GetPos() )
end

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "InspiringArchitecture" then
		city:ForEachLabelObject("Colonist", Notify, "UpdateMorale")
	end
end