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
		'LayoutMethod', "VList",
		'ContextUpdateOnOpen', true,
		'FocusOnOpen', "",
	}, {
		PlaceObj('XTemplateWindow', {
			'comment', "top",
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateWindow', {
				'Dock', "box",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Dock', "top",
					'Image', "UI/Infopanel/up.tga",
					'ImageFit', "stretch-x",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Dock', "bottom",
					'Image', "UI/Infopanel/down.tga",
					'ImageFit', "stretch-x",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Image', "UI/Infopanel/pad_2.tga",
					'ImageFit', "stretch",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Image', "UI/Infopanel/watermark_2.tga",
					'TileFrame', true,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "title",
				'__class', "XFrame",
				'IdNode', false,
				'Margins', box(2, 2, 2, 2),
				'Image', "UI/Infopanel/title.tga",
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
				'Padding', box(18, 4, 18, 8),
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__context_of_kind', "CycleMember",
					'__template', "InfopanelText",
					'Id', "idCycleText",
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "buttons",
					'Id', "idMainButtons",
					'Margins', box(2, 0, 2, 0),
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
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Margins', box(30, 0, 0, 0),
				'Dock', "box",
				'Image', "UI/Infopanel/pad.tga",
				'ImageFit', "stretch",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'Image', "UI/Infopanel/watermark.tga",
					'TileFrame', true,
				}),
				}),
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
			'Margins', box(30, 0, 0, 0),
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
self.parent.idActionsFrame:SetVisible(#self.parent.idActionButtons > 1)
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idActionsFrame",
				'IdNode', false,
				'Margins', box(-1, 0, 0, 0),
				'Padding', box(24, 0, 0, 0),
				'Dock', "right",
				'FoldWhenHidden', true,
				'Image', "UI/Infopanel/down_buttons.tga",
				'FrameBox', box(24, 2, 0, 2),
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "actions",
					'Id', "idActionButtons",
					'LayoutMethod', "HList",
				}, {
					PlaceObj('XTemplateWindow', {
						'Visible', false,
						'RelativeFocusOrder', "new-line",
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "rename",
						'__context_of_kind', "Renamable",
						'__condition', function (parent, context) return context.rename_allowed end,
						'__template', "InfopanelAction",
						'RolloverText', T{4034, --[[XTemplate Infopanel RolloverText]] "Set a custom name."},
						'RolloverTitle', T{4033, --[[XTemplate Infopanel RolloverTitle]] "Rename <display_name>"},
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
self.context:ShowRenameUI()
end,
						'Image', "UI/Infopanel/rename.tga",
						'Rows', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "skin",
						'__context_of_kind', "SkinChangeable",
						'__condition', function (parent, context) return not IsKindOf(context, "ConstructionSite") and #(context:GetSkins() or "") > 1 end,
						'__template', "InfopanelAction",
						'RolloverText', T{4041, --[[XTemplate Infopanel RolloverText]] "Cycle through all <count(Skins)> skins."},
						'RolloverTitle', T{4042, --[[XTemplate Infopanel RolloverTitle]] "Change Skin"},
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
self.context:CycleSkin()
end,
						'Image', "UI/Infopanel/infopanel_skin.tga",
						'Rows', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "camera",
						'__context_of_kind', "CameraFollowObject",
						'__condition', function (parent, context) return not context.camera_follow_disabled end,
						'__template', "InfopanelAction",
						'RolloverText', T{10116, --[[XTemplate Infopanel RolloverText]] "Activate a close-up camera that follows this unit."},
						'RolloverTitle', T{10117, --[[XTemplate Infopanel RolloverTitle]] "Follow Camera"},
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
Camera3pFollow(self.context)
end,
						'Image', "UI/Infopanel/camera_follow.tga",
						'Rows', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "pin",
						'__context_of_kind', "PinnableObject",
						'__condition', function (parent, context) return context.show_pin_toggle end,
						'__template', "InfopanelAction",
						'RelativeFocusOrder', "next-in-line",
						'OnContextUpdate', function (self, context, ...)
if context:IsPinned() then
	self:SetRow(2)
	self:SetRolloverTitle(T{4043, "Pinned"})
	self:SetRolloverText(T{4044, "Unpin this item from the quick bar."})
else
	self:SetRow(1)
	self:SetRolloverTitle(T{4045, "Unpinned"})
	self:SetRolloverText(T{4046, "Pin this item to the quick bar."})
end
end,
						'OnPress', function (self, gamepad)
self.context:TogglePin()
ObjModified(self.context)
end,
						'Image', "UI/Infopanel/pin.tga",
						'Rows', 2,
					}),
					PlaceObj('XTemplateTemplate', {
						'comment', "encyclopedia",
						'__condition', function (parent, context) return context:HasMember("encyclopedia_id") and (context.encyclopedia_id or "") ~= "" end,
						'__template', "InfopanelAction",
						'RolloverText', T{4032, --[[XTemplate Infopanel RolloverText]] "Open the corresponding Encyclopedia article."},
						'RolloverTitle', T{7384, --[[XTemplate Infopanel RolloverTitle]] "Encyclopedia"},
						'RelativeFocusOrder', "next-in-line",
						'OnPress', function (self, gamepad)
OpenEncyclopedia(self.context.encyclopedia_id)
end,
						'Image', "UI/Infopanel/encyclopedia.tga",
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Dock', "top",
				'Image', "UI/Common/message_choice_up.tga",
				'ImageFit', "stretch-x",
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

