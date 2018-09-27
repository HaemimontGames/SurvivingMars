-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMissionPayload",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return not GameState.gameplay and RocketPayloadObjectCreateAndLoad("pregame") or context end,
		'__class', "XDialog",
		'Id', "idPayload",
		'Padding', box(0, 65, 100, 50),
		'ContextUpdateOnOpen', true,
		'InitialMode', "items",
		'InternalModes', "items,prefabs",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
self:SetPadding(GetSafeMargins(self:GetPadding()))
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
if GameState.gameplay then
	if UICity then
		--UICity.launch_elevator_mode = false
		UICity.launch_mode = false
		RefundSupply()
	end
end
end,
		}),
		PlaceObj('XTemplateLayer', {
			'__condition', function (parent, context) return not GameState.gameplay end,
			'layer', "EarthPlanetCloseup",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnContextUpdate(self, context)",
			'func', function (self, context)
RocketPayload_CalcCargoWeightCost()
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "ActionBar",
			'MinWidth', 550,
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'Margins', box(0, 65, 0, 0),
			'HAlign', "right",
			'MinWidth', 550,
			'MaxWidth', 550,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Dock', "top",
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'HAlign', "right",
						'MaxHeight', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'TextFont', "PGLandingPosDetails",
						'TextColor', RGBA(118, 163, 222, 255),
						'Translate', true,
						'Text', T{779595445764, --[[XTemplate PGMissionPayload Text]] "<RocketName>"},
						'Shorten', true,
						'TextHAlign', "right",
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnHyperLink(self, hyperlink, argument, hyperlink_box, pos, button)",
							'func', function (self, hyperlink, argument, hyperlink_box, pos, button)
local host = GetDialog(self)
host.context:RenameRocket(host)
end,
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "buyRocket",
						'ActionName', T{5454, --[[XTemplate PGMissionPayload ActionName]] "BUY ROCKET"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'OnAction', function (self, host, source)
BuyRocket(host)
end,
						'__condition', function (parent, context) return GameState.gameplay and GetMissionSponsor().rocket_price > 0 and UICity and (not UICity.launch_mode or UICity.launch_mode == "rocket") end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "rename",
						'ActionName', T{10136, --[[XTemplate PGMissionPayload ActionName]] "RENAME"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightThumbClick",
						'OnAction', function (self, host, source)
host.context:RenameRocket(host)
end,
						'__condition', function (parent, context) return not UICity or UICity.launch_mode ~= "elevator" end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate PGMissionPayload ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
						'OnActionParam', "categories",
						'__condition', function (parent, context) return GameState.gameplay end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate PGMissionPayload ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
						'OnActionParam', "sponsor",
						'__condition', function (parent, context) return not GameState.gameplay end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "next",
						'ActionName', T{5453, --[[XTemplate PGMissionPayload ActionName]] "NEXT"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnActionEffect', "mode",
						'OnActionParam', "landing",
						'__condition', function (parent, context) return not GameState.gameplay end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "launch",
						'ActionName', T{4253, --[[XTemplate PGMissionPayload ActionName]] "LAUNCH"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'ActionState', function (self, host)
return (g_Tutorial and g_Tutorial.SuppressResupplyLaunch) and "disabled"
end,
						'OnAction', function (self, host, source)
LaunchCargoRocket(host.context, function() host.parent.parent:Close() end)
end,
						'FXPress', "LaunchSupplyRocketClick",
						'__condition', function (parent, context) return GameState.gameplay end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "prefabs",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'HAlign', "right",
						'TextFont', "PGLandingPosDetails",
						'TextColor', RGBA(118, 163, 222, 255),
						'Translate', true,
						'Text', T{345420497005, --[[XTemplate PGMissionPayload Text]] "<PrefabsTitle>"},
						'TextHAlign', "right",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate PGMissionPayload ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "Cargo Capacity",
				'__condition', function (parent, context) return not GameState.gameplay end,
				'__class', "XText",
				'Dock', "top",
				'HAlign', "right",
				'TextFont', "PGLandingPosDetails",
				'TextColor', RGBA(118, 163, 222, 255),
				'RolloverTextColor', RGBA(118, 163, 222, 255),
				'Translate', true,
				'Text', T{954934126187, --[[XTemplate PGMissionPayload Text]] "Cargo Capacity <white><Capacity> kg</white>\nFunding <white><funding(Funding)></white>"},
				'TextHAlign', "right",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "Cargo Capacity Rocket",
				'__condition', function (parent, context) return GameState.gameplay and (not UICity or not UICity.launch_mode or UICity.launch_mode == "rocket") end,
				'__class', "XText",
				'Dock', "top",
				'HAlign', "right",
				'TextFont', "PGLandingPosDetails",
				'TextColor', RGBA(118, 163, 222, 255),
				'RolloverTextColor', RGBA(118, 163, 222, 255),
				'Translate', true,
				'Text', T{253829683975, --[[XTemplate PGMissionPayload Text]] "Cargo Capacity <white><Capacity> kg</white>\nFunding <white><funding(Funding)></white>\nAvailable Rockets <white><AvailableRockets>/<TotalRockets></white>"},
				'TextHAlign', "right",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "Cargo Capacity Elevator",
				'__condition', function (parent, context) return GameState.gameplay and UICity and UICity.launch_mode == "elevator" end,
				'__class', "XText",
				'Dock', "top",
				'HAlign', "right",
				'TextFont', "PGLandingPosDetails",
				'TextColor', RGBA(118, 163, 222, 255),
				'RolloverTextColor', RGBA(118, 163, 222, 255),
				'Translate', true,
				'Text', T{902798449197, --[[XTemplate PGMissionPayload Text]] "Cargo Capacity <white><Capacity> kg</white>\nFunding <white><funding(Funding)></white>"},
				'TextHAlign', "right",
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "AddAdditionalCargoCapacityTexts",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Margins', box(-340, 20, -40, -126),
				'Dock', "top",
				'Image', "UI/Common/pm_pad_large.tga",
				'FrameBox', box(320, 0, 40, 0),
				'SqueezeY', false,
				'FlipY', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XLabel",
				'Id', "idTitle",
				'Margins', box(7, 0, 0, 0),
				'Padding', box(22, 2, 2, 2),
				'Dock', "top",
				'HAlign', "left",
				'TextFont', "PGMissionDescrTitle",
				'TextColor', RGBA(96, 135, 185, 255),
				'Translate', true,
			}),
			PlaceObj('XTemplateWindow', {
				'Dock', "top",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'LayoutVSpacing', 10,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
					'OnContextUpdate', function (self, context, ...)
XContentTemplateList.OnContextUpdate(self, context, ...)
if self.focused_item then
	self.focused_item =  Min(self.focused_item, #self)
	self:DeleteThread("select")
	self:CreateThread("select", function()
		self:SetSelection(self.focused_item)
	end)
end
end,
					'RespawnOnContext', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "items",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetText(T{4159, "PAYLOAD"})
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and not context:IsLocked(item.id) and not context:IsBlacklisted(item) and not BuildingTemplates[item.id] end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local rollover = context:GetRollover(item.id)
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHint(rollover.hint)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropPayload",
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
						}),
					PlaceObj('XTemplateMode', {
						'mode', "prefabs",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetText("")
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and not context:IsLocked(item.id) and not context:IsBlacklisted(item) and BuildingTemplates[item.id] end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local rollover = context:GetRollover(item.id)
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHint(rollover.hint)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropPayload",
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
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "Scrollbar",
					'Id', "idScroll",
					'Margins', box(0, 0, 0, 30),
					'Target', "idList",
				}),
				}),
			}),
		}),
})

