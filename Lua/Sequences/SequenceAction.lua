
-- choices

DefineClass.SA_AddChoiceEntry = {
	__parents = {"SequenceAction",},

	properties =	{
		{ category = "Choice", id = "text",           name = T(1000145, "Text"),            editor = "multi_line_text", default = "", translate = true },
		{ category = "Choice", id = "img",            name = T(3794, "Image"),           editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "rollover",       name = T(1000112, "Rollover"),        editor = "multi_line_text", default = "", translate = true },
		{ category = "Choice", id = "rollover_title", name = T(3835, "Rollover Title"),  editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "hint1",          name = T(3836, "Rollover Hint 1"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "hint2",          name = T(3837, "Rollover Hint 2"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "register",       name = T(3831, "Choice Register"), editor = "text", default = "choice", },
		{ category = "Choice", id = "result",         name = T(8092, "Choice Result"),   editor = "text", default = ""},
		{ category = "Choice", id = "text_reg1",      name = T(8093, "Text Register 1"),    editor = "text", default = "", },
		{ category = "Choice", id = "text_reg2",      name = T(8094, "Text Register 2"),    editor = "text", default = "", },
		{ category = "Choice", id = "text_reg3",      name = T(8095, "Text Register 3"),    editor = "text", default = "", },
		{ category = "Choice", id = "text_reg4",      name = T(8096, "Text Register 4"),    editor = "text", default = "", },
	},
	
	Menu = "Wait",
	MenuName = T(8097, "Add Choice Entry"),
	MenuSection = "choice_entries",
	RestrictToList = "Scenario",
}

function SA_AddChoiceEntry:Exec(seq_player, ip, seq, registers)
	if self.register == "" then
		return
	end
	local list_reg = "choice_entries_" .. self.register
	local list = registers[list_reg] or {}
	registers[list_reg] = list
	local idx = #list + 1
	local prefix = "choice" .. idx
	local params = {
		[prefix] = self.text,
		[prefix .. "img"] = self.img,
		[prefix .. "rollover"] = self.rollover,
		[prefix .. "rollover_title"] = self.rollover_title,
		[prefix .. "hint1"] = self.hint1,
		[prefix .. "hint2"] = self.hint2,
	}
	for i=1,4 do
		local text_param = self["text_reg" .. i]
		if registers[text_param] then
			params[text_param] = ResolveNumberOrString(text_param, registers)
		end
	end
	list[idx] = {
		params = params,
		result = self.result,
	}
end

function SA_AddChoiceEntry:ShortDescription()
	return SequenceMarkup_Keyword("Add choice") .. _InternalTranslate(self.text)
end

----

DefineClass.SA_WaitChoiceEntries = {
	__parents = {"SequenceAction"},

	properties =	{
		{ category = "General", id = "register",     name = T(3831, "Choice Register"),   editor = "text", default = "choice", },
		{ category = "General", id = "preset", 		name = T(3567, "Preset"),             editor = "combo", default = "", preset_class = "PopupNotificationPreset" },
		{ category = "General", id = "title",  		name = T(1000016, "Title"),    editor = "text", default = "", translate = true},
		{ category = "General", id = "voiced_text",  name = T(6855, "Voiced Text"), editor = "multi_line_text", default = "", translate = true, context = VoicedContextFromField("actor")},
		{ category = "General", id = "text",   		name = T(3793, "Body Text"),   editor = "multi_line_text", default = "", translate = true },
		{ category = "General", id = "log_entry",    name = T(6856, "Log Entry"),   editor = "bool", default = false },
		{ category = "General", id = "actor",        name = T(6857, "Voice Actor"), editor = "combo", items = VoiceActors, default = "narrator" },
		{ category = "General", id = "image",        name = T(3794, "Image"),       editor = "browse", default = "", folder = "UI"},
		{ category = "General", id = "start_minimized", name = T(10914, "Start Minimized"), editor = "bool", default = true, },
		{ category = "General", id = "validate_context", name = T(10915, "Validate Context"), editor = "func", default = false, params = "context", help = T(849714426285, "Periodically validates the context of the OnScreenNotification (only used when start_minimized == true)"), },
		{ category = "General", id = "text_param1", 	name = T(3795, "Text Param 1"), editor = "text", translate = true, default = "", help = T(3796, "This is translatable text, ref as text_param1 in the body"), },
		{ category = "General", id = "text_param2", 	name = T(3797, "Text Param 2"), editor = "text", translate = true, default = "", help = T(3798, "This is translatable text, ref as text_param2 in the body"), },
		{ category = "General", id = "text_param3", 	name = T(3799, "Text Param 3"), editor = "text", translate = true, default = "", help = T(3800, "This is translatable text, ref as text_param3 in the body"), },
		{ category = "General", id = "reg_param1", 	name = T(3801, "Reg Param 1"), 	editor = "text", default = "", help = T(3802, "This is a register name, ref as reg_param1 in the body") },
		{ category = "General", id = "reg_param2", 	name = T(3803, "Reg Param 2"), 	editor = "text", default = "", help = T(3804, "This is a register name, ref as reg_param2 in the body") },
		{ category = "General", id = "reg_param3", 	name = T(3805, "Reg Param 3"), 	editor = "text", default = "", help = T(3806, "This is a register name, ref as reg_param3 in the body") },
	},
	
	Menu = "Wait",
	MenuName = T(8098, "Wait Choice Entries"),
	MenuSection = "choice_entries",
	RestrictToList = "Scenario",
}

function SA_WaitChoiceEntries:Exec(seq_player, ip, seq, registers)
	local list_reg = "choice_entries_" .. self.register
	local list = registers[list_reg] or ""
	if #list == 0 then
		return
	end
	local props = self:GetProperties()
	local context = {}
	for _, prop in ipairs(props) do
		local prop_id = prop.id
		local value = self:GetProperty(prop_id)
		if type(value) == "string" and registers[value] then
			context[prop_id] = ResolveNumberOrString(value, registers)
		else
			context[prop_id] = value
 		end
 	end
	for i=1,#list do
		for key, value in pairs(list[i].params) do
			context[key] = value
		end
	end
	registers[list_reg] = nil
	local idx = WaitPopupNotification(self.preset, context)
	registers[self.register] = list[idx] and list[idx].result
end

function SA_WaitChoiceEntries:ShortDescription()
	return SequenceMarkup_Keyword("Wait choice") .. _InternalTranslate(self.title)
end

----

DefineClass.SA_WaitChoiceCheck = {
	__parents = {"SA_Condition"},
	properties =	{
		{ category = "General", id = "value", name = T(3700, "Value"), editor = "dropdownlist", default = 1,
			items = {
				{ text = T(3785, "Choice 1"), value = 1},
				{ text = T(3786, "Choice 2"), value = 2},
				{ text = T(3787, "Choice 3"), value = 3},
				{ text = T(3788, "Choice 4"), value = 4},
			}
		},
		{ category = "General", id = "choice_id", name = T(3789, "Choice Id"), editor = "text", default = "", },
	},
	Menu = "Conditions",
	MenuName = T(3790, "Check Result of Last Choice"),
	RestrictToList = "Scenario",
}

function SA_WaitChoiceCheck:TestCondition(sequence_player, ip, seq, registers)
	local choice_result = "choice_result" .. self.choice_id
	local ret = registers[choice_result] == self.value
	if ret then
		registers[choice_result] = nil
	end
	return ret
end

function SA_WaitChoiceCheck:ConditionText()
	if self.choice_id == "" then
		return _InternalTranslate(T{3791, "Choice <value>", value = Untranslated(self.value)})
	else
		return _InternalTranslate(T{3792, "Choice <value> <id>", id = Untranslated(self.choice_id), value =  Untranslated(self.value)})
	end
end

DefineClass.SA_WaitChoice = {
	__parents = {"SequenceAction"},

	properties =	{
		{ category = "General", id = "preset", 			name = "Preset",              editor = "combo", default = "", items =  PresetsCombo("PopupNotificationPreset") },
		{ category = "General", id = "title",  			name = T(1000016, "Title"),            editor = "text", default = "", translate = true},
		{ category = "General", id = "voiced_text",   name = T(6855, "Voiced Text"), editor = "multi_line_text", default = "", translate = true, context = VoicedContextFromField("actor")},
		{ category = "General", id = "text",   			name = T(3793, "Body Text"),        editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "General", id = "log_entry", name = T(6856, "Log Entry"), editor = "bool", default = false },
		{ category = "General", id = "actor",   name = T(6857, "Voice Actor"), editor = "combo", items = VoiceActors, default = "narrator" },
		{ category = "General", id = "image",          name = T(3794, "Image"),            editor = "browse", default = "", folder = "UI"},
		{ category = "General", id = "start_minimized", name = T(10914, "Start Minimized"), editor = "bool", default = true, },
		{ category = "General", id = "validate_context", name = T(10915, "Validate Context"), editor = "func", default = false, params = "context", help = T(849714426285, "Periodically validates the context of the OnScreenNotification (only used when start_minimized == true)"), },
		{ category = "General", id = "text_param1", 	name = T(3795, "Text Param 1"), 		editor = "text", translate = true, default = "", help = T(3796, "This is translatable text, ref as text_param1 in the body"), },
		{ category = "General", id = "text_param2", 	name = T(3797, "Text Param 2"), 		editor = "text", translate = true, default = "", help = T(3798, "This is translatable text, ref as text_param2 in the body"), },
		{ category = "General", id = "text_param3", 	name = T(3799, "Text Param 3"), 		editor = "text", translate = true, default = "", help = T(3800, "This is translatable text, ref as text_param3 in the body"), },
		{ category = "General", id = "reg_param1", 	name = T(3801, "Reg Param 1"), 		editor = "combo", refs_object_of_type = "register", default = "", help = T(3802, "This is a register name, ref as reg_param1 in the body") },
		{ category = "General", id = "reg_param2", 	name = T(3803, "Reg Param 2"), 		editor = "combo", refs_object_of_type = "register", default = "", help = T(3804, "This is a register name, ref as reg_param2 in the body") },
		{ category = "General", id = "reg_param3", 	name = T(3805, "Reg Param 3"), 		editor = "combo", refs_object_of_type = "register", default = "", help = T(3806, "This is a register name, ref as reg_param3 in the body") },

		{ category = "Choice", id = "choice1",     		      name = T(3785, "Choice 1"),         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_img", 		      name = T(3807, "Choice 1 Image"),   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice1_rollover",      name = T(3808, "Rollover 1"),       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_rollover_title",name = T(3809, "Rollover Title 1"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint1",   name = T(3810, "Rollover 1 Hint 1"),           editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint2",   name = T(3811, "Rollover 1 Hint 2"),           editor = "text", default = "", translate = true, use_registers = true },
		
		{ category = "Choice", id = "choice2",     		      name = T(3786, "Choice 2"),         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_img", 		      name = T(3812, "Choice 2 Image"),   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice2_rollover",      name = T(3813, "Rollover 2"),       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_rollover_title",name = T(3814, "Rollover Title 2"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_hint1",   name = T(3815, "Rollover 2 Hint 1"),      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_hint2",   name = T(3816, "Rollover 2 Hint 2"),      editor = "text", default = "", translate = true, use_registers = true },
	
		{ category = "Choice", id = "choice3",     		name = T(3787, "Choice 3"),       	editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_img", 		name = T(3817, "Choice 3 Image"), 	editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice3_rollover",      name = T(3818, "Rollover 3"),       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_rollover_title",name = T(3819, "Rollover Title 3"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_hint1",   name = T(3820, "Rollover 3 Hint 1"),      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_hint2",   name = T(3821, "Rollover 3 Hint 2"),      editor = "text", default = "", translate = true, use_registers = true },
		
		{ category = "Choice", id = "choice4",     		      name = T(3788, "Choice 4"),         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_img", 		      name = T(3822, "Choice 4 Image"),   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice4_rollover",      name = T(3823, "Rollover 4"),       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_rollover_title",name = T(3824, "Rollover Title 4"), editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_hint1",   name = T(3825, "Rollover 4 Hint 1"),      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_hint2",   name = T(3826, "Rollover 4 Hint 2"),      editor = "text", default = "", translate = true, use_registers = true },
		
		{ category = "Choice", id = "choice_param1", 	name = T(3827, "Choice Param 1"), 	editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Choice", id = "choice_param2", 	name = T(3828, "Choice Param 2"), 	editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Choice", id = "choice_param3", 	name = T(3829, "Choice Param 3"), 	editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Choice", id = "choice_param4", 	name = T(3830, "Choice Param 4"), 	editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Choice", id = "choice_register", name = T(3831, "Choice Register"), 	editor = "text", default = "" },
	
		{ category = "Gamepad", id = "gamepad_text",  name = T(3793, "Body Text"), default = "", editor = "multi_line_text", translate = true},
		{ category = "Gamepad", id = "gamepad_param1", name = "Body Param 1", editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Gamepad", id = "gamepad_param2", name = "Body Param 2", editor = "combo", refs_object_of_type = "register", default = "" },
		{ category = "Gamepad", id = "gamepad_param3", name = "Body Param 3", editor = "combo", refs_object_of_type = "register", default = "" },
	},
	
	Menu = "Wait",
	MenuName = T(3832, "Wait Choice"),
	MenuSection = "messages",
	RestrictToList = "Scenario",
	
	params = false,
}

function SA_WaitChoice:OnPropertyChanged(prop_id, old_value, main_obj, prop_meta)
	if prop_id == "preset" then
		local new_preset = PopupNotificationPresets[self.preset]
		local own_properties = self:GetProperties()
		for key, value in ipairs(new_preset:GetProperties()) do
			if table.find(own_properties, 'id', value.id) then
				local new_prop_value = new_preset:GetProperty(value.id)
				if not new_prop_value and value.editor == "text" then 
					new_prop_value = ""
				end
				self:SetProperty(value.id, new_prop_value)
			end
		end
	end
end

function SA_WaitChoice:OnCreate(sequence, ip)
	SequenceAction.OnCreate(self, sequence, ip)
	local free_id = sequence:FindFreeId()
	local ids = {
		free_id+0, free_id+1, free_id+2, free_id+3,
		free_id+4, free_id+5, free_id+6, free_id+7,
	}
	table.insert(sequence, ip+1, SA_WaitChoiceCheck:new{value=1, sa_id=ids[1], end_block = ids[2]})
	table.insert(sequence, ip+2, SA_Block:new{                   sa_id=ids[2], parent    = ids[1]})
	table.insert(sequence, ip+3, SA_WaitChoiceCheck:new{value=2, sa_id=ids[3], end_block = ids[4]})
	table.insert(sequence, ip+4, SA_Block:new{                   sa_id=ids[4], parent    = ids[3]})
	table.insert(sequence, ip+5, SA_WaitChoiceCheck:new{value=3, sa_id=ids[5], end_block = ids[6]})
	table.insert(sequence, ip+6, SA_Block:new{                   sa_id=ids[6], parent    = ids[5]})
	table.insert(sequence, ip+7, SA_WaitChoiceCheck:new{value=4, sa_id=ids[7], end_block = ids[8]})
	table.insert(sequence, ip+8, SA_Block:new{                   sa_id=ids[8], parent    = ids[7]})
end

function SA_WaitChoice:ShortDescription()
	return string.format("Wait choice '%s' of <b>'%s'</b>, <b>'%s'</b>, <b>'%s'</b>, <b>'%s'</b>",
		_InternalTranslate(self.title),
		_InternalTranslate(self.choice1),
		_InternalTranslate(self.choice2),
		_InternalTranslate(self.choice3),
		_InternalTranslate(self.choice4))
end

function SA_WaitChoice:WarningsCheck(seq_player, seq, registers)
	if 	self.title == "" or self.choice1 == "" then
		seq_player:Error(self, "Fill in the dialog title, text and at least one choice!")
	end
	SequenceAction.WarningsCheck(self, seq_player, seq, registers)
end

function SA_WaitChoice:Exec(seq_player, ip, seq, registers)
	local props = self:GetProperties()
	local context = {}
	for _, prop in ipairs(props) do
		local prop_id = prop.id
		local value = self:GetProperty(prop_id)
		if type(value) == "string" and registers[value] then
			context[prop_id] = ResolveNumberOrString(value, registers)
		else
			context[prop_id] = value
 		end
 	end
	self:PopMessage(context, registers)
end

function SA_WaitChoice:PopMessage(context, registers)
	registers[ "choice_result" .. self.choice_register ] = WaitPopupNotification(self.preset, context)
end

DefineClass.SA_ShowChoice = {
	__parents = { "SA_WaitChoice" },
	Menu = "Show",
	MenuName = T(10916, "Show Choice"),
}

function SA_ShowChoice:ShortDescription()
	return string.format("Show choice '%s' of <b>'%s'</b>, <b>'%s'</b>, <b>'%s'</b>, <b>'%s'</b>",
		_InternalTranslate(self.title),
		_InternalTranslate(self.choice1),
		_InternalTranslate(self.choice2),
		_InternalTranslate(self.choice3),
		_InternalTranslate(self.choice4))
end

function SA_ShowChoice:PopMessage(context, registers)
	local function callback(cur_obj, params, res)
		registers[ "choice_result" .. self.choice_register ] = res
	end
	ShowPopupNotification(self.preset, context, nil, nil, callback)
end

DefineClass.SA_WaitMessage = {
	__parents = { "SA_WaitChoice" },
	properties = {
		{ category = "Choice", id = "choice1",                name = T(3833, "Button"),          editor = "multi_line_text", default = T(6858, "OK"), translate = true },
		{ category = "Choice", id = "choice1_img",            name = T(3834, "Button Image"),    editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice1_rollover",       name = T(1000112, "Rollover"),        editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_rollover_title", name = T(3835, "Rollover Title"),  editor = "text",            default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint1",          name = T(3836, "Rollover Hint 1"), editor = "text",            default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint2",          name = T(3837, "Rollover Hint 2"), editor = "text",            default = "", translate = true, use_registers = true },
		{ id = "choice2",                editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice2_img",            editor = "browse",          no_edit = true },
		{ id = "choice2_rollover",       editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice2_rollover_title", editor = "text",            no_edit = true, translate = true },
		{ id = "choice2_hint1",          editor = "text",            no_edit = true, translate = true },
		{ id = "choice2_hint2",          editor = "text",            no_edit = true, translate = true },
		{ id = "choice3",                editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice3_img",            editor = "browse",          no_edit = true },
		{ id = "choice3_rollover",       editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice3_rollover_title", editor = "text",            no_edit = true, translate = true },
		{ id = "choice3_hint1",          editor = "text",            no_edit = true, translate = true },
		{ id = "choice3_hint2",          editor = "text",            no_edit = true, translate = true },
		{ id = "choice4",                editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice4_img",            editor = "browse",          no_edit = true },
		{ id = "choice4_rollover",       editor = "multi_line_text", no_edit = true, translate = true },
		{ id = "choice4_rollover_title", editor = "text",            no_edit = true, translate = true },
		{ id = "choice4_hint1",          editor = "text",            no_edit = true, translate = true },
		{ id = "choice4_hint2",          editor = "text",            no_edit = true, translate = true },
		
		{ id = "choice_param1", no_edit = true},
		{ id = "choice_param2", no_edit = true},
		{ id = "choice_param3", no_edit = true},
		{ id = "choice_param4", no_edit = true},
	},
	Menu = "Wait",
	MenuName = T(3838, "Wait Message"),
	MenuSection = "messages",
	RestrictToList = "Scenario",
}

function SA_WaitMessage:SetProperty(id, value)
	if id == "choice2" or id == "choice3" or id == "choice4" then
		return
	end
	SA_WaitChoice.SetProperty(self, id, value)
end

function SA_WaitMessage:ShortDescription()
	return string.format("Wait message '%s'", _InternalTranslate(self.title))
end

function SA_WaitMessage:Exec(seq_player, ip, seq, registers)
	local props = self:GetProperties()
	local context = {}
	for _, prop in ipairs(props) do
		local prop_id = prop.id
		local value = self:GetProperty(prop_id)
		if type(value) == "string" and registers[value] then
			context[prop_id] = ResolveNumberOrString(value, registers)
		else
			context[prop_id] = value
		end
	end
	self:PopMessage(context, registers)
end

function SA_WaitMessage:PopMessage(context, registers)
	PlayFX("UIMenuNotificationStoryBit", "start")
	WaitPopupNotification(self.preset, context)
end

function SA_WaitMessage:OnCreate(sequence, ip)
	-- don't insert 'if' blocks for message
	SequenceAction.OnCreate(self, sequence, ip)
end

DefineClass.SA_ShowMessage = {
	__parents = { "SA_WaitMessage" },
	Menu = "Show",
	MenuName = T(10917, "Show Message"),
}

function SA_ShowMessage:ShortDescription()
	return string.format("Show message '%s'", _InternalTranslate(self.title))
end

function SA_ShowMessage:PopMessage(context, registers)
	ShowPopupNotification(self.preset, context)
end