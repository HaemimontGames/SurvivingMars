-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMissionSponsor",
	PlaceObj('XTemplateWindow', {
		'__class', "XDialog",
		'Padding', box(0, 65, 100, 50),
		'ContextUpdateOnOpen', true,
		'InitialMode', "properties",
		'InternalModes', "properties,items",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
self:SetPadding(GetSafeMargins(self:GetPadding()))
end,
		}),
		PlaceObj('XTemplateLayer', {
			'layer', "EarthPlanet",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnContextUpdate(self, context)",
			'func', function (self, context)
local prop_meta = GetDialogModeParam(self)
if not prop_meta or prop_meta.id == "idMissionLogo" then
	local logo = g_DiffBonusObj.replace_param == "idMissionLogo" and g_DiffBonusObj.replace_value or context.idMissionLogo
	local data = Presets.MissionLogoPreset.Default[logo] or Presets.MissionLogoPreset.Default[1]
	if data then
		self.idLogo:SetImage(data.image)
	end
end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBar",
			'MinWidth', 550,
		}),
		PlaceObj('XTemplateWindow', {
			'HAlign', "right",
			'MinWidth', 610,
			'MaxWidth', 610,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idLogo",
				'Dock', "top",
				'HAlign', "center",
				'MinWidth', 230,
				'MinHeight', 230,
				'MaxWidth', 230,
				'MaxHeight', 230,
				'Image', "CommonAssets/UI/Controls/Image.tga",
				'ImageFit', "stretch",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(-280, 20, -40, -126),
				'Dock', "top",
				'Image', "UI/Common/pm_pad_large.tga",
				'FrameBox', box(320, 0, 40, 0),
				'SqueezeY', false,
				'FlipY', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Dock', "top",
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Id', "idTitle",
						'HAlign', "right",
						'TextFont', "PGMissionDescrTitle",
						'TextColor', RGBA(96, 135, 185, 255),
						'Translate', true,
					}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
parent.idTitle:SetText(GetDialogModeParam(parent).title)
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplateList",
				'Id', "idList",
				'Margins', box(60, 0, 0, 0),
				'BorderWidth', 0,
				'Dock', "top",
				'LayoutVSpacing', 6,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "properties",
				}, {
					PlaceObj('XTemplateForEach', {
						'comment', "mission params",
						'array', function (parent, context) return context:GetProperties() end,
						'condition', function (parent, context, item, i) return not item.filter or item.filter() end,
						'item_in_context', "prop_meta",
						'run_after', function (child, context, item, i, n)
local obj = ResolvePropObj(context)
local rollover = obj:GetRollover(item)
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "PropEntry",
							'RolloverTemplate', "Rollover",
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'ZOrder', 0,
								'Margins', box(-60, 0, -60, -6),
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/bm_buildings_pad.tga",
								'ImageFit', "stretch",
							}),
							}),
						}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
g_DiffBonusObj.replace_param = false
g_DiffBonusObj.replace_value = false
ObjModified(g_DiffBonusObj)
ObjModified(context)
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate PGMissionSponsor ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	OpenPreGameMainMenu()
end)
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "next",
						'ActionName', T{5453, --[[XTemplate PGMissionSponsor ActionName]] "NEXT"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'ActionState', function (self, host)
if not g_CurrentMissionParams.idMissionSponsor
	or not g_CurrentMissionParams.idCommanderProfile
	or not g_CurrentMissionParams.idMissionLogo
	or not g_CurrentMissionParams.idMystery then
	return "disabled"
end
end,
						'OnActionEffect', "mode",
						'OnActionParam', "payload",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateForEach', {
						'comment', "item",
						'array', function (parent, context) return GetDialogModeParam(parent).items() end,
						'condition', function (parent, context, item, i) return not item.game_rule and not item.mystery end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
if item.rollover then
	child:SetRolloverTitle(item.rollover.title)
	local descr = item.rollover.descr
	child:SetRolloverText(descr)
	child:SetRolloverHintGamepad(item.rollover.gamepad_hint)
end
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'RolloverTemplate', "Rollover",
							'Padding', box(0, 0, 0, 0),
							'HAlign', "right",
							'OnPress', function (self, gamepad)
local prop_meta = GetDialogModeParam(self)
local obj = GetDialogContext(self)
local new_val = self.context.value
local prop_val = new_val
local change_mission_sponsor = prop_meta.id == "idMissionSponsor" and obj.idMissionSponsor ~= new_val
if change_mission_sponsor then
	ResetCargo()
	if new_val == "random" then
		new_val = GetRandomMissionParam("idMissionSponsor")
	end
elseif prop_meta.id == "idMissionSponsor" then
	new_val = g_CurrentMissionParams[prop_meta.id]
end
if prop_meta.id == "idCommanderProfile" and obj.idCommanderProfile ~= new_val and new_val == "random" then
	new_val = GetRandomMissionParam("idCommanderProfile")
elseif prop_meta.id == "idCommanderProfile" and new_val == "random" then
	new_val = g_CurrentMissionParams[prop_meta.id]
end
SetProperty(obj, prop_meta.id, prop_val)
g_CurrentMissionParams[prop_meta.id] = new_val
ObjModified(obj)
if change_mission_sponsor then
	g_CurrentMapParams.rocket_name, g_CurrentMapParams.rocket_name_base = GenerateRocketName(true)
end
SetBackDialogMode(self)
end,
							'TextColor', RGBA(221, 215, 170, 255),
							'Text', T{730563403228, --[[XTemplate PGMissionSponsor Text]] "<text>"},
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnSetRollover(self, rollover)",
								'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
local prop_meta = GetDialogModeParam(self)
if prop_meta then
	local obj = GetDialogContext(self)
	g_DiffBonusObj.replace_param = prop_meta.id
	g_DiffBonusObj.replace_value = self.context.value
	ObjModified(g_DiffBonusObj)
	ObjModified(obj)
end
end,
							}),
							}),
						}),
					PlaceObj('XTemplateForEach', {
						'comment', "item",
						'array', function (parent, context) return GetDialogModeParam(parent).items() end,
						'condition', function (parent, context, item, i) return item.mystery end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
if item.rollover then
	child:SetRolloverTitle(item.rollover.title)
	local descr = item.rollover.descr
	child:SetRolloverText(descr)
	child:SetRolloverHintGamepad(item.rollover.gamepad_hint)
end
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MysteryItem",
						}),
						}),
					PlaceObj('XTemplateForEach', {
						'comment', "item",
						'array', function (parent, context) return GetDialogModeParam(parent).items() end,
						'condition', function (parent, context, item, i) return item.game_rule end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
if item.rollover then
	child:SetRolloverTitle(item.rollover.title)
	local descr = item.rollover.descr
	child:SetRolloverText(descr..GetIncompatibleGameRulesNames(item.value))
	child:SetRolloverHintGamepad(item.rollover.gamepad_hint)
end
child.idName:SetText(item.text)
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "GameRuleItem",
						}, {
							PlaceObj('XTemplateFunc', {
								'name', "OnSetRollover(self, rollover)",
								'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
local prop_meta = GetDialogModeParam(self)
if prop_meta then
	local obj = GetDialogContext(self)
	g_DiffBonusObj.replace_param = prop_meta.id
	g_DiffBonusObj.replace_value = self.context.value
	ObjModified(g_DiffBonusObj)
	ObjModified(obj)
end
end,
							}),
							}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate PGMissionSponsor ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "properties",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(-280, 20, -40, -126),
						'Dock', "top",
						'Image', "UI/Common/pm_pad_large.tga",
						'FrameBox', box(320, 0, 40, 0),
						'SqueezeY', false,
						'FlipY', true,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XLabel",
						'Margins', box(60, 0, 0, 0),
						'Dock', "top",
						'TextFont', "PGMissionDescrTitle",
						'TextColor', RGBA(96, 135, 185, 255),
						'Translate', true,
						'Text', T{4265, --[[XTemplate PGMissionSponsor Text]] "EFFECTS"},
					}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XScrollArea",
							'Id', "idEffectsTextArea",
							'IdNode', false,
							'LayoutMethod', "VList",
							'VScroll', "idControllerScroller",
							'MouseWheelStep', 40,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XVerticalScroller",
								'Id', "idControllerScroller",
								'Margins', box(0, 0, 10, 0),
								'Dock', "left",
								'Target', "idEffectsTextArea",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Clip', false,
								'TextFont', "PGMissionEffectsHint",
								'TextColor', RGBA(118, 163, 222, 255),
								'RolloverTextColor', RGBA(118, 163, 222, 255),
								'Translate', true,
								'Text', T{350571528070, --[[XTemplate PGMissionSponsor Text]] "<Effects>"},
							}),
							}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XPageScroll",
			'Id', "idScroll",
			'Dock', "bottom",
			'Target', "idList",
		}),
		}),
})

