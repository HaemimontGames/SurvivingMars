-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

DefineClass.PhotoFilterPreset = {
	__parents = { "Preset" },
	properties = {
		{ category = "General", id = "displayName", name = T{760118243448, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "desc", name = T{403751625893, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "filename", name = T{472842319142, "Shader Filename"}, 
			editor = "browse", default = "", filter = "FX files|*.fx", },
		{ category = "General", id = "texture1", name = T{252226363141, "Texture 1"}, 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "texture2", name = T{663906214435, "Texture 2"}, 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "activate", name = T{644657883672, "Run on activation"}, 
			editor = "func", default = false, },
		{ category = "General", id = "deactivate", name = T{577461898820, "Run on deactivation"}, 
			editor = "func", default = false, },
	},
	HasSortKey = true,
	GlobalMap = "PhotoFilterPresetMap",
	
}

function PhotoFilterPreset:GetShaderDescriptor()
	local shader_name = self.filename
	local shader_pass = "Generic"
	
	local vbar_idx = string.find(shader_name, "|")
	if vbar_idx then
		shader_name = string.sub(self.filename, 1, vbar_idx - 1)
		shader_pass = string.sub(self.filename, vbar_idx + 1)
	end
	
	return {
		shader = shader_name,
		pass = shader_pass,
		tex1 = self.texture1,
		tex2 = self.texture2,
		activate = self.activate,
		deactivate = self.deactivate,
	}
end
