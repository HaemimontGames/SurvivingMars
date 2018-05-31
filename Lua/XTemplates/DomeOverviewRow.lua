-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "DomeOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverText', T{749348081133, --[[XTemplate DomeOverviewRow RolloverText]] "<OverviewInfo>"},
		'OnContextUpdate', function (self, context, ...)
UpdateUICommandCenterRow(self, context, "dome")
XContextControl.OnContextUpdate(self, context, ...)
end,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 250,
			'MaxWidth', 250,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(255, 248, 233, 255),
			'RolloverTextColor', RGBA(255, 248, 233, 255),
			'Translate', true,
			'Text', T{7412, --[[XTemplate DomeOverviewRow Text]] "<DisplayName>"},
			'Shorten', true,
		}),
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return ColonistStatList end,
			'run_after', function (child, context, item, i, n)
child.OnContextUpdate = function(self, context)
	context:UICommandCenterStatUpdate(self, item)
end
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContextWindow",
				'IdNode', true,
				'MinWidth', 65,
				'MaxWidth', 65,
				'LayoutMethod', "HList",
				'ContextUpdateOnOpen', true,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idImage",
					'Margins', box(0, 0, 3, 0),
					'VAlign', "center",
					'MinWidth', 27,
					'MaxWidth', 27,
					'ImageFit', "smallest",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLabel",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 255, 255, 255),
					'RolloverTextColor', RGBA(255, 255, 255, 255),
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idLinked",
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 90,
			'MaxWidth', 90,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(255, 255, 255, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idJobs",
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 120,
			'MaxWidth', 120,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(255, 255, 255, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idHomes",
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 100,
			'MaxWidth', 100,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(255, 255, 255, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
			'WordWrap', false,
			'TextHAlign', "center",
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XTextButton",
			'RolloverTemplate', "Rollover",
			'RolloverAnchor', "left",
			'RolloverAnchorId', "node",
			'RolloverTitle', T{8728, --[[XTemplate DomeOverviewRow RolloverTitle]] "Birth Control Policy"},
			'ZOrder', 100000,
			'VAlign', "center",
			'MinWidth', 49,
			'MinHeight', 42,
			'MaxWidth', 49,
			'MaxHeight', 42,
			'LayoutHSpacing', 0,
			'Background', RGBA(0, 0, 0, 0),
			'Transparency', 50,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'RelativeFocusOrder', "next-in-line",
			'OnContextUpdate', function (self, context, ...)
local dome = ResolvePropObj(context)
local accept = dome.allow_birth
if accept then
	self.idButtonIcon:SetImage("UI/Icons/Sections/birth_on.tga")
else
	self.idButtonIcon:SetImage("UI/Icons/Sections/birth_off.tga")
end
-- rollover
local texts = {}
if accept then	
	texts[#texts+1] = T{8729, "Set the birth policy for this Dome. Colonists at high comfort will have children if births are allowed.<newline><newline>Current status: <em>Births are allowed</em>"}
	self:SetRolloverHint(T{8730, "<left_click> Forbid births in this Dome<newline><em>Ctrl + <left_click></em> Forbid births in all Domes"})
	self:SetRolloverHintGamepad(T{8731, "<ButtonA> Forbid births in this Dome<newline><ButtonX> Forbid births in all Domes"})
else
	texts[#texts+1] = T{8732, "Set the birth policy for this Dome. Colonists at high comfort will have children if births are allowed.<newline><newline>Current status: <em>Births are forbidden</em>"}
	self:SetRolloverHint(T{8733, "<left_click> Allow births in this Dome<newline><em>Ctrl + <left_click></em> Allow births in all Domes"})
	self:SetRolloverHintGamepad(T{8734, "<ButtonA> Allow births in this Dome <newline><ButtonX> Allow births in all Domes"})
end
texts[#texts + 1]  = dome:GetBirthText()	
self:SetRolloverText(table.concat(texts, "<newline><left>"))
end,
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'OnPress', function (self, gamepad)
self.context:ToggleAcceptBirth(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleAcceptBirth(true)
end
end,
			'RolloverBackground', RGBA(0, 0, 0, 0),
			'PressedBackground', RGBA(0, 0, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonIcon",
				'IdNode', false,
				'ZOrder', 2,
				'Shape', "InHHex",
				'Dock', "left",
				'HandleMouse', true,
				'ImageFit', "smallest",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idRollover",
					'IdNode', false,
					'Margins', box(-3, -3, -3, -3),
					'Dock', "box",
					'Visible', false,
					'Image', "UI/Common/Hex_small_shine_2.tga",
					'ImageFit', "smallest",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XTextButton",
			'RolloverTemplate', "Rollover",
			'RolloverAnchor', "left",
			'RolloverAnchorId', "node",
			'RolloverTitle', T{8887, --[[XTemplate DomeOverviewRow RolloverTitle]] "Use Passages for work"},
			'ZOrder', 100000,
			'VAlign', "center",
			'MinWidth', 49,
			'MinHeight', 42,
			'MaxWidth', 49,
			'MaxHeight', 42,
			'LayoutHSpacing', 0,
			'Background', RGBA(0, 0, 0, 0),
			'Transparency', 50,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'RelativeFocusOrder', "next-in-line",
			'OnContextUpdate', function (self, context, ...)
local dome = ResolvePropObj(context)
	local accept = dome.allow_work_in_connected
	if accept then
		self.idButtonIcon:SetImage("UI/Icons/Sections/work_in_connected_domes_on.tga")
	else
		self.idButtonIcon:SetImage("UI/Icons/Sections/work_in_connected_domes_off.tga")
	end
	-- rollover
	self:SetRolloverText(T{8888, "Allow or forbid working in connected Domes.<newline><newline>Current status: <em><UIWorkInConnected></em>"})
	if dome.allow_work_in_connected then
		self:SetRolloverHint(T{8889, "<left_click> Forbid for this Dome<newline><em>Ctrl + <left_click></em> Forbid for all Domes"})
		self:SetRolloverHintGamepad(T{8890, "<ButtonA> Forbid for this Dome<newline><ButtonX> Forbid for all Domes"})
	else
		self:SetRolloverHint(T{8891, "<left_click> Allow for this Dome<newline><em>Ctrl + <left_click></em> Allow for all Domes"})
		self:SetRolloverHintGamepad(T{8892, "<ButtonA> Allow for this Dome<newline><ButtonX> Allow for all Domes"})
	end
end,
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'OnPress', function (self, gamepad)
self.context:ToggleWorkInConnected(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleWorkInConnected(true)
end
end,
			'RolloverBackground', RGBA(0, 0, 0, 0),
			'PressedBackground', RGBA(0, 0, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonIcon",
				'IdNode', false,
				'ZOrder', 2,
				'Shape', "InHHex",
				'Dock', "left",
				'HandleMouse', true,
				'ImageFit', "smallest",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idRollover",
					'IdNode', false,
					'Margins', box(-3, -3, -3, -3),
					'Dock', "box",
					'Visible', false,
					'Image', "UI/Common/Hex_small_shine_2.tga",
					'ImageFit', "smallest",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XTextButton",
			'RolloverTemplate', "Rollover",
			'RolloverAnchor', "left",
			'RolloverAnchorId', "node",
			'RolloverTitle', T{8895, --[[XTemplate DomeOverviewRow RolloverTitle]] "Use Passages for services"},
			'ZOrder', 100000,
			'VAlign', "center",
			'MinWidth', 49,
			'MinHeight', 42,
			'MaxWidth', 49,
			'MaxHeight', 42,
			'LayoutHSpacing', 0,
			'Background', RGBA(0, 0, 0, 0),
			'Transparency', 50,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'RelativeFocusOrder', "next-in-line",
			'OnContextUpdate', function (self, context, ...)
local dome = ResolvePropObj(context)
	local accept = dome.allow_service_in_connected
	if accept then
		self.idButtonIcon:SetImage("UI/Icons/Sections/service_in_connected_domes_on.tga")
	else
		self.idButtonIcon:SetImage("UI/Icons/Sections/service_in_connected_domes_off.tga")
	end
	-- rollover
	self:SetRolloverText(T{8896, "Allow or forbid using service buildings in connected Domes.<newline><newline>Current status: <em><UIServiceInConnected></em>"})
	if dome.allow_service_in_connected then
		self:SetRolloverHint(T{8889, "<left_click> Forbid for this Dome<newline><em>Ctrl + <left_click></em> Forbid for all Domes"})
		self:SetRolloverHintGamepad(T{8890, "<ButtonA> Forbid for this Dome<newline><ButtonX> Forbid for all Domes"})
	else
		self:SetRolloverHint(T{8891, "<left_click> Allow for this Dome<newline><em>Ctrl + <left_click></em> Allow for all Domes"})
		self:SetRolloverHintGamepad(T{8892, "<ButtonA> Allow for this Dome<newline><ButtonX> Allow for all Domes"})
	end
end,
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'OnPress', function (self, gamepad)
self.context:ToggleServiceInConnected(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleServiceInConnected(true)
end
end,
			'RolloverBackground', RGBA(0, 0, 0, 0),
			'PressedBackground', RGBA(0, 0, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonIcon",
				'IdNode', false,
				'ZOrder', 2,
				'Shape', "InHHex",
				'Dock', "left",
				'HandleMouse', true,
				'ImageFit', "smallest",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idRollover",
					'IdNode', false,
					'Margins', box(-3, -3, -3, -3),
					'Dock', "box",
					'Visible', false,
					'Image', "UI/Common/Hex_small_shine_2.tga",
					'ImageFit', "smallest",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XTextButton",
			'RolloverTemplate', "Rollover",
			'RolloverAnchor', "left",
			'RolloverAnchorId', "node",
			'RolloverTitle', T{364, --[[XTemplate DomeOverviewRow RolloverTitle]] "Immigration Policy"},
			'ZOrder', 100000,
			'VAlign', "center",
			'MinWidth', 49,
			'MinHeight', 42,
			'MaxWidth', 49,
			'MaxHeight', 42,
			'LayoutHSpacing', 0,
			'Background', RGBA(0, 0, 0, 0),
			'Transparency', 50,
			'MouseCursor', "UI/Cursors/Rollover.tga",
			'RelativeFocusOrder', "next-in-line",
			'OnContextUpdate', function (self, context, ...)
local dome = ResolvePropObj(context)
	local accept = dome.accept_colonists
	if accept then
		self.idButtonIcon:SetImage("UI/Icons/Sections/accept_colonists_on.tga")
	else
		self.idButtonIcon:SetImage("UI/Icons/Sections/accept_colonists_off.tga")
	end
	-- rollover
	if dome.accept_colonists then
		self:SetRolloverText(T{7660, "Set the Immigration policy for this Dome. Colonists are not allowed to enter or leave quarantined Domes.<newline><newline>Current status: <em>Accepts new Colonists</em>"})
		self:SetRolloverHint(T{7661, "<left_click> Quarantine this Dome<newline><em>Ctrl + <left_click></em> Quarantine all Domes"})
		self:SetRolloverHintGamepad(T{7662, "<ButtonA> Quarantine this Dome<newline><ButtonX> Quarantine all Domes"})
	else
		self:SetRolloverText(T{365, "Set the Immigration policy for this Dome. Colonists are not allowed to enter or leave quarantined Domes.<newline><newline>Current status: <em>Quarantined</em>"})
		self:SetRolloverHint(T{7663, "<left_click> Accept Colonists in this Dome<newline><em>Ctrl + <left_click></em> Accept Colonists in all Domes"})
		self:SetRolloverHintGamepad(T{7664, "<ButtonA> Accept Colonists in this Dome<newline><ButtonX> Accept Colonists in all Domes"})
	end
end,
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'OnPress', function (self, gamepad)
self.context:ToggleAcceptColonists(not gamepad and IsMassUIModifierPressed())
end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleAcceptColonists(true)
end
end,
			'RolloverBackground', RGBA(0, 0, 0, 0),
			'PressedBackground', RGBA(0, 0, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonIcon",
				'IdNode', false,
				'ZOrder', 2,
				'Shape', "InHHex",
				'Dock', "left",
				'HandleMouse', true,
				'ImageFit', "smallest",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idRollover",
					'IdNode', false,
					'Margins', box(-3, -3, -3, -3),
					'Dock', "box",
					'Visible', false,
					'Image', "UI/Common/Hex_small_shine_2.tga",
					'ImageFit', "smallest",
				}),
				}),
			}),
		}),
})

