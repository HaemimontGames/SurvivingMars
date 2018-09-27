local function folder_fn(obj)
	return {
		{ obj.mod.content_path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineModItemPreset("CropPreset", {
	properties = {
		{ id = "icon", name = T{94, "Icon"}, editor = "browse", default = "UI/Icons/Buildings/crops_empty.tga", help = "Food Game Icon", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
	},
	EditorName = "Crop",
})

if FirstLoad then
	CropGrowthSequences = {
		__fallback = {
			initial = { "idle", "idle2", "idle3", "idle4" },
			repeating = { "idle", "idle2", "idle3", "idle4" },
		},
	}
end

local function GenerateCropGrowthSequences(crop)
	CropGrowthSequences = {
		__fallback = {
			initial = { "idle", "idle2", "idle3", "idle4" },
			repeating = { "idle", "idle2", "idle3", "idle4" },
		},
	}
	
	ForEachPreset(CropPreset, function(crop)
		local init_seq, rep_seq
		init_seq = string.split(crop.InitialGrowthSequence, "[^%w]+")
		rep_seq = string.split(crop.GrowthSequence, "[^%w]+")
		if #init_seq == 0 or init_seq[1] == "" then
			init_seq = CropGrowthSequences.__fallback.initial
		end
		if #rep_seq == 0 or rep_seq[1] == "" then
			rep_seq = CropGrowthSequences.__fallback.repeating
		end
		CropGrowthSequences[crop.id] = { initial = init_seq, repeating = rep_seq }
	end)
end

OnMsg.DataLoaded = GenerateCropGrowthSequences
OnMsg.ModsReloaded = GenerateCropGrowthSequences


local function LockDefaultLockedCrops()
	ForEachPreset(CropPreset, function(crop)
		if crop.Locked then
			LockCrop(crop.id, "default")
		end
	end)
end

OnMsg.CityStart = LockDefaultLockedCrops

GlobalVar("CropTechLocks", {})

--[[@@@
	Locks a crop from the crop selector. Once locked a crop will no longer be selectable for current and future farms until unlocked. Already selected crops are unaffected.

	@function void Gameplay@LockCrop(string crop_name, string lock_id)
	@param string crop_name - The template name of the crop to be locked.
	@param string lock_id - Lock id of the lock. For a crop to be unlocked all unique locks must be removed.
	@result void
]]
function LockCrop(crop, lock_id)
	local locks = CropTechLocks[crop] or {}
	CropTechLocks[crop] = locks
	locks[lock_id] = true
end

--[[@@@
	Removes a lock or all locks from a crop. Unlocked crops will appear in the farm crop selector of all current and future farms.

	@function void Gameplay@UnlockCrop(string crop_name[, string lock_id])
	@param string crop_name - The template name of the crop to be unlocked.
	@param string lock_id - Optional. Lock id of the lock. For a crop to be unlocked all unique locks must be removed. If omitted all locks for the relevant crop will be removed.
	@result void
]]
function UnlockCrop(crop, lock_id)
	if not lock_id then
		CropTechLocks[crop or false] = nil
	else
		local locks = CropTechLocks[crop or false]
		if locks then
			locks[lock_id] = nil
			if next(locks) == nil then
				CropTechLocks[crop or false] = nil
			end
		end
	end
end

--[[@@@
	Tests crop lock state controlled by LockCrop and UnlockCrop functions.

	@function bool ret Gameplay@IsCropAvailable(string crop_name)
	@param string crop_name - The template name of the crop.
	@result bool ret - Whether the crop is unlocked.
]]
function IsCropAvailable(crop)
	if type(crop) == "table" then
		crop = crop.id
	end
	
	return not CropTechLocks[crop]
end


--[[
function IsCropAvailable(crop)
	if not UICity then
		return false
	end
	local tech_t = CropTechRequirements[crop.id] or ""
	for i = 1, #tech_t do
		if not UICity:IsTechResearched(tech_t[i]) then
			return false
		end
	end
	return true
end--]]

DefineClass.ModItemCrop = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ id = "name", name = T{1000037, "Name"}, editor = "text" },
		{ id = "DisplayName", name = T{1000067, "Display Name"}, editor = "text", translate = true, default = "" },
		{ id = "DisplayNamePlural", name = T{918, "Display Name (plural)"}, editor = "text", translate = true, default = "" },
		{ id = "Desc", name = T{1000017, "Description"}, editor = "text", translate = true, default = "" },
		{ id = "icon", name = T{94, "Icon"}, editor = "browse", folder = "UI", default = "UI/Icons/Buildings/crops_empty.tga", help = "Food Game Icon" },
		{ id = "FoodOutput", name = T{919, "Food Output"}, editor = "number", default = 1*const.ResourceScale, scale = const.ResourceScale },
		{ id = "ResourceType", name = T{8055, "ResourceType"}, editor = "dropdownlist", default = "Food", items = ResourcesDropDownListItems,},
		{ id = "Locked", name = T{8056, "Locked"}, editor = "bool", default = false, help = "Lock this crop regardless of tech that unlocks it. Lock key is 'default'.",},
		{ id = "InitialGrowthTime", name = T{921, "Initial Growth Time"}, editor = "number", default = 4*const.DayDuration, scale = const.HourDuration },
		{ id = "InitialGrowthSequence", name = T{7636, "Initial Growth Sequence"}, editor = "text", default = "", help = "Comma-separated state list, leave blank to use default sequence" },
		{ id = "GrowthTime", name = T{920, "Growth Time"}, editor = "number", default = 4*const.DayDuration, scale = const.HourDuration },
		{ id = "GrowthSequence", name = T{7637, "Growth Sequence"}, editor = "text", default = "", help = "Comma-separated state list, leave blank to use default sequence" },
		{ id = "WaterDemand", name = T{922, "Water Demand"}, editor = "number", default = 1*const.ResourceScale, scale = const.ResourceScale },
		{ id = "OxygenProduction", name = T{923, "Oxygen Production"}, editor = "number", default = 1*const.ResourceScale, scale = const.ResourceScale },
		{ id = "SoilDemand", name = T{924, "Soil Demand"}, editor = "number", default = 0 },
		{ id = "SoilEffect", name = T{925, "Soil Effect"}, editor = "number", default = 0 },
		{ id = "SoilQualityMin", name = T{926, "Soil Quality Min"}, editor = "number", default = 0 },
		{ id = "SoilQualityMax", name = T{927, "Soil Quality Max"}, editor = "number", default = 100 },
		{ id = "FarmClass", name = T{928, "Farm Class"}, editor = "dropdownlist", items = function() return ClassDescendantsCombo("Farm") end, default = "" },
		{ id = "CropEntity", name = T{155, "Entity"}, editor = "dropdownlist", items = function() return GetCropEntities("") end, default = ""},
		{ id = "Priority", name = T{172, "Priority"}, editor = "number", default = 0},
		{ id = "OnProduce", name = T{929, "Produce"}, editor = "func", params = "dome, farm, amount", default = false },
		{ id = "modify_target", name = T{930, "Modifier target"}, editor = "combo", items = { "", "dome", "farm", "dome buildings", "dome colonists" }, default = "" },
		{ id = "modify_property", name = T{931, "Modified property"}, editor = "combo", items = ModifiablePropsCombo, default = "" },
		{ id = "modify_amount", name = T{932, "Modification amount"}, editor = "number", default = 0,},
		{ id = "modify_percent", name = T{933, "Modification percent"}, editor = "number", default = 0,},
	},
	EditorMenubarName = "",
}

function ModItemCrop:OnModLoad()
	local mod = self.mod
	local new = ModItemCropPreset:new{
		id = self.name,
		SortKey = 100100 - self.Priority * 10,
		DisplayName = self.DisplayName,
		DisplayNamePlural = self.DisplayNamePlural,
		Desc = self.Desc,
		icon = self.icon,
		FoodOutput = self.FoodOutput,
		ResourceType = self.ResourceType,
		Locked = self.Locked,
		InitialGrowthTime = self.InitialGrowthTime,
		InitialGrowthSequence = self.InitialGrowthSequence,
		GrowthTime = self.GrowthTime,
		GrowthSequence = self.GrowthSequence,
		WaterDemand = self.WaterDemand,
		OxygenProduction = self.OxygenProduction,
		SoilEffect = self.SoilEffect,
		SoilQualityMin = self.SoilQualityMin,
		SoilQualityMax = self.SoilQualityMax,
		FarmClass = self.FarmClass,
		CropEntity = self.CropEntity,
		OnProduce = self.OnProduce,
		modify_target = self.modify_target,
		modify_property = self.modify_property,
		modify_amount = self.modify_amount,
		modify_percent = self.modify_percent,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end
