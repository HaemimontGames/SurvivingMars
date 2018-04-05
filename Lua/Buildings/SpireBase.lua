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
	local dome = IsObjInDome(self)
	assert(dome)
	if self.spire_frame_entity ~= "none" and IsValidEntity(self.spire_frame_entity) then
		assert(_G[self.spire_frame_entity], "Specified Spire Frame Entity does not exist!")
		local frame = PlaceObject("Shapeshifter")
		frame:ChangeEntity(self.spire_frame_entity)
		local spot = dome:GetNearestSpot("idle", "Spireframe", self)
		local pos = dome:GetSpotPos(spot)
		frame:SetAttachOffset( pos - self:GetPos() )
		self:Attach(frame, self:GetSpotBeginIndex("Origin"))
	end
end

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "InspiringArchitecture" then
		city:ForEachLabelObject("Colonist", Notify, "UpdateMorale")
	end
end