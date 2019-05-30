-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUISortFilter",
	PlaceObj('XTemplateTemplate', {
		'__template', "ModsUIPopupBase",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "ModsUIChecksList",
		}, {
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return context.popup_shown == "filter" end,
			}, {
				PlaceObj('XTemplateForEach', {
					'array', function (parent, context) return PredefinedModTags end,
					'__context', function (parent, context, item, i, n) return item end,
					'run_after', function (child, context, item, i, n)
						local mode = GetDialog(child).Mode
						local temp_table = (mode == "installed") and "temp_installed_tags" or "temp_tags"
						local tags_table = (mode == "installed") and "set_installed_tags" or "set_tags"
						local name = context.display_name
						child:SetText(Untranslated(name))
						child:SetCheck(g_ParadoxModsContextObj[tags_table][name])
						child.OnChange = function(this, check)
							g_ParadoxModsContextObj[temp_table][name] = check or nil
						end
					end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "ModsUIChecksListItem",
						'Padding', box(20, 13, 20, 13),
						'MinWidth', 600,
						'ContextUpdateOnOpen', false,
						'OnContextUpdate', function (self, context, ...)
							local temp_table = (GetDialog(self):GetMode() == "installed") and "temp_installed_tags" or "temp_tags"
							self:SetCheck(g_ParadoxModsContextObj[temp_table][context.display_name])
						end,
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__context', function (parent, context) return ModsUIGameCompatibleTagContext end,
					'__template', "ModsUIChecksListItem",
					'Padding', box(20, 13, 20, 13),
					'MinWidth', 600,
					'OnContextUpdate', function (self, context, ...)
						local value = (GetDialog(self):GetMode() == "installed") and "temp_only_compatible_installed" or "temp_only_compatible"
						self:SetCheck(g_ParadoxModsContextObj[value])
					end,
					'Text', T(12427, --[[XTemplate ModsUISortFilter Text]] "Game version compatible"),
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "Open",
						'func', function (self, ...)
							XCheckButton.Open(self, ...)
							local dlg = GetDialog(self)
							local mode = dlg:GetMode()
							local obj = ResolvePropObj(dlg.context)
							local value = (mode == "installed") and "temp_only_compatible_installed" or "temp_only_compatible"
							self.OnChange = function(self, check)
								obj[value] = check or nil
							end
						end,
					}),
					}),
				}),
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return context.popup_shown == "sort" end,
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
						'Padding', box(20, 17, 20, 17),
						'MinWidth', 600,
						'Icon', "UI/Mods/radio_button.tga",
						'IconScale', point(900, 900),
					}),
					}),
				}),
			}),
		}),
})

