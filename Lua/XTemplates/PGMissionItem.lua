-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "PGMissionItem",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.item_type ~= "idGameRules" and context.item_type ~= "idMystery" end,
		'__template', "MenuEntrySmall",
		'RolloverTemplate', "Rollover",
		'OnPress', function (self, gamepad)
local prop_meta = GetDialogModeParam(self)
local obj = GetDialogContext(self)
local new_val = self.context.value
local prop_val = new_val
local prop_id = prop_meta.id
local change_mission_sponsor = prop_id == "idMissionSponsor" and obj:GetProperty("idMissionSponsor") ~= new_val
if change_mission_sponsor then
	ResetCargo()
	if new_val == "random" then
		new_val = GetRandomMissionParam("idMissionSponsor")
		random_mission_params.idMissionSponsor = true
	else
		random_mission_params.idMissionSponsor = false
		if not g_CurrentMissionParams.manual_logo_change then
			local logo = GetDefaultMissionSponsorLogo(new_val)
			g_CurrentMissionParams.idMissionLogo = logo or g_CurrentMissionParams.idMissionLogo
			SetProperty(obj, "idMissionLogo", g_CurrentMissionParams.idMissionLogo)
		end
	end
elseif prop_id == "idMissionSponsor" then
	new_val = g_CurrentMissionParams[prop_id]
end
if prop_id == "idCommanderProfile" and obj:GetProperty("idCommanderProfile") ~= new_val and new_val == "random" then
	new_val = GetRandomMissionParam("idCommanderProfile")
	random_mission_params.idCommanderProfile = true
elseif prop_id == "idCommanderProfile" and new_val == "random" then
	new_val = g_CurrentMissionParams[prop_id]
elseif prop_id == "idCommanderProfile" then
	random_mission_params.idCommanderProfile = false
elseif prop_id == "idMissionLogo" then
	g_CurrentMissionParams.manual_logo_change = true
end
SetProperty(obj, prop_id, prop_val)
g_CurrentMissionParams[prop_id] = new_val
ObjModified(obj)
if change_mission_sponsor then
	g_CurrentMapParams.rocket_name, g_CurrentMapParams.rocket_name_base = GenerateRocketName(true)
	RocketPayload_Init() -- recalc resupply defs
end
SetBackDialogMode(self)
end,
		'Text', T(714247552511, --[[XTemplate PGMissionItem Text]] "<text>"),
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.item_type == "idMystery" end,
		'__template', "MysteryItem",
	}),
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context.item_type == "idGameRules" end,
		'__template', "GameRuleItem",
	}),
})

