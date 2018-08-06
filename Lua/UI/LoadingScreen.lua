DefineClass.MarsBaseLoadingScreen = {
	__parents = { "BaseLoadingScreen" },
	MouseCursor = "UI/Cursors/Loading.tga",
}

DefineClass.MarsLoadingScreen = {
	__parents = { "MarsBaseLoadingScreen" },
	FadeOutTime = 300,
 	Background = RGB(0, 0, 0),
	MouseCursor = "UI/Cursors/Loading.tga",
}

function MarsLoadingScreen:Init()
	local dlg = GetDialog("OnScreenIndication")
	if dlg then dlg:SetVisible(false) end
end

g_LoadingScreens = {
	"UI/SplashScreen.tga",
	"UI/LoadingScreens/002.tga",
	"UI/LoadingScreens/003.tga",
	"UI/LoadingScreens/004.tga",
	"UI/LoadingScreens/005.tga",
	"UI/LoadingScreens/006.tga",
	"UI/LoadingScreens/007.tga",
	"UI/LoadingScreens/008.tga",
	"UI/LoadingScreens/009.tga",
	"UI/LoadingScreens/010.tga",
	"UI/LoadingScreens/011.tga",
}

g_FirstLoadingScreen = true

function MarsLoadingScreen:Open(...)
	self.image = g_FirstLoadingScreen and "UI/SplashScreen.tga" or table.rand(g_LoadingScreens)
	g_FirstLoadingScreen = false
	MarsBaseLoadingScreen.Open(self, ...)
end

DefineClass.MarsAutosaveScreen = {
	__parents = { "BaseLoadingScreen" },
	MouseCursor = "UI/Cursors/Loading.tga",
}

DefineClass.MarsDeleteGameScreen = {
	__parents = { "BaseLoadingScreen" },
	MouseCursor = "UI/Cursors/Loading.tga",
}

function LoadingScreenGetClassById(id)
	if id == "idSaveProfile" then
		return "BaseSavingScreen"
	elseif id == "idAutosaveScreen" then
		return "XMarsAutosaveScreen"
	elseif id == "idDeleteScreen" then
		return "XMarsDeleteGameScreen"
	end
	return "XMarsLoadingScreen"
end