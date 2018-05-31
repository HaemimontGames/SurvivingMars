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
	local title = XWindow:new({Margins = box(0,0,0,-1)},ctrl)
	XImage:new({
		Id = "idCatBkg",
		Image =  "UI/Common/bm_category_title.tga",
	}, title)
	XLabel:new({
		Id = "idSelectedCat",
		HAlign = "center",
		VAlign = "center",
		HandleKeyboard = false,
		TextFont = "BuildMenuCategory",
		TextColor = RGBA(129, 202, 233, 255),
		Text = "idSelectedCat",
		Translate = true,
	}, title)
	self.idSelectedCat:SetText(Untranslated("idSelectedCat"))
	--categories list
	local list = XWindow:new({},ctrl) 
	XImage:new({
		Id = "idCategoriesPad",
		Image = "UI/Common/bm_pad.tga",
	}, list)
	XImage:new({
		Id = "idCategoriesWatermark",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, list)
	XWindow:new({
		Id = "idCategoriesList",
		LayoutMethod = "HList",
		LayoutHSpacing = -15,
		HAlign =  "center",
		VAlign =  "center",
	}, list)
end
