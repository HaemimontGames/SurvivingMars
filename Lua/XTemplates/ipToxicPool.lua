-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipToxicPool",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ToxicPool",
		'__template', "Infopanel",
		'Description', T(7383, --[[XTemplate ipToxicPool Description]] "<description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "priority",
			'__context', function (parent, context) return context:HasMember("construction_group") and context.construction_group and context.construction_group[1] or context end,
			'__condition', function (parent, context) return context.prio_button end,
			'__template', "InfopanelButton",
			'RolloverText', T(370449987367, --[[XTemplate ipToxicPool RolloverText]] "Priority affects how often this building is serviced by Drones as well as its share of Power and life support. Notifications are not shown for buildings with low priority.<newline><newline>Current priority: <em><UIPriority></em>"),
			'RolloverTitle', T(369, --[[XTemplate ipToxicPool RolloverTitle]] "Change Priority"),
			'RolloverHintGamepad', T(7659, --[[XTemplate ipToxicPool RolloverHintGamepad]] "<ButtonA> Change priority<newline><ButtonX> Change priority of all <display_name_pl>"),
			'Id', "idPriority",
			'OnContextUpdate', function (self, context, ...)
				if context.priority == 1 then
					self:SetIcon("UI/Icons/IPButtons/normal_priority.tga")
				elseif context.priority == 2 then
					self:SetIcon("UI/Icons/IPButtons/high_priority.tga")
				else
					self:SetIcon("UI/Icons/IPButtons/urgent_priority.tga")
				end
				local shortcuts = GetShortcuts("actionPriority")
				local binding = ""
				if shortcuts and (shortcuts[1] or shortcuts[2]) then
					binding = T(10950, "<newline><center><em><ShortcutName('actionPriority', 'keyboard')></em> Increase Priority")
				end
				self:SetRolloverHint(T{10951, "<left><left_click> Increase priority<right><right_click> Decrease priority<binding><newline><center><em>Ctrl + <left_click></em> Change priority of all <display_name_pl>", binding = binding})
			end,
			'OnPress', function (self, gamepad)
				PlayFX("UIChangePriority")
				self.context:TogglePriority(1, not gamepad and IsMassUIModifierPressed())
				ObjModified(self.context)
			end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
				if gamepad then
					self.context:TogglePriority(1, true)
				else
					self.context:TogglePriority(-1, IsMassUIModifierPressed())
				end
				ObjModified(self.context)
			end,
			'Translate', true,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(496590068455, --[[XTemplate ipToxicPool RolloverText]] "Toxic Pool cleanup progress"),
			'RolloverTitle', T(848761493683, --[[XTemplate ipToxicPool RolloverTitle]] "Toxic Pool"),
			'Icon', "UI/Icons/Sections/dust.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrameProgress",
				'Id', "idProgress",
				'Margins', box(10, 15, 10, 14),
				'Image', "UI/Infopanel/progress_bar.tga",
				'FrameBox', box(5, 0, 5, 0),
				'OnContextUpdate', function (self, context, ...)
					XFrameProgress.OnContextUpdate(self, context, ...)
				end,
				'BindTo', "CleanProgress",
				'MinProgressSize', 8,
				'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
				'ProgressFrameBox', box(4, 0, 4, 0),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "warning",
			'__condition', function (parent, context) return context:IsOutsideCommandRange() or g_RainDisaster == "toxic" end,
			'__template', "sectionWarning",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

