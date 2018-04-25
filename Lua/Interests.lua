
ServiceInterestsList = {
	"interestSocial",
	"interestRelaxation",
	"interestExercise",
	"interestGaming",
	"interestShopping",
	"interestLuxury",
	"interestDrinking",
	"interestGambling",
	"interestPlaying",
	"interestDining",
	"needFood",
	"needMedical",
}

BaseInterests = {
	"interestSocial",
	"interestRelaxation",
	"interestShopping",
}

Interests = {
	interestSocial = {
		display_name = T{1012, "Social"},
	},
	interestRelaxation = {
		display_name = T{1013, "Relaxation"},
	},
	interestExercise = {
		display_name = T{1014, "Exercise"},
	},
	interestGaming = {
		display_name = T{1015, "Gaming"},
	},
	interestShopping = {
		display_name = T{1016, "Shopping"},
	},
	interestLuxury = {
		display_name = T{1017, "Luxury"},
	},
	interestDrinking = {
		display_name = T{1018, "Drinking"},
	},
	interestGambling = {
		display_name = T{1019, "Gambling"},
	},
	interestPlaying = {
		display_name = T{1020, "Playing"},
	},
	interestDining = {
		display_name = T{1021, "Dining"},
	},
	needFood = {
		display_name = T{1022, "Food"},
	},
	needMedical = {
		display_name = T{1023, "Medical Checks"},
	},
}

InterestFailMessages = {
	[1] = T{1024, "<red>No available service building (<interest>) </red>"},
	[2] = T{1025, "<red>Service building was closed (<interest>) </red>"},
	[3] = T{1026, "<red>Service building was full (<interest>) </red>"},
	[4] = T{1027, "<red>Could not get service (<interest>) </red>"},
}

function GetInterestFailMessage(interest, level)
	interest = Interests[interest]
	return interest and T{InterestFailMessages[level], interest = interest.display_name}
end

function GetInterestDisplayName(interest)
	interest = Interests[interest]
	return interest and interest.display_name or nil
end

local table = table
function GetInterests(unit)
	local unit_traits = unit.traits
	local interests = unit_traits.Child and {} or table.copy(BaseInterests)
	local traits = DataInstances.Trait
	
	for _, trait_def in ipairs(traits) do
		local trait = trait_def.name
		if unit_traits[trait] then
			local add = trait_def.add_interest
			if add ~= "" and not table.find(interests, add) then
				interests[#interests + 1] = add
			end
		end
	end
	
	for _, trait_def in ipairs(traits) do
		local trait = trait_def.name
		if unit_traits[trait] then
			local remove = trait_def.remove_interest
			if remove ~= "" then
				table.remove_entry(interests, remove)
			end
		end
	end
	
	return interests
end

function PickInterest(unit)
	return table.rand(GetInterests(unit))
end

function OnMsg.GatherLabels(labels)
	for _, interest in ipairs(ServiceInterestsList) do
		labels[interest] = true
	end
end

ColonistStatReasons = 
{
	-- ChangeHealth reasons
	["dust_devil"]               = T{1028, "<red>Damage from a Dust Devil <amount></red>"},
	["meteor_colonist"]          = T{7536, "<red>Injured by a meteor <amount></red>"},
	["StatusEffect_Suffocating"] = T{1029, "<red>Suffocating <amount></red>"},
	["StatusEffect_Suffocating_Outside"] = T{1029, "<red>Suffocating <amount></red>"},
	["StatusEffect_Dehydrated"]  = T{1030, "<red>Dehydrated <amount></red>"},
	["StatusEffect_Freezing"]    = T{1031, "<red>Freezing <amount></red>"},
	["StatusEffect_Starving"]    = T{1032, "<red>Starving <amount></red>"},
	["overtime"]                 = T{1033, "<red>Heavy Workload <amount></red>"},
	["Irradiated"]               = T{1034, "<red>Irradiated <amount></red>"},
	["rest"]                     = T{1035, "<green>Well rested <amount></green>"},
	["ChronicCondition"]         = T{1036, "<red>Chronic Condition <amount></red>"}, -- ChronicCondition trait effect
	
	-- ChangeSanity reasons
	["geyser"]                = T{1037, "<red>Damage from a CO2 eruption <amount></red>"},
	-- ["overtime"] - same as health
	["dead colonist"]         = T{1038, "<red>Mourning the death of another Colonist <amount></red>"},
	["survived outside"]      = T{1039, "<green>Survived alone outside the Dome <amount></green>"},
	["StatusEffect_StressedOut"] = T{1040, "<green>Regained composure after Sanity breakdown <amount></green>"},
	["insane"] 						= T{7368, "Rebooting in safe mode <amount>"},
	-- ["rest"] - same as health
	["dome"]                  = T{1041, "<green>Dome, sweet Dome <amount></green>"},
	["psychologist"]          = T{7848, "<green>Psychoanalyzed <amount></green>"},
	["cold wave"]             = T{1042, "<red>It's too cold <amount></red>"},
	["dust storm"]            = T{1043, "<red>A Dust Storm is raging <amount></red>"},
	["meteor"]                = T{6775, "<red>My Dome was hit by a meteor <amount></red>"},
	["dream"]                 = T{1044, "<red>Experiencing vivid hallucinations <amount></red>"},
	["cold wave with securitystation"] = T{6776, "<red>Cold wave, don't panic! <amount> (Security Station)</red>"},
	["dust storm with securitystation"]= T{6777, "<red>Dust storm, don't panic! <amount> (Security Station)</red>"},
	["meteor with securitystation"] = T{6778, "<red>Meteor strike, don't panic! <amount> (Security Station)</red>"},
	["work in dark hours"]    = T{1045, "<red>Working during the dark hours <amount></red>"},
	["Whiner"]                = T{1046, "<red>My Comfort is too low <amount> (Whiner)</red>"}, -- Whiner trait effect
	["Gambler"]               = T{1047, "<red>Ran out of luck in the Casino <amount> (Gambler)</red>"}, -- Gambler effect
	["Hypochondriac"]         = T{1048, "<red>Couldn't visit a medical facility <amount> (Hypochondriac)</red>"}, -- Hypochondriac effect
	["outside workplace"]     = T{1049, "<red>Worked outside the Dome <amount></red>"},
	["Gamer"]                 = T{1050, "<green>Game on! <amount> (Gamer)</green>"},
	-- ChangeComfort reasons
	["raw food"]        	  = T{1051, "<red>Had an unprepared meal <amount></red>"},
	["work in workshop"]      = T{8779, "<green>Worked in a Workshop <amount></green>"},
	["no home"]               = T{1052, "<red>No functional Residence <amount></red>"},
	["malfunctioned Dome rest"]= T{8655, "<red>My Dome has malfunctioned <amount></red>"},
	["-rest"]                 = T{1053, "<red>Wants a higher Comfort Residence <amount></red>"},
	["overcrowded"]           = T{1054, "<red>Overcrowded Dome <amount></red>"},
	["Loner"]                 = T{1055, "<red>My Dome feels overcrowded <amount> (Loner)</red>"},
	["party animal"]          = T{1056, "<green>Everybody party! <amount> (Party animal)</green>"},
	-- ChangeMorale reasons
	["-Health"]               = T{1057, "Struggling to survive <amount> (Health)"},
	["+Health"]               = T{1058, "As healthy as a bull <amount> (Health)"},
	["-Sanity"]               = T{1059, "Severely stressed <amount> (Sanity)"},
	["+Sanity"]               = T{1060, "One with the universe <amount> (Sanity)"},
	["-Comfort"]              = T{1061, "I can't live like this <amount> (Comfort)"},
	["+Comfort"]              = T{1062, "Living in luxury <amount> (Comfort)"},
	["Saint"]                 = T{1063, "A Saint in our Dome <amount>"}, -- Saint effect
	
	["hive mind"]				 = T{7369, "One with the collective <amount>"},
}
