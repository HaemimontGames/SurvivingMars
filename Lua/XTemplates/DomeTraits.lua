-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "DomeTraits",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return TraitsObjectCreateAndLoad(context) end,
		'__class', "XDialog",
		'InitialMode', "traitCategories",
		'InternalModes', "traitCategories,items",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
ViewAndSelectDome(self.context.dome)
self.context:SetDialog(self)
XDialog.Open(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Close",
			'func', function (self, ...)
if DomeTraitsCameraParams then
	SetCamera(table.unpack(DomeTraitsCameraParams))
	DomeTraitsCameraParams = false
end
XDialog.Close(self, ...)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'HAlign', "right",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "XHideInGameInterfaceLayer",
			}),
			PlaceObj('XTemplateLayer', {
				'layer', "XPauseLayer",
			}),
			PlaceObj('XTemplateLayer', {
				'layer', "XCameraLockLayer",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idFrame",
				'IdNode', false,
				'Padding', box(80, 80, 80, 80),
				'HAlign', "right",
				'MinWidth', 550,
				'LayoutMethod', "VList",
				'HandleMouse', true,
				'Image', "UI/Common/menu_pad_1.tga",
				'FrameBox', box(86, 0, 0, 0),
				'TileFrame', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XFrame.Open(self, ...)
local pad = self:GetPadding()
local margin = GetSafeMargins(pad)
self:SetPadding(box(pad:minx(), margin:miny(), margin:maxx(), margin:maxy()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGLandingPosName",
					'TextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{347194033198, --[[XTemplate DomeTraits Text]] "<DomeName>"},
					'WordWrap', false,
					'Shorten', true,
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGLandingPosDetails",
					'TextColor', RGBA(118, 163, 222, 255),
					'RolloverTextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{837650465667, --[[XTemplate DomeTraits Text]] "<DomeSubtitle>"},
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-80, 6, -155, -100),
					'Dock', "top",
					'VAlign', "top",
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 165, 0),
					'SqueezeY', false,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idTitle",
					'Padding', box(22, 2, 2, 2),
					'Dock', "top",
					'HAlign', "left",
					'TextFont', "PGMissionDescrTitle",
					'TextColor', RGBA(96, 135, 185, 255),
					'Translate', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'LayoutVSpacing', 10,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
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
						'mode', "traitCategories",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetText(T{1117, "CATEGORIES"})
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "category",
							'array', function (parent, context) return context:GetProperties() end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local rollover = context:GetCategoryRollover(item)
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHint(rollover.hint)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropTrait",
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
						'mode', "items",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetText(GetDialogModeParam(parent).name)
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return GetDialogModeParam(parent).items(context) end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local rollover = item.rollover
if rollover then
	child:SetRolloverTitle(rollover.title)
	child:SetRolloverText(rollover.descr)
	child:SetRolloverHint(rollover.hint)
	child:SetRolloverHintGamepad(rollover.gamepad_hint)
end
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropTrait",
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
				PlaceObj('XTemplateWindow', {
					'__class', "XPageScroll",
					'Id', "idScroll",
					'Margins', box(0, 10, 0, 80),
					'Dock', "bottom",
					'VAlign', "bottom",
					'MinHeight', 42,
					'Visible', false,
					'FoldWhenHidden', false,
					'Target', "idList",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'Id', "idActionBar",
				'Margins', box(170, 0, 80, 80),
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Margins', box(-170, 0, -155, -10),
					'VAlign', "bottom",
					'Image', "UI/Common/bm_pad_small.tga",
					'FrameBox', box(170, 0, 165, 0),
					'SqueezeY', false,
					'FlipY', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XToolBar",
					'Id', "idToolbar",
					'HAlign', "right",
					'VAlign', "bottom",
					'LayoutHSpacing', 60,
					'Background', RGBA(0, 0, 0, 0),
					'Toolbar', "ActionBar",
					'Show', "text",
					'ButtonTemplate', "InGameMenuEntry",
				}),
				}),
			PlaceObj('XTemplateAction', {
				'ActionId', "prev",
				'ActionName', T{5446, --[[XTemplate DomeTraits ActionName]] "PREVIOUS DOME"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "LeftTrigger",
				'OnAction', function (self, host, source, toggled)
host:CreateThread("close_dialog", function()
	local prop_meta = GetDialogModeParam(host)
	local category = prop_meta and prop_meta.id or nil
	host.context:WaitAskToApplyTraitsFilter()
	CycleFilterTraits(host.context, -1, category)
end)
end,
				'__condition', function (parent, context) return UICity and #(UICity.labels.Dome or "") > 1 end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "next",
				'ActionName', T{5445, --[[XTemplate DomeTraits ActionName]] "NEXT DOME"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "RightTrigger",
				'OnAction', function (self, host, source, toggled)
host:CreateThread("close_dialog", function()
	local prop_meta = GetDialogModeParam(host)
	local category = prop_meta and prop_meta.id or nil
	host.context:WaitAskToApplyTraitsFilter()
	CycleFilterTraits(host.context, 1, category)
end)
end,
				'__condition', function (parent, context) return UICity and #(UICity.labels.Dome or "") > 1 end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "clear",
				'ActionName', T{5448, --[[XTemplate DomeTraits ActionName]] "CLEAR"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "ButtonY",
				'ActionState', function (self, host)
local prop_meta = GetDialogModeParam(host)
local category = prop_meta and prop_meta.id or nil
if not host.context:CanClearFilter(category) then
	return "disabled"
end
end,
				'OnAction', function (self, host, source, toggled)
local prop_meta = GetDialogModeParam(host)
host.context:ClearTraits(prop_meta)
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "apply",
				'ActionName', T{5447, --[[XTemplate DomeTraits ActionName]] "APPLY"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "ButtonA",
				'ActionState', function (self, host)
local prop_meta = GetDialogModeParam(host)
local category = prop_meta and prop_meta.id or nil
if not host.context:CanApplyFilter(category) then
	return "disabled"
end
end,
				'OnAction', function (self, host, source, toggled)
local param = GetDialogModeParam(host)
host.context:ApplyDomeFilter(param and param.id)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateMode', {
					'mode', "traitCategories",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "close",
						'ActionName', T{4523, --[[XTemplate DomeTraits ActionName]] "CLOSE"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source, toggled)
host:CreateThread("close_dialog", function()
	host.context:WaitAskToApplyTraitsFilter()
	host:Close()
end)
end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate DomeTraits ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				}),
			}),
		}),
})

