-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XDialog",
	group = "PreGame",
	id = "SaveLoadDlg",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return SaveLoadObjectCreateAndLoad() end,
		'__class', "XDialog",
		'HandleMouse', true,
		'InternalModes', "save,load,delete",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
CreateRealTimeThread(function()
	Savegame.Unmount()
	WaitFreeCurrentScreenshot()
end)
g_SaveGameObj = false
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetMode(self, mode, mode_param)",
			'func', function (self, mode, mode_param)
CreateRealTimeThread(function(self, mode, mode_param)
	local loading_screen_opened = false
	if not self.context.initialized then
		local open_screen = Platform.console or WaitCountSaveGames() > 15
		if open_screen then
			loading_screen_opened = true
			LoadingScreenOpen("idLoadingScreen", "save load")
		end
	end
	if self.Mode ~= mode then
		self.idDescription:SetVisible(false, true)
		if self.Mode == "save" then
			WaitFreeCurrentScreenshot()
		elseif mode == "save" then
			WaitCaptureCurrentScreenshot()
		end
	end
	if self.window_state ~= "destroying" then
		if not self.context.initialized then
			self.context:WaitGetSaveItems()
		end
		g_CurrentSaveGameItemId = false
		XDialog.SetMode(self, mode, mode_param)
	end
	if loading_screen_opened then
		LoadingScreenClose("idLoadingScreen", "save load")
	end
end, self, mode, mode_param)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
return XDialog.OnShortcut(self, shortcut, source)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__condition', function (parent, context) return not GameState.gameplay end,
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'__condition', function (parent, context) return not GameState.gameplay end,
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "SaveLoadContentWindow",
			}),
			}),
		PlaceObj('XTemplateGroup', {
			'__condition', function (parent, context) return GameState.gameplay end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "SaveLoadContentWindow",
			}),
			PlaceObj('XTemplateLayer', {
				'layer', "XHideInGameInterfaceLayer",
			}),
			PlaceObj('XTemplateLayer', {
				'layer', "XPauseLayer",
			}),
			PlaceObj('XTemplateLayer', {
				'layer', "XCameraLockLayer",
			}),
			}),
		}),
})

