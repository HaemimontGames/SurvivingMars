-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('AddBuildingExtraCost')
DefineClass.AddBuildingExtraCost = {
	__parents = { "Effect", },
	properties = {
		{ id = "BuildingClass", name = "Building", help = "Select the building class to be affected by the extra building cost.", 
			editor = "combo", default = "", items = function (self) return BuildingClassesCombo() end, },
		{ id = "Resource", help = "Select the extra resource added to the building cost.", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "Amount", help = "Set the amount of the specified resource, added to the building cost.", 
			editor = "number", default = 1000, scale = "Resources", },
	},
	Description = Untranslated("Add <Amount> extra <Resource> cost to <BuildingClass>"),
	Documentation = "Adds extra cost to the construction of the specified building.",
}

function AddBuildingExtraCost:Execute(obj, context)
	UICity:ModifyConstructionCost("add", self.BuildingClass, self.Resource, 0, self.Amount, "StoryBit")
end

UndefineClass('AddExpeditionRocketResources')
DefineClass.AddExpeditionRocketResources = {
	__parents = { "Effect", },
	properties = {
		{ id = "amount", help = "Select the quantity of resources of the specified type to be added.", 
			editor = "number", default = 0, scale = "Resources", min = 0, },
		{ id = "resource", help = "Select the type of resources to be added.", 
			editor = "combo", default = "Metals", items = function (self) return { "Metals", "Concrete", "Food", "PreciousMetals", "Polymers", "Electronics", "MachineParts", "Fuel" } end, },
	},
	Description = Untranslated("Add <amount> of <resource> to expedition rocket."),
	RequiredObjClasses = {
	"RocketExpedition",
	"PlanetaryAnomaly",
},
	Documentation = "Adds the specified resources to the rocket cargo. Note: In order to ensure that the resources will be properly loaded, in a StoryBit FollowUp which adds resources to the expedition, use trigger PlanetaryAnomalyAnalyzed. In order to ensure that the anomaly will be recognized as an associated object, use as a prerequisite IsCustomAnomaly.",
}

function AddExpeditionRocketResources:Execute(obj, context)
	local rocket = obj
	if obj:IsKindOf("PlanetaryAnomaly") then
		rocket =  obj.rocket
	end
	local amount = self:ResolveValue("amount", context)
	rocket:AppendCargo(self.resource, amount)
end

UndefineClass('AddTrait')
DefineClass.AddTrait = {
	__parents = { "Effect", },
	properties = {
		{ id = "Trait", help = "Select a trait to add to the colonist.", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
	},
	Description = Untranslated("Add trait/specialization <Trait>"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Add a specified trade or specialization to the associated colonist.",
}

function AddTrait:Execute(colonist, context)
	if self.Trait and IsValid(colonist) and not colonist:IsDying() then
		colonist:RemoveIncompatibleTraitsWith(self.Trait)
		colonist:AddTrait(self.Trait)
	end
end

UndefineClass('CallTradeRocket')
DefineClass.CallTradeRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "rocket_id", name = "rocket_id", help = "Set the ID of the rocket being called (can later be later used to identify the rocket).", 
			editor = "text", default = false, },
		{ id = "display_name", name = "display_name", help = "Set the rocket name.", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "description", help = "Set a description for the rocket.", 
			editor = "text", default = false, translate = true, },
		{ id = "travel_time_mars", name = "Travel time (to Mars)", help = "Set the time it takes the rocket to travel from Earth to Mars.", 
			editor = "number", default = 30000, scale = "hours", },
		{ id = "travel_time_earth", name = "Travel time (to Earth)", help = "Set the time it takes the rocket to travel from Mars to Earth.", 
			editor = "number", default = 30000, scale = "hours", },
		{ id = "fuel_amount", name = "Fuel Amount", help = "Set the amount of fuel needed for launch.", 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "resource1", name = "Resource", help = "Select the first resource carried by the rocket.", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount1", name = "Amount", help = "Set the amount of the first resource carried by the rocket.", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource2", name = "Resource", help = "Select the second resource carried by the rocket.", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount2", name = "Amount", help = "Set the amount of the second resource carried by the rocket.", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource3", name = "Resource", help = "Select the third resource carried by the rocket.", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount3", name = "Amount", help = "Set the amount of the third resource carried by the rocket.", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource4", name = "Resource", help = "Select the fourth resource carried by the rocket.", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount4", name = "Amount", help = "Set the amount of the fourth resource carried by the rocket.", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "resource5", name = "Resource", help = "Select the fifth resource carried by the rocket.", 
			editor = "combo", default = "", items = function (self) return { "", "Metals", "Concrete", "Food", "Polymers", "Electronics", "MachineParts", "PreciousMetals", "WasteRock"} end, },
		{ id = "amount5", name = "Amount", help = "Set the amount of the fifth resource carried by the rocket.", 
			editor = "number", default = 0, scale = "Resources", },
		{ id = "funding_on_mars_launch", name = "Funding when rocket launches from mars.", help = "Set the funding received on launch.", 
			editor = "number", default = 0, },
	},
	Description = Untranslated("Calls a trade rocket"),
	Documentation = "Calls a trade rocket with the specified properties.",
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
		{ id = "Grid", help = "Select the grid.", 
			editor = "choice", default = false, items = function (self) return { {text = "Pipe", value = "water"}, {text = "Cable", value = "electricity"}} end, },
		{ id = "Amount", help = "Set the amount of faults caused.", 
			editor = "number", default = 1, },
	},
	Documentation = "Cause a fault at a specified number of random spots on a grid.",
}

function CauseFault:Execute(obj, context)
	local breakableGridFragments = {}
	for _, fragment in ipairs(UICity[self.Grid]) do
		if fragment:IsBreakable() then
			breakableGridFragments[#breakableGridFragments + 1] = fragment
		end
	end
	if #breakableGridFragments == 0 then return end
	for i = 1, self.Amount do
		table.rand(breakableGridFragments):BreakConnection()
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
		{ id = "ChanceLarge", help = "Set the chance for a big fracture.", 
			editor = "number", default = 50, slider = true, min = 0, max = 100, },
	},
	Description = Untranslated("Cause Fracture"),
	RequiredObjClasses = {
	"Dome",
},
	Documentation = "Cause a fracture on the associated dome.",
}

function CauseFracture:Execute(obj, context)
	local crack_type = (AsyncRand(100) < self.ChanceLarge) and "Large" or "Small"
	obj:AddFracture(crack_type)
end

UndefineClass('CreatePlanetaryAnomaly')
DefineClass.CreatePlanetaryAnomaly = {
	__parents = { "Effect", },
	properties = {
		{ id = "id", help = "Set the anomaly ID.", 
			editor = "text", default = false, },
		{ id = "display_name", help = "Set the name displayed in the game.", 
			editor = "text", default = false, translate = true, },
		{ id = "description", help = "Set the anomaly description.", 
			editor = "text", default = false, translate = true, },
		{ id = "latitude", help = "Set the anomaly's latitude on the planet", 
			editor = "number", default = false, },
		{ id = "longitude", help = "Set the anomaly's longitude on the planet", 
			editor = "number", default = false, },
		{ id = "is_orbital", help = "Set to true if the anomaly is in orbit.", 
			editor = "bool", default = false, },
		{ id = "required_crew", help = "Set how many colonists are required to complete the anomaly.", 
			editor = "number", default = 0, },
		{ id = "required_drones", help = "Set how many drones are required to complete the anomaly.", 
			editor = "number", default = 0, },
		{ id = "required_crew_specialization", help = "Select which specialization is required from the colonists.", 
			editor = "combo", default = false, items = function (self) return ColonistSpecializationCombo() end, },
		{ id = "required_rover", help = "Select which type of rover is required for the mission.", 
			editor = "combo", default = false, items = function (self) return RoverTypesCombo() end, },
		{ category = "Rocket", id = "required_resources", name = "Required resources to launch", help = "List all the resources required for this mission.", 
			editor = "nested_list", default = false, base_class = "ResourceAmount", inclusive = true, },
		{ id = "associate", help = "Set to true to pass the new anomaly as a context object.", 
			editor = "bool", default = false, },
		{ id = "reward", help = "Select the reward for completing the anomaly.", 
			editor = "choice", default = "", items = function (self) return PlaneteryAnomalyRewardTypeCombo() end, },
		{ id = "outcome_text", name = "Short outcome text", help = "Short description of the reward.", 
			editor = "text", default = false, translate = true, },
	},
	Description = Untranslated("Create planetary anomaly with name <display_name>"),
	Documentation = "Creates a planetary anomaly with the specified properties.",
}

function CreatePlanetaryAnomaly:Execute(obj, context)
	local latitude = (self.latitude or min_int) ~= min_int and self.latitude or nil
	local longitude = (self.longitude or min_int) ~= min_int and self.longitude or nil
	local num_crew = self.required_crew or 0
	local num_drones = self.required_drones or 0
	local rover_type = self.required_rover or ""
	local crew_specialization = self.required_crew_specialization or ""
	local required_resources =  self.required_resources
	if not required_resources or not next(required_resources) then
		required_resources =  nil
	end
	
	local requirements = {
			num_crew = num_crew > 0 and num_crew or nil,
			num_drones = num_drones > 0 and num_drones or nil,
			rover_type = rover_type ~= "" and rover_type or nil,
			crew_specialization = crew_specialization ~= "" and crew_specialization or nil,
			required_resources =  required_resources
		}
	
	if not longitude or not latitude then
		latitude, longitude = GenerateMarsScreenPoI("anomaly")
	end
	
	local anomaly = PlaceObject("PlanetaryAnomaly", {
					custom_id = self.id,
					display_name = self.display_name,
					init_name = not self.display_name,
					description = self.description,
					reward = self.reward,
					longitude = longitude,
					latitude = latitude,
					requirements = requirements,
					is_orbital = self.is_orbital,
					outcome_text = T{self.outcome_text, context}})		
					
	if self.associate then
		context.object = anomaly
	end
end

UndefineClass('DelayExpedition')
DefineClass.DelayExpedition = {
	__parents = { "Effect", },
	properties = {
		{ id = "Time", help = "Set the delay for the expedition rocket in hours.", 
			editor = "number", default = 30000, scale = "hours", },
	},
	Description = Untranslated("Delay associated expedition rocket by <Time>"),
	RequiredObjClasses = {
	"RocketExpedition",
},
	Documentation = "Delay the associated expedition rocket by the specified time.",
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
	Documentation = "Delete the associated rocket's cargo.",
}

function DeleteCargo:Execute(rocket, context)
	rocket.cargo = {}
end

UndefineClass('DestroyBuilding')
DefineClass.DestroyBuilding = {
	__parents = { "Effect", },
	properties = {
		{ id = "KillColonists", help = "Set to true in order to kill the colonists in the building.", 
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
	Documentation = "Destroy the associated building.",
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
	Documentation = "Destroy the associated vehicle.",
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
	Documentation = "Disable landing of the associated rocket (the rocket landing should be later enabled with EnableLanding).",
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
	Documentation = "Disable launch for the associated rocket (the rocket launch should be later enabled with EnableLaunch).",
}

function DisableLaunch:Execute(rocket, context)
	rocket.launch_disabled = true
	rocket:UpdateStatus("launch suspended")
end

UndefineClass('DiscoverTech')
DefineClass.DiscoverTech = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", help = "Select the research field for the tech.", 
			editor = "combo", default = "", items = function (self) return ResearchFieldsCombo() end, },
		{ id = "Tech", help = "Select a tech from the research field.", 
			editor = "combo", default = "", items = function (self) return ResearchTechsCombo(self, {value = "", text = Untranslated("-random-")}) end, },
		{ id = "Cost", name = "Cost (RP)", help = "Set the cost for researching the tech.", 
			editor = "number", default = -1, },
	},
	Description = T(352987824047, --[[EffectDef Effects DiscoverTech value]] "<GetDescription>"),
	Documentation = "Discover the specified tech or a random tech from the specified field.",
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
		{ id = "Status", help = "Select a status for the rocket.", 
			editor = "choice", default = "on earth", items = function (self) return RocketStatusComboItems() end, },
	},
	Description = Untranslated("Pick a rocket which is <Status>"),
	Documentation = "Pick a rocket with a specific status.",
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
	Documentation = "Enable landing of the associated rocket (should be used to enable rocket landing after disabling with DisableLanding)",
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
	Documentation = "Enable launch for the associated rocket (should be used to enable rocket launch after disabling with DisableLaunch).",
}

function EnableLaunch:Execute(rocket, context)
	rocket.launch_disabled = false
	rocket:WakeFromWaitingForResources()
	rocket:UpdateStatus("ready for launch")
end

UndefineClass('EraseColonist')
DefineClass.EraseColonist = {
	__parents = { "Effect", },
	Description = Untranslated("Erase colonist"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Delete the associated colonist.",
}

function EraseColonist:Execute(colonist, context)
	colonist:SetCommand("Erase")
end

UndefineClass('EraseObject')
DefineClass.EraseObject = {
	__parents = { "Effect", },
	Description = Untranslated("Erase object"),
	Documentation = "Delete the associated object.",
}

function EraseObject:Execute(obj, context)
	if obj:IsKindOf("SupplyRocket") and obj:IsValidPos() then
		obj:EjectColonists()
		if obj.disembarking then
			Sleep(#obj.disembarking * 1500)
		end
	end
	DoneObject(obj)
end

UndefineClass('EraseShuttles')
DefineClass.EraseShuttles = {
	__parents = { "Effect", },
	properties = {
		{ id = "Count", help = "Set an amount of shuttles to delete.", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "LogicalObjectOnly", help = "Set to false to remove all traces of the shutle.", 
			editor = "bool", default = true, },
		{ id = "IdleShuttlesFirst", help = "Set to true to remove idle shuttles first.", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Erase <Count> shuttles"),
	Documentation = "Delete the specified amount of shuttles.",
}

function EraseShuttles:Execute(obj, context)
	local count = self:ResolveValue("Count", context)
	RemoveShuttles(count, self.IdleShuttlesFirst, self.LogicalObjectOnly)
end

UndefineClass('ExplodeBuilding')
DefineClass.ExplodeBuilding = {
	__parents = { "Effect", },
	properties = {
		{ id = "KillColonists", help = "Set to true to kill the colonist in the building.", 
			editor = "bool", default = true, },
		{ id = "Radius", help = "Set the radius for the building explosion.", 
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
	Documentation = "Blow up the associated building.",
}

function ExplodeBuilding:Execute(obj, context)
	obj:BlowUp(self.KillColonists, "StoryBit", nil, self.Radius)
end

UndefineClass('ExplodeRocket')
DefineClass.ExplodeRocket = {
	__parents = { "Effect", },
	Description = Untranslated("Explodes a landed rocket"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	Documentation = "Blow up the associated rocket.",
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
		{ id = "Time", help = "Set the time period for which to extend the disaster.", 
			editor = "number", default = 1, },
		{ id = "Disaster", help = "Select a disaster to extend.", 
			editor = "combo", default = false, items = function (self) return {"Cold Wave", "Dust Storm"} end, },
	},
	Description = Untranslated("Extend disaster"),
	Documentation = "Blow up the associated building.",
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
	Documentation = "Trigger fireworks.",
}

function Fireworks:Execute(obj, context)
	TriggerFireworks()
end

UndefineClass('ForEachExecuteEffects')
DefineClass.ForEachExecuteEffects = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", help = "Select the label to get the objects from.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "InDome", help = "Set to true if the object resides in a Dome.", 
			editor = "bool", default = false, },
		{ id = "Filters", help = "List the conditions which the objects need to satisfy.", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Cap for the number of objects for which the effects will be executed; Zero leaves all objects in.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", help = "Set the percentage of the objects for which the effects will be executed.", 
			editor = "number", default = 100, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Effects", help = "List the effects which will be executed on the objects.", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(10900, --[[EffectDef Effects ForEachExecuteEffects default]] "For each <ObjName>: <EffectsList>"), translate = true, },
	},
	Documentation = "Execute the specified effects list for each object from the label which satisfies the conditions.",
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
				table.iappend(objs, dome.labels[self.Label])
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
	return table.concat(list, T(1000736, ", "))
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
		{ id = "Filters", help = "List the conditions the colonist has to satisfy.", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Cap for the number of residents for which the effects will be executed; Zero leaves all residents in.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", help = "Set the percentage of the residents for which the effects will be executed.", 
			editor = "number", default = 100, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Effects", help = "List the effects to be executed on the colonists.", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(782971730643, --[[EffectDef Effects ForEachResident default]] "For each resident: <EffectsList>"), translate = true, },
	},
	RequiredObjClasses = {
	"Residence",
},
	Documentation = "Execute the specified effects list for the residents in the associated building.",
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
	return table.concat(list, T(1000736, ", "))
end

UndefineClass('ForEachWorker')
DefineClass.ForEachWorker = {
	__parents = { "Effect", },
	properties = {
		{ id = "Filters", help = "List the conditions the colonist has to satisfy.", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "RandomCount", name = "Random count", help = "Cap for the number of workers for which the effects will be executed; Zero leaves all workers in.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "RandomPercent", name = "Random percent", help = "Set the percentage of the workers for which the effects will be executed.", 
			editor = "number", default = 100, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Effects", help = "List the effects to be executed for each of the workers.", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(814803812237, --[[EffectDef Effects ForEachWorker default]] "For each worker: <EffectsList>"), translate = true, },
	},
	RequiredObjClasses = {
	"Workplace",
},
	Documentation = "Execute the effects from the effects list for each of the workers which satisfies the filter conditions and works in the associated workplace.",
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
	return table.concat(list, T(1000736, ", "))
end

UndefineClass('ForceSuicide')
DefineClass.ForceSuicide = {
	__parents = { "Effect", },
	Description = Untranslated("Force suicide"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Force the associated colonist to commit suicide.",
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
	Documentation = "Freeze the associated building.",
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
	Documentation = "Freeze the associated drones.",
}

function FreezeDrone:Execute(drone, context)
	drone:SetDisablingCommand("Freeze")
end

UndefineClass('KillColonist')
DefineClass.KillColonist = {
	__parents = { "Effect", },
	properties = {
		{ id = "DeathReason", help = "Select a reason for the colonist's death.", 
			editor = "choice", default = "StoryBit", items = function (self) return table.keys(DeathReasons, true) end, },
	},
	Description = Untranslated("Kill colonist with reason <DeathReasonText>"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Kill the associated colonist with the specified reason.",
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
	RequiredObjClasses = {
	"RocketExpedition",
},
	Documentation = "Destroy the associated expedition.",
}

function KillExpedition:Execute(rocket, context)
	rocket:KillExpedition()
end

UndefineClass('LockUnlockBuildingFromBuildMenu')
DefineClass.LockUnlockBuildingFromBuildMenu = {
	__parents = { "Effect", },
	properties = {
		{ id = "Building", help = "Select building to lock from the build menu.", 
			editor = "choice", default = false, items = function (self) return BuildingsCombo{value = false, text = T(10998, "-associated object-")} end, },
		{ id = "Lock", help = "Set to true to unlock the building.", 
			editor = "bool", default = false, },
		{ id = "Message", help = "Message being displayed.", 
			editor = "text", default = T(401896326435, --[[EffectDef Effects LockUnlockBuildingFromBuildMenu default]] "You can't construct this building at this time"), translate = true, },
	},
	Description = Untranslated("<LockText> <Building> from building menu"),
	Documentation = "Lock the specified buildings from the build menu.",
}

function LockUnlockBuildingFromBuildMenu:Execute(obj, context)
	local bld = self.Building or obj.template_name
	BuildMenuPrerequisiteOverrides[bld] = self.Lock and self.Message or nil
	RefreshXBuildMenu()
end

function LockUnlockBuildingFromBuildMenu:GetLockText(obj, context)
	return Untranslated(self.Lock and "Lock" or "Unlock")
end

UndefineClass('LoseFundingPercent')
DefineClass.LoseFundingPercent = {
	__parents = { "Effect", },
	properties = {
		{ id = "Percent", help = "Set the percent of funding to lose.", 
			editor = "number", default = 10, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "%", },
	},
	Description = T(160558783655, --[[EffectDef Effects LoseFundingPercent value]] "Lose <funding(LostFunding)> in funding"),
	EditorView = Untranslated("Lose <Percent>% in funding"),
	Documentation = "Player loses a certain percent of their funding.",
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
	Documentation = "Malfunction the associated building.",
}

function Malfunction:Execute(obj, context)
	obj:SetMalfunction()
end

UndefineClass('MalfunctionRocket')
DefineClass.MalfunctionRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "Resource", help = "Select the resource required to fix the rocket.", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "Amount", help = "Select the amount of the resource required to fix the rocket.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "Resources", },
	},
	Description = Untranslated("Malfunction rocket and require <Amount> <Resource> to be able to launch"),
	RequiredObjClasses = {
	"SupplyRocket",
},
	Documentation = "Malfunction the associated rocket.",
}

function MalfunctionRocket:Execute(rocket, context)
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
	Documentation = "Trigger marsquake.",
}

function Marsquake:Execute(obj, context)
	TriggerMarsquake(self.Epicenter, self.Radius, self.TargetsCount)
end

UndefineClass('ModifyCargoPrice')
DefineClass.ModifyCargoPrice = {
	__parents = { "Effect", },
	properties = {
		{ id = "Cargo", help = "Select the cargo type.", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("Cargo", false, { "-all-", "-associated cargo object-" }) end, },
		{ id = "Percent", help = "Select percentage by which to modify the price.", 
			editor = "number", default = 100, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = Untranslated("Modify price of <Cargo> by <Percent>%"),
	Documentation = "Modify the price of the associated or selected cargo by a certain percentage.",
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
		context:ShowError(self, "The specified cargo isn't registered as a supply:", cargo)
		return
	end
	ModifyResupplyParam(cargo, "price", percent)
end

UndefineClass('ModifyColonistStat')
DefineClass.ModifyColonistStat = {
	__parents = { "Effect", },
	properties = {
		{ id = "Stat", help = "Select a stat to modify.", 
			editor = "combo", default = false, items = function (self) return {"Health", "Sanity", "Comfort"} end, },
		{ id = "Amount", help = "Set an amount to modify the stat.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Percent", help = "Set a percentage to mortify the stat.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Reason", help = "The reason which will be displayed in UI.", 
			editor = "text", default = T(532997211205, --[[EffectDef Effects ModifyColonistStat default]] "Special effect"), translate = true, },
	},
	Description = Untranslated("Change <Stat>"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Modify the associated colonist's stat by the amount or percent specified.",
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
		{ id = "Const", help = "Select a const to modify.", 
			editor = "choice", default = false, items = function (self) return ClassPropertiesCombo("Consts") end, },
		{ id = "Amount", help = "Set an amount to modify the const by.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Percent", help = "Set a percentage to modify the const by.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive makes the modification last a certain amount of Sols.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "sols", step = 720000, slider = true, min = 0, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference the same modification later, for example to remove or update it.", 
			editor = "text", default = false, },
	},
	Description = Untranslated("Modify <Const>"),
	Documentation = "Applies a modifier to a specific game const by a certain amount or percent. Label modifiers are stored individually and can be removed or updated later on.",
}

function ModifyConst:Execute(obj, context)
	local id = self.ModifyId or self
	local amount = self:ResolveValue("Amount", context)
	local percent = self:ResolveValue("Percent", context)
	g_Consts:SetModifier(self.Const, id, amount, percent)
	local duration = self:ResolveValue("Sols", context)
	if (amount ~= 0 or percent ~= 0) and duration > 0 then
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
		{ id = "Label", help = "The label to be affected; labels specify certain specific subsets of objects", 
			editor = "combo", default = "", items = function (self) return LabelsCombo() end, },
		{ id = "InDome", help = "It true, apply to a label within the Dome passed as a parameter to this effect instead", 
			editor = "bool", default = false, },
		{ id = "Prop", name = "Property", help = "Name of a numeric property to modify", 
			editor = "combo", default = "", items = function (self) return ModifiablePropsCombo() end, },
		{ id = "Amount", help = "Additive modifier, applied after Percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Percent", help = "Multiplicative modifier", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive, makes the modifier temporary for the specified number of sols", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "sols", step = 720000, slider = true, min = 0, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference this modifier later; this modifier will replace the existing modifier for the same label with the same ModifyId if present", 
			editor = "text", default = false, },
		{ id = "Reason", help = "For some properties, a list of all applied modifiers are displayed in the UI using this text", 
			editor = "text", default = T(367924149812, --[[EffectDef Effects ModifyLabel default]] "Special effect <opt_amount(amount)> <opt_percent(percent)>"), translate = true, },
		{ id = "Description", help = "Custom description for this effect to be used for display in the Story Bits UI", 
			editor = "text", default = T(11167, --[[EffectDef Effects ModifyLabel default]] "<u(DomeText)><u(Label)>.<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"), translate = true, },
	},
	Documentation = "Applies a modifier to a property for all objects in the specified label. Label modifiers are stored individually and can be removed or updated later on.",
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
			display_text =  T{11887, "<color_tag><reason></color>", color_tag = (amount >=0 and percent >= 0) and TLookupTag("<green>") or TLookupTag("<red>"), reason = T{self.Reason, amount = unscaled_amount, percent = percent}},
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
		{ id = "Prop", name = "Property", help = "Name of a numeric property to modify", 
			editor = "combo", default = "", items = function (self) return ModifiablePropsCombo() end, },
		{ id = "Amount", help = "Additive modifier, applied after Percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Percent", help = "Multiplicative modifier, percent", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, slider = true, min = -100, max = 100, },
		{ id = "Sols", help = "If positive, makes the modifier temporary for the specified number of sols", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "sols", step = 720000, slider = true, min = 0, max = 7200000000, },
		{ id = "ModifyId", help = "Used to reference this modifier later; this modifier will replace the existing modifier with the same ModifyId if present", 
			editor = "text", default = false, },
		{ id = "Reason", help = "For some properties, a list of all applied modifiers are displayed in the UI using this text", 
			editor = "text", default = T(367924149812, --[[EffectDef Effects ModifyObject default]] "Special effect <opt_amount(amount)> <opt_percent(percent)>"), translate = true, },
	},
	Description = Untranslated("<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"),
	RequiredObjClasses = {
	"Modifiable",
},
	Documentation = "Applies a modifier to a property of the object parameter of this effect. All modifiers are stored individually and can be removed or updated later on.",
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
	obj:SetModifier(self.Prop, id, amount, percent, T{11887, "<color_tag><reason></color>", color_tag = (amount >=0 and percent >= 0) and TLookupTag("<green>") or TLookupTag("<red>"), reason = T{self.Reason, amount = unscaled_amount, percent = percent}})
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
		{ id = "Status", help = "Select the status to change.", 
			editor = "combo", default = false, items = function (self) return ClassDescendantsCombo("StatusEffect") end, },
		{ id = "Apply", help = "Set to false to remove the status.", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Add or remove <Status> from colonist"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Add or remove a status effect from the colonist (status effects are things like Homeless, freezing, etc.)",
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
	RequiredObjClasses = {
	"RocketExpedition",
},
	Documentation = "Pause the expedition with the associated rocket.",
}

function PauseExpedition:Execute(rocket, context)
	rocket:PauseExpedition()
end

UndefineClass('PauseResearch')
DefineClass.PauseResearch = {
	__parents = { "Effect", },
	properties = {
		{ id = "Time", help = "Set a timeframe to pause the research for.", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "ResearchType", help = "Select the research type to pause.", 
			editor = "choice", default = "sponsor", items = function (self) return {{value = "sponsor", text = T(11168, "sponsor")}, {value = "outsource", text = T(11169, "outsource")}} end, },
	},
	Description = T(202067797176, --[[EffectDef Effects PauseResearch value]] "Pause <ResearchTypeText> research"),
	Documentation = "Pause research points incoming from the specified research type (sponsor or outsource).",
}

function PauseResearch:Execute(obj, context)
	local paused_time = self:ResolveValue("Time", context)
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
		return T(11168, "sponsor")
	elseif self.ResearchType == "outsource" then
		return T(11169, "outsource")
	end
	return ""
end

UndefineClass('PayFunding')
DefineClass.PayFunding = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", help = "Set the amount of funding to be lost.", 
			editor = "number", default = 1000000000, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = T(407408618445, --[[EffectDef Effects PayFunding value]] "<funding(Amount)>"),
	EditorView = T(665594954399, --[[EffectDef Effects PayFunding value]] "Pay funding: <Amount>"),
	Documentation = "Lose a certain amount of funding.",
}

function PayFunding:Execute(obj, context)
	UICity:ChangeFunding(-self:ResolveValue("Amount", context))
end

UndefineClass('PickCargo')
DefineClass.PickCargo = {
	__parents = { "Effect", },
	properties = {
		{ id = "CargoList", name = "Cargo List", help = "List the cargo to pick from.", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("Cargo") end, },
	},
	Documentation = "Pick random cargo from the cargo list.",
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
		{ id = "Label", help = "Select the label to pick the object from.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "InDome", help = "Set to true if the object resides in a dome.", 
			editor = "bool", default = false, },
		{ id = "PickDifferent", help = "Set true to pick a different object than the associated one.", 
			editor = "bool", default = false, },
		{ id = "Conditions", help = "List the conditions the object has to satisfy.", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Pick one <ObjName>, where <ConditionsFormat>"),
	Documentation = "Pick a random object from the specified label.",
}

function PickFromLabelEffect:ConditionsFormat()
	local t = {}
	for _,cond in ipairs(self.Conditions) do
		t[#t + 1] = Untranslated(cond.class)
	end
	return table.concat(t, T(1000736, ", "))
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
				table.iappend(objs, dome.labels[self.Label])
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
	Documentation = "Remove all traits from the associated colonist.",
}

function RemoveAllTraits:Execute(colonist, context)
	local additional_autotraits_to_remove= {"Renegade"}
	colonist:RemoveAllTraits(additional_autotraits_to_remove)
end

UndefineClass('RemoveTrait')
DefineClass.RemoveTrait = {
	__parents = { "Effect", },
	properties = {
		{ id = "Trait", help = "Set the trait to be removed.", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("TraitPreset") end, },
	},
	Description = Untranslated("Remove trait <Trait>"),
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Remove a trait from the associated colonist.",
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
		{ id = "Name", help = "Set a new name for the object.", 
			editor = "text", default = false, translate = true, },
	},
	Description = Untranslated("Rename associated object to <Name>"),
	RequiredObjClasses = {
	"Renamable",
},
	Documentation = "Change the name of the associated object.",
}

function RenameAssociatedObject:Execute(obj, context)
	if self.Name then
		obj.name = _InternalTranslate(self.Name)
	end
end

UndefineClass('RenameObject')
DefineClass.RenameObject = {
	__parents = { "Effect", },
	properties = {
		{ id = "Label", help = "Select the label from which an object will be selected.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "Filters", help = "List the conditions the object has to satisfy in order to be chosen.", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(700526274387, --[[EffectDef Effects RenameObject default]] "Rename object"), translate = true, },
		{ id = "Name", help = "Set the new name of the object.", 
			editor = "text", default = false, translate = true, },
	},
	RequiredObjClasses = {
	"Renamable",
},
	Documentation = "Change the name of a random object with a certain label which satisfies the filter conditions.",
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
		{ id = "Resource", help = "Select the resource which cost is to be resetted.", 
			editor = "combo", default = false, items = function (self) return ConstructionResourceList end, },
		{ id = "BuildingClass", help = "Select a building class whose building cost to reset.", 
			editor = "combo", default = "", items = function (self) return BuildingClassesCombo() end, },
	},
	Description = Untranslated("Reset <Resource> cost to <BuildingClass>"),
	Documentation = "Reset the building cost of the selected building to the original one.",
}

function ResetBuildingExtraCost:Execute(obj, context)
	UICity:ModifyConstructionCost("reset", self.BuildingClass, self.Resource, 0, 0, "StoryBit")
end

UndefineClass('ResidenceExecuteEffect')
DefineClass.ResidenceExecuteEffect = {
	__parents = { "Effect", },
	properties = {
		{ id = "Effects", help = "List the effects to execute for the selected colonist.", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(631895865983, --[[EffectDef Effects ResidenceExecuteEffect default]] "Execute effect for the residence of the colonist"), translate = true, },
	},
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Execute the specified list of effects on the associated colonist.",
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
	return table.concat(list, T(1000736, ", "))
end

UndefineClass('ResumeExpedition')
DefineClass.ResumeExpedition = {
	__parents = { "Effect", },
	Description = Untranslated("Resume expedition"),
	RequiredObjClasses = {
	"RocketExpedition",
},
	Documentation = "Resume the expedition of the associated rocket.",
}

function ResumeExpedition:Execute(rocket, context)
	rocket:ResumeExpedition()
end

UndefineClass('RevealNextTechInField')
DefineClass.RevealNextTechInField = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", help = "Select a field to discover techs from.", 
			editor = "choice", default = false, items = function (self) return ResearchFieldsCombo() end, },
		{ id = "Amount", help = "Set the amount of techs to discover.", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = Untranslated("Reveal next <Amount> techs in <Field>"),
	Documentation = "Discover the next X amount of technologies in the specified field.",
}

function RevealNextTechInField:Execute(obj, context)
	local amount = self:ResolveValue("Amount", context)
	for i = 1, amount do
		UICity:DiscoverTechInField(self.Field)
	end
end

UndefineClass('RewardApplicants')
DefineClass.RewardApplicants = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", help = "Set the number of applicants to grant.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Trait", help = "Select a trait for the granted applicants.", 
			editor = "choice", default = false, items = function (self) return TraitsCombo() end, },
		{ id = "Specialization", help = "Select a specialization for the granted applicants.", 
			editor = "choice", default = false, items = function (self) return GetColonistSpecializationCombo() end, },
	},
	Description = T(633926826952, --[[EffectDef Effects RewardApplicants value]] "<Amount> <opt(display_name('TraitPresets',Trait), '', ' ')><opt(display_name('TraitPresets',Specialization), '', ' ')>Applicants"),
	Documentation = "Grant a specific amount of applicants, with the selected traits and specialization.",
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
		{ id = "Percent", help = "Set a percentage to raise the export price by.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
	},
	Description = T(595472204584, --[[EffectDef Effects RewardExportPrice value]] "+<Percent>% price of Rare Metals"),
	Documentation = "Increase the price of exporting rare metals to Earth by the specified percentage.",
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
		{ id = "Amount", help = "Set the amount of funding to receive.", 
			editor = "number", default = 1000000000, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = T(219156110632, --[[EffectDef Effects RewardFunding value]] "<funding(Amount)>"),
	EditorView = T(996860432020, --[[EffectDef Effects RewardFunding value]] "Funding: <Amount>"),
	Documentation = "Receive the specified amount of funding.",
}

function RewardFunding:Execute(obj, context)
	UICity:ChangeFunding(self:ResolveValue("Amount", context))
end

UndefineClass('RewardNewRocket')
DefineClass.RewardNewRocket = {
	__parents = { "Effect", },
	Description = T(239752697318, --[[EffectDef Effects RewardNewRocket value]] "New rocket"),
	Documentation = "Grant a new rocket.",
}

function RewardNewRocket:Execute(obj, context)
	PlaceBuilding(GetRocketClass(), {city = UICity})
end

UndefineClass('RewardPrefab')
DefineClass.RewardPrefab = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", help = "Set the amount of prefabs to receive.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "Prefab", help = "Select a prefab.", 
			editor = "choice", default = false, items = function (self) return PrefabsCombo{value = false, text = T(10998, "-associated object-")} end, },
	},
	Description = Untranslated("<Amount> <Drone><Building> <PrefabText>"),
	EditorView = Untranslated("Reward Prefab  <Amount> <Prefab>"),
	Documentation = "Grant a specific amounts of building prefabs or drones.",
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

function RewardPrefab:GetDrone(obj, context)
	local prefab = self.Prefab or obj.template_name
	if prefab == "DronePrefab" then
		return T(1681, "Drone")
	else
		return ""
	end
end

function RewardPrefab:GetBuilding(obj, context)
	local prefab = self.Prefab or obj.template_name
	if prefab ~= "DronePrefab" then
		return BuildingTemplates[prefab].display_name
	else
		return ""
	end
end

function RewardPrefab:GetPrefabText(obj, context)
	local amount = self:ResolveValue("Amount", context)
	if amount == 1 then
		return T(11170, "prefab")
	else
		return T(11171, "prefabs")
	end
end

UndefineClass('RewardResearchPoints')
DefineClass.RewardResearchPoints = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", help = "Set the amount of research points to receive.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = T(445913619019, --[[EffectDef Effects RewardResearchPoints value]] "<research(ResearchPoints)>"),
	EditorView = Untranslated("Reward <Amount> research points"),
	Documentation = "Grant a specific amount of research points.",
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
		{ id = "Amount", help = "Set the amount of research points to add to sponsor research.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
		{ id = "ModifyId", help = "Used to reference the same modification later", 
			editor = "text", default = false, },
	},
	Description = T(532190223825, --[[EffectDef Effects RewardSponsorResearch value]] "<research(Amount)> Sponsor Research"),
	EditorView = Untranslated("<Amount> Sponsor Research"),
	Documentation = "Grant a specific amount of sponsor research points.",
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
		{ id = "Amount", help = "Set the amount of supply pods to receive.", 
			editor = "number", default = false, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = T(522988558818, --[[EffectDef Effects RewardSupplyPods value]] "<Amount> free supply pods"),
	Documentation = "Grant a specific amount of Supply Pods.",
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
		{ id = "Field", help = "Select the research field for the tech.", 
			editor = "combo", default = "random", items = function (self) return ResearchFieldsCombo("random") end, },
		{ id = "Research", help = "Select a tech from the research field.", 
			editor = "combo", default = "random", items = function (self) return ResearchTechsCombo(self, { value = "random", text = "-random tech-" }) end, },
	},
	Description = Untranslated("Grant <ResearchText> in <FieldText>"),
	Documentation = "Grant a specific or random tech in a specific or random field.",
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
	if self.Research == "random" then return T(11888, "random tech") end
	local desc = TechDef[self.Research]
	return desc and desc.display_name or ""
end

function RewardTech:GetFieldText(obj, context)
	if self.Field == "random" then return T(11889, "random field") end
	local field = TechFields[self.Field]
	return field and field.display_name or ""
end

UndefineClass('RewardTechBoost')
DefineClass.RewardTechBoost = {
	__parents = { "Effect", },
	properties = {
		{ id = "Field", help = "Select the research field for the tech.", 
			editor = "combo", default = "random", items = function (self) return ResearchFieldsCombo("random") end, },
		{ id = "Research", help = "Select a tech from the research field.", 
			editor = "combo", default = "", items = function (self) return ResearchTechsCombo(self, { value = "", text = "-all tech-" }, { value = "random", text = "-random tech-" }) end, },
		{ id = "Amount", help = "Set the amount to boost.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, },
	},
	Description = Untranslated("Grant <percent(Amount)> research boost for <ResearchText> in <FieldText>"),
	Documentation = "Grant a tech boost to a specific or random tech in a specific or random field.",
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
	if self.Research == "" then return T(11890, "all techs") end
	if self.Research == "random" then return T(11888, "random tech") end
	local desc = TechDef[self.Research]
	return desc and desc.display_name or ""
end

function RewardTechBoost:GetFieldText(obj, context)
	if self.Field == "random" then return T(11889, "random field") end
	local field = TechFields[self.Field]
	return field and field.display_name or ""
end

UndefineClass('RewardWonder')
DefineClass.RewardWonder = {
	__parents = { "Effect", },
	Description = Untranslated("Reward Wonder"),
	Documentation = "Grant a wonder.",
}

function RewardWonder:Execute(obj, context)
	GrantWonderTech()
end

UndefineClass('SetBuildingBreakdownState')
DefineClass.SetBuildingBreakdownState = {
	__parents = { "Effect", },
	properties = {
		{ id = "State", help = "Select a breakdown state.", 
			editor = "choice", default = "Maintenance", items = function (self) return {"Maintenance", "Malfunction"} end, },
		{ id = "RepairResource", help = "Select the resource needed for repair.", 
			editor = "choice", default = "default", 
			buttons = { { "Param", "StoryBit_PickParam" } }, items = function (self) return StoryBits_GetMaintenanceResourcesDropDownItems() end, },
		{ id = "RepairAmount", help = "Set the amount of resource needed for repair.", 
			editor = "number", default = 1000, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "Resources", },
		{ id = "EnableBuilding", help = "Set to false to disable the building.", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Set building breakdown state: <State>"),
	RequiredObjClasses = {
	"Building",
},
	Documentation = "Set the breakdown state of the associated building (maintenance or malfunction).",
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
		{ id = "Enabled", help = "Set to true to enable the building.", 
			editor = "bool", default = false, },
		{ id = "Duration", help = "Set the duration in sols.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "StoryBit_PickParam" } }, scale = "sols", step = 720000, slider = true, min = 0, max = 7200000000, },
	},
	Description = Untranslated("Set building enabled state"),
	RequiredObjClasses = {
	"Building",
},
	Documentation = "Enable or disable the associated building.",
}

function SetBuildingEnabledState:Execute(building, context)
	local duration = self:ResolveValue("Duration", context)
	if duration and duration>0 and not self.Enabled then
		CreateGameTimeThread(function()
			building:Setexceptional_circumstances(not self.Enabled)		
			Sleep(duration)
			if IsValid(building) then
				building:Setexceptional_circumstances(self.Enabled)
			end
		end)
	else
		building:Setexceptional_circumstances(not self.Enabled)
	end
end

UndefineClass('SetBuildingRogueState')
DefineClass.SetBuildingRogueState = {
	__parents = { "Effect", },
	properties = {
		{ id = "RogueState", help = "Set to true to make the building Rouge, i.e. cannot be interacted with.", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Set building rogue state to <if(RogueState)>true</if><if(not(RogueState))>false</if>"),
	RequiredObjClasses = {
	"BaseBuilding",
},
	Documentation = "Set the associate building's rouge state to true/false.",
}

function SetBuildingRogueState:Execute(bld, context)
	assert(bld:IsKindOf("BaseBuilding"))
	bld:SetUIInteractionState(not self.RogueState)
end

UndefineClass('SetConstructionSiteState')
DefineClass.SetConstructionSiteState = {
	__parents = { "Effect", },
	properties = {
		{ id = "State", help = "Select the state for the construction site.", 
			editor = "choice", default = "Enable", items = function (self) return {"Enable", "Disable", "Destroy", "Complete"} end, },
		{ id = "AssociateCompletedBuilding", name = "Associate Completed Building", help = "Set to true to pass the building as an associated object.", 
			editor = "bool", default = false, },
	},
	Description = Untranslated("Set construction site state to <State>"),
	RequiredObjClasses = {
	"ConstructionSite",
},
	Documentation = "Set the associated construction site state to the specified one.",
}

function SetConstructionSiteState:Execute(building, context)
	local o = ConstructionSetState(building, self.State)
	if o ~= building and self.AssociateCompletedBuilding then
		context.object = o
	end
end

UndefineClass('SetEnabledSpecialProject')
DefineClass.SetEnabledSpecialProject = {
	__parents = { "Effect", },
	properties = {
		{ id = "enabled", name = "Enabled", help = "Make projects enabled or disabled", 
			editor = "bool", default = true, },
		{ id = "project_id", name = "Special project ID", help = "Set project d", 
			editor = "preset_id", default = false, preset_class = "POI", },
	},
	Documentation = "Enable or Disable special project. When disabled all pois from that type are removed and  expeditions to that type ot projects are canceled.",
}

function SetEnabledSpecialProject:Execute(obj, context)
	local id = self.project_id
	if not id then return end
	g_SpecialProjectsDisabled = g_SpecialProjectsDisabled or {}
	g_SpecialProjectsDisabled[id] = not self.enabled
	if  not self.enabled then
		RemoveAllSpotsForSpecialProject(self.project_id)
	else
		local projects = Presets.POI.Default
		TrytoSpawnSpecialProject(projects[self.project_id],UICity.day)
	end
end

function SetEnabledSpecialProject:GetEditorView()
	local text = self.enabled and T(12227, "Enabled") or T(12228, "Disable")
	local project = ""
	if self.project_id then
		project =Presets.POI.Default[self.project_id].display_name
	end
	return T{12229, "<enabled> the '<project_id>' special project", enabled =  text, project_id =  project}
end

function SetEnabledSpecialProject:GetWarning()
	if not self.project_id then
		return "Specify project"
	end
end

UndefineClass('SpawnColonist')
DefineClass.SpawnColonist = {
	__parents = { "Effect", },
	properties = {
		{ id = "Count", help = "Set the number of colonists to spawn.", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, slider = true, min = 1, max = 30000, },
		{ id = "Name", help = "Set the colonist's name", 
			editor = "text", default = false, translate = true, },
		{ id = "Gender", help = "Select the gender.", 
			editor = "combo", default = false, items = function (self) return PresetGroupCombo("TraitPreset", "Gender") end, },
		{ id = "Age", help = "Select the age.", 
			editor = "combo", default = false, items = function (self) return PresetGroupCombo("TraitPreset", "Age Group") end, },
		{ id = "Specialization", help = "Select a specialization.", 
			editor = "choice", default = false, items = function (self) return GetColonistSpecializationCombo() end, },
		{ id = "Trait1", help = "Select a trait.", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset", nil, nil, function(preset, obj) return preset.group~= "Specialization" end) end, },
		{ id = "Trait2", help = "Select a trait.", 
			editor = "choice", default = false, items = function (self) return  PresetsCombo("TraitPreset", nil, nil, function(preset, obj) return preset.group~= "Specialization" end) end, },
		{ id = "Trait3", help = "Select a trait.", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TraitPreset", nil, nil, function(preset, obj) return preset.group~= "Specialization" end) end, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", help = "Pass it as an associated object.", 
			editor = "bool", default = false, },
	},
	Description = T(387767984070, --[[EffectDef Effects SpawnColonist value]] "Receive a colonist"),
	Documentation = "Spawn a colonist with the specified traits.",
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
		local colonist = GenerateColonistData(UICity, self.Age, nil, params )
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
		if self.Specialization then colonist:AddTrait(self.Specialization) end
		if self.Trait1 then colonist:AddTrait(self.Trait1) end
		if self.Trait2 then colonist:AddTrait(self.Trait2) end
		if self.Trait3 then colonist:AddTrait(self.Trait3) end
		if self.Name then colonist.name = self.Name end
		if self.AssociateWithStoryBit then
			context.object = colonist
		end
	end
end

function SpawnColonist:GetWarning()
	local comp, t1, t2 = AreCompatible({self.Trait1, self.Trait2, self.Trait3})
	if not comp then
		return "Incompatible traits - " .. t1 .. ", " .. t2
	end
	return Effect.GetWarning(self)
end

UndefineClass('SpawnEffectDeposit')
DefineClass.SpawnEffectDeposit = {
	__parents = { "Effect", },
	properties = {
		{ id = "Amount", name = "Amount of deposits", help = "Set the amount of deposits to spawn.", 
			editor = "number", default = 1, },
		{ id = "EffectType", name = "Effect Type", help = "Select the effect type.", 
			editor = "combo", default = false, items = function (self) return ClassDescendantsCombo("EffectDeposit") end, },
		{ id = "Label", help = "Select a label to choose a building from.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "Radius", help = "Set the radius from the chosen building to spawn the effect deposits.", 
			editor = "number", default = 0, },
		{ id = "Conditions", help = "List the conditions the building has to fulfill in order to be chosen.", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Spawn <EffectType>"),
	Documentation = "Spawn the selected type of effect deposits in a certain radius around a random building from the specified label.",
}

function SpawnEffectDeposit:Execute(obj, context)
	local UnbuildableZ = buildUnbuildableZ()
	local label_element
	local radius = self:ResolveValue("Radius", context)
	if self.Label then
		local objs = GetObjectsByLabel(self.Label)
		if not objs or #objs == 0 or radius == 0 then return end
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
			label_element = AsyncRandElement(list)
		end
	end
	for i=1,self.Amount do
		local marker
		marker = PlaceObject("EffectDepositMarker")
		marker.deposit_type = self.EffectType
		
		-- pick position
		for i = 1, 50 do
			local x, y
			if label_element then
				x, y = GetRandomPassableAround(label_element:GetPos(), radius * const.GridSpacing):xy()
			else
				local sector_x = UICity:Random(1, 10)
				local sector_y = UICity:Random(1, 10)
				local sector = g_MapSectors[sector_x][sector_y]
				
				local minx, miny = sector.area:minxyz()		
				local maxx, maxy = sector.area:maxxyz()
				
				x = UICity:Random(minx, maxx)
				y = UICity:Random(miny, maxy)
			end	
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

function SpawnEffectDeposit:ConditionsFormat()
	local t = {}
	for _, cond in ipairs(self.Conditions or empty_table) do
		t[#t + 1] = T{cond.EditorView, cond}
	end
	return table.concat(t, T(1000736, ", "))
end

UndefineClass('SpawnRefugeeRocket')
DefineClass.SpawnRefugeeRocket = {
	__parents = { "Effect", },
	properties = {
		{ id = "DisplayName", name = "Custom Display Name", help = "Set the name of the rocket.", 
			editor = "text", default = false, translate = true, },
		{ id = "RocketDescription", name = "Custom Description Text", help = "Set the rocket's description.", 
			editor = "text", default = false, translate = true, },
		{ id = "TravelTimeMars", name = "Custom Travel Time", help = "Set the time to travel to Mars.", 
			editor = "number", default = -1, scale = "hours", },
		{ id = "Timeout", help = "Set the amount of time the rocket stays in orbit", 
			editor = "number", default = -1, scale = "hours", },
		{ id = "RefugeeCount", name = "Refugee Count", help = "Set the number of refugees on board.", 
			editor = "number", default = 1, 
			buttons = { { "Param", "StoryBit_PickParam" } }, min = 1, },
		{ id = "Refugee", name = "Add Refugee Trait", help = "Set to true to give the colonists the refugee trait.", 
			editor = "bool", default = true, },
		{ id = "Trait1", name = "Trait 1", help = "Set the first trait for the refugees.", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance1", name = "Trait 1 Chance", help = "Set the chance of a refugee getting the first trait.", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "Trait2", name = "Trait 2", help = "Set the second trait for the refugees.", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance2", name = "Trait 2 Chance", help = "Set the chance of a refugee getting the second trait.", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "Trait3", name = "Trait 3", help = "Set the third trait for the refugees.", 
			editor = "choice", default = "", items = function (self) return BaseTraitsCombo(UICity, true) end, },
		{ id = "Chance3", name = "Trait 3 Chance", help = "Set the chance of a refugee getting the third trait.", 
			editor = "number", default = 0, min = 0, max = 100, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", help = "Set to true to pass it as an associated object.", 
			editor = "bool", default = false, },
	},
	Description = T(263683247323, --[[EffectDef Effects SpawnRefugeeRocket value]] "Receive <RefugeeCount> Refugees"),
	Documentation = "Spawn a rocket with refugees coming to the colony.",
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
			local compatible = true
			if trait == "" or city:Random(100) >= chance then
				trait = GetRandomTrait(data[j].traits, {}, {}, nil, "base") 
			else
				local nonrare, rare = GetCompatibleTraits(data[j].traits, {}, {}, nil)
				if not table.find(nonrare, trait) and not table.find(rare, trait) then
					compatible = false
				end
			end
			if compatible then
				data[j].traits[trait] = true
			end
		end
	end
	
	if self.AssociateWithStoryBit then
		context.object = rocket
	end
	rocket:SetCommand("FlyToMars", cargo)
end

function SpawnRefugeeRocket:GetWarning()
	local comp, t1, t2 = AreCompatible({self.Trait1, self.Trait2, self.Trait3})
	if not comp then
		return "Incompatible traits - " .. t1 .. ", " .. t2
	end
	return Effect.GetWarning(self)
end

UndefineClass('SpawnRocketInOrbit')
DefineClass.SpawnRocketInOrbit = {
	__parents = { "Effect", },
	properties = {
		{ id = "is_supply_pod", name = "Is Supply Pod", help = "Set to true if the rocket should be a supply pod", 
			editor = "bool", default = false, },
		{ id = "cargo_list", name = "Cargo List", help = "List the cargo in the rocket.", 
			editor = "nested_list", default = false, base_class = "RocketCargoItem", inclusive = true, },
		{ id = "AssociateWithStoryBit", name = "Associate with StoryBit", help = "Set to true to pass it as an associated object.", 
			editor = "bool", default = true, },
	},
	Description = Untranslated("Spawn rocket in orbit"),
	Documentation = "Spawn rocket in orbit.",
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
		{ id = "Amount", name = "Amount of deposits", help = "Set the amount of deposits to be spawned.", 
			editor = "number", default = 1, },
		{ id = "Resource", help = "Select the resource found in the deposit.", 
			editor = "combo", default = "Metals", items = function (self) return SubSurfaceDeposits end, },
		{ id = "ResourceAmount", name = "Amount of the resource in the deposit", help = "Set the amount of resources in the deposit.", 
			editor = "number", default = 50000, scale = "Resources", max = 2147483646, },
		{ id = "DepthLayer", name = "Depth Layer", help = "Set the depth layer of the deposit", 
			editor = "number", default = 1, min = 1, },
		{ id = "Grade", help = "Select the grade of the deposit.", 
			editor = "choice", default = "Average", items = function (self) return DepositGradesTable end, },
		{ id = "Label", help = "Select a label to choose a building from.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
		{ id = "Radius", help = "Set the radius from the chosen building to spawn deposits.", 
			editor = "number", default = 0, },
		{ id = "Conditions", help = "List the conditions the building has to fulfill in order to be chosen.", 
			editor = "nested_list", default = false, base_class = "Condition", },
	},
	Description = Untranslated("Spawn <Amount> <Resource> deposits"),
	Documentation = "Spawn the selected type of subsurface deposits in a certain radius around a random building from the specified label.",
}

function SpawnSubsurfaceDeposits:Execute(obj, context)
	local UnbuildableZ = buildUnbuildableZ()
	local label_element
	if self.Label then
		local objs = GetObjectsByLabel(self.Label)
		if not objs or #objs == 0 or self.Radius == 0 then return end
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
			label_element = AsyncRandElement(list)
		end
	end
	
	for i = 1, self.Amount do
		local marker
		marker = PlaceObject("SubsurfaceDepositMarker")
		marker.resource = self.Resource
		marker.grade = self.Grade
		marker.max_amount =  self.ResourceAmount
		marker.depth_layer = self.DepthLayer
		
		-- pick position		
		for i = 1, 50 do
			local x, y
			if label_element then
				x, y = GetRandomPassableAround(label_element:GetPos(), self.Radius * const.GridSpacing):xy()
			else
				local sector_x = UICity:Random(1, 10)
				local sector_y = UICity:Random(1, 10)
				local sector = g_MapSectors[sector_x][sector_y]
				
				local minx, miny = sector.area:minxyz()		
				local maxx, maxy = sector.area:maxxyz()
				
				x = UICity:Random(minx, maxx)
				y = UICity:Random(miny, maxy)
			end
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

function SpawnSubsurfaceDeposits:ConditionsFormat()
	local t = {}
	for _, cond in ipairs(self.Conditions or empty_table) do
		t[#t + 1] = T{cond.EditorView, cond}
	end
	return table.concat(t, T(1000736, ", "))
end

UndefineClass('StartDisaster')
DefineClass.StartDisaster = {
	__parents = { "Effect", },
	properties = {
		{ id = "Disaster", help = "Select the disaster.", 
			editor = "combo", default = "", items = function (self) return { "Dust Storm", "Cold Wave", "Dust Devils", "Meteors" } end, },
		{ id = "Storm", help = "Select the mode for the Dust Storm disaster.", 
			editor = "combo", default = "normal", items = function (self) return { "normal", "great", "electrostatic" } end, },
		{ id = "Strength", help = "Select the strength of the disaster.", 
			editor = "combo", default = 2, items = function (self) return StrengthCombo() end, },
		{ id = "Meteors", name = "Meteors Type", help = "Select the mode for Meteors disaster.", 
			editor = "combo", default = "single", items = function (self) return { "single", "multispawn", "storm" } end, },
		{ id = "Endless", help = "Set to true to make the disaster endless.", 
			editor = "bool", default = false, },
		{ id = "Label", help = "Select a label, from which a building will be chosen and the disaster will strike at its position.", 
			editor = "combo", default = false, items = function (self) return LabelsCombo end, },
	},
	Documentation = "Start the selected disaster.",
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
		while g_DustStorm do
			WaitMsg("DustStormEnded", 3 * const.HourDuration)
		end
		CreateGameTimeThread(function()
			StartDustStorm(self.Storm, data)
		end)
	elseif self.Disaster == "Cold Wave" then
		while g_ColdWave do
			WaitMsg("ColdWaveEnded", 3 * const.HourDuration)
		end
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
	Documentation = "Unfreeze the associated building.",
}

function UnfreezeBuilding:Execute(obj, context)
	obj:SetFrozen(false)
end

UndefineClass('UnitAppear')
DefineClass.UnitAppear = {
	__parents = { "Effect", },
	properties = {
		{ id = "Location", help = "Select a location for the unit to appear.", 
			editor = "choice", default = false, items = function (self) return AppearLocationCombo end, },
	},
	Description = Untranslated("Unit appear at <LocationText>"),
	RequiredObjClasses = {
	"Unit",
},
	Documentation = "Make the associated unit appear at the specified location.",
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
	Documentation = "Make the associated unit disappear.",
}

function UnitDisappear:Execute(unit, context)
	unit:Disappear()
end

UndefineClass('WorkplaceExecuteEffect')
DefineClass.WorkplaceExecuteEffect = {
	__parents = { "Effect", },
	properties = {
		{ id = "Effects", help = "List the effects to be executed.", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ id = "Description", help = "Custom description for this effect to be used for displaying it to the player", 
			editor = "text", default = T(720933904817, --[[EffectDef Effects WorkplaceExecuteEffect default]] "Execute effect for the workplace of the colonist"), translate = true, },
	},
	RequiredObjClasses = {
	"Colonist",
},
	Documentation = "Execute the specified effects for the associate colonist's workplace.",
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
	return table.concat(list, T(1000736, ", "))
end

AddBuildingExtraCost.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 15, AddBuildingExtraCost.Execute)
AddExpeditionRocketResources.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 65, AddExpeditionRocketResources.Execute)
AddTrait.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 122, AddTrait.Execute)
CallTradeRocket.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 148, CallTradeRocket.Execute)
CauseFault.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 322, CauseFault.Execute)
CauseFault.GetDescription = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 343, CauseFault.GetDescription)
CauseFracture.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 384, CauseFracture.Execute)
CreatePlanetaryAnomaly.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 408, CreatePlanetaryAnomaly.Execute)
DelayExpedition.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 550, DelayExpedition.Execute)
DeleteCargo.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 581, DeleteCargo.Execute)
DestroyBuilding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 616, DestroyBuilding.Execute)
DestroyVehicle.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 655, DestroyVehicle.Execute)
DisableLanding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 686, DisableLanding.Execute)
DisableLaunch.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 717, DisableLaunch.Execute)
DiscoverTech.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 740, DiscoverTech.Execute)
DiscoverTech.GetDescription = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 786, DiscoverTech.GetDescription)
EffectPickRocketWithStatus.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 818, EffectPickRocketWithStatus.Execute)
EnableLanding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 858, EnableLanding.Execute)
EnableLaunch.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 889, EnableLaunch.Execute)
EraseColonist.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 922, EraseColonist.Execute)
EraseObject.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 945, EraseObject.Execute)
EraseShuttles.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 990, EraseShuttles.Execute)
ExplodeBuilding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1035, ExplodeBuilding.Execute)
ExplodeRocket.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1071, ExplodeRocket.Execute)
ExtendDisaster.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1097, ExtendDisaster.Execute)
Fireworks.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1134, Fireworks.Execute)
ForEachExecuteEffects.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1189, ForEachExecuteEffects.Execute)
ForEachExecuteEffects.EffectsList = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1232, ForEachExecuteEffects.EffectsList)
ForEachExecuteEffects.GetObjName = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1243, ForEachExecuteEffects.GetObjName)
ForEachExecuteEffects.GetWarning = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1250, ForEachExecuteEffects.GetWarning)
ForEachResident.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1300, ForEachResident.Execute)
ForEachResident.EffectsList = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1329, ForEachResident.EffectsList)
ForEachWorker.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1387, ForEachWorker.Execute)
ForEachWorker.EffectsList = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1422, ForEachWorker.EffectsList)
ForceSuicide.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1464, ForceSuicide.Execute)
FreezeBuilding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1495, FreezeBuilding.Execute)
FreezeDrone.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1528, FreezeDrone.Execute)
KillColonist.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1565, KillColonist.Execute)
KillColonist.GetDeathReasonText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1572, KillColonist.GetDeathReasonText)
KillExpedition.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1603, KillExpedition.Execute)
LockUnlockBuildingFromBuildMenu.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1641, LockUnlockBuildingFromBuildMenu.Execute)
LockUnlockBuildingFromBuildMenu.GetLockText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1650, LockUnlockBuildingFromBuildMenu.GetLockText)
LoseFundingPercent.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1685, LoseFundingPercent.Execute)
LoseFundingPercent.GetLostFunding = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1692, LoseFundingPercent.GetLostFunding)
Malfunction.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1724, Malfunction.Execute)
MalfunctionRocket.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1755, MalfunctionRocket.Execute)
Marsquake.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1790, Marsquake.Execute)
ModifyCargoPrice.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1849, ModifyCargoPrice.Execute)
ModifyColonistStat.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1912, ModifyColonistStat.Execute)
ModifyConst.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 1980, ModifyConst.Execute)
ModifyLabel.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2070, ModifyLabel.Execute)
ModifyLabel.GetDomeText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2108, ModifyLabel.GetDomeText)
ModifyObject.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2182, ModifyObject.Execute)
ModifyStatus.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2228, ModifyStatus.Execute)
PauseExpedition.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2271, PauseExpedition.Execute)
PauseResearch.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2293, PauseResearch.Execute)
PauseResearch.GetResearchTypeText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2307, PauseResearch.GetResearchTypeText)
PayFunding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2357, PayFunding.Execute)
PickCargo.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2380, PickCargo.Execute)
PickCargo.GetDescription = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2390, PickCargo.GetDescription)
PickFromLabelEffect.ConditionsFormat = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2430, PickFromLabelEffect.ConditionsFormat)
PickFromLabelEffect.GetObjName = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2441, PickFromLabelEffect.GetObjName)
PickFromLabelEffect.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2449, PickFromLabelEffect.Execute)
RemoveAllTraits.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2510, RemoveAllTraits.Execute)
RemoveTrait.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2547, RemoveTrait.Execute)
RenameAssociatedObject.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2580, RenameAssociatedObject.Execute)
RenameObject.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2618, RenameObject.Execute)
ResetBuildingExtraCost.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2674, ResetBuildingExtraCost.Execute)
ResidenceExecuteEffect.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2712, ResidenceExecuteEffect.Execute)
ResidenceExecuteEffect.EffectsList = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2721, ResidenceExecuteEffect.EffectsList)
ResumeExpedition.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2763, ResumeExpedition.Execute)
RevealNextTechInField.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2786, RevealNextTechInField.Execute)
RewardApplicants.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2837, RewardApplicants.Execute)
RewardExportPrice.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2870, RewardExportPrice.Execute)
RewardFunding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2915, RewardFunding.Execute)
RewardNewRocket.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2937, RewardNewRocket.Execute)
RewardPrefab.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2976, RewardPrefab.Execute)
RewardPrefab.GetDrone = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 2989, RewardPrefab.GetDrone)
RewardPrefab.GetBuilding = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3001, RewardPrefab.GetBuilding)
RewardPrefab.GetPrefabText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3013, RewardPrefab.GetPrefabText)
RewardResearchPoints.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3052, RewardResearchPoints.Execute)
RewardResearchPoints.GetResearchPoints = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3059, RewardResearchPoints.GetResearchPoints)
RewardSponsorResearch.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3087, RewardSponsorResearch.Execute)
RewardSupplyPods.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3126, RewardSupplyPods.Execute)
RewardTech.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3151, RewardTech.Execute)
RewardTech.GetResearchText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3178, RewardTech.GetResearchText)
RewardTech.GetFieldText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3187, RewardTech.GetFieldText)
RewardTechBoost.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3230, RewardTechBoost.Execute)
RewardTechBoost.GetResearchText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3250, RewardTechBoost.GetResearchText)
RewardTechBoost.GetFieldText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3260, RewardTechBoost.GetFieldText)
RewardWonder.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3285, RewardWonder.Execute)
SetBuildingBreakdownState.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3341, SetBuildingBreakdownState.Execute)
SetBuildingEnabledState.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3391, SetBuildingEnabledState.Execute)
SetBuildingRogueState.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3438, SetBuildingRogueState.Execute)
SetConstructionSiteState.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3481, SetConstructionSiteState.Execute)
SetEnabledSpecialProject.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3512, SetEnabledSpecialProject.Execute)
SetEnabledSpecialProject.GetEditorView = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3527, SetEnabledSpecialProject.GetEditorView)
SetEnabledSpecialProject.GetWarning = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3543, SetEnabledSpecialProject.GetWarning)
SpawnColonist.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3610, SpawnColonist.Execute)
SpawnColonist.GetWarning = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3663, SpawnColonist.GetWarning)
SpawnEffectDeposit.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3702, SpawnEffectDeposit.Execute)
SpawnEffectDeposit.ConditionsFormat = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3776, SpawnEffectDeposit.ConditionsFormat)
SpawnRefugeeRocket.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3889, SpawnRefugeeRocket.Execute)
SpawnRefugeeRocket.GetWarning = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3944, SpawnRefugeeRocket.GetWarning)
SpawnRocketInOrbit.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 3989, SpawnRocketInOrbit.Execute)
SpawnSubsurfaceDeposits.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4045, SpawnSubsurfaceDeposits.Execute)
SpawnSubsurfaceDeposits.ConditionsFormat = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4135, SpawnSubsurfaceDeposits.ConditionsFormat)
StartDisaster.GetDescription = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4185, StartDisaster.GetDescription)
StartDisaster.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4208, StartDisaster.Execute)
UnfreezeBuilding.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4300, UnfreezeBuilding.Execute)
UnitAppear.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4336, UnitAppear.Execute)
UnitAppear.GetLocationText = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4343, UnitAppear.GetLocationText)
UnitDisappear.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4375, UnitDisappear.Execute)
WorkplaceExecuteEffect.Execute = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4402, WorkplaceExecuteEffect.Execute)
WorkplaceExecuteEffect.EffectsList = SetFuncDebugInfo("@Data/ClassDef-Effects.lua", 4411, WorkplaceExecuteEffect.EffectsList)
