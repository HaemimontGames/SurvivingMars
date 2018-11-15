DefineClass.MenuCategoryButton = {
	__parents = {"XControl"},
	image = "UI/Icons/bmc_building_resources.tga",
	highlight = "UI/Icons/bmc_building_resources_shine.tga",
	id = false,
	name =false,
	
	MaxWidth = 200,
	MaxHeight = 200,
	
	HandleMouse = false,
}
function MenuCategoryButton:Init()
	XImage:new({
		Id    = "idCategorySelection",
		Shape = "InHHex",
		Image = "UI/Common/bm_category_shine.tga",
	}, self)	
	self.idCategorySelection:SetVisible(false, "instant")
	
	XImage:new({
		Id = "idCategoryRollover",
		Shape = "InHHex",
		Image = "UI/Common/bm_category_shine.tga",
		Transparency = 80,
	}, self)
	self.idCategoryRollover:SetVisible(false, "instant")
	
	XWindow:new({
		Id = "idButton",
		HAlign = "center",
		VAlign = "center",
		MinWidth = 50,
		MinHeight = 50,
		MaxWidth = 50,
		MaxHeight = 50,
		MouseCursor =  "UI/Cursors/Rollover.tga",
		HandleMouse = false,
	},self)
	XTextButton:new({
		Id  = "idCategoryButton",
		Image = self.image,
		Columns = 2,
		ColumnsUse = "abbba",
		MouseCursor =  "UI/Cursors/Rollover.tga",
		FXMouseIn = "UIButtonMouseIn",
	},self.idButton)
	XImage:new({
		Id = "idCategoryHighlight",
		Visible = false,
		EnableFX = false,
		Image = self.highlight,
		HandleMouse = false,
	},self.idButton)
	self.idCategoryHighlight:SetVisible(false)
	self:SetId(self.id)
end		

function MenuCategoryButton:SetEnabled(enabled, ...)
	self.idCategoryButton:SetEnabled(enabled, ...)
	self.idCategoryButton.idIcon:SetDesaturation(enabled and 0 or 255)
	self.idCategoryButton.idIcon:SetTransparency(enabled and 0 or 105)
end
	