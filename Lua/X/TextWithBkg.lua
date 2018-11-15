DefineClass.TextWithBkg = {
	__parents = {"XControl"},	
	HandleMouse = false,
	image = false,
	
	HAlign = "center",
	VAlign = "center",
}

function TextWithBkg:Init()
	XImage:new({
		Id =  "idBackImage",
		--HAlign =  "center",
		--VAlign =  "center",
		Image =  self.image,
		ImageFit = "stretch-x",
		Margins = box(-15,0,-15,0),
	}, self)
	XText:new({
		Id =  "idText",
		HAlign = "center",
		VAlign = "center",
		TextStyle = "HexButtonLabel",
		Translate = true,
		TextHAlign = "center",
		MaxWidth = 190,
	}, self)
end

function TextWithBkg:SetText(text)
	self.idText:SetText(text)
end

function TextWithBkg:GetText()
	return self.idText:GetText()
end

function TextWithBkg:SetImage(img)
	self.idBackImage:SetImage(img)
end

function TextWithBkg:GetImage()
	return self.idBackImage:GetImage()
end

function TextWithBkg:OnMouseEnter(...)
	return self.idText:OnMouseEnter(...)
end
function TextWithBkg:OnMouseLeft(...)
	return self.idText:OnMouseLeft(...)
end
