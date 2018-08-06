DefineClass.LabelContainer = {
	__parents = { "InitDone" },
	labels = false,
	label_modifiers = false,
}

function LabelContainer:Init()
	self.labels = {}
	self.label_modifiers = {}
end

function LabelContainer:InitEmptyLabel(label)
	self.labels[label] = self.labels[label] or {}
end

function LabelContainer:AddToLabel(label, obj)
	if not label or not obj then return end
	--print("AddToLabel", label, obj.class)
	local label_list = self.labels[label]
	if label_list then
		if not table.find(label_list, obj) then
			--insert into label
			label_list[#label_list + 1] = obj
		else
			--obj already in label
			--exit so we don't modify properties multiple times
			return
		end
	else
		label_list = { obj }
		self.labels[label] = label_list
	end
	local modifiers = self.label_modifiers[label]
	if modifiers then
		for id, mod in pairs(modifiers) do
			obj:UpdateModifier("add", mod, mod.amount, mod.percent)
		end
	end
	return true
end

function LabelContainer:RemoveFromLabel(label, obj, leave_modifiers)
	if not label or not obj then return end
	--print("RemoveFromLabel", label, obj.class)
	local label_list = self.labels[label]
	if label_list and table.remove_entry(label_list, obj) then
		if not leave_modifiers then
			local modifiers = self.label_modifiers[label]
			if modifiers then
				for id, mod in pairs(modifiers) do
					obj:UpdateModifier("remove", mod, - mod.amount, - mod.percent)
				end
			end
		end
		return true
	end
end

function LabelContainer:IsInLabel(label, obj)
	if label and obj and table.find(self.labels[label], obj) then
		return true
	end
	return false
end

function LabelContainer:IsInAnyLabel(labels, obj)
	if not labels or not obj then
	elseif type(labels) == "string" then
		if table.find(self.labels[labels], obj) then
			return labels
		end
	else
		for i = 1, #labels do
			local label = labels[i]
			if table.find(self.labels[label], obj) then
				return label 
			end
		end
	end
	return false
end

local function UpdateModWithoutCheck(obj, ...) 
	return obj:UpdateModifier(...) 
end

local function UpdateModWithCheck(obj, action, mod, ...)
	if obj:HasMember(mod.prop) then
		return obj:UpdateModifier(action, mod, ...)
	end
end

function LabelContainer:SetLabelModifier(label, id, modifier, check_if_prop_exists)
	local f = check_if_prop_exists and UpdateModWithCheck or UpdateModWithoutCheck
	
	self.label_modifiers[label] = self.label_modifiers[label] or {}
	local modifiers = self.label_modifiers[label]
	local old_mod = modifiers[id]
	if old_mod then
		for _, obj in ipairs(self.labels[label] or empty_table) do
			f(obj, "remove", old_mod, - old_mod.amount, - old_mod.percent)
		end
	end
	modifiers[id] = modifier or nil
	if modifier then
		for _, obj in ipairs(self.labels[label] or empty_table) do
			f(obj, "add", modifier, modifier.amount, modifier.percent)
		end
	end
end

if Platform.developer then
	function DbgTestLabelAccess(label, container)
		container = container or UICity
		local labels = container.labels
		container.labels = setmetatable({}, {
			__index = function(_, name)
				assert(name ~= label)
				return labels[name]
			end,
			__newindex = function(_, name, new_label)
				labels[name] = new_label
			end,
		})
	end
end
