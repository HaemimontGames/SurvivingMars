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
	local logo = g_TitleObj.replace_param == "idMissionLogo" and g_TitleObj.replace_value or context:GetProperty("idMissionLogo")
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
				'Dock', "top",
				'MaxWidth', 10000,
				'MaxHeight', 10000,
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idPropertiesList",
					'BorderWidth', 0,
					'LayoutVSpacing', 6,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'ShowPartialItems', false,
					'RespawnOnContext', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "properties",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "mission params",
							'array', function (parent, context) return GetMissionParamUICategories() end,
							'condition', function (parent, context, item, i) return not item.filter or item.filter() end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local obj = ResolvePropObj(context)
local rollover = GetMissionParamRollover(item, obj.params[item.id])
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
g_TitleObj.replace_param = false
g_TitleObj.replace_value = false
ObjModified(g_TitleObj)
ObjModified(context)
end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "back",
							'ActionName', T{4254, --[[XTemplate PGMissionSponsor ActionName]] "BACK"},
							'ActionToolbar', "ActionBar",
							'ActionShortcut', "Escape",
							'ActionGamepad', "ButtonB",
							'OnAction', function (self, host, source)
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
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'Margins', box(60, 0, 0, 0),
					'BorderWidth', 0,
					'LayoutVSpacing', 6,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
					'RespawnOnContext', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "items",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return GetDialogModeParam(parent).items() end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_after', function (child, context, item, i, n)
if item.rollover then
	child:SetRolloverTitle(item.rollover.title)
	local descr = item.rollover.descr
	child:SetRolloverText(descr)
	child:SetRolloverHintGamepad(item.rollover.gamepad_hint)
else
	child:SetRolloverTitle(item.text)
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PGMissionItem",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "OnSetRollover(self, rollover)",
									'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
local prop_meta = GetDialogModeParam(self)
if prop_meta then
	local obj = GetDialogContext(self)
	g_TitleObj.replace_param = prop_meta.id
	g_TitleObj.replace_value = self.context.value
	ObjModified(g_TitleObj)
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
				PlaceObj('XTemplateTemplate', {
					'__template', "Scrollbar",
					'Id', "idScroll",
					'Target', "idList",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Id', "idTextBox",
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
						'Margins', box(40, 0, 0, 0),
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
							'Margins', box(40, 0, 0, 0),
							'LayoutMethod', "VList",
							'VScroll', "idTextScroll",
							'MouseWheelStep', 40,
						}, {
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
						PlaceObj('XTemplateTemplate', {
							'__template', "Scrollbar",
							'Id', "idTextScroll",
							'Target', "idEffectsTextArea",
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "actionScrollAreaDown",
							'ActionGamepad', "RightThumbDown",
							'OnAction', function (self, host, source)
local text_area = host.idTextBox:ResolveId("idEffectsTextArea")
if text_area:GetVisible() then
	return text_area:OnMouseWheelBack()
end
end,
						}),
						PlaceObj('XTemplateAction', {
							'ActionId', "actionScrollAreaUp",
							'ActionGamepad', "RightThumbUp",
							'OnAction', function (self, host, source)
local text_area = host.idTextBox:ResolveId("idEffectsTextArea")
if text_area:GetVisible() then
	return text_area:OnMouseWheelForward()
end
end,
						}),
						}),
					}),
				}),
			}),
		}),
})

