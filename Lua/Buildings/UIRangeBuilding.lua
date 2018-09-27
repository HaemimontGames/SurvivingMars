DefineClass.UIRangeBuilding =
{
	__parents = { "Building" },
	
	properties =
	{
		-- prop only for UI purposes
		{id = "UIRange", name = T{643, "Range"}, editor = "number", default = 3, min = 3, max = 8, no_edit = true, dont_save = true},
	},
	
	incoming_range = false,
	UIRange = 3,
}

if FirstLoad then
UIRangeUpdateThread = false
end

function UIRangeBuilding:SetUIRange(value)
	if self == SelectedObj and value ~= self.UIRange then
		PlayFX("Select", "end", self)
		self.incoming_range = value
		PlayFX("Select", "start", self)
		--play sound
		PlayFX("RangeChange", "end", self)
		DelayedCall(100, PlayFX, "RangeChange", "start", self)
		local rxs = g_HexRanges[self] or empty_table
		for _, range in ipairs(rxs) do
			range:SetScale(value)
		end
		
		DeleteThread(UIRangeUpdateThread)
		UIRangeUpdateThread = CreateMapRealTimeThread(function(self)
			Sleep(100)		-- wait for the user to finish UI manipulation
			self:OnPreChangeRange(value)
			self.UIRange = value
			self.incoming_range = false
			self:OnPostChangeRange()
			UIRangeUpdateThread = false
		end, self)
	end
end

function UIRangeBuilding:GetUIRange(value)
	return self.incoming_range or self.UIRange
end

function UIRangeBuilding:GetSelectionRadiusScale()
	return self.incoming_range or self.UIRange
end

function UIRangeBuilding:OnPreChangeRange()
end

function UIRangeBuilding:OnPostChangeRange()
end

function UIRangeBuilding:GetRangeBuildings()
	return false
end

--If you want someone to use terrain distored mesh, please make him heir to this class for LogGameShader purposes
DefineClass.TerrainDistortedMesh = 
{
	__parents = { "CObject" },
	game_flags = { gofTerrainDistortedMesh = true },
}

DefineClass.RangeRadius =
{
	__parents = { "TerrainDistortedMesh" },
	entity = "RangeRadius_01",
	class_flags = { cfConstructible = false },
	game_flags = { gofTerrainDistortedMesh = true, gofAlwaysRenderable = true },
	enum_flags = { efSelectable = false },
	ScaleMember = "GetSelectionRadiusScale",
}
