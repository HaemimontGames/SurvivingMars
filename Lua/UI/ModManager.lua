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
			local author = v.author ~= "" and Untranslated(v.author) or T(4328, "Unknown")
			items[#items+1] = {
				id = k,
				title = Untranslated(v.title),
				corrupted = corrupted,
				warning = corrupted and (TLookupTag("<red>") .. warning .. TLookupTag("</red>")) or "",
				author = T(1000022, "Author"),
				author_val = author,
				description = Untranslated(v.description),
				last_update = v.saved and T(1122, "Last Update") or "",
				last_update_val = v.saved and Untranslated(os.date("%d.%m.%Y", v.saved)) or "",
				mod_tags = mod_tags and #mod_tags > 0 and T(1000018, "Tags") or "",
				mod_tags_val = mod_tags and #mod_tags > 0 and Untranslated(table.concat(mod_tags, ", ")),
				image = v.image,
			}
		end
	end
	TSort(items, "title")
	return items
end

function GetModCorruptedStatus(mod)
	if mod.lua_revision < ModMinLuaRevision then
		return true, T(8689, "This mod is disabled due to version incompatibility.")
	elseif mod.lua_revision > LuaRevision then
		return true, T(4074, "This mod requires a newer game version!")
	end
	return false
end

function GetCheckboxImage(state)
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
	if table.remove_entry(AccountStorage.LoadMods, id) then
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
	local mod_image = item.image ~= "" and item.image or "UI/Common/Placeholder.tga"
	dialog.idImage:SetImage(mod_image)
	dialog.idAuthor:SetText(item.author)
	dialog.idAuthorVal:SetText(item.author_val)
	dialog.idLastUpdate:SetText(item.last_update)
	dialog.idLastUpdateVal:SetText(item.last_update_val)
	dialog.idWarning:SetText(item.warning)
	dialog.idDescription:SetText(item.description)
	dialog.idTags:SetText(item.mod_tags)
	dialog.idTagsVal:SetText(item.mod_tags_val)
	dialog.idModInfo:SetVisible(true)
end

function UpdateModsList(dialog)
	for k,v in ipairs(dialog.idList) do
		v:UpdateImage()
	end
end

if FirstLoad then
	g_InitialMods = false
end

function ModManagerStart(dialog)
	AccountStorage.LoadMods = AccountStorage.LoadMods or {}
	local initial_mods = AccountStorage.LoadMods
	--remove from account storage mods that have been removed from the machine
	for i = #initial_mods, 1, -1 do
		if not Mods[initial_mods[i]] then
			table.remove(initial_mods, i)
		end
	end
	g_InitialMods = table.copy(initial_mods)
end

local function ModManagerClose(dialog)
	dialog:SetMode("")
	SaveAccountStorage(5000)
	g_InitialMods = false
end

function ModManagerEnd(dialog)
	local new_mods = AccountStorage.LoadMods or empty_table
	if not table.is_iequal(new_mods, g_InitialMods or empty_table) then
		dialog:DeleteThread("warning")
		dialog:CreateThread("warning", function()
			local exit_choice = true
			if #new_mods > 0 then
				local choice = WaitMarsQuestion(dialog, 
							T(6899, "Warning"), 
							T(4164, "Mods are player created software packages that modify your game experience. USE THEM AT YOUR OWN RISK! We do not examine, monitor, support or guarantee this user created content. You should take all precautions you normally take regarding downloading files from the Internet before using mods."), 
							T(6900, "OK"), 
							T(4165, "Back")
				)
				exit_choice = (choice == "ok")
			end
			if exit_choice then
				LoadingScreenOpen("idLoadingScreen", "reload mods")
				SaveAccountStorage(5000)
				ModsReloadItems()
				ModManagerClose(dialog)
				LoadingScreenClose("idLoadingScreen", "reload mods")
			end
		end)
	else
		ModManagerClose(dialog)
	end
end

---- SignUp ----
local months = {T(10427, "January"),T(10428, "February"),T(10429, "March"),T(10430, "April"),T(10431, "May"),T(10432, "June"),T(10433, "July"),T(1962, "August"),T(10434, "September"),T(10435, "October"),T(10436, "November"),T(10437, "December")}
function PDXAccountFillBirthDataCombos(self)
	--day:1-31, month:January_December (translated), Year:1900-Current
	local items = {}
	items[1] = {name = _InternalTranslate(T(7715, "Day")), id = ""}
	for i=1, 31 do
		items[#items + 1] = {name = tostring(i), id = i}
	end
	self:ResolveId("idDay").idCombo:SetItems(items)
	items = {}
	items[1] = {name = _InternalTranslate(T(7714, "Month")), id = ""}
	for i=1, #months do
		items[#items+1] = {name = _InternalTranslate(months[i]), id = i}
	end
	self:ResolveId("idMonth").idCombo:SetItems(items)
	items = {}
	local start = tonumber(os.date("%Y"))
	items[1] = {name = _InternalTranslate(T(10438, "Year")), id = ""}
	for i = start, 1900, -1 do
		items[#items + 1] = {name = tostring(i), id = i}
	end
	self:ResolveId("idYear").idCombo:SetItems(items)
end