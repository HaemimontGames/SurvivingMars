-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "Mods",
	id = "ModsUIRate",
	PlaceObj('XTemplateTemplate', {
		'__template', "ModsUIPopupBase",
	}, {
		PlaceObj('XTemplateWindow', {
			'Margins', box(100, 0, 100, 60),
			'LayoutMethod', "VList",
			'LayoutVSpacing', 40,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					local title = self.parent:ResolveId("idTitle")
					title:SetHAlign("center")
					title:SetMargins(title:GetMargins() + box(0,20,0,0))
					XWindow.Open(self, ...)
				end,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idText",
				'Margins', box(0, 10, 0, 0),
				'HAlign', "center",
				'MaxWidth', 600,
				'HandleMouse', false,
				'TextStyle', "ModsUIMsgText",
				'Translate', true,
				'TextHAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XList",
				'Id', "idList",
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'LayoutMethod', "HList",
				'LayoutHSpacing', 20,
				'Background', RGBA(0, 0, 0, 0),
				'FocusedBackground', RGBA(0, 0, 0, 0),
			}, {
				PlaceObj('XTemplateForEach', {
					'array', function (parent, context) return nil, 1, 5 end,
					'run_after', function (child, context, item, i, n)
						child.OnSetRollover = function(self, rollover)
							XTextButton.OnSetRollover(self, rollover)
							if rollover then
								local parent = self.parent
								local dlg = GetDialog(self)
								local context = dlg.mode_param
								local current_rating = context.rating
								local n = #parent
								for j = 1, i do
									parent[j]:SetIcon("UI/Mods/rate-orange_large.tga")
								end
								for k = i + 1, n do
									parent[k]:SetIcon("UI/Mods/rate-unrated_large.tga")
								end
								if current_rating then
									for l = i + 1, current_rating do
										parent[l]:SetIcon("UI/Mods/rate-gray_large.tga")
									end
								end		
							end
						end
						child.OnPress = function(self)
							ModsUIRateMod(self, i)
							local dlg = GetDialog(self)
							dlg:UpdateActionViews(dlg)
						end
					end,
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XTextButton",
						'Padding', box(20, 7, 20, 7),
						'LayoutHSpacing', 10,
						'Background', RGBA(235, 235, 235, 0),
						'RolloverDrawOnTop', true,
						'MouseCursor', "UI/Cursors/Rollover.tga",
						'FocusedBackground', RGBA(0, 0, 0, 0),
						'RolloverBackground', RGBA(0, 0, 0, 0),
						'PressedBackground', RGBA(0, 0, 0, 0),
						'Icon', "UI/Mods/rate-gray_large.tga",
						'IconScale', point(700, 700),
						'TextStyle', "ModsUIMsgText",
						'Translate', true,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "SetSelected(self, selected)",
							'func', function (self, selected)
								self:SetFocus(selected)
							end,
						}),
						}),
					}),
				}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T(4165, --[[XTemplate ModsUIRate ActionName]] "Back"),
			'ActionToolbar', "ActionBarRight",
			'ActionShortcut', "Escape",
			'OnAction', function (self, host, source)
				ModsUIClosePopup(host)
			end,
			'__condition', function (parent, context) return not GetUIStyleGamepad() end,
		}),
		}),
})

