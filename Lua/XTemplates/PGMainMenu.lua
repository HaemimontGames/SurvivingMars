-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMainMenu",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'InitialMode', "Main",
		'InternalModes', "Main, NewGame",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
ShowMouseCursor("PreGame")
StopRadioStation()
SetMusicPlaylist("MainTheme")
if Platform.durango and DurangoNewDlc then
	DurangoNewDlc = false
	self:CreateThread("DurangoDlc", function() 
		LoadDlcs("force reload")
		OpenPreGameMainMenu()
	end)
end
RemoveOutdatedMods(self)
self:SetMode("Main")
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetMode(self, mode, mode_param)",
			'func', function (self, mode, mode_param)
if mode=="" then mode = "Main" end			
if self.Mode == mode or mode ~= "" then
	XDialog.SetMode(self, mode, mode_param)
	return
end
CreateRealTimeThread(function(self, mode, mode_param)
	self.context.savegame_count = WaitCountSaveGames()
	XDialog.SetMode(self, mode, mode_param)
end, self, mode, mode_param)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
HideMouseCursor("PreGame")
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'Id', "idContent",
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "Main",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMenu",
				}),
				PlaceObj('XTemplateLayer', {
					'__condition', function (parent, context) return Platform.durango and Durango.IsPlayerSigned(XPlayerActive) end,
					'layer', "DurangoActivePlayer",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "NewGame",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMenu",
				}),
				PlaceObj('XTemplateLayer', {
					'__condition', function (parent, context) return Platform.durango and Durango.IsPlayerSigned(XPlayerActive) end,
					'layer', "DurangoActivePlayer",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Paradox",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ParadoxAccountDialog",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Mission",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGMission",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Options",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "OptionsDlg",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Load",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "SaveLoadDlg",
					'InitialMode', "load",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Tutorial",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGTutorial",
					'HostInParent', true,
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "Challenge",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "PGChallenge",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "ModManager",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ModManager",
				}),
				}),
			}),
		}),
})

