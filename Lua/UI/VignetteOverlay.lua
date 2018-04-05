DefineClass.XVignetteOverlay =
{
	__parents = { "XDialog" },
	Id = "idVignetteOverlay",
	FocusOnOpen = "",
}

function XVignetteOverlay:Init()
	XImage:new({
		Angle = 16200,
		Id = "idTop",
		Image = "UI/Vignette_Blue.tga",
		HAlign = "center",
		VAlign = "top",
	}, self)
	XImage:new({
		Angle = 10800,
		Id = "idLeft",
		Image = "UI/Vignette_Blue.tga",
		HAlign = "left",
		VAlign = "center",
	}, self)
	XImage:new({
		Id = "idRight",
		Image = "UI/Vignette_Blue.tga",
		HAlign = "right",
		VAlign = "center",
	}, self)
	XImage:new({
		Angle = 5400,
		Id = "idBottom",
		Image = "UI/Vignette_Blue.tga",
		HAlign = "center",
		VAlign = "bottom",
	}, self)
	self.idTop:SetTransparency(100)
	self.idLeft:SetTransparency(100)
	self.idRight:SetTransparency(100)
	self.idBottom:SetTransparency(100)
end

function XVignetteOverlay:SetImage(image)
	self.idTop:SetImage(image)
	self.idLeft:SetImage(image)
	self.idRight:SetImage(image)
	self.idBottom:SetImage(image)
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