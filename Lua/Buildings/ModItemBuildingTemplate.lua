----- ModItemBuildingTemplate

DefineModItemDataInstance("BuildingTemplate", {})

function ModItemBuildingTemplate:PostLoad(...)
	BuildingTemplate.PostLoad(self, ...)
	ModItemDataInstance.PostLoad(self, ...)
end

function ModItemBuildingTemplate:OnEditorSetProperty(prop_id, old_value, ged)
	ModItemDataInstance.OnEditorSetProperty(self, prop_id, old_value, ged)
	BuildingTemplate.OnEditorSetProperty(self, prop_id, old_value, ged)
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
	
	local folder_attribute = { { self.mod.path, os_path = true }, { "UI", game_path = true } }
	
	local properties = table.copy(BuildingTemplate.GetProperties(self), "deep")
	for i,prop in ipairs(properties) do
		if override_browse_properties[prop.id] then
			prop.os_path = true
			prop.folder = folder_attribute
			prop.filter = "Image files|*.tga"
		end
	end
	
	return properties
end
