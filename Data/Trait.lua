-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Trait', {
	'name', "Lazy",
	'display_name', T{6626, --[[Trait Lazy display_name]] "Lazy"},
	'category', "Negative",
	'description', T{6627, --[[Trait Lazy description]] "Individual performance decreased by 20 at all jobs."},
	'_incompatible', "Workaholic",
	'modify_target', "self",
	'modify_property', "performance",
	'modify_amount', -20,
})

PlaceObj('Trait', {
	'name', "Refugee",
	'display_name', T{8453, --[[Trait Refugee display_name]] "Refugee"},
	'category', "other",
	'description', T{8488, --[[Trait Refugee description]] "Untrained for life on Mars, which results in decreased performance at all jobs. Cannot be Earthsick. High chance to become a Renegade."},
	'weight', 0,
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'param', 15,
	'apply_func', function (colonist, trait, init)
colonist.refugee_life_remaining = 5
end,
	'modify_target', "self",
	'modify_property', "performance",
	'modify_amount', -40,
})

PlaceObj('Trait', {
	'name', "Founder",
	'display_name', T{6628, --[[Trait Founder display_name]] "Founder"},
	'category', "other",
	'description', T{6629, --[[Trait Founder description]] "One of the first Martian Colonists."},
	'auto', false,
	'dome_filter_only', true,
})

PlaceObj('Trait', {
	'name', "Workaholic",
	'display_name', T{6630, --[[Trait Workaholic display_name]] "Workaholic"},
	'category', "Positive",
	'description', T{6631, --[[Trait Workaholic description]] "Individual performance increased by 20. No penalty for heavy workloads. -Relaxation"},
	'_incompatible', "Hippie,Lazy",
	'remove_interest', "interestRelaxation",
	'modify_target', "self",
	'modify_property', "performance",
	'modify_amount', 20,
})

PlaceObj('Trait', {
	'name', "Survivor",
	'display_name', T{6632, --[[Trait Survivor display_name]] "Survivor"},
	'category', "Positive",
	'description', T{6633, --[[Trait Survivor description]] "Loses less Health without food, water, oxygen or when living in an unpowered Dome."},
	'param', 50,
})

PlaceObj('Trait', {
	'name', "Sexy",
	'display_name', T{6634, --[[Trait Sexy display_name]] "Sexy"},
	'category', "Positive",
	'description', T{6635, --[[Trait Sexy description]] "Greatly increased birth rate."},
	'modify_target', "self",
	'modify_property', "birth_comfort_modifier",
	'modify_amount', 50,
})

PlaceObj('Trait', {
	'name', "ChronicCondition",
	'display_name', T{6636, --[[Trait ChronicCondition display_name]] "Chronic Condition"},
	'category', "Negative",
	'description', T{6637, --[[Trait ChronicCondition description]] "Loses Health each day."},
	'initial_filter', true,
	'param', 8,
	'daily_update_func', function (colonist, trait)
colonist:ChangeHealth(-trait.param*const.Scale.Stat, trait.name)
end,
})

PlaceObj('Trait', {
	'name', "Infected",
	'display_name', T{8454, --[[Trait Infected display_name]] "Infected"},
	'category', "Negative",
	'description', T{8489, --[[Trait Infected description]] "Loses Health each day. Spreads to other Colonists in the Dome."},
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'param', 12,
	'daily_update_func', function (colonist, trait)
InfectedDailyUpdate(colonist)
colonist:ChangeHealth(-trait.param*const.Scale.Stat, trait.name)
end,
})

PlaceObj('Trait', {
	'name', "Composed",
	'display_name', T{6638, --[[Trait Composed display_name]] "Composed"},
	'category', "Positive",
	'description', T{6639, --[[Trait Composed description]] "All Sanity losses are halved."},
	'_incompatible', "Coward",
})

PlaceObj('Trait', {
	'name', "Genius",
	'display_name', T{6640, --[[Trait Genius display_name]] "Genius"},
	'category', "Positive",
	'description', T{6641, --[[Trait Genius description]] "Generates Research when in the Colony."},
	'rare', true,
	'weight', 1,
	'_incompatible', "Idiot",
	'param', 50,
	'daily_update_func', function (colonist, trait)
colonist.city:AddResearchPoints(trait.param)
end,
})

PlaceObj('Trait', {
	'name', "Celebrity",
	'display_name', T{6642, --[[Trait Celebrity display_name]] "Celebrity"},
	'category', "Positive",
	'description', T{6643, --[[Trait Celebrity description]] "Generates Funding when in the Colony."},
	'rare', true,
	'weight', 1,
	'param', 10000000,
	'daily_update_func', function (colonist, trait)
colonist.city:ChangeFunding(trait.param, colonist)
end,
})

PlaceObj('Trait', {
	'name', "Saint",
	'display_name', T{6644, --[[Trait Saint display_name]] "Saint"},
	'category', "Positive",
	'description', T{6645, --[[Trait Saint description]] "Raises the Morale of all Religious people in the Dome. Benefits stack with each additional Saint."},
	'rare', true,
	'weight', 1,
	'param', 2,
	'modify_target', "dome colonists",
	'modify_trait', "Religious",
	'modify_property', "base_morale",
	'modify_amount', 10,
	'infopanel_effect_text', T{6646, --[[Trait Saint infopanel_effect_text]] "Blessed by a Saint +<amount>"},
})

PlaceObj('Trait', {
	'name', "Guru",
	'display_name', T{6647, --[[Trait Guru display_name]] "Guru"},
	'category', "other",
	'description', T{6648, --[[Trait Guru description]] "Randomly spreads other traits of this colonist to persons in the same Dome with less than 3 traits."},
	'rare', true,
	'weight', 1,
	'param', 2,
	'daily_update_func', function (colonist, trait)
		return GuruDailyUpdate(colonist, trait)
end,
})

PlaceObj('Trait', {
	'name', "Religious",
	'display_name', T{6649, --[[Trait Religious display_name]] "Religious"},
	'category', "Positive",
	'description', T{6650, --[[Trait Religious description]] "Higher individual base Morale. Low Sanity never leads to suicide."},
	'param', 10,
	'modify_target', "self",
	'modify_property', "base_morale",
	'modify_amount', 10,
	'infopanel_effect_text', T{6651, --[[Trait Religious infopanel_effect_text]] "Believing in a higher purpose +<amount> (Religious)"},
})

PlaceObj('Trait', {
	'name', "Idiot",
	'display_name', T{6652, --[[Trait Idiot display_name]] "Idiot"},
	'category', "Negative",
	'description', T{6653, --[[Trait Idiot description]] "Can cause a malfunction at workplace (10% chance). Malfunctioning buildings stop working and require maintenance."},
	'weight', 10,
	'initial_filter', true,
	'param', 10,
})

PlaceObj('Trait', {
	'name', "Alcoholic",
	'display_name', T{6654, --[[Trait Alcoholic display_name]] "Alcoholic"},
	'category', "Negative",
	'description', T{6655, --[[Trait Alcoholic description]] "Work performance lowered by 10. Can be caused by Sanity breakdowns. +Drinking"},
	'add_interest', "interestDrinking",
	'modify_target', "self",
	'modify_property', "performance",
	'modify_amount', -10,
})

PlaceObj('Trait', {
	'name', "Gambler",
	'display_name', T{6656, --[[Trait Gambler display_name]] "Gambler"},
	'category', "Negative",
	'description', T{6657, --[[Trait Gambler description]] "Has a 50% chance to lose 20 Sanity when visiting a Casino. Can be caused by Sanity breakdowns. +Gambling"},
	'add_interest', "interestGambling",
	'param', 20,
})

PlaceObj('Trait', {
	'name', "Gamer",
	'display_name', T{6658, --[[Trait Gamer display_name]] "Gamer"},
	'category', "Positive",
	'description', T{6659, --[[Trait Gamer description]] "Recovers Sanity when gaming. +Gaming"},
	'add_interest', "interestGaming",
	'param', 5,
})

PlaceObj('Trait', {
	'name', "Glutton",
	'display_name', T{6660, --[[Trait Glutton display_name]] "Glutton"},
	'category', "Negative",
	'description', T{6661, --[[Trait Glutton description]] "Eats double rations. Can be caused by Sanity breakdowns. +Dining"},
	'add_interest', "interestDining",
})

PlaceObj('Trait', {
	'name', "Hypochondriac",
	'display_name', T{6662, --[[Trait Hypochondriac display_name]] "Hypochondriac"},
	'category', "Negative",
	'description', T{6663, --[[Trait Hypochondriac description]] "Will randomly visit Medical buildings and take Sanity damage if unable to do so. Interests: +Medical"},
	'add_interest', "needMedical",
	'param', 10,
})

PlaceObj('Trait', {
	'name', "Whiner",
	'display_name', T{6664, --[[Trait Whiner display_name]] "Whiner"},
	'category', "Negative",
	'description', T{6665, --[[Trait Whiner description]] "Loses Sanity when low on Comfort."},
	'initial_filter', true,
	'param', 10,
	'daily_update_func', function (colonist, trait)
if colonist.stat_comfort < g_Consts.LowStatLevel then
	colonist:ChangeSanity(-trait.param*const.Scale.Stat, trait.name)
end
end,
})

PlaceObj('Trait', {
	'name', "Clone",
	'display_name', T{6666, --[[Trait Clone display_name]] "Clone"},
	'category', "other",
	'description', T{6667, --[[Trait Clone description]] "Has half the lifespan of a naturally born human."},
	'auto', false,
	'hidden_on_start', true,
})

PlaceObj('Trait', {
	'name', "Android",
	'display_name', T{7303, --[[Trait Android display_name]] "Biorobot"},
	'category', "other",
	'description', T{8455, --[[Trait Android description]] "Synthetically created humans that function similarly to us - they breathe, they eat and they sleep. However they do not age and cannot reproduce."},
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'apply_func', function (colonist, trait, init)
colonist:AddTrait("Martianborn")
end,
})

PlaceObj('Trait', {
	'name', "Renegade",
	'display_name', T{4368, --[[Trait Renegade display_name]] "Renegade"},
	'category', "Negative",
	'description', T{6668, --[[Trait Renegade description]] "Performance decreased by 50 at all jobs. Can cause crime events when there are not enough Security Stations in the Dome."},
	'auto', false,
	'dome_filter_only', true,
	'modify_target', "self",
	'modify_property', "performance",
	'modify_amount', -50,
})

PlaceObj('Trait', {
	'name', "Dreamer",
	'display_name', T{6671, --[[Trait Dreamer display_name]] "Dreamer"},
	'category', "other",
	'description', T{6672, --[[Trait Dreamer description]] "Dreamers make sense of the shared dream but lose Sanity during Mirages."},
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'param', 10,
	'apply_func', function (colonist, trait, init)
local mystery = UICity.mystery
if mystery:IsKindOf("DreamMystery") and mystery.state == "ended" then
	colonist:SetModifier("performance", "trait effect(Dreamer)", trait.param, 0, T{7598, "<green>Dreamer's inspiration +<amount> (Dreamer)</color>"})
end
end,
	'unapply_func', function (colonist, trait)
colonist:SetModifier("performance", "trait effect(Dreamer)", 0, 0)
end,
})

PlaceObj('Trait', {
	'name', "DreamerPostMystery",
	'display_name', T{6671, --[[Trait DreamerPostMystery display_name]] "Dreamer"},
	'category', "other",
	'description', T{7304, --[[Trait DreamerPostMystery description]] "The Dreamers have emerged from the Mirages with renewed hope. +15 performance"},
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'param', 15,
	'apply_func', function (colonist, trait, init)
local mystery = UICity.mystery
if mystery:IsKindOf("DreamMystery") and mystery.state == "ended" then
	colonist:SetModifier("performance", "trait effect(Dreamer)", trait.param, 0, T{7598, "<green>Dreamer's inspiration +<amount> (Dreamer)</color>"})
end
end,
	'unapply_func', function (colonist, trait)
colonist:SetModifier("performance", "trait effect(Dreamer)", 0, 0)
end,
})

PlaceObj('Trait', {
	'name', "Male",
	'display_name', T{6673, --[[Trait Male display_name]] "Male"},
	'category', "Gender",
	'description', T{6674, --[[Trait Male description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "Female",
	'display_name', T{6675, --[[Trait Female display_name]] "Female"},
	'category', "Gender",
	'description', T{6676, --[[Trait Female description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "OtherGender",
	'display_name', T{6677, --[[Trait OtherGender display_name]] "Other"},
	'category', "Gender",
	'description', T{6678, --[[Trait OtherGender description]] "The birth rate in any Dome is determined by the number of Male/Female couples at high Comfort."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "none",
	'display_name', T{3848, --[[Trait none display_name]] "No specialization"},
	'category', "Specialization",
	'description', T{6679, --[[Trait none description]] "Colonists with no specialization will perform worse at jobs that require specialized workers."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "scientist",
	'display_name', T{3850, --[[Trait scientist display_name]] "Scientist"},
	'category', "Specialization",
	'description', T{6680, --[[Trait scientist description]] "A science specialist trained to work in research buildings. Interests: +Gaming, - Shopping"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestGaming",
	'remove_interest', "interestShopping",
})

PlaceObj('Trait', {
	'name', "engineer",
	'display_name', T{3853, --[[Trait engineer display_name]] "Engineer"},
	'category', "Specialization",
	'description', T{6681, --[[Trait engineer description]] "An engineer trained to work in factories. Interests: +Dining, - Social"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestDining",
	'remove_interest', "interestSocial",
})

PlaceObj('Trait', {
	'name', "security",
	'display_name', T{6682, --[[Trait security display_name]] "Officer"},
	'category', "Specialization",
	'description', T{6683, --[[Trait security description]] "A security officer trained to work in security buildings. Interests: +Exercise, - Shopping"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestExercise",
	'remove_interest', "interestShopping",
})

PlaceObj('Trait', {
	'name', "geologist",
	'display_name', T{3859, --[[Trait geologist display_name]] "Geologist"},
	'category', "Specialization",
	'description', T{6684, --[[Trait geologist description]] "A geology specialist trained to work in extractor buildings. Interests: +Drinking, - Relaxation"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestDrinking",
	'remove_interest', "interestRelaxation",
})

PlaceObj('Trait', {
	'name', "botanist",
	'display_name', T{3865, --[[Trait botanist display_name]] "Botanist"},
	'category', "Specialization",
	'description', T{6685, --[[Trait botanist description]] "A botany specialist trained to work on farms. Interests: +Luxury, - Social"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestLuxury",
	'remove_interest', "interestSocial",
})

PlaceObj('Trait', {
	'name', "medic",
	'display_name', T{3862, --[[Trait medic display_name]] "Medic"},
	'category', "Specialization",
	'description', T{6686, --[[Trait medic description]] "A medical specialist trained to work in medical buildings. Interests: +Luxury, - Relaxation"},
	'auto', false,
	'show_in_traits_ui', false,
	'add_interest', "interestLuxury",
	'remove_interest', "interestRelaxation",
})

PlaceObj('Trait', {
	'name', "Child",
	'display_name', T{4775, --[[Trait Child display_name]] "Child"},
	'category', "Age Group",
	'description', T{6687, --[[Trait Child description]] "Children are too young to work and use many of the buildings in the Colony. They can go to School and use certain special buildings such as the Playground and Nursery."},
	'auto', false,
	'initial_filter', true,
	'show_in_traits_ui', false,
	'add_interest', "interestPlaying",
})

PlaceObj('Trait', {
	'name', "Youth",
	'display_name', T{4777, --[[Trait Youth display_name]] "Youth"},
	'category', "Age Group",
	'description', T{6688, --[[Trait Youth description]] "A young Colonist, able to work in all buildings."},
	'auto', false,
	'show_in_traits_ui', false,
	'apply_func', function (colonist, trait, init)
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
end,
})

PlaceObj('Trait', {
	'name', "Adult",
	'display_name', T{4779, --[[Trait Adult display_name]] "Adult"},
	'category', "Age Group",
	'description', T{6689, --[[Trait Adult description]] "An adult Colonist, able to work in all buildings."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "Middle Aged",
	'display_name', T{4781, --[[Trait Middle Aged display_name]] "Middle Aged"},
	'category', "Age Group",
	'description', T{6690, --[[Trait Middle Aged description]] "A middle aged Colonist, approaching retirement, but still able to work in all buildings."},
	'auto', false,
	'show_in_traits_ui', false,
})

PlaceObj('Trait', {
	'name', "Senior",
	'display_name', T{4783, --[[Trait Senior display_name]] "Senior"},
	'category', "Age Group",
	'description', T{6691, --[[Trait Senior description]] "A senior Colonist, too old to work."},
	'auto', false,
	'initial_filter', true,
	'show_in_traits_ui', false,
	'apply_func', function (colonist, trait, init)
colonist:ChooseEntity()
if not g_SeniorsCanWork then
	colonist:SetWorkplace(false)
end	
end,
})

PlaceObj('Trait', {
	'name', "Empath",
	'display_name', T{6692, --[[Trait Empath display_name]] "Empath"},
	'category', "Positive",
	'description', T{6693, --[[Trait Empath description]] "Raises the Morale of all Colonists in the Dome. The effects of multiple Empaths stack."},
	'rare', true,
	'weight', 1,
	'hidden_on_start', true,
	'modify_target', "dome colonists",
	'modify_property', "base_morale",
	'modify_amount', 5,
	'infopanel_effect_text', T{6694, --[[Trait Empath infopanel_effect_text]] "Inspired by an Empath +<amount>"},
})

PlaceObj('Trait', {
	'name', "Nerd",
	'display_name', T{6695, --[[Trait Nerd display_name]] "Nerd"},
	'category', "Positive",
	'description', T{6696, --[[Trait Nerd description]] "Gains a temporary Morale boost every time a new technology is researched."},
	'param', 10,
	'infopanel_effect_text', T{6697, --[[Trait Nerd infopanel_effect_text]] "I love science! <amount> (Nerd)"},
})

PlaceObj('Trait', {
	'name', "Rugged",
	'display_name', T{6698, --[[Trait Rugged display_name]] "Rugged"},
	'category', "Positive",
	'description', T{6699, --[[Trait Rugged description]] "No Comfort penalties when eating unprepared food or having no residence."},
})

PlaceObj('Trait', {
	'name', "Fit",
	'display_name', T{6700, --[[Trait Fit display_name]] "Fit"},
	'category', "Positive",
	'description', T{6701, --[[Trait Fit description]] "More health recovered while resting. Can work when health is low. +Exercise"},
	'add_interest', "interestExercise",
	'param', 10,
	'modify_target', "self",
	'modify_property', "DailyHealthRecover",
	'modify_amount', 5,
})

PlaceObj('Trait', {
	'name', "Enthusiast",
	'display_name', T{6702, --[[Trait Enthusiast display_name]] "Enthusiast"},
	'category', "Positive",
	'description', T{6703, --[[Trait Enthusiast description]] "Increased performance boost when at high Morale."},
	'_incompatible', "Melancholic",
	'param', 20,
})

PlaceObj('Trait', {
	'name', "Hippie",
	'display_name', T{6704, --[[Trait Hippie display_name]] "Hippie"},
	'category', "Positive",
	'description', T{6705, --[[Trait Hippie description]] "Gains twice as much Comfort in gardens and parks."},
	'_incompatible', "Workaholic",
})

PlaceObj('Trait', {
	'name', "Melancholic",
	'display_name', T{6706, --[[Trait Melancholic display_name]] "Melancholic"},
	'category', "Negative",
	'description', T{6707, --[[Trait Melancholic description]] "Increased performance penalty when at low Morale. Can be caused by Sanity breakdowns."},
	'_incompatible', "Enthusiast",
	'param', 20,
})

PlaceObj('Trait', {
	'name', "Extrovert",
	'display_name', T{6708, --[[Trait Extrovert display_name]] "Party Animal"},
	'category', "Positive",
	'description', T{6709, --[[Trait Extrovert description]] "Gains additional Comfort when satisfying social interest. +Social"},
	'_incompatible', "Introvert",
	'add_interest', "interestSocial",
})

PlaceObj('Trait', {
	'name', "Introvert",
	'display_name', T{6710, --[[Trait Introvert display_name]] "Loner"},
	'category', "Negative",
	'description', T{6711, --[[Trait Introvert description]] "Loses Comfort every day while living in a Dome with population over 30. -Social"},
	'_incompatible', "Extrovert",
	'remove_interest', "interestSocial",
})

PlaceObj('Trait', {
	'name', "Coward",
	'display_name', T{6712, --[[Trait Coward display_name]] "Coward"},
	'category', "Negative",
	'description', T{6713, --[[Trait Coward description]] "Double Sanity loss from disasters. Can be caused by Sanity breakdowns."},
	'_incompatible', "Composed",
	'initial_filter', true,
})

PlaceObj('Trait', {
	'name', "Tourist",
	'display_name', T{6714, --[[Trait Tourist display_name]] "Tourist"},
	'category', "other",
	'description', T{6715, --[[Trait Tourist description]] "Doesn’t work. Leaves at first opportunity, but will decide to stay if Comfort is high. +Gambling"},
	'_incompatible', "Martianborn",
	'auto', false,
	'initial_filter', true,
	'add_interest', "interestGambling",
})

PlaceObj('Trait', {
	'name', "Martianborn",
	'display_name', T{6716, --[[Trait Martianborn display_name]] "Martianborn"},
	'category', "other",
	'description', T{6717, --[[Trait Martianborn description]] "Martianborn Colonists never become Earthsick. The Martianborn group of techs can improve this trait significantly."},
	'_incompatible', "Tourist,Founder",
	'auto', false,
	'hidden_on_start', true,
	'dome_filter_only', true,
	'apply_func', function (colonist, trait, init)
	if colonist.city:IsTechResearched("MartianbornIngenuity") then
		colonist:SetModifier("performance", "MartianbornIngenuity", TechDef.MartianbornIngenuity.param1, 0, T{7600, "<green>Martian born Ingenuity <amount> (Martianborn)</color>"})
	end 
end,
	'unapply_func', function (colonist, trait)
colonist:SetModifier("performance", "MartianbornIngenuity", 0, 0)
end,
})

PlaceObj('Trait', {
	'name', "Vegan",
	'display_name', T{6718, --[[Trait Vegan display_name]] "Vegan"},
	'category', "other",
	'description', T{6719, --[[Trait Vegan description]] "Don't worry. They’ll tell you."},
})

