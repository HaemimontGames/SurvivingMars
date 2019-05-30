-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipMultiSelect",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "MultiSelectionWrapper",
		'__template', "Infopanel",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "Building: priority",
			'__condition', function (parent, context) return context.prio_button and not context:AreAllDestroyed() end,
			'__template', "InfopanelButton",
			'RolloverText', T(370449987367, --[[XTemplate ipMultiSelect RolloverText]] "Priority affects how often this building is serviced by Drones as well as its share of Power and life support. Notifications are not shown for buildings with low priority.<newline><newline>Current priority: <em><UIPriority></em>"),
			'RolloverTitle', T(369, --[[XTemplate ipMultiSelect RolloverTitle]] "Change Priority"),
			'RolloverHintGamepad', T(7659, --[[XTemplate ipMultiSelect RolloverHintGamepad]] "<ButtonA> Change priority<newline><ButtonX> Change priority of all <display_name_pl>"),
			'Id', "idPriority",
			'OnContextUpdate', function (self, context, ...)
				local priority = context:GetLowestPriority()
				if priority == 1 then
					self:SetIcon("UI/Icons/IPButtons/normal_priority.tga")
				elseif priority == 2 then
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
				self.context:TogglePriority(1)
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
			'comment', "Building: on/off",
			'__condition', function (parent, context) return context.on_off_button and not context:AreAllDestroyed() end,
			'__template', "InfopanelButton",
			'RolloverText', T(292551169472, --[[XTemplate ipMultiSelect RolloverText]] "Buildings that are turned off do not function and never consume Power or resources.\n\nCurrent status: <em><UIWorkingStatus></em>"),
			'RolloverDisabledText', T(10553, --[[XTemplate ipMultiSelect RolloverDisabledText]] "This building is currently disabled."),
			'RolloverTitle', T(627191661712, --[[XTemplate ipMultiSelect RolloverTitle]] "Turn On/Off"),
			'OnPressParam', "ToggleWorking",
			'OnPress', function (self, gamepad)
				self.context:ToggleWorking()
			end,
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "DroneBase: move",
			'__condition', function (parent, context) return context:IsClassSupported("DroneBase") end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T(806760132448, --[[XTemplate ipMultiSelect RolloverDisabledText]] "Vehicle inactive."),
			'RolloverTitle', T(4422, --[[XTemplate ipMultiSelect RolloverTitle]] "Move / Interact"),
			'RolloverDisabledTitle', T(4422, --[[XTemplate ipMultiSelect RolloverDisabledTitle]] "Move / Interact"),
			'OnContextUpdate', function (self, context, ...)
				context:ToggleControlMode_Update(self)
			end,
			'OnPressParam', "ToggleControlMode",
			'Icon', "UI/Icons/IPButtons/move.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Colonist: assign to building",
			'__condition', function (parent, context) return context:IsClassSupported("Colonist") end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T(12414, --[[XTemplate ipMultiSelect RolloverDisabledText]] "Can't be assigned"),
			'RolloverTitle', T(12415, --[[XTemplate ipMultiSelect RolloverTitle]] "Assign to Building"),
			'RolloverDisabledTitle', T(12416, --[[XTemplate ipMultiSelect RolloverDisabledTitle]] "Assign to Building"),
			'OnContextUpdate', function (self, context, ...)
				context:ToggleInteraction_Update(self)
			end,
			'OnPressParam', "ToggleInteraction",
			'Icon', "UI/Icons/IPButtons/assign_residence.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Drone: reassign",
			'__condition', function (parent, context) return context:IsClassSupported("Drone") end,
			'__template', "InfopanelButton",
			'RolloverDisabledText', T(806760132448, --[[XTemplate ipMultiSelect RolloverDisabledText]] "Vehicle inactive."),
			'RolloverTitle', T(12116, --[[XTemplate ipMultiSelect RolloverTitle]] "Reassign"),
			'RolloverDisabledTitle', T(12117, --[[XTemplate ipMultiSelect RolloverDisabledTitle]] "Reassign"),
			'OnContextUpdate', function (self, context, ...)
				context:ToggleReassignInteractionMode_Update(self)
			end,
			'OnPressParam', "ToggleReassignInteractionMode",
			'Icon', "UI/Icons/IPButtons/reassign.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Drone: drop resource",
			'__condition', function (parent, context) return context:IsClassSupported("Drone") end,
			'__template', "InfopanelButton",
			'RolloverText', T(739956507587, --[[XTemplate ipMultiSelect RolloverText]] "Drops any carried resource."),
			'RolloverDisabledText', T(448814888293, --[[XTemplate ipMultiSelect RolloverDisabledText]] "<DropCarriedResourceFromUIDisabledRollover>"),
			'RolloverTitle', T(4431, --[[XTemplate ipMultiSelect RolloverTitle]] "Drop Carried Resource"),
			'RolloverDisabledTitle', T(4431, --[[XTemplate ipMultiSelect RolloverDisabledTitle]] "Drop Carried Resource"),
			'OnContextUpdate', function (self, context, ...)
				context:DropCarriedResourceFromUI_Update(self)
			end,
			'OnPressParam', "DropCarriedResourceFromUI",
			'Icon', "UI/Icons/IPButtons/unload.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Demolishable: salvage",
			'__condition', function (parent, context) return context:IsClassSupported("Demolishable") and not context:AreAllDestroyed() end,
			'__template', "InfopanelButton",
			'RolloverText', T(164337309027, --[[XTemplate ipMultiSelect RolloverText]] "Destroy all selected units.\n<UIRefundRes> will be refunded upon salvage."),
			'RolloverTitle', T(12118, --[[XTemplate ipMultiSelect RolloverTitle]] "Salvage"),
			'RolloverDisabledTitle', T(12119, --[[XTemplate ipMultiSelect RolloverDisabledTitle]] "Salvage"),
			'OnContextUpdate', function (self, context, ...)
				context:ToggleDemolish_Update(self)
			end,
			'OnPressParam', "ToggleDemolish",
			'Icon', "UI/Icons/IPButtons/salvage_1.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T(415548446634, --[[XTemplate ipMultiSelect Title]] "Units"),
			'Icon', "UI/Icons/Sections/workshifts.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(630467259098, --[[XTemplate ipMultiSelect Text]] "<DetailedObjectsCount>"),
			}),
			}),
		}),
})

