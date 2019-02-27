----- ModItemBuildingTemplate

DefineModItemPreset("BuildingTemplate", {
	StoreAsTable = false,
	GedEditor = false,
	EditorName = "BuildingTemplate",
})

function ModItemBuildingTemplate:NamesCombo()
	return table.keys2(BuildingTemplates, true)
end

-- backward compatibility for old ModItemBuildingTemplate objects that derive from DataInstance
function ModItemBuildingTemplate:PostLoad(...)
	if (self.name or "") ~= "" then self:SetId(self.name) end
	local build_category = rawget(self, "build_category")
	if build_category then
		self:SetGroup(build_category)
	end
	BuildingTemplate.PostLoad(self, ...)
end

local override_browse_properties = {
	display_icon = true,
	upgrade1_icon = true,
	upgrade2_icon = true,
	upgrade3_icon = true,
	encyclopedia_image = true,
}
function ModItemBuildingTemplate:GetProperties()
	if not self.mod then
		return BuildingTemplate.GetProperties(self)
	end
	
	local folder_attribute = { { self.mod.content_path, os_path = true }, { "UI", game_path = true } }
	
	local properties = table.copy(BuildingTemplate.GetProperties(self), "deep")
	for i,prop in ipairs(properties) do
		if override_browse_properties[prop.id] then
			prop.os_path = true
			prop.folder = folder_attribute
			prop.filter = "Image files|*.png;*.tga"
		end
	end
	
	return properties
end
