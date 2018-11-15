-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('ActivateStoryBit')
DefineClass.ActivateStoryBit = {
	__parents = { "Effect", },
	properties = {
		{ id = "Id", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("StoryBit") end, },
		{ id = "ForcePopup", name = "Force Popup", help = "Specifying true skips the notification phase, and directly displays the popup", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Activate StoryBit <Id>"),
	NoIngameDescription = true,
}

function ActivateStoryBit:Execute(obj, context)
	ForceActivateStoryBit(self.Id, obj, self.ForcePopup and "immediate", context)
end

UndefineClass('AddBuildingExtraCost')
DefineClass.AddBuildingExtraCost = {
	__parents = { "Effect", },
	properties = {
		{ id = "BuildingClass", name = "Building", 
			editor = "combo", default = "", items = function (self) return BuildingClassesCombo() end, },
		{ id = "Resource", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "Amount", 
			editor = "number", default = 1000, scale = "Resources", },
	},
	Description = Untranslated("Add <Amount> extra <Resource> cost to <BuildingClass>"),
}

function AddBuildingExtraCost:Execute(obj, context)
	UICity:ModifyConstructionCost("add", self.BuildingClass, self.Resource, 0, self.Amount, "StoryBit")
end

UndefineClass('AddExpeditionRocketResources')
DefineClass.AddExpeditionRocketResources = {
	__parents = { "Effect", },
	properties = {
		{ id = "amount", 
			editor = "number", default = 0, scale = "Resources", min = 0, },
		{ id = "resource", 
			editor = "combo", default = "Metals", items = function (self) return { "Metals", "Concrete", "Food", "PreciousMetals", "Polymers", "Electronics", "MachineParts", "Fuel" } end, },
	},
	Description = Untranslated("Add <amount> of <resource> to expedition rocket."),
	RequiredObjClasses = {
	"RocketExpedition",
},
}

function AddExpeditionRocketResources:Execute(rocket, context)
	rocket:AppendCargo(self.resource, self.amount)
end

UndefineClass('AddTrait')
DefineClass.AddTrait = {
	__parents = { "Effect", },
	properties = {
		{ id = "Trait", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
	},
	Description = Untranslated("Add trait/specialization <Trait>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function AddTrait:Execute(colonist, context)
	if self.Trait and IsValid(colonist) and not colonist:IsDying() then
		if const.ColonistSpecialization[self.Trait] then
			colonist:SetSpecialization(self.Trait)
		else 
			colonist:RemoveIncompatibleTraitsWith(self.Trait)
			colonist:AddTrait(self.Trait)
		end
	end
end

UndefineClass('CallTradeRocket')
DefineClass.CallTradeRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "rocket_id", name = "rocket_id", 
			editor = "text", default = false, },
		{ id = "display_name", name = "display_name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "description", 
			editor = "text", default = false, translate = true, },
		{ id = "travel_time_mars", name = "Travel time (to Mars)", 
			editor = "number", default = 30000, scale = "hours", },
		{ id = "travel_time_earth", name = "Travel time (to Earth)", 
			editor = "number", default = 30000, scale = "hours", },
		{ id = "fuel_amount", name = "Fuel Amount", 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "resource1", name = "Resource", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount1", name = "Amount", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource2", name = "Resource", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount2", name = "Amount", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource3", name = "Resource", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount3", name = "Amount", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource4", name = "Resource", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount4", name = "Amount", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource5", name = "Resource", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount5", name = "Amount", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "funding_on_mars_launch", name = "Funding when rocket launches from mars.", 
			editor = "number", default = 0, },
	},
	Description = Untranslated("Calls a trade rocket"),
}

function CallTradeRocket:Execute(obj, context)
	local city = UICity
	assert(self.rocket_id ~= "", "CallTradeRocket StoryBit, missing rocket_id")
	local trade_request = {}
	for i = 1, 5 do
		local res = self["resource"..i]
		local amount = self["amount"..i]
		
		if res ~= "" and amount > 0 then
			table.insert(trade_request, {resource = res, amount = amount})
		end
	end
	assert(#trade_request > 0, "CallTradeRocket StoryBit, no resource/amount specified!")
	local rocket = PlaceBuilding("TradeRocket", {city = city, custom_id = self.rocket_id, export_goods = trade_request})
	
	
	local cargo = false
	if self.display_name ~= "" then
		cargo = { rocket_name = _InternalTranslate(self.display_name) }
	end
	if self.description ~= "" then
		rocket.description = self.description
	end
	
	if self.travel_time_mars >= 0 then
		rocket.custom_travel_time_mars = self.travel_time_mars
	end
	
	if self.travel_time_earth >= 0 then
		rocket.custom_travel_time_earth = self.travel_time_earth
	end
	
	if self.fuel_amount > 0 then
		rocket.launch_fuel = self.fuel_amount
	end
	
	if self.funding_on_mars_launch > 0 then
		rocket.story_bit_on_launch_funding = self.funding_on_mars_launch
	end
	rocket:SetCommand("FlyToMars", cargo)
	Sleep(1)
end

UndefineClass('CauseFault')
DefineClass.CauseFault = {
	__parents = { "Effect", },
	properties = {
		{ id = "Grid", 
			editor = "choice", default = false, items = function (self) return { {text = "Pipe", value = "water"}, {text = "Cable", value = "electricity"}} end, },
		{ id = "Amount", 
			editor = "number", default = 1, },
	},
	Description = Untranslated("<GetDescription>"),
	RequiredObjClasses = false,
}

function CauseFault:Execute(obj, context)
	for i = 1, self.Amount do
		table.rand(UICity[self.Grid]):BreakConnection()
	end
end

function CauseFault:GetDescription(context)
	local grid = self.Grid
	local extra_text = grid == "electricity" and "Cable Faults" or "Pipe Leaks"
	return string.format("Cause %d %s", self.Amount, extra_text)
end

UndefineClass('CauseFracture')
DefineClass.CauseFracture = {
	__parents = { "Effect", },
	properties = {
		{ id = "ChanceLarge", 
			editor = "number", default = 50, slider = true, min = 0, max = 100, },
	},
	Description = Untranslated("Cause Fracture"),
	RequiredObjClasses = {
	"Dome",
},
}

function CauseFracture:Execute(obj, context)
	local crack_type = (AsyncRand(100) < self.ChanceLarge) and "Large" or "Small"
	obj:AddFracture(crack_type)
end

UndefineClass('CreatePlanetaryAnomaly')
DefineClass.CreatePlanetaryAnomaly = {
	__parents = { "Effect", },
	properties = {
		{ id = "id", 
			editor = "text", default = false, },
		{ id = "display_name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", 
			editor = "text", default = false, translate = true, },
		{ id = "latitude", 
			editor = "number", default = -2147483648, },
		{ id = "longitude", 
			editor = "number", default = -2147483648, },
		{ id = "required_crew", 
			editor = "number", default = 0, },
		{ id = "required_drones", 
			editor = "number", default = 0, },
		{ id = "required_crew_specialization", 
			editor = "combo", default = false, items = function (self) return ColonistSpecializationCombo end, },
		{ id = "required_rover", 
			editor = "combo", default = false, items = function (self) return RoverTypesCombo end, },
	},
	Description = Untranslated("Create planetary anomaly with name <display_name>"),
}

function CreatePlanetaryAnomaly:Execute(obj, context)
	local lat = self.latitude ~= min_int and self.latitude or nil
	local lon = self.longitude ~= min_int and self.longitude or nil
	
	StoryBits_CreatePlanetaryAnomaly(self.id, self.display_name, self.description, lon, lat, self.required_crew, self.required_crew_specialization, self.required_rover, self.required_drones)
end

UndefineClass('DelayExpedition')
DefineClass.DelayExpedition = {
	__parents = { "Effect", },
	properties = {
		{ id = "Time", 
			editor = "number", default = 30000, scale = "hours", },
	},
	Description = Untranslated("Delay associated expedition rocket by <Time>"),
}

function DelayExpedition:Execute(rocket, context)
	rocket:AddExpeditionTime(self.Time)
end

UndefineClass('DeleteCargo')
DefineClass.DeleteCargo = {
	__parents = { "Effect", },
	Description = Untranslated("Delete rocket cargo"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function DeleteCargo:Execute(rocket, context)
	rocket.cargo = {}
end

UndefineClass('DestroyBuilding')
DefineClass.DestroyBuilding = {
	__parents = { "Effect", },
	properties = {
		{ id = "KillColonists", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Destroy Building"),
	RequiredObjClasses = {
	"Building",
},
	ForbiddenObjClasses = {
	"Dome",
	"ConstructionSite",
},
}

function DestroyBuilding:Execute(obj, context)
	obj:BlowUp(self.KillColonists, "StoryBit", "single_building")
end

UndefineClass('DestroyVehicle')
DefineClass.DestroyVehicle = {
	__parents = { "Effect", },
	Description = Untranslated("Destroy Vehicle"),
	RequiredObjClasses = {
	"Vehicle",
},
}

function DestroyVehicle:Execute(obj, context)
	obj:Destroy()
end

UndefineClass('DisableLanding')
DefineClass.DisableLanding = {
	__parents = { "Effect", },
	Description = Untranslated("Disable rocket landing"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function DisableLanding:Execute(rocket, context)
	rocket:SetCommand("LandingDisabled")
end

UndefineClass('DisableLaunch')
DefineClass.DisableLaunch = {
	__parents = { "Effect", },
	Description = Untranslated("Disable rocket launch"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function DisableLaunch:Execute(rocket, context)
	rocket.launch_disabled = true
	rocket:UpdateStatus("launch suspended")
end

UndefineClass('DiscoverTech')
DefineClass.DiscoverTech = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", 
			editor = "combo", default = "", items = function (self) return ResearchFieldsCombo() end, },
		{ id = "Tech", 
			editor = "combo", default = "", items = function (self) return ResearchTechsCombo(self, {value = "", text = Untranslated("-random-")}) end, },
		{ id = "Cost", name = "Cost (RP)", 
			editor = "number", default = -1, },
	},
	Description = T{352987824047, "<GetDescription>"},
}

function DiscoverTech:Execute(obj, context)
	local city = UICity
	local tech_id = self.Tech
	if tech_id == "" then
		local not_revealed_techs = {}
		local all_techs = Presets.TechPreset[self.Field] or ""
		for i = 1, #all_techs do
			local id = all_techs[i].id
			if not city:IsTechDiscovered(id) then
				not_revealed_techs[#not_revealed_techs + 1] = id
			end
		end
		tech_id = city:TableRand(not_revealed_techs)
		if not tech_id then
			return
		end
	end
	if not city:SetTechDiscovered(tech_id) then
		return
	end
	if self.Cost ~= -1 then
		city:ChangeResearchCost(tech_id, self.Cost)
	end
end

function DiscoverTech:GetDescription(context)
	if self.Tech == "" then
		return string.format("Reveal random tech in %s", self.Field)
	else
		return string.format("Reveal %s in %s", self.Tech, self.Field)
	end
end

UndefineClass('EffectPickRocketWithStatus')
DefineClass.EffectPickRocketWithStatus = {
	__parents = { "Effect", },
	properties = {
		{ id = "Status", 
			editor = "choice", default = "on earth", items = function (self) return RocketStatusComboItems end, },
	},
	Description = Untranslated("Pick a rocket which is <Status>"),
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function EffectPickRocketWithStatus:Execute(obj, context)
	local matching = {}
	for _, rocket in ipairs(UICity.labels.SupplyRocket) do
		if rocket:IsRocketStatus(self.Status) then
			matching[#matching + 1] = rocket
		end
	end
	
	if #matching > 0 then
		context.object = AsyncRandElement(matching)
	end
end

UndefineClass('EnableLanding')
DefineClass.EnableLanding = {
	__parents = { "Effect", },
	Description = Untranslated("Enable rocket landing"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function EnableLanding:Execute(rocket, context)
	Msg("LandingEnabled")
end

UndefineClass('EnableLaunch')
DefineClass.EnableLaunch = {
	__parents = { "Effect", },
	Description = Untranslated("Enable rocket launch"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function EnableLaunch:Execute(rocket, context)
	rocket.launch_disabled = false
	rocket:WakeFromWaitingForResources()
	rocket:UpdateStatus("ready for launch")
end

UndefineClass('EnableRandomStoryBit')
DefineClass.EnableRandomStoryBit = {
	__parents = { "Effect", },
	properties = {
		{ id = "StoryBits", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("StoryBit") end, },
		{ id = "Weights", 
			editor = "number_list", default = {}, item_default = 100, items = false, },
	},
	Description = Untranslated("Enable random event: <NamesText>"),
}

function EnableRandomStoryBit:Execute(obj, context)
	local items = {}
	for i, id in ipairs(self.StoryBits) do
		local state = g_StoryBitStates[id]
		if not state then
			local def = StoryBits[id]
			if not def then
				context:ShowError(self, "No such storybit", id)
			elseif not def.Enabled then
				local w = self.Weights[i] or 100
				items[i] = {id = id, w = w}
			end
		end
	end
	local item = table.weighted_rand(items, "w")
	if not item then
		return
	end
	local storybit = StoryBits[item.id]
	StoryBitState:new{
		id = item.id,
		object = storybit.InheritsObject and context.object or nil,
		inherited_title = context:GetTitle(),
		inherited_image = context:GetImage(),
	}
end

function EnableRandomStoryBit:GetNamesText()
	local items = {}
	for i, id in ipairs(self.StoryBits) do
		local w = self.Weights[i]
		if w then
			id = id .. " (" .. w .. ")"
		end
		items[i] = id
	end
	return Untranslated(table.concat(items, ", "))
end

UndefineClass('EraseColonist')
DefineClass.EraseColonist = {
	__parents = { "Effect", },
	Description = Untranslated("Erase colonist"),
	RequiredObjClasses = {
	"Colonist",
},
}

function EraseColonist:Execute(colonist, context)
	colonist:SetCommand("Erase")
end

UndefineClass('EraseObject')
DefineClass.EraseObject = {
	__parents = { "Effect", },
	Description = Untranslated("Erase object"),
}

function EraseObject:Execute(obj, context)
	DoneObject(obj)
end

UndefineClass('EraseShuttles')
DefineClass.EraseShuttles = {
	__parents = { "Effect", },
	properties = {
		{ id = "Count", 
			editor = "number", default = 1, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "LogicalObjectOnly", 
			editor = "bool", default = true, },
		{ id = "IdleShuttlesFirst", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Erase <Count> shuttles"),
}

function EraseShuttles:Execute(obj, context)
	local count = self:ResolveValue("Count", context)
	RemoveShuttles(count, self.IdleShuttlesFirst, self.LogicalObjectOnly)
end

UndefineClass('ExplodeBuilding')
DefineClass.ExplodeBuilding = {
	__parents = { "Effect", },
	properties = {
		{ id = "KillColonists", 
			editor = "bool", default = true, },
		{ id = "Radius", 
			editor = "number", default = 2000, scale = 100, },
	},
	Description = Untranslated("Explode Building"),
	RequiredObjClasses = {
	"Building",
},
	ForbiddenObjClasses = {
	"Dome",
	"ConstructionSite",
},
}

function ExplodeBuilding:Execute(obj, context)
	local action = function(obj, kill)
		if not obj:IsKindOf("Dome") then
			obj:BlowUp(kill, "StoryBit")
		end
	end
	MapForEach(obj:GetPos(), self.Radius, "Building" , action, self.KillColonists)
end

UndefineClass('ExplodeRocket')
DefineClass.ExplodeRocket = {
	__parents = { "Effect", },
	Description = Untranslated("Explodes a landed rocket"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function ExplodeRocket:Execute(rocket, context)
	local pos = rocket:GetPos()
	PlayFX("RocketExplosion", "start", rocket, nil, pos)
	DoneObject(rocket.landing_site)
	DoneObject(rocket)
end

UndefineClass('ExtendDisaster')
DefineClass.ExtendDisaster = {
	__parents = { "Effect", },
	properties = {
		{ id = "Time", 
			editor = "number", default = 1, },
		{ id = "Disaster", 
			editor = "combo", default = false, items = function (self) return {"Cold Wave", "Dust Storm"} end, },
	},
	Description = Untranslated("Extend disaster"),
}

function ExtendDisaster:Execute(obj, context)
	if self.Disaster == "Cold Wave" then
		ExtendColdWave(self.Time * const.HourDuration)
	elseif self.Disaster == "Dust Storm" then
		ExtendDustStorm(self.Time * const.HourDuration)
	end
end

UndefineClass('Fireworks')
DefineClass.Fireworks = {
	__parents = { "Effect", },
	Description = Untranslated("Trigger fireworks"),
}

function Fireworks:Execute(obj, context)
	TriggerFireworks()
end

UndefineClass('ForEachExecuteEffects')
DefineClass.ForEachExecuteEffects = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "InDome", 
			editor = "bool", default = false, },
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Zero leaves all objects in", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", 
			editor = "number", default = 100, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{10900, "For each <ObjName>: <EffectsList>"}, translate = true, },
	},
}

function ForEachExecuteEffects:Execute(obj, context)
	if not self.Label then
		context:ShowError(self, "Label required!")
		return
	end
	local objs
	if not self.InDome then
		objs = table.copy(GetObjectsByLabel(self.Label) or empty_table)
	elseif obj then
		objs = table.copy(obj.labels[self.Label] or empty_table)
	else
		objs = {}
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
				table.append(objs, dome.labels[self.Label])
		end
	end
	
	for _, condition in ipairs(self.Filters or empty_table) do
		for i = #objs, 1, -1 do
			if not condition:Evaluate(objs[i], context) then
				objs[i] = objs[#objs]
				objs[#objs] = nil
			end
		end
	end
	
	local percent = self:ResolveValue("RandomPercent", context)
	local cap = self:ResolveValue("RandomCount", context)
	local count = Min(#objs, MulDivRound(#objs, percent, 100))
	if cap ~= 0 then
		count = Min(cap, count)
	end
	
	table.shuffle(objs)
	for _, effect in ipairs(self.Effects or empty_table) do
		for i = 1, count do
			effect:Execute(objs[i], context)
		end
	end
end

function ForEachExecuteEffects:EffectsList()
	local list = {}
	for _,effect in ipairs(self.Effects or empty_table) do
		list[#list + 1] = Untranslated(effect.class)
	end
	return table.concat(list, T{1000736, ", "})
end

function ForEachExecuteEffects:GetObjName(obj, context)
	local prefix = self.InDome and "Dome." or ""
	return Untranslated(prefix .. (self.Label or "Object"))
end

function ForEachExecuteEffects:GetWarning()
	if (self.Label or "") == "" then
		return "Label required!"
	end
	return Effect.GetWarning(self)
end

UndefineClass('ForEachResident')
DefineClass.ForEachResident = {
	__parents = { "Effect", },
	properties = {
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Zero leaves all objects in", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", 
			editor = "number", default = 100, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{782971730643, "For each resident: <EffectsList>"}, translate = true, },
	},
	RequiredObjClasses = {
	"Residence",
},
}

function ForEachResident:Execute(obj, context)
	local objs = obj.colonists
	
	for _, condition in ipairs(self.Filters or empty_table) do
		for i = #objs, 1, -1 do
			if not condition:Evaluate(objs[i], context) then
				objs[i] = objs[#objs]
				objs[#objs] = nil
			end
		end
	end
	
	local percent = self:ResolveValue("RandomPercent", context)
	local cap = self:ResolveValue("RandomCount", context)
	local count = Min(#objs, MulDivRound(#objs, percent, 100))
	if cap ~= 0 then
		count = Min(cap, count)
	end
	
	table.shuffle(objs)
	for _, effect in ipairs(self.Effects or empty_table) do
		for i = 1, count do
			effect:Execute(objs[i], context)
		end
	end
end

function ForEachResident:EffectsList()
	local list = {}
	for _,effect in ipairs(self.Effects or empty_table) do
		list[#list + 1] = Untranslated(effect.class)
	end
	return table.concat(list, T{1000736, ", "})
end

UndefineClass('ForEachWorker')
DefineClass.ForEachWorker = {
	__parents = { "Effect", },
	properties = {
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Zero leaves all objects in", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", 
			editor = "number", default = 100, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{814803812237, "For each worker: <EffectsList>"}, translate = true, },
	},
	RequiredObjClasses = {
	"Workplace",
},
}

function ForEachWorker:Execute(obj, context)
	local objs = {}
	for i = 1, #obj.workers do
		local shift = obj.workers[i]
		for j = 1, #shift do
			table.insert(objs, shift[j])
		end
	end
	
	for _, condition in ipairs(self.Filters or empty_table) do
		for i = #objs, 1, -1 do
			if not condition:Evaluate(objs[i], context) then
				objs[i] = objs[#objs]
				objs[#objs] = nil
			end
		end
	end
	
	local percent = self:ResolveValue("RandomPercent", context)
	local cap = self:ResolveValue("RandomCount", context)
	local count = Min(#objs, MulDivRound(#objs, percent, 100))
	if cap ~= 0 then
		count = Min(cap, count)
	end
	
	table.shuffle(objs)
	for _, effect in ipairs(self.Effects or empty_table) do
		for i = 1, count do
			effect:Execute(objs[i], context)
		end
	end
end

function ForEachWorker:EffectsList()
	local list = {}
	for _,effect in ipairs(self.Effects or empty_table) do
		list[#list + 1] = Untranslated(effect.class)
	end
	return table.concat(list, T{1000736, ", "})
end

UndefineClass('ForceSuicide')
DefineClass.ForceSuicide = {
	__parents = { "Effect", },
	Description = Untranslated("Force suicide"),
	RequiredObjClasses = {
	"Colonist",
},
}

function ForceSuicide:Execute(colonist, context)
	colonist.force_suicide = true
end

UndefineClass('FreezeBuilding')
DefineClass.FreezeBuilding = {
	__parents = { "Effect", },
	Description = Untranslated("Freeze building"),
	RequiredObjClasses = {
	"ColdSensitive",
},
}

function FreezeBuilding:Execute(obj, context)
	if GetHeatAt(obj) < obj.freeze_heat then
		obj:SetFrozen(true)
	end
end

UndefineClass('FreezeDrone')
DefineClass.FreezeDrone = {
	__parents = { "Effect", },
	Description = Untranslated("Freeze Drone"),
	RequiredObjClasses = {
	"DroneBase",
},
}

function FreezeDrone:Execute(drone, context)
	drone:SetDisablingCommand("Freeze")
end

UndefineClass('KillColonist')
DefineClass.KillColonist = {
	__parents = { "Effect", },
	properties = {
		{ id = "DeathReason", 
			editor = "choice", default = "StoryBit", items = function (self) return table.keys(DeathReasons, true) end, },
	},
	Description = Untranslated("Kill colonist with reason <DeathReasonText>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function KillColonist:Execute(colonist, context)
	colonist:SetCommand("Die", self.DeathReason)
end

function KillColonist:GetDeathReasonText(colonist, context)
	return DeathReasons[self.DeathReason] or ""
end

UndefineClass('KillExpedition')
DefineClass.KillExpedition = {
	__parents = { "Effect", },
	Description = Untranslated("Destroys associated expedition"),
}

function KillExpedition:Execute(rocket, context)
	rocket:KillExpedition()
end

UndefineClass('LockUnlockBuildingFromBuildMenu')
DefineClass.LockUnlockBuildingFromBuildMenu = {
	__parents = { "Effect", },
	properties = {
		{ id = "Building", 
			editor = "choice", default = false, items = function (self) return BuildingsCombo{value = false, text = T{10998, "-associated object-"}} end, },
		{ id = "Lock", 
			editor = "bool", default = false, },
		{ id = "Message", 
			editor = "text", default = T{401896326435, "You can't construct this building at this time"}, translate = true, },
	},
	Description = Untranslated("<LockText> <Building> from building menu"),
}

function LockUnlockBuildingFromBuildMenu:Execute(obj, context)
	local bld = self.Building or obj.template_name
	BuildMenuPrerequisiteOverrides[bld] = self.Lock and self.Message or nil
end

function LockUnlockBuildingFromBuildMenu:GetLockText(obj, context)
	return Untranslated(self.Lock and "Lock" or "Unlock")
end

UndefineClass('LoseFundingPercent')
DefineClass.LoseFundingPercent = {
	__parents = { "Effect", },
	properties = {
		{ id = "Percent", 
			editor = "number", default = 10, 
			buttons = { { "Param", "PickParam" } }, scale = "%", },
	},
	Description = T{160558783655, "Lose <funding(LostFunding)> in funding"},
	EditorView = Untranslated("Lose <Percent>% in funding"),
}

function LoseFundingPercent:Execute(obj, context)
	UICity:ChangeFunding(-self:GetLostFunding(context))
end

function LoseFundingPercent:GetLostFunding(context)
	return (UICity.funding * self:ResolveValue("Percent", context) / 100) / 1000000 * 1000000
end

UndefineClass('Malfunction')
DefineClass.Malfunction = {
	__parents = { "Effect", },
	Description = Untranslated("Malfunction"),
	RequiredObjClasses = {
	"Building",
	"BaseRover",
},
}

function Malfunction:Execute(obj, context)
	obj:SetMalfunction()
end

UndefineClass('MalfunctionRocket')
DefineClass.MalfunctionRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "Resource", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, scale = "Resources", },
	},
	Description = Untranslated("Malfunction rocket and require <Amount> <Resource> to be able to launch"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	ForbiddenObjClasses = false,
}

function MalfunctionRocket:Execute(rocket, context)
	table.insert_unique(g_LandedRocketsInNeedOfFuel, rocket)
	local amount = self:ResolveValue("Amount", context)
	rocket:SetCommand("WaitMaintenance", self.Resource, amount)
end

UndefineClass('Marsquake')
DefineClass.Marsquake = {
	__parents = { "Effect", },
	properties = {
		{ category = "General", id = "Epicenter", name = "Epicenter", help = "Choose an epicenter of the Marsquake via a given label (choosing a random building from that label as the origin).", 
			editor = "combo", default = "Building", items = function (self) return LabelsCombo() end, },
		{ category = "General", id = "Radius", name = "Radius", help = "Marsquake radius given in number of hexes.", 
			editor = "number", default = 20, min = 0, },
		{ category = "General", id = "TargetsCount", name = "Targets Count", help = "Number of buildings to malfunction.", 
			editor = "number", default = 5, min = 0, },
	},
	Description = Untranslated("Marsquake."),
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function Marsquake:Execute(obj, context)
	local center_building, affected_buildings = self:ChooseBuildings()
	
	local destroy_force = 500
	local shake_force = destroy_force / 2
	
	local durations = { }
	local total_duration = 0
	for i=1,#affected_buildings do
		local duration = 300 + AsyncRand(1200)
		table.insert(durations, duration)
		total_duration = total_duration + duration
	end
	
	PlayFX("Marsquake", "start", center_building)
	self:ShakeCamera(durations[1], 0, shake_force)
	CreateRealTimeThread(self.ShakeCamera, self, total_duration, shake_force)
	for i=1,#affected_buildings do
		Sleep(durations[i])
		local bld = affected_buildings[i]
		if IsValid(bld) then
			PlayFXAroundBuilding(bld, "Demolish")
			PlayFX("MarsquakeMalfunction", "start", bld)
			bld:SetMalfunction()
		end
	end
	
	PlayFX("Marsquake", "end", center_building)
	self:ShakeCamera(2000, shake_force, 0)
end

function Marsquake:ChooseBuildings()
	local label = UICity.labels[self.Epicenter]
	if not label or not next(label) then return end
	local center_building = table.rand(label)
	
	--find surrounding buildings
	local q, r = WorldToHex(center_building:GetPos())
	local buildings_in_range = HexGridGetObjectsInRange(ObjectGrid, q, r, self.Radius)
	table.shuffle(buildings_in_range)
	
	--choose buildings to destroy
	local affected_buildings = { }
	for i=1,#buildings_in_range do
		local bld = buildings_in_range[i]
		if IsKindOf(bld, "RequiresMaintenance") and
			bld:DoesRequireMaintenance() and
			not bld:IsMalfunctioned()
		then
			table.insert(affected_buildings, bld)
			if #affected_buildings == self.TargetsCount then
				break
			end
		end
	end
	
	return center_building, affected_buildings
end

function Marsquake:ShakeCamera(total_time, start_force, end_force)
	total_time = total_time or 1000
	start_force = start_force or 300
	end_force = end_force or start_force
	local force_lerp = ValueLerp(start_force, end_force, total_time)
	
	local starting_pos, starting_lookat = cameraRTS.GetPosLookAt()
	local dir2D_original = starting_lookat:SetZ(0)- starting_pos:SetZ(0)
	
	local shake = true
	
	local start_time = now()
	local end_time = now() + total_time
	while true do
		local passed_time = now() - start_time
		if passed_time >= total_time then
			break
		end
		
		if not IsCameraLocked() then
			local dir2D
			local next_pos, next_lookat
			
			--calculate where the camera will move next
			if shake then
				--calculate interpolated force
				local force = force_lerp(passed_time)
				local offset = MulDivRound(force, guim, 100)
				dir2D = SetLen(dir2D_original, offset)
				next_pos = starting_pos + dir2D
				next_lookat = starting_lookat + dir2D
			else
				--return to starting position
				next_pos, next_lookat = starting_pos, starting_lookat
			end
			
			--shake the camera
			cameraRTS.SetCamera(next_pos, next_lookat)
			local duration = 30 + AsyncRand(40)
			Sleep(duration)
			
			--allow the player to control the camera
			local cam_pos, cam_lookat = cameraRTS.GetPosLookAt()
			
			if not IsCameraLocked() then
				if cam_pos ~= next_pos or cam_lookat ~= next_lookat then
					if shake then
						starting_pos = cam_pos - dir2D
						starting_lookat = cam_lookat - dir2D
					else
						starting_pos = cam_pos
						starting_lookat = cam_lookat
					end
					dir2D_original = starting_lookat:SetZ(0)- starting_pos:SetZ(0)
				end
			end
			
			shake = not shake
		else
			Sleep(100)
		end
	end
end

UndefineClass('ModifyCargoPrice')
DefineClass.ModifyCargoPrice = {
	__parents = { "Effect", },
	properties = {
		{ id = "Cargo", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("Cargo", false, { "-all-", "-associated cargo object-" }) end, },
		{ id = "Percent", 
			editor = "number", default = 100, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = Untranslated("Modify price of <Cargo> by <Percent>%"),
}

function ModifyCargoPrice:Execute(obj, context)
	local cargo = self.Cargo
	local percent = self:ResolveValue("Percent", context)
	if cargo == "" or cargo == "-all-" then
		ModifyResupplyParams("price", percent)
		return
	end
	if cargo == "-associated cargo object-" then
		cargo = obj.id
	end
	if not CargoPreset[cargo] then
		context:ShowError(self, "No such cargo preset", cargo)
		return
	end
	if not RocketPayload_GetMeta(cargo) then
		context:ShowError(self, "The specified cargo isn't regstered as a supply:", cargo)
		return
	end
	ModifyResupplyParam(cargo, "price", percent)
end

UndefineClass('ModifyColonistStat')
DefineClass.ModifyColonistStat = {
	__parents = { "Effect", },
	properties = {
		{ id = "Stat", 
			editor = "combo", default = false, items = function (self) return {"Health", "Sanity", "Comfort"} end, },
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Percent", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Reason", 
			editor = "text", default = T{532997211205, "Special effect"}, translate = true, },
	},
	Description = Untranslated("Change <Stat>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function ModifyColonistStat:Execute(obj, context)
	local stat = obj["stat_"..self.Stat:lower()]
	local amount = self:ResolveValue("Amount", context)
	local percent = self:ResolveValue("Percent", context)
	local new_amount = MulDivRound(stat, percent or 0, 100) + (amount or 0) * const.Scale.Stat
	obj:ChangeStat(self.Stat, new_amount, self.Reason.." ")
end

UndefineClass('ModifyConst')
DefineClass.ModifyConst = {
	__parents = { "Effect", },
	properties = {
		{ id = "Const", 
			editor = "choice", default = false, items = function (self) return ClassPropertiesCombo("Consts") end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive makes the modification temporary", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "sols", step = 720000, slider = true, min = 720000, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
	},
	Description = Untranslated("Modify <Const>"),
}

function ModifyConst:Execute(colonist, context)
	local id = self.ModifyId or self
	local amount = self:ResolveValue("Amount", context)
	local percent = self:ResolveValue("Percent", context)
	g_Consts:SetModifier(self.Const, id, amount, percent)
	local duration = self:ResolveValue("Sols", context)
	if amount ~= 0 and percent ~= 0 and duration > 0 then
		CreateGameTimeThread(function()
			Sleep(duration)
			g_Consts:SetModifier(self.Const, id, 0, 0)
		end)
	end
end

UndefineClass('ModifyLabel')
DefineClass.ModifyLabel = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = "", items = function (self) return LabelsCombo() end, },
		{ id = "InDome", 
			editor = "bool", default = false, },
		{ id = "Prop", name = "Property", 
			editor = "combo", default = "", items = function (self) return ModifiablePropsCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive makes the modification temporary", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "sols", step = 720000, slider = true, min = 720000, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
		{ id = "Reason", help = "Used in the UI", 
			editor = "text", default = T{367924149812, "Special effect <opt_amount(amount)> <opt_percent(percent)>"}, translate = true, },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{11167, "<u(DomeText)><u(Label)>.<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"}, translate = true, },
	},
}

function ModifyLabel:Execute(obj, context)
	local ctrl = self.InDome and obj or UICity
	local scale = ModifiablePropScale[self.Prop]
	if not scale then
		context:ShowError(self, "Trying to modify a non-modifiable property", self.Prop)
		return
	end
	local unscaled_amount =  self:ResolveValue("Amount", context)
	local amount =unscaled_amount * scale
	local percent = self:ResolveValue("Percent", context)
	local mod
	if amount ~= 0 or percent ~= 0 then
		mod = Modifier:new{
			prop = self.Prop,
			amount = amount,
			percent = percent,
			id = "ModifyLabel_effect",
			display_text =  T{11670, "<color_tag><reason></color>", color_tag = amount >=0 and TLookupTag("<green>") or TLookupTag("<red>"), reason = T{self.Reason, amount = unscaled_amount, percent = percent}},
		}
	end
	local id = self
	if self.ModifyId then
		-- create unique string id
		id = "Storybit_" .. self.ModifyId .. "_" .. self.Prop
	end
	ctrl:SetLabelModifier(self.Label, id, mod)
	local duration = self:ResolveValue("Sols", context)
	if mod and duration > 0 then
		CreateGameTimeThread(function()
			Sleep(duration)
			ctrl:SetLabelModifier(self.Label, id)
		end)
	end
end

function ModifyLabel:GetDomeText(obj, context)
	return self.InDome and "Dome." or ""
end

UndefineClass('ModifyObject')
DefineClass.ModifyObject = {
	__parents = { "Effect", },
	properties = {
		{ id = "Prop", name = "Property", 
			editor = "combo", default = "", items = function (self) return ModifiablePropsCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive makes the modification temporary", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "sols", step = 720000, slider = true, min = 720000, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
		{ id = "Reason", help = "Used in the UI", 
			editor = "text", default = T{367924149812, "Special effect <opt_amount(amount)> <opt_percent(percent)>"}, translate = true, },
	},
	Description = Untranslated("<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"),
	RequiredObjClasses = {
	"Modifiable",
},
}

function ModifyObject:Execute(obj, context)
	local scale = ModifiablePropScale[self.Prop]
	if not scale then
		context:ShowError(self, "Trying to modify a non-modifiable property", self.Prop)
		return
	end
	if not obj:HasMember("base_" .. self.Prop) then
		context:ShowError(self, "No such modifiable property", obj.class .. "." .. self.Prop)
		return
	end
	local id = self.ModifyId or self
	local unscaled_amount = self:ResolveValue("Amount", context) 
	local amount = unscaled_amount * scale
	local percent = self:ResolveValue("Percent", context)
	obj:SetModifier(self.Prop, id, amount, percent, T{11670, "<color_tag><reason></color>", color_tag = amount >=0 and TLookupTag("<green>") or TLookupTag("<red>"), reason = T{self.Reason, amount = unscaled_amount, percent = percent}})
	local duration = self:ResolveValue("Sols", context)
	if (amount ~= 0 or percent ~= 0) and duration > 0 then
		CreateGameTimeThread(function()
			Sleep(duration)
			obj:SetModifier(self.Prop, id,  0, 0)
		end)
	end
end

UndefineClass('ModifyStatus')
DefineClass.ModifyStatus = {
	__parents = { "Effect", },
	properties = {
		{ id = "Status", 
			editor = "combo", default = false, items = function (self) return ClassDescendantsCombo("StatusEffect") end, },
		{ id = "Apply", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Add or remove <Status> from colonist"),
	RequiredObjClasses = {
	"Colonist",
},
}

function ModifyStatus:Execute(colonist, context)
	if self.Status and self.Status ~= "" then
		colonist:Affect(self.Status, self.Apply)
	end
end

UndefineClass('PauseExpedition')
DefineClass.PauseExpedition = {
	__parents = { "Effect", },
	Description = Untranslated("Pause expedition"),
}

function PauseExpedition:Execute(rocket, context)
	rocket:PauseExpedition()
end

UndefineClass('PauseResearch')
DefineClass.PauseResearch = {
	__parents = { "Effect", },
	properties = {
		{ id = "Time", 
			editor = "number", default = 1, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "ResearchType", 
			editor = "choice", default = "sponsor", items = function (self) return {{value = "sponsor", text = T{11168, "sponsor"}}, {value = "outsource", text = T{11169, "outsource"}}} end, },
	},
	Description = T{202067797176, "Pause <ResearchTypeText> research"},
}

function PauseResearch:Execute(obj, context)
	local paused_time = const.DayDuration * self:ResolveValue("Time", context)
	local rtype = self.ResearchType
	if rtype == "" or rtype == "outsource" then
		UICity.paused_outsource_research_end_time = (UICity.paused_outsource_research_end_time or GameTime()) + paused_time
	end
	if rtype == "" or rtype == "sponsor" then
		UICity.paused_sponsor_research_end_time = (UICity.paused_sponsor_research_end_time or GameTime()) + paused_time
	end
end

function PauseResearch:GetResearchTypeText(obj, context)
	if self.ResearchType == "sponsor" then
		return T{11168, "sponsor"}
	elseif self.ResearchType == "outsource" then
		return T{11169, "outsource"}
	end
	return ""
end

UndefineClass('PayFunding')
DefineClass.PayFunding = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = 1000000000, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = T{407408618445, "<funding(Amount)>"},
	EditorView = T{665594954399, "Pay funding: <Amount>"},
}

function PayFunding:Execute(obj, context)
	UICity:ChangeFunding(-self:ResolveValue("Amount", context))
end

UndefineClass('PickCargo')
DefineClass.PickCargo = {
	__parents = { "Effect", },
	properties = {
		{ id = "CargoList", name = "Cargo List", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("Cargo") end, },
	},
}

function PickCargo:Execute(obj, context)
	local cargos = {}
	for _, id in ipairs(self.CargoList) do
		cargos[#cargos + 1] = id
	end
	context.object = CargoPreset[AsyncRandElement(cargos)]
end

function PickCargo:GetDescription()
	return T{10896, "Pick cargo from <list>", list = Untranslated(table.concat(self.CargoList, ", ")) }
end

UndefineClass('PickFromLabelEffect')
DefineClass.PickFromLabelEffect = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "InDome", 
			editor = "bool", default = false, },
		{ id = "PickDifferent", 
			editor = "bool", default = false, },
		{ id = "Conditions", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Pick one <ObjName>, where <ConditionsFormat>"),
}

function PickFromLabelEffect:ConditionsFormat()
	local t = {}
	for _,cond in ipairs(self.Conditions) do
		t[#t + 1] = Untranslated(cond.class)
	end
	return table.concat(t, T{1000736, ", "})
end

function PickFromLabelEffect:GetObjName(obj, context)
	local prefix = self.InDome and "Dome." or ""
	return Untranslated(prefix .. (self.Label or "Object"))
end

function PickFromLabelEffect:Execute(obj, context)
	if not self.Label then
		context:ShowError(self, "Label required!")
		return
	end
	local objs
	if not self.InDome then
		objs = GetObjectsByLabel(self.Label)
	elseif obj then
		objs = obj.labels[self.Label]
	else
		objs = {}
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
				table.append(objs, dome.labels[self.Label])
		end
	end
	
	local list = {}
	for _, obj_i in ipairs(objs or empty_table) do
		local ok = true
		if not self.PickDifferent or obj_i ~= obj then
			for _, condition in ipairs(self.Conditions or empty_table) do
				if not condition:Evaluate(obj_i, context) then
					ok = false
					break
				end
			end
		end
		if ok then list[#list + 1] = obj_i end
	end
	
	context.object = AsyncRandElement(list)
end

UndefineClass('RemoveAllTraits')
DefineClass.RemoveAllTraits = {
	__parents = { "Effect", },
	Description = Untranslated("Remove all traits"),
	RequiredObjClasses = {
	"Colonist",
},
	ForbiddenObjClasses = false,
}

function RemoveAllTraits:Execute(colonist, context)
	local additional_autotraits_to_remove= {"Renegade"}
	colonist:RemoveAllTraits(additional_autotraits_to_remove)
end

UndefineClass('RemoveTrait')
DefineClass.RemoveTrait = {
	__parents = { "Effect", },
	properties = {
		{ id = "Trait", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
	},
	Description = Untranslated("Remove trait <Trait>"),
	RequiredObjClasses = {
	"Colonist",
},
}

function RemoveTrait:Execute(colonist, context)
	local trait_id = self.Trait
	if trait_id and IsValid(colonist) and not colonist:IsDying()  and colonist.traits[trait_id] then
		colonist:RemoveTrait(trait_id)
	end
end

UndefineClass('RenameAssociatedObject')
DefineClass.RenameAssociatedObject = {
	__parents = { "Effect", },
	properties = {
		{ id = "Name", 
			editor = "text", default = false, translate = true, },
	},
	Description = Untranslated(""),
	RequiredObjClasses = {
	"Renamable",
},
}

function RenameAssociatedObject:Execute(obj, context)
	if self.Name then
		obj.name = self.Name
	end
end

UndefineClass('RenameObject')
DefineClass.RenameObject = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "Filters", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{700526274387, "Rename object"}, translate = true, },
		{ id = "Name", 
			editor = "text", default = false, translate = true, },
	},
	RequiredObjClasses = {
	"Renamable",
},
}

function RenameObject:Execute(obj, context)
	local new_name
	if self.Name and self.Name ~= "" then
		new_name = self.Name
	else
		new_name = obj.name
	end
	local objs
	
	objs = table.copy(GetObjectsByLabel(self.Label) or empty_table)
	
	for _, condition in ipairs(self.Filters or empty_table) do
		for i = #objs, 1, -1 do
			if not condition:Evaluate(objs[i], context) then
				objs[i] = objs[#objs]
				objs[#objs] = nil
			end
		end
	end
	
	local rand_i = UICity:Random(#objs) + 1
	local to_rename = objs[rand_i]
	assert(to_rename:IsKindOf("Renamable"), "Object to be renamed must be Renamable")
	to_rename.name = new_name
end

UndefineClass('ResetBuildingExtraCost')
DefineClass.ResetBuildingExtraCost = {
	__parents = { "Effect", },
	properties = {
		{ id = "Resource", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "BuildingClass", 
			editor = "combo", default = "", items = function (self) return BuildingClassesCombo() end, },
	},
	Description = Untranslated("Reset <Resource> cost to <BuildingClass>"),
}

function ResetBuildingExtraCost:Execute(obj, context)
	UICity:ModifyConstructionCost("reset", self.BuildingClass, self.Resource, 0, 0, "StoryBit")
end

UndefineClass('ResidenceExecuteEffect')
DefineClass.ResidenceExecuteEffect = {
	__parents = { "Effect", },
	properties = {
		{ id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{631895865983, "Execute effect for the residence of the colonist"}, translate = true, },
	},
	RequiredObjClasses = {
	"Colonist",
},
}

function ResidenceExecuteEffect:Execute(obj, context)
	assert(obj.residence, "The colonist should have residence to execute WorkplaceExecuteEffect")
	for _, effect in ipairs(self.Effects or empty_table) do
		effect:Execute(obj.residence, context)
	end
end

function ResidenceExecuteEffect:EffectsList()
	local list = {}
	for _,effect in ipairs(self.Effects or empty_table) do
		list[#list + 1] = Untranslated(effect.class)
	end
	return table.concat(list, T{1000736, ", "})
end

UndefineClass('ResumeExpedition')
DefineClass.ResumeExpedition = {
	__parents = { "Effect", },
	Description = Untranslated("Resume expedition"),
}

function ResumeExpedition:Execute(rocket, context)
	rocket:ResumeExpedition()
end

UndefineClass('RevealNextTechInField')
DefineClass.RevealNextTechInField = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", 
			editor = "choice", default = false, items = function (self) return ResearchFieldsCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 1, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = Untranslated(""),
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function RevealNextTechInField:Execute(obj, context)
	local amount = self:ResolveValue("Amount", context)
	if amount > 0 then
		for idx, tech in ipairs(UICity.tech_field[self.Field]) do
			if not UICity.tech_status[tech].researched then
				for i = idx, idx + amount - 1 do
					UICity:SetTechResearched(UICity.tech_field[self.Field][i])
				end
				return
			end
		end
	end
end

UndefineClass('RewardApplicants')
DefineClass.RewardApplicants = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Trait", 
			editor = "choice", default = false, items = function (self) return TraitsCombo() end, },
		{ id = "Specialization", 
			editor = "choice", default = false, items = function (self) return GetColonistSpecializationCombo() end, },
	},
	Description = T{633926826952, "<Amount> <opt(display_name('TraitPresets',Trait), '', ' ')><opt(display_name('TraitPresets',Specialization), '', ' ')>Applicants"},
}

function RewardApplicants:Execute(obj, context)
	local now = GameTime()
	for i = 1, self:ResolveValue("Amount", context) do
		local colonist = GenerateApplicant(now, UICity)
		if self.Specialization then
			colonist.traits[colonist.specialist] = nil
			colonist.traits[self.Specialization] = true
			colonist.specialist = self.Specialization
		end
		if self.Trait then
			colonist.traits[self.Trait] = true
		end
	end
end

UndefineClass('RewardExportPrice')
DefineClass.RewardExportPrice = {
	__parents = { "Effect", },
	properties = {
		{ id = "Percent", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
	},
	Description = T{595472204584, "+<Percent>% price of Rare Metals"},
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function RewardExportPrice:Execute(obj, context)
	local id = self.ModifyId or self
	local percent = self:ResolveValue("Percent", context)
	g_Consts:SetModifier("ExportPricePreciousMetals", id, 0, percent)
end

UndefineClass('RewardFunding')
DefineClass.RewardFunding = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = 1000000000, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = T{219156110632, "<funding(Amount)>"},
	EditorView = T{996860432020, "Funding: <Amount>"},
}

function RewardFunding:Execute(obj, context)
	UICity:ChangeFunding(self:ResolveValue("Amount", context))
end

UndefineClass('RewardNewRocket')
DefineClass.RewardNewRocket = {
	__parents = { "Effect", },
	Description = T{239752697318, "New rocket"},
}

function RewardNewRocket:Execute(obj, context)
	PlaceBuilding(GetRocketClass(), {city = UICity})
end

UndefineClass('RewardPrefab')
DefineClass.RewardPrefab = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Prefab", 
			editor = "choice", default = false, items = function (self) return PrefabsCombo{value = false, text = T{10998, "-associated object-"}} end, },
	},
	Description = Untranslated("<Amount> <PrefabText>"),
}

function RewardPrefab:Execute(obj, context)
	local amount = self:ResolveValue("Amount", context)
	local prefab = self.Prefab or obj.template_name
	if prefab == "DronePrefab" then
		UICity.drone_prefabs = UICity.drone_prefabs + amount
	else
		UICity:AddPrefabs(prefab, amount, false)
	end
end

function RewardPrefab:GetPrefabText(obj, context)
	if not self.Prefab and not obj then return "(no prefab selcted)" end
	local prefab = self.Prefab or obj.template_name
	local desc
	if prefab == "DronePrefab" then
		desc = T{1681, "Drone"}
	else
		desc = BuildingTemplates[prefab].display_name or ""
	end
	local amount = self:ResolveValue("Amount", context)
	if amount == 1 then
		desc = desc.." "..T{11170, "prefab"}
	else
		desc = desc.." "..T{11171, "prefabs"}
	end
	return desc
end

UndefineClass('RewardResearchPoints')
DefineClass.RewardResearchPoints = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = T{445913619019, "<research(ResearchPoints)>"},
	EditorView = Untranslated("Reward <Amount> research points"),
}

function RewardResearchPoints:Execute(obj, context)
	GrantResearchPoints(self:ResolveValue("Amount", context))
end

function RewardResearchPoints:GetResearchPoints(context)
	return self:ResolveValue("Amount", context)
end

UndefineClass('RewardSponsorResearch')
DefineClass.RewardSponsorResearch = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
	},
	Description = T{532190223825, "<research(Amount)> Sponsor Research"},
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function RewardSponsorResearch:Execute(obj, context)
	local id = self.ModifyId or self
	local amount = self:ResolveValue("Amount", context)
	g_Consts:SetModifier("SponsorResearch", id, amount, 0)
end

UndefineClass('RewardSupplyPods')
DefineClass.RewardSupplyPods = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", 
			editor = "number", default = false, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = T{522988558818, "<Amount> free supply pods"},
}

function RewardSupplyPods:Execute(obj, context)
	for i = 1, self:ResolveValue("Amount", context) do
		local pod = PlaceBuilding(GetMissionSponsor().pod_class or "SupplyPod", {city = UICity})
	end
end

UndefineClass('RewardTech')
DefineClass.RewardTech = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", 
			editor = "combo", default = "random", items = function (self) return ResearchFieldsCombo("random") end, },
		{ id = "Research", 
			editor = "combo", default = "random", items = function (self) return ResearchTechsCombo(self, { value = "random", text = "-random tech-" }) end, },
	},
	Description = Untranslated("Grant <ResearchText> in <FieldText>"),
}

function RewardTech:Execute(obj, context)
	local field = self.Field
	if field == "random" then
		field = GetRandomDiscoverableTechField()
	end
	local research = self.Research
	if research == "random" then
		research = GetRandomResearchableTech(field) or ""
	end
	UICity:SetTechResearched(research, "notify")
end

function RewardTech:GetResearchText(obj, context)
	if self.Research == "random" then return T{11671, "random tech"} end
	local desc = TechDef[self.Research]
	return desc and desc.display_name or ""
end

function RewardTech:GetFieldText(obj, context)
	if self.Field == "random" then return T{11672, "random field"} end
	local field = TechFields[self.Field]
	return field and field.display_name or ""
end

UndefineClass('RewardTechBoost')
DefineClass.RewardTechBoost = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", 
			editor = "combo", default = "random", items = function (self) return ResearchFieldsCombo("random") end, },
		{ id = "Research", 
			editor = "combo", default = "", items = function (self) return ResearchTechsCombo(self, { value = "", text = "-all tech-" }, { value = "random", text = "-random tech-" }) end, },
		{ id = "Amount", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
	},
	Description = Untranslated("Grant <percent(Amount)> research boost for <ResearchText> in <FieldText>"),
}

function RewardTechBoost:Execute(obj, context)
	local amount = self:ResolveValue("Amount", context)
	local research = self.Research
	local field = self.Field
	if field == "random" then
		field = GetRandomDiscoverableTechField()
	end
	if research == "random" then
		research = GetRandomResearchableTech(field, true) or ""
	end
	if research == "" then
		UICity.TechBoostPerField[field] = (UICity.TechBoostPerField[field] or 0) + amount
	else
		UICity.TechBoostPerTech[research] = (UICity.TechBoostPerTech[research] or 0) + amount
	end
end

function RewardTechBoost:GetResearchText(obj, context)
	if self.Research == "" then return T{11673, "all techs"} end
	if self.Research == "random" then return T{11671, "random tech"} end
	local desc = TechDef[self.Research]
	return desc and desc.display_name or ""
end

function RewardTechBoost:GetFieldText(obj, context)
	if self.Field == "random" then return T{11672, "random field"} end
	local field = TechFields[self.Field]
	return field and field.display_name or ""
end

UndefineClass('RewardWonder')
DefineClass.RewardWonder = {
	__parents = { "Effect", },
	Description = Untranslated("Reward Wonder"),
}

function RewardWonder:Execute(obj, context)
	GrantWonderTech()
end

UndefineClass('SetBuildingBreakdownState')
DefineClass.SetBuildingBreakdownState = {
	__parents = { "Effect", },
	properties = {
		{ id = "State", 
			editor = "choice", default = "Maintenance", items = function (self) return {"Maintenance", "Malfunction"} end, },
		{ id = "RepairResource", 
			editor = "choice", default = "default", 
			buttons = { { "Param", "PickParam" } }, items = function (self) return StoryBits_GetMaintenanceResourcesDropDownItems() end, },
		{ id = "RepairAmount", 
			editor = "number", default = 1000, 
			buttons = { { "Param", "PickParam" } }, scale = "Resources", },
		{ id = "EnableBuilding", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Set building breakdown state: <State>"),
	RequiredObjClasses = {
	"Building",
},
}

function SetBuildingBreakdownState:Execute(building, context)
	building:SetExceptionalCircumstancesMaintenance(self.RepairResource, self:ResolveValue("RepairAmount", context))
	if self.State=="Malfunction" then
		building:SetMalfunction()
	end
	building:Setexceptional_circumstances(not self.EnableBuilding)
end

UndefineClass('SetBuildingEnabledState')
DefineClass.SetBuildingEnabledState = {
	__parents = { "Effect", },
	properties = {
		{ id = "Enabled", 
			editor = "bool", default = false, },
		{ id = "Duration", help = "Duration in sols", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "sols", step = 720000, slider = true, min = 0, max = 7200000000, },
	},
	Description = Untranslated("Set building enabled state"),
	RequiredObjClasses = {
	"Building",
},
}

function SetBuildingEnabledState:Execute(building, context)
	local duration = self:ResolveValue("Duration", context)
	if duration and duration>0 and not self.Enabled then
		CreateGameTimeThread(function()
			building:Setexceptional_circumstances(not self.Enabled)		
			Sleep(duration)
			building:Setexceptional_circumstances(self.Enabled)
		end)
	else
		building:Setexceptional_circumstances(not self.Enabled)
	end
end

UndefineClass('SetBuildingRogueState')
DefineClass.SetBuildingRogueState = {
	__parents = { "Effect", },
	properties = {
		{ id = "RogueState", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Set building rogue state to <if(RogueState)>true</if><if(not(RogueState))>false</if>"),
	RequiredObjClasses = {
	"BaseBuilding",
},
	ForbiddenObjClasses = false,
}

function SetBuildingRogueState:Execute(bld, context)
	assert(bld:IsKindOf("BaseBuilding"))
	bld:SetUIInteractionState(not self.RogueState)
end

UndefineClass('SetConstructionSiteState')
DefineClass.SetConstructionSiteState = {
	__parents = { "Effect", },
	properties = {
		{ id = "State", 
			editor = "choice", default = "Enable", items = function (self) return {"Enable", "Disable", "Destroy", "Complete"} end, },
		{ id = "AssociateCompletedBuilding", name = "Associate Completed Building", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Set construction site state to <State>"),
	RequiredObjClasses = {
	"ConstructionSite",
},
}

function SetConstructionSiteState:Execute(building, context)
	local o = ConstructionSetState(building, self.State)
	if o ~= building and self.AssociateCompletedBuilding then
		context.object = o
	end
end

UndefineClass('SpawnColonist')
DefineClass.SpawnColonist = {
	__parents = { "Effect", },
	properties = {
		{ id = "Count", 
			editor = "number", default = 1, 
			buttons = { { "Param", "PickParam" } }, slider = true, min = 1, max = 30000, },
		{ id = "Name", 
			editor = "text", default = false, translate = true, },
		{ id = "Gender", 
			editor = "combo", default = false, items = function (self) return PresetGroupCombo("TraitPreset", "Gender") end, },
		{ id = "Age", 
			editor = "combo", default = false, items = function (self) return PresetGroupCombo("TraitPreset", "Age Group") end, },
		{ id = "Specialization", 
			editor = "choice", default = false, items = function (self) return GetColonistSpecializationCombo() end, },
		{ id = "Trait1", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "Trait2", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "Trait3", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", 
			editor = "bool", default = false, },
	},
	Description = T{387767984070, "Receive a colonist"},
}

function SpawnColonist:Execute(obj, context)
	local available_domes = {}
	local disabled_domes = {}
	for idx, dome in ipairs(UICity.labels.Dome or empty_table) do
		if dome.working then
			available_domes[#available_domes + 1] = dome
		elseif not dome.demolishing  and not dome.destroyed  then
			disabled_domes[#disabled_domes +1] = dome
		end
	end
	
	local rockets =  UICity.labels.AllRockets or empty_table
	local spawn_rocket
	for _, rocket in ipairs(rockets) do
		if rocket.command == "Unload" or rocket.command == "Refuel" or rocket.command == "WaitLaunchOrder" then
			spawn_rocket = rocket
			break
		end
	end
	
	local count = self:ResolveValue("Count", context)
	for i=1, count do
		local params = {}
		params.entity_gender = self.Gender=="OtherGender" and (Random(1, 100) <= 50 and "Male" or "Female") or self.Gender
		params.gender = self.Gender
		local colonist = GenerateColonistData(UICity, self.Age, false, params )
		if #available_domes > 0 then
			local dome = available_domes[UICity:Random(1, #available_domes)]
			dome:SpawnColonist(colonist, true)
		elseif spawn_rocket then
				colonist.arriving = spawn_rocket
				Colonist:new(colonist)
				spawn_rocket.disembarking = spawn_rocket.disembarking or {}
				spawn_rocket.disembarking[#spawn_rocket.disembarking + 1] = colonist
		elseif #disabled_domes > 0 then
			local dome = disabled_domes[UICity:Random(1, #disabled_domes)]
			dome:SpawnColonist(colonist, true)
		else
			assert(false, "Colonist could not be placed in a dome or a rocket")
		end
		if self.Specialization then colonist:SetSpecialization(self.Specialization) end
		if self.Trait1 then colonist:AddTrait(self.Trait1) end
		if self.Trait2 then colonist:AddTrait(self.Trait2) end
		if self.Trait3 then colonist:AddTrait(self.Trait3) end
		if self.Name then colonist.name = self.Name end
		if self.AssociateWithStoryBit then
			context.object = colonist
		end
	end
end

UndefineClass('SpawnEffectDeposit')
DefineClass.SpawnEffectDeposit = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", name = "Amount of deposits", 
			editor = "number", default = 1, },
		{ id = "EffectType", name = "Effect Type", 
			editor = "combo", default = false, items = function (self) return ClassDescendantsCombo("EffectDeposit") end, },
	},
	Description = Untranslated("Spawn <EffectType>"),
}

function SpawnEffectDeposit:Execute(obj, context)
	local UnbuildableZ = buildUnbuildableZ()
	
	for i=1,self.Amount do
		local marker
		marker = PlaceObject("EffectDepositMarker")
		marker.deposit_type = self.EffectType
		
		-- pick position
		for i = 1, 50 do
			local sector_x = UICity:Random(1, 10)
			local sector_y = UICity:Random(1, 10)
			local sector = g_MapSectors[sector_x][sector_y]
			
			local minx, miny = sector.area:minxyz()		
			local maxx, maxy = sector.area:maxxyz()
			
			local x = UICity:Random(minx, maxx)
			local y = UICity:Random(miny, maxy)
			
			local q, r = WorldToHex(x, y)
			if GetBuildableZ(q, r) ~= UnbuildableZ then
				local pt = point(x, y)
				if terrain.IsPassable(pt) then
					marker:SetPos(pt)
					marker.revealed = true
					marker:PlaceDeposit()
					break
				end
			end
		end
	end
end

UndefineClass('SpawnRefugeeRocket')
DefineClass.SpawnRefugeeRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "DisplayName", name = "Custom Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "RocketDescription", name = "Custom Description Text", 
			editor = "text", default = false, translate = true, },
		{ id = "TravelTimeMars", name = "Custom Travel Time", 
			editor = "number", default = -1, scale = "hours", },
		{ id = "Timeout", 
			editor = "number", default = -1, scale = "hours", },
		{ id = "RefugeeCount", name = "Refugee Count", 
			editor = "number", default = 1, 
			buttons = { { "Param", "PickParam" } }, min = 1, },
		{ id = "Refugee", name = "Add Refugee Trait", 
			editor = "bool", default = true, },
		{ id = "Trait1", name = "Trait 1", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance1", name = "Trait 1 Chance", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "Trait2", name = "Trait 2", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance2", name = "Trait 2 Chance", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "Trait3", name = "Trait 3", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance3", name = "Trait 3 Chance", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", 
			editor = "bool", default = false, },
	},
	Description = T{263683247323, "Receive <RefugeeCount> Refugees"},
}

function SpawnRefugeeRocket:Execute(obj, context)
	local city = UICity
	local rocket = PlaceBuilding("RefugeeRocket", {city = city})
	local cargo = {}
	
	-- optional customization props
	if self.DisplayName then
		cargo.rocket_name = _InternalTranslate(self.DisplayName)
	end
	if self.RocketDescription then
		rocket.description = self.RocketDescription
	end
	if self.TravelTimeMars >= 0 then
		rocket.custom_travel_time_mars = self.TravelTimeMars
	end
	if self.Timeout >= 0 then
		rocket.passenger_orbit_life = self.Timeout
	end
	
	-- refugees & traits
	local amount = self:ResolveValue("RefugeeCount", context)
	cargo[1] = { class = "Passengers", amount = amount, applicants_data = {} }
	
	local data = cargo[1].applicants_data
	for j = 1, amount do
		data[j] = GenerateColonistData(city, nil, nil,{no_traits = true})
		if self.Refugee then
			data[j].traits.Refugee = true
		end
		for i = 1, 3 do
			local chance = self["Chance"..i]
			local trait = self["Trait"..i]
			if trait == "" or city:Random(100) >= chance then
				trait = GetRandomTrait(data[j].traits, {}, {}, nil, "base") 
			end
			data[j].traits[trait] = true
		end
	end
	
	if self.AssociateWithStoryBit then
		context.object = rocket
	end
	rocket:SetCommand("FlyToMars", cargo)
end

UndefineClass('SpawnRocketInOrbit')
DefineClass.SpawnRocketInOrbit = {
	__parents = { "Effect", },
	properties = {
		{ id = "is_supply_pod", name = "Is Supply Pod", 
			editor = "bool", default = false, },
		{ id = "cargo_list", name = "Cargo List", 
			editor = "nested_list", default = false, base_class = "RocketCargoItem", inclusive = true, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Spawn rocket in orbit"),
	RequiredObjClasses = false,
	ForbiddenObjClasses = false,
}

function SpawnRocketInOrbit:Execute(obj, context)
	local sponsor = GetMissionSponsor()
	local class = self.is_supply_pod and sponsor.pod_class or sponsor.rocket_class
	local rocket = PlaceBuilding(class, {city = UICity})
	
	rocket.cargo = {}
	local cargo = rocket.cargo
	for _, item in ipairs(self.cargo_list) do
		cargo[#cargo + 1] = { amount = item.amount, class = item.cargo }
	end
	rocket.name = GenerateRocketName()
	rocket:SetCommand("WaitInOrbit")
	if self.AssociateWithStoryBit then
		context.object = rocket
	end
end

UndefineClass('SpawnSubsurfaceDeposits')
DefineClass.SpawnSubsurfaceDeposits = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", name = "Amount of deposits", 
			editor = "number", default = 1, },
		{ id = "Resource", 
			editor = "combo", default = "Metals", items = function (self) return SubSurfaceDeposits end, },
		{ id = "ResourceAmount", name = "Amount of the resource in the deposit", 
			editor = "number", default = 50000, scale = "Resources", max = 2147483646, },
		{ id = "DepthLayer", name = "Depth Layer", 
			editor = "number", default = 1, min = 1, },
		{ id = "Grade", 
			editor = "choice", default = "Average", items = function (self) return DepositGradesTable end, },
	},
	Description = Untranslated("Spawn <Amount> <Resource> deposits"),
}

function SpawnSubsurfaceDeposits:Execute(obj, context)
	local UnbuildableZ = buildUnbuildableZ()
	
	for i = 1, self.Amount do
		local marker
		marker = PlaceObject("SubsurfaceDepositMarker")
		marker.resource = self.Resource
		marker.grade = self.Grade
		marker.max_amount =  self.ResourceAmount
		marker.depth_layer = self.DepthLayer
		
		-- pick position		
		for i = 1, 50 do
			local sector_x = UICity:Random(1, 10)
			local sector_y = UICity:Random(1, 10)
			local sector = g_MapSectors[sector_x][sector_y]
			
			local minx, miny = sector.area:minxyz()		
			local maxx, maxy = sector.area:maxxyz()
			
			local x = UICity:Random(minx, maxx)
			local y = UICity:Random(miny, maxy)
			
			local q, r = WorldToHex(x, y)
			if GetBuildableZ(q, r) ~= UnbuildableZ then
				local pt = point(x, y)
				if terrain.IsPassable(pt) then
					marker:SetPos(pt)
					marker.revealed = true
					marker:PlaceDeposit()
					break
				end
			end
		end
	end
end

UndefineClass('StartDisaster')
DefineClass.StartDisaster = {
	__parents = { "Effect", },
	properties = {
		{ id = "Disaster", 
			editor = "combo", default = "", items = function (self) return { "Dust Storm", "Cold Wave", "Dust Devils", "Meteors" } end, },
		{ id = "Storm", 
			editor = "combo", default = "normal", items = function (self) return { "normal", "great", "electrostatic" } end, },
		{ id = "Strength", 
			editor = "combo", default = 2, items = function (self) return StrengthCombo() end, },
		{ id = "Meteors", name = "Meteors Type", 
			editor = "combo", default = "single", items = function (self) return { "single", "multispawn", "storm" } end, },
		{ id = "Endless", 
			editor = "bool", default = false, },
		{ id = "Label", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
	},
	Description = Untranslated("<GetDescription>"),
}

function StartDisaster:GetDescription(context)
	if self.Disaster == "Dust Storm" then
		return string.format("Start %s %s disaster", self.Storm, self.Disaster)
	elseif self.Disaster == "Meteors" then
		if self.Meteors == "single" then
			return string.format("Start single Meteor disaster")
		elseif self.Meteors == "multispawn" then
			return string.format("Start multi spawn Meteors disaster")
		elseif self.Meteors == "storm" then
			return string.format("Start Meteor storm disaster")
		end
	elseif self.Disaster == "Cold Wave" then
		if self.Endless then
			return string.format("Start Endless Cold Wave disaster")
		end
	end
	
	return string.format("Start %s disaster", self.Disaster)
end

function StartDisaster:Execute(obj, context)
	local disaster_to_data = {
		["Dust Storm"] = DataInstances.MapSettings_DustStorm,
		["Cold Wave"] = DataInstances.MapSettings_ColdWave,
		["Meteors"] = DataInstances.MapSettings_Meteor,
		["Dust Devils"] = DataInstances.MapSettings_DustDevils,
	}
	local list = table.ifilter(disaster_to_data[self.Disaster], function(_, data)
		return data.strength == self.Strength
	end)
	local data = UICity:TableRand(list)
	if not data then
		return
	end
	if self.Disaster == "Dust Storm" then
		CreateGameTimeThread(function()
			StartDustStorm(self.Storm, data)
		end)
	elseif self.Disaster == "Cold Wave" then
		CreateGameTimeThread(function()
			StartColdWave(data, self.Endless)
		end)
	elseif self.Disaster == "Meteors" then
		local pos = false
		if self.Label and UICity.labels[self.Label] and #UICity.labels[self.Label] > 0 then
			local i = #UICity.labels[self.Label]
			pos = UICity.labels[self.Label][UICity:Random(i) + 1]:GetPos()
		end
		CreateGameTimeThread(function()
			MeteorsDisaster(data, self.Meteors, pos)
		end)
	elseif self.Disaster == "Dust Devils" then
		local pos = false
		local building = false
		if self.Label and UICity.labels[self.Label] and #UICity.labels[self.Label] > 0 then
			local i = #UICity.labels[self.Label]
			building = UICity.labels[self.Label][UICity:Random(i) + 1]
			pos = building:GetPos()
		end
		if building and pos then
			local building_radius = 0
			if building:HasMember("GetRadius") then
				building_radius = building:GetRadius() 
			end
			pos = GetRandomPassableAround(pos, building_radius + 150*guim, building_radius)
		end
		pos = pos or GetRandomPassable()
		if not pos then
			return
		end
		local devil = GenerateDustDevil(pos, data)
		devil:Start()
	end
end

UndefineClass('UnfreezeBuilding')
DefineClass.UnfreezeBuilding = {
	__parents = { "Effect", },
	Description = Untranslated("Unfreeze building"),
	RequiredObjClasses = {
	"ColdSensitive",
},
}

function UnfreezeBuilding:Execute(obj, context)
	obj:SetFrozen(false)
end

UndefineClass('UnitAppear')
DefineClass.UnitAppear = {
	__parents = { "Effect", },
	properties = {
		{ id = "Location", 
			editor = "choice", default = false, items = function (self) return AppearLocationCombo end, },
	},
	Description = Untranslated("Unit appear at <LocationText>"),
	RequiredObjClasses = {
	"Unit",
},
}

function UnitAppear:Execute(unit, context)
	unit:Appear(self.Location)
end

function UnitAppear:GetLocationText(unit, context)
	local preset = AppearLocationPresets[self.Location]
	return preset and preset.text or ""
end

UndefineClass('UnitDisappear')
DefineClass.UnitDisappear = {
	__parents = { "Effect", },
	Description = Untranslated("Unit disappear"),
	RequiredObjClasses = {
	"Unit",
},
}

function UnitDisappear:Execute(unit, context)
	unit:Disappear()
end

UndefineClass('WorkplaceExecuteEffect')
DefineClass.WorkplaceExecuteEffect = {
	__parents = { "Effect", },
	properties = {
		{ id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T{720933904817, "Execute effect for the workplace of the colonist"}, translate = true, },
	},
	RequiredObjClasses = {
	"Colonist",
},
}

function WorkplaceExecuteEffect:Execute(obj, context)
	assert(obj.workplace, "The colonist should have workplace to execute WorkplaceExecuteEffect")
	for _, effect in ipairs(self.Effects or empty_table) do
		effect:Execute(obj.workplace, context)
	end
end

function WorkplaceExecuteEffect:EffectsList()
	local list = {}
	for _,effect in ipairs(self.Effects or empty_table) do
		list[#list + 1] = Untranslated(effect.class)
	end
	return table.concat(list, T{1000736, ", "})
end

