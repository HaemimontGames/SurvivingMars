function GetModsListForTag(param)
	local items = {}
	for k, v in sorted_pairs(Mods) do
		local mod_tags = v:GetTags()
		local list_mod = true
		if param then
			list_mod = false
			if mod_tags and #mod_tags > 0 then
				for _, tag in ipairs(mod_tags) do
					if tag == param then
						list_mod = true
						break
					end
				end
			end
		end
		if list_mod then
			local corrupted, warning = GetModCorruptedStatus(v)
			local author = v.author ~= "" and v.author or "Unknown"
			items[#items+1] = {
				id = k,
				title = Untranslated(v.title),
				corrupted = corrupted,
				warning = corrupted and warning or "",
				author = T{1121, "Author: <color_pref><value><color_suff>", color_pref = TLookupTag("<sharp_yellow>"), value = Untranslated(author), color_suff = TLookupTag("</sharp_yellow>")},
				description = Untranslated(v.description),
				last_update = T{1122, "Last Update: <color_pref><value><color_suff>", color_pref = TLookupTag("<sharp_yellow>"), value = v.saved and Untranslated(os.date("%d.%m.%Y", v.saved)) or "", color_suff = TLookupTag("</sharp_yellow>")},
				mod_tags = mod_tags and #mod_tags > 0 and T{1123, "Tags: <color_pref><value><color_suff>", color_pref = TLookupTag("<sharp_yellow>"), value = Untranslated(table.concat(mod_tags, ", ")), color_suff = TLookupTag("</sharp_yellow>")} or "",
				image = v.image,
			}
		end
	end
	TSort(items, "title")
	return items
end

function GetModCorruptedStatus(mod)
	if mod.lua_revision < ModMinLuaRevision then
		return true, T{8689, "This mod is disabled due to version incompatibility."}
	elseif mod.lua_revision > LuaRevision then
		return true, T{4074, "This mod requires a newer game version!"}
	end
	return false
end

function GetModItemImage(state)
	return state and "UI/Icons/Research/researched.tga" or "UI/Common/mod_button.tga"
end

function GetModTags()
	local items = {}
	local available = {}
	
	--predefined tags
	for i,tag in ipairs(PredefinedModTags) do
		available[tag.display_name] = 0
	end
	
	--count tags in mods
	for k, v in sorted_pairs(Mods) do
		local mod_tags = v:GetTags()
		if mod_tags then
			for _,tag in ipairs(mod_tags) do
				if available[tag] then
					available[tag] = available[tag] + 1
				end
			end
		end
	end
	
	--generate items
	for i,tag in ipairs(PredefinedModTags) do --iterate over this list for consistent ordering
		local display_name = tag.display_name
		local count = available[display_name]
		items[#items + 1] = {
			text = T{1124, "<tag> (<count>)", tag = Untranslated(display_name), count = count},
			display_name = Untranslated(display_name),
			id = display_name,
		}
	end
	
	return items
end

function ToggleLoadMod(id)
	local idx = table.find(AccountStorage.LoadMods, id)
	if idx then
		table.remove(AccountStorage.LoadMods, idx)
		return false
	else
		TurnModOn(id)
		return true
	end
end

function TurnModOn(id)
	table.insert_unique(AccountStorage.LoadMods, id)
end

function AllModsOn(dialog)
	AllModsOff() --clear the table first
	for k, v in sorted_pairs(Mods) do
		if not GetModCorruptedStatus(v) then
			TurnModOn(k)
		end
	end
	if dialog then
		UpdateModsList(dialog)
	end
end

function AllModsOff(dialog)
	table.clear(AccountStorage.LoadMods)
	if dialog then
		UpdateModsList(dialog)
	end
end

function ShowModDescription(item, dialog)
	dialog.idModInfo:SetVisible(false)
	dialog.idModTitle:SetText(item.title)
	local mod_image = item.image ~= "" and item.image or "UI/Mods/Placeholder.tga"
	dialog.idImage:SetImage(mod_image)
	dialog.idAuthor:SetText(item.author)
	dialog.idLastUpdate:SetText(item.last_update)
	dialog.idWarning:SetText(item.warning)
	dialog.idDescription:SetText(item.description)
	dialog.idTags:SetText(item.mod_tags)
	dialog.idModInfo:SetVisible(true)
end

function UpdateModsList(dialog)
	for k,v in ipairs(dialog.idList) do
		v:UpdateImage()
	end
end

local mods_loaded
local initial_mods
function ModManagerStart(dialog)
	AccountStorage.LoadMods = AccountStorage.LoadMods or {}
	local load_mods = AccountStorage.LoadMods
	--remove from account storage mods that have been removed from the machine
	for i = #load_mods, 1, -1 do
		if not Mods[load_mods[i]] then
			table.remove(load_mods, i)
		end
	end
	initial_mods = table.copy(load_mods)
	mods_loaded = not not ModsLoaded
end

local function ModManagerClose(dialog)
	dialog:SetMode("")
	SaveAccountStorage()
	mods_loaded = nil
	initial_mods = nil
end

function ModManagerEnd(dialog)
	local load_mods = AccountStorage.LoadMods
	local mods_changed = (#(load_mods or "") > 0 or #(initial_mods or "") > 0) and (not table.is_isubset(load_mods, initial_mods) or not table.is_isubset(initial_mods, load_mods))
	local mod_count = #load_mods
	if (mods_loaded and mods_changed) or mod_count > 0 then
		dialog:DeleteThread("warning")
		dialog:CreateThread("warning", function()
			local res = true
			if mod_count > 0 then
				res = WaitMarsQuestion(dialog, 
							T{6899, "Warning"}, 
							T{4164, "Mods are player created software packages that modify your game experience. USE THEM AT YOUR OWN RISK! We do not examine, monitor, support or guarantee this user created content. You should take all precautions you normally take regarding downloading files from the Internet before using mods."}, 
							T{6900, "OK"}, 
							T{4165, "Back"}
						) == "ok"
			end
			if res then
				if mods_loaded and mods_changed then
					if WaitMarsQuestion(dialog, T{6899, "Warning"}, T{8496, "Activating or deactivating mods requires a restart."}, T{8080, "Restart"}, T{3687, "Cancel"}) == "ok" then
						WaitSaveAccountStorage()
						quit("restart")
					else
						AccountStorage.LoadMods = table.copy(initial_mods)
						UpdateModsList(dialog)
					end
				else
					ModManagerClose(dialog)
				end
			end
		end)
	else
		ModManagerClose(dialog)
	end
end