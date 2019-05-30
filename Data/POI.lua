-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('POI', {
	OnCompletion = function (self, object, city, idx)
local data = DataInstances.MapSettings_Meteor
local descr = data["Meteor_POI"]
CreateGameTimeThread(function()
	MeteorsDisaster(descr, "storm")
end)
end,
	description = T(279027486770, --[[POI CaptureMeteors description]] "Trigger a meteor shower that will yield some valuable resources – Metals, Rare Metals and Anomalies. <em>The meteor shower falls over a random location and may threaten the colony.</em>"),
	display_icon = "UI/Icons/pm_ capture_meteors.tga",
	display_name = T(629745664197, --[[POI CaptureMeteors display_name]] "Capture Meteors"),
	expedition_time = 1800000,
	group = "Default",
	id = "CaptureMeteors",
	max_projects_of_type = 1,
	rocket_required_resources = {
		PlaceObj('ResourceAmount', {
			'resource', "Fuel",
			'amount', 60000,
		}),
	},
	spawn_period = range(5, 15),
	terraforming_changes = {},
})

PlaceObj('POI', {
	CalcOutcome = function (self, object, city, idx)
return Max(200,  400 - (idx -1)*100)
end,
	GetOutcomeText = function (self, object, city, idx)
return T{11943, "<research(amount)>", amount = self:CalcOutcome(object, city, idx)}
end,
	OnCompletion = function (self, object, city, idx)
g_Consts:SetModifier("SponsorResearch",object.id, self:CalcOutcome(object, city, idx), 0)
end,
	PrerequisiteToCreate = function (self, city, idx)
return true
end,
	description = T(138000713269, --[[POI HeighSpeedComSatellite description]] "Increase sponsor research in exchange for constructing and launching an advanced communications satellite."),
	display_icon = "UI/Icons/pm_ high_speed_com_satellite.tga",
	display_name = T(449474184601, --[[POI HeighSpeedComSatellite display_name]] "High-speed Comm Satellite"),
	expedition_time = 3000000,
	first_spawn_location = "near",
	group = "Default",
	id = "HeighSpeedComSatellite",
	max_projects_of_type = 1,
	rocket_required_resources = {
		PlaceObj('ResourceAmount', {
			'resource', "Metals",
			'amount', 100000,
		}),
		PlaceObj('ResourceAmount', {
			'resource', "Fuel",
			'amount', 100000,
		}),
		PlaceObj('ResourceAmount', {
			'resource', "Electronics",
			'amount', 100000,
		}),
	},
	spawn_period = range(75, 125),
	terraforming_changes = {},
})

PlaceObj('POI', {
	CalcOutcome = function (self, object, city, idx)
return Max(1000,  2000 - (idx -1)*250)*1000000
end,
	GetOutcomeText = function (self, object, city, idx)
return T{11086, "<funding(amount)>", amount = self:CalcOutcome(object, city, idx)}
end,
	OnCompletion = function (self, object, city, idx)
city:ChangeFunding(self:CalcOutcome(object, city, idx), self.id)
end,
	PrerequisiteToCreate = function (self, city, idx)
return true
end,
	description = T(221516902916, --[[POI SETISatellite description]] "Grants Funding. Multiple uses of this project will yield diminishing returns."),
	display_icon = "UI/Icons/pm_ launch_seti_satellite.tga",
	display_name = T(239893453674, --[[POI SETISatellite display_name]] "Launch SETI Satellite"),
	expedition_time = 3000000,
	group = "Default",
	id = "SETISatellite",
	max_projects_of_type = 1,
	rocket_required_resources = {
		PlaceObj('ResourceAmount', {
			'resource', "Fuel",
			'amount', 50000,
		}),
		PlaceObj('ResourceAmount', {
			'resource', "Electronics",
			'amount', 30000,
		}),
		PlaceObj('ResourceAmount', {
			'resource', "Metals",
			'amount', 50000,
		}),
	},
	spawn_period = range(25, 50),
	terraforming_changes = {},
})

PlaceObj('POI', {
	CalcOutcome = function (self, object, city, idx)
return 750*1000000
end,
	GetOutcomeText = function (self, object, city, idx)
return T{11086, "<funding(amount)>", amount = self:CalcOutcome(object, city, idx)}
end,
	OnCompletion = function (self, object, city, idx)
city:ChangeFunding(self:CalcOutcome(object, city, idx), self.id)
end,
	PrerequisiteToCreate = function (self, city, idx)
return true
end,
	description = T(660953468688, --[[POI StoryBit_ContractExplorationAccess description]] "Generates Funding by doing on-site research for third-party contractors."),
	display_icon = "UI/Icons/pm_ launch_seti_satellite.tga",
	display_name = T(857386809253, --[[POI StoryBit_ContractExplorationAccess display_name]] "Contract Exploration Access"),
	expedition_time = 3000000,
	first_spawn_location = "near",
	group = "Default",
	id = "StoryBit_ContractExplorationAccess",
	is_orbital = false,
	max_projects_of_type = 1,
	rocket_required_resources = {
		PlaceObj('ResourceAmount', {
			'resource', "Fuel",
			'amount', 100000,
		}),
		PlaceObj('ResourceAmount', {
			'resource', "Polymers",
			'amount', 30000,
		}),
	},
	spawn_period = range(20, 40),
	start_disabled = true,
	terraforming_changes = {},
})

