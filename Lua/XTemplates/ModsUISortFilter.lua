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
					'run_after', function (child, context, item, i, n)
local mode = GetDialog(child).Mode
local temp_table = (mode == "installed") and "temp_installed_tags" or "temp_tags"
local tags_table = (mode == "installed") and "set_installed_tags" or "set_tags"
local name = item.display_name
child:SetText(Untranslated(name))
child:SetCheck(context[tags_table][name])
child.OnChange = function(this, check)
	local obj = GetDialog(this).context
	obj[temp_table][name] = check or nil
end
end,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "ModsUIChecksListItem",
						'Padding', box(20, 13, 20, 13),
						'MinWidth', 600,
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

