DefineClass.SpireFrame = {
	__parents = { "Shapeshifter", "NightLightObject" },
}

DefineClass.SpireBase = {
	__parents = { "Building" },
	
	properties = {
		{template = true, name = T(764, "Spire Frame Entity"), id = "spire_frame_entity", editor = "text", category = "Misc", default = "none"},
	},
}

for i=2,MaxAltEntityIdx do
	table.insert(SpireBase.properties, {template = true, name = T{11069, "Alternative Spire Frame Entity <number>", number = i}, id = "spire_frame_entity" .. i, editor = "text", category = "Misc", default = "none"})
end

function SpireBase:Done()
	-- compatibility code:
	if rawget(self, "frame_obj") then
		DoneObject(self.frame_obj)
	end
end

function SpireBase:GameInit()
	self:UpdateFrame()
end

function SpireBase:GetFrameEntity(in_template)
	local template = in_template or BuildingTemplates[self.template_name]
	if self.entity == template.entity then return template.spire_frame_entity end
	for i = 2, MaxAltEntityIdx do
		local entity = template["entity" .. i]
		if entity ~= "" and self.entity == entity then
			return template["spire_frame_entity" .. i]
		end
	end
	
	return template.spire_frame_entity
end

function SpireBase:SaveCompat_FindAndDestroyOldFrame()
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
	if IsValid(frame) then
		DoneObject(frame)
	end
end

function SavegameFixups.SwitchSpireFrameClass()
	MapForEach("map", "SpireBase", function(o)
		o:SaveCompat_FindAndDestroyOldFrame()
		o:UpdateFrame()
	end)
end

function SpireBase:OnSkinChanged(skin, palette)
	Building.OnSkinChanged(self, skin, palette)
	self:UpdateFrame()
end

function SpireBase:UpdateFrame()
	if self.destroyed then
		return
	end
	
	local frame
	local attaches = self:GetAttaches("SpireFrame") or empty_table
	frame = attaches[1]
	local frame_entity = self:GetFrameEntity()
	
	if frame_entity == "none" then
		if IsValid(frame) then
			DoneObject(frame)
		end
		return
	end
	if not IsValidEntity(frame_entity) then
		if IsValid(frame) then
			DoneObject(frame)
		end
		assert(false, "Specified Spire Frame Entity does not exist!")
		return
	end
	local dome = IsObjInDome(self)
	assert(dome)
	if not dome then
		if IsValid(frame) then
			DoneObject(frame)
		end
		return
	end	
	if not IsValid(frame) then
		frame = PlaceObject("SpireFrame")
		self:Attach(frame, self:GetSpotBeginIndex("Origin"))
		if not self:IsNightLightPossible() then
			frame:SetSIModulation(0)
		end
	end
	
	frame:ChangeEntity(frame_entity)
	CopyColorizationMaterial(self, frame)
	local spot = dome:GetNearestSpot("idle", "Spireframe", self)
	local pos = dome:GetSpotPos(spot)
	frame:SetAttachOffset( pos - self:GetPos() )
end

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "InspiringArchitecture" then
		city:ForEachLabelObject("Colonist", Notify, "UpdateMorale")
	end
end