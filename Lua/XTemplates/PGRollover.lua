-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "PGRollover",
	PlaceObj('XTemplateWindow', {
		'Id', "idPGRollover",
		'IdNode', true,
		'HandleKeyboard', false,
		'ChildrenHandleMouse', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idFrame",
			'Image', "UI/CommonNew/mm_rollover.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'IdNode', false,
			'Padding', box(10, 10, 10, 10),
			'HAlign', "left",
			'FadeInTime', 300,
			'FadeOutTime', 100,
			'TextStyle', "RolloverTextStyle",
			'Translate', true,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetRollover(self, rollover)",
			'func', function (self, rollover)
if self.idText:GetText()=="" then return end
XWindow.SetRollover(self, rollover)
self:SetVisible(true)

self.idFrame:AddInterpolation{
	id = "move",
	type = const.intRect,
	duration = 200,
	startRect =  self.box,
	endRect =sizebox(self.box:minx(),self.box:maxy(),self.box:sizex(),0),
	flags =rollover and const.intfInverse or nil,
}
self.idText:AddInterpolation{
	id = "move",
	type = const.intRect,
	start = GetPreciseTicks() + 100,
	duration = 100,
	startRect =  self.box,
	endRect =sizebox(self.box:minx(),self.box:maxy(),self.box:sizex(),0),
	flags =rollover and const.intfInverse or nil,
}
self.idText:SetVisible(rollover)
end,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Text",
		'editor', "text",
		'Set', function (self, value)
self.idText:SetText(value)
end,
		'Get', function (self)
return self.idText:GetText()
end,
		'name', T{720368811140, --[[XTemplate PGRollover name]] "Text"},
	}),
})

