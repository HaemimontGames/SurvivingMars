-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResupplyPassengers",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return TraitsObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Id', "idPassengers",
		'Padding', box(0, 65, 100, 50),
		'InitialMode', "traitCategories",
		'InternalModes', "traitCategories,items,review",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
self.context:SetDialog(self)
XDialog.Open(self, ...)
if HintsEnabled then
	ContextAwareHintShow("HintPassengerRocket", true)
end
self:SetPadding(GetSafeMargins(self:GetPadding()))
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
if HintsEnabled then
	ContextAwareHintShow("HintPassengerRocket", false)
end
RefundPassenger()
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
			PlaceObj('XTemplateAction', {
				'ActionId', "rename",
				'ActionName', T{10120, --[[XTemplate ResupplyPassengers ActionName]] "RENAME"},
				'ActionToolbar', "ActionBar",
				'ActionGamepad', "RightThumbClick",
				'OnAction', function (self, host, source)
host.context:RenameRocket(host)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Id', "idTop",
				'Dock', "top",
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idRocketName",
					'Dock', "top",
					'HAlign', "right",
					'MaxHeight', 50,
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'TextFont', "PGLandingPosDetails",
					'TextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{454729036303, --[[XTemplate ResupplyPassengers Text]] "<RocketName>"},
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
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) local mode = GetDialog(parent).Mode return mode == "traitCategories" or mode == "items" end,
					'__class', "XText",
					'Id', "idSubtitle",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGLandingPosDetails",
					'TextColor', RGBA(118, 163, 222, 255),
					'RolloverTextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{281313501676, --[[XTemplate ResupplyPassengers Text]] "<ApplicantsSubtitle>"},
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateWindow', {
					'__condition', function (parent, context) return GetDialog(parent).Mode == "review" end,
					'__class', "XText",
					'Id', "idSubtitle",
					'Dock', "top",
					'HAlign', "right",
					'TextFont', "PGLandingPosDetails",
					'TextColor', RGBA(118, 163, 222, 255),
					'RolloverTextColor', RGBA(118, 163, 222, 255),
					'Translate', true,
					'Text', T{432819623507, --[[XTemplate ResupplyPassengers Text]] "<ReviewSubtitle>"},
					'TextHAlign', "right",
				}),
				PlaceObj('XTemplateMode', {
					'mode', "traitCategories",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "buyApplicants",
						'ActionName', T{5455, --[[XTemplate ResupplyPassengers ActionName]] "BUY APPLICANTS"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "LeftTrigger",
						'OnAction', function (self, host, source)
BuyApplicants(host)
end,
						'__condition', function (parent, context) return GetMissionSponsor().applicants_price > 0 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "review",
						'ActionName', T{5463, --[[XTemplate ResupplyPassengers ActionName]] "REVIEW"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightTrigger",
						'OnAction', function (self, host, source)
local obj = ResolvePropObj(host.context)
obj.approved_applicants = {}
host:SetMode("review")
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "clear",
						'ActionName', T{5448, --[[XTemplate ResupplyPassengers ActionName]] "CLEAR"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
if not host.context:CanClearFilter() then
	return "disabled"
end
end,
						'OnAction', function (self, host, source)
host.context:ClearTraits()
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
						'OnActionParam', "categories",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "review",
						'ActionName', T{5463, --[[XTemplate ResupplyPassengers ActionName]] "REVIEW"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightTrigger",
						'OnAction', function (self, host, source)
local obj = ResolvePropObj(host.context)
obj.approved_applicants = {}
host:SetMode("review")
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "clear",
						'ActionName', T{5448, --[[XTemplate ResupplyPassengers ActionName]] "CLEAR"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
local prop_meta = GetDialogModeParam(host)
local category = prop_meta and prop_meta.id or nil
if not host.context:CanClearFilter(category) then
	return "disabled"
end
end,
						'OnAction', function (self, host, source)
local prop_meta = GetDialogModeParam(host)
host.context:ClearTraits(prop_meta)
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "review",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnAction', function (self, host, source)
local obj = ResolvePropObj(host.context)
obj.approved_applicants = nil
SetBackDialogMode(host)
end,
					}),
					}),
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
					'LayoutVSpacing', 8,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'MouseWheelStep', 40,
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
					PlaceObj('XTemplateMode', {
						'mode', "review",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent.parent:ResolveId("idTitle"):SetText(T{4071, "Review Applicants"})
end,
						}),
						PlaceObj('XTemplateForEach', {
							'comment', "item",
							'array', function (parent, context) return context:GetReviewColonists() end,
							'item_in_context', "prop_meta",
							'run_after', function (child, context, item, i, n)
local rollover = item.rollover
child:SetRolloverTitle(rollover.title)
child:SetRolloverText(rollover.descr)
child:SetRolloverHint(rollover.hint)
child:SetRolloverHintGamepad(rollover.gamepad_hint)
end,
						}, {
							PlaceObj('XTemplateTemplate', {
								'__template', "PropApplicant",
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
					PlaceObj('XTemplateAction', {
						'ActionId', "launch",
						'ActionName', T{4253, --[[XTemplate ResupplyPassengers ActionName]] "LAUNCH"},
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'ActionState', function (self, host)
local obj = ResolvePropObj(host.context)
return not obj:CanLaunchPassengerRocket() and "disabled"
end,
						'OnAction', function (self, host, source)
LaunchPassengerRocket(host)
end,
						'FXPress', "LaunchSupplyRocketClick",
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

