-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customShuttleHub",
	PlaceObj('XTemplateGroup', {
		'__context_of_kind', "ShuttleHub",
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "make shuttles",
			'__template', "InfopanelButton",
			'RolloverTitle', T(821612835210, --[[XTemplate customShuttleHub RolloverTitle]] "Construct a Shuttle"),
			'RolloverHint', T(9803, --[[XTemplate customShuttleHub RolloverHint]] "<left_click> Construct a new Shuttle<newline><right_click> Cancel a Shuttle construction<newline>Ctrl + <left_click> Construct five new Shuttles"),
			'RolloverHintGamepad', T(655064239120, --[[XTemplate customShuttleHub RolloverHintGamepad]] "<ButtonA> Construct a new Shuttle<newline><ButtonX> Cancel a Shuttle construction<newline><ButtonY> Construct five new Shuttles"),
			'OnContextUpdate', function (self, context, ...)
				local can_construct = context.max_shuttles - (#context.shuttle_infos + context.queued_shuttles_for_construction) > 0
				if can_construct then
					self:SetRolloverText(T(324514950847, "The construction of a new Shuttle costs:<newline><SingleShuttleCostStr>"))
				else
					self:SetRolloverText(T(174054841334, "No more shuttles can be constructed."))
				end
			end,
			'OnPressParam', "QueueConstructShuttle",
			'OnPress', function (self, gamepad)
				self.context:QueueConstructShuttle(1 * (not gamepad and IsMassUIModifierPressed() and 5 or 1))
			end,
			'AltPress', true,
			'OnAltPress', function (self, gamepad)
				self.context:QueueConstructShuttle(-1 * (not gamepad and IsMassUIModifierPressed() and 5 or 1))
			end,
			'Icon', "UI/Icons/IPButtons/shuttle.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnShortcut(self, shortcut, source)",
				'func', function (self, shortcut, source)
					if shortcut == "ButtonY" then
						self.context:QueueConstructShuttle(5)
						return "break"
					end
					
					return XTextButton.OnShortcut(self, shortcut, source)
				end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "toggle transport mode",
			'__template', "InfopanelButton",
			'RolloverText', T(11499, --[[XTemplate customShuttleHub RolloverText]] "Set Shuttles from this Hub to transport resources, Colonists or both.<newline><newline>Current status: <UITransportModeCurrentStatus><em>"),
			'RolloverTitle', T(11423, --[[XTemplate customShuttleHub RolloverTitle]] "Toggle Transport Mode"),
			'RolloverHint', T(11501, --[[XTemplate customShuttleHub RolloverHint]] "<left_click> Toggle Transport Mode"),
			'RolloverHintGamepad', T(11502, --[[XTemplate customShuttleHub RolloverHintGamepad]] "<ButtonA> Toggle Transport Mode"),
			'OnPressParam', "ToggleTransportMode",
			'OnPress', function (self, gamepad)
				self.context:ToggleTransportMode()
			end,
			'Icon', "UI/Icons/IPButtons/shuttle_transport_all.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'OnContextUpdate', function (self, context, ...)
				self:SetVisible(context.queued_shuttles_for_construction ~= 0)
			end,
			'Title', T(726161435938, --[[XTemplate customShuttleHub Title]] "Shuttle construction<right><queued_shuttles_for_construction>"),
			'Icon', "UI/Icons/Sections/shuttle_2.tga",
			'TitleHAlign', "stretch",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelProgress",
				'BindTo', "ShuttleConstructionProgress",
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(106779987443, --[[XTemplate customShuttleHub Text]] "<ShuttleConstructionCostsStr>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T(8723, --[[XTemplate customShuttleHub RolloverText]] "<UIRolloverText>"),
			'RolloverTitle', T(933065747298, --[[XTemplate customShuttleHub RolloverTitle]] "Shuttles"),
			'Title', T(766548374853, --[[XTemplate customShuttleHub Title]] "Shuttles<right><count(shuttle_infos)>/<max_shuttles>"),
			'Icon', "UI/Icons/Sections/shuttle_1.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(398, --[[XTemplate customShuttleHub Text]] "In flight<right><FlyingShuttles>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(8700, --[[XTemplate customShuttleHub Text]] "Refueling<right><RefuelingShuttles>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(717110331584, --[[XTemplate customShuttleHub Text]] "Idle<right><IdleShuttles>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(8701, --[[XTemplate customShuttleHub Text]] "Global load <right><GlobalLoadText>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(11424, --[[XTemplate customShuttleHub Text]] "People transported last sol<right><count(people_flights)>"),
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(11425, --[[XTemplate customShuttleHub Text]] "Cargo flights last sol<right><count(cargo_flights)>"),
			}),
			}),
		}),
})

