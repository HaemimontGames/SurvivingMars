-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "LifeSupportGridsOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverText', T(546174280281, --[[XTemplate LifeSupportGridsOverviewRow RolloverText]] "Total production, consumption and storage of Oxygen and Water in the grid."),
		'RolloverTitle', T(81, --[[XTemplate LifeSupportGridsOverviewRow RolloverTitle]] "Life Support"),
		'RolloverHint', T(12110, --[[XTemplate LifeSupportGridsOverviewRow RolloverHint]] "<left_click><left_click> Show all buildings in the grid"),
		'RolloverHintGamepad', T(12111, --[[XTemplate LifeSupportGridsOverviewRow RolloverHintGamepad]] "<ButtonA> Show all buildings in the grid"),
		'Id', "",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTitle",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 250,
			'MaxWidth', 250,
			'TextStyle', "OverviewItemName",
			'Translate', true,
			'Shorten', true,
			'TextVAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "production",
			'MinWidth', 200,
			'MaxWidth', 200,
		}, {
			PlaceObj('XTemplateWindow', {
				'HAlign', "center",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "air",
					'__context', function (parent, context) return context.air end,
					'__class', "XText",
					'Id', "idProductionAir",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(126290492272, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<air(CurrentProduction)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "water",
					'__context', function (parent, context) return context.water end,
					'__class', "XText",
					'Id', "idProductionWater",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(554510935584, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<water(CurrentProduction)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'comment', "consumption",
			'MinWidth', 200,
			'MaxWidth', 200,
		}, {
			PlaceObj('XTemplateWindow', {
				'HAlign', "center",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "air",
					'__context', function (parent, context) return context.air end,
					'__class', "XText",
					'Id', "idConsumptionAir",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(830629640957, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<air(CurrentConsumption)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "water",
					'__context', function (parent, context) return context.water end,
					'__class', "XText",
					'Id', "idConsumptionWater",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(202269103709, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<water(CurrentConsumption)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'comment', "stored",
			'MinWidth', 200,
			'MaxWidth', 200,
		}, {
			PlaceObj('XTemplateWindow', {
				'HAlign', "center",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "air",
					'__context', function (parent, context) return context.air end,
					'__class', "XText",
					'Id', "idStoredPowerAir",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(430549692144, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<air(CurrentStorage)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "water",
					'__context', function (parent, context) return context.water end,
					'__class', "XText",
					'Id', "idStoredPowerWater",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'Translate', true,
					'Text', T(472313874115, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<water(CurrentStorage)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'comment', "change",
			'MinWidth', 200,
			'MaxWidth', 200,
		}, {
			PlaceObj('XTemplateWindow', {
				'HAlign', "center",
				'LayoutMethod', "HList",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "air",
					'__context', function (parent, context) return context.air end,
					'__class', "XText",
					'Id', "idChangeAir",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
						local delta = context:GetCurrentProduction() - context:GetCurrentConsumption()
						if delta < 0 then
							self:SetText(T{11836, "<red><air(delta)></red>", delta = delta})
						elseif delta > 0 then
							self:SetText(T{11837, "+<air(delta)>", delta = delta})
						else
							self:SetText(T{11838, "<air(delta)>", delta = delta}) --zero
						end
					end,
					'Translate', true,
					'Text', T(865587593873, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<air(0)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "water",
					'__context', function (parent, context) return context.water end,
					'__class', "XText",
					'Id', "idChangeWater",
					'Padding', box(0, 0, 0, 0),
					'VAlign', "center",
					'TextStyle', "OverviewItemValue",
					'ContextUpdateOnOpen', true,
					'OnContextUpdate', function (self, context, ...)
						local delta = context:GetCurrentProduction() - context:GetCurrentConsumption()
						if delta < 0 then
							self:SetText(T{11839, "<red><water(delta)></red>", delta = delta})
						elseif delta > 0 then
							self:SetText(T{11840, "+<water(delta)>", delta = delta})
						else
							self:SetText(T{11841, "<water(delta)>", delta = delta}) --zero
						end
					end,
					'Translate', true,
					'Text', T(441613197592, --[[XTemplate LifeSupportGridsOverviewRow Text]] "<water(0)>"),
					'WordWrap', false,
					'TextHAlign', "center",
					'TextVAlign', "center",
				}),
				}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDoubleClick(self, pos, button)",
			'func', function (self, pos, button)
				if button == "L" then
					if GetDialog("PlanetaryView") then return end
					local bld = CommandCenterChooseLifeSupportGridBuilding(self.context)
					ViewObjectMars(bld)
					SelectObj(bld)
					DelayedCall(1, ShowWaterOverlay)
					CloseCommandCenter()
					return "break"
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
				self:SetFocus(selected)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
				XCreateRolloverWindow(self, true)
				XTextButton.OnSetFocus(self, ...)
			end,
		}),
		}),
})

