DefineClass.SplashScreen = {
	__parents = {"XDialog"},
	Background = RGB(0, 0, 0),
	HandleMouse = true,
	MouseCursor = "UI/Cursors/Cursor.tga",
	aspect = point(1, 1),
}

function SplashScreen:Init()
	XAspectWindow:new({
		Id = "idContent",
		Fit = "smallest",
		Aspect = self.aspect,
	}, self)
	local button = XTextButton:new({
		Id = "idButton",
		Margins = box(0,0,20,80),
		HAlign = "right",
		VAlign = "bottom",
		Background = RGBA(0, 0, 0, 0),
		RolloverZoom = 1100,
		MouseCursor = "UI/Cursors/Rollover.tga",
		FXMouseIn = "ActionButtonHover",
		FXPress = "ActionButtonClick",
		FocusedBackground = RGBA(0, 0, 0, 0),
		RolloverBackground = RGBA(0, 0, 0, 0),
		PressedBackground = RGBA(0, 0, 0, 0),
		TextStyle = "SkipHint",
		Translate = true,
		OnPress = function()
			self:Close()
		end,
	}, self.idContent)
	button:SetText(T(7976, "SKIP"))
	button:SetVisible(false)
	if GetUIStyleGamepad() then
		local image_path, scale = GetPlatformSpecificImagePath("ButtonB")
		XImage:new({
			Image = image_path,
			ZOrder = 0,
			ImageScale = point(scale, scale),
		}, button)
	else
		local label = XLabel:new({
			ZOrder = 0,
			TextStyle = "SplashScreenHint",
			VAlign = "center",
			Translate = true,
		}, button)
		label:SetText(T(1000159, "Escape"))
	end
end

function SplashScreen:Open(...)
	XDialog.Open(self, ...)
	ShowMouseCursor(self)
end

function SplashScreen:Close(...)
	XDialog.Close(self, ...)
	HideMouseCursor(self)
end

function SplashScreen:OnShortcut(shortcut, source)
	if (shortcut == "ButtonB" or shortcut == "Escape" or shortcut == "MouseL") and not self.idButton:GetVisible() then
		self.idButton:SetVisible(true)
		return "break"
	elseif self.idButton:GetVisible() and (shortcut == "ButtonB" or shortcut == "Escape" or shortcut == "MouseL") then
		self:Close()
		return "break"
	end
	XDialog.OnShortcut(self, shortcut, source)
end

DefineClass.XSplashImage = {
	__parents = { "SplashScreen" },
	Id = "idXSplashScreenImage",
}

function XSplashImage:Init()
	XImage:new({
		Id = "idImage",
		Image = self.image,
		HAlign = "center",
		VAlign = "center",
		ImageFit = "smallest",
		FadeInTime = self.fadeTime,
		FadeOutTime = self.fadeTime,
	}, self.idContent)
	self:CreateThread("wait", function()
		Sleep(self.fadeTime)
		Sleep(self.time)
		self.idImage:Close()
		Sleep(self.fadeTime)
		self:Close()
	end)
end

DefineClass.XSplashMovie = {
	__parents = {"SplashScreen"},
	Id = "idXSplashScreenMovie",
}

function XSplashMovie:Init()
	local video = XVideo:new({
		Id = "idMovie",
		ZOrder = -1,
		FileName = self.movie,
		Sound = self.movie,
	}, self.idContent)
	video:SetAutoPlay(true)
	video.OnEnd = function()
		self:Close()
	end
end

function SplashImage(image, fadeTime, time, aspect)
	local dlg = XSplashImage:new({
		image = image,
		fadeTime = fadeTime,
		time = time,
		aspect = aspect,
	}, terminal.desktop)
	dlg:Open()
	return dlg
end

function SplashMovie(movie, aspect)
	local dlg = XSplashMovie:new({movie = movie, aspect = aspect}, terminal.desktop)
	dlg:Open()
	return dlg
end

function PlayInitialMovies()
	SplashImage("UI/ParadoxLogo.tga", 500, 4000):Wait()
	SplashImage("UI/HaemimontLogo.tga", 500, 4000):Wait()
	--SplashMovie("Movies/Haemimont", point(16,9)):Wait()
end