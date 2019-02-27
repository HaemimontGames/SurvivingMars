-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('CheckAverageComfort')
DefineClass.CheckAverageComfort = {
	__parents = { "Condition", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Condition", 
			editor = "choice", default = ">=", items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
	},
	Description = Untranslated("Average comfort <Condition> <Amount>"),
}

function CheckAverageComfort:__eval(obj, context)
	local avg = UICity:GetAverageStat("Comfort")
	local amount = self:ResolveValue("Amount", context)
	local condition = self.Condition
	if condition == ">=" then
		print(avg >= amount)
		return avg >= amount
	elseif condition == "<=" then
		return avg <= amount
	elseif condition == ">" then
		return avg > amount
	elseif condition == "<" then
		return avg < amount
	elseif condition == "==" then
		return avg == amount
	else -- "~="
		return avg ~= amount
	end
end

function CheckAverageComfort:__eval_relaxed(obj, context)
	return true
end

UndefineClass('CheckAverageMorale')
DefineClass.CheckAverageMorale = {
	__parents = { "Condition", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Condition", 
			editor = "choice", default = ">=", items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
	},
	Description = Untranslated("Average morale <Condition> <Amount>"),
}

function CheckAverageMorale:__eval(obj, context)
	local avg = UICity:GetAverageStat("Morale")
	local amount = self:ResolveValue("Amount", context)
	local condition = self.Condition
	if condition == ">=" then
		return avg >= amount
	elseif condition == "<=" then
		return avg <= amount
	elseif condition == ">" then
		return avg > amount
	elseif condition == "<" then
		return avg < amount
	elseif condition == "==" then
		return avg == amount
	else -- "~="
		return avg ~= amount
	end
end

function CheckAverageMorale:__eval_relaxed(obj, context)
	return true
end

UndefineClass('CheckBuildingCount')
DefineClass.CheckBuildingCount = {
	__parents = { "Condition", },
	properties = {
		{ id = "Building", 
			editor = "combo", default = false, items = function (self) return BuildingsCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	TextSingular = T(828647965498, "1 <building_name>"),
	TextPlural = T(438871007969, "<amount> <building_name_plural>"),
}

function CheckBuildingCount:__eval(obj, context)
	local count = 0
	local amount = self:ResolveValue("Amount", context)
	if ClassTemplates.Building[self.Building] then
		for _, building in ipairs(UICity.labels[self.Building] or empty_table) do
			if not building.destroyed then
				count = count + 1
			end
		end
	end
	return count >= amount
end

function CheckBuildingCount:GetDescription(obj, context)
	local bld = BuildingTemplates[self.Building]
	local amount = self:ResolveValue("Amount", context)
	if not bld then
		return amount == 1 and
			T{self.TextSingular, building_name = T(5426, --[[Label Building display_name]] "Building")} or
			T{self.TextPlural, amount = amount, building_name_plural = T(3980, "Buildings")}
	end
	return amount == 1 and
		T{self.TextSingular, building_name = bld.display_name} or
		T{self.TextPlural, amount = amount, building_name_plural = bld.display_name_pl}
end

UndefineClass('CheckColonistCount')
DefineClass.CheckColonistCount = {
	__parents = { "Condition", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Trait", 
			editor = "combo", default = false, items = function (self) return TraitsCombo() end, },
	},
	TextSingular = T(189508201261, "1 Colonist"),
	TextPlural = T(672624091330, "<amount> Colonists"),
	TextTraitSingular = T(313070027412, "1 <trait> Colonist"),
	TextTraitPlural = T(330446983216, "<amount> <trait> Colonists"),
}

function CheckColonistCount:__eval(obj, context)
	local objs = GetObjectsByLabel("Colonist")
	local count = #(objs or "")
	if count > 0 and self.Trait and self.Trait ~= "" then
		for _, obj in ipairs(objs) do
			if not obj.traits[self.Trait] then
				count = count - 1
			end
		end
	end
	return count >= self:ResolveValue("Amount", context)
end

function CheckColonistCount:GetDescription(obj, context)
	local amount = self:ResolveValue("Amount", context)
	if self.Trait and self.Trait ~= "" then
		local trait = TraitPresets[self.Trait].display_name
		return amount == 1 and
			T{self.TextTraitSingular, trait = trait} or
			T{self.TextTraitPlural, trait = trait, amount = amount}
	else
		return amount == 1 and self.TextSingular or T{self.TextPlural, amount = amount}
	end
end

UndefineClass('CheckColonistStat')
DefineClass.CheckColonistStat = {
	__parents = { "Condition", },
	properties = {
		{ id = "Condition", 
			editor = "choice", default = ">=", items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
		{ id = "Stat", 
			editor = "combo", default = false, items = function (self) return StatCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "Stat", step = 1000, min = 0, max = 100000, },
		{ id = "Description", 
			editor = "text", default = T(297267954147, "<Stat> <Condition> <Amount>"), translate = true, },
	},
}

function CheckColonistStat:__eval(colonist, context)
	if not IsValid(colonist) then return false end
	
	local stat = colonist[self.Stat]
	local amount = self:ResolveValue("Amount", context)
	
	local condition = self.Condition
	if condition == ">=" then
		return stat >= amount
	elseif condition == "<=" then
		return stat <= amount
	elseif condition == ">" then
		return stat > amount
	elseif condition == "<" then
		return stat < amount
	elseif condition == "==" then
		return stat == amount
	else -- "~="
		return stat ~= amount
	end
end

UndefineClass('CheckDeaths')
DefineClass.CheckDeaths = {
	__parents = { "Condition", },
	properties = {
		{ id = "ReasonsList", 
			editor = "string_list", default = {}, item_default = "Old age", items = function (self) return table.keys(DeathReasons, true) end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "OtherThan", help = "Used to check for any other reason than the selected", 
			editor = "bool", default = false, },
		{ id = "Sols", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Count", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = Untranslated("Deaths <NegText> <ReasonsText> > <Count> the last <Sols> sols"),
	DescriptionNeg = Untranslated("Deaths <NegText> <ReasonsText> <= <Count> the last <Sols> sols"),
}

function CheckDeaths:__eval(obj, context)
	local count = self:ResolveValue("Count", context)
	local sols = self:ResolveValue("Sols", context)
	local reasons
	if self.OtherThan then
		reasons = table.copy(DeathReasons)
		for _, reason in ipairs(self.ReasonsList) do
			reasons[reason] = nil
		end
	else
		reasons = table.invert(self.ReasonsList)
	end
	return CountColonistDeaths(reasons, sols) > count
end

function CheckDeaths:GetReasonsText()
	return Untranslated(table.concat(self.ReasonsList, ", "))
end

function CheckDeaths:GetNegText()
	return self.OtherThan and "other than" or ""
end

function CheckDeaths:__eval_relaxed(obj, context)
	return true
end

UndefineClass('CheckObjectCount')
DefineClass.CheckObjectCount = {
	__parents = { "Condition", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo() end, },
		{ id = "InDome", 
			editor = "bool", default = false, },
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "Condition", 
			editor = "choice", default = false, items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Description", 
			editor = "text", default = T(569587504378, "<ObjName> count <Condition> <Amount>"), translate = true, },
	},
}

function CheckObjectCount:__eval(obj, context)
	local objs
	if not self.InDome then
		objs = GetObjectsByLabel(self.Label)
	elseif obj then
		-- might also be a Construction object
		objs = obj:IsKindOf("Dome") and obj.labels[self.Label] or empty_table
	else
		objs = {}
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
				table.append(objs, dome.labels[self.Label])
		end
	end
	local count = 0
	for i = 1, #(objs or "") do
		local ok = true
		for _, condition in ipairs(self.Filters or empty_table) do
			if not condition:Evaluate(objs[i], context) then
				ok = false
				break
			end
		end
		if ok then count = count + 1 end
	end
	
	local amount = self:ResolveValue("Amount", context)
	local condition = self.Condition
	if condition == ">=" then
		return count >= amount
	elseif condition == "<=" then
		return count <= amount
	elseif condition == ">" then
		return count > amount
	elseif condition == "<" then
		return count < amount
	elseif condition == "==" then
		return count == amount
	else -- "~="
		return count ~= amount
	end
end

function CheckObjectCount:GetObjName(obj, context)
	local prefix = self.InDome and "Dome." or ""
	return Untranslated(prefix .. (self.Label or "Object"))
end

UndefineClass('CheckResource')
DefineClass.CheckResource = {
	__parents = { "Condition", },
	properties = {
		{ id = "Condition", 
			editor = "choice", default = ">=", items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
		{ id = "Resource", 
			editor = "combo", default = false, items = function (self) return AllResourcesCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Description", 
			editor = "text", default = T(549355793884, "<ResourceText> <Condition> <Amount>"), translate = true, },
	},
}

function CheckResource:__eval(obj, context)
	local count = 0
	local amount = self:ResolveValue("Amount", context)
	local resource = self.Resource
	if resource == "ResearchPoints" then
		count = UICity:GetEstimatedRP()
	elseif resource == "Funding" then
		count = UICity:GetFunding()
	elseif resource == "Power" or resource == "Water" or resource == "Air" then
		resource = resource:lower()
		count = ResourceOverviewObj.data["total_"..resource.."_production"] or 0
		amount = amount*const.ResourceScale
	elseif resource == "StoredPower" or resource == "StoredWater" or resource == "StoredAir" then
		resource = resource:match("Stored".."(%a+)"):lower()
		count = ResourceOverviewObj.data["total_"..resource.."_storage"] or 0
		amount = amount*const.ResourceScale
	else --Construction Resources, Food, Fuel
		count = ResourceOverviewObj.data[self.Resource] or 0
		amount = amount*const.ResourceScale
	end
	
	local condition = self.Condition
	if condition == ">=" then
		return count >= amount
	elseif condition == "<=" then
		return count <= amount
	elseif condition == ">" then
		return count > amount
	elseif condition == "<" then
		return count < amount
	elseif condition == "==" then
		return count == amount
	else -- "~="
		return count ~= amount
	end
end

function CheckResource:GetResourceText(obj, context)
	local desc = Resources[self.Resource]
	return desc and desc.display_name or T(15, "Resource")
end

UndefineClass('CheckTechStatus')
DefineClass.CheckTechStatus = {
	__parents = { "Condition", },
	properties = {
		{ id = "Field", 
			editor = "choice", default = "", items = function (self) return ResearchFieldsCombo() end, },
		{ id = "TechId", name = "Tech Id", 
			editor = "choice", default = "", items = function (self) return ResearchTechsCombo(self) end, },
		{ id = "Status", 
			editor = "choice", default = "researched", items = function (self) return { "unknown", "available", "researched" } end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
}

function CheckTechStatus:__eval(obj, context)
	if not TechDef[self.TechId] then
		context:ShowError(self, "No such tech:", self.TechId)
		return
	end
	if self.Status == "researched" then
		return UICity:IsTechResearched(self.TechId)
	elseif self.Status == "available" then
		return UICity:IsTechResearchable(self.TechId)
	else
		return UICity:IsTechDiscovered(self.TechId)
	end
end

function CheckTechStatus:GetDescription()
	local desc = TechDef[self.TechId]
	local tech_name = desc and desc.display_name or ""
	if self.Status == "researched" then
		if self.Negate then
			return T{11848, "Tech not researched <tech_name>", tech_name = tech_name}
		else
			return T{11849, "Tech researched <tech_name>", tech_name = tech_name}
		end
	elseif self.Status == "available" then
		if self.Negate then
			return T{11850, "Tech not available <tech_name>", tech_name = tech_name}
		else
			return T{11851, "Tech available <tech_name>", tech_name = tech_name}
		end
	else
		if self.Negate then
			return T{11852, "Tech unknown <tech_name>", tech_name = tech_name}
		else
			return T{11853, "Tech discovered <tech_name>", tech_name = tech_name}
		end
	end
end

UndefineClass('CountShuttles')
DefineClass.CountShuttles = {
	__parents = { "Condition", },
	properties = {
		{ id = "Status", 
			editor = "choice", default = "all", items = function (self) return ShuttleStatusComboItems end, },
		{ id = "Amount", 
			editor = "number", default = 0, },
		{ id = "Condition", 
			editor = "choice", default = ">=", items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
	},
	Description = Untranslated("Shuttle count <Condition> <Amount>"),
}

function CountShuttles:__eval(obj, context)
	local amount = self:ResolveValue("Amount", context)
	local count = 0
	local ShuttleHubCountShuttles
	if self.Status == "all" then
		ShuttleHubCountShuttles = function(hub) 
			return #hub.shuttle_infos
		end
	elseif self.Status == "in flight" then
		ShuttleHubCountShuttles = function(hub) 
			return hub:GetFlyingShuttles()
		end
	elseif self.Status == "refueling" then
		ShuttleHubCountShuttles = function(hub) 
			return hub:GetRefuelingShuttles()
		end
	elseif self.Status == "idle" then
		ShuttleHubCountShuttles = function(hub) 
			return hub:GetIdleShuttles()
		end
	end
	for _, shuttle_hub in pairs(UICity.labels.ShuttleHub or empty_table) do
		if not shuttle_hub:IsKindOf("ConstructionSite") and not shuttle_hub.destroyed then
			count = count + ShuttleHubCountShuttles(shuttle_hub)
		end
	end
	
	local condition = self.Condition
	if condition == ">=" then
		return count >= amount
	elseif condition == "<=" then
		return count <= amount
	elseif condition == ">" then
		return count > amount
	elseif condition == "<" then
		return count < amount
	elseif condition == "==" then
		return count == amount
	else -- "~="
		return count ~= amount
	end
end

UndefineClass('CountTechsResearched')
DefineClass.CountTechsResearched = {
	__parents = { "Condition", },
	properties = {
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "Condition", 
			editor = "choice", default = false, items = function (self) return { ">=", "<=", ">", "<", "==", "~=" } end, },
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Description", 
			editor = "text", default = T(847100615161, "Techs researched count <Condition> <Amount>"), translate = true, },
	},
}

function CountTechsResearched:__eval(obj, context)
	local count = 0
	local fields = table.keys(TechFields)
	for i = 1, #fields do
		local t_c, all = UICity:TechCount(fields[i], "researched")
		count = count + t_c
	end
	local amount = self:ResolveValue("Amount", context)
	local condition = self.Condition
	if condition == ">=" then
		return count >= amount
	elseif condition == "<=" then
		return count <= amount
	elseif condition == ">" then
		return count > amount
	elseif condition == "<" then
		return count < amount
	elseif condition == "==" then
		return count == amount
	else -- "~="
		return count ~= amount
	end
end

UndefineClass('FounderStageCompleted')
DefineClass.FounderStageCompleted = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Founder stage completed"),
	DescriptionNeg = Untranslated("Founder stage not completed"),
}

function FounderStageCompleted:__eval(obj, context)
	return g_ColonyNotViableUntil == -1
end

function FounderStageCompleted:__eval_relaxed(obj, context)
	return true
end

UndefineClass('HasTrait')
DefineClass.HasTrait = {
	__parents = { "Condition", },
	properties = {
		{ id = "Trait", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Colonist is <Trait>"),
	DescriptionNeg = Untranslated("Colonist is not <Trait>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function HasTrait:__eval(obj, context)
	return obj.traits[self.Trait]
end

UndefineClass('HasWorkplace')
DefineClass.HasWorkplace = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Colonist has a workplace"),
	DescriptionNeg = Untranslated("Colonist does not have a workplace"),
	RequiredObjClasses = {
	"Colonist",
},
}

function HasWorkplace:__eval(obj, context)
	return not not obj.workplace
end

UndefineClass('IsAssociatedObject')
DefineClass.IsAssociatedObject = {
	__parents = { "Condition", },
	Description = Untranslated("Is Associated Object"),
}

function IsAssociatedObject:__eval(obj, context)
	if not context.object then
		context:ShowError(self, "No associated object!")
		return
	end
	return context.object == obj
end

UndefineClass('IsBuildingClass')
DefineClass.IsBuildingClass = {
	__parents = { "Condition", },
	properties = {
		{ id = "BuildingClass", name = "Building Class", 
			editor = "string_list", default = {}, item_default = "Dome", items = function (self) return ClassDescendantsList("Building") end, },
		{ id = "Template", name = "Building Template", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("BuildingTemplate") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Building is <BuildingClasses> <Templates>"),
	DescriptionNeg = Untranslated("Building is not <BuildingClasses> <Templates>"),
	RequiredObjClasses = {
	"Building",
},
}

function IsBuildingClass:__eval(obj, context)
	if #self.BuildingClass > 0 then
		if not obj:IsKindOfClasses(self.BuildingClass) then
			return false
		end
	end
	if #self.Template > 0 then
		if not table.find(self.Template, obj.template_name) then
			return false
		end
	end
	return true
end

function IsBuildingClass:GetBuildingClasses()
	return Untranslated(table.concat(self.BuildingClass, ", "))
end

function IsBuildingClass:GetTemplates()
	return Untranslated(table.concat(self.Template, ", "))
end

UndefineClass('IsBuildingWorking')
DefineClass.IsBuildingWorking = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Working"),
	DescriptionNeg = Untranslated("Not working"),
	RequiredObjClasses = {
	"Building",
},
}

function IsBuildingWorking:__eval(obj, context)
	return obj.working
end

UndefineClass('IsCommander')
DefineClass.IsCommander = {
	__parents = { "Condition", },
	properties = {
		{ id = "CommanderProfile", name = "Commander Profile", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("CommanderProfilePreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = T(715647837632, "<display_name('CommanderProfilePreset',CommanderProfile)>"),
	DescriptionNeg = T(370328927689, "Commander Profile: not <display_name('CommanderProfilePreset',CommanderProfile)>"),
}

function IsCommander:__eval(obj, context)
	return GetCommanderProfile().name == self.CommanderProfile
end

function IsCommander:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsCommander2')
DefineClass.IsCommander2 = {
	__parents = { "Condition", },
	properties = {
		{ id = "CommanderProfile1", name = "Commander Profile 1", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("CommanderProfilePreset") end, },
		{ id = "CommanderProfile2", name = "Commander Profile 2", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("CommanderProfilePreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = T(954742980035, "<display_name('CommanderProfilePreset',CommanderProfile1)> or <display_name('CommanderProfilePreset',CommanderProfile2)>"),
	DescriptionNeg = T(267085582298, "Commander Profile: not <display_name('CommanderProfilePreset',CommanderProfile1)> or <display_name('CommanderProfilePreset',CommanderProfile2)>"),
}

function IsCommander2:__eval(obj, context)
	local commander = GetCommanderProfile().name 
	return commander == self.CommanderProfile1 or commander==self.CommanderProfile2
end

function IsCommander2:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsCommanders')
DefineClass.IsCommanders = {
	__parents = { "Condition", },
	properties = {
		{ id = "Commanders", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("CommanderProfilePreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = T(282335593996, "Commander is <NamesText>"),
	DescriptionNeg = T(403412127044, "Commander isn't <NamesText>"),
}

function IsCommanders:__eval(obj, context)
	return table.find(self.Commanders, GetCommanderProfile().name)
end

function IsCommanders:GetNamesText()
	local items = {}
	local commanders = Presets.CommanderProfilePreset and Presets.CommanderProfilePreset.Default
	for i, name in ipairs(self.Commanders) do
		items[i] = commanders[name] and commanders[name].display_name or ""
	end
	return table.concat(items, ", ")
end

function IsCommanders:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsCustomAnomaly')
DefineClass.IsCustomAnomaly = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "id", 
			editor = "text", default = false, },
	},
	Description = Untranslated("Is associated anomaly"),
	DescriptionNeg = Untranslated("Not associated anomaly"),
	RequiredObjClasses = {
	"PlanetaryAnomaly",
	"SupplyRocket",
},
}

function IsCustomAnomaly:__eval(obj, context)
	if IsKindOf(obj, "RocketExpedition") then
		obj = obj.expedition and obj.expedition.anomaly
	end
	if IsKindOf(obj, "PlanetaryAnomaly") then
		if self.id then
			return obj.custom_id == self.id
		else
			return obj == context.object
		end
	end
end


UndefineClass('IsFoundersRocket')
DefineClass.IsFoundersRocket = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Rocket is Founder"),
	DescriptionNeg = Untranslated("Rocket is not Founder"),
	RequiredObjClasses = {
	"SupplyRocket",
},
}

function IsFoundersRocket:__eval(obj, context)
	return obj.category == "founder"
end

UndefineClass('IsMysteryActive')
DefineClass.IsMysteryActive = {
	__parents = { "Condition", },
	properties = {
		{ id = "Mystery", name = "Mystery", 
			editor = "choice", default = false, items = function (self) return ClassDescendantsList("MysteryBase") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Is mystery <Mystery> active"),
	DescriptionNeg = Untranslated("Is mystery <Mystery> not active"),
}

function IsMysteryActive:__eval(obj, context)
	return self.Mystery and IsKindOf(UICity.mystery, self.Mystery)
end

function IsMysteryActive:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsRocketID')
DefineClass.IsRocketID = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "rocket_id", name = "Rocket ID", 
			editor = "text", default = false, },
	},
	Description = T(791896416077, "Is Rocket Id <rocket_id>"),
	DescriptionNeg = T(342912052918, "Is Rocket Id not <rocket_id>"),
}

function IsRocketID:__eval(obj, context)
	return obj.custom_id == self.rocket_id
end

UndefineClass('IsRocketStatus')
DefineClass.IsRocketStatus = {
	__parents = { "Condition", },
	properties = {
		{ id = "Status", 
			editor = "choice", default = "on earth", items = function (self) return RocketStatusComboItems end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Is rocket <Status>"),
	DescriptionNeg = Untranslated("Is rocket not <Status>"),
	RequiredObjClasses = {
	"SupplyRocket",
},
}

function IsRocketStatus:__eval(obj, context)
	return obj:IsRocketStatus(self.Status)
end

UndefineClass('IsRocketType')
DefineClass.IsRocketType = {
	__parents = { "Condition", },
	properties = {
		{ id = "Type", 
			editor = "choice", default = "Any", items = function (self) return RocketTypeComboItems end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = "",
	DescriptionNeg = "",
	RequiredObjClasses = {
	"SupplyRocket",
},
}

function IsRocketType:GetEditorView()
	return self.Negate and T(11854, "Rocket is <Type>") or T(11855, "Rocket is not <Type>")
end

function IsRocketType:__eval(obj, context)
	if self.Type == "Any" then return true end
	if self.Type == "Trade" then return obj:IsKindOf("TradeRocket") end
	if self.Type == "Refugee" then return obj:IsKindOf("RefugeeRocket") end
	
	return (self.Type == "Cargo") == (obj.category == "cargo")
end

UndefineClass('IsSolInRange')
DefineClass.IsSolInRange = {
	__parents = { "Condition", },
	properties = {
		{ id = "Min", name = "Min sol", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Max", name = "Max sol", 
			editor = "number", default = 10, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = Untranslated("<Min> <= sol <= <Max>"),
}

function IsSolInRange:__eval(obj, context)
	return UICity.day>=self:ResolveValue("Min",context) and UICity.day<=self:ResolveValue("Max",context)
end

UndefineClass('IsSponsor')
DefineClass.IsSponsor = {
	__parents = { "Condition", },
	properties = {
		{ id = "SponsorName", name = "Sponsor Name", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("MissionSponsorPreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = T(393331541770, "<display_name('MissionSponsorPreset',SponsorName)>"),
	DescriptionNeg = T(256907425108, "not <display_name('MissionSponsorPreset',SponsorName)>"),
}

function IsSponsor:__eval(obj, context)
	return GetMissionSponsor().name == self.SponsorName
end

function IsSponsor:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsSponsors')
DefineClass.IsSponsors = {
	__parents = { "Condition", },
	properties = {
		{ id = "Sponsors", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("MissionSponsorPreset") end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = T(299678364320, "Sponsor is <NamesText>"),
	DescriptionNeg = T(886907915754, "Sponsor isn't <NamesText>"),
}

function IsSponsors:__eval(obj, context)
	return table.find(self.Sponsors, GetMissionSponsor().name)
end

function IsSponsors:GetNamesText()
	local items = {}
	local sponsors = Presets.MissionSponsorPreset and Presets.MissionSponsorPreset.Default
	for i, name in ipairs(self.Sponsors) do
		items[i] = sponsors[name] and sponsors[name].display_name or ""
	end
	return table.concat(items, ", ")
end

function IsSponsors:__eval_relaxed(obj, context)
	return true
end

UndefineClass('IsSupplyPod')
DefineClass.IsSupplyPod = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Rocket is a Supply Pod"),
	DescriptionNeg = Untranslated("Rocket is not a Supply Pod"),
	RequiredObjClasses = {
	"SupplyRocket",
},
}

function IsSupplyPod:__eval(obj, context)
	return IsKindOf(obj, "SupplyPod")
end

UndefineClass('IsTechId')
DefineClass.IsTechId = {
	__parents = { "Condition", },
	properties = {
		{ id = "Field", 
			editor = "choice", default = false, items = function (self) return ResearchFieldsCombo() end, },
		{ id = "TechId", name = "Tech Id", 
			editor = "choice", default = false, items = function (self) return ResearchTechsCombo(self) end, },
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Is tech <TechId>"),
	DescriptionNeg = Untranslated("Is tech not <TechId>"),
	RequiredObjClasses = {
	"TechPreset",
},
}

function IsTechId:__eval(obj, context)
	return obj.id == self.TechId
end

UndefineClass('IsWorkplace')
DefineClass.IsWorkplace = {
	__parents = { "Condition", },
	properties = {
		{ id = "Building", 
			editor = "combo", default = "", items = function (self) return BuildingsCombo() end, },
	},
	Description = Untranslated("Colonist workplace is <Building>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function IsWorkplace:__eval(colonist, context)
	return colonist.workplace and colonist.workplace.template_name == self.Building
end

UndefineClass('PickFromLabel')
DefineClass.PickFromLabel = {
	__parents = { "Condition", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "Conditions", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Pick from <Label>, where <ConditionsFormat>"),
}

function PickFromLabel:ConditionsFormat()
	local t = {}
	for _, cond in ipairs(self.Conditions or empty_table) do
		t[#t + 1] = T{cond.EditorView, cond}
	end
	return table.concat(t, T(1000736, ", "))
end

function PickFromLabel:__eval(obj, context)
	if not self.Label then
		context:ShowError(self, "Label required!")
		return
	end
	local objs = GetObjectsByLabel(self.Label)
	if not objs or #objs == 0 then return end
	
	local list = {}
	for i = 1, #objs do
		local obj, ok = objs[i], true
		for _, condition in ipairs(self.Conditions or empty_table) do
			if not condition:Evaluate(obj, context) then
				ok = false
				break
			end
		end
		if ok then list[#list + 1] = obj end
	end
	
	if #list > 0 then
		context.object = AsyncRandElement(list)
		return true
	end
end

function PickFromLabel:GetWarning()
	if (self.Label or "") == "" then
		return "Label required!"
	end
	return Condition.GetWarning(self)
end

UndefineClass('PickResident')
DefineClass.PickResident = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "ParentBuildingLabel", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "ResidentConditions", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Pick Resident"),
	DescriptionNeg = Untranslated(""),
}

function PickResident:__eval(obj, context)
	local objs = GetObjectsByLabel(self.ParentBuildingLabel)
	if not objs or #objs == 0 then return end
	
	local building = AsyncRandElement(objs)
	if not building:IsKindOf("Residence") then return end
	local colonists = building.colonists
	
	local list = {}
	for i = 1, #colonists do
		local colonist, ok = colonists[i], true
		for _, condition in ipairs(self.ResidentConditions or empty_table) do
			if not condition:Evaluate(colonist, context) then
				ok = false
				break
			end
		end
		if ok then list[#list + 1] = colonist end
	end
	
	if #list > 0 then
		context.object = AsyncRandElement(list)
		return true
	end
end

UndefineClass('PickRocketWithStatus')
DefineClass.PickRocketWithStatus = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "Status", 
			editor = "choice", default = "on earth", items = function (self) return RocketStatusComboItems end, },
	},
	Description = Untranslated("Pick a rocket which is <Status>"),
	DescriptionNeg = Untranslated("Pick a rocket which is not <Status>"),
	RequiredObjClasses = false,
}

function PickRocketWithStatus:__eval(obj, context)
	local matching = {}
	for _, rocket in ipairs(UICity.labels.SupplyRocket) do
		if rocket:IsRocketStatus(self.Status) then
			matching[#matching + 1] = rocket
		end
	end
	
	if #matching > 0 then
		context.object = AsyncRandElement(matching)
		return true
	end
end

UndefineClass('PickShuttle')
DefineClass.PickShuttle = {
	__parents = { "Condition", },
	Description = Untranslated("Pick random flying shuttle"),
}

function PickShuttle:__eval(obj, context)
	local shuttles = UICity.labels.CargoShuttle
	if #shuttles > 0 then
		context.object = AsyncRandElement(shuttles)
		return true
	end
end

UndefineClass('PickWorker')
DefineClass.PickWorker = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
		{ id = "ParentBuildingLabel", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "WorkerConditions", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Pick Worker"),
	DescriptionNeg = Untranslated(""),
}

function PickWorker:__eval(obj, context)
	local objs = GetObjectsByLabel(self.ParentBuildingLabel)
	if not objs or #objs == 0 then return end
	
	local building = AsyncRandElement(objs)
	if not building:IsKindOf("Workplace") then return end
	
	local colonists = {}
	for i = 1, #building.workers do
		local shift = building.workers[i]
		for j = 1, #shift do
			table.insert(colonists, shift[j])
		end
	end
	
	local list = {}
	for i = 1, #colonists do
		local colonist, ok = colonists[i], true
		for _, condition in ipairs(self.WorkerConditions or empty_table) do
			if not condition:Evaluate(colonist, context) then
				ok = false
				break
			end
		end
		if ok then list[#list + 1] = colonist end
	end
	
	if #list > 0 then
		context.object = AsyncRandElement(list)
		return true
	end
end

UndefineClass('SupplyMissionsEnabled')
DefineClass.SupplyMissionsEnabled = {
	__parents = { "Condition", },
	properties = {
		{ id = "Negate", name = "Negate Condition", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Supply missions enabled"),
	DescriptionNeg = Untranslated("Supply missions disabled"),
	RequiredObjClasses = false,
}

function SupplyMissionsEnabled:__eval(obj, context)
	return g_Consts.SupplyMissionsEnabled == 1
end

