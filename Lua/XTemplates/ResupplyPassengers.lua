-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "ResupplyPassengers",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return TraitsObjectCreateAndLoad() end,
		'__class', "XDialog",
		'Id', "idPassengers",
		'Padding', box(60, 68, 0, 25),
		'InitialMode', "review",
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
			'__template', "ActionBarNew",
		}),
		PlaceObj('XTemplateWindow', {
			'Id', "idContent",
			'HAlign', "left",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "DialogTitleNew",
				'Id', "",
				'Margins', box(55, 0, 0, 0),
				'Title', T(723122513032, --[[XTemplate ResupplyPassengers Title]] "SELECT COLONISTS"),
				'SmallImage', true,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplate",
				'Id', "idTop",
				'IdNode', false,
				'RespawnOnContext', false,
			}, {
				PlaceObj('XTemplateWindow', {
					'Margins', box(15, 30, 0, 0),
					'Dock', "top",
				}, {
					PlaceObj('XTemplateWindow', {
						'__condition', function (parent, context) return GetUIStyleGamepad() end,
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
						'Translate', true,
						'Text', T(454729036303, --[[XTemplate ResupplyPassengers Text]] "<RocketName>"),
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
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextWindow",
					'Margins', box(55, 0, 0, 0),
					'Dock', "top",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 70,
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
context:SetUIResupplyParams(self)
end,
				}, {
					PlaceObj('XTemplateWindow', {
						'MinWidth', 300,
						'MaxWidth', 300,
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return not UICity or UICity.launch_mode ~= "passenger_pod" end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGLandingPosDetails",
							'Translate', true,
							'Text', T(945506235214, --[[XTemplate ResupplyPassengers Text]] "Rocket Capacity"),
						}),
						PlaceObj('XTemplateWindow', {
							'__condition', function (parent, context) return UICity and UICity.launch_mode == "passenger_pod" end,
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGLandingPosDetails",
							'Translate', true,
							'Text', T(189122132072, --[[XTemplate ResupplyPassengers Text]] "Pod Capacity"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGLandingPosDetails",
							'Translate', true,
							'Text', T(475005233850, --[[XTemplate ResupplyPassengers Text]] "Matching Applicants"),
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGLandingPosDetails",
							'Translate', true,
							'Text', T(914238670538, --[[XTemplate ResupplyPassengers Text]] "Available Residences on Mars"),
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'LayoutMethod', "VList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idCapacity",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGChallengeDescription",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idMatchingColonists",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGChallengeDescription",
							'Translate', true,
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idResidences",
							'Padding', box(0, 0, 0, 0),
							'TextStyle', "PGChallengeDescription",
							'Translate', true,
						}),
						}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "traitCategories",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "buyApplicants",
						'ActionName', T(5455, --[[XTemplate ResupplyPassengers ActionName]] "BUY APPLICANTS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "LeftTrigger",
						'OnAction', function (self, host, source)
BuyApplicants(host)
end,
						'__condition', function (parent, context) return GetMissionSponsor().applicants_price > 0 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "clear",
						'ActionName', T(5448, --[[XTemplate ResupplyPassengers ActionName]] "CLEAR"),
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
					PlaceObj('XTemplateWindow', {
						'Margins', box(55, 20, 0, 0),
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
							'Id', "idTitle",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "MediumHeader",
							'Translate', true,
							'HideOnEmpty', true,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 10, 0, 20),
						'Dock', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XList",
							'Id', "idList",
							'BorderWidth', 0,
							'Padding', box(15, 2, 2, 2),
							'LayoutVSpacing', 8,
							'UniformRowHeight', true,
							'Clip', false,
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'VScroll', "idScroll",
							'MouseWheelStep', 40,
							'ShowPartialItems', false,
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
parent:ResolveId("idTitle"):SetText(T(1117, "CATEGORIES"))
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
										'__class', "XFrame",
										'Id', "idRollover",
										'ZOrder', 0,
										'Margins', box(-20, -12, -20, -12),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/CommonNew/re_candidate_rollover.tga",
										'FrameBox', box(25, 0, 25, 0),
										'SqueezeY', false,
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
				PlaceObj('XTemplateMode', {
					'mode', "items",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "clear",
						'ActionName', T(5448, --[[XTemplate ResupplyPassengers ActionName]] "CLEAR"),
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
					PlaceObj('XTemplateWindow', {
						'Margins', box(55, 20, 0, 0),
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
							'Id', "idTitle",
							'Padding', box(0, 0, 0, 0),
							'VAlign', "center",
							'HandleMouse', false,
							'TextStyle', "MediumHeader",
							'Translate', true,
							'HideOnEmpty', true,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'Margins', box(0, 10, 0, 20),
						'Dock', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XList",
							'Id', "idList",
							'BorderWidth', 0,
							'Padding', box(15, 2, 2, 2),
							'LayoutVSpacing', 8,
							'UniformRowHeight', true,
							'Clip', false,
							'Background', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'VScroll', "idScroll",
							'MouseWheelStep', 40,
							'ShowPartialItems', false,
						}, {
							PlaceObj('XTemplateCode', {
								'run', function (self, parent, context)
local title = parent:ResolveId("idTitle")
local param = GetDialogModeParam(parent)
if title and param then
	title:SetText(param.name)
end
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
										'__class', "XFrame",
										'Id', "idRollover",
										'ZOrder', 0,
										'Margins', box(-20, -12, -20, -12),
										'Dock', "box",
										'Visible', false,
										'Image', "UI/CommonNew/re_candidate_rollover.tga",
										'FrameBox', box(25, 0, 25, 0),
										'SqueezeY', false,
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
				PlaceObj('XTemplateMode', {
					'mode', "review",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate ResupplyPassengers ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "mode",
						'OnActionParam', "categories",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "filter",
						'ActionName', T(5460, --[[XTemplate ResupplyPassengers ActionName]] "FILTER"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightTrigger",
						'OnActionEffect', "mode",
						'OnActionParam', "traitCategories",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "launch",
						'ActionName', T(4253, --[[XTemplate ResupplyPassengers ActionName]] "LAUNCH"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
LaunchPassengerRocket(host)
end,
						'FXPress', "LaunchSupplyRocketClick",
					}),
					PlaceObj('XTemplateWindow', {
						'Id', "idListsWrapper",
						'Margins', box(0, 20, 0, 0),
						'Dock', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XFrame",
							'Margins', box(-350, 0, 0, 0),
							'Dock', "box",
							'VAlign', "top",
							'MinWidth', 794,
							'Image', "UI/CommonNew/pg_action_bar.tga",
							'FrameBox', box(42, 0, 341, 0),
							'TileFrame', true,
							'SqueezeY', false,
						}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(70, 22, 0, 0),
							'Dock', "right",
							'VAlign', "top",
							'LayoutMethod', "VList",
							'LayoutVSpacing', 30,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(22, 0, 0, 0),
								'Padding', box(0, 0, 0, 0),
								'Dock', "top",
								'HAlign', "left",
								'HandleMouse', false,
								'TextStyle', "MediumHeader",
								'Translate', true,
								'Text', T(914430779802, --[[XTemplate ResupplyPassengers Text]] "SELECTED <ApprovedColonists>/<PassengerCapacity>"),
							}),
							PlaceObj('XTemplateWindow', {
								'Margins', box(0, 30, 0, 20),
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XContentTemplateList",
									'Id', "idRightList",
									'Margins', box(0, 0, 30, 0),
									'BorderWidth', 0,
									'Padding', box(0, 0, 0, 0),
									'LayoutVSpacing', 2,
									'UniformRowHeight', true,
									'Clip', false,
									'Background', RGBA(0, 0, 0, 0),
									'FocusedBackground', RGBA(0, 0, 0, 0),
									'VScroll', "idScrollRight",
									'ShowPartialItems', false,
									'MouseScroll', true,
									'GamepadInitialSelection', false,
									'OnContextUpdate', function (self, context, ...)
local focus = self.focused_item
XContentTemplateList.OnContextUpdate(self, context, ...)
if focus and self:IsFocused(true) then
	self:DeleteThread("select")
	self:CreateThread("select", function(focus)
		local list = self
		if #self <= 0 then
			list =  self:ResolveId("idLeftList")
			self:SetFocus(false, true)
			list:SetFocus()
		end
		list:SetSelection(false)
		list:ScrollTo(0,0, "force")
		list:SetSelection(Min(#list, focus))
	end, focus)
end
end,
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source)",
										'func', function (self, shortcut, source)
if shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" then
	local list = self:ResolveId("idLeftList")
	if list and #list > 0 then
		local right_top = self.focused_item or 1
		while self[right_top-1] and not self[right_top-1].outside_parent do
			right_top = right_top - 1
		end
		local diff = (self.focused_item or 1) - right_top
		local left_top = list.focused_item or 1
		while list[left_top-1] and not list[left_top-1].outside_parent do
			left_top = left_top - 1
		end
		self:SetFocus(false, true)
		list:SetFocus()
		list:SetSelection(Min(#list, left_top + diff))
	end
	return "break"
end
return XContentTemplateList.OnShortcut(self, shortcut, source)
end,
									}),
									PlaceObj('XTemplateMode', {
										'mode', "review",
									}, {
										PlaceObj('XTemplateForEach', {
											'comment', "item",
											'array', function (parent, context) return context:GetApprovedApplicantsList() end,
											'item_in_context', "prop_meta",
											'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "PropApplicantSelected", 322, 35)
end,
										}),
										}),
									}),
								PlaceObj('XTemplateTemplate', {
									'__template', "ScrollbarNew",
									'Id', "idScrollRight",
									'Dock', "right",
									'Target', "idRightList",
								}),
								}),
							}),
						PlaceObj('XTemplateWindow', {
							'Margins', box(0, 22, 0, 0),
							'VAlign', "top",
							'LayoutMethod', "VList",
							'LayoutVSpacing', 30,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'Dock', "top",
								'HAlign', "right",
								'HandleMouse', false,
								'TextStyle', "MediumHeader",
								'Translate', true,
								'Text', T(794457706937, --[[XTemplate ResupplyPassengers Text]] "MATCHING APPLICANTS <MatchingColonistsCount>"),
							}),
							PlaceObj('XTemplateWindow', {
								'Margins', box(0, 30, 0, 20),
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XContentTemplateList",
									'Id', "idLeftList",
									'Margins', box(39, 0, 0, 0),
									'BorderWidth', 0,
									'Padding', box(0, 0, 0, 0),
									'MinWidth', 300,
									'LayoutVSpacing', 2,
									'UniformRowHeight', true,
									'Clip', false,
									'Background', RGBA(0, 0, 0, 0),
									'FocusedBackground', RGBA(0, 0, 0, 0),
									'VScroll', "idLeftScroll",
									'ShowPartialItems', false,
									'MouseScroll', true,
									'GamepadInitialSelection', false,
									'OnContextUpdate', function (self, context, ...)
local focus = self.focused_item
XContentTemplateList.OnContextUpdate(self, context, ...)
if focus and self:IsFocused(true) then
	self:DeleteThread("select")
	self:CreateThread("select", function(focus)
		local list = self
		if #self <= 0 then
			list =  self:ResolveId("idRightList")
			self:SetFocus(false, true)
			list:SetFocus()
		end
		list:SetSelection(false)
		list:ScrollTo(0,0, "force")
		list:SetSelection(Min(#list, focus))
	end, focus)
end
end,
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "Open",
										'func', function (self, ...)
local list = #self > 0 and self or self:ResolveId("idRightList")
list:SetFocus()
if GetUIStyleGamepad() then
	list:SetSelection(1)
end
XContentTemplateList.Open(self, ...)
end,
									}),
									PlaceObj('XTemplateFunc', {
										'name', "OnShortcut(self, shortcut, source)",
										'func', function (self, shortcut, source)
if shortcut == "DPadRight" or shortcut == "LeftThumbRight" then
	local list = self:ResolveId("idRightList")
	if list and #list > 0 then
		local left_top = self.focused_item or 1
		while self[left_top-1] and not self[left_top-1].outside_parent do
			left_top = left_top - 1
		end
		local diff = (self.focused_item or 1) - left_top
		local right_top = list.focused_item or 1
		while list[right_top-1] and not list[right_top-1].outside_parent do
			right_top = right_top - 1
		end
		self:SetFocus(false, true)
		list:SetFocus()
		list:SetSelection(Min(#list, right_top + diff))
	end
	return "break"
end
return XContentTemplateList.OnShortcut(self, shortcut, source)
end,
									}),
									PlaceObj('XTemplateMode', {
										'mode', "review",
									}, {
										PlaceObj('XTemplateForEach', {
											'comment', "item",
											'array', function (parent, context) return context:GetMatchingApplicantsList() end,
											'item_in_context', "prop_meta",
											'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "PropApplicant", 300, 35)
end,
										}),
										}),
									}),
								PlaceObj('XTemplateTemplate', {
									'__template', "ScrollbarNew",
									'Id', "idLeftScroll",
									'Target', "idLeftList",
								}),
								}),
							}),
						}),
					}),
				}),
			}),
		}),
})

