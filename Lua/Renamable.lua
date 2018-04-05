DefineClass.Renamable = {
	__parents = {},
	max_name_len = 23,
	
	rename_allowed = true,
}

function Renamable:GetRenameInitText()
	return _InternalTranslate(self:GetDisplayName())
end

function Renamable:ShowRenameUI()
	CreateMarsRenameControl( nil,
		T{4033, "Rename <display_name>", self}, 
		self:GetRenameInitText(), 
		function(new_val) self.name = new_val end, 
		__empty_function__,
		nil, {max_len = self.max_name_len}
	)
end

DefineClass.NotRenamableBuilding = {
	__parents = {"Building"},
	rename_allowed = false,	
}