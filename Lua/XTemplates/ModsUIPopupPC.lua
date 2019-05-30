-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIPopupPC",
	PlaceObj('XTemplateWindow', {
		'__class', "XPopup",
		'Id', "idPopUp",
		'BorderWidth', 0,
		'BorderColor', RGBA(128, 128, 128, 0),
		'Background', RGBA(0, 0, 0, 0),
		'FocusedBackground', RGBA(240, 240, 240, 0),
		'AnchorType', "drop-right",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				local content = self:ResolveId("idContent")
				content:SetChildrenHandleMouse(false)
				content:SetHandleMouse(true)
				content.OnMouseButtonDown = function(this, pos, button)
					if button == "L" then
						ModsUIToggleSortPC(this:ResolveId("idContentWrapper"))
						return "break"
					end
				end
				XPopup.Open(self, ...)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnDelete",
			'func', function (self, ...)
				local content = self:ResolveId("idContent")
				content:SetChildrenHandleMouse(true)
				content:SetHandleMouse(false)
				content.OnMouseButtonDown = nil
				XPopup.OnDelete(self, ...)
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContextWindow",
			'Dock', "box",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'IdNode', false,
				'HAlign', "center",
				'VAlign', "center",
				'HandleMouse', true,
				'Image', "UI/Mods/Circle32White.tga",
				'ImageScale', point(500, 500),
				'FrameBox', box(15, 15, 15, 15),
				'SqueezeX', false,
				'SqueezeY', false,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ModsUIChecksList",
					'Margins', box(0, 0, 0, 0),
				}, {
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return GetPopsModsUISortItems(GetDialogMode(parent)) end,
						'run_after', function (child, context, item, i, n)
							local dlg = GetDialog(child)
							local mode = dlg.Mode
							child:SetText(item.name)
							if mode == "browse" then
								child:SetCheck(context.set_sort==item.id)
							else
								child:SetCheck(context.set_installed_sort==item.id)
							end
							child.OnChange = function(this, check)
								local obj = dlg.context
								if mode == "browse" then
									obj:SetSortMethod(item.id)
								else
									obj:SetInstalledSortMethod(item.id)
								end
								if not GetUIStyleGamepad() then
									local btn = dlg:ResolveId("idSortButton")
									if btn then
										btn:SetText(btn:GetText())
									end
									ModsUIToggleSortPC(dlg.idContentWrapper)
								else
									ModsUIClosePopup(dlg)
								end
							end
						end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "ModsUIChecksListItem",
							'Icon', "UI/Mods/radio_button.tga",
							'IconScale', point(900, 900),
						}),
						}),
					}),
				}),
			}),
		}),
})

