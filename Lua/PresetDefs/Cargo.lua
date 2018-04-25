-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

DefineClass.Cargo = {
	__parents = { "Preset", },
	properties = {
		{ id = "name", name = T{1153, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "price", name = T{8675, "Price (M)"}, 
			editor = "number", default = 100000000, scale = "mil", step = 10000000, min = 0, },
		{ id = "pack", name = T{8676, "Pack"}, 
			editor = "number", default = 1, min = 1, },
		{ id = "kg", name = T{8677, "Weight (kg)"}, 
			editor = "number", default = 1000, min = 0, },
		{ id = "locked", name = T{8056, "Locked"}, 
			editor = "bool", default = false, },
		{ id = "icon", name = T{94, "Icon"}, 
			editor = "browse", default = false, folder = "UI", },
		{ id = "preview", name = T{1000043, "Preview"}, 
			editor = "image", default = false, dont_save = true, img_size = 200, },
	},
	HasSortKey = true,
	GlobalMap = "CargoPreset",
	mod_price = 100,
	mod_weight = 100,
	submenu = false,
	filter = false,
}

function Cargo:Getpreview()
	return self.icon
end

function Cargo:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Id" then
		self.name, self.description = ResolveDisplayName(self.id)
	end
	Preset.OnEditorSetProperty(self, prop_id, old_value, ged)
end
