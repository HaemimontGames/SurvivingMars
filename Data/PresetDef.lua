-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('PresetDef', {
	AdditionalClassCode = "mod_price = 100,\r\n	mod_weight = 100,\r\n	submenu = false,\r\n	filter = false,",
	AdditionalCode = 'function Cargo:Getpreview()\r\n	return self.icon\r\nend\r\n\r\nfunction Cargo:OnEditorSetProperty(prop_id, old_value, ged)\r\n	if prop_id == "Id" then\r\n		self.name, self.description = ResolveDisplayName(self.id)\r\n	end\r\n	Preset.OnEditorSetProperty(self, prop_id, old_value, ged)\r\nend',
	DefGlobalMap = "CargoPreset",
	DefHasSortKey = true,
	group = "Default",
	id = "Cargo",
	PlaceObj('PropertyDef', {
		'id', "name",
		'name', T{1153, --[[PresetDef Cargo name]] "Display Name"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'id', "description",
		'name', T{1000017, --[[PresetDef Cargo name]] "Description"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'id', "price",
		'name', T{8675, --[[PresetDef Cargo name]] "Price (M)"},
		'editor', "number",
		'default', 100000000,
		'scale', "mil",
		'min', 0,
		'step', 10000000,
	}),
	PlaceObj('PropertyDef', {
		'id', "pack",
		'name', T{8676, --[[PresetDef Cargo name]] "Pack"},
		'editor', "number",
		'default', 1,
		'min', 1,
	}),
	PlaceObj('PropertyDef', {
		'id', "kg",
		'name', T{8677, --[[PresetDef Cargo name]] "Weight (kg)"},
		'editor', "number",
		'default', 1000,
		'min', 0,
	}),
	PlaceObj('PropertyDef', {
		'id', "locked",
		'name', T{8056, --[[PresetDef Cargo name]] "Locked"},
	}),
	PlaceObj('PropertyDef', {
		'id', "icon",
		'name', T{94, --[[PresetDef Cargo name]] "Icon"},
		'editor', "browse",
		'folder', "UI",
	}),
	PlaceObj('PropertyDef', {
		'id', "preview",
		'name', T{1000043, --[[PresetDef Cargo name]] "Preview"},
		'editor', "image",
		'dont_save', true,
	}),
})

PlaceObj('PresetDef', {
	DefHasSortKey = true,
	group = "Default",
	id = "GameRules",
	PlaceObj('PropertyDef', {
		'id', "description",
		'name', T{326243385540, --[[PresetDef GameRules name]] "Description"},
		'help', T{399906536247, --[[PresetDef GameRules help]] "Text description of the game rule"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'id', "name",
		'name', T{927276370888, --[[PresetDef GameRules name]] "Title"},
		'help', T{306523338154, --[[PresetDef GameRules help]] "The title of the game rule shown in the list of game rules"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'id', "difficultymod",
		'name', T{765833268441, --[[PresetDef GameRules name]] "Difficulty Modifier"},
		'help', T{500246791575, --[[PresetDef GameRules help]] "The amount of difficulty added or subtracted to the overall game difficulty value"},
		'editor', "number",
		'default', 0,
		'min', -500,
		'max', 500,
	}),
	PlaceObj('PropertyDef', {
		'id', "exclusionlist",
		'name', T{452690473931, --[[PresetDef GameRules name]] "Exclusion List"},
		'help', T{959078240221, --[[PresetDef GameRules help]] "List of other game rules that are not compatible with this one. If this rule is active the player won't be able to enable the rules in the exclusion list."},
		'editor', "text",
		'translate', false,
	}),
})

PlaceObj('PresetDef', {
	AdditionalCode = 'function PhotoFilterPreset:GetShaderDescriptor()\r\n	local shader_name = self.filename\r\n	local shader_pass = "Generic"\r\n	\r\n	local vbar_idx = string.find(shader_name, "|")\r\n	if vbar_idx then\r\n		shader_name = string.sub(self.filename, 1, vbar_idx - 1)\r\n		shader_pass = string.sub(self.filename, vbar_idx + 1)\r\n	end\r\n	\r\n	return {\r\n		shader = shader_name,\r\n		pass = shader_pass,\r\n		tex1 = self.texture1,\r\n		tex2 = self.texture2,\r\n		activate = self.activate,\r\n		deactivate = self.deactivate,\r\n	}\r\nend',
	DefGlobalMap = "PhotoFilterPresetMap",
	DefHasSortKey = true,
	group = "Default",
	id = "PhotoFilterPreset",
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "displayName",
		'name', T{760118243448, --[[PresetDef PhotoFilterPreset name]] "Display Name"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "desc",
		'name', T{403751625893, --[[PresetDef PhotoFilterPreset name]] "Description"},
		'editor', "text",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "filename",
		'name', T{472842319142, --[[PresetDef PhotoFilterPreset name]] "Shader Filename"},
		'editor', "browse",
		'default', "",
		'filter', "FX files|*.fx",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "texture1",
		'name', T{252226363141, --[[PresetDef PhotoFilterPreset name]] "Texture 1"},
		'editor', "browse",
		'default', "",
		'filter', "Image files|*.tga",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "texture2",
		'name', T{663906214435, --[[PresetDef PhotoFilterPreset name]] "Texture 2"},
		'editor', "browse",
		'default', "",
		'filter', "Image files|*.tga",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "activate",
		'name', T{644657883672, --[[PresetDef PhotoFilterPreset name]] "Run on activation"},
		'editor', "func",
	}),
	PlaceObj('PropertyDef', {
		'category', "General",
		'id', "deactivate",
		'name', T{577461898820, --[[PresetDef PhotoFilterPreset name]] "Run on deactivation"},
		'editor', "func",
	}),
})

