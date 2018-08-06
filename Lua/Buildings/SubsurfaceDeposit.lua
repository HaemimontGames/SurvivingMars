SubSurfaceDeposits = { "Metals", "Water", "PreciousMetals" }
for i=1,#SubSurfaceDeposits do
	SubSurfaceDeposits[SubSurfaceDeposits[i]] = true
end

DepositGradesTable = {
	"Very Low",
	"Low",
	"Average",
	"High",
	"Very High",
}

local DepositGradeToMultiplier = {
	["Depleted"]  = 15,	-- used by Nano Refinement tech
	["Very Low"]  = 60,
	["Low"]       = 80,
	["Average"]   = 100,
	["High"]      = 120,
	["Very High"] = 140,
}
function GetDepositGradeToMultiplier(grade)
	return DepositGradeToMultiplier[grade]
end

DepositGradeToDisplayName = {
	["Depleted"]  = T{778, "Depleted"},
	["Very Low"]  = T{779, "Very low"},
	["Low"]       = T{644, "Low"},
	["Average"]   = T{780, "Average"},
	["High"]      = T{7358, "High"},
	["Very High"] = T{781, "Very high"},
}

local DepthLayerToMetersMinMax = {
	{100,  1000},
	{1001, 2000},
	{2001, 3000},
	{3001, 4000},
	{4001, 15000},
}
-------------------------------------------------------------

DefineClass.SubsurfaceDepositMarker = {
	__parents = { "DepositMarker" },
	properties = {
		{ category = "Deposit", name = T{15, "Resource"},    id = "resource",    editor = "combo",        default = "Metals", items = SubSurfaceDeposits },
		{ category = "Deposit", name = T{782, "Max amount"},  id = "max_amount",  editor = "number",       default = 50000, scale = const.ResourceScale},	 --quantity
		{ category = "Deposit", name = T{16, "Grade"},       id = "grade",       editor = "dropdownlist", default = "Average", items = DepositGradesTable}, --grade
		{ category = "Deposit", name = T{6, "Depth Layer"}, id = "depth_layer", editor = "number",       default = 1, min = 1, max = const.DepositDeepestLayer}, --depth layer
		{ category = "Deposit", name = T{7, "Is Revealed"}, id = "revealed",    editor = "bool",         default = false }, 
	},
}

function SubsurfaceDepositMarker:GetDepthClass()
	return self.depth_layer <= 1 and "subsurface" or "deep"
end

function SubsurfaceDepositMarker:GetEstimatedAmount()
	return self.max_amount
end

function SubsurfaceDepositMarker:OnPropertyChanged(prop_id)
	if prop_id == "resource" then
		self:PostLoad()
	end
end

function SubsurfaceDepositMarker:PostLoad()
	self:SetColorModifier(Resources[self.resource].color)
	if TerrainDeposits[self.resource] then
		self:ClearGameFlags(const.gofPermanent)
		local obj = PlaceObject("TerrainDepositMarker", {resource = self.resource})
		obj:SetPos(self:GetPos())
		obj:SetGameFlags(const.gofPermanent)
		obj.max_amount = MulDivRound(obj.max_amount, DepositGradeToMultiplier[self.grade], 100)
		StoreErrorSource("silent", obj, "Replacing a subsurface deposit", self.resource)
	end
end

function SubsurfaceDepositMarker:SpawnDeposit()
	if not SubSurfaceDeposits[self.resource] then
		return
	end
	local deposit = PlaceObject("SubsurfaceDeposit" .. self.resource, {
		max_amount = self.max_amount, 
		grade = self.grade,
		revealed = self.revealed,
		marker = self,
	})
	deposit:SetProperty("depth_layer", self.depth_layer) --bug:0121131
	return deposit
end

-- stub class to keep track whether an obj is revealed by the player as a class component.
-- currently does nothing
DefineClass.ExplorableObject = {
	__parents = { "SyncObject", },
	properties = {
		{ name = T{7, "Is Revealed"}, id = "revealed", editor = "bool" }, -- so it gets saved..
	},
	
	revealed = false,
}

function ExplorableObject:GameInit()
	if self.revealed then
		--if we start revealed, provoke callbacks
		self.revealed = false
		self:SetRevealed(true)
	end
end

function ExplorableObject:IsRevealed()
	return self.revealed
end

function ExplorableObject:Setrevealed(val)
	self:SetRevealed(val)
end

function ExplorableObject:SetRevealed(val)
	if val ~= self.revealed then
		self.revealed = val
		self:OnRevealedValueChanged()
		PlayFX("Revealed", val and "true" or "false", self)
	end
end

function ExplorableObject:OnRevealedValueChanged()
end

GlobalVar("g_SubsurfaceDepositsVisible", true)

DefineClass.SubsurfaceDepositConstructionRevealer =
{
	subsurface_deposit_class = false,
}

function SubsurfaceDepositConstructionRevealer:Reveal()
	SetSubsurfaceDepositsVisible(self.subsurface_deposit_class)
end

function SubsurfaceDepositConstructionRevealer:Hide()
	SetSubsurfaceDepositsVisible(GetInGameInterfaceMode() == "overview")
end

function SetSubsurfaceDepositsVisible(visible)
	if not UICity or g_SubsurfaceDepositsVisible == visible then return end
	
	g_SubsurfaceDepositsVisible = true
	for _, deposit in ipairs(UICity.labels.SubsurfaceDeposit or {}) do
		deposit:PickVisibilityState()
	end
	for _, anomaly in ipairs(UICity.labels.Anomaly or {}) do
		anomaly:PickVisibilityState()
	end
end

function SetSubsurfaceDepositsVisibleExpiration(expiration)
	if not UICity then return end
	
	for _, deposit in ipairs(UICity.labels.SubsurfaceDeposit or {}) do
		deposit:SetVisibilityExpiration(expiration)
	end
	for _, anomaly in ipairs(UICity.labels.Anomaly or {}) do
		anomaly:SetVisibilityExpiration(expiration)
	end
end

----------------------SubsurfaceDeposit-------------------------------------------------

local DeepResourceEnableFlags = {
	Water = "IsDeepWaterExploitable",
	Metals = "IsDeepMetalsExploitable",
	PreciousMetals = "IsDeepPreciousMetalsExploitable",
}

function IsDeepExploitable(res)
	local flag_name = DeepResourceEnableFlags[res]
	return not flag_name or g_Consts[flag_name] ~= 0
end

DefineClass.SubsurfaceDeposit = {
	__parents = { "PropertyObject", "ExplorableObject", "Deposit"},
	enum_flags = { efVisible = false, efWalkable = false, efCollision = false, efApplyToGrids = false, efShadow = false, efSunShadow = false },
	game_flags = { gofRealTimeAnim = true },
	class_flags = { cfConstructible = false },
	properties = {
		{ category = "Deposit", name = T{782, "Max amount"},  id = "max_amount",  editor = "number",       default = 50000, scale = const.ResourceScale},	 --quantity
		{ category = "Deposit", name = T{16, "Grade"},       id = "grade",       editor = "dropdownlist", default = "Average", items = DepositGradesTable}, --grade
		{ category = "Deposit", name = T{6, "Depth Layer"}, id = "depth_layer", editor = "number",       default = 1, min = 1, max = const.DepositDeepestLayer}, --depth layer
	},
	
	
	vis_exp = false,
	--ui
	display_name = T{783, "Deep <resource(resource)>"},
	display_icon = "UI/Icons/Buildings/drone.tga",
	amount = 0,
	
	-- pin section
	pin_rollover = T{784, "<Description><newline><newline><ResourceName><right><resource(amount,max_amount,resource)><newline><left>Grade<right><grade_name>"},
	pin_progress_value = "amount",
	pin_progress_max = "max_amount",
	
	city_label = "SubsurfaceDeposit",
	ip_template = "ipSubsurfaceDeposit",
}

GlobalVar( "g_CurrentDepositScale", const.SignsOverviewCameraScaleDown )
function SubsurfaceDeposit:Init()
	self.amount = self.max_amount
end

function SubsurfaceDeposit:GameInit()
	if self:IsValidZ() then
		self:SetPos(self:GetPos():SetInvalidZ())
	end
	self:SetScale(g_CurrentDepositScale)
	self:UpdateEntity()
	self:PickVisibilityState()
end

function SubsurfaceDeposit:PickVisibilityState()
	local filter = g_SubsurfaceDepositsVisible == true
	self:SetVisible(not IsEditorActive() and (filter or self.vis_exp) and self.revealed and g_SignsVisible and g_ResourceIconsVisible)
end

GlobalVar("g_RecentlyRevDeposits", {})
GlobalGameTimeThread("RecentlyRevDepositsNotif", function()
	HandleNewObjsNotif(g_RecentlyRevDeposits, "NewDeposits", "expire")
end)

function SubsurfaceDeposit:OnReveal()
	g_RecentlyRevDeposits[#g_RecentlyRevDeposits + 1] = self
	--[[
	print("--DEPOSIT REVEALED--")
	print("")
	print("Subsurface Deposit:")
	print(" Max Amount", self.max_amount)
	print(" Amount Left", self.amount)
	print(" Grade", self.grade)
	print(" Resource", Resources[self.resource].display_name)
	print(" Depth(Layer)", self.depth_layer)
	--]]
end

-- refill cheat
function SubsurfaceDeposit:CheatRefill()
	self.amount = self.max_amount
	self:NotifyNearbyExploiters()
end

function SubsurfaceDeposit:CheatEmpty()
	self.amount = 0
	self:NotifyNearbyExploiters(
		function(o)
			o:OnChangeActiveDeposit()
		end)
	if SelectedObj==self then
		SelectObj(false)
	end
	self:OnDepleted()
end

function SubsurfaceDeposit:IsDepleted()
	return self.amount<=0
end

function SubsurfaceDeposit:GetDepth()
	return self.depth_layer
end

function SubsurfaceDeposit:OnDepleted()
	Msg("DepositDepleted", self)
	if IsValid(self) then
		DoneObject(self)
	end
end

function SubsurfaceDeposit:TakeAmount(amount)
	amount = Min(amount, self.amount)
	self.amount = self.amount - amount
	
	if self:IsDepleted() then
		self:OnDepleted()
	end
	Msg("DeepDepositExtraction", amount, self.resource)
	return amount
end

function SubsurfaceDeposit:GetAmount()
	return self.amount
end

function SubsurfaceDeposit:PickVisibilityState()
	local filter = g_SubsurfaceDepositsVisible == true or g_SubsurfaceDepositsVisible == self.class
	self:SetVisible(IsEditorActive() or ((filter or self.vis_exp) and self.revealed and not self:IsDepleted()) and g_SignsVisible and g_ResourceIconsVisible)
end

function SubsurfaceDeposit:SetVisibilityExpiration(expiration)
	DeleteThread(self.vis_exp)
	self.vis_exp = CreateGameTimeThread(function()
		Sleep(expiration)
		if IsValid(self) then
			self.vis_exp = false
			self:PickVisibilityState()
		end
	end)
	self:PickVisibilityState()
end

function SubsurfaceDeposit:IsExploitableBy(exploiter)
	--deep deposit can locked per resource type
	local enabled = self.depth_layer < 2 or IsDeepExploitable(self.resource)
	
	return Deposit.IsExploitableBy(self, exploiter) and 
				enabled and self.revealed and 
				HexAxialDistance(self, exploiter) <= exploiter.exploitation_radius
end

function SubsurfaceDeposit:OnRevealedValueChanged()
	self:PickVisibilityState()
	self:NotifyNearbyExploiters()
	if self.revealed then
		Msg("SubsurfaceDepositRevealed", self)
	end
end

function SubsurfaceDeposit:GetQualityMultiplier()
	return DepositGradeToMultiplier[self.grade]
end

SubsurfaceDeposit.EditorEnter = SubsurfaceDeposit.PickVisibilityState
SubsurfaceDeposit.EditorExit = SubsurfaceDeposit.PickVisibilityState

function SubsurfaceDeposit:Setdepth_layer(depth)
	if depth >= 1 and depth <= const.DepositDeepestLayer then
		self.depth_layer = depth
	end
end

function SubsurfaceDeposit:GetDisplayName()
	return self.depth_layer >= 2 and self.display_name_deep or self.display_name
end

function SubsurfaceDeposit:GetDescription()
	return self.depth_layer >= 2 and self.description_deep or self.description
end

function SubsurfaceDeposit:Setmax_amount(val)
	self.max_amount = val
end

function SubsurfaceDeposit:Getgrade_name() return DepositGradeToDisplayName[self.grade] end

function SubsurfaceDeposit:NotifyNearbyExploiters(fn)
	local deposit_func = function(o, self)
		o:StartExploit(self)
	end
	if fn then 
		deposit_func = fn
	end
	MapForEach(self, "hex", const.RangeToCheckForExploitersOnDepositReveal,"BuildingDepositExploiterComponent", deposit_func, self )
end

function SubsurfaceDeposit:UpdateEntity()
	local classdef = g_Classes[self.class]
	local ent = (self:GetDepth() < 2 or IsDeepExploitable(self.resource)) and classdef.entity or classdef.disabled_entity	
	self:ChangeEntity(ent)
end
----

DefineClass("SubsurfaceDepositMetals",
{ __parents = {"SubsurfaceDeposit"},
	resource = "Metals",
	entity = "SignMetalsDeposit",
	disabled_entity = "SignUnexploitableMetal",
	display_icon = "UI/Icons/Buildings/deposit_subsurface_metals.tga",
	--name and description is reassigned when setting a new 'depth_layer' (see SubsurfaceDeposit:Setdepth_layer)
	display_name = T{791, "Underground Metals"},
	description = T{792, "An underground deposit of Metals. Can be exploited by a <em>Metals Extractor</em> staffed by <em>Colonists</em>."},
	display_name_deep = T{793, "Deep Metals"},
	description_deep = T{794, "A deep underground deposit of Metals. Can be exploited by a <em>Metals Extractor</em> staffed by <em>Colonists</em>."}
})

DefineClass("SubsurfaceDepositWater",
{ __parents = {"SubsurfaceDeposit"},
	resource = "Water",
	entity = "SignWaterDeposit",
	disabled_entity = "SignUnexploitableWater",
	display_icon = "UI/Icons/Buildings/deposit_water.tga",
	--name and description is reassigned when setting a new 'depth_layer' (see SubsurfaceDeposit:Setdepth_layer)
	display_name = T{795, "Underground Water"},
	description = T{796, "An underground deposit of Water. Can be exploited by a <em>Water Extractor</em>."},
	display_name_deep = T{797, "Deep Water"},
	description_deep = T{798, "Deep underground deposit of Water. Can be exploited by a <em>Water Extractor</em>."},
})

DefineClass("SubsurfaceDepositPreciousMetals",
{ __parents = {"SubsurfaceDeposit"},
	resource = "PreciousMetals",
	entity = "SignPreciousMetalsDeposit",
	disabled_entity = "SignUnexploitablePreciousMetals",
	display_icon = "UI/Icons/Buildings/deposit_rare_metals.tga",
	--name and description is reassigned when setting a new 'depth_layer' (see SubsurfaceDeposit:Setdepth_layer)
	display_name = T{799, "Underground Rare Metals"},
	description = T{800, "An underground deposit of Rare Metals. Can be exploited by a <em>Rare Metals Extractor</em> staffed by <em>Colonists</em>."},
	display_name_deep = T{801, "Deep Rare Metals"},
	description_deep = T{802, "Deep underground deposit of Rare Metals. Can be exploited by a <em>Rare Metals Extractor</em> staffed by <em>Colonists</em>."},
})

function OnMsg.GatherFXTargets(list)
	list[#list + 1] = "ExplorableObject"
	list[#list + 1] = "SubsurfaceDeposit"
end

function OnMsg.ConstValueChanged(prop, old_value, new_value)
	if prop == "IsDeepMetalsExploitable" or prop == "IsDeepWaterExploitable" or prop == "IsDeepPreciousMetalsExploitable" then
		old_value = old_value == 0 and 0 or 1
		new_value = new_value == 0 and 0 or 1
		if old_value ~= new_value then
			MapForEach("map",
				"SubsurfaceDeposit",
				function(obj)
					obj:UpdateEntity()
				end)
		end
	end
end