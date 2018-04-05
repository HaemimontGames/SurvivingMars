[*Back to Index*](index.md.html)
Colonists
==================
Overview
-------
The Colonists are tied with various [gameplay](LuaFunctionDoc_Gameplay.md.html) mechanics. They initially come to Mars with Passenger Rockets and occupy Domes, which provide them with basic protection and the most needed resources for survival. Colonists automatically occupy residences within their Dome and search for workplaces in their Dome's range. There are a number of buildings that cannot operate without Colonists.

Every Colonist is defined by his or her name, age category, workplace Specialization, Traits, and Stats. These properties influence the behavior of the Colonists and can be in turn influenced by different game events, buildings, technologies and player actions.

Age and Life Cycle
-------
There are five age groups in Surviving Mars: Child, Youth, Adult, Middle Aged and Senior.

    * Children cannot work, but can attend Schools and can use several service buildings. They gain their Traits when they move to the Youth age group, based on their School attendance and Playground visits.
    * The Youth, Adult and Middle Aged groups can work and are fertile - if their Comfort is high enough (see Stats), children will be born. Colonists from these three groups seek jobs in and around their Domes, according to their individual work Specialization, workplace availability and building priority (see Workplaces and Performance).
    * Senior Colonists cannot work and are not fertile, but still require sustenance and residential space.
~~~~
-- only while in the Youth age group, Colonists have the custom Trait "Inexperienced"
function OnMsg.ColonistAddTrait(colonist, trait_id)
	if trait_id=="Youth" then
		colonist:AddTrait("Inexperienced")
	elseif trait_id=="Adult" then
		colonist:RemoveTrait("Inexperienced")
	end
end
~~~~
Sex
: A Colonist can have one of three genders: Male, Female and Other. In order to have children in the colony, a fertile Male-Female couple with high Comfort has to be present. Colonists of the Other sex are not fertile.

Death
: Death can occur as a natural cause of old age or be a result of low Health, caused by lack of vital resorces (Food, Oxygen, Water). Colonists whose Sanity reaches 0 may even commit suicide (see Stats).
~~~~
-- 50% chance to commit suicide when Sanity is below 10 
function OnMsg.NewDay(day)
	for _, colonist in ipairs(UICity.labels.Colonist) do			
		if IsValid(colonist) and 
			not colonist:IsDying() and 
			colonist.stat_sanity < 10*const.Scale.Stat and
			colonist:Random(100) < 50 
		then 
			colonist:SetCommand("Suicide")
		end
	end
end

-- Colonists with the Fit Trait live 5 Sols longer than they normally should 
function OnMsg.ColonistAddTrait(colonist, trait_id)
	if trait_id=="Fit" then
		colonist:SetModifier("death_age","FitTrait", 5)
	end
end

function OnMsg.ColonistRemoveTrait(colonist, trait_id)
	if trait_id=="Fit" then
		colonist:SetModifier("death_age","FitTrait",0,0)
	end
end
~~~~
Traits
-------
Traits are the Colonists' personal skills that describe specific parts of their behaviour or abilities. Each Colonist has multiple Traits that differentiate their individuallity and make them unique. Detailed modding information about the Traits can be found [here](ModItemTrait.md.html).

Stats
-------
Each Colonist has four Stats: Health, Sanity, Comfort and Morale. These Stats have a value between 0 and 100 and are modified by various factors and events (Traits, quality of life, workplace, disasters, etc.).

    * Health represents physical fitness. It is lowered by working on a heavy workload (see Workplaces and Performance), having no functional home (see Residences), shock when deprived from vital resources or when the Colonist is injured. Colonists can be healed in medical buildings in a powered Dome, but only if they are provided with Food, Water and Oxygen. Colonists can't work at low Health unless they have the Fit Trait.
    * Sanity represents mental wellbeing. It is lowered by working on a heavy workload, in outside buildings and during dark hours, witnessing the death of another Colonist living in the same residence or various Martian disasters. It is recovered when resting at home and by visiting certain service buildings. Low Sanity may result in psychotic breakdowns, gaining negative Traits (Flaws) and even suicide.
~~~~
-- kill Colonists below 20 Heath when the Dome is hit by meteorite
function OnMsg.DomeHitByMeteor(dome, meteor)
	for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
		if colonist.stat_health<20*const.Scale.Stat then
			colonist:SetCommand("Die", "meteor")
		end
	end
end
~~~~
    * Comfort represents the quality of the Colonist's life on Mars. Visited buildings improve Comfort up to their Service Comfort value, but Colonists will try to visit only buildings that correspond to their Interests (see [Traits](ModItemTrait.md.html)). Colonists are more inclined to have children at higher Comfort. Earthborn Colonists whose Comfort is depleted quit their job and will leave the planet at first opportunity (see Issues and special statuses).
~~~~
-- homeless Colonists have decreased Comfort 
function OnMsg.ColonistStatusEffect(colonist, status_effect, bApply, now)
	if status_effect =="StatusEffect_Homeless" then
		if bApply then
			colonist:ChangeComfort(-30*const.Scale.Stat, "homeless")
		end
	end
end

-- unemployed Colonists have increased Comfort
function OnMsg.ColonistStatusEffect(colonist, status_effect, bApply, now)
	if status_effect =="StatusEffect_Unemployed" then
		if bApply then
			colonist:ChangeComfort(30*const.Scale.Stat, "unemployed")
		end
	end
end
~~~~
    * Morale represents happiness, optimism and loyalty.  It is influenced by the other three Stats and influences the Colonist's Performance (see Workplaces and Performance). Colonists with low Morale may become Renegades (see Issues and Special Statuses).
~~~~
-- increase the Morale of all Colonists for 3 Sols when a Technology is researched
function OnMsg.TechResearched(tech_id, city)
	local morale = 25*const.Scale.Stat
	local name = "increase_morale_for_each_tech"
	local def = TechDef[tech_id]
	local mod_id = name..tech_id
	local display_text = T{"<green><tech_name> researched! +<amount> </green>",tech_name = def.display_name}
	local colonists = {}
	for _, colonist in ipairs(city.labels.Colonist or empty_table) do
		colonist:SetModifier("base_morale", mod_id, morale, 0, display_text)
		colonists[#colonists+1] = colonist
	end
	CreateGameTimeThread( function()
		Sleep(3*const.DayDuration)
		for _, colonist in ipairs(colonists) do
			if IsValid(colonist) then
				colonist:SetModifier("base_morale", mod_id, 0, 0)
			end
		end
	end )
end

-- increase the Morale of all Colonists when a Rocket from Earth lands on Mars
function OnMsg.RocketLanded(rocket)
	local morale = 15*const.Scale.Stat
	local mod_id = "get_letter_from_earth"..rocket.name
	local display_text = T{"<green>Letter form Earth! +<amount> </green>"}
	local colonists = {}
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		colonist:SetModifier("base_morale", mod_id, morale, 0, display_text)
		colonists[#colonists+1] = colonist
	end
	CreateGameTimeThread( function()
		Sleep(3*const.DayDuration)
		for _, colonist in ipairs(colonists) do
			if IsValid(colonist) then
				colonist:SetModifier("base_morale", mod_id, 0, 0)
			end
		end
	end )
end
~~~~
Statuses and Issues
-------
Aside from the Traits and Stats, the infopanel of a colonist also gives information about their current status and any issues.

The status represents the activity that the colonist is currently engaged in - idle, working, resting, etc.

The issues indicate, for example, the lack of a Residence or workplace and point out serious problems like suffocation due to lack of Oxygen. A notable example is the Earthsick issue - Colonists with very low Comfort will get Earthsick, stop working and travel back to Earth at first opportunity.
~~~~
-- Earthsick Colonists take 2 Sanity damage each Sol
function OnMsg.NewDay(day)
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		if colonist.status_effects and colonist.status_effects.StatusEffect_Earthsick then
			colonist:ChangeSanity(2*const.Scale.Stat)
		end
	end
end

-- add custom issue "Disillusioned" when there are 3 or more Renegades in the Dome;
-- Disillusioned colonists have decreased Performance
DefineClass.StatusEffect_Disillusioned =  {
	__parents = { "StatusEffect"},
	display_name = T{"Disillusioned"},
	description = T{"Disillusioned colonists have decreased performance"},
	sign = "UnitSignHomeless",
	selection_arrow = "UnitArrowHomeless",
	priority = 5,
}

function StatusEffect_Disillusioned:Start(unit, start)
	unit:SetModifier("performance", "StatusEffect_Disillusioned", -10)
end

function StatusEffect_Disillusioned:Stop(unit)
	unit:SetModifier("performance", "StatusEffect_Disillusioned", 0, 0)
end

function OnMsg.NewDay(day)
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		local renegades  = #(dome.labels.Renegade or empty_table )		
		if renegades>=3 then
			for _, colonist in ipairs(dome.labels.Colonist) do
				colonist:Affect("StatusEffect_Disillusioned","start")
			end
		else
			for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
				colonist:Affect("StatusEffect_Disillusioned",false)
			end
		end	
	end
end
~~~~

Residences
-------
Residential buildings provide living space for a set number of Colonists along with Comfort for those Colonists when they're resting. Homeless colonists will automatically search for vacant residence within their Dome or within other Domes if none is available nearby. The player can also manually set residence for a Colonist through their infopanel.

The Nursery is a special residential building that houses only Colonists of the Child age group.
~~~~
-- when personal Comfort is below 50, look for a Residence with higher Comfort than the currently occupied
function OnMsg.NewDay(day)
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		if colonist.stat_comfort<50*const.Scale.Stat then
			local home = colonist.residence
			local current_residence_comfort = home and home.service_comfort or 0
			for _, residence in ipairs(colonist.dome.labels.Residence or empty_table) do
				if IsValid(residence) and residence.service_comfort>current_residence_comfort and residence:GetFreeSpace()>0 then
					colonist:SetResidence(residence)
					break
				end
			end
		end		
	end
end
~~~~
Workplaces and Performance
-------
Colonists of the age groups that can work choose a workplace within their Dome and its outside range, according to their work Specialization, workplace availability and building priority. Unemployed colonists will automatically search for vacant workslots and might move to another Dome if none are available in their own. The player can also manually set workplace for a Colonist through their infopanel.
~~~~
-- quit job if Health is below 50
function OnMsg.NewDay(day)
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		if colonist.stat_health<50*const.Scale.Stat and colonist.workplace then
			colonist:GetFired()
		end
	end	
end

~~~~
Performance
: Each Colonist has an individual Performance value that determines how well they'll be doing at their job or how fast they'll complete their training at a School, University or Sanatorium. Performance is modified by the Colonist's Traits, current Stats and workplace and may vary greatly.
~~~~
-- Colonists in the Adult age group have increased base Performance
function OnMsg.ColonistAddTrait(colonist, trait_id)
	if trait_id=="Adult" then
		colonist:SetModifier("performence", "adult performance boost", 30,0)
	end
end

function OnMsg.ColonistRemoveTrait(colonist, trait_id)
	if trait_id=="Adult" then
		colonist:SetModifier("performence", "adult performance boost", 0,0)
	end
end
~~~~
Specializations
: Specialized colonists prefer to work in buildings requiring their Specialization and have better Performance at such workplaces. Martianborn Colonists are born with no Specialization and can learn one in a University building.
~~~~
-- chance for workers with wrong Specialization to cause a malfunction at their workplace
function OnMsg.NewWorkshift(workshift)
	for _, workplace in ipairs(UICity.labels.Workplace or empty_table) do
		for _, worker in ipairs(workplace.workers[workshift] or empty_table) do
			if worker.specialist~= workplace.specialist and worker:Random(100) < 30 then
				workplace:SetMalfunction()
				break
			end
		end
	end
end
~~~~
Heavy workload, night shifts and working outside
: The heavy workload option can be turned on and off for each shift in a building staffed by Colonists. Working on a heavy workload, as well as outside the Dome and during the dark hours, have negative effects on most Colonists.
~~~~
-- lower performance when working during night shifts
function OnMsg.NewWorkshift(workshift)
	local night_shift = IsDarkHour(UICity.hour)
	for _, workplace in ipairs(UICity.labels.Workplace or empty_table) do
		for _, worker in ipairs(workplace.workers[workshift] or empty_table) do
			worker:SetModifier("performance", "working during night", night_shift and -10 or 0)
		end
	end
end

function OnMsg.ColonistStatusEffect(colonist, status_effect, bApply, now)
	 if status_effect =="StatusEffect_Unemployed" and bApply then
		colonist:SetModifier("performance", "working during night", 0)
	 end
 end

~~~~

Research
-------
Thechnologies and Breakthroughs can greatly influence the colony and its Colonists. From techs and building upgrades that have a direct effect over Stats and Performance to Breakthroughs that fundamentally change the basics of Colonist behavior. Here are some notable examples:

    * Training research - there are several Training techs that increase the Performance of specific Specializations.
    * Martianborn research - there are several Martianborn techs that influence only Colonists born on Mars, for example cancelling the negative Sanity effects that they get from disasters.
    * Rapid Sleep - Colonists need to sleep for only 1 hour and regain extra Sanity when sleeping.
    * Forever Young - Senior Colonists can work and have children.
    * The Positronic Brain - allows the construction of Biorobots in the Drone Assembler building; Biorobots eat Food and can gain Traits but can't reproduce and never die from old age.
    * Cloning - unlocks the Cloning Vats Spire building which creates Clones over time; cloned Colonists grow up and age twice as fast.
    * Project Phoenix - when a Colonist dies there's a chance that they are reconstructed as Youth with the same Traits.
    * Soylent Green - Bodies of dead Colonists are converted to Food.

More information about the Research can be found [here](Research.md.html).



(insert footer.md.html here)
<!-- Markdeep: --><style class="fallback">body{visibility:hidden;white-space:pre;font-family:monospace}</style>
<script src="markdeep.min.js"></script>
<script src="https://casual-effects.com/markdeep/latest/markdeep.min.js"></script>
<script>window.alreadyProcessedMarkdeep||(document.body.style.visibility="visible")</script>
