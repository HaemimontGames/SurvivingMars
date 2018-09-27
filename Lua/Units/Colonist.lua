local stat_scale = const.Scale.Stat
local max_stat = const.Scale.Stat * 100
local cutoff_time =  3
local wait_dome_turned_off = const.ColonistMaxWaitInDomeTurnedOff


DefineClass.Colonist =
{
	__parents = { "Unit", "CityObject", "PinnableObject", "Shapeshifter", "InfopanelObj", "CycleMember" },
	entity = "Male",
	move_speed = 1000, --around 4 meters per sec
	properties = {
		-- for display in the editor's Hedgehog Selection Editor
		{ id = "name",        default = "", editor = "text" }, 
		{ id = "progenitor_name",        default = "", editor = "text", no_edit = true }, 
		{ id = "serial",  default = 0, editor = "number", no_edit = true }, 
		{ id = "performance", default = 100, name = T{4283, "Worker performance"}, modifiable = true, editor = "number" , no_edit = true},
		{ id = "death_age",   default = 60,  name = T{4284, "Age of death"}, modifiable = true, editor = "number" , no_edit = true},

		{ id = "base_morale",            default = 0,   name = T{4285, "Base Morale boost"}, modifiable = true, editor = "number" , no_edit = true, scale = "Stat"},
		{ id = "birth_comfort_modifier", default = 0, scale = "Stat", name = T{4286, "Birth Comfort modifier"}, modifiable = true, editor = "number" , no_edit = true},
		{ id = "preferred_workplace_performance_bonus", default = 0, name = T{4287, "Preferred Worker performance bonus"}, modifiable = true, editor = "number" , no_edit = true},
		{ id = "DailyHealthRecover", name = T{4288, "Colonist daily Health recovery"}, editor = "number", default = 5000, modifiable = true, scale = "Stat" },
		{ id = "DailySanityRecover", name = T{4289, "Colonist daily Sanity recovery"}, editor = "number", default = 5000, modifiable = true, scale = "Stat" },
	},
	max_name_len = 27,
	dome = false,
	city = false,
	display_name = T{4290, "Colonist"},-- class's display name uinit name is in 'name'
	pfclass = 3,
	radius = 30*guic,
	collision_radius = 30*guic,

	sols    = false,
	gender  = false,    -- gender_id
	entity_gender  = false,-- biological gender
	race = false,
	specialist = false,
	birthplace = false,
	age = false,
	age_trait = false,

	traits = false,
	status_effects = false,
	status_effect_sign = false,
	status_effect_sign_visible = true,
	playground_visit = false,
	training_points = false,

	dying = false,
	dying_reason = false,
	dreaming = false,
	leaving = false,
	last_workplace = false,
	last_residence = false,
	force_suicide = false, 

	infopanel_icon = "UI/Infopanel/colonist.tga",
	ip_specialization_icon = false,
	
	-- pin section
	pin_rollover = T{7780, "<PinDescription>"},
	pin_progress_value = "",
	pin_progress_max = "",
	pin_on_start = false,
	pin_icon = false,
	pin_specialization_icon = false,

	workplace = false,
	workplace_shift = false,
	residence = false,
	reserved_residence = false,
	assigned_to_service = false,
	arriving = false,
	outside_start = false,-- outside dome or rover start time
	inner_entity = false,
	food_seeking  = false,

	avoid_workplace = false, -- last workplace , avoid when choose new workplace and reset when new workplace is set
	avoid_workplace_start = false,
	fulfill_workshift_boost = false,-- workshop boost is get if the laast time when the unit was in work the workplace is working

	work_spot_task = "Workdrone",
	direction_arrow_scale = 50,

	transport_task = false,
	emigration_dome = false,
	
	user_forced_dome = false,
	user_forced_residence = false,
	user_forced_workplace = false, 
	start_player_controllable = false,
	interaction_mode = false,
	
	stat_health = max_stat/2,
	stat_sanity = max_stat/2,
	stat_comfort = max_stat/2,
	stat_morale = 0, -- value is not clamped between 0 and stat_scale
	log_health = false,
	log_sanity = false,
	log_comfort = false,
	last_meal = 0,
	last_rest = 0,
	intercept_params = false,
	
	refugee_life_remaining = false,

	daily_interest = "",
	daily_interest_fail = 0, -- 0 - not tried, 1 - not found, 2 - closed, 3 - full, 4 - CanService failed
	encyclopedia_id = "Colonist",
	ip_template = "ipColonist",
	
	SetDust = __empty_function__,
	dome_enter_fails = 0,
	failed_domes = false,
	
	use_passages = true,
	next_heavy_update = 0,
	
	assigned_to_service_with_amount = false,
}

GlobalVar("ColonistHeavyUpdateTime", 0)
GlobalVar("g_TotalColonistComfort", 0)

ColonistStatList = { "Health", "Sanity", "Comfort", "Morale" }
ColonistStat = 
{
	Health = {value = "Health", text = T{4291, "Health"}, log = "log_health",
		description = T{4292, "Represents physical injury, illness and exhaustion. Lowered by working on a heavy workload, having no functional home, shock when deprived from vital resources or when the Colonist is injured. Colonists can be healed in Medical Buildings in a powered Dome, but only if they are provided with Food, Water and Oxygen. Colonists can't work at low health unless they’re Fit."}, 
		icon = "UI/Icons/Sections/health.tga"},
	Sanity = {value = "Sanity", text = T{4293, "Sanity"}, log = "log_sanity",
		description = T{4294, "Represents mental condition. Lowered by working on a heavy workload, in outside buildings and during dark hours, witnessing the death of a Colonist living in the same Residence or various Martian disasters. Recovered when resting at home and by visiting certain Service Buildings."}, 
		icon = "UI/Icons/Sections/stress.tga"},
	Comfort = {value = "Comfort", text = T{4295, "Comfort"}, log = "log_comfort",
		description = T{4296, "Residences and visited buildings improve Comfort up to their Service Comfort value, but Colonists will try to visit only buildings that correspond to their interests. Colonists are more inclined to have children at higher Comfort. Earthborn Colonists whose Comfort is depleted will quit their job and leave the Colony at first opportunity."}, 
		icon = "UI/Icons/Sections/comfort.tga"},
	Morale = {value = "Morale", text = T{4297, "Morale"},
		description = T{4298, "Represents overall happiness, optimism and loyalty. All other stats affect Morale. Influences the Colonist’s job performance. Colonists with low Morale may become Renegades."},  
		icon = "UI/Icons/Sections/morale.tga"},
}

function StatCombo()
	return function()
		return {
			ColonistStat.Health,
			ColonistStat.Sanity,
			ColonistStat.Comfort,
			ColonistStat.Morale
		}
	end
end

for name, data in sorted_pairs(const.ColonistAgeGroups) do
	table.insert(Colonist.properties,{category = "Trait", id = "MinAge_"..name, name = T{4299, "Min age <display_name>", data}, default = data.min, editor = "number", help = T{4300, "Min age for <name>", data}, modifiable = true })
end

function Colonist:Init()
	assert(self.dome_version == 0)
	self.city = self.city or self.dome and self.dome.city or UICity
	self.sols = 0
	self.log_health = {}
	self.log_sanity = {}
	self.log_comfort = {}
	self.status_effects = {}
	self:SetBase("base_morale", 50*stat_scale + g_Consts.MoraleInitRange/2 - self:Random(g_Consts.MoraleInitRange))
	self:ChangeSanity(50*stat_scale)
	self:ChangeHealth(50*stat_scale)

	self.workplace_shift = 1

	self.fx_actor_class = self.gender == "Male" and "ColonistMale" or "ColonistFemale"

	self:SetSpecialization(self.specialist, "init")
	self:SetState("idle")
	self:SetMoveSpeed(self.move_speed)
	self:SetMoveAnim("moveWalk")
	self:SetWaitAnim("idle")
end

function Colonist:GameInit()
	-- set traits
	self:ApplyTraits(self.traits, "init")
	-- set dome
	local d = self.dome
	self.dome = false --force the setter
	self:SetDome(d)
	self:UpdateCurrentDome()

	-- after apply age changes from traits (e.g Clone)
	self:SetBase("death_age", self.MinAge_Senior + 5 + self:Random(10) + self:Random(5) + self:Random(5))
	g_TotalColonistComfort = g_TotalColonistComfort + self:GetComfort()
	if not self.arriving then
		self:OnArrival()
	end	
	
	self:AddToLabels()
	
	if HintsEnabled then
		local num_colonists = #self.city.labels.Colonist
		if num_colonists >= 10 then
			HintTrigger("HintSuggestResearchLab")
		end
		if num_colonists >= 15 then
			HintTrigger("HintSuggestHydroponicFarm")
		end
	end

	-- pick new interest for the day
	self.daily_interest = PickInterest(self) or ""
	self.daily_interest_fail = 0
end

function Colonist:Done()
	g_TotalColonistComfort = g_TotalColonistComfort - self:GetComfort()
	self:RemoveFromLabels()
	self:SetDome(false)

	if self.traits then
		for trait_id,_ in pairs(self.traits) do
			local trait = TraitPresets[trait_id]
			if trait then trait:UnApply(self) end
		end
	end

	self.city:RemoveFromLabel("DeadColonist", self)
	self:ClearTransportRequest()
end

function Colonist:Random(...)
	return CityObject.Random(self, ...)
end

function Colonist:RemoveFromLabels()
	local city = self.city
	city:RemoveFromLabel(self.gender == "OtherGender" and "ColonistOther" or self.gender == "Male" and "ColonistMale" or "ColonistFemale",self)
	city:RemoveFromLabel("Colonist", self)
	city:RemoveFromLabel(self.specialist, self)
	city:RemoveFromLabel("Homeless", self)
	city:RemoveFromLabel("Unemployed", self)
	local dome = self.dome
	if IsValid(dome) then
		dome:RemoveFromLabel("Colonist", self)
		dome:RemoveFromLabel("Homeless", self)
		dome:RemoveFromLabel("Unemployed", self)
	end
	self:Affect("StatusEffect_Homeless", false)
	self:Affect("StatusEffect_Unemployed", false)
	for trait_id, _ in pairs(self.traits) do
		if IsValid(dome) then
			dome:RemoveFromLabel(trait_id,self)
		end
	end
end

function Colonist:AddToLabels()
	self.city:AddToLabel("Colonist", self)	
	self.city:AddToLabel(self.gender == "OtherGender" and "ColonistOther" or self.gender == "Male" and "ColonistMale" or "ColonistFemale", self)
	self.city:AddToLabel(self.specialist, self)
end

function Colonist:SetDome(dome)
	dome = dome or false
	local prev_dome = self.dome
	self.dome = dome
	if prev_dome == dome then return end
	if IsValid(prev_dome) then
		prev_dome:RemoveFromLabel("Colonist", self)
		prev_dome:RemoveFromLabel("Homeless", self)
		prev_dome:RemoveFromLabel("Unemployed", self)
		prev_dome:RemoveFromLabel("DeadColonist", self)
		for trait_id, _ in pairs(self.traits) do
			prev_dome:RemoveFromLabel(trait_id,self)
			local trait = TraitPresets[trait_id]
			if trait and trait.modify_target == "dome colonists" then
				trait:RemoveDomeColonistsModifier(self, trait.modify_trait)
			end
		end
		self:SetWorkplace(false)
		self:SetResidence(false)
		Msg("ColonistLeavesDome", self,prev_dome)
	end

	if IsValid(dome) then
		assert(not self:IsValidPos() or IsInWalkingDist(self, dome))
		dome:AddToLabel("Colonist", self)
		for trait_id, _ in pairs(self.traits) do
			dome:AddToLabel(trait_id,self)
			local trait = TraitPresets[trait_id]
			if trait and trait.modify_target == "dome colonists" then
				trait:AddDomeColonistsModifier(self, trait.modify_trait)
			end
		end
		self.emigration_dome = false
		self:UpdateWorkplace()
		self:UpdateResidence()
		Msg("ColonistJoinsDome", self, dome)
	end
	
	self:UpdateMorale()
end

function Colonist:ApplyTraits(traits, init)
	if traits then
		for trait_id , _ in pairs(traits) do
			self:AddTrait(trait_id, init)
		end
	end
end

function Colonist:AddTrait(trait_id, init)
	if not IsTraitAvailable(trait_id) then
		return -- try to add locked trait
	end
	-- shield specializations adding via SetSpecialist only
	if const.ColonistSpecialization[trait_id] and self.specialist~=trait_id then
		assert(false, string.format("Specialization not added via SetSpecialist function. Current: %s, new: %s",self.specialist, trait_id))
		self:SetSpecialization(trait_id)
		return
	end
	
	g_HiddenTraits[trait_id] = nil
	local has_trait = self.traits[trait_id]
	self.traits[trait_id]= true
	if IsValid(self.dome) then
		self.dome:AddToLabel(trait_id,self)
	end
	local trait = TraitPresets[trait_id]
	-- apply new traits and that from generation table on unit init
	if trait and (not has_trait or init) then 
		trait:Apply(self, init) 
		--if rare_trait and total colonists count no more than 100, then pin
		local total_colonists = #(UICity.labels.Colonist or empty_table)
		if g_RareTraits[trait_id] and not self:IsPinned() and total_colonists <= 100 then
			self:TogglePin()
		end
		Notify(self, "UpdateMorale")
	end	
	Msg("ColonistAddTrait", self, trait_id, init)
end

function Colonist:RemoveTrait(trait_id)	
	if not trait_id then return end
	assert(not not self.traits[trait_id], "Trait is already removed:" .. trait_id)
	self.traits[trait_id] = nil
	if IsValid(self.dome) then
		self.dome:RemoveFromLabel(trait_id, self)
	end
	local trait = TraitPresets[trait_id]
	if trait then 
		trait:UnApply(self) 
		Notify(self, "UpdateMorale")
	end
	Msg("ColonistRemoveTrait", self, trait_id)
end

function Colonist:RemoveIncompatibleTraitsWith(new_trait)
	local traits = self.traits
	local to_remove = false
	for trait_id,_ in pairs(traits) do
		local trait = TraitPresets[trait_id]
		if trait and trait.incompatible[new_trait] then
			to_remove = to_remove or {}
			to_remove[#to_remove + 1] = trait_id
		end
	end	
	for _, trait_id in pairs(to_remove or empty_table) do
		self:RemoveTrait(trait_id)
	end
end

function Colonist:RemoveAllTraits(additional_autotraits_to_remove)
	local traits = self.traits
	local to_remove = false
	for trait_id,_ in pairs(traits) do
		local trait = TraitPresets[trait_id]
		if trait and (trait.auto or additional_autotraits_to_remove and additional_autotraits_to_remove[trait_id])then
			to_remove = to_remove or {}
			to_remove[#to_remove + 1] = trait_id
		end
	end	
	for _, trait_id in pairs(to_remove or empty_table) do
		self:RemoveTrait(trait_id)
	end
end

function OnMsg.GatherLabels(labels)
	labels.ColonistMale = true
	labels.ColonistFemale = true
	labels.ColonistOther = true
	labels.none = true
	labels.scientist = true
	labels.engineer = true
	labels.security = true
	labels.geologist = true
	labels.medic = true
	labels.botanist = true
end

-- value is per hour, format per update_time that is < 1 hour
local function FormatValueWithUpdateTime(value, updatetime)
	return value * updatetime / const.HourDuration
end

if FirstLoad then
	TraitsWithDailyUpdates = {}
end

function OnMsg.DataLoaded()
	TraitsWithDailyUpdates = {}
	ForEachPreset(TraitPreset, function(trait, group_list)
		if trait.daily_update_func then
			TraitsWithDailyUpdates[1+#TraitsWithDailyUpdates] = trait.id
		end
	end)
end

function Colonist:DailyUpdate()
	self.sols = self.sols + 1
	self.age  = (self.age or 0) + 1

	local traits = self.traits
	if traits.Clone then
		self.age = self.age + 1
	end

	if self.age>=self.death_age and not traits.Android then
		self:SetCommand("Die", "Old age")
		return
	end
	
	if self.leaving then
		return
	end

	local di_traits = TraitPresets
	for _, trait_id in ipairs(TraitsWithDailyUpdates) do
		if traits[trait_id] then
			local trait = di_traits[trait_id]
			trait.daily_update_func(self, trait)
		end
	end

	local time = self.city.day - cutoff_time
	self:LogStatClear(self.log_health, time)
	self:LogStatClear(self.log_sanity, time)
	self:LogStatClear(self.log_comfort, time)

	-- penalty if yesterday's interest was not visited
	local interest = self.daily_interest
	local fail = self.daily_interest_fail
	if interest ~= "" and fail > 0 then
		self:ChangeComfort(-g_Consts.VisitFailPenalty, GetInterestFailMessage(interest, fail))
		
		if interest == "needMedical" and self.traits.Hypochondriac then
			local trait = TraitPresets.Hypochondriac
			self:ChangeSanity(-trait.param*const.Scale.Stat, trait.id)
		end
	end
	
	-- pick new interest for the day
	self.daily_interest = PickInterest(self)
	self.daily_interest_fail = 0
	
	if self.refugee_life_remaining then
		self.refugee_life_remaining = self.refugee_life_remaining - 1
		if self.refugee_life_remaining <= 0 then
			self:RemoveTrait("Refugee")
			if self:Random(100) < TraitPresets.Refugee.param then
				self:AddTrait("Renegade")
			end
			self.refugee_life_remaining = nil
		end
	end
end

function Colonist:GetPerformanceReasons()
	local texts = {}
	-- from morale, modify baze value
	local low = g_Consts.LowStatLevel
	local high = g_Consts.HighStatLevel
	local morale = self.stat_morale
	local color = function (val) return val>0 and TLookupTag("<green>") or  TLookupTag("<red>") end
	local sign = function (val) return val>0 and Untranslated("+") or "" end
	local amount = 100*Clamp(morale, 0, max_stat)/max_stat - 50
	local sn = sign(amount)
	
	texts[#texts + 1] =  T{6936, "<clr><reason></color>", clr = color(amount), reason = T{ColonistPerformanceReasons["Morale"], amount = sn..Untranslated(amount) }}
	if self.traits.Enthusiast and morale >= high then
		amount = TraitPresets.Enthusiast.param
		sn = sign(amount)
		texts[#texts+1] = T{6936, "<clr><reason></color>", clr = color(amount), reason = T{ColonistPerformanceReasons["Enthusiast"], amount = sn..Untranslated(amount)}}
	elseif self.traits.Melancholic and morale <  low then
		amount = - TraitPresets.Melancholic.param
		sn = sign(amount)
		texts[#texts+1] =  T{6936, "<clr><reason></color>",  clr = color(amount), reason = T{ColonistPerformanceReasons["Melancholic"],  amount =  sn..Untranslated(amount)}}
	end
	if 	           morale >= high
		and self.stat_health >= high
		and self.stat_sanity >= high
		and self.stat_comfort>= high
		and g_VocationOrientedSociety
	then
		amount = g_VocationOrientedSociety.param1
		sn = sign(amount)
		texts[#texts+1] = T{6936, "<clr><reason></color>", clr = color(amount), reason = T{ColonistPerformanceReasons["VocationOrientedSociety"],amount = sn..Untranslated(amount)}}
	end

	--	traits
	local trait_defs = TraitPresets
	for trait_id in pairs(self.traits)do
		local trait_def = trait_defs[trait_id]
		if 	 trait_def 
			and trait_def.modify_target=="self"
			and trait_def.modify_property=="performance" 
		then
			amount = trait_def.modify_amount
			sn = sign(amount)
			texts[#texts+1] = T{6936, "<clr><reason></color>", clr = color(amount), reason = T{ColonistPerformanceReasons[trait_id],amount = sn..Untranslated(amount)}}
		end
	end
	
	-- property modifiers
	table.append(texts, self:GetPropertyModifierTexts("performance"))
	return table.concat(texts, '\n')
end

function Colonist:GetTraitsWarnings()
	-- Idiot trait warning	
	if self.traits.Idiot then
		return  "<newline><newline>"..T{8039, "Trait: Idiot (can cause a malfunction)"}
	end
	return ""
end

function Colonist:GetUIWarning()
	local status_effect = GetTopPriorityStatusEffect(self)
	local warning = status_effect and GetColonistStatusEffectWarning(status_effect)
	if warning then
		return T{warning, self}
	end	
	local detrimental_traits = GetDetrimentalTraits()
	for _, trait in ipairs(detrimental_traits) do
		if self.traits[trait] then
			return T{ColonistTraitsWarnings[trait], self}
		end
	end
end

function GetDetrimentalStatusColonists(city, return_first)
	local objs = {}
	local detrimental_status_effects = GetDetrimentalStatusEffects()
	local detrimental_traits = GetDetrimentalTraits()
	local array = city.labels.Colonist or empty_table
	for _, colonist in ipairs(array) do
		local added
		for i, effect in ipairs(detrimental_status_effects) do
			if colonist.status_effects[effect] then
				if return_first then return colonist end
				objs[#objs + 1] = colonist
				added = true
				break
			end
		end	
		if not added then
			for i, trait in ipairs(detrimental_traits) do
				if colonist.traits[trait] then
					if return_first then return colonist end
					objs[#objs + 1] = colonist
					break
				end
			end	
		end	
	end
	if return_first then return false end
	return objs
end	
-------------------------------------------------------------
function Colonist:ExitBuilding(building, target, entrance_type, spot_name)
	if self.command == "Die" or not IsValid(self) then return end
	return Unit.ExitBuilding(self, building, target, entrance_type, spot_name)
end

function Colonist:LeavingMars(rocket)
	self.leaving = true
	self:SetDome(false)
	self:ClearTransportRequest()
	table.insert(rocket.departures, self)
	
	local reached
	self:PushDestructor(function(self)
		assert(self.command == "Die")
		self.leaving = false
		table.remove_entry(rocket.departures, self)
	end)
	
	if not self:GotoBuildingSpot(rocket, rocket.drone_entry_spot) -- the colonist cannot reach the rocket, don't try to pass through objects, mountains or walk above ground...
		or not IsValid(rocket) or not rocket:IsBoardingAllowed() then -- rocket already left
		self:PopDestructor()
		self.leaving = false
		table.remove_entry(rocket.departures, self)
		return
	end
	
	self:PopDestructor()
	self:PushDestructor(function(self)
		-- if the rocket is still waiting for something, hop on
		table.remove_entry(rocket.departures, self)
		table.insert(rocket.boarding, self)
		
		rocket:LeadIn(self, rocket.waypoint_chains.rocket_entrance[1])		

		-- remove from boarding list
		table.remove_entry(rocket.boarding, self)

		if SelectedObj == self then
			--deselect this colonist (mantis:0130871)
			SelectObj()
		end
		if self.traits.Tourist then
			local tourist1 = GenerateApplicant(false, self.city)
			tourist1.traits.Tourist = true
			local tourist2 = GenerateApplicant(false, self.city)
			tourist2.traits.Tourist = true
		end	
		DoneObject(self)
		--@@@msg ColonistLeavingMars, colonist, rocket - fired when any colonist is leaving Mars
		Msg("ColonistLeavingMars", self, rocket)
		RebuildInfopanel(self)
	end)
	self:PopAndCallDestructor()
end

GlobalVar("g_RecentlyDeadCitizens", {})
GlobalVar("g_InfectedDeadCitizens", {})
GlobalVar("DeadCitizensNotif", false)
GlobalVar("UnnaturalDeaths", 0)
GlobalGameTimeThread("InfectedDeadColonistNotif", function()
	HandleNewObjsNotif(g_InfectedDeadCitizens, "Mystery8DeathInfection")
end)

function Colonist:Erase()
	self:PushDestructor(function(self)
		self:ClearTransportRequest()
		self.dying = true
		self:RemoveFromLabels()
		self:SetWorkplace(false)
		self:SetResidence(false)
		self:AssignToService(false) -- unassign from building when interupted
		self:SetHolder(false)
		self:SetDome(false)
		table.clear(self.status_effects)
		UpdateAttachedSign(self)
		RebuildInfopanel(self)
		if IsValid(self) then
			DoneObject(self)
		end
	end)
	self:PopAndCallDestructor()
end

function Colonist:Die(reason)
	reason = DeathReasons[reason] and reason or "low health"
 -- for not interupting 'die' command from other commands
	--@@@msg ColonistDie, colonist, reason - fired when any colonist dies
	Msg("ColonistDie", self, reason)
	self:PushDestructor(function(self)
		local city = self.city
		local dome = self.dome
		
		self:ClearTransportRequest()
		self.dying = true
		self.dying_reason = reason
		self.stat_health = 0
		self:OnDie(reason)
		self.last_workplace = self.workplace
		self.last_residence = self.residence
		self:SetWorkplace(false)
		self:SetResidence(false)
		self:AssignToService(false) -- unassign from building when interupted
		local holder = self.holder
		if holder then
			local exit_pos
			if IsKindOf(holder, "Building") then
				local entrance, pos, spot_type = holder:GetEntrance()
				exit_pos = spot_type and holder:GetSpotPos(holder:GetRandomSpot(spot_type)) or pos
			end
			exit_pos = exit_pos or holder:GetVisualPos()
			self:SetPos(exit_pos)
			self:SetAngle(AsyncRand(360*60))
			self:SetHolder(false)
			holder:OnExitUnit(self)
		end
		table.clear(self.status_effects)
		UpdateAttachedSign(self)
		RebuildInfopanel(self)
		self:SetPos(self:GetVisualPos())
		self:SetState("layDying")
		self:ProjectPhoenixEffect()
		local is_infected = self.traits.Infected
		if not NaturalDeathReasons[reason] then
			UnnaturalDeaths = (UnnaturalDeaths or 0) + 1
			local applicants = #g_ApplicantPool
			local i=1
			while i<=2 and applicants>0 do
				table.remove(g_ApplicantPool, Random(1,applicants))
				applicants = applicants -1
				i = i + 1
			end
			g_RecentlyDeadCitizens[#g_RecentlyDeadCitizens + 1] = self
			if is_infected then
				g_InfectedDeadCitizens[#(g_InfectedDeadCitizens or {})+ 1] = self
				if IsOnScreenNotificationShown("DeadCitizens") then
					AddOnScreenNotification("DeadCitizens", nil, {count = #g_RecentlyDeadCitizens}, g_RecentlyDeadCitizens)
				end
			else
				AddOnScreenNotification("DeadCitizens", nil, {count = #g_RecentlyDeadCitizens}, g_RecentlyDeadCitizens)
			end
			DeleteThread(DeadCitizensNotif)
			DeadCitizensNotif = CreateGameTimeThread(function()
				Sleep(60000)
				g_RecentlyDeadCitizens = {}
				RemoveOnScreenNotification("DeadCitizens")
			end)
		end
		local pt = GetPassablePointNearby(self) or self:GetPos()
		Sleep(Random(const.HourDuration, const.DayDuration))
		if IsValid(self) then
			DoneObject(self)
		end
		if is_infected then
			table.remove_entry(g_InfectedDeadCitizens,self)
		end
		if self.city:IsTechResearched("SoylentGreen") then
			PlaceResourcePile(pt, "Food", 1*const.ResourceScale)
		end
	end)
	self:PopAndCallDestructor()
end

function Colonist:OnDie(reason)
	self:RemoveFromLabels()
	self.city:AddToLabel("DeadColonist", self)
	if IsValid(self.dome) then
		self.dome:AddToLabel("DeadColonist", self)
	end
	if not NaturalDeathReasons[reason] then
		for _, colonist in ipairs(IsValid(self.residence) and self.residence.colonists or empty_table) do
			if colonist ~= self then
				colonist:ChangeSanity(-g_Consts.SeeDeadSanity, "dead colonist")
			end
		end
	end
	--@@@msg ColonistDied,colonist, reason- fired when a colonist has died.
	Msg("ColonistDied", self, reason)
	
	if not self.city.dead_notification_shown and not NaturalDeathReasons[reason] then
		self.city.cur_sol_died = self.city.cur_sol_died + 1
		if self.city.cur_sol_died + self.city.last_sol_died >= 5 then
			ShowPopupNotification("Evaluation_Colonist_Deaths", {ApplicantsLostOnColonistDeath = 2})
			self.city.dead_notification_shown = true
		end
	end
end

function Colonist:ProjectPhoenixEffect()
	local traits = self.traits
	if self.city:IsTechResearched("ProjectPhoenix") and not traits.Android and self:Random(100) < TechDef.ProjectPhoenix.param1 then
		local dome = self.dome or self.current_dome or self.city:LabelRand("Dome")
		if not dome then
			return
		end
		local heir = GenerateColonistData(self.city, "Youth", "martianborn",{gender = self.gender, entity_gender = self.entity_gender, no_traits = "no_traits",no_specialization = true})		
		for trait_id, _ in pairs(traits) do
			local trait = TraitPresets[trait_id]
			local category = trait and trait.group or false
			if category and category~="Age Group" and category~="Gender" then
				heir.traits[trait_id] = true
			end
		end
		heir.dome = dome
		heir.progenitor_name = self.progenitor_name
		if heir.progenitor_name == "" then
			heir.progenitor_name = self.name
		end
		heir.serial = self.serial + 1
		heir.name = T{4301, "<name> <roman(serial)>", name = heir.progenitor_name, serial = heir.serial}
		local colonist = Colonist:new(heir)
		colonist:SetSpecialization(self.specialist)
		dome:RandPlaceColonist(colonist)
		--@@@msg ColonistBorn,colonist, event- fired when a colonist has been born/cloned/reborn/spawned/...
		Msg("ColonistBorn", colonist, "reborn")
	end
end

function Colonist:OnEnterDomeFail(dome)
	self.dome_enter_fails = self.dome_enter_fails + 1
	if dome then
		local failed = self.failed_domes or setmetatable({}, weak_keys_meta)
		failed[dome] = GameTime()
		self.failed_domes = failed
	end
end

function Colonist:Abandoned()
	self:ExitBuilding()
	
	assert(not self.current_dome)
	assert(self.outside_start)
	assert(self:IsValidPos())
	
	if not self:IsValidPos() then
		local dome = self.dome or self.current_dome or self.city:LabelRand("Dome")
		if dome then
			dome:RandPlaceColonist(self)
			return
		end
	end
	if IsValid(self.current_dome) then
		self:SetDome(self.current_dome)
		return
	end
	
	self:ClearTransportRequest()
	local dome = self.dome
	if not dome then
		local domes, safety_dome = GetDomesInWalkableDistance(self.city, self:GetVisualPos(), self.failed_domes)
		dome = ChooseDome(self.traits, domes, safety_dome)
		if not dome then
			local oldest_fail_time = max_int
			for failed_dome, fail_time in pairs(self.failed_domes or empty_table) do
				if fail_time < oldest_fail_time then
					oldest_fail_time = fail_time
					dome = failed_dome
				end
			end
		end
	end
	if dome and self:EnterBuilding(dome) then
		assert(self.dome_enter_fails == 0)
		local sanity_change = 30 * stat_scale - self.stat_sanity
		if sanity_change > 0 then --only if we aint actually reducing sanity
			self:ChangeSanity(sanity_change, "survived outside") --add the rest in player visible way
		end
		return
	end
	assert(not dome or self.dome_enter_fails > 0)
	local fail_count = Max(1, self.dome_enter_fails)
	-- the colonist have an assigned dome but he have failed to reached several times, therefore we have to try to change it
	self:SetDome(false)
	self:CancelResidenceReservation()
	local max_wonder_dist = Min(100*guim, fail_count * 20 * guim)
	self:GoToRandomPos(max_wonder_dist, 5*guim)
	self:SetState("idle")
	local sleep_until = GameTime() + Min(60000, fail_count * (5000 + AsyncRand(5000)))
	local dome_version = g_DomeVersion
	while dome_version == g_DomeVersion and GameTime() < sleep_until do
		WaitMsg("BuildingPlaced", 1000)
	end
end

function Colonist:Roam(duration)
	local tEnd = GameTime() + duration
	self:ExitBuilding()
	while tEnd - GameTime() > 0 do
		self:GoToRandomPosInDome(self.dome)
		self:PlayState("idle", -1000)
	end
end

GlobalVar("g_PsychoticBreakCitizens", {})
GlobalGameTimeThread("PsychoticBreakCitizensNotif", function()
	HandleNewObjsNotif(g_PsychoticBreakCitizens, "ColonistPsychoticBreak")
end)

function Colonist:Affect(status_effect, bApply, now, force)
	local status_effects = self.status_effects
	local class = _G[status_effect]
	if not class then return end
	if bApply then
		if status_effects[status_effect] then
			return
		end
		now = now or GameTime()
		status_effects[status_effect] = now
		class:Start(self, now, force)
	else
		if not status_effects[status_effect] then
			return
		end
		status_effects[status_effect] = nil
		class:Stop(self)
	end
	UpdateAttachedSign(self)
	RebuildInfopanel(self)
	Msg("ColonistStatusEffect", self, status_effect, bApply, now)
end

function Colonist:Suicide()
	-- add notification	
	AddOnScreenNotification("ColonistSuicide",nil,{name = self:GetDisplayName()},{self})
	self:SetCommand("Die", "suicide")
end

function Colonist:SafeMode()
	self:GoToRandomPosInDome(self.dome)
	
	local def = TechDef.SafeMode
	self:SetAnim(1, "sleepStart")
	Sleep(self:TimeToAnimEnd())
	self:SetAnim(1, "sleepIdle")
	Sleep(def.param1 * const.HourDuration)
	self:SetAnim(1, "sleepEnd")
	Sleep(self:TimeToAnimEnd())
	
	self:ChangeSanity(def.param2 * stat_scale, "insane")
end

function Colonist:Arrive()
	local rocket = self.arriving
	assert(rocket)
	if not rocket then
		return
	end
	local dome = self.emigration_dome or self.dome
	self.emigration_dome = nil
	self:PushDestructor(self.OnArrival)
	if not IsKindOf(rocket, "SupplyRocket") then
		-- backward compatibility
		if rocket.parent_dome then
			self:OnEnterDome(rocket.parent_dome)
		end
		rocket:OnEnterUnit(self)
	else
		if HintsEnabled then
			HintTrigger("HintDecorations")
			HintTrigger("HintComfortStatAndServices")
		end
		
		--@@@msg ColonistArrived,colonist- fired when a colonist has arrived on Mars with a rocket.
		Msg("ColonistArrived", self)
		
		self:SetOutside(true)
		self.current_dome = false
		-- disembark
		local spot = rocket:GetSpotBeginIndex("Colonistout")
		local pos = rocket:GetSpotLoc(spot)
		rocket:Attach(self, spot)
		self:SetAnim(1, rocket.disembark_anim)
		self:PushDestructor(function(self)
			Sleep(self:TimeToAnimEnd())
			self:Detach()
			self:SetPos(pos)
			self:SetState("idle")
			table.remove_value(rocket.disembarking, self)
		end)
		self:PopAndCallDestructor() -- Disembark uninterruptible

		if not dome then
			rocket.disembarking_confused = true
		elseif self:EnterBuilding(dome) then
			self:SetDome(dome)
		end
	end
	self:PopAndCallDestructor() -- OnArrival
end

function Colonist:OnArrival()
	assert(self.holder or self:IsValidPos())
	if self.traits.Tourist then
		self.city:ChangeFunding(g_Consts.FundingFromTourist*1000000, "Tourist")
	end
	self.arriving = nil
	self:UpdateHomelessLabels()	
	self:UpdateEmploymentLabels()
	if self.residence then
		self:ChangeComfort(self.residence.service_comfort - self.stat_comfort)
	end
	self.last_meal = GameTime()
end
----------------------- Work, Workplace, Work -----------------------

GlobalVar("g_NocturnalAdaptation", false)

function Colonist:ChangeWorkplacePerformance()
	local workplace = self.workplace

	if workplace and workplace.parent_dome and workplace.parent_dome ~= self.dome then
		--different dome penalty
		self:SetModifier("performance", "home_dome", -g_Consts.NonHomeDomePerformancePenalty, 0, T{8757, "<red>Not working in home dome <amount></color>"})
	else
		self:SetModifier("performance", "home_dome", 0, 0)
	end
	
	if workplace and workplace.specialist ~= "none" then
		local match = workplace.specialist == self.specialist
		local amount = match and 
				self.preferred_workplace_performance_bonus 
				or -g_Consts.NonSpecialistPerformancePenalty
		local sponsor = GetMissionSponsor()
		local text =  match and
				T{6927, "<green>Correct workplace specialization +<amount></color>"}
				or T{6928, "<red>Wrong workplace specialization <amount></color>"}
		self:SetModifier("performance", "specialist_match", amount - (sponsor.specialist_bonus_performance or 0), 0, text)
		if sponsor.specialist_bonus_performance and match then
			text = T{10538, "<green>"}..sponsor.specialist_bonus_performance_name..T{10539, " +<amount></color>", amount = sponsor.specialist_bonus_performance}
			self:SetModifier("performance", "specialist_match_sponsor_bonus", sponsor.specialist_bonus_performance, 0, text)
		end
	else
		self:SetModifier("performance", "specialist_match", 0, 0)
	end

	if g_NocturnalAdaptation then
		if workplace and self.workplace_shift == g_NocturnalAdaptation.param1 then
			self:SetModifier("performance", "NocturnalAdaptation", g_NocturnalAdaptation.param2, g_NocturnalAdaptation.param3, T{4304, "<green>Nocturnal Adaptation <amount></color>"})
		else
			self:SetModifier("performance", "NocturnalAdaptation", 0, 0)
		end
	end
end

function Colonist:UpdateEmploymentLabels()
	if self.workplace or not self:CanWork() then
		if self.dome then self.dome:RemoveFromLabel("Unemployed",self) end
		self.city:RemoveFromLabel("Unemployed", self)
		self:Affect("StatusEffect_Unemployed", false)
	else
		if self.dome then self.dome:AddToLabel("Unemployed", self) end
		self.city:AddToLabel("Unemployed", self)			
		self:Affect("StatusEffect_Unemployed", "start")
	end
end

function Colonist:SetWorkplace(building, shift)
	assert(not building or ValidateBuilding(building) and building.ui_working)
	
	building = not self:IsDying() and ValidateBuilding(building)
	local old_workplace = self.workplace
	if not building and not old_workplace then
		return
	end
	if building == old_workplace and shift == self.workplace_shift then
		return
	end
	
	local refresh = not building and old_workplace or not old_workplace and building
	if old_workplace then
		--remove overtime from daily routine
		old_workplace:RemoveWorker(self)
	end
	
	self.workplace = building
	self.workplace_shift = shift or 1
	
	if building then
		assert(shift)
		assert(building:IsSuitable(self))
		building:AddWorker(self, shift)
		self.avoid_workplace = false -- last workplace , avoid when choose new workplace and reset when new workplace is set
		self.avoid_workplace_start = false
	end
	--@@@msg ColonistChangeWorkplace,colonist, new_workplace, old_workplace - fired when any colonist changes its workplace and the new and old are different
	Msg("ColonistChangeWorkplace",self, building, old_workplace)
	 
	self:UpdateEmploymentLabels()
	if refresh then
		RebuildInfopanel(self)
	end

	---- performance changes
	self:ChangeWorkplacePerformance()

	-- set command
	if not building and self:IsInWorkCommand() then
		self:InterruptCommand()
	end
end

GlobalVar("g_SeniorsCanWork", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "NocturnalAdaptation" then
		g_NocturnalAdaptation = TechDef[tech_id]
		city:ForEachLabelObject("Colonist", "ChangeWorkplacePerformance")
		city:ForEachLabelObject("Workplace", "UpdatePerformance")
	elseif 
		tech_id == "GeneralTraining" 
		or tech_id == "ProductivityTraining" 
		or tech_id == "EmergencyTraining" 
		or tech_id == "SystematicTraining" 
	then
		city:ForEachLabelObject("Colonist", "ChangeWorkplacePerformance")
		city:ForEachLabelObject("Workplace", "UpdatePerformance")
	elseif tech_id == "ForeverYoung" then
		g_SeniorsCanWork = true
	elseif tech_id == "MartianbornIngenuity" then
		local amount = TechDef[tech_id].param1
		local display_text = T{7587, "<green>Martianborn Ingenuity <amount></color>"}
		for _, dome in ipairs(city.labels.Dome) do
			for _, colonist in ipairs(dome.labels.Martianborn or empty_table) do
				colonist:SetModifier("performance", "MartianbornIngenuity", amount, 0, display_text)
			end
		end
	end
end

local max_priority = const.MaxBuildingPriority

function Colonist:UpdateWorkplace()
	--	look for dome before choosing workplace
	local my_dome = self.dome
	if not IsValid(my_dome) then
		self:SetWorkplace(false)
		return
	end
	-- check first forced workplace
	local to_kick
	local workplace, shift = self:CheckForcedWorkplace()
	if workplace then
		local service_dome = workplace:CheckServicedDome(my_dome)
		if not workplace:IsSuitable(self) 
			or not workplace.ui_working
			or workplace == self.workplace and shift == self.workplace_shift
			or (service_dome ~= my_dome and not AreDomesConnectedWithPassage(service_dome, my_dome) )
		then
			-- the forced workplace is the current workplace or the colonist cannot yet work there
			return
		end
		shift, to_kick = workplace:FindFreeSlotForced(shift)
		if not shift then
			return
		end
		self.user_forced_workplace[2] = shift
	end
	
	if not workplace then
		local current_workplace = self.workplace
		if current_workplace then
			if not ValidateBuilding(current_workplace) or not current_workplace:IsSuitable(self) then
				self:SetWorkplace(false)
			elseif current_workplace.force_lock_workplace then
				return
			end
		end
		if self:CanTrain() then
			 -- try train buidings
			workplace, shift = ChooseTraining(self)
			if my_dome.allow_work_in_connected and my_dome.accept_colonists then
				local nxt_dome = next(my_dome.connected_domes)
				while nxt_dome and not workplace do
					if nxt_dome:CanColonistsFromDifferentDomesWorkServiceTrainHere() then
						workplace, shift = ChooseTraining(self, nxt_dome.labels.TrainingBuilding, workplace, shift)
					end
					nxt_dome = next(my_dome.connected_domes, nxt_dome)
				end
			end
		end
		local work_bld, work_shift, work_to_kick
		if self:CanWork() and (not workplace or workplace.priority < max_priority) then
			-- try workplaces buidings
			local specialist_match = false
			local lst = my_dome.labels.Workplaces
			work_bld, work_shift, work_to_kick, specialist_match = ChooseWorkplace(self, lst, true)
			
			if my_dome.allow_work_in_connected and my_dome.accept_colonists and (not work_bld or work_bld.priority < max_priority or not specialist_match) and next(my_dome.connected_domes) then
				for connected_dome, connections in pairs(my_dome.connected_domes) do
					if connected_dome:CanColonistsFromDifferentDomesWorkServiceTrainHere() then
						lst = connected_dome.labels.Workplaces
						local od_wp, od_shift, od_kick, od_sm = ChooseWorkplace(self, lst)
						local cpy = false
						local brk = false
						if od_sm and not specialist_match then
							--found specialist match in other dome
							cpy = true
							if od_wp.priority >= max_priority then
								brk = true
							end
						elseif CompareWorkplaces(work_bld, od_wp, self) == od_wp then
							cpy = true
						end
						
						if cpy then
							work_bld = od_wp
							work_shift = od_shift
							work_to_kick = od_kick
							specialist_match = od_sm
						end
						if brk then break end
					end
				end
			end
		end
		if work_bld and (not workplace or work_bld.priority > workplace.priority) then
			-- workplace is prefered over training only if having higher priority
			workplace, shift, to_kick = work_bld, work_shift, work_to_kick
		end
	end
	
	if not workplace and not self.workplace
	or workplace == self.workplace and shift == self.workplace_shift then
		return
	end

	--Print("workplace",workplace and workplace.class, workplace and workplace.specialist	)
	if to_kick then 
		to_kick:SetWorkplace(false)
	end	
	self:SetWorkplace(workplace, shift)
	--Print(self.name, self.specialist, "set workplace")
	if to_kick then 
		--Print(self.name, self.specialist,"kicks", to_kick.name, to_kick.specialist, to_kick.prefer_workplace)
		to_kick:UpdateWorkplace()
	end
end

function Colonist:GetFired()
	if not self.workplace then
		return
	end
	self:SetWorkplace(false)
	self.avoid_workplace = self.workplace
	self.avoid_workplace_start = self.city.day
	self:ChangeWorkplacePerformance()
end

----------------------- Service Buildings, Leisure, Visits -----------------------
function Colonist:TryToEmigrate()
	--- try to recal the dome
	local transport_task = self.transport_task
	local dest_dome, walking, dist = self:FindEmigrationDome()
	if not dest_dome then
		if transport_task then
			self:ClearTransportRequest()
		end
		return
	end
	
	if walking then --git goin
		self:ClearTransportRequest()
		dest_dome:ReserveResidence(self)
		self:SetCommand("TransportByFoot", dest_dome)
		return
	end
	
	if transport_task then
		if dest_dome ~= transport_task.dest_dome then
			dest_dome:ReserveResidence(self)
			transport_task.dest_dome = dest_dome		
		end
		return 
	end
	
	local src_dome = self.current_dome or self.dome or FindNearestObject(self.city.labels.Dome, self)
	--check shuttle availability,
	--if shuttles are available register for transport, shuttle will Setcommand when it picks up the task
	if IsTransportAvailableBetween(src_dome, dest_dome) and CreateColonistTransportTask(self, src_dome, dest_dome) then
		dest_dome:ReserveResidence(self)
		self.transport_task.state = "almost_ready_for_pickup" --so a shuttle can immidiately pick this task up
	end
end

function Colonist:CancelResidenceReservation()
	if IsValid(self.reserved_residence) then
		self.reserved_residence:CancelResidenceReservation(self)
	end
	self.reserved_residence = false
end

function Colonist:ClearTransportRequest() --always clears, cancel imm clears only if routine hasn't started yet
	self:CancelResidenceReservation()
	local transport_task = self.transport_task
	if transport_task then
		if transport_task.shuttle then
			transport_task.shuttle:SetCommand("Idle")
			transport_task.shuttle = false
		end
		transport_task:Cleanup()
	end
end

function Colonist:TryVisit(need, ...)
	self:AssignToService(false) -- unassign from building when interupted
	assert(self.dome)
	if not self.dome then
		return
	end
	local building, fail = self.dome:GetService(need, self, ...)
	if building then
		self:AssignToService(building)
		self:SetCommand("VisitService", building)
	end
	return fail
end

function Colonist:ShouldPanic()
	if not self.current_dome then
		return false
	end
	
	local t = GameTime()
	local panic_pos, panic_dist, panic_radius
	
	for _, marker in ipairs(self.current_dome.panic_markers or empty_table) do
		if t < marker.expiration_time then
			local dist = self:GetVisualDist2D(marker.pos)
			
			if dist < marker.radius and (not panic_dist or dist < panic_dist) then
				panic_pos, panic_dist, panic_radius = marker.pos, dist, marker.radius
			end			
		end
	end
	
	return panic_pos, panic_radius
end

function Colonist:Panic(panic_pos)
	self:PushDestructor(function(self)
		self:SetMoveAnim("moveWalk")
	end)
	-- change move anim
	self:SetMoveAnim("moveEvade")
	
	-- try to step away from panic_pos
	local pt = self:GetVisualPos()
	local dir = pt - panic_pos
	local target = pt + SetLen(dir, 5*guim)
	local reached
	
	if GetDomeAtPoint(target) == self.current_dome then
		reached = self:Goto(target)
	end
	
	if not reached then
		-- if failed play cower anim for a time (standSuicide placeholder)
		self:SetAnim(1, "standPanicIdle")
		Sleep(2000)
	end

	self:PopAndCallDestructor()
end

local min_age_names = {}
do
	for _, name in ipairs(const.ColonistAges) do
		min_age_names[name] = "MinAge_" .. name
	end
end

function Colonist:IsShocked()
	for id in pairs(self.status_effects) do
		if StatusEffectsShock[id] then
			return true
		end
	end
end

function Colonist:Idle()
	assert(not self:IsDying())
	if self:IsDying() then 
		self:SetCommand("Die",self.dying_reason)
		return
	end	
	
	if self.force_suicide then
		self:SetCommand("Suicide")
	end
	
	if self.arriving then
		self:SetCommand("Arrive")
		return
	end
	if not (self.holder or self:IsValidPos() or terrain.IsPassable(self)) then
		Sleep(2000)
		local dome = self.current_dome or self.dome
		if dome then
			dome:RandPlaceColonist(self)
		end
	end
	
	local traits = self.traits
	local g_Consts = g_Consts
	local const = const

	local cur_trait_idx = table.find(const.ColonistAges, self.age_trait)
	local next_age_trait = cur_trait_idx and const.ColonistAges[cur_trait_idx + 1]
	if not traits.Android and next_age_trait and self.age >= self[min_age_names[next_age_trait]] then
		self:RemoveTrait(self.age_trait)
		self.age_trait = next_age_trait
		self:AddTrait(next_age_trait)
		if next_age_trait == "Youth" then
			Msg("ColonistBecameYouth", self)
		end
	end

	local transport = self.transport_task
	local dest_dome = transport and transport.shuttle and transport.shuttle.dest_dome
	if dest_dome then
		self:SetCommand("Transport", dest_dome)
	end
	
	if traits.Dreamer and g_MysteryDream then
		self:SetCommand("MysteryDream")
	end
	
	local status_effects = self.status_effects
	if self.stat_sanity == 0 then
		if self.city:IsTechResearched("SafeMode") then
			self:SetCommand("SafeMode")
		else
			if not self.traits.Religious and self:Random(100) < g_Consts.LowSanitySuicideChance then 
				self:SetCommand("Suicide")
			elseif not status_effects.StatusEffect_StressedOut and self:Random(100) < g_Consts.LowSanityNegativeTraitChance then
				local compatible = FilterCompatibleTraitsWith(const.SanityBreakdownTraits, self.traits)
				if #compatible>0 then
					self:AddTrait(table.rand(compatible))
				end
			end
			self:Affect("StatusEffect_StressedOut", "start")
			Msg("SanityBreakdown", self)
		end
	end
	
	local panic_pos, panic_radius = self:ShouldPanic()
	if panic_pos then
		self:SetCommand("Panic", panic_pos, panic_radius)
	end	
	
	local shock_status = self:IsShocked()
	local low_health = self.stat_health < g_Consts.LowStatLevel
	local low_sanity = self.stat_sanity < g_Consts.LowStatLevel
	
	if HintsEnabled and (low_health or low_sanity) and not next(status_effects) then
		HintTrigger("HintHealthcare")
	end
	
	if not self.current_dome then
		if not self.dome or self.dome_enter_fails > 0 then
			self:SetCommand("Abandoned")
		end
	else
		if not self.dome and not self:CheckForcedDome() then
			assert(false, "Colonist in a dome without being assigned to a dome!?")
			self:SetDome(self.current_dome)
		end
	end
	
	if not shock_status and low_sanity then
		self:TryVisit("needMedical")
	end

	if low_health then
		if shock_status then
			self:SetWorkplace(false)
		else
			local fail = self:TryVisit("needMedical")
			if fail then
				self:SetWorkplace(false)
			end
		end
	end
	
	local time = GameTime()
	if time - self.last_meal > g_Consts.TimeBeforeStarving then
		local fail = self:TryVisit("needFood", "starving")
		if fail then
			self:Affect("StatusEffect_Starving", "start")
		end	
	end

	if not low_health and self.stat_health < g_Consts.HighStatLevel and not shock_status then
		self:TryVisit("needMedical")
	end
	
	if time > self.next_heavy_update then
		self.next_heavy_update = time + ColonistHeavyUpdateTime
		self:UpdateWorkplace()
		self:UpdateResidence()
		self:TryToEmigrate()
	else
		if self.user_forced_dome then
			self:TryToEmigrate()
		end
		if self.user_forced_workplace then
			self:UpdateWorkplace()
		end
		if self.user_forced_residence or self.reserved_residence then
			self:UpdateResidence()
		end
	end
	
	if self.workplace then
		local hour = self.city.hour
		local workshift_start = const.DefaultWorkshifts[self.workplace_shift][1]
		if hour >= (workshift_start - 1) and hour <= (workshift_start + 3) then
			if not self.workplace:IsSuitable(self) then
				self:SetWorkplace(false)
			elseif traits.Fit or self.stat_health >= g_Consts.LowStatLevel then
				self:SetCommand("Work")
			end
		end	
	end
	
	if time - self.last_rest > const.HourDuration * 30 then
		self:SetCommand("Rest")
	end
	
	if self.daily_interest ~= "" then
		local fail = self:TryVisit(self.daily_interest)
		self.daily_interest_fail = Max(self.daily_interest_fail, fail or 0)
	end
	
	if self.last_meal < DayStart then
		self:TryVisit("needFood", not "starving")
	end
	
	if time - self.last_rest > const.HourDuration * 10 and IsDarkHour(self.city.hour) then
		self:SetCommand("Rest")
	end
	
	self:Roam(const.HourDuration)
end

function Colonist:AssignToService(service, force, ...)
	if self.assigned_to_service and not force then
		self.assigned_to_service:Unassign(self, ...)
		self.assigned_to_service = false
	end
	if service and self.assigned_to_service~=service then
		self.assigned_to_service = service
		service:Assign(self)
	end
end

function Colonist:VisitService(service)
	if not IsValid(service) then --bld can die before cmd boots up.
		self:AssignToService()
		return
	end
	self:AssignToService(service, "force")
	self:PushDestructor(self.AssignToService)
	local n = GameTime()
	if self:EnterBuilding(service) and IsValid(service) then
		local interest = self.daily_interest
		if service:IsOneOfInterests(interest) then
			self.daily_interest = ""
		end
		if self.traits.Gamer and service:IsOneOfInterests("interestGaming") then
			local trait_gamer = TraitPresets.Gamer
			self:ChangeSanity( trait_gamer.param * const.Scale.Stat, trait_gamer.id )
		end
		service:Service(self, false, interest)
	end
	if n == GameTime() then
		self:SetState("idle")
		Sleep(1000) --inf loop guard
	end
	self:PopAndCallDestructor()
end

function Colonist:Rest()
	local holder = self.holder
	if holder and holder ~= self.residence then
		self:ExitBuilding(holder, self.residence)
		assert(self:IsValidPos())
	end
	if IsValid(self.residence) and self.holder ~= self.residence and not self:EnterBuilding(self.residence) then
		return
	end
	self:PushDestructor(function(self)
		self:ExitBuilding()
	end)
	self.last_rest = GameTime()
	
	local residence = self.residence
	local dome = self.dome
	if residence and residence.working then
		local is_rapid_sleep = self.city:IsTechResearched("RapidSleep") 
		local rest_duration = is_rapid_sleep and const.HourDuration or residence.rest_duration
		residence:Service(self, rest_duration)
		
		self:ChangeHealth(self.DailyHealthRecover, "rest")
		local sanity_recover = self.DailySanityRecover + residence.sanity_increase
		self:ChangeSanity(is_rapid_sleep and 2*sanity_recover or sanity_recover, "rest")

		if dome and dome.working then
			local commander_profile = GetCommanderProfile()
			local psyho = commander_profile.id=="psychologist" and commander_profile.param1*stat_scale or 0
			self:ChangeSanity(psyho, "psychologist" )		
			self:ChangeSanity(dome.DailySanityRecoverDome, "dome" )
		end
	else
		if not self.traits.Rugged then
			self:ChangeComfort(-g_Consts.NoHomeComfort,"no home")
		end
		self:Roam(const.HourDuration)
	end
	
	if residence and dome:IsMalfunctioned() then
		self:ChangeSanity(-g_Consts.MalfunctionedDome, "malfunctioned Dome rest")
	end
	
	local wonder = self.city.labels.ProjectMorpheus or empty_table
	if not self.traits.Child and  #wonder>0 and wonder[1].working then
		local count = 0
		for id, _ in pairs(self.traits) do
			local trait = TraitPresets[id]
			if trait and trait.show_in_traits_ui then
				count = count + 1
			end	
		end
		if count<5 and self:Random(100)<=g_Consts.ProjectMorphiousPositiveTraitChance then
			-- add positive trait
			wonder[1]:AddTrait(self)			
		end
	end
	self:PopAndCallDestructor()
end

function Colonist:IsDying()
	return not IsValid(self) or self.dying
end

-- can change worker command, workplace, residence
-- when te colonist is not dying and not leaving mars
-- LeavingMars command can no tbe interrupted except by Die, so add this check to all other places
function Colonist:CanChangeCommand()
	return IsValid(self) and not self:IsDying() and not self:IsTransported() and not self.leaving
end

Colonist.IsDead = Colonist.IsDying

function Colonist:IsWorking()
	return self.command == "WorkCycle"
end

function Colonist:IsInWorkCommand()
	return not self:IsDying() and (self.command == "Work" or self.command == "WorkCycle")
end

function Colonist:CanTrain()	
	return self:CanChangeCommand()
end

-- can be employed; colonists for which this returns false should quit their jobs
function Colonist:CanWork()
	local traits = self.traits
	local status_effects = self.status_effects
	return 	
		self:CanChangeCommand()
		and (not traits.Senior or g_SeniorsCanWork)
		and not traits.Child
		and not traits.Tourist
		and (traits.Fit or not (self.stat_health < g_Consts.LowStatLevel))
		and not status_effects.StatusEffect_Earthsick
		and not status_effects.StatusEffect_StressedOut
end

function Colonist:Work()
	local bld = self.workplace
	if self:EnterBuilding(bld) and bld == self.workplace then
		self:SetCommand("WorkCycle")
	end
	self:PlayState("idle", -1000)
end

local AmbientLifePlayChance = 100

function GetWorkPrg(bld)
	local chance = AmbientLifePlayChance
	if chance <= 0 or chance < 100 and bld:Random(100) >= chance then
		return
	end
	return PrgAmbientLife["Work"..bld.template_name] or PrgAmbientLife.WorkDefault
end

function GetVisitPrg(bld)
	local chance = AmbientLifePlayChance
	if chance <= 0 or chance < 100 and bld:Random(100) >= chance then
		return
	end
	return PrgAmbientLife["Visit"..bld.template_name] or PrgAmbientLife.VisitDefault
end

function Colonist:WorkCycle()
	local workplace = self.workplace
	if not IsValid(workplace) then
		return
	end
	workplace:StartWorkCycle(self)
	self:PushDestructor(function(self)
		if IsValid(workplace) then
			if self.traits.Idiot then
				if self:Random(100) < TraitPresets.Idiot.param then
					workplace:SetMalfunction()
				end
			end
			workplace:StopWorkCycle(self)
			self:ExitBuilding(workplace)
		end
	end)
	self:PlayPrg(GetWorkPrg(workplace), g_Consts.WorkingHours * const.HourDuration + self:Random(2*const.MinuteDuration), workplace)
	self:PopAndCallDestructor()
end

function Colonist:InterceptRogueMoveSleep(...)
	Unit.MoveSleep(self, ...)
	
	if not self.intercept_params then
		return
	end
	local drone = self.intercept_params.drone
	local dome = self.intercept_params.dome
	local dist = self.intercept_params.dist
	
	if not IsValid(drone) or drone:IsDead() or (dome and HexAxialDistance(drone, dome) > dist) then
		self:SetCommand("Idle")
	end
	
	if CanShootRogueDrone(self, drone, true) then
		if self:ShootDrone(drone) then
			self:SetCommand("Idle")
		end
	end
end

function Colonist:InterceptRogueDrone(drone, dome, dist, sent_by_station)
	local moving = false
	self:PushDestructor(function(self)
		if sent_by_station and dome and IsValid(drone) and drone.rogue_intercepted then
			drone.rogue_intercepted[dome] = nil
		end
		self.intercept_params = nil
		self:SetMoveAnim("moveWalk")
		self.MoveSleep = nil
	end)
	
	self.intercept_params = { drone = drone, dome = dome, dist = dist }
	self.MoveSleep = self.InterceptRogueMoveSleep
	self:SetMoveAnim("moveRun")
	
	if sent_by_station and dome then
		drone.rogue_intercepted = drone.rogue_intercepted or {}
		drone.rogue_intercepted[dome] = true
	end
	
	self:ExitHolder(drone)
	self:Goto(drone, 2*guim, 0)
	
	self:PopAndCallDestructor()
end

function Colonist:ShootDrone(drone)			
	self:Face(drone)
	self:SetAnim(1, "attackStart")
	Sleep(self:TimeToAnimEnd())
	self:SetAnim(1, "attackIdle")
	PlayFX("Shoot", "start", self, drone)
	Sleep(self:TimeToAnimEnd())
			
	local dead
	if not drone:IsDead() and self:Random(100) <= drone.rogue_shoot_chance then
		drone:SetCommand("Dead")
		PlayFX("GetShot", "start", drone)
		dead = true
	end
	
	self:SetAnim(1, "attackEnd")
	Sleep(self:TimeToAnimEnd())
	
	return dead
end

function Colonist:AttackedByDrone(drone)
	self:Face(drone:GetPos())
	-- todo: play anim
	self:SetCommand("Die", "rogue drone")
end

-----------------------Residence, Rest -----------------------
function Colonist:IsHomeless()
	return not self.residence
end

function Colonist:UpdateHomelessLabels()
	local home =  self.residence
	if IsValid(home) then
		self.city:RemoveFromLabel("Homeless", self)
		if self.dome then self.dome:RemoveFromLabel("Homeless",self) end
		self:Affect("StatusEffect_Homeless", false)
	elseif not self:IsDying() and not IsValid(self.reserved_residence) then
		self.city:AddToLabel("Homeless", self)
		if self.dome then self.dome:AddToLabel("Homeless", self) end
		self:Affect("StatusEffect_Homeless", "start")
	end	
end

function Colonist:SetResidence(home)
	home = IsValid(home) and home or false
	if self.residence == home then 
		return 
	end
	if self.residence then
		self.residence:RemoveResident(self)
	end
	if IsValid(home) then
		assert(not home.parent_dome or self.dome == home.parent_dome)
		home:AddResident(self)
	end	
	self.residence = home 
	self:UpdateHomelessLabels()
	RebuildInfopanel(self)
end

function Colonist:UpdateResidence()
	if not self:CanChangeCommand() then return end
	local home = self:CheckForcedResidence() or self.reserved_residence
	if not IsValid(home) or home.parent_dome ~= self.dome or not home.ui_working or not home:CanReserveResidence(self) then
		home = ChooseResidence(self)
	end
	self:SetResidence(home)
end
---------------------------------------------------

function Colonist:CheckForcedDome()
	if not self.user_forced_dome then return end
	local forced_dome, forced_time = table.unpack(self.user_forced_dome)
	if ValidateBuilding(forced_dome) and GameTime() - forced_time < g_Consts.ForcedByUserLockTimeout then
		return forced_dome
	end
	self.user_forced_dome = nil
end

function Colonist:CheckForcedResidence()
	if not self.user_forced_residence then return end
	local residence, time = table.unpack(self.user_forced_residence)
	if ValidateBuilding(residence) and GameTime() - time < g_Consts.ForcedByUserLockTimeout then
		local dome = self:CheckForcedDome() or self.dome
		if residence.parent_dome == dome then
			return residence
		end
	end
	if residence then
		residence:CancelResidenceReservation(self)
	end
	self.user_forced_residence = nil
end

function Colonist:CheckForcedWorkplace()
	if not self.user_forced_workplace then return end
	local workplace, shift, time = table.unpack(self.user_forced_workplace)
	if ValidateBuilding(workplace) and GameTime() - time < g_Consts.ForcedByUserLockTimeout then
		local dome = self:CheckForcedDome() or self.dome
		local service_dome = workplace:CheckServicedDome(dome)
		if AreDomesConnectedWithPassage(service_dome, dome) then
			return workplace, shift
		end
	end
	self.user_forced_workplace = nil
end

---------------------------------------------------

-- compatibility:
function Colonist:RemoveOutsideNeeds()
	self:SetOutsideEffects(false)
end
function Colonist:AddOutsideNeeds() --ie breathing n such
	self:SetOutsideEffects(true)
end

----

function Colonist:OnEnterDome(dome)
	Unit.OnEnterDome(self, dome)
	if not self.dome then
		self:SetDome(dome)
	end
end

function Colonist:SetOutsideVisuals(outside)
	if outside and self:GetEntity() ~= self.inner_entity
	or not outside and self:GetEntity() == self.inner_entity then
		return
	end
	local entity = outside and GetOutsideEntity(self.entity_gender, self.race, self.age_trait, self.traits) or self.inner_entity
	self:ChangeEntity(entity)
end

function Colonist:SetOutsideEffects(outside)
	outside = outside or false
	if outside == self.outside_start then
		return
	end
	if outside then
		self.outside_start = GameTime()
	else
		self.outside_start = false
		self.dome_enter_fails = nil
		self.failed_domes = nil
		self:Affect("StatusEffect_Suffocating_Outside", false)
	end
	self:CalcMoveAnim()
end

function Colonist:CalcMoveAnim()
	if self.outside_start then
		self:SetMoveAnim("movePlanet")
		return
	end
	local status_effects = self.status_effects
	for _,effect in ipairs(StatusEffectsList) do
		if status_effects[effect] then
			local class = _G[effect]
			if class and class.move_anim then
				self:SetMoveAnim(class.move_anim)
				return
			end
		end
	end
	self:SetMoveAnim("moveWalk")
end

function Colonist:ChooseEntity()
	local is_outside = self:GetEntity() ~= self.inner_entity
	local inner_entity, ip_icon, pin_icon = GetSpecialistEntity(self.specialist, self.entity_gender, self.race, self.age_trait, self.traits)
	self.inner_entity = inner_entity
	self.infopanel_icon = ip_icon
	self.pin_icon = pin_icon
	self.ip_specialization_icon,self.pin_specialization_icon = self:GetSpecializationIcons()

	if is_outside then
		self:ChangeEntity(GetOutsideEntity(self.entity_gender, self.race, self.age_trait, self.traits))
	else
		self:ChangeEntity(inner_entity)
	end
end

function Colonist:SetSpecialization(specialist, init)
	self.city:RemoveFromLabel(self.specialist, self)
	if not init then
		self:RemoveTrait(self.specialist)
	end
	self.specialist = specialist or "none"
	self:ChooseEntity()

	self.city:AddToLabel(self.specialist, self)
	if not init then
		self:AddTrait(self.specialist)
	end
	Msg("NewSpecialist")
end
-------------------------------------- Transport -----------------------------------------------

local function HasFreeWorkplacesAround(dome, colonist)
	for _, b in ipairs(dome.labels.Workplaces or empty_table) do
		if not b.destroyed and b.ui_working and b:CanWorkHere(colonist) and b:HasFreeWorkSlots() then
			return true
		end
	end
	for d in pairs(dome.connected_domes or empty_table) do
		for _, b in ipairs(d.labels.Workplaces or empty_table) do
			if not b.destroyed and b.ui_working and b:CanWorkHere(colonist) and b:HasFreeWorkSlots() then
				return true
			end
		end
	end
end

function Colonist:FindEmigrationDome()
	--check is forced by user to go to any dome
	local my_dome = self.dome
	local pos = self.current_dome or self:GetPos()
	local forced_dome = self:CheckForcedDome()
	if forced_dome then
		if forced_dome == my_dome then
			return
		end
		local is_walking, dist = IsInWalkingDistDome(forced_dome, pos)
		return forced_dome, is_walking, dist
	end
	local can_work = self:CanWork()
	--check if match filters to its dome or any other dome
	local traits = self.traits
	local is_child = traits.Child
	local eval = -1
	local choosen
	local workplaces
	if my_dome then
		if not my_dome.accept_colonists then
			-- quarantine, no one enters or leaves
			return
		end
		if not self:IsHomeless() and (my_dome.ui_working or GameTime() - my_dome.ui_working_changed < wait_dome_turned_off) then
			-- could stay only if not homeless and if the Dome is switched ON
			eval = TraitFilterColonist(my_dome.traits_filter, traits)
		end
		workplaces = can_work and HasFreeWorkplacesAround(my_dome, self)
	end
	local LR_transport_available = IsLRTransportAvailable(self.city)
	local is_unemployed = can_work and not IsValid(self.workplace) and not self.user_forced_workplace
	local is_walking, dist
	local domes = self.city.labels.Dome or false
	if not domes then
		return false
	end
	-- randomize starting dome to avoid moving all colonist to the first one that pass their criteria
	local count_domes = #domes
	local start_idx = self:Random(count_domes)
	for i = 1, count_domes do
		local idx = start_idx + i
		if idx>count_domes then 
			idx = idx - count_domes
		end	
		local dome = domes[idx]
		
		if my_dome ~= dome and not dome.destroyed and not dome.demolishing
			and dome.accept_colonists and not dome.overpopulated and dome.ui_working
			and dome:HasPower() and dome:HasWater() and dome:HasAir() 
		then
			-- dome to dome dist is cached, thus IsInWalkingDist is fast
			local new_is_walking, new_dist = IsInWalkingDistDome(dome, pos)
			if new_is_walking or LR_transport_available then
				local new_eval = TraitFilterColonist(dome.traits_filter, traits)
				if new_eval >= 0 and dome:HasFreeLivingSpace(is_child) then
					local new_workplaces = can_work and HasFreeWorkplacesAround(dome, self)
					if new_eval > eval -- the new dome is a better match for our traits
					or new_eval == eval and is_unemployed and not workplaces and new_workplaces then -- if unemployed, change dome if it has workplaces
						choosen = dome
						eval = new_eval
						is_walking = new_is_walking
						dist = new_dist
						workplaces = new_workplaces
					end
				end
			end
		end
	end
	return choosen, is_walking, dist
end

function Colonist:Goto(pos, ...)
	return Unit.Goto(self, pos, ...)
end

function Colonist:TransportByFoot(dest_dome)
	assert(IsInWalkingDist(self, dest_dome))
	
	local source_dome = self.dome
	self.emigration_dome = dest_dome
	--abandon old life
	self:SetDome(false)
	
	if not self:EnterBuilding(dest_dome) then
		local current_dome = self.current_dome
		if not current_dome then
			-- will be handled by the abandoned logic
			return
		end
		assert(current_dome ~= dest_dome, "Colonist failed to enter a dome while being in that dome!")
		assert(current_dome ~= source_dome, "Colonist failed to enter a dome without leaving its own dome!")
		dest_dome = current_dome
	end
	
	self:SetDome(dest_dome)
end

function IsTransportAvailableBetween(source_dome, dest_dome)
	if not IsValid(dest_dome) or not IsValid(source_dome) or dest_dome == source_dome then
		--invalid dest
		return false
	end
	return IsLRTransportAvailable(dest_dome.city)
end

function Colonist:IsTransported()
	local task = self.transport_task
	local shuttle = task and task.shuttle
	if IsValid(shuttle) and shuttle.transport_task == task and task.state == "transporting" then
		assert(self:GetParent() == shuttle)
		return true
	end
	assert(self:GetParent() ~= shuttle)
end

function Colonist:IsWaitingTransport(shuttle)
	if not self:CanChangeCommand() then
		return
	end
	local task = self.transport_task
	if not task or task.state ~= "ready_for_pickup" then
		return
	end
	if not task.shuttle and not IsLRTransportAvailable(self.city) then
		return
	end
	return true
end

local working_anims = { "idle" }

function Colonist:Transport(dest_dome)
	assert(dest_dome)
	local source_dome = self.dome
	self.emigration_dome = dest_dome
	self:PushDestructor(function(self)
		local transport_task = self.transport_task
		if transport_task then
			if self:IsTransported() then
				self:SetDome(false)
				while self:IsTransported() do
					--shuttle is still transporting, while we somehow exited the cmd
					WaitWakeup(999)
				end
			end
			local state = transport_task.state
			if state == "done"
			or state == "transporting" and IsInWalkingDist(self, dest_dome) then
				self:SetDome(dest_dome)
			else
				self:CancelResidenceReservation()
			end
			transport_task:Cleanup()
		end
		self.emigration_dome = false
	end)

	local pickup_pos = GetPassablePointNearby(self.transport_task.source_landing_site[1], self.pfclass)

	if not self:ExitHolder() or not pickup_pos or not self:Goto(pickup_pos) and not self:IsCloser2D(pickup_pos, 10*guim) then
		--failed to reach landing site
		self:PopAndCallDestructor()
		return
	end
	
	--reached landing site.
	self.transport_task.state = "ready_for_pickup"
	assert(not self.current_dome)
	
	if self.transport_task.shuttle then
		Wakeup(self.transport_task.shuttle.command_thread) --wake the shuttle if it's already waiting for us.
	end
	
	if not IsValid(self) or not IsLRTransportAvailable(self.city) then --no shuttles to exec request
		self:PopAndCallDestructor()
		return
	end

	--play anims while we wait.
	local count = #working_anims
	local idx = 0
	local max_wait = const.ColonistMaxWaitShuttlePickupTimeMs
	local start_wait_ts = GameTime()
	-- wait to be picked up
	while self:IsWaitingTransport() and GameTime() - start_wait_ts < max_wait do
		self:PlayState(working_anims[idx + 1])
		idx = (idx + 1) % count
	end
	self:PopAndCallDestructor()
end

function Colonist:ShowAttachedSigns(shown)
	self.status_effect_sign_visible = shown
	local visible = shown and g_SignsVisible
	self:ForEachAttach("UnitSign", CObject.SetVisible, visible)
end

function Colonist:OnSelected()
	local oldSign = self.status_effect_sign and g_Classes[self.status_effect_sign].sign
	if oldSign and (self:CountAttaches(oldSign) > 0) then
		self:DestroyAttaches(oldSign)
	end
	SelectionArrowAdd(self)
end

--duplicated with dronebase functionality
function Colonist:OnInteractionModeChanged(old, new)
	if old and not new then
		CloseAllDomes()
	elseif new and not old then
		OpenAllDomes()
	end
	self.interaction_mode = new
end

function Colonist:SetInteractionState(val)
	SetUnitControlInteractionMode(self, val)
	if val then
		SetUnitControlFocus(true, self)
	end
end

function Colonist:ToggleInteraction()
	if not self:CanChangeCommand() then 
		return 
	end
	if self.interaction_mode ~= "assign_to_bld" then
		self:SetInteractionState("assign_to_bld")
	else
		self:SetInteractionState(false)
	end
end

function Colonist:ToggleInteraction_Update(button)
	button:SetEnabled(self:CanChangeCommand())
	local to_mode = self.interaction_mode ~= "assign_to_bld"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/assign_residence.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetRolloverTitle(T{8758, "Assign to Building"})
	button:SetRolloverText(T{8759, "Assign this Colonist to a residence, workplace or training building. The Colonist will not change assignment for the next 5 Sols. If the target building is in another Dome located far away, a shuttle may be needed to reach it."})
	local shortcuts = GetShortcuts("actionAssignToBuilding")
	local hint = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		hint = T{10924, " / <em><ShortcutName('actionAssignToBuilding', 'keyboard')></em>"}
	end
	button:SetRolloverHint(to_mode and T{10925, "<left_click><hint> Select target mode", hint = hint} or T{7510, "<left_click> on target to select it  <right_click> Cancel"})
	button:SetRolloverHintGamepad(to_mode and T{7511, "<ButtonA> Select target mode"} or T{7512, "<ButtonA> Cancel"})
end

function Colonist:GetUIBirthplace()
	local nation = table.find_value(Nations, "value", self.birthplace)
	return nation and (nation.flag and "<image "..nation.flag.." 1400>" or nation.text) or ""
end

function Colonist:GetUIDeathReason()
	return DeathReasons[self.dying_reason]
end

function Colonist:GetUIInfo(remove_descr)
	local remove_descr = remove_descr or false
	local t = {
		T{4354, "Colonists are required to operate Dome buildings.<newline>"},
		T{4355, "Sols on Mars<right><sols>", self},
		T{4356, "Sex<right><Gender>", self},
		T{4357, "Birthplace<right><UIBirthplace>", self}
	}
	if remove_descr then
		table.remove(t, 1)
	end
	return table.concat(t, "<newline><left>")
end

function Colonist:UIStatUpdate(win, stat)
	local def = ColonistStat[stat]
	win:SetIcon(def.icon)
	if stat == "Morale" then
		local renegade = self.traits.Renegade
		win:SetTitle(renegade and T{4368, "Renegade"} or "")
		win.idBar:SetVisible(not renegade)
	end
	local v = self:GetProperty(stat)
	win.idBar:SetProgress(v)
	local low = g_Consts.LowStatLevel / const.Scale.Stat
	local high = g_Consts.HighStatLevel / const.Scale.Stat
	local image = "UI/Infopanel/progress_bar_green.tga"
	if v < low then
		image = "UI/Infopanel/progress_bar_red.tga"
	elseif v < high then
		image = "UI/Infopanel/progress_bar_orange.tga"
	end
	win.idBar:SetProgressImage(image)

	win.GetRolloverTitle = function(self)
		local obj = self.context
		if stat == "Morale" and obj.traits.Renegade then
			return T{4368, "Renegade"}
		end
		return T{4369, "<title> <GetProperty(stat)>", title = ColonistStat[stat].text, stat = stat, obj[1]}
	end
	win.GetRolloverText = function(self)
		local obj = self.context
		local def = ColonistStat[stat]
		local texts
		if stat == "Morale"  and obj.traits.Renegade then
			return T{7781, "Citizens with low morale may become Renegades. Their performance is decreased by 50 at all jobs and they can cause crime events when there are not enough Security Stations in the Dome."}
		elseif stat == "Morale" then
			-- mirror logic in UpdateMorale because Morale does not have a log
			local low = g_Consts.LowStatLevel / const.Scale.Stat
			local high = g_Consts.HighStatLevel / const.Scale.Stat
			for _, stat in ipairs(ColonistStatList) do 
				if stat ~= "Morale" then
					local value = obj:GetProperty(stat)
					if value < low or value >= high then
						texts = texts or {def.description, "", T{4370, "Effects:"}}
						local sign,clr, amount_text, reason_sign
						if value<low then
							sign =  Untranslated("-")
							clr =  TLookupTag("<red>")
							amount_text = Untranslated("-")..g_Consts.LowStatMoraleEffect/const.Scale.Stat
							reason_sign = "-"
						else
							sign =  Untranslated("+")
							clr =  TLookupTag("<green>")
							amount_text = Untranslated("+")..(g_Consts.HighStatMoraleEffect/const.Scale.Stat)
							reason_sign = "+"
						end
						texts[#texts + 1] = T{6936, "<clr><reason></color>", reason = T{ColonistStatReasons[reason_sign .. stat], amount = amount_text}, clr = clr}
					end
				end
			end
			if obj.dome and obj.dome:HasSpire() and obj.city:IsTechResearched("InspiringArchitecture") then	
				texts = texts or {def.description, "", T{4370, "Effects:"}}
				texts[#texts + 1] = T{4371, "<green>Spire in Dome: <spire_name></green>", spire_name = obj.dome.labels.Spire[1]:GetDisplayName()}
			end
			if IsKindOf(obj.workplace, "Workshop") and obj.fulfill_workshift_boost then	
				texts = texts or {def.description, "", T{4370, "Effects:"}}
				texts[#texts + 1] = T{8803, "<green>Works in: <WorkplaceDisplayName> <amount></green>",obj, amount = Untranslated("+")..(g_Consts.WorkInWorkshopMoraleBoost/const.Scale.Stat)}
			end
			local trait_defs = TraitPresets
			for _,mod in ipairs(obj.modifications and obj.modifications.base_morale or empty_table) do
				local id = mod.id
				if mod.display_text then
					texts = texts or {def.description, "", T{4370, "Effects:"}}
					texts[#texts + 1] = T{mod.display_text, amount = mod.amount/stat_scale}
				end
				local trait_def = trait_defs[id]
				if trait_def then
					texts = texts or {def.description, "", T{4370, "Effects:"}}
					local infopanel_text = trait_def.infopanel_effect_text
					local trait_text  = (infopanel_text == "") 
						  and T{4372, "Trait: <trait_name> <amount>", trait_name = trait_def.display_name,amount = mod.amount/stat_scale}
							 or T{infopanel_text, amount = mod.amount/stat_scale}										
					if mod.amount > 0 then
						texts[#texts + 1] = T{4373, "<green><trait_text></green>", trait_text = trait_text}
					else
						texts[#texts + 1] = T{4374, "<red><trait_text></red>", trait_text = trait_text}
					end
				end
				if IsKindOf(mod, "PropertyObect") and mod:HasMember("infopanel_text") or rawget(mod, "infopanel_text") then
					texts = texts or {def.description, "", T{4370, "Effects:"}}
					texts[#texts + 1] = mod.infopanel_text
				end
			end
		else
			local log = obj[def.log] or empty_table
			local time = obj.city.day - 3
			texts = texts or {def.description, ""}	
			if stat == "Comfort" then
				local interests = GetInterests(obj)
				local int_names = {} 
				for i=1, #interests do
					int_names[#int_names+1] = GetInterestDisplayName(interests[i])													
				end
				texts[#texts + 1] = T{4375, "Interests: <em><list></em><newline>", list = TList(int_names)}
			end
			local title = false
			for i = 1, #log, 3 do
				if log[i] > time then
					local logged_time = log[i]
					local sol = log[i]
					local amount, reason = log[i + 1], log[i + 2]
					if reason then
						local is_another_dome = false
						if not IsT(reason) and string.find(reason, g_DiffDomeStrId) then
							reason = string.gsub(reason, g_DiffDomeStrId, "")
							is_another_dome = true
						end
						local reason_sign = type(reason) == "string" and ((amount > 0 and "+" or "-") .. reason) or reason		
						local color = amount>0 and TLookupTag("<green>") or TLookupTag("<red>")
						local amount_text = amount>0 and Untranslated("+"..(amount/stat_scale)) or (amount/stat_scale)
						local building = ClassTemplates.Building[reason]
						local trait = TraitPresets[reason]
						local reason_text = 
							ColonistStatReasons[reason_sign] and T{4380, "Sol <sol>: <clr><reason></color>",clr = color, reason = T{ColonistStatReasons[reason_sign],amount = amount_text}, sol = sol}	
							or ColonistStatReasons[reason] and T{4380, "Sol <sol>: <clr><reason></color>", clr = color, reason = T{ColonistStatReasons[reason], amount = amount_text}, sol = sol}	
							or is_another_dome and building and T{8760, "Sol <sol>: <clr>Visited <display_name> in a different dome <amount></color>", amount = amount_text, clr = color, sol = sol, display_name = building.display_name}
							or not is_another_dome and building and T{4376, "Sol <sol>: <clr>Visited <display_name> <amount></color>", amount = amount_text, clr = color, sol = sol, display_name = building.display_name}
							or trait and T{4378, "Sol <sol>: <clr>Trait <display_name> <amount></color>", amount = amount_text, clr = color, sol = sol, display_name = trait.display_name}
							or  T{6937, "Sol <sol>: <clr><u(reason)><amount></color>", clr = color, reason = reason,amount = amount_text, sol = sol}																							
						if not title then 
							texts[#texts + 1] = T{4382, "Log of recent changes:"}
							title = true
						end	
						texts[#texts + 1] = reason_text
					end
				end
			end
		end
		return texts and table.concat(texts, "\n") or def.description
	end
end

function Colonist:GetUIWorkplaceLine()
	if self.workplace or self.last_workplace then
		return T{4362, "Workplace<right><h SelectWorkplace InfopanelSelect><WorkplaceDisplayName></h>" }
	elseif self.traits["Child"] then
		return T{4364, "Outside the workforce (Child)"}
	elseif self.traits["Senior"] and not g_SeniorsCanWork then
		return T{4365, "Outside the workforce (Senior)"}
	elseif not self:CanWork() then 
		return T{6935, "Not looking for a job"}
	else
		return T{4366, "Workplace<right>Unemployed"}
	end
end

function Colonist:GetUITraitsLine(separator)
	local texts
	for trait_id in sorted_pairs(self.traits) do
		local trait = TraitPresets[trait_id]
		if trait and trait.show_in_traits_ui then
			texts = texts or {}
			if trait.rare then
				texts[#texts + 1] = T{7550, "<em><trait></em>", trait = trait.display_name}
			else
				texts[#texts + 1] = trait.display_name
			end
		end
	end
	return texts and (separator and table.concat(texts, separator) or TList(texts)) or T{7552, "No traits"}
end

function Colonist:GetUITraitsList()
	return self:GetUITraitsLine("<newline>")
end

function Colonist:GetUIInterestsLine()
	local interests = GetInterests(self)
	local texts
	for _, interest in ipairs(interests) do
		texts = texts or {}
		texts[#texts + 1] = GetInterestDisplayName(interest)
	end
	return texts and TList(texts) or T{8935, "No interests"}
end

function Colonist:GetUITraitsRollover()
	local texts = {
		T{4383, "Traits are the individual characteristics of the Colonists."},
	}
	for trait_id in sorted_pairs(self.traits) do
		local trait = TraitPresets[trait_id]
		if trait and trait.show_in_traits_ui then
			texts[#texts + 1] = T{4384, "<newline><em><trait></em>: <descr>", trait = trait.display_name, descr = trait.description}
		end
	end
	return table.concat(texts, "<newline>")
end

function Colonist:CanReachBuilding(bld)
	local my_dome = self.dome
	local his_dome = bld.parent_dome
	his_dome = not his_dome and FindNearestObject(UICity.labels.Dome, self) or his_dome
	
	if my_dome ~= his_dome and not IsInWalkingDist(my_dome or self:GetPos(), his_dome) 
		and (not my_dome or not IsTransportAvailableBetween(my_dome, his_dome)) then
		return false
	end
	
	return true
end

function Colonist:SetForcedDome(dome)
	assert(self.dome ~= dome,"Move to same dome")
	self.user_forced_dome = {dome, GameTime()}
	self:InterruptCommand() -- will "TryToEmigrate" once in "Idle"
end

function Colonist:CanInteractWithObject(obj, mode)
	if mode == "assign_to_bld" or mode == false then
		if IsKindOf(obj, "Building") and ValidateBuilding(obj) then	
			local can, hint, go_to = obj:ColonistCanInteract(self)
			if IsKindOfClasses(obj, "TrainingBuilding", "Workplace", "Residence")
				and can and not IsInWalkingDist(obj, self:GetPos()) 
				then
				return can, hint.."\n"..T{9628, "<em>No Shuttle Available</em>"}, go_to 
			end
			return can, hint, go_to
		end
	end
	return false, false, true
end

function Colonist:InteractWithObject(obj, mode)
	local interacted
	if mode == "assign_to_bld" or mode == false then
		if IsKindOf(obj, "Building") and ValidateBuilding(obj) and obj:ColonistInteract(self) then
			interacted = true
		end
	end
	if interacted then
		self:SetInteractionState(false)
	end
end

function Colonist:CanBeControlled(mode)
	return mode ~= "move" and self:CanChangeCommand() and (MoveUnitsOnRightClick() or self.interaction_mode == "assign_to_bld")
end
-------------------------------------- UI -----------------------------------------------
function Colonist:GetSelectionArrow() 
	return self.status_effect_sign and 
			g_Classes[self.status_effect_sign].selection_arrow or 
			"SelectionArrow"
end

function Colonist:GetLogicalPos()  -- for hyperlinks
	if self.holder then
		return self.holder:GetPos()
	else
		return self:GetVisualPos()
	end
end

function Colonist:View()  -- for hyperlinks
	ViewObjectMars(self:GetLogicalPos())
end

function Colonist:Select(cycle_func)  -- for hyperlinks
	SelectObjWithCycle(self, cycle_func)
	ViewObjectMars(self:GetLogicalPos())
end

function Colonist:GetDefaultCycleFunc()
	return DomeCycle
end

function Colonist:SelectWorkplace()  -- for hyperlinks
	local bld = self.workplace or self.last_workplace
	if bld then bld:Select() end
end

function Colonist:SelectResidence()  -- for hyperlinks
	local bld = self.residence or self.last_residence
	if bld then bld:Select() end
end

function Colonist:SelectDome()  -- for hyperlinks
	local dome = self.dome
	if dome then dome:Select() end
end

function Colonist:SelectService()  -- for hyperlinks
	if self.assigned_to_service then self.assigned_to_service:Select() end
end

function Colonist:SelectEmigrationDome()  -- for hyperlinks
	if self.emigration_dome then self.emigration_dome:Select() end
end
function Colonist:GetWorkplaceDisplayName()  -- for hyperlinks
	local bld = self.workplace or self.last_workplace
	if bld then return bld:GetDisplayName() end
end

function Colonist:GetDomeDisplayName()  -- for hyperlinks
	local bld = self.dome
	if bld then return bld:GetDisplayName() end
	return T{6761, "None"}
end

function Colonist:GetResidenceDisplayName()  -- for hyperlinks
	local bld = self.residence or self.last_residence
	if bld then return bld:GetDisplayName() end
	return T{7553, "Homeless"}
end

function Colonist:GetServiceDisplayName()  -- for hyperlinks
	if self.assigned_to_service then return self.assigned_to_service:GetDisplayName() end
end

function Colonist:GetEmigrationDomeDisplayName()  -- for hyperlinks
	if self.emigration_dome then return self.emigration_dome:GetDisplayName() end
end

function Colonist:GetStatusEffects()
	if not self.status_effects or not next(self.status_effects) then 
		return
	end	
	local text = {}
	local effects = self.status_effects
	local sorted = table.keys(effects)
	table.sort(sorted, function(a, b) 
			local priority1 = g_Classes[a] and g_Classes[a].priority or -1
			local priority2 = g_Classes[b] and g_Classes[b].priority or -1
			return priority1>priority2 
		end)
	for i=1, #sorted do text[#text + 1] = g_Classes[sorted[i] ].display_name end
	return TList(text)
end

function Colonist:GetDescription()
	local description = self.traits and self.traits["Child"] and T{4314, "One of the youngest residents of the Colony"} 
		or GetSpecialization(self.specialist).description
		or T{3849, "A brave citizen of Mars, ready to tame the final frontier."}
	if self.dying then 
		return IsT(self.dying_reason) and T{self.dying_reason,self} 
		or (DeathReasons[self.dying_reason] and T{4315, "The last remains of <em><u(name)></em>. Deceased.", self}) 
		or description
	end	
	local issues = self:GetStatusEffects()
	return description ..
		T{4316, "<newline><nbsp><nbsp><em>Status:</em> <ui_command>"} ..
		(issues and T{4317, "<newline><nbsp><nbsp><em>Issues:</em> <issues>", issues = issues} or "")
end

function Colonist:GetPinDescription()
	local text = self:GetDescription()
	local traits = {}
	for id in pairs(self.traits) do
		local trait = TraitPresets[id]
		if trait and trait.show_in_traits_ui then
			traits[#traits+1] = trait.display_name
		end
	end
	local traits_text = next(traits) and T{7782, "<newline><nbsp><nbsp><em>Traits:</em> <traits_list>", traits_list = TList(traits)} or ""
	return text..traits_text
end

function Colonist:GetRenameInitText()
	return _InternalTranslate(Untranslated(self.name))
end

function Colonist:GetDisplayName()
	return Untranslated(self.name)
end

function Colonist:GetTitle()return self:GetDisplayName()end
function Colonist:GetInfopanelIcon()
	return self.infopanel_icon
end

function Colonist:GetSpecializationIcons()
	local spec
	local traits = self.traits or {}
	if traits.Child or traits.Android then
		return ""
	end
	spec = ColonistClasses[self.specialist or "none"]
	if spec == "" then
		spec = "Colonist"
	end
	return string.format("UI/Icons/Colonists/IP/IP_%s_%s.tga", spec, self.entity_gender),
			string.format("UI/Icons/Colonists/Pin/%s_%s.tga",spec, self.entity_gender)
end

function Colonist:GetPinIcon()
	return self.pin_icon
end

function Colonist:GetAge()
	local data = const.ColonistAgeGroups[self.age_trait]
	return data.display_name
end

function Colonist:GetSpecialization()
	return GetSpecialization(self.specialist).display_name
end

function Colonist:GetGender()
	return TraitPresets[self.gender] and TraitPresets[self.gender].display_name or T{77, "Unknown"}
end

local ColonistCommands = {
	Abandoned = T{4318, "Seeking a Dome"},
	Arrive = T{4319, "Just arrived"},
	Die = T{4320, "Deceased"},
	Embark = T{4321, "On an expedition"},
	Idle = T{6929, "Idle"},
	MysteryDream = T{6930, "Dreaming"},
	Rest = T{4323, "Resting in <h SelectResidence InfopanelSelect><ResidenceDisplayName></h>"},
	RestHomeless = T{4324, "Resting (homeless)"},
	Roam = T{4325, "Free"},
	VisitService = T{4326, "Visiting <h SelectService InfopanelSelect><ServiceDisplayName></h>"},
	VisitNoTarget = T{4327, "Free time - no available Service to visit"},
	Unknown = T{4328, "Unknown"},
	Work = T{4329, "Going to work"},
	WorkCycle = T{4330, "Working in <h SelectWorkplace InfopanelSelect><WorkplaceDisplayName></h>"},
	WorkUnemployed = T{4331, "Free - unemployed"},
	WorkStressed =  T{4332, "This Colonist is too Stressed out to work. Give them some time to recover"},
	Transport =  T{4333, "Moving to a new Dome: <h SelectEmigrationDome InfopanelSelect><EmigrationDomeDisplayName></h>"},
	TransportByFoot = T{4333, "Moving to a new Dome: <h SelectEmigrationDome InfopanelSelect><EmigrationDomeDisplayName></h>"},
	LeavingMars = T{4334, "Leaving the Colony"},
	
	GoingTo = T{4335, "Going to <h SelectWorkplace InfopanelSelect><WorkplaceDisplayName></h>"},
	StudyingIn = T{4336, "Studying in <h SelectWorkplace InfopanelSelect><WorkplaceDisplayName></h>"},
	TreatedIn = T{4337, "Treated in <h SelectWorkplace InfopanelSelect><WorkplaceDisplayName></h>"},
	SafeMode = T{4338, "Safe Mode"},
}

function Colonist:Getui_command()
	local tcommand = ColonistCommands[self.command]
	if self.dreaming then
		return ColonistCommands["MysteryDream"]
	elseif (self.command == "Transport" or self.command == "TransportByFoot") and self.emigration_dome then 	
		return tcommand
	elseif self:IsInWorkCommand() then
		if self.status_effects.StatusEffect_StressedOut then 
			return ColonistCommands["WorkStressed"]
		elseif not self.workplace then                      
			return ColonistCommands["WorkUnemployed"]
		elseif IsKindOf(self.workplace, "TrainingBuilding") then
			if self.command == "Work" then
				return ColonistCommands["GoingTo"]
			else--if self.command == "WorkCycle" then
				if IsKindOf(self.workplace, "Sanatorium") then
					return  ColonistCommands["TreatedIn"]
				else
					return ColonistCommands["StudyingIn"]
				end
			end
		else
			return tcommand 
		end
	elseif self.command == "Rest" then 
		return not self.residence and ColonistCommands["RestHomeless"] or tcommand 
	elseif self.command == "VisitService" then
		return not self.assigned_to_service and ColonistCommands["VisitNoTarget"] or tcommand
	else
		return tcommand or ColonistCommands["Unknown"]
	end
end

----
function GetRareTraitChance(unit)
	local city = unit and unit.city or UICity
	local rare_chance_mod
	
	if city and city:IsTechResearched("GeneSelection") then
		local def = TechDef.GeneSelection
		rare_chance_mod = def.param1
	end
	return rare_chance_mod
end	

function GenerateTraits(unit, newborn, max)
	local traits = unit and table.copy(unit.traits) or {}
	local new_traits = {}
	if not newborn then
		local traits_count = Random(1,max or g_Consts.MaxColonistTraitsToGenerate, "Trait")	
		local nonerare, rare = {},{}
		
		local rare_chance_mod = GetRareTraitChance(unit)
		for i=1,traits_count do
			-- rare and none rare are changed after execution
			local trait = GetRandomTrait(traits, nonerare, rare, nil, "base", rare_chance_mod)
			traits[trait] = true
			new_traits[trait] = true
		end
	end
	
	local sponsor_trait = GetMissionSponsor().trait
	if sponsor_trait ~= "" and not traits[sponsor_trait] then
		new_traits[sponsor_trait] = true
	end
	
	return new_traits
end

function GenerateColonistData(city, age_trait, martianborn, params)
	city = city or UICity
	-- birthplace and age	
	martianborn = martianborn or false
	local newborn = age_trait=="Child"	
	local birthplace, age 
	if newborn then
		birthplace = "Mars"
		age_trait = "Child"
		age = 0
	else	
		local sponsor_id = g_CurrentMissionParams.idMissionSponsor
		local sponsor_nations = GetSponsorNations(sponsor_id)
		birthplace = martianborn and "Mars" or GetWeightedRandNation(sponsor_nations) or "Mars"
		
		local trait_age_el = table.weighted_rand(const.ApplicantsWeights, function(el) return el[2] end)
		local start_age = age_trait
		age_trait = age_trait or trait_age_el and trait_age_el[1]or "Adult"		
		local data = const.ColonistAgeGroups[age_trait]
		local next_trait = data.next_agegroup
		if start_age then
			age = data.min
		else
			age = Random(data.min, next_trait and const.ColonistAgeGroups[next_trait].min-2 or Colonist.death_age-2, "age")	
		end
	end
	-- traits
	local traits =  params and params.no_traits and {} or GenerateTraits({city = city, traits = {Martianborn = (not not martianborn or newborn)}}, age_trait=="Child")
	traits[birthplace] = true
	traits["Martianborn"] = (not not martianborn or newborn) or nil
	traits[age_trait]  = true
	--gender	
	local rand
	local gender, entity_gender 
	if params then
		gender, entity_gender = params.gender, params.entity_gender 
	end	
	if not gender or not entity_gender then
		rand = Random(1, 100)
		if rand<=g_Consts.Other_gender_chance then
			gender = "OtherGender"
			entity_gender = Random(1, 100) <= 50 and "Male" or "Female"
		else
			gender = rand <= 50 and "Male" or "Female"
			entity_gender = gender
		end	
	end
	
	traits[gender]= true
	
	-- specialist
	local specialist = "none" 
	local generate_specialization = not newborn and (not params or not params.no_specialization)
	if generate_specialization then
		rand = Random(0, 100)
		local threshold = 0
		local multiplier = g_Consts.specialist_chance_mul
		
		for _, spec in ipairs(ColonistSpecializationList) do
			threshold = threshold + MulDivRound(g_Consts[spec.."_arrival_chance"], multiplier, 100)
			if rand < threshold then
				specialist = spec
				break
			end
		end	
	end
	traits[specialist] = true	
	

	local colonist  = {
		city = city,
		traits = traits, 
		gender = gender,
		entity_gender = entity_gender,
		specialist = specialist,
		age_trait = age_trait,
		age =  age,
		birthplace = birthplace,
		race = 1 + AsyncRand(5),
	}
	NameUnit(colonist)	
	return colonist
end
--[[
function Colonist:Getui_control_hint()
	return GetUnitControlInteractionHint(self, T{4339, "<UnitMoveControl()>: Move"} ,T{4340, "No available interaction"})
end
--]]
local hour_duration = const.HourDuration
local hours_per_day = const.HoursPerDay
local before_start_first_shift = (const.DefaultWorkshifts[1][1] + const.HoursPerDay - 1) % const.HoursPerDay

GlobalVar("g_MartianbornStrength", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "MartianbornStrength" then
		g_MartianbornStrength = true
	end
end

local unique_disaster_dust_storm_number = 4561
local unique_disaster_cold_wave_number = 7403

function Colonist:HourlyUpdate(t, hour)
	if hour == before_start_first_shift then
		self:DailyUpdate()
	end
	local status_effects = self.status_effects
	if next(status_effects) then
		-- highest-priority status effects tick last
		for i = #StatusEffectsList,1,-1 do
			local effect = StatusEffectsList[i]
			local start = status_effects[effect]
			if start then
				local class = _G[effect]
				if class then
					local h = (t - start) / hour_duration
					if h % hours_per_day == 0 then
						class:DailyUpdate(self, start, h)
					end
					class:HourlyUpdate(self, start, h)
				end
			end
		end
	end
	
	local traits = self.traits
	
	local coward_factor = traits.Coward and 2 or 1
	if not (g_MartianbornStrength and traits.Martianborn) then
		local decrease_percent = self.dome and self.dome:GetSecurityStationDamageDecrease() or 0
		
		if g_ColdWave then
			local damage = g_Consts.ColdWaveSanityDamage * coward_factor 
			damage = damage - MulDivRound(damage, decrease_percent, 100)
			
			local unique_seed = self.handle + unique_disaster_cold_wave_number --unique number per unit per disaster
			damage = MulDivRound(damage, 60 + BraidRandom(unique_seed, 100), 100)	

			self:ChangeSanity(-damage, decrease_percent>0 and "cold wave with securitystation" or "cold wave")
		end
		
		if g_DustStorm then
			local damage = g_Consts.DustStormSanityDamage * coward_factor 
			damage = damage - MulDivRound(damage, decrease_percent, 100)
			
			local unique_seed = self.handle + unique_disaster_dust_storm_number --unique number per unit per disaster
			damage = MulDivRound(damage, 60 + BraidRandom(unique_seed, 100), 100)	

			self:ChangeSanity(-damage, decrease_percent>0 and "dust storm with securitystation" or "dust storm")
		end
	end
	if g_MysteryDream and (traits.Dreamer or traits.DreamerPostMystery) then
		local damage = g_Consts.MysteryDreamSanityDamage * coward_factor
		self:ChangeSanity(-damage, "dream")			
	end
	
	if self.outside_start then
		if (t - self.outside_start) >= g_Consts.OxygenMaxOutsideTime  then
			self:Affect("StatusEffect_Suffocating_Outside", "start", nil, "force")
		end
	else
		local dome = self.dome
		if dome then
			dome:CheckConditions(self, t)
		end
	end
end

function Colonist:GetFoodConsumptionPerVisit()
	return g_Consts.eat_food_per_visit
end

function Colonist:GetEatPerVisit()
	local eat_per_visit = self:GetFoodConsumptionPerVisit()
	if self.traits.Glutton then
		eat_per_visit = 2 * eat_per_visit
	end
	if DayStart - self.last_meal > const.DayDuration then -- if we have not eaten for more than a day
		eat_per_visit = 2 * eat_per_visit
	end
	
	return eat_per_visit
end

function Colonist:Eat(max_amount)
	local eat_per_visit = self:GetEatPerVisit()
	if max_amount < eat_per_visit then
		return 0
	end
	
	self.last_meal = DayStart
	self:Affect("StatusEffect_Starving")
	return eat_per_visit
end

function Colonist:GetHealth()
	return self.stat_health / stat_scale
end

function Colonist:AddToLog(log, amount, reason)
	local sol = self.city.day
	for i = #log - 2, 1, -3 do
		local logsol = log[i]
		if sol>logsol then
			break
		end
		local logreason = log[i+2]
		if sol==logsol 
			and (IsT(reason) and IsT(logreason) and _InternalTranslate(reason)==_InternalTranslate(logreason) 
				  or type(reason)== "string" and type(logreason)=="string" and reason==logreason
				  )
		then
			log[i+1] = log[i+1] + amount
			return 
		end
	end
	
	local i = #log + 1
	log[i] = sol
	log[i+1] = amount or 0
	log[i+2] = reason or false
end

function Colonist:ChangeHealth(amount, reason)
	if amount == 0 then return end
	local min_stat = 0
	if IsGameRuleActive("IronColonists") then
		-- colonists can never lose health or sanity below 50
		min_stat = 50 * stat_scale
	end
	local old_value = self.stat_health
	local new_value = Clamp(old_value + amount, min_stat, max_stat)
	self.stat_health = new_value
	self:AddToLog(self.log_health, amount, reason)
	if new_value == 0 and not self:IsDying() then
		self:SetCommand("Die", reason)
	end
	self:UpdateMorale()
	if reason then
		self:UpdateEmploymentLabels()-- update unemployed stat
	end
end

function Colonist:GetSanity()
	return self.stat_sanity / stat_scale
end

function Colonist:ChangeSanity(amount, reason)
	if amount == 0 then return end
	local traits = self.traits
	if amount < 0 and traits.Composed then
		amount = amount / 2
	end
	local min_stat = 0
	if IsGameRuleActive("IronColonists") then
		-- colonists can never lose health or sanity below 50
		min_stat = 50 * stat_scale
	end
	local old_value = self.stat_sanity
	local new_value = Clamp(old_value + amount, min_stat, max_stat)
	self.stat_sanity = new_value
	self:AddToLog(self.log_sanity, amount, reason)
	self:UpdateMorale()
end

function Colonist:GetComfort()
	return self.stat_comfort / stat_scale
end

function Colonist:ChangeComfort(amount, reason)
	if amount == 0 then return end
	local old_value = self.stat_comfort
	local new_value = Clamp(old_value + amount, 0, max_stat)
	self.stat_comfort = new_value
	self:AddToLog(self.log_comfort, amount, reason)
	g_TotalColonistComfort = g_TotalColonistComfort - old_value/stat_scale + new_value/stat_scale
	self:UpdateMorale()
	if new_value == 0 then
		local traits = self.traits
		if not traits.Martianborn and not traits.Refugee
		and GetMissionSponsor().id ~= "IMM"
		and not IsGameRuleActive("IronColonists") then
			self:Affect("StatusEffect_Earthsick", "start")
			if HintsEnabled then
				HintTrigger("HintEarthsick")
			end
		end
	end
	if new_value >= g_Consts.HighStatLevel then
		if self.status_effects.StatusEffect_Earthsick then
			self:Affect("StatusEffect_Earthsick", false)
		end
	end
end

function Colonist:GetMorale()
	return Clamp(self.stat_morale, 0, max_stat) / stat_scale
end

function Colonist:OnModifiableValueChanged(prop)
	if prop == "base_morale" then
		self:UpdateMorale()
	end
end

GlobalVar("g_VocationOrientedSociety", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "Vocation-Oriented Society" then
		g_VocationOrientedSociety = TechDef[tech_id]
	end
end

function Colonist:IsMoraleMax()
	return self.stat_health >= max_stat and
		self.stat_sanity >= max_stat and
		self.stat_comfort >= max_stat and
		self.stat_morale >= max_stat
end

function Colonist:UpdateMorale()
	local new_value = self.base_morale
	local high_stat_threshold = g_Consts.HighStatLevel
	local low_stat_threshold = g_Consts.LowStatLevel
	local low_stat_morale_effect = g_Consts.LowStatMoraleEffect
	local high_stat_morale_effect = g_Consts.HighStatMoraleEffect
	if self.stat_health >= high_stat_threshold then 
		new_value = new_value + high_stat_morale_effect
	elseif self.stat_health < low_stat_threshold then 
		new_value = new_value - low_stat_morale_effect 
	end
	if self.stat_sanity >= high_stat_threshold then 
		new_value = new_value + high_stat_morale_effect 
	elseif self.stat_sanity < low_stat_threshold then 
		new_value = new_value - low_stat_morale_effect 
	end
	if self.stat_comfort >= high_stat_threshold then 
		new_value = new_value + high_stat_morale_effect
	elseif self.stat_comfort < low_stat_threshold then 
		new_value = new_value - low_stat_morale_effect 
	end
	
	if self.dome and self.dome:HasSpire() and self.city:IsTechResearched("InspiringArchitecture") then	
		new_value = new_value + TechDef.InspiringArchitecture.param1*const.Scale.Stat
	end
	
	if IsKindOf(self.workplace, "Workshop") and self.fulfill_workshift_boost then
		new_value = new_value + g_Consts.WorkInWorkshopMoraleBoost
	end
	
	self.stat_morale = new_value
	
	local performance = 50 + 100*Clamp(new_value, 0, max_stat)/max_stat

	if self.traits and self.traits.Enthusiast and new_value >= high_stat_threshold then
		performance = performance + TraitPresets.Enthusiast.param 
	elseif self.traits and self.traits.Melancholic and new_value < low_stat_threshold then
		performance = performance - TraitPresets.Melancholic.param
	end
	if new_value >= high_stat_threshold and
		self.stat_health >= high_stat_threshold and
		self.stat_sanity >= high_stat_threshold and
		self.stat_comfort >= high_stat_threshold then
		if g_VocationOrientedSociety then
			performance = performance + g_VocationOrientedSociety.param1
		end
	end
	self:SetBase("performance", performance)
	Msg("MoraleChanged", self)
end

local ChangeMembers = {
	Health = "ChangeHealth",
	Sanity = "ChangeSanity",
	Comfort = "ChangeComfort",
--	Morale = "ChangeMorale",   -- intentionally removed from this list, as it is meant to be changed via modifiers or in UpdateMorale only
}

local GetMembers = {
	Health = "stat_health",
	Sanity = "stat_sanity",
	Comfort = "stat_comfort",
	Morale = "stat_morale",
}

function Colonist:GetStat(stat)
	return self[GetMembers[stat]]
end

function Colonist:ChangeStat(stat, amount, reason, time)
	local name = ChangeMembers[stat]
	return self[name](self, amount, reason, time)
end

function TFormat.Stat(context_obj,value)
	return T{4341, "<value>", value = value/stat_scale}
end

function Colonist:LogStatClear(log, time)
	local count = #log
	assert(count % 3 == 0)
	for i=1,count,3 do
		if log[i] >= time then
			if i > 1 then
				table.move(log, i, count, 1)
				for j=count-i+2,count do
					log[j] = nil
				end
			end
			break
		end
	end
end

Colonist.HourUpdate = empty_func

function Colonist:MysteryDream()
	self:ExitBuilding()
	if not self.current_dome and not self:EnterBuilding(self.dome) then
		return
	end

	self:GoToRandomPosInDome(self.dome)

	self:PushDestructor(function(self)
		self.dreaming = true
		self:StartFX("MysteryDream")
		self:PlayState("sleepStart")
		self:PlayFXMoment("hit-moment")
		self:PlayState("sleepIdle", 1, const.eDontCrossfade)
		if g_MysteryDream then
			WaitMsg("MysteryDreamEnded")
			Sleep(self:Random(500))
		end
		self:StopFX()
		self:PlayState("sleepEnd")
		self.dreaming = false
	end)

	self:PopAndCallDestructor()
end

function SavegameFixups.FixForcedWorkplace()
	MapForEach("map", "Colonist", function(col)
		if col.user_forced_workplace then
			local wp = col.user_forced_workplace[1]
			if wp.specialist_enforce_mode then
				local wp_spec = wp.specialist or "none"
				if col.specialist or "none" ~= specialist then
					col.user_forced_workplace = false
				end
			end
		end
	end)
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "MysteryDream"
end

if Platform.developer then
	function AddColonistCallFreqStats()
		AddCallFreqStat(Colonist, "FindEmigrationDome")
		AddCallFreqStat(Colonist, "UpdateWorkplace")
		AddCallFreqStat(Colonist, "UpdateResidence")
	end
end