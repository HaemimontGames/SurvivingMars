-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "HUD",
	PlaceObj('XTemplateWindow', {
		'__class', "HUD",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idtxtConstructionStatus",
			'Dock', "box",
			'HAlign', "left",
			'VAlign', "top",
			'Clip', false,
			'HandleMouse', false,
			'TextStyle', "OnScreenStatus",
			'Translate', true,
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "determine vertical size",
			'__context', function (parent, context) return parent end,
			'Id', "idBottom",
			'VAlign', "bottom",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idLeft",
				'IdNode', false,
				'HAlign', "left",
				'MinWidth', 350,
				'Image', "UI/CommonNew/options.tga",
				'FrameBox', box(0, 0, 190, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "center controls",
					'HAlign', "center",
					'VAlign', "center",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateWindow', {
						'comment', "align buttons",
						'Margins', box(50, 0, 0, 5),
						'HAlign', "left",
						'VAlign', "bottom",
						'LayoutMethod', "HList",
						'LayoutHSpacing', 10,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "HUDButtonTemplate",
							'RolloverText', T(4017, --[[XTemplate HUD RolloverText]] "Pause the game."),
							'RolloverTitle', T(6869, --[[XTemplate HUD RolloverTitle]] "Pause"),
							'RolloverHint', T(10094, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionPauseGame')></em> Pause/unpause"),
							'Id', "idPause",
							'Image', "UI/HUD/pause.tga",
							'ImageShine', "UI/HUD/double_speed_shine.tga",
							'FXMouseIn', "SpeedControlMouseOver",
							'Rows', 2,
							'OnPress', function (self, gamepad)
if GetTimeFactor() == 0 then
	UICity:SetGameSpeed(false)
	UISpeedState = rawget(self, "PrevUISpeedState") or "play"
else
	UICity:SetGameSpeed(0)
	rawset(self, "PrevUISpeedState", UISpeedState)
	UISpeedState = "pause"
end
end,
							'ImageScale', 900,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "HUDButtonTemplate",
							'RolloverText', T(4020, --[[XTemplate HUD RolloverText]] "Play at normal speed."),
							'RolloverTitle', T(4019, --[[XTemplate HUD RolloverTitle]] "Normal"),
							'RolloverHint', T(4021, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')></em> Change game speed"),
							'Id', "idPlay",
							'Image', "UI/HUD/normal_speed.tga",
							'ImageShine', "UI/HUD/double_speed_shine.tga",
							'FXMouseIn', "SpeedControlMouseOver",
							'Rows', 2,
							'OnPress', function (self, gamepad)
UICity:SetGameSpeed(1)
UISpeedState = "play"
end,
							'ImageScale', 900,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "HUDButtonTemplate",
							'RolloverText', T(4023, --[[XTemplate HUD RolloverText]] "Play at three times normal speed."),
							'RolloverTitle', T(4022, --[[XTemplate HUD RolloverTitle]] "Fast"),
							'RolloverHint', T(4021, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')></em> Change game speed"),
							'Id', "idMedium",
							'Image', "UI/HUD/double_speed.tga",
							'ImageShine', "UI/HUD/double_speed_shine.tga",
							'FXMouseIn', "SpeedControlMouseOver",
							'Rows', 2,
							'OnPress', function (self, gamepad)
UICity:SetGameSpeed(const.mediumGameSpeed)
UISpeedState = "medium"
end,
							'ImageScale', 900,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "HUDButtonTemplate",
							'RolloverText', T(4025, --[[XTemplate HUD RolloverText]] "Play at five times normal speed."),
							'RolloverTitle', T(4024, --[[XTemplate HUD RolloverTitle]] "Fastest"),
							'RolloverHint', T(4021, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionSpeedUp')>/<ShortcutName('actionSpeedDown')></em> Change game speed"),
							'Id', "idFast",
							'Image', "UI/HUD/super_fast_speed.tga",
							'ImageShine', "UI/HUD/double_speed_shine.tga",
							'FXMouseIn', "SpeedControlMouseOver",
							'Rows', 2,
							'OnPress', function (self, gamepad)
UICity:SetGameSpeed(const.fastGameSpeed)
UISpeedState = "fast"
end,
							'ImageScale', 900,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "align displays",
						'__context', function (parent, context) return UICity end,
						'Id', "idSolDisplay",
						'Margins', box(25, 0, 0, 0),
						'HAlign', "left",
						'VAlign', "bottom",
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'RolloverTemplate', "Rollover",
							'RolloverText', T(4027, --[[XTemplate HUD RolloverText]] "Hour <hour> of Sol <day>.\n\nMartian days consist of nearly 25 Earth hours."),
							'RolloverTitle', T(4026, --[[XTemplate HUD RolloverTitle]] "Solar Date"),
							'Id', "idSol",
							'VAlign', "center",
							'TextStyle', "HUDStat",
							'Translate', true,
							'Text', T(4031, --[[XTemplate HUD Text]] "Sol <day>"),
							'WordWrap', false,
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XFrameProgress",
							'RolloverTemplate', "Rollover",
							'RolloverText', T(8104, --[[XTemplate HUD RolloverText]] "Martian days consist of nearly 25 Earth hours."),
							'RolloverTitle', T(4028, --[[XTemplate HUD RolloverTitle]] "Solar Time: <white>Hour <hour> of Sol <day></white>"),
							'Id', "idDayProgress",
							'HAlign', "center",
							'VAlign', "center",
							'MinWidth', 146,
							'MinHeight', 20,
							'MaxWidth', 146,
							'HandleMouse', true,
							'Image', "UI/HUD/day_pad.tga",
							'FrameBox', box(5, 0, 5, 0),
							'MaxProgress', 1000,
							'ProgressImage', "UI/HUD/day_cycle.tga",
							'SeparatorOffset', 4,
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idMiddle",
				'IdNode', false,
				'Padding', box(120, 0, 120, 0),
				'HAlign', "center",
				'MinWidth', 350,
				'Image', "UI/CommonNew/Hud.tga",
				'FrameBox', box(216, 0, 216, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "align buttons",
					'Padding', box(0, 8, 0, 8),
					'HAlign', "center",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 18,
					'HandleMouse', true,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4002, --[[XTemplate HUD RolloverText]] "Order new construction. Construction usually requires resources and Drone workers in the area."),
						'RolloverTitle', T(383281603855, --[[XTemplate HUD RolloverTitle]] "Build Menu"),
						'RolloverHint', T(11864, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionOpenBuildMenu', 'keyboard')></em> Toggle Build Menu"),
						'RolloverHintGamepad', T(4003, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionOpenBuildMenu')></em> Toggle Build Menu"),
						'Id', "idBuild",
						'Image', "UI/HUD/build.tga",
						'ImageShine', "UI/HUD/build_shine.tga",
						'FXPress', "BuildMenuButtonClick",
						'Rows', 2,
						'OnPress', function (self, gamepad)
HUD.idBuildOnPress()
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4012, --[[XTemplate HUD RolloverText]] "Switch between normal camera mode and Map Overview."),
						'RolloverTitle', T(786525376837, --[[XTemplate HUD RolloverTitle]] "Map Overview"),
						'RolloverHint', T(11865, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionMapOverview', 'keyboard')></em> Toggle Overview Mode"),
						'RolloverHintGamepad', T(4013, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionMapOverview')></em> Toggle Overview Mode"),
						'Id', "idOverview",
						'Image', "UI/HUD/overlays.tga",
						'ImageShine', "UI/HUD/overlays_shine.tga",
						'FXPress', "OverviewButtonClick",
						'Rows', 2,
						'OnPress', function (self, gamepad)
HUD.idOverviewOnPress()
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4006, --[[XTemplate HUD RolloverText]] "Request a new cargo or passenger Rocket from Earth."),
						'RolloverDisabledText', T(8958, --[[XTemplate HUD RolloverDisabledText]] "Not yet available."),
						'RolloverTitle', T(3997, --[[XTemplate HUD RolloverTitle]] "Resupply"),
						'RolloverHint', T(11866, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionResupplyScreen', 'keyboard')></em> Open Resupply Screen"),
						'RolloverHintGamepad', T(4007, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionResupplyScreen')></em> Open Resupply Screen"),
						'Id', "idResupply",
						'Image', "UI/HUD/resupply.tga",
						'ImageShine', "UI/HUD/resupply_shine.tga",
						'FXPress', "ResupplyButtonClick",
						'OnPress', function (self, gamepad)
HUD.idResupplyOnPress()
end,
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(IsHUDResupplyEnabled())
HUD.UpdateDesatModifier(self)

if g_Tutorial and not g_Tutorial.EnableResupply then
	self:SetRolloverDisabledText(T(8958, "Not yet available."))
else
	self:SetRolloverDisabledText(T(4009, "<red>All resupply missions are suspended.</red>"))
end
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4004, --[[XTemplate HUD RolloverText]] "Manage the research of new Technologies.\n\nCurrent Research: <em><CurrentResearchName></em>\n<left>Research progress: <em><percent(CurrentResearchProgress)></em>"),
						'RolloverDisabledText', T(8958, --[[XTemplate HUD RolloverDisabledText]] "Not yet available."),
						'RolloverTitle', T(311, --[[XTemplate HUD RolloverTitle]] "Research"),
						'RolloverHint', T(11867, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionResearchScreen', 'keyboard')></em> Open Research Screen"),
						'RolloverHintGamepad', T(4005, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionResearchScreen')></em> Open Research Screen"),
						'Id', "idResearch",
						'Image', "UI/HUD/research.tga",
						'ImageShine', "UI/HUD/research_shine.tga",
						'FXPress', "ResearchButtonClick",
						'OnPress', function (self, gamepad)
HUD.idResearchOnPress()
end,
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(IsHUDResearchEnabled())
HUD.UpdateDesatModifier(self)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(8980, --[[XTemplate HUD RolloverText]] "Provides historical stats and tools to inspect and manage Buildings, Domes, Colonists and transportation."),
						'RolloverTitle', T(137542936955, --[[XTemplate HUD RolloverTitle]] "Command Center"),
						'RolloverHint', T(11868, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionColonyControlCenter', 'keyboard')></em> Тoggle Command Center"),
						'RolloverHintGamepad', T(8981, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionColonyControlCenter')></em> Тoggle Command Center"),
						'Id', "idColonyControlCenter",
						'Image', "UI/HUD/command_center.tga",
						'ImageShine', "UI/HUD/command_center_shine.tga",
						'FXPress', "ColonyControlCenterButtonClick",
						'OnPress', function (self, gamepad)
HUD.idColonyControlCenterOnPress()
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4010, --[[XTemplate HUD RolloverText]] "Shows Colony Milestones and Score."),
						'RolloverDisabledText', T(8958, --[[XTemplate HUD RolloverDisabledText]] "Not yet available."),
						'RolloverTitle', T(973748367669, --[[XTemplate HUD RolloverTitle]] "Milestones"),
						'RolloverHint', T(11869, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionMilestonesScreen', 'keyboard')></em> Open Milestones Screen"),
						'RolloverHintGamepad', T(4011, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionMilestonesScreen')></em> Open Milestones Screen"),
						'Id', "idMilestones",
						'Image', "UI/HUD/missions.tga",
						'ImageShine', "UI/HUD/missions_shine.tga",
						'FXPress', "ColonyControlCenterButtonClick",
						'Rows', 2,
						'OnPress', function (self, gamepad)
HUD.idMilestonesOnPress()
end,
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(not g_Tutorial)
HUD.UpdateDesatModifier(self)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(10093, --[[XTemplate HUD RolloverText]] "Information about sponsor goals and mission parameters."),
						'RolloverTitle', T(10092, --[[XTemplate HUD RolloverTitle]] "Mission Profile"),
						'RolloverHint', T(11870, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionMissionProfile', 'keyboard')></em> Open Mission Profile"),
						'RolloverHintGamepad', T(11029, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionMissionProfile')></em> Open Mission Profile"),
						'Id', "idGoals",
						'Image', "UI/HUD/goals.tga",
						'ImageShine', "UI/HUD/goals_shine.tga",
						'FXPress', "BuildMenuButtonClick",
						'OnPress', function (self, gamepad)
HUD.idGoalsOnPress()
end,
						'OnContextUpdate', function (self, context, ...)
self:SetEnabled(not g_Tutorial and #SponsorGoalProgress > 0)
HUD.UpdateDesatModifier(self)
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonPlanetaryView",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idRight",
				'IdNode', false,
				'HAlign', "right",
				'MinWidth', 350,
				'Image', "UI/CommonNew/options.tga",
				'FrameBox', box(0, 0, 190, 0),
				'FlipX', true,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "align buttons",
					'Margins', box(0, 5, 25, 5),
					'HAlign', "right",
					'VAlign', "center",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 10,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(7385, --[[XTemplate HUD RolloverText]] "Manage radio channels and volume."),
						'RolloverTitle', T(796804896133, --[[XTemplate HUD RolloverTitle]] "Radio"),
						'RolloverHint', T(11871, --[[XTemplate HUD RolloverHint]] "<em><ShortcutName('actionRadio', 'keyboard')></em> Open Radio"),
						'RolloverHintGamepad', T(7386, --[[XTemplate HUD RolloverHintGamepad]] "<em><ShortcutName('actionRadio')></em> Open Radio"),
						'Id', "idRadio",
						'Image', "UI/HUD/radio.tga",
						'ImageShine', "UI/HUD/radio_shine.tga",
						'FXPress', "RadioButtonClick",
						'OnPress', function (self, gamepad)
HUD.idRadioOnPress()
end,
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "HUDButtonTemplate",
						'RolloverText', T(4001, --[[XTemplate HUD RolloverText]] "Save, load, change options or quit the game."),
						'RolloverTitle', T(1010, --[[XTemplate HUD RolloverTitle]] "Main Menu"),
						'Id', "idMenu",
						'Image', "UI/HUD/hud_menu.tga",
						'ImageShine', "UI/HUD/hud_menu_shine.tga",
						'FXPress', "MainMenuButtonClick",
						'OnPress', function (self, gamepad)
HUD.idMenuOnPress()
end,
					}),
					}),
				}),
			}),
		}),
})

