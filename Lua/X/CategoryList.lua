DefineClass.CategoryList = {
	__parents = {"XControl"},
	id = "idCategoryList",
}

function CategoryList:Init()
	local ctrl = XWindow:new( {
		Dock = "bottom",
		LayoutMethod = "VList",
	},self) 
	--category title
	local title = XFrame:new({
		Id = "idCatBkg",
		Image =  "UI/CommonNew/bm_categories.tga",
		Padding = box(100, 5, 100, 5),
		MinWidth = 400,
		HAlign = "center",
		IdNode = false,
	}, ctrl)
	XLabel:new({
		Id = "idSelectedCat",
		HAlign = "center",
		VAlign = "center",
		HandleKeyboard = false,
		TextStyle = "CategoryTitle",
		Text = "idSelectedCat",
		Translate = true,
	}, title)
	self.idSelectedCat:SetText(Untranslated("idSelectedCat"))
	--categories list
	local list = XWindow:new({
		HAlign = "center",
	}, ctrl)
	XFrame:new({
		Id = "idCategoriesPad",
		Image = "UI/CommonNew/bm_categories.tga",
		Margins = box(-150, 0, -150, 0),
		FrameBox = box(295, 0, 295, 0),
		IdNode = false,
	}, list)
	XWindow:new({
		Id = "idCategoriesList",
		LayoutMethod = "HList",
		LayoutHSpacing = -15,
		HAlign =  "center",
		VAlign =  "center",
	}, list)
	
	if GetUIStyleGamepad() then
		XImage:new({
			Id = "idGamepadHintLeft",
			Dock = "left",
			VAlign = "center",
			Image = GetPlatformSpecificImagePath("LB"),
		}, list)
		XImage:new({
			Id = "idGamepadHintRight",
			Dock = "right",
			VAlign = "center",
			Image = GetPlatformSpecificImagePath("RB"),
		}, list)
	end
end
