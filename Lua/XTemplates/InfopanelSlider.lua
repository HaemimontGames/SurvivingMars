-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XScrollControl",
	group = "Infopanel",
	id = "InfopanelSlider",
	PlaceObj('XTemplateWindow', {
		'__class', "XScrollThumb",
		'Margins', box(0, 16, 0, 16),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'Horizontal', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'ZOrder', 0,
			'Image', "UI/Infopanel/progress_bar.tga",
			'FrameBox', box(5, 0, 5, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idThumb",
			'Image', "UI/Infopanel/progress_bar_slider.tga",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'parent', function (parent, context) return parent:ResolveId("node") end,
			'func', function (self, shortcut, source)
if shortcut == "LeftShoulder" or shortcut == "RightShoulder" then
	local children = GetChildrenOfKind(self, "XScrollThumb")
	if children and children[1] and children[1].BindTo then
		local slider = children[1]
		local prop = slider.BindTo
		local obj = slider.context
		local amount = obj:GetProperty(prop)
		local prop_meta = obj:GetPropertyMetadata(prop)
		local step = shortcut == "LeftShoulder" and -(prop_meta.step or 1) or prop_meta.step or 1
		local new_amount = amount + step
		local min = type(prop_meta.min) == "function" and prop_meta.min(obj) or prop_meta.min
		local max = type(prop_meta.max) == "function" and prop_meta.max(obj) or prop_meta.max
		if min then
			new_amount = Max(new_amount, min)
		end
		if max then
			new_amount = Min(new_amount, max)
		end
		obj:SetProperty(prop, new_amount)
		ObjModified(obj)
		return "break"
	end
end
return XSection.OnShortcut(self, shortcut, source)
end,
		}),
		}),
})

