DefineClass.DomeOutskirtBld = {
	__parents = { "Object" },
	dome_label = false,
}

function DomeOutskirtBld:GameInit()
	self:AddToDomeLabels()
end

function DomeOutskirtBld:Done()
	self:RemoveFromDomeLabels()
end
	
function DomeOutskirtBld:AddToDomeLabels(dome)
	local label = self.dome_label
	if not label then
		return
	end
	dome = dome or IsObjInDome(self)
	if dome then
		dome:AddToLabel(label, self)
		return
	end
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		if HexAxialDistance(self, dome) <= dome:GetOutsideWorkplacesDist() then
			dome:AddToLabel(label, self)
		end
	end
end

function DomeOutskirtBld:RemoveFromDomeLabels(dome)
	local label = self.dome_label
	if not label then
		return
	end
	dome = dome or IsObjInDome(self)
	if dome then
		dome:RemoveFromLabel(label, self)
		return
	end
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		if HexAxialDistance(self, dome) <= dome:GetOutsideWorkplacesDist() then
			dome:RemoveFromLabel(label, self)
		end
	end
end