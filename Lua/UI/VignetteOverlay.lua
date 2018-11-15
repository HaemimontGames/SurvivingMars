DefineClass.XVignetteOverlay =
{
	__parents = { "XDialog" },
	Id = "idVignetteOverlay",
	FocusOnOpen = "",
}

function XVignetteOverlay:Init()
	XImage:new({
		Id = "idBottomLeft",
		Image = "UI/Onscreen/onscreen_gradient.tga",
		HAlign = "left",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idBottomRight",
		Image = "UI/Onscreen/onscreen_gradient.tga",
		HAlign = "right",
		VAlign = "bottom",
		FlipX = true,
	}, self)
	XImage:new({
		Id = "idTopLeft",
		Image = "UI/Onscreen/onscreen_gradient.tga",
		HAlign = "left",
		VAlign = "top",
		FlipY = true,
	}, self)
	XImage:new({
		Id = "idTopRight",
		Image = "UI/Onscreen/onscreen_gradient.tga",
		HAlign = "right",
		VAlign = "top",
		FlipX = true,
		FlipY = true,
	}, self)
end

function XVignetteOverlay:SetImage(image)
	self.idBottomLeft:SetImage(image)
	self.idBottomRight:SetImage(image)
	self.idTopLeft:SetImage(image)
	self.idTopRight:SetImage(image)
end

function XVignetteOverlay:Pulse(vignette_pulse_duration)
	local interpolation = {
		id = "VignetteAlpha",
		type = const.intAlpha,
		startValue = 0,
		endValue = 255,
		duration = vignette_pulse_duration,
		flags = const.intfPingPong,
	}
	self:AddInterpolation(interpolation)
end