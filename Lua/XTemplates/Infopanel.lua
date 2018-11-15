-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__content = function (parent, context) return parent.idContent end,
	__is_kind_of = "InfopanelDlg",
	group = "Infopanel",
	id = "Infopanel",
	PlaceObj('XTemplateWindow', {
		'__class', "InfopanelDlg",
		'HAlign', "right",
		'VAlign', "top",
		'MinWidth', 410,
		'MaxWidth', 410,
		'ContextUpdateOnOpen', true,
		'FocusOnOpen', "",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XSizeConstrainedWindow",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "top",
				'__class', "XFrame",
				'IdNode', false,
				'LayoutMethod', "VList",
				'Image', "UI/CommonNew/ip.tga",
				'FrameBox', box(35, 45, 35, 35),
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "title",
					'MinHeight', 45,
					'MaxHeight', 45,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelTitle",
						'Id', "idTitle",
						'Margins', box(0, 0, 0, 0),
						'Padding', box(2, 8, 2, 8),
						'HAlign', "stretch",
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'Text', T{7411, --[[XTemplate Infopanel Text]] "<DisplayName>"},
						'TextHAlign', "center",
					}),
					PlaceObj('XTemplateWindow', {
						'Id', "idUpgrades",
						'Margins', box(0, -18, 10, 0),
						'Dock', "right",
						'LayoutMethod', "HList",
						'RelativeFocusOrder', "skip",
					}),
					PlaceObj('XTemplateFunc', {
						'name', "OnMouseButtonDown(self, pos, button)",
						'func', function (self, pos, button)
if button == "L" then
	ViewObjectMars(self:GetContext())
	return "break"
end
return "continue"
end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'Padding', box(18, 4, 18, 23),
					'LayoutMethod', "VList",
					'HandleMouse', true,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__context_of_kind', "CycleMember",
						'__template', "InfopanelText",
						'Id', "idCycleText",
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "buttons",
						'Id', "idMainButtons",
						'Margins', box(10, 5, 2, 10),
						'LayoutMethod', "HList",
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Id', "idDescription",
						'Text', T{957712410031, --[[XTemplate Infopanel Text]] "<IPDescription>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "specialization",
						'__context_of_kind', "Workplace",
						'__condition', function (parent, context) return context.max_workers > 0 and context.specialist ~= "none" end,
						'__template', "InfopanelText",
						'Text', T{995212188397, --[[XTemplate Infopanel Text]] "Best workers<right><em><UISpecialization></em>"},
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "include InfopanelHeader",
						'array', function (parent, context) return Presets.XTemplate.InfopanelHeader end,
						'run_before', function (parent, context, item, i, n)
item:Eval(parent, context)
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "mid",
				'Id', "idContent",
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateForEach', {
					'comment', "include InfopanelContent",
					'array', function (parent, context) return Presets.XTemplate.InfopanelContent end,
					'run_before', function (parent, context, item, i, n)
item:Eval(parent, context)
end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "bottom",
				'__class', "XContextWindow",
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local actionButtons = self:ResolveId("idActionButtons")
actionButtons:SetVisible(#actionButtons > 1)
end,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "actions",
					'Id', "idActionButtons",
					'Margins', box(0, 3, 2, 0),
					'HAlign', "right",
					'LayoutMethod', "HList",
					'LayoutHSpacing', 3,
				}, {
					PlaceObj('XTemplateTemplate', {
						'comment', "rename",
						'__context_of_kind', "Renamable",
						'__condition', function (parent, context) return (not context:IsKindOf("BaseBuilding") or context:GetUIInteractionState()) and context.rename_allowed end,
						'__template', "InfopanelAction",
						'RolloverText', T{4034, --[[XTemplate Infopanel RolloverText]] "Set a custom name."},
						'RolloverTitle', T{4033, --[[XTemplate Infopanel RolloverTitle]] "Rename <display_name>"},
						'Margins', box(-12, -12, -12, 0),
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
local shortcuts = GetShortcuts("actionRenameSelected")
local hint = ""
if shortcuts and (shortcuts[1] or shortcuts[2]) then
	hint = T{10946, " / <em><ShortcutName('actionRenameSelected', 'keyboard')></em>"}
end
self:SetRolloverHint(T{10947, "<left_click><hint> Activate", hint = hint})
end,
						'OnPress', function (self, gamepad)
self.context:ShowRenameUI(gamepad)
end,
						'Icon', "UI/Infopanel/rename.tga",
						'IconRows', 2,
						'IconColumns', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "skin",
						'__context_of_kind', "SkinChangeable",
						'__condition', function (parent, context) return not IsKindOf(context, "ConstructionSite") and #(context:GetSkins() or "") > 1 end,
						'__template', "InfopanelAction",
						'RolloverText', T{4041, --[[XTemplate Infopanel RolloverText]] "Cycle through all <count(Skins)> skins."},
						'RolloverTitle', T{4042, --[[XTemplate Infopanel RolloverTitle]] "Change Skin"},
						'Margins', box(-12, -12, -12, 0),
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
self.context:CycleSkin()
end,
						'Icon', "UI/Infopanel/infopanel_skin.tga",
						'IconRows', 2,
						'IconColumns', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "camera",
						'__context_of_kind', "CameraFollowObject",
						'__condition', function (parent, context) return not context.camera_follow_disabled end,
						'__template', "InfopanelAction",
						'RolloverText', T{10116, --[[XTemplate Infopanel RolloverText]] "Activate a close-up camera that follows this unit."},
						'RolloverTitle', T{10117, --[[XTemplate Infopanel RolloverTitle]] "Follow Camera"},
						'Margins', box(-12, -12, -12, 0),
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
local shortcuts = GetShortcuts("actionFollowCamera")
local hint = ""
if shortcuts and (shortcuts[1] or shortcuts[2]) then
	hint = T{10948, " / <em><ShortcutName('actionFollowCamera', 'keyboard')></em>"}
end
self:SetRolloverHint(T{10947, "<left_click><hint> Activate", hint = hint})
end,
						'OnPress', function (self, gamepad)
Camera3pFollow(self.context)
end,
						'Icon', "UI/Infopanel/camera_follow.tga",
						'IconRows', 2,
						'IconColumns', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "pin",
						'__context_of_kind', "PinnableObject",
						'__condition', function (parent, context) return context.show_pin_toggle end,
						'__template', "InfopanelAction",
						'Margins', box(-12, -12, -12, 0),
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
local shortcuts = GetShortcuts("actionTogglePin")
local hint = ""
if shortcuts and (shortcuts[1] or shortcuts[2]) then
	hint = T{10949, " / <em><ShortcutName('actionTogglePin', 'keyboard')></em>"}
end
self:SetRolloverHint(T{10947, "<left_click><hint> Activate", hint = hint})
if context:IsPinned() then
	self.idIcon:SetRow(2)
	self:SetRolloverTitle(T{4043, "Pinned"})
	self:SetRolloverText(T{4044, "Unpin this item from the quick bar."})
else
	self.idIcon:SetRow(1)
	self:SetRolloverTitle(T{4045, "Unpinned"})
	self:SetRolloverText(T{4046, "Pin this item to the quick bar."})
end
end,
						'OnPress', function (self, gamepad)
self.context:TogglePin()
ObjModified(self.context)
end,
						'Icon', "UI/Infopanel/pin.tga",
						'IconRows', 2,
						'IconColumns', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "encyclopedia",
						'__condition', function (parent, context) return context:HasMember("encyclopedia_id") and (context.encyclopedia_id or "") ~= "" end,
						'__template', "InfopanelAction",
						'RolloverText', T{4032, --[[XTemplate Infopanel RolloverText]] "Open the corresponding Encyclopedia article."},
						'RolloverTitle', T{7384, --[[XTemplate Infopanel RolloverTitle]] "Encyclopedia"},
						'Margins', box(-12, -12, -12, 0),
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
OpenEncyclopedia(self.context.encyclopedia_id)
end,
						'Icon', "UI/Infopanel/encyclopedia.tga",
						'IconColumns', 2,
					}),
					PlaceObj('XTemplateCode', {
						'comment', "first button image",
						'run', function (self, parent, context)
local first_btn = rawget(parent, 1)
if first_btn then
	first_btn:SetRelativeFocusOrder("new-line")
	first_btn:SetImage("UI/CommonNew/ip_button_1.tga")
end
end,
					}),
					}),
				}),
			}),
		}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Title",
		'editor', "text",
		'default', T{7412, --[[XTemplate Infopanel default]] "<DisplayName>"},
		'Set', function (self, value)
self.idTitle:SetText(value)
end,
	}),
	PlaceObj('XTemplateProperty', {
		'category', "General",
		'id', "Description",
		'editor', "text",
		'default', T{957712410031, --[[XTemplate Infopanel default]] "<IPDescription>"},
		'Set', function (self, value)
self.idDescription:SetText(value)
if value == "" then
	self.idDescription:SetDock("ignore")
	self.idDescription:SetVisible(false)
end
end,
	}),
})

