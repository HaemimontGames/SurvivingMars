DefineClass.XActionBar = {
	__parents = {"XWindow"},
	Id = "idActionBar",
	Dock = "bottom",
	HAlign = "right",
}

function XActionBar:Init(parent, context)
	XFrame:new({
		Margins = box(-340, -70, -40, -10),
		Image = "UI/Common/pm_pad_large.tga",
		FrameBox = box(320, 0, 40, 0),
		SqueezeY = false,
	}, self)
	XToolBar:new({
		HAlign = "right",
		VAlign = "bottom",
		LayoutHSpacing = 60,
		Background = RGBA(0,0,0,0),
		Toolbar = "ActionBar",
		Show = "text",
		ButtonTemplate = "MenuEntry",
	}, self)
end