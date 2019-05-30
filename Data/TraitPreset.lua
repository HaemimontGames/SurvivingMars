-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('TraitPreset', {
	SortKey = 100000,
	add_interest = "interestPlaying",
	auto = false,
	description = T(6687, --[[TraitPreset Child description]] "Children are too young to work and use many of the buildings in the Colony. They can go to School and use certain special buildings such as the Playground and Nursery."),
	display_name = T(4775, --[[TraitPreset Child display_name]] "Child"),
	group = "Age Group",
	id = "Child",
	incompatible = {},
	initial_filter = true,
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 100100,
	apply_func = function (colonist, trait, init)
if not init then -- if is from aplicants or is spawn as youth his traits are already generated and will be applied
	local max = g_Consts.MaxColonistTraitsToGenerate
	if colonist.playground_visit and colonist:Random(100)<=g_Consts.positive_playground_chance then
		local new_trait = GetRandomTrait(colonist.traits, {}, {}, "Positive", "base",GetRareTraitChance(colonist))
		colonist:AddTrait(new_trait,init)
		max = max - 1
		colonist.playground_visit = nil
	end
	colonist:ApplyTraits(GenerateTraits(colonist, false, max))
	colonist:ChooseEntity()
end

if IsKindOf(colonist.workplace, "School") then
	colonist.workplace:FireWorker(colonist)
end
if IsKindOf(colonist.residence, "Nursery") then
	colonist.lock_residence = nil
	colonist:SetResidence(false)
	colonist:UpdateResidence()
end
colonist:UpdateHomelessLabels()
colonist:UpdateEmploymentLabels()
end,
	auto = false,
	description = T(6688, --[[TraitPreset Youth description]] "A young Colonist, able to work in all buildings."),
	display_name = T(4777, --[[TraitPreset Youth display_name]] "Youth"),
	group = "Age Group",
	id = "Youth",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 100200,
	auto = false,
	description = T(6689, --[[TraitPreset Adult description]] "An adult Colonist, able to work in all buildings."),
	display_name = T(4779, --[[TraitPreset Adult display_name]] "Adult"),
	group = "Age Group",
	id = "Adult",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 100300,
	auto = false,
	description = T(6690, --[[TraitPreset Middle Aged description]] "A middle aged Colonist, approaching retirement, but still able to work in all buildings."),
	display_name = T(4781, --[[TraitPreset Middle Aged display_name]] "Middle Aged"),
	group = "Age Group",
	id = "Middle Aged",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 100400,
	apply_func = function (colonist, trait, init)
colonist:ChooseEntity()
if not g_SeniorsCanWork then
	colonist:SetWorkplace(false)
end	
end,
	auto = false,
	description = T(6691, --[[TraitPreset Senior description]] "A senior Colonist, too old to work."),
	display_name = T(4783, --[[TraitPreset Senior display_name]] "Senior"),
	group = "Age Group",
	id = "Senior",
	incompatible = {},
	initial_filter = true,
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6676, --[[TraitPreset Female description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."),
	display_name = T(6675, --[[TraitPreset Female display_name]] "Female"),
	group = "Gender",
	id = "Female",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6674, --[[TraitPreset Male description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."),
	display_name = T(6673, --[[TraitPreset Male display_name]] "Male"),
	group = "Gender",
	id = "Male",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6678, --[[TraitPreset OtherGender description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."),
	display_name = T(6677, --[[TraitPreset OtherGender display_name]] "Other Sex"),
	group = "Gender",
	id = "OtherGender",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	add_interest = "interestDrinking",
	description = T(6655, --[[TraitPreset Alcoholic description]] "Work performance lowered by 10. Can be caused by Sanity breakdowns. +Drinking"),
	display_name = T(6654, --[[TraitPreset Alcoholic display_name]] "Alcoholic"),
	group = "Negative",
	id = "Alcoholic",
	incompatible = {},
	modify_amount = -10,
	modify_property = "performance",
	modify_target = "self",
})

PlaceObj('TraitPreset', {
	daily_update_func = function (colonist, trait)
colonist:ChangeHealth(-trait.param*const.Scale.Stat, trait.id)
end,
	description = T(6637, --[[TraitPreset ChronicCondition description]] "Loses Health each day."),
	display_name = T(6636, --[[TraitPreset ChronicCondition display_name]] "Chronic Condition"),
	group = "Negative",
	id = "ChronicCondition",
	incompatible = {
		Immortal = true,
	},
	initial_filter = true,
	param = 8,
})

PlaceObj('TraitPreset', {
	_incompatible = "Composed",
	description = T(6713, --[[TraitPreset Coward description]] "Double Sanity loss from disasters. Can be caused by Sanity breakdowns."),
	display_name = T(6712, --[[TraitPreset Coward display_name]] "Coward"),
	group = "Negative",
	id = "Coward",
	incompatible = {
		Composed = true,
	},
	initial_filter = true,
})

PlaceObj('TraitPreset', {
	auto = false,
	daily_update_func = function (colonist, trait)
if g_DustStormStart then
	local change= 5 + colonist:Random(trait.param)
	colonist:ChangeHealth(-trait.param*const.Scale.Stat, trait.id)
end
end,
	description = T(915592309937, --[[TraitPreset DustSickness description]] "Loses health during Dust Storms, even when inside a Dome."),
	display_name = T(890233389906, --[[TraitPreset DustSickness display_name]] "Dust Sickness"),
	dome_filter_only = true,
	group = "Negative",
	hidden_on_start = true,
	id = "DustSickness",
	incompatible = {},
	param = 10,
})

PlaceObj('TraitPreset', {
	add_interest = "interestGambling",
	description = T(6657, --[[TraitPreset Gambler description]] "Has a 50% chance to lose 20 Sanity when visiting a Casino. Can be caused by Sanity breakdowns. +Gambling"),
	display_name = T(6656, --[[TraitPreset Gambler display_name]] "Gambler"),
	group = "Negative",
	id = "Gambler",
	incompatible = {},
	param = 20,
})

PlaceObj('TraitPreset', {
	add_interest = "interestDining",
	description = T(6661, --[[TraitPreset Glutton description]] "Eats double rations. Can be caused by Sanity breakdowns. +Dining"),
	display_name = T(6660, --[[TraitPreset Glutton display_name]] "Glutton"),
	group = "Negative",
	id = "Glutton",
	incompatible = {},
})

PlaceObj('TraitPreset', {
	add_interest = "needMedical",
	description = T(6663, --[[TraitPreset Hypochondriac description]] "Will randomly visit Medical buildings and take Sanity damage if unable to do so. Interests: +Medical"),
	display_name = T(6662, --[[TraitPreset Hypochondriac display_name]] "Hypochondriac"),
	group = "Negative",
	id = "Hypochondriac",
	incompatible = {
		Immortal = true,
	},
	param = 10,
})

PlaceObj('TraitPreset', {
	description = T(6653, --[[TraitPreset Idiot description]] "Can cause a malfunction at workplace (10% chance). Malfunctioning buildings stop working and require maintenance."),
	display_name = T(6652, --[[TraitPreset Idiot display_name]] "Idiot"),
	group = "Negative",
	id = "Idiot",
	incompatible = {
		Genius = true,
		Immortal = true,
	},
	initial_filter = true,
	param = 10,
	weight = 100,
})

PlaceObj('TraitPreset', {
	auto = false,
	daily_update_func = function (colonist, trait)
InfectedDailyUpdate(colonist)
colonist:ChangeHealth(-trait.param*const.Scale.Stat, trait.id)
end,
	description = T(8489, --[[TraitPreset Infected description]] "Loses Health each day. Spreads to other Colonists in the Dome."),
	display_name = T(8454, --[[TraitPreset Infected display_name]] "Infected"),
	dome_filter_only = true,
	group = "Negative",
	hidden_on_start = true,
	id = "Infected",
	incompatible = {},
	param = 12,
})

PlaceObj('TraitPreset', {
	_incompatible = "Extrovert",
	description = T(6711, --[[TraitPreset Introvert description]] "Loses Comfort every day while living in a Dome with population over 30. -Social"),
	display_name = T(6710, --[[TraitPreset Introvert display_name]] "Loner"),
	group = "Negative",
	id = "Introvert",
	incompatible = {
		Extrovert = true,
	},
	remove_interest = "interestSocial",
})

PlaceObj('TraitPreset', {
	_incompatible = "Workaholic",
	description = T(6627, --[[TraitPreset Lazy description]] "Individual performance decreased by 20 at all jobs."),
	display_name = T(6626, --[[TraitPreset Lazy display_name]] "Lazy"),
	group = "Negative",
	id = "Lazy",
	incompatible = {
		Workaholic = true,
	},
	initial_filter = true,
	modify_amount = -20,
	modify_property = "performance",
	modify_target = "self",
})

PlaceObj('TraitPreset', {
	_incompatible = "Enthusiast",
	description = T(6707, --[[TraitPreset Melancholic description]] "Increased performance penalty when at low Morale. Can be caused by Sanity breakdowns."),
	display_name = T(6706, --[[TraitPreset Melancholic display_name]] "Melancholic"),
	group = "Negative",
	id = "Melancholic",
	incompatible = {
		Enthusiast = true,
	},
	param = 20,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6668, --[[TraitPreset Renegade description]] "Performance decreased by 50 at all jobs. Can cause crime events when there are not enough Security Stations in the Dome."),
	display_name = T(4368, --[[TraitPreset Renegade display_name]] "Renegade"),
	dome_filter_only = true,
	group = "Negative",
	id = "Renegade",
	incompatible = {},
	modify_amount = -50,
	modify_property = "performance",
	modify_target = "self",
})

PlaceObj('TraitPreset', {
	daily_update_func = function (colonist, trait)
if colonist.stat_comfort < g_Consts.LowStatLevel then
	colonist:ChangeSanity(-trait.param*const.Scale.Stat, trait.id)
end
end,
	description = T(6665, --[[TraitPreset Whiner description]] "Loses Sanity when low on Comfort."),
	display_name = T(6664, --[[TraitPreset Whiner display_name]] "Whiner"),
	group = "Negative",
	id = "Whiner",
	incompatible = {},
	initial_filter = true,
	param = 10,
})

PlaceObj('TraitPreset', {
	daily_update_func = function (colonist, trait)
if colonist.stat_comfort >= g_Consts.HighStatLevel	then
	colonist.city:ChangeFunding(trait.param, "Celebrity")
end	
end,
	description = T(6643, --[[TraitPreset Celebrity description]] "Generates Funding when at high Comfort."),
	display_name = T(6642, --[[TraitPreset Celebrity display_name]] "Celebrity"),
	group = "Positive",
	id = "Celebrity",
	incompatible = {},
	initial_filter_up = true,
	param = 30000000,
	rare = true,
	weight = 5,
})

PlaceObj('TraitPreset', {
	_incompatible = "Coward",
	description = T(6639, --[[TraitPreset Composed description]] "All Sanity losses are halved."),
	display_name = T(6638, --[[TraitPreset Composed display_name]] "Composed"),
	group = "Positive",
	id = "Composed",
	incompatible = {
		Coward = true,
	},
})

PlaceObj('TraitPreset', {
	description = T(6693, --[[TraitPreset Empath description]] "Raises the Morale of all Colonists in the Dome. The effects of multiple Empaths stack."),
	display_name = T(6692, --[[TraitPreset Empath display_name]] "Empath"),
	group = "Positive",
	hidden_on_start = true,
	id = "Empath",
	incompatible = {},
	infopanel_effect_text = T(6694, --[[TraitPreset Empath infopanel_effect_text]] "Inspired by an Empath +<amount>"),
	modify_amount = 5,
	modify_property = "base_morale",
	modify_target = "dome colonists",
	rare = true,
	weight = 5,
})

PlaceObj('TraitPreset', {
	_incompatible = "Melancholic",
	description = T(6703, --[[TraitPreset Enthusiast description]] "Increased performance boost when at high Morale."),
	display_name = T(6702, --[[TraitPreset Enthusiast display_name]] "Enthusiast"),
	group = "Positive",
	id = "Enthusiast",
	incompatible = {
		Melancholic = true,
	},
	param = 20,
})

PlaceObj('TraitPreset', {
	_incompatible = "Introvert",
	add_interest = "interestSocial",
	description = T(6709, --[[TraitPreset Extrovert description]] "Gains additional Comfort when satisfying social interest. +Social"),
	display_name = T(6708, --[[TraitPreset Extrovert display_name]] "Party Animal"),
	group = "Positive",
	id = "Extrovert",
	incompatible = {
		Introvert = true,
	},
})

PlaceObj('TraitPreset', {
	add_interest = "interestExercise",
	description = T(6701, --[[TraitPreset Fit description]] "More health recovered while resting. Can work when health is low. +Exercise"),
	display_name = T(6700, --[[TraitPreset Fit display_name]] "Fit"),
	group = "Positive",
	id = "Fit",
	incompatible = {},
	modify_amount = 5,
	modify_property = "DailyHealthRecover",
	modify_target = "self",
	param = 10,
})

PlaceObj('TraitPreset', {
	add_interest = "interestGaming",
	description = T(6659, --[[TraitPreset Gamer description]] "Recovers Sanity when gaming. +Gaming"),
	display_name = T(6658, --[[TraitPreset Gamer display_name]] "Gamer"),
	group = "Positive",
	id = "Gamer",
	incompatible = {},
	param = 5,
})

PlaceObj('TraitPreset', {
	_incompatible = "Idiot",
	daily_update_func = function (colonist, trait)
if colonist.stat_sanity >= g_Consts.HighStatLevel	then 	
	colonist.city:AddResearchPoints(trait.param)
end	
end,
	description = T(6641, --[[TraitPreset Genius description]] "Generates Research when at high Sanity."),
	display_name = T(6640, --[[TraitPreset Genius display_name]] "Genius"),
	group = "Positive",
	id = "Genius",
	incompatible = {
		Idiot = true,
	},
	initial_filter_up = true,
	param = 150,
	rare = true,
	weight = 5,
})

PlaceObj('TraitPreset', {
	_incompatible = "Workaholic",
	description = T(6705, --[[TraitPreset Hippie description]] "Gains twice as much Comfort in gardens and parks."),
	display_name = T(6704, --[[TraitPreset Hippie display_name]] "Hippie"),
	group = "Positive",
	id = "Hippie",
	incompatible = {
		Workaholic = true,
	},
})

PlaceObj('TraitPreset', {
	description = T(6696, --[[TraitPreset Nerd description]] "Gains a temporary Morale boost every time a new technology is researched."),
	display_name = T(6695, --[[TraitPreset Nerd display_name]] "Nerd"),
	group = "Positive",
	id = "Nerd",
	incompatible = {},
	infopanel_effect_text = T(6697, --[[TraitPreset Nerd infopanel_effect_text]] "I love science! <amount> (Nerd)"),
	param = 10,
})

PlaceObj('TraitPreset', {
	description = T(6650, --[[TraitPreset Religious description]] "Higher individual base Morale. Low Sanity never leads to suicide."),
	display_name = T(6649, --[[TraitPreset Religious display_name]] "Religious"),
	group = "Positive",
	id = "Religious",
	incompatible = {},
	infopanel_effect_text = T(6651, --[[TraitPreset Religious infopanel_effect_text]] "Believing in a higher purpose +<amount> (Religious)"),
	modify_amount = 10,
	modify_property = "base_morale",
	modify_target = "self",
	param = 10,
})

PlaceObj('TraitPreset', {
	description = T(6699, --[[TraitPreset Rugged description]] "No Comfort penalties when eating unprepared food or having no residence."),
	display_name = T(6698, --[[TraitPreset Rugged display_name]] "Rugged"),
	group = "Positive",
	id = "Rugged",
	incompatible = {},
})

PlaceObj('TraitPreset', {
	description = T(6645, --[[TraitPreset Saint description]] "Raises the Morale of all Religious people in the Dome. Benefits stack with each additional Saint."),
	display_name = T(6644, --[[TraitPreset Saint display_name]] "Saint"),
	group = "Positive",
	id = "Saint",
	incompatible = {},
	infopanel_effect_text = T(6646, --[[TraitPreset Saint infopanel_effect_text]] "Blessed by a Saint +<amount>"),
	modify_amount = 10,
	modify_property = "base_morale",
	modify_target = "dome colonists",
	modify_trait = "Religious",
	param = 2,
	rare = true,
	weight = 5,
})

PlaceObj('TraitPreset', {
	description = T(6635, --[[TraitPreset Sexy description]] "Greatly increased birth rate."),
	display_name = T(6634, --[[TraitPreset Sexy display_name]] "Sexy"),
	group = "Positive",
	id = "Sexy",
	incompatible = {},
	modify_amount = 50,
	modify_property = "birth_comfort_modifier",
	modify_target = "self",
})

PlaceObj('TraitPreset', {
	description = T(6633, --[[TraitPreset Survivor description]] "Loses less Health without food, water, oxygen or when living in an unpowered Dome."),
	display_name = T(6632, --[[TraitPreset Survivor display_name]] "Survivor"),
	group = "Positive",
	id = "Survivor",
	incompatible = {},
	param = 50,
})

PlaceObj('TraitPreset', {
	_incompatible = "Hippie,Lazy",
	description = T(6631, --[[TraitPreset Workaholic description]] "Individual performance increased by 20. No penalty for heavy workloads. -Relaxation"),
	display_name = T(6630, --[[TraitPreset Workaholic display_name]] "Workaholic"),
	group = "Positive",
	id = "Workaholic",
	incompatible = {
		Hippie = true,
		Lazy = true,
	},
	modify_amount = 20,
	modify_property = "performance",
	modify_target = "self",
	remove_interest = "interestRelaxation",
})

PlaceObj('TraitPreset', {
	apply_func = function (colonist, trait, init)
colonist:ChooseEntity()
colonist:AddTrait("Martianborn")
end,
	auto = false,
	description = T(8455, --[[TraitPreset Android description]] "Synthetically created humans that function similarly to us - they breathe, they eat and they sleep. However they do not age and cannot reproduce."),
	display_name = T(7303, --[[TraitPreset Android display_name]] "Biorobot"),
	dome_filter_only = true,
	group = "other",
	hidden_on_start = true,
	id = "Android",
	incompatible = {},
	unapply_func = function (colonist, trait)
colonist:ChooseEntity()
end,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6667, --[[TraitPreset Clone description]] "Has half the lifespan of a naturally born human."),
	display_name = T(6666, --[[TraitPreset Clone display_name]] "Clone"),
	group = "other",
	hidden_on_start = true,
	id = "Clone",
	incompatible = {},
})

PlaceObj('TraitPreset', {
	apply_func = function (colonist, trait, init)
local mystery = UICity.mystery
if mystery:IsKindOf("DreamMystery") and mystery.state == "ended" then
	colonist:SetModifier("performance", "trait effect(Dreamer)", trait.param, 0, T(7598, "<green>Dreamer's inspiration +<amount> (Dreamer)</color>"))
end
end,
	auto = false,
	description = T(6672, --[[TraitPreset Dreamer description]] "Dreamers make sense of the shared dream but lose Sanity during Mirages."),
	display_name = T(6671, --[[TraitPreset Dreamer display_name]] "Dreamer"),
	dome_filter_only = true,
	group = "other",
	hidden_on_start = true,
	id = "Dreamer",
	incompatible = {},
	param = 10,
	unapply_func = function (colonist, trait)
colonist:SetModifier("performance", "trait effect(Dreamer)", 0, 0)
end,
})

PlaceObj('TraitPreset', {
	apply_func = function (colonist, trait, init)
local mystery = UICity.mystery
if mystery:IsKindOf("DreamMystery") and mystery.state == "ended" then
	colonist:SetModifier("performance", "trait effect(Dreamer)", trait.param, 0, T(7598, "<green>Dreamer's inspiration +<amount> (Dreamer)</color>"))
end
end,
	auto = false,
	description = T(7304, --[[TraitPreset DreamerPostMystery description]] "The Dreamers have emerged from the Mirages with renewed hope. +15 performance"),
	display_name = T(6671, --[[TraitPreset DreamerPostMystery display_name]] "Dreamer"),
	dome_filter_only = true,
	group = "other",
	hidden_on_start = true,
	id = "DreamerPostMystery",
	incompatible = {},
	param = 15,
	unapply_func = function (colonist, trait)
colonist:SetModifier("performance", "trait effect(Dreamer)", 0, 0)
end,
})

PlaceObj('TraitPreset', {
	auto = false,
	description = T(6629, --[[TraitPreset Founder description]] "One of the first Martian Colonists."),
	display_name = T(6628, --[[TraitPreset Founder display_name]] "Founder"),
	dome_filter_only = true,
	group = "other",
	id = "Founder",
	incompatible = {
		Martianborn = true,
	},
})

PlaceObj('TraitPreset', {
	daily_update_func = function (colonist, trait)
		return GuruDailyUpdate(colonist, trait)
end,
	description = T(6648, --[[TraitPreset Guru description]] "Randomly spreads other traits of this colonist to persons in the same Dome with less than 3 traits."),
	display_name = T(6647, --[[TraitPreset Guru display_name]] "Guru"),
	group = "other",
	id = "Guru",
	incompatible = {},
	param = 2,
	rare = true,
	weight = 5,
})

PlaceObj('TraitPreset', {
	_incompatible = "Tourist,Founder",
	apply_func = function (colonist, trait, init)
	if colonist.city:IsTechResearched("MartianbornIngenuity") then
		colonist:SetModifier("performance", "MartianbornIngenuity", TechDef.MartianbornIngenuity.param1, 0, T(7600, "<green>Martian born Ingenuity <amount> (Martianborn)</color>"))
	end 
end,
	auto = false,
	description = T(6717, --[[TraitPreset Martianborn description]] "Martianborn Colonists never become Earthsick. The Martianborn group of techs can improve this trait significantly."),
	display_name = T(6716, --[[TraitPreset Martianborn display_name]] "Martianborn"),
	dome_filter_only = true,
	group = "other",
	hidden_on_start = true,
	id = "Martianborn",
	incompatible = {
		Founder = true,
		Tourist = true,
	},
	unapply_func = function (colonist, trait)
colonist:SetModifier("performance", "MartianbornIngenuity", 0, 0)
end,
})

PlaceObj('TraitPreset', {
	apply_func = function (colonist, trait, init)
colonist.refugee_life_remaining = 5
end,
	auto = false,
	description = T(8488, --[[TraitPreset Refugee description]] "Untrained for life on Mars, which results in decreased performance at all jobs. Cannot be Earthsick. High chance to become a Renegade."),
	display_name = T(8453, --[[TraitPreset Refugee display_name]] "Refugee"),
	dome_filter_only = true,
	group = "other",
	hidden_on_start = true,
	id = "Refugee",
	incompatible = {},
	modify_amount = -40,
	modify_property = "performance",
	modify_target = "self",
	param = 15,
	weight = 0,
})

PlaceObj('TraitPreset', {
	_incompatible = "Martianborn",
	add_interest = "interestGambling",
	auto = false,
	description = T(12243, --[[TraitPreset Tourist description]] "Doesn’t work. Grants <if(has_researched('TeraTourism'))>$15</if><if(not(has_researched('TeraTourism')))>$10</if> Million Funding on arrival. Leaves at first opportunity after 5 Sols. More Tourists appear when Tourists successfully return to Earth. +Gambling"),
	display_name = T(6714, --[[TraitPreset Tourist display_name]] "Tourist"),
	group = "other",
	id = "Tourist",
	incompatible = {
		Martianborn = true,
	},
	initial_filter = true,
})

PlaceObj('TraitPreset', {
	description = T(12573, --[[TraitPreset Vegan description]] "Don't worry. They’ll tell you.<if(has_dlc('shepard'))><newline><newline>Has decreased Comfort when living near a Ranch and won't work in such buildings. Has increased Comfort when away from Ranches.</if>"),
	display_name = T(6718, --[[TraitPreset Vegan display_name]] "Vegan"),
	group = "other",
	id = "Vegan",
	incompatible = {},
})

PlaceObj('TraitPreset', {
	SortKey = 10000,
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6679, --[[TraitPreset none description]] "Colonists with no specialization will perform worse at jobs that require specialized workers."),
	display_name = T(3848, --[[TraitPreset none display_name]] "No specialization"),
	group = "Specialization",
	id = "none",
	incompatible = {},
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10100,
	add_interest = "interestGaming",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6680, --[[TraitPreset scientist description]] "A science specialist trained to work in research buildings. Interests: +Gaming, - Shopping"),
	display_name = T(3850, --[[TraitPreset scientist display_name]] "Scientist"),
	group = "Specialization",
	id = "scientist",
	incompatible = {},
	remove_interest = "interestShopping",
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10200,
	add_interest = "interestDining",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6681, --[[TraitPreset engineer description]] "An engineer trained to work in factories. Interests: +Dining, - Social"),
	display_name = T(3853, --[[TraitPreset engineer display_name]] "Engineer"),
	group = "Specialization",
	id = "engineer",
	incompatible = {},
	remove_interest = "interestSocial",
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10300,
	add_interest = "interestExercise",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6683, --[[TraitPreset security description]] "A security officer trained to work in security buildings. Interests: +Exercise, - Shopping"),
	display_name = T(6682, --[[TraitPreset security display_name]] "Officer"),
	group = "Specialization",
	id = "security",
	incompatible = {},
	remove_interest = "interestShopping",
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10400,
	add_interest = "interestDrinking",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6684, --[[TraitPreset geologist description]] "A geology specialist trained to work in extractor buildings. Interests: +Drinking, - Relaxation"),
	display_name = T(3859, --[[TraitPreset geologist display_name]] "Geologist"),
	group = "Specialization",
	id = "geologist",
	incompatible = {},
	remove_interest = "interestRelaxation",
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10500,
	add_interest = "interestLuxury",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6685, --[[TraitPreset botanist description]] "A botany specialist trained to work on farms. Interests: +Luxury, - Social"),
	display_name = T(3865, --[[TraitPreset botanist display_name]] "Botanist"),
	group = "Specialization",
	id = "botanist",
	incompatible = {},
	remove_interest = "interestSocial",
	show_in_traits_ui = false,
})

PlaceObj('TraitPreset', {
	SortKey = 10600,
	add_interest = "interestLuxury",
	apply_func = function (colonist, trait, init)
colonist:SetSpecialization(trait.id,init)
end,
	auto = false,
	description = T(6686, --[[TraitPreset medic description]] "A medical specialist trained to work in medical buildings. Interests: +Luxury, - Relaxation"),
	display_name = T(3862, --[[TraitPreset medic display_name]] "Medic"),
	group = "Specialization",
	id = "medic",
	incompatible = {},
	remove_interest = "interestRelaxation",
	show_in_traits_ui = false,
})

