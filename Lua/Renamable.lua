DefineClass.Renamable = {
	__parents = {},
	max_name_len = 23,
	
	rename_allowed = true,
}

function Renamable:GetRenameInitText()
	return _InternalTranslate(self:GetDisplayName())
end

function Renamable:ShowRenameUI(gamepad)
	CreateMarsRenameControl( nil,
		T{4033, "Rename <display_name>", self}, 
		self:GetRenameInitText(), 
		function(new_val) self.name = new_val end, 
		empty_func,
		nil, {max_len = self.max_name_len, console_show = not gamepad or (gamepad and Platform.steam)}
	)
end

DefineClass.NotRenamableBuilding = {
	__parents = {"Building"},
	rename_allowed = false,	
}