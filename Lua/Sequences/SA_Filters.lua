DefineClass.SA_Filter = {
	
}

GetAllLabelsCombo = empty_func

DefineClass.SA_GetLabelToRegister = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "label", name = T{3689, "Label"}, editor = "combo", default = "", items = function() return GetAllLabelsCombo() end, },
		{ id = "register", name = T{3690, "Register"}, editor = "text", default = ""},
		{ id = "random_count", name = T{3691, "Random number"}, help = "Pick only this many objects from label, but no more than percent; 0 for all", editor = "number", default = 0 },
		{ id = "random_percent", name = T{3692, "Random percent"}, help = "Pick only this percent of objects, but no more than number", editor = "number", default = 100 },
	},

	Menu = "Gameplay",
	MenuName = "Get Label to Register",
}

function SA_GetLabelToRegister:ShortDescription()
	if self.random_count == 0 and self.random_percent == 100 then
		return string.format("Get label %s in register %s", SequenceMarkup_Parameter(self.label), SequenceMarkup_Parameter(self.register))
	elseif self.random_percent == 100 and self.random_count ~= 0 then
		return string.format("Get %s objects of label %s in register %s", SequenceMarkup_Parameter(self.random_count), SequenceMarkup_Parameter(self.label), SequenceMarkup_Parameter(self.register))
	elseif self.random_percent ~= 100 and self.random_count == 0 then
		return string.format("Get %s%% of the objects of label %s in register %s", SequenceMarkup_Parameter(self.random_percent), SequenceMarkup_Parameter(self.label), SequenceMarkup_Parameter(self.register))
	else
		return string.format("Get min(%s, %s%%) of the objects of label %s in register %s", SequenceMarkup_Parameter(self.random_count), SequenceMarkup_Parameter(self.random_percent), SequenceMarkup_Parameter(self.label), SequenceMarkup_Parameter(self.register))
	end
end

function SA_GetLabelToRegister:Exec(seq_player, ip, seq, registers)
	registers[self.register] = {} 
	local objs = GetObjectsByLabel(self.label)
	if not objs then return end
	if #objs == 0 then return end

	local count = Min(#objs, MulDivRound(#objs, self.random_percent, 100))
	if self.random_count ~= 0 then
		count = Min(self.random_count, count)
	end

	table.shuffle(objs)

	local reg = registers[self.register]
	for i=1,count do
		reg[i] = objs[i]
	end
end

DefineClass.SA_FilterRegister = {
	__parents = {"SequenceAction"},
	properties = {
		{ id = "register_in", name = T{3693, "Input register"}, help = "Input register to filter", editor = "text", default = "" },
		{ id = "register_out", name = T{3694, "Output register"}, help = "Output register from filter (leave blank for output to same register", editor = "text", default = "" },
		{ id = "invert", name = T{3695, "NOT"}, help = "Invert condition", editor = "bool", default = false },
	},
	MenuSection = "Filter",
	Menu = "Gameplay",
}

-- return true if obj should survive filter
function SA_FilterRegister:TestElement(obj, registers)
	assert(not "Implement in base class")
end

function SA_FilterRegister:ShortDescriptionTestElement()
	assert(not "Implement in base class")
end

function SA_FilterRegister:Prefilter(registers)
end

function SA_FilterRegister:Postfilter(registers)
end

function SA_FilterRegister:ShortDescription()
	if self.register_in ~= self.register_out and self.register_out ~= "" then
		return string.format("Filter reg %s -> reg %s %s", 
			SequenceMarkup_Parameter(self.register_in),
			SequenceMarkup_Parameter(self.register_out),
			self:ShortDescriptionTestElement())
	else
		return string.format("Filter reg %s %s", 
			SequenceMarkup_Parameter(self.register_in),
			self:ShortDescriptionTestElement())
	end
end

function SA_FilterRegister:Exec(seq_player, ip, seq, registers)
	local input = registers[self.register_in]
	local output, output_index = {}, 1
	self:Prefilter(registers)
	if not self.invert then
		for _,obj in ipairs(input or empty_table) do
			if self:TestElement(obj, registers) then
				output[output_index] = obj
				output_index = output_index+1
			end
		end
	else
		for _,obj in ipairs(input or empty_table) do
			if not self:TestElement(obj, registers) then
				output[output_index] = obj
				output_index = output_index+1
			end
		end
	end
	self:Postfilter(registers)
	registers[self.register_out == "" and self.register_in or self.register_out] = output
end

DefineClass.SA_FilterRegister_Class = {
	__parents = {"SA_FilterRegister"},
	properties = {
		{ id = "filter_class", name = T{3696, "Class"}, help = "Class to test", editor = "text", default = "" },
	},
	MenuName = "Filter register by class",
}

function SA_FilterRegister_Class:ShortDescriptionTestElement()
	if not self.invert then
		return string.format("keeping class %s", SequenceMarkup_Parameter(self.filter_class))
	else
		return string.format("removing class %s", SequenceMarkup_Parameter(self.filter_class))
	end
end

function SA_FilterRegister_Class:TestElement(obj)
	return obj:IsKindOf(self.filter_class)
end

DefineClass.SA_FilterRegister_Register = {
	__parents = {"SA_FilterRegister"},
	properties = {
		{ id = "register_other", name = T{3697, "Other register"}, help = "Register to test", editor = "text", default = "" },
	},
	MenuName = "Filter register by register",
}

function SA_FilterRegister_Register:ShortDescriptionTestElement()
	if not self.invert then
		return string.format("keeping elements in reg %s", SequenceMarkup_Parameter(self.register_other))
	else
		return string.format("keeping elements not reg %s", SequenceMarkup_Parameter(self.register_other))
	end
end

function SA_FilterRegister_Register:TestElement(obj, registers)
	return table.find(registers[self.register_other] or empty_table, obj)
end

DefineClass.SA_FilterRegister_RegisterRange = {
	__parents = {"SA_FilterRegister"},
	properties = {
		{ id = "register_other", name = T{3697, "Other register"}, help = "Register to test against", editor = "text", default = "" },
		{ id = "range", name = T{643, "Range"}, help = "Range to test distance against", editor = "number", default = 100*guim, scale = guim },
	},
	MenuName = "Filter register by range",
}

function SA_FilterRegister_RegisterRange:ShortDescriptionTestElement()
	if not self.invert then
		return string.format("keeping elements near elements in reg %s", SequenceMarkup_Parameter(self.register_other))
	else
		return string.format("keeping elements far from near elements reg %s", SequenceMarkup_Parameter(self.register_other))
	end
end

function SA_FilterRegister_RegisterRange:TestElement(obj, registers)
	local others = registers[self.register_other]
	for _,other in ipairs(others or empty_table) do
		if IsCloser2D(obj, other, self.range) then return true end
	end
end

local function GetBaseClasses()
	-- Populate with important base classes
	local base_classes = {"Unit", "DroneBase", "Building", "ElectricityConsumer"}
	return ListToComboItems(base_classes, true)
end

local function GetChildClasses(obj)
	if obj.base_class ~= "" then
		return ClassDescendantsList(obj.base_class)
	end
end

local function GetClassProperties(obj)
	if obj.base_class ~= "" or obj.child_class ~= "" then
		local properties
		if obj.child_class ~= "" then
			properties = g_Classes[obj.child_class]:GetProperties()
		else
			properties = g_Classes[obj.base_class]:GetProperties()
		end
		properties = table.ifilter(properties, function(name, value)
			return value.editor == "number" or value.editor == "text" or value.editor == "combo" or value.editor == "dropdownlist"
		end)
		table.sortby_field(properties, "id")
		return GetComboItems(properties, "id", "id")
	end
end

DefineClass.SA_FilterRegister_Property = {
	__parents = {"SA_FilterRegister"},
	properties = {
		{ id = "base_class", name = T{3698, "Base Class"}, help = "", editor = "dropdownlist", default = "", items = GetBaseClasses() , object_update = true },
		{ id = "child_class", name = T{3696, "Class"}, help = "", editor = "dropdownlist", default = "", items = GetChildClasses , object_update = true },
		{ id = "property", name = T{3699, "Property"}, help = "Property to compare against", editor = "combo", default = "", items = GetClassProperties , object_update = true},
		{ id = "value", name = T{3700, "Value"}, help = "Value to compare against", editor = "text", default = "" },
		{ id = "op", name = T{3701, "Op"}, help = "Comparison operator", editor = "combo", items = { "equal to", "less than", "less than or equal to"}, default = "equal to" },
	},
	MenuName = "Filter register by property",
}

function SA_FilterRegister_Property:OnPropertyChanged(prop_id, old_value, main_obj)
	if prop_id == "base_class" then
		self.child_class = ""
	end
end

function SA_FilterRegister_Property:ShortDescriptionTestElement()
	if not self.invert then
		return string.format("keeping elements with %s %s %s", 
			SequenceMarkup_Parameter(self.property), 
			self.op,
			SequenceMarkup_Parameter(self.value))
	else
		return string.format("removing elements with %s %s %s", 
			SequenceMarkup_Parameter(self.property), 
			self.op,
			SequenceMarkup_Parameter(self.value))
	end
end

function SA_FilterRegister_Property:TestElement(obj, registers)
	local obj_prop = obj:GetProperty(self.property)
	if type(obj_prop) == "number" then
		local value = tonumber(self.value)
		if self.op == "equal to" then return obj_prop == value end
		if self.op == "less than" then return obj_prop < value end
		if self.op == "less than or equal to" then return obj_prop <= value end
	else
		assert(self.op == "equal to")
		return self.op == "equal to" and obj_prop == self.value
	end
end


-- todo
-- mark for debugging
--+ leave only class
--x intersect with label
--x intersect with NOT label
--+ intersect with register
--+ intersect with NOT register
--+ inside range of register/label
--+ outside range of register/label
--+ filter properties of class/label
-- add class combo to filter by property, list only its properties; check it works for buildings too