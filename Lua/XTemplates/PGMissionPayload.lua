-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMissionPayload",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return not GameState.gameplay and RocketPayloadObjectCreateAndLoad("pregame") or context end,
		'__class', "XDialog",
		'Id', "idPayload",
		'Margins', box(60, 68, 0, 25),
		'ContextUpdateOnOpen', true,
		'InitialMode', "items",
		'InternalModes', "items,prefabs",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XDialog.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
local param = GetDialogModeParam(self.parent)
if param == "resupply" then
	local title = self:ResolveId("idTitle")
	if title then
		title:SetTitle(T{561537249557, "RESUPPLY"})
		title:SetSubtitle("")
		title:SetSmallImage(true)
	end
end
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
			'__template', "ActionBarNew",
			'Margins', box(55, 0, 0, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'HAlign', "left",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleNew",
				'Margins', box(55, 0, 0, 0),
				'Title', T{668912375628, --[[XTemplate PGMissionPayload Title]] "ROCKET PAYLOAD"},
				'Subtitle', T{774720837511, --[[XTemplate PGMissionPayload Subtitle]] "Difficulty Challenge <percent(DifficultyBonus)>"},
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Margins', box(15, 30, 0, 0),
				'Dock', "top",
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GetUIStyleGamepad() and UICity and UICity.launch_mode ~= "elevator" end,
						'__class', "XImage",
						'Id', "idGamepadRenameHint",
						'Margins', box(-40, 0, 0, 0),
						'Dock', "box",
						'HAlign', "left",
						'VAlign', "center",
						'FoldWhenHidden', true,
						'ImageScale', point(520, 520),
					}),
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
local hint = parent:ResolveId("idGamepadRenameHint")
if hint then
	hint:SetImage(GetPlatformSpecificImagePath("RSPress"))
end
end,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idRocketName",
						'Padding', box(0, 0, 0, 0),
						'HAlign', "left",
						'MaxHeight', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'TextStyle', "PGLandingPosDetails",
						'ContextUpdateOnOpen', true,
						'OnContextUpdate', function (self, context, ...)
if UICity and UICity.launch_mode == "elevator" then
	self:SetMargins(box(38,0,0,0))
end
end,
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
						'Padding', box(0, 0, 0, 0),
						'HAlign', "left",
						'MaxHeight', 50,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'TextStyle', "LandingPosName",
						'Translate', true,
						'Shorten', true,
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
				'Margins', box(55, 0, 0, 0),
				'Dock', "top",
				'LayoutMethod', "HList",
				'LayoutHSpacing', 40,
			}, {
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGLandingPosDetails",
						'Translate', true,
						'Text', T{3499, --[[XTemplate PGMissionPayload Text]] "Cargo Capacity"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGLandingPosDetails",
						'Translate', true,
						'Text', T{3613, --[[XTemplate PGMissionPayload Text]] "Funding"},
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGChallengeDescription",
						'Translate', true,
						'Text', T{270405570569, --[[XTemplate PGMissionPayload Text]] "<Capacity> kg"},
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Padding', box(0, 0, 0, 0),
						'TextStyle', "PGChallengeDescription",
						'Translate', true,
						'Text', T{134782360990, --[[XTemplate PGMissionPayload Text]] "<funding(Funding)>"},
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'IdNode', false,
				'Margins', box(55, 0, 0, 0),
				'Dock', "top",
				'HAlign', "left",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-350, 0, 0, 0),
					'Dock', "box",
					'MinWidth', 794,
					'Image', "UI/CommonNew/pg_action_bar.tga",
					'FrameBox', box(42, 0, 341, 0),
					'TileFrame', true,
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idListTitle",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'HandleMouse', false,
					'TextStyle', "MediumHeader",
					'Translate', true,
					'Text', T{4067, --[[XTemplate PGMissionPayload Text]] "SELECT ROCKET"},
					'HideOnEmpty', true,
				}),
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GameState.gameplay end,
						'__class', "XText",
						'Margins', box(549, 0, 0, 0),
						'Padding', box(0, 0, 0, 0),
						'VAlign', "center",
						'HandleMouse', false,
						'TextStyle', "MediumHeader",
						'Translate', true,
						'Text', T{782457493363, --[[XTemplate PGMissionPayload Text]] "IN COLONY"},
						'HideOnEmpty', true,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'Dock', "top",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'Padding', box(15, 2, 2, 2),
					'LayoutVSpacing', 6,
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
parent:ResolveId("idListTitle"):SetText(T{11442, "SELECT PAYLOAD"})
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetProperties() end,
							'condition', function (parent, context, item, i) return (not item.filter or item.filter()) and not context:IsLocked(item.id) and not context:IsBlacklisted(item) and not BuildingTemplates[item.id] end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local id = item.id
local rollover = context:GetRollover(id)
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHint(rollover.hint)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
if GameState.gameplay and ResourceOverviewObj.data then
	if Resources[id] then
		child.idAvailable:SetText(T{11592, "<num>", num = FormatResource(ResourceOverviewObj, ResourceOverviewObj:GetAvailable(id), id)})
	elseif id == "Drone" then
		child.idAvailable:SetText(T{11592, "<num>", num = FormatResource(empty_table, #(UICity.labels.Drone or ""), id)})
	end
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropPayload",
								'RolloverTemplate', "Rollover",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XFrame",
									'Id', "idRollover",
									'ZOrder', 0,
									'Margins', box(-25, -13, 210, -3),
									'Dock', "box",
									'MinWidth', 228,
									'Visible', false,
									'Image', "UI/CommonNew/pg_selection.tga",
									'FrameBox', box(50, 0, 178, 0),
									'TileFrame', true,
								}),
								}),
							}),
						}),
					PlaceObj('XTemplateMode', {
						'mode', "prefabs",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:ResolveId("idListTitle"):SetText(T{4068, "PREFABS"})
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
									'__class', "XFrame",
									'Id', "idRollover",
									'ZOrder', 0,
									'Margins', box(-25, -13, 210, -3),
									'Dock', "box",
									'MinWidth', 228,
									'Visible', false,
									'Image', "UI/CommonNew/pg_selection.tga",
									'FrameBox', box(50, 0, 178, 0),
									'TileFrame', true,
								}),
								}),
							}),
						}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Target', "idList",
				}),
				}),
			}),
		}),
})

