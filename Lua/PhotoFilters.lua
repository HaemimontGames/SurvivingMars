local function folder_fn(obj)
	return obj.mod.content_path
end

-- Note: PhotoFilter mods are now deprecated.
DefineModItemPreset("PhotoFilterPreset", {
	properties = {
		{ category = "General", id = "filename",  name = T{3439, "Shader Filename"}, editor = "browse", os_path = true, filter = "FX files|*.fx",     default = "", folder = folder_fn },
		{ category = "General", id = "texture1", name = T{3441, "Texture1"},         editor = "browse", os_path = true, filter = "Image files|*.tga", default = "", folder = folder_fn },
		{ category = "General", id = "texture2", name = T{3443, "Texture2"},         editor = "browse", os_path = true, filter = "Image files|*.tga", default = "", folder = folder_fn },
	},
	EditorMenubarName = "",
	EditorName = "",
})

function ModItemPhotoFilterPreset:TestModItem(ged)
	local desc = self:GetShaderDescriptor()
	
	if not g_PhotoFilter or g_PhotoFilter.shader ~= desc.shader_name or g_PhotoFilter.pass ~= desc.shader_pass then
		self:OnModLoad()
		g_PhotoFilter = desc
	else
		g_PhotoFilter = false
	end
	PP_Rebuild()
end

------------------------------------------------------------

DefineClass.ModItemPhotoFilter = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "display_name", name = T{1000037, "Name"},             editor = "text", default = "", translate = true },
		{ category = "General", id = "desc",         name = T{1000017, "Description"},      editor = "text", default = "", translate = true },
		{ category = "General", id = "filename",     name = T{3439, "Shader Filename"},     editor = "browse", os_path = true, filter = "FX files|*.fx",     default = "", folder = folder_fn },
		{ category = "General", id = "texture_1",    name = T{3441, "Texture1"},            editor = "browse", os_path = true, filter = "Image files|*.tga", default = "", folder = folder_fn },
		{ category = "General", id = "texture_2",    name = T{3443, "Texture2"},            editor = "browse", os_path = true, filter = "Image files|*.tga", default = "", folder = folder_fn },
		{ category = "General", id = "activate",     name = T{8074, "Run on activation"},   editor = "func", params = "filter, data", default = function() end },
		{ category = "General", id = "deactivate",   name = T{8075, "Run on deactivation"}, editor = "func", params = "filter, data", default = function() end },
	},
	EditorMenubarName = "",
	EditorName = "",
}

function ModItemPhotoFilter:OnModLoad()
	local mod = self.mod
	local new = ModItemPhotoFilterPreset:new{
		id = self.name,
		displayName = self.display_name,
		desc = self.desc,
		filename = self.filename,
		texture1 = self.texture_1,
		texture2 = self.texture_2,
		activate = self.activate ~= ModItemPhotoFilter.activate and self.activate or nil,
		deactivate = self.deactivate ~= ModItemPhotoFilter.deactivate and self.deactivate or nil,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end

function ModItemPhotoFilterPreset:OnModLoad()
	ModLog(T{10401, "Warning: photofilter mods are deprecated."})
	ModItemPreset.OnModLoad(self)
end