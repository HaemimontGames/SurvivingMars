-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('StoryBitParamFunding')
DefineClass.StoryBitParamFunding = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "mil", },
	},
	EditorName = "New Param (funding)",
}

function StoryBitParamFunding:GetTag()
	return "<funding(" .. (self.Name or "") .. ")>"
end

UndefineClass('StoryBitParamResearchPoints')
DefineClass.StoryBitParamResearchPoints = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, },
	},
	EditorName = "New Param (reseach points)",
	EditorView = Untranslated("Param <Name> = <research(Value)> research"),
}

function StoryBitParamResearchPoints:GetTag()
	return string.format("<research(%s)>", self.Name or "")
end

UndefineClass('StoryBitParamResource')
DefineClass.StoryBitParamResource = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "Resources", },
		{ id = "Resource", 
			editor = "choice", default = false, items = function (self) return FormattableResourcesWithoutRP end, },
	},
	EditorName = "New Param (resource)",
	EditorView = Untranslated("Param <Name> = <resource(Value)> <Resource>"),
}

function StoryBitParamResource:GetTag()
	return string.format("<%s(%s)>", self.Resource or "water", self.Name or "")
end

UndefineClass('StoryBitParamResourceTerraforming')
DefineClass.StoryBitParamResourceTerraforming = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "Resources", },
		{ id = "TerraformingParam", 
			editor = "choice", default = false, items = function (self) return {{text = "Water", value = "'WaterTP'"},{text = "Atmosphere", value = "'AtmosphereTP'"},{text = "Temperature", value = "'TemperatureTP'"},{text = "Vegetation", value = "'VegetationTP'"}} end, },
	},
	EditorName = "New Param (terraforming)",
}

function StoryBitParamResourceTerraforming:GetTag()
	return string.format("<resource(%s,%s)>", self.Name or "", self.TerraformingParam or "'WaterTP'")
end

UndefineClass('StoryBitParamSols')
DefineClass.StoryBitParamSols = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "sols", },
	},
	EditorName = "New Param (sols)",
	EditorView = Untranslated("Param <Name> = <sols(Value)> sols"),
}

function StoryBitParamSols:GetTag()
	return "<sols(" .. (self.Name or "") .. ")> Sols"
end

----- StoryBitParamSols 

TFormat.sols = function(context_obj, time)
	if not time then return Untranslated("<?>") end
	return time / const.Scale.sols
end

StoryBitParamFunding.GetTag = SetFuncDebugInfo("@Data/ClassDef-StoryBits.lua", 20, StoryBitParamFunding.GetTag)
StoryBitParamResearchPoints.GetTag = SetFuncDebugInfo("@Data/ClassDef-StoryBits.lua", 47, StoryBitParamResearchPoints.GetTag)
StoryBitParamResource.GetTag = SetFuncDebugInfo("@Data/ClassDef-StoryBits.lua", 80, StoryBitParamResource.GetTag)
StoryBitParamResourceTerraforming.GetTag = SetFuncDebugInfo("@Data/ClassDef-StoryBits.lua", 107, StoryBitParamResourceTerraforming.GetTag)
StoryBitParamSols.GetTag = SetFuncDebugInfo("@Data/ClassDef-StoryBits.lua", 136, StoryBitParamSols.GetTag)
