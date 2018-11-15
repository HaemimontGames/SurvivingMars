-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('StoryBit')
DefineClass.StoryBit = {
	__parents = { "Preset", },
	properties = {
		{ category = "General", id = "ScriptDone", name = "Script done", 
			editor = "bool", default = false, },
		{ category = "General", id = "TextReadyForValidation", name = "Text ready for validation", 
			editor = "bool", default = false, },
		{ category = "General", id = "TextsDone", name = "Texts done", 
			editor = "bool", default = false, },
		{ category = "Activation", id = "Category", 
			editor = "choice", default = "FollowUp", items = function (self) return PresetsCombo("StoryBitCategory") end, },
		{ category = "Activation", id = "Trigger", 
			editor = "choice", default = "StoryBitTick", 
			read_only = function(self) return self.Category ~= "FollowUp" end, items = function (self) return StoryBitTriggersCombo end, },
		{ category = "Activation", id = "Enabled", 
			editor = "bool", default = false, 
			read_only = function(self) return self.Category == "FollowUp" end, },
		{ category = "Activation", id = "EnableChance", name = "Enable Chance", help = "Chance to be enabled in a specific playthrough (use sparingly for story bits that occur too often)", 
			editor = "number", default = 100, 
			no_edit = function(self) return not self.Enabled end, scale = "%", },
		{ category = "Activation", id = "InheritsObject", name = "Inherits object", help = "Associate with the object of the story bit that enabled this one", 
			editor = "bool", default = true, 
			no_edit = function(self) return self.Enabled end, },
		{ id = "SelectObject", name = "Select Object", help = "Select the object when opening the popup", 
			editor = "bool", default = true, },
		{ category = "Activation", id = "OneTime", name = "One-time", 
			editor = "bool", default = true, 
			read_only = function(self) return self.Category == "FollowUp" end, },
		{ category = "Activation", id = "SuppressTime", name = "Suppress for (hours)", help = "Don't activate this StoryBit for this period after it was enabled.", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "hours", },
		{ category = "Activation", id = "Prerequisites", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ category = "Activation Effects", id = "Disables", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("StoryBit") end, },
		{ category = "Activation Effects", id = "Delay", name = "Delay (hours)", help = "Delays the event activation after for this time after the trigger event", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, scale = "hours", },
		{ category = "Activation Effects", id = "ActivationEffects", name = "Activation Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
		{ category = "Notification & Popup", id = "Title", 
			editor = "text", default = false, translate = true, lines = 1, },
		{ category = "Notification & Popup", id = "NotificationText", 
			editor = "text", default = T{11172, "Your attention is required!"}, translate = true, lines = 1, },
		{ category = "Notification & Popup", id = "VoicedText", name = "Voiced Text", 
			editor = "text", default = false, translate = true, lines = 1, max_lines = 256, context = VoicedContextFromField("Actor"), },
		{ category = "Notification & Popup", id = "Text", 
			editor = "text", default = false, translate = true, lines = 4, max_lines = 256, },
		{ category = "Notification & Popup", id = "OpenAdditionalDialogInChoices", name = "Add 'Open CCC Dialog' in choices", 
			editor = "bool", default = true, },
		{ category = "Notification & Popup", id = "Actor", 
			editor = "combo", default = "narrator", items = function (self) return VoiceActors end, },
		{ category = "Notification & Popup", id = "Image", 
			editor = "browse", default = "", folder = "UI", image_preview_size = 200, },
		{ category = "Completion Effects", id = "Enables", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("StoryBit") end, },
		{ category = "Completion Effects", id = "Effects", name = "Completion Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
	},
	SingleFile = false,
	GlobalMap = "StoryBits",
	ContainerClass = "StoryBitSubItem",
	GedEditor = "StoryBitEditor",
	EditorMenubarName = "Story Bits",
	EditorShortcut = "Ctrl-Alt-E",
	EditorMenubar = "Editors.Game",
	EditorView = Untranslated("<WarningMark><ChooseColor><id><color 0 128 0><if(not_eq(Trigger,'StoryBitTick'))> (<Trigger>)</if><color 128 128 128><opt(u(save_in),' - ','')>"),
}

DefineModItemPreset("StoryBit")
ModItemStoryBit.EditorName = "Story bit"

function StoryBit:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Category" then 
		if self.Category == "FollowUp" then
			self.Enabled = false
			self.OneTime = true
		else
			self.Trigger = StoryBitCategories[self.Category].Trigger
			self.Enabled = true
		end
	end
	if prop_id == "Enables" then
		StoryBitResetEnabledReferences()
	end
end

function StoryBit:GatherParams(type)
	local ret = {}
	for _,item in ipairs(self) do
		if item:IsKindOf("StoryBitParam") and item.Type == type then
			ret[#ret + 1] = item.Name
		end
	end
	return ret
end

function StoryBit:PickParam(obj, prop_id, socket)
	local prop_meta = obj:GetPropertyMetadata(prop_id)
	local params = self:GatherParams(prop_meta.editor)
	if #params == 0 then
		socket:ShowMessage("There are no params defined for this StoryBit.")
		return
	end
	local pick = params[1]
	if #params > 1 then
		pick = socket:WaitUserInput("Select Param", pick, params)
		if not pick then return end
	end
	obj:SetProperty(prop_id, "<"..pick..">")
	ObjModified(obj)
end

function StoryBit:ChooseColor()
	local color = not self.ScriptDone and RGB(0,0,0) or 
						not self.TextsDone and RGB(205, 32, 32) or
						not self.TextReadyForValidation and RGB(220,120,0) or
						not (self.Image and self.Image ~= "" or self.Category == "FollowUp") and RGB(50, 50, 200) or
						RGB(32, 128, 32)
	local r,g,b = GetRGB(color)
	return string.format("<color %s %s %s>", r, g ,b)
end

----- StoryBit Add ! marks

if Platform.developer then
	local referenced_storybits = false
	
	function StoryBitResetEnabledReferences()
		referenced_storybits = false
		ObjModified(Presets.StoryBit)
	end
	
	local function add_effect_references(effects)
		for _, effect in ipairs(effects) do
			if effect:IsKindOf("ActivateStoryBit") then
				referenced_storybits[effect.Id] = true
			end
			if effect:IsKindOf("EnableRandomStoryBit") then
				for _, id in ipairs(effect.StoryBits or empty_table) do
					referenced_storybits[id] = true
				end
			end
		end
	end
	
	local function update_referenced_storybits()
		referenced_storybits = {}
		ForEachPreset(StoryBit, function(storybit)
			for _, id in ipairs(storybit.Enables or empty_table) do
				referenced_storybits[id] = true
			end
			add_effect_references(storybit.Effects)
			add_effect_references(storybit.ActivationEffects)
			for _, child in ipairs(storybit) do
				if child:IsKindOf("StoryBitOutcome") then
					for _, id in ipairs(child.Enables) do
						referenced_storybits[id] = true
					end
					add_effect_references(child.Effects)
				end
			end
		end)
	end
	
	function StoryBit:GetWarning()
		if not referenced_storybits then
			update_referenced_storybits()
		end
		return not (self.Enabled or referenced_storybits[self.id]) and
			"This story bit is not enabled by itself, or from anywhere else." or
			Preset.GetWarning(self)
	end
else
	function StoryBit:GetWarning()
		return false
	end
	
	function StoryBitResetEnabledReferences()
	end
end

UndefineClass('StoryBitOutcome')
DefineClass.StoryBitOutcome = {
	__parents = { "StoryBitSubItem", },
	properties = {
		{ category = "Activation", id = "Prerequisites", 
			editor = "nested_list", default = false, base_class = "Condition", },
		{ category = "Activation", id = "Weight", 
			editor = "number", default = 100, },
		{ category = "Popup", id = "Title", 
			editor = "text", default = false, translate = true, lines = 1, },
		{ category = "Popup", id = "VoicedText", name = "Voiced Text", 
			editor = "text", default = false, translate = true, lines = 1, max_lines = 256, context = VoicedContextFromField("Actor"), },
		{ category = "Popup", id = "Text", 
			editor = "text", default = false, translate = true, lines = 4, max_lines = 256, },
		{ category = "Popup", id = "Actor", 
			editor = "combo", default = "narrator", items = function (self) return VoiceActors end, },
		{ category = "Popup", id = "Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "Enables", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("StoryBit") end, },
		{ id = "Disables", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("StoryBit") end, },
		{ category = "Effect", id = "Effects", 
			editor = "nested_list", default = false, base_class = "Effect", },
	},
	EditorName = "New Outcome",
}

function StoryBitOutcome:GetEditorView()
	local result = "<tab 20>Outcome (<Weight>): "
	if self.VoicedText then
		result = result ..  "<color 128 128 128><tags off><literal(VoicedText)><tags on></color>"
	elseif self.Text then	
		result = result ..  "<color 128 128 128><tags off><literal(Text)><tags on></color>"
	else
		result = result .. "<color 128 128 128>no display text"
	end
	for _, cond in ipairs(self.Prerequisites) do
		result = result .. "\n<tab 20><color 128 128 220>" .. _InternalTranslate(cond:GetProperty("EditorView"), cond, false)
	end
	for _, effect in ipairs(self.Effects) do
		result = result .. "\n<tab 20><color 64 64 220>" .. _InternalTranslate(effect:GetProperty("EditorView"), effect, false)
	end
	if next(self.Enables or empty_table) then
		result = result .. "\n<tab 20><color 0 0 0>Enables: <color 0 128 0>" .. table.concat(self.Enables, ", ")
	end
	if next(self.Disables or empty_table) then
		result = result .. "\n<tab 20><color 0 0 0>Disables: <color 128 0 0>" .. table.concat(self.Disables, ", ")
	end
	if const.TagLookupTable["em"] then
		result = result:gsub(const.TagLookupTable["em"],"")
		result = result:gsub(const.TagLookupTable["/em"],"")
	end
	return T{Untranslated(result)}
end

function StoryBitOutcome:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Enables" then
		StoryBitResetEnabledReferences()
	end
end

UndefineClass('StoryBitParam')
DefineClass.StoryBitParam = {
	__parents = { "StoryBitSubItem", },
	properties = {
		{ id = "Name", 
			editor = "text", default = false, },
		{ id = "Tag", 
			editor = "text", default = false, dont_save = true, read_only = true, },
	},
	EditorView = Untranslated("Param <Name> = <Value>"),
	Type = "number",
}

function StoryBitParam:GetTag()
	return "<" .. (self.Name or "") .. ">"
end

function StoryBitParam:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Name" then
		self.Name = self.Name and string.lower(self.Name)
	end
end

UndefineClass('StoryBitParamFunding')
DefineClass.StoryBitParamFunding = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "mil", },
	},
	EditorName = "New Param (funding)",
}

function StoryBitParamFunding:GetTag()
	return "<funding(" .. (self.Name or "") .. ")>"
end

UndefineClass('StoryBitParamNumber')
DefineClass.StoryBitParamNumber = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, },
	},
	EditorName = "New Param (number)",
}

UndefineClass('StoryBitParamPercent')
DefineClass.StoryBitParamPercent = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, },
	},
	EditorView = Untranslated("Param <Name> = <Value>%"),
	EditorName = "New Param (percent)",
}

function StoryBitParamPercent:GetTag()
	return "<" .. (self.Name or "") .. ">%"
end

UndefineClass('StoryBitParamResearchPoints')
DefineClass.StoryBitParamResearchPoints = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, },
	},
	EditorName = "New Param (reseach points)",
	EditorView = Untranslated("Param <Name> = <research(Value)> research"),
}

function StoryBitParamResearchPoints:GetTag()
	return string.format("<research(%s)>", self.Name or "")
end

UndefineClass('StoryBitParamResource')
DefineClass.StoryBitParamResource = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "Resources", },
		{ id = "Resource", 
			editor = "choice", default = false, items = function (self) return FormattableResourcesWithoutRP end, },
	},
	EditorName = "New Param (resource)",
	EditorView = Untranslated("Param <Name> = <resource(Value)> <Resource>"),
}

function StoryBitParamResource:GetTag()
	return string.format("<%s(%s)>", self.Resource or "water", self.Name or "")
end

UndefineClass('StoryBitParamSols')
DefineClass.StoryBitParamSols = {
	__parents = { "StoryBitParam", },
	properties = {
		{ id = "Value", 
			editor = "number", default = 0, 
			scale = function(self) return self:GetProperty("Scale") end, scale = "sols", },
	},
	EditorName = "New Param (sols)",
	EditorView = Untranslated("Param <Name> = <sols(Value)> sols"),
}

function StoryBitParamSols:GetTag()
	return "<sols(" .. (self.Name or "") .. ")> Sols"
end

----- StoryBitParamSols 

TFormat.sols = function(context_obj, time)
	if not time then return Untranslated("<?>") end
	return time / const.Scale.sols
end

UndefineClass('StoryBitReply')
DefineClass.StoryBitReply = {
	__parents = { "StoryBitSubItem", },
	properties = {
		{ id = "Text", 
			editor = "text", default = false, translate = true, lines = 1, },
		{ id = "OutcomeText", name = "Outcome Text", 
			editor = "choice", default = "none", items = function (self) return { { text = "None", value = "none" }, { text = "Auto (from 1st outcome effects)", value = "auto" }, { text = "Custom", value = "custom" } } end, },
		{ id = "CustomOutcomeText", name = "Custom outcome text", 
			editor = "text", default = false, 
			no_edit = function(self) return self.OutcomeText ~= "custom" end, translate = true, lines = 1, },
		{ id = "Cost", 
			editor = "number", default = 0, 
			buttons = { { "Param", "PickParam" } }, },
		{ id = "Prerequisite", 
			editor = "nested_obj", default = false, base_class = "Condition", },
		{ id = "HideIfDisabled", name = "Hide if disabled", 
			editor = "bool", default = false, },
		{ category = "Comment", id = "Comment", 
			editor = "text", default = false, },
	},
	EditorName = "New Reply",
}

function StoryBitReply:GetEditorView()
	local conditions = {}
	local cond = self.Prerequisite
	if cond then
		table.insert(conditions, _InternalTranslate(cond:GetProperty("EditorView"), cond, false))
	end
	local cost = self.Cost
	if cost ~= 0 then
		table.insert(conditions, "Cost " .. _InternalTranslate(T{1000828, "<cost>"}, cost, false))
	end
	
	local cond_text = #conditions > 0 and "[" .. table.concat(conditions, ", ") .. "] " or ""
	local result = "Reply: <color 0 128 0>" .. cond_text .. "<literal(Text)></color>"
	if self.OutcomeText == "custom" then
		result = result .. "\n<color 128 128 128>(<literal(CustomOutcomeText)>)"
	elseif self.OutcomeText == "auto" then
		result = result .. "\n<color 128 128 128> - auto display of outcome text -"
	end
	if self.Comment and self.Comment ~= "" then
		result = result .. "\n<color 128 0 0>" .. self.Comment .. "</color>"
	end
	if const.TagLookupTable["em"] then
		result = result:gsub(const.TagLookupTable["em"],"")
		result = result:gsub(const.TagLookupTable["/em"],"")
	end
	return T{Untranslated(result)}
end

UndefineClass('StoryBitSubItem')
DefineClass.StoryBitSubItem = {
	__parents = { "PropertyObject", },
}

