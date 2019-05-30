-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "Infobar",
	PlaceObj('XTemplateWindow', {
		'__context', function (parent, context) return CreateInfobarContextObject() end,
		'__class', "Infobar",
		'ZOrder', 150,
		'VAlign', "top",
		'LayoutMethod', "VList",
		'FocusOnOpen', "",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "GetRelativeFocus(self, order, relation)",
			'func', function (self, order, relation)
				local res = Infobar.GetRelativeFocus(self, order, relation)
				if not res then
					if relation == "left" then
						local bar = self:ResolveId("idTerraformingBar")
						if bar then
							res = bar:GetRelativeFocus(point(1000,1), relation)
						end
					end
				end
				return res
			end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionTranslate', false,
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnAction', function (self, host, source)
				host:SetFocus(false, true)
				XDestroyRolloverWindow()
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'HAlign', "center",
			'VAlign', "top",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idPad",
				'Padding', box(50, 0, 50, 0),
				'HAlign', "center",
				'VAlign', "top",
				'LayoutMethod', "HWrap",
				'HandleMouse', true,
				'Image', "UI/CommonNew/resources.tga",
				'FrameBox', box(42, 0, 42, 0),
				'SqueezeX', false,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'RolloverTemplate', "Rollover",
					'RolloverAnchor', "bottom",
					'RolloverText', T(974796457889, --[[XTemplate Infobar RolloverText]] "<FundingRollover>"),
					'RolloverTitle', T(500807906538, --[[XTemplate Infobar RolloverTitle]] "Funding"),
					'RolloverHintGamepad', T(816190283569, --[[XTemplate Infobar RolloverHintGamepad]] "<DPad> Navigate <DPadDown> Close"),
					'Id', "idFunding",
					'MinWidth', 55,
					'RolloverOnFocus', true,
					'RelativeFocusOrder', "next-in-line",
					'FXMouseIn', "UIButtonMouseIn",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idRollover",
						'Dock', "box",
						'Visible', false,
						'Image', "UI/Common/row_shine_2.tga",
						'ImageFit', "stretch",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idFunding",
						'Padding', box(2, 4, 2, 4),
						'HAlign', "center",
						'TextStyle', "Infobar",
						'Translate', true,
						'Text', T(325404562808, --[[XTemplate Infobar Text]] "<FundingText>"),
						'TextHAlign', "center",
						'TextVAlign', "center",
					}),
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XText.OnSetFocus(self, ...)
						end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'RolloverTemplate', "Rollover",
					'RolloverAnchor', "bottom",
					'RolloverText', T(113756642387, --[[XTemplate Infobar RolloverText]] "<ResearchRollover>"),
					'RolloverTitle', T(783732441536, --[[XTemplate Infobar RolloverTitle]] "Research"),
					'RolloverHintGamepad', T(816190283569, --[[XTemplate Infobar RolloverHintGamepad]] "<DPad> Navigate <DPadDown> Close"),
					'Id', "idResearch",
					'MinWidth', 130,
					'RolloverOnFocus', true,
					'RelativeFocusOrder', "next-in-line",
					'FXMouseIn', "UIButtonMouseIn",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idRollover",
						'Dock', "box",
						'Visible', false,
						'Image', "UI/Common/row_shine_2.tga",
						'ImageFit', "stretch",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idResearch",
						'Padding', box(2, 4, 2, 4),
						'HAlign', "center",
						'TextStyle', "Infobar",
						'Translate', true,
						'Text', T(212300384149, --[[XTemplate Infobar Text]] "<ResearchText>"),
						'TextHAlign', "center",
						'TextVAlign', "center",
					}),
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XText.OnSetFocus(self, ...)
						end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "electricity btn",
					'__class', "XButton",
					'RolloverTemplate', "Rollover",
					'RolloverAnchor', "bottom",
					'RolloverText', T(11682, --[[XTemplate Infobar RolloverText]] "<ElectricityGridRollover>"),
					'RolloverTitle', T(11683, --[[XTemplate Infobar RolloverTitle]] "Electricity"),
					'RolloverHint', T(11684, --[[XTemplate Infobar RolloverHint]] "<left_click> Toggle Display"),
					'RolloverHintGamepad', T(11685, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Toggle Display<newline><DPad> Navigate <DPadDown> Close"),
					'Id', "idElectricity",
					'HAlign', "center",
					'BorderColor', RGBA(0, 0, 0, 0),
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'RelativeFocusOrder', "next-in-line",
					'FXMouseIn', "UIButtonMouseIn",
					'FXPress', "BuildMenuButtonClick",
					'FocusedBorderColor', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'DisabledBorderColor', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
						ToggleElectricityOverlay()
					end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idRollover",
						'Dock', "box",
						'Visible', false,
						'Image', "UI/Common/row_shine_2.tga",
						'ImageFit', "stretch",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idGridResources",
						'Padding', box(3, 4, 3, 4),
						'TextStyle', "Infobar",
						'Translate', true,
						'Text', T(11686, --[[XTemplate Infobar Text]] "<ElectricityText>"),
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "water btn",
					'__class', "XButton",
					'RolloverTemplate', "Rollover",
					'RolloverAnchor', "bottom",
					'RolloverText', T(11687, --[[XTemplate Infobar RolloverText]] "<LifesupportGridRollover>"),
					'RolloverTitle', T(11688, --[[XTemplate Infobar RolloverTitle]] "Life support"),
					'RolloverHint', T(11684, --[[XTemplate Infobar RolloverHint]] "<left_click> Toggle Display"),
					'RolloverHintGamepad', T(11685, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Toggle Display<newline><DPad> Navigate <DPadDown> Close"),
					'Id', "idLifeSupport",
					'HAlign', "center",
					'BorderColor', RGBA(0, 0, 0, 0),
					'Background', RGBA(0, 0, 0, 0),
					'MouseCursor', "UI/Cursors/Rollover.tga",
					'RelativeFocusOrder', "next-in-line",
					'FXMouseIn', "UIButtonMouseIn",
					'FXPress', "BuildMenuButtonClick",
					'FocusedBorderColor', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'DisabledBorderColor', RGBA(0, 0, 0, 0),
					'OnPress', function (self, gamepad)
						ToggleWaterOverlay()
					end,
					'RolloverBackground', RGBA(0, 0, 0, 0),
					'PressedBackground', RGBA(0, 0, 0, 0),
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Id', "idRollover",
						'Dock', "box",
						'Visible', false,
						'Image', "UI/Common/row_shine_2.tga",
						'ImageFit', "stretch",
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XText",
						'Id', "idGridResources",
						'Padding', box(3, 4, 3, 4),
						'TextStyle', "Infobar",
						'Translate', true,
						'Text', T(11689, --[[XTemplate Infobar Text]] "<LifesupportText>"),
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'Id', "idBasicResources",
					'MinWidth', 250,
					'RolloverOnFocus', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XContextWindow.OnSetFocus(self, ...)
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "centers the texts",
						'HAlign', "center",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(965950572237, --[[XTemplate Infobar RolloverText]] "<MetalsRollover>"),
							'RolloverTitle', T(921009833362, --[[XTemplate Infobar RolloverTitle]] "Metals"),
							'RolloverHint', T(185759925809, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(238973917718, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Metals")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idMetals",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(290848825416, --[[XTemplate Infobar Text]] "<MetalsText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(777092042856, --[[XTemplate Infobar RolloverText]] "<ConcreteRollover>"),
							'RolloverTitle', T(558957250020, --[[XTemplate Infobar RolloverTitle]] "Concrete"),
							'RolloverHint', T(185759925809, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(868548677390, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Concrete")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idConcrete",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(563905203540, --[[XTemplate Infobar Text]] "<ConcreteText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(531540704716, --[[XTemplate Infobar RolloverText]] "<FoodRollover>"),
							'RolloverTitle', T(165513395865, --[[XTemplate Infobar RolloverTitle]] "Food"),
							'RolloverHint', T(185759925809, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(868548677390, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Food")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idFood",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(587907473693, --[[XTemplate Infobar Text]] "<FoodText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(101740720498, --[[XTemplate Infobar RolloverText]] "<RareMetalsRollover>"),
							'RolloverTitle', T(421995872564, --[[XTemplate Infobar RolloverTitle]] "Rare Metals"),
							'RolloverHint', T(185759925809, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(868548677390, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("PreciousMetals")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idPreciousMetals",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(118276114882, --[[XTemplate Infobar Text]] "<PreciousMetalsText>"),
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'Id', "idAdvancedResources",
					'MinWidth', 250,
					'RolloverOnFocus', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XContextWindow.OnSetFocus(self, ...)
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "centers the texts",
						'HAlign', "center",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(353676002560, --[[XTemplate Infobar RolloverText]] "<PolymersRollover>"),
							'RolloverTitle', T(112574648549, --[[XTemplate Infobar RolloverTitle]] "Polymers"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(910237457414, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Polymers")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idPolymers",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(456271481390, --[[XTemplate Infobar Text]] "<PolymersText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(565651032917, --[[XTemplate Infobar RolloverText]] "<MachinePartsRollover>"),
							'RolloverTitle', T(478510455605, --[[XTemplate Infobar RolloverTitle]] "Machine Parts"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(910237457414, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("MachineParts")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idMachineParts",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(411476328157, --[[XTemplate Infobar Text]] "<MachinePartsText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(632386079741, --[[XTemplate Infobar RolloverText]] "<FuelRollover>"),
							'RolloverTitle', T(627597841939, --[[XTemplate Infobar RolloverTitle]] "Fuel"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(910237457414, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Fuel")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idFuel",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(771466895406, --[[XTemplate Infobar Text]] "<FuelText>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(400795478220, --[[XTemplate Infobar RolloverText]] "<ElectronicsRollover>"),
							'RolloverTitle', T(406684885664, --[[XTemplate Infobar RolloverTitle]] "Electronics"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(910237457414, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Electronics")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idElectronics",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(312385745918, --[[XTemplate Infobar Text]] "<ElectronicsText>"),
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__dlc', "armstrong",
					'__class', "XContextControl",
					'Id', "idSeedsResources",
					'IdNode', false,
					'Padding', box(16, 0, 16, 0),
					'Visible', false,
					'FoldWhenHidden', true,
					'RolloverOnFocus', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XContextWindow.OnSetFocus(self, ...)
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "centers the texts",
						'HAlign', "center",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(12108, --[[XTemplate Infobar RolloverText]] "<SeedsRollover>"),
							'RolloverTitle', T(563862740772, --[[XTemplate Infobar RolloverTitle]] "Seeds"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(910237457414, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'Id', "idSeedsText",
							'MinWidth', 25,
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("Seeds")
							end,
							'OnAltPress', function (self, gamepad)
								if self.action and self.action.OnAltAction then
										local host = GetActionsHost(self, true)
										if host then
											self.action:OnAltAction(host, self)
										end
									end
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idSeeds",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(12109, --[[XTemplate Infobar Text]] "<SeedsText>"),
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'Id', "idWasteRockResources",
					'IdNode', false,
					'Padding', box(16, 0, 16, 0),
					'RolloverOnFocus', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XContextWindow.OnSetFocus(self, ...)
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "centers the texts",
						'HAlign', "center",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(12408, --[[XTemplate Infobar RolloverText]] "<WasteRockRollover>"),
							'RolloverTitle', T(12409, --[[XTemplate Infobar RolloverTitle]] "Waste Rock"),
							'RolloverHint', T(846761005248, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle stored resources"),
							'RolloverHintGamepad', T(238973917718, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle stored resources<newline><DPad> Navigate <DPadDown> Close"),
							'MinWidth', 25,
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleResources("WasteRock")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idWasteRock",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(12410, --[[XTemplate Infobar Text]] "<WasteRockText>"),
							}),
							}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContextControl",
					'Id', "idColonists",
					'MinWidth', 150,
					'RolloverOnFocus', true,
					'FXMouseIn', "UIButtonMouseIn",
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "OnSetFocus",
						'func', function (self, ...)
							XCreateRolloverWindow(self, true)
							XContextWindow.OnSetFocus(self, ...)
						end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "centers the texts",
						'HAlign', "center",
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(11703, --[[XTemplate Infobar RolloverText]] "<DronesRollover>"),
							'RolloverTitle', T(963695586350, --[[XTemplate Infobar RolloverTitle]] "Drones<right><drone(DronesCount)>"),
							'RolloverHint', T(11704, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle drone controllers"),
							'RolloverHintGamepad', T(11715, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle drone controllers<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleDroneControl()
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idTotalDrones",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(10453, --[[XTemplate Infobar Text]] "<TotalDrones>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(931628884394, --[[XTemplate Infobar RolloverText]] "<ColonistsRollover>"),
							'RolloverTitle', T(11712, --[[XTemplate Infobar RolloverTitle]] "Colonists<right><colonist(ColonistCount)>"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idTotalColonists",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(11186, --[[XTemplate Infobar Text]] "<TotalColonists>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(11705, --[[XTemplate Infobar RolloverText]] "<FreeHomesRollover>"),
							'RolloverTitle', T(317859767903, --[[XTemplate Infobar RolloverTitle]] "Homes"),
							'RolloverHint', T(11706, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle homeless citizens"),
							'RolloverHintGamepad', T(11716, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle homeless citizens<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleLabel("Homeless")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idHomes",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(11187, --[[XTemplate Infobar Text]] "<FreeHomes>"),
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "bottom",
							'RolloverText', T(11707, --[[XTemplate Infobar RolloverText]] "<JobsRollover>"),
							'RolloverTitle', T(282453782313, --[[XTemplate Infobar RolloverTitle]] "Jobs"),
							'RolloverHint', T(11708, --[[XTemplate Infobar RolloverHint]] "<left_click> Cycle unemployed citizens"),
							'RolloverHintGamepad', T(11717, --[[XTemplate Infobar RolloverHintGamepad]] "<ButtonA> Cycle unemployed citizens<newline><DPad> Navigate <DPadDown> Close"),
							'HAlign', "center",
							'BorderColor', RGBA(0, 0, 0, 0),
							'Background', RGBA(0, 0, 0, 0),
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'FXMouseIn', "UIButtonMouseIn",
							'FXPress', "BuildMenuButtonClick",
							'FocusedBorderColor', RGBA(0, 0, 0, 0),
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'DisabledBorderColor', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
								self.context:CycleLabel("Unemployed")
							end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Dock', "box",
								'Visible', false,
								'Image', "UI/Common/row_shine_2.tga",
								'ImageFit', "stretch",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Id', "idJobs",
								'Padding', box(3, 4, 3, 4),
								'TextStyle', "Infobar",
								'Translate', true,
								'Text', T(11713, --[[XTemplate Infobar Text]] "<FreeWork>"),
							}),
							}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idGamepadHint",
			'Margins', box(0, 0, 0, -50),
			'Padding', box(-960, 23, 0, 0),
			'Dock', "ignore",
			'HAlign', "center",
			'VAlign', "top",
			'Visible', false,
			'FoldWhenHidden', true,
			'ImageScale', point(700, 700),
		}),
		PlaceObj('XTemplateWindow', {
			'__dlc', "armstrong",
			'__condition', function (parent, context) return not g_NoTerraforming and not g_Tutorial end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "TerraformingParamsBarDlg",
				'Id', "idTerraformingBar",
				'RelativeFocusOrder', "next-in-line",
				'InInfobar', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "GetRelativeFocus(self, order, relation)",
					'func', function (self, order, relation)
						local res = TerraformingParamsBar.GetRelativeFocus(self, order, relation)
						if not res then
							if relation == "right" then
								res = GetDialog(self.parent):GetRelativeFocus(point(0,0), relation)
							elseif relation == "left" then
								res = GetDialog(self.parent):GetRelativeFocus(self:GetFocusOrder(), relation)
							end
						end
						return res
					end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "SetFocus",
					'func', function (self, ...)
						local focus = self:GetRelativeFocus(point(0,0), "nearest")
						if focus then
							CreateRealTimeThread(function(focus, ...)
								focus:SetFocus(...)
							end, focus, ...)
							return
						end
						TerraformingParamsBar.SetFocus(self, ...)
					end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "OnShortcut(self, shortcut, source)",
					'func', function (self, shortcut, source)
						if shortcut == "DPadDown" or shortcut == "ButtonB" then
							GetDialog(self.parent):SetFocus(false, true)
							return "break"
						end
						return TerraformingParamsBar.OnShortcut(self, shortcut, source)
					end,
				}),
				}),
			}),
		}),
})

