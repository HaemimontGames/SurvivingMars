DefineClass.InfopanelItems = {
 __parents = {"ItemMenuBase"},
 ScaleModifier = point(750,750),
 Margins = box(0,135,-30,0),
 
 hide_single_category = true,
 rollover_anchor = "center-bottom",
 lines_stretch_time_init = 350,
 ZOrder  = 0,
 FocusOnOpen = "child",
}

function InfopanelItems:Init()
	self:SetModal()
	PlayFX("InfopanelItemSelectorIn", "start")
	UICity:Gossip("InfopanelItemSelector", "open")
end

function InfopanelItems:Close()
	ItemMenuBase.Close(self)
	UICity:Gossip("InfopanelItemSelector", "close")
	PlayFX("InfopanelItemSelectorOut", "start")
end

function InfopanelItems:GetItems()
	local buttons = {}
	local items = GetInfopanelSelectorItems(self.context, self.idButtonsList)
	if #items<=0 then self:delete() end	
	
	return items
end

function InfopanelItems:UpdateLayout()
	local margins_x1, margins_y1, margins_x2, margins_y2 = ScaleXY(self.scale, self.Margins:xyxy())
	local anchor = self.context.align_ctrl.box
	local safe_area_box = GetSafeAreaBox()
	local x, y = self.box:minxyz()
	local width, height = self.measure_width - margins_x1 - margins_x2, self.measure_height - margins_y1 - margins_y2

	x = anchor:minx() - width - margins_x2
	y = anchor:miny() - margins_y1
	-- layout
	self:SetBox(x, y, width, height)
	return XControl.UpdateLayout(self)
end

function InfopanelItems:OpenItemsInterpolation(bFirst, set_focus)
	ItemMenuBase.OpenItemsInterpolation(self, bFirst, set_focus)
	self:CreateThread(function()		
		local items = self.items
		local item_pop_time = self.lines_stretch_time_init/#items
		local duration = item_pop_time 
		local sleep = item_pop_time 
		for i = #items, 1, -1 do
			local ctrl = items[i]
			ctrl:SetVisible(false, "instant")
		end
		for i = #items, 1, -1 do
			local ctrl = items[i]
			ctrl:SetVisible(true, "instant")
			local bx = ctrl.box
			ctrl:AddInterpolation{
				id = "pop_size",
				type = const.intRect,
				startRect = ctrl.box,
				endRect = sizebox((ctrl.box:min()+ctrl.box:size()/2),point(0,0)),
				duration = duration,
				flags = const.intfInverse,
				autoremove = true,
			}
			ctrl:AddInterpolation{
				id = "pop",
				type = const.intAlpha,
				startValue = 255 - self.transparency,
				endValue = 0,
				duration = duration,
				flags = const.intfInverse,
				autoremove = true,
			}
			Sleep(sleep)
		end
		self:SetInitFocus(set_focus)
	end)
end

function InfopanelItems:OnMouseButtonDown(pt, button)
	if button=="L" then
		self:Close()
		return "break"
	end
	return ItemMenuBase.OnMouseButtonDown(self, pt, button)
end

function InfopanelItems:OnXButtonDown(button, source)
	if button == "ButtonA" or  button == "ButtonX" then
		local focus = self.desktop and self.desktop.keyboard_focus
		if focus then
			if focus:GetEnabled() then
				focus.idButton:Press( button == "ButtonX", "gamepad")
			end
		end
		return "break"
	end
	
	return ItemMenuBase.OnXButtonDown(self, button, source)
end

function OpenInfopanelItems(object, align_ctrl, idx)
	idx = idx or 1
	local dlg = GetXDialog("InfopanelItems")
	if dlg then
		if (dlg.context.idx~=idx or dlg.context.object~=object)then
			CloseXDialog("InfopanelItems")
		else
			return
		end
	end
	OpenXDialog("InfopanelItems", GetInGameInterface(), {object = object, idx = idx or 1, align_ctrl = align_ctrl})
end

function CloseInfopanelItems()
	CloseXDialog("InfopanelItems")
end

function OnMsg.UIModeChange(mode)
	CloseInfopanelItems()
end 

function OnMsg.SelectionChange()
	CloseInfopanelItems()
end
-------------------------get data---------------
function FillTraitSelectorItems(object, items, traits, align, list)
	local start = #items
	for i = 1, #traits do
		local trait = DataInstances.Trait[traits[i].value]
		if IsTraitAvailable(trait, object.city) then
			local icon = "UI/Icons/Buildings/numbers_0"..start+i..".tga"
			local enabled = trait.name~= object.trait1 and trait.name~= object.trait2 and trait.name~= object.trait3	
			table.insert(items, HexButtonInfopanel:new({
				ButtonAlign = align,
				name = trait.name, 
				icon = icon,
				display_name = trait.display_name,
				description  = trait.description,
				hint = enabled and  T{988789013053, --[[XTemplate sectionTraits RolloverHint]] "<left_click> Change<newline><em>Ctrl + <left_click> on trait</em> Select in all <display_name_pl>", object} or false,
				gamepad_hint = enabled and T{958322390788, --[[XTemplate sectionTraits RolloverHintGamepad]] "<ButtonA> Change<newline><em><ButtonX> on trait</em> Select in all <display_name_pl>", object} or false,
				enabled = enabled,						
				action = function(dataset, delta, controller)
					if not IsValid(dataset.object) then return end
					local broadcast = (controller and delta < 0) or (not controller and IsMassUIModifierPressed())
					dataset.object:SetTrait(dataset.idx, trait.name, broadcast)					
				end
			},list))
			align = align == "top" and "bottom" or "top"
		end
	end	
	return align
end

local base_resources = {Concrete = true, Food = true, Metals = true, PreciousMetals = true}
local advance_resources = {Polymers = true,MachineParts = true, Electronics = true,Fuel = true, BlackCube = true, MysteryResource = true}
function GetInfopanelSelectorItems(dataset, list)
	local object = dataset.object
	local items = {}	
	local align  = "top"
	
	if object:IsKindOf("Farm") then
		local crops = object.crops_available or empty_table
		for i = 1, #crops do
			local crop = DataInstances.Crop[crops[i]]
			if crop and IsCropAvailable(crop) then
				local max = crop and crop.FoodOutput or 0
				local growth_time = object:GetGrowthDuration(dataset.idx,crop.name)			
				local texts = {
						T{3978, "<em><description></em><newline>", description = crop.Desc},
						T{248, "Water consumption<right><water(number)>", number = object:GetCropWaterDemand(-1, object.crops_available[i])},
						T{3979, "Growth time<right><growth_time> Sols", growth_time = growth_time},
						T{249, "Optimal harvest<right><resource(number, res)>", res = crop.ResourceType, number = max},
				}
				if crop.OxygenProduction > 0 then
					table.insert(texts, T{250, "Oxygen production<right><air(number)>", number = crop.OxygenProduction})
				end
				if crop.SoilEffect > 0 then
					texts[#texts+1] = T{251, "Soil quality increase<right><green><number>%</green>", number = crop.SoilEffect}
				elseif crop.SoilEffect < 0 then
					texts[#texts+1] = T{252, "Soil quality decrease<right><red><number>%</red>", number = crop.SoilEffect * -1}
				end
				local description = table.concat(texts, "<newline><left>")
				table.insert(items, HexButtonInfopanel:new({
					ButtonAlign =  align,
					name = crop.name, 
					icon = crop.icon,
					display_name = crop.DisplayName,
					description  = description,
					hint =  T{369967558050, "<left_click> Select new crop<newline><em>Ctrl + <left_click> on crop</em> Select in all <display_name_pl>", object},
					gamepad_hint = T{764818637741, "<ButtonA> Select new crop<newline><em><ButtonX> on crop</em> Select in all <display_name_pl>", object},
					action = function(dataset, delta, controller)
						local farm = dataset.object
						if not IsValid(farm) then return end
						local broadcast = (controller and delta < 0) or (not controller and IsMassUIModifierPressed())
						farm:SetCrop(dataset.idx, crop.name, broadcast)
					end
				}, list))
				align = align == "top" and "bottom" or "top"
			end
		end
		table.insert(items, HexButtonInfopanel:new({
			ButtonAlign =  align,
			name = "", 
			display_name = T{6864, "None"},
			description  = T{6865, "None"},
			icon =  "UI/Icons/Buildings/crops_empty.tga",
			action = function(dataset, delta, controller)
				local farm = dataset.object
				if not IsValid(farm) then return end
				local broadcast = (controller and delta < 0) or (not controller and IsMassUIModifierPressed())
				farm:SetCrop(dataset.idx, false, broadcast)
			end
		}, list))
	elseif object:IsKindOf("School") then
		align = FillTraitSelectorItems(object, items, SchoolTraitsCombo(object), align, list)
		if object.city:IsTechResearched("InterplanetaryLearning") then
			align = FillTraitSelectorItems(object, items, BuildingTraitsCombo(object, const.SchoolExtraTraits),align, list)
		end
		if object.city:IsTechResearched("DreamSimulation") then
			align = FillTraitSelectorItems(object,items,{{value = "Dreamer", text = DataInstances.Trait["Dreamer"].display_name}},align, list)
		end
	elseif object:IsKindOf("Sanatorium") then
		if object.city:IsTechResearched("DreamSimulation") then
			align = FillTraitSelectorItems(object,items,{{value = "Dreamer", text = DataInstances.Trait["Dreamer"].display_name}},align, list)
		end
		align = FillTraitSelectorItems(object, items, SanatoriumTraitsCombo(object), align, list)
	elseif object:IsKindOf("MartianUniversity") then
		table.insert(items, HexButtonInfopanel:new({
			ButtonAlign = align,
			name = "auto", 
			icon = "UI/Icons/Colonists/Malenone.tga",
			display_name = T{669, "Auto"},
			description  = T{670, "Automatically graduates to the Specialization that is most needed in your colony"},
			hint =  T{7604, "<left_click> Select"},
			gamepad_hint = T{3545, "<ButtonA> Select"},
			action = function(dataset)
				local university = dataset.object
				if not IsValid(university) then return end
				university.specialization = "auto"
				university:UpdateUI()
			end
		}, list))
		align = "bottom"
		for k, val in ipairs(ColonistSpecializationList) do
			local specialization = const.ColonistSpecialization[val]
			table.insert(items, HexButtonInfopanel:new({
				ButtonAlign = align,
				name = val, 
				icon = specialization.display_icon,
				display_name = specialization.display_name,
				description  = specialization.description,
				hint =  T{703125928773, --[[XTemplate customMartianUniversity RolloverHint]] "<left_click> Select Specialization"},
				gamepad_hint =  T{896744390747, --[[XTemplate customMartianUniversity RolloverHintGamepad]] "<ButtonA> Select Specialization"},
				action = function(dataset)
					local university = dataset.object
					if not IsValid(university) then return end
					university.specialization = val
					university:UpdateUI()
				end
			}, list))
			align = align == "top" and "bottom" or "top"
		end	
	elseif object:IsKindOf("UniversalStorageDepot") then
		local storable_resources = object.storable_resources
		local res_type = object.resources_type
		for _, res_id in ipairs(storable_resources) do
			if res_type=="base" and base_resources[res_id] or res_type=="advance" and advance_resources[res_id] then
				local enabled = object:IsResourceEnabled(res_id)
				local res = Resources[res_id]
				table.insert(items, HexButtonInfopanel:new({
					name = res.name, 
					ButtonAlign = align,
					icon = res.display_icon,
					display_name = res.display_name,
					description  = res.description,
					hint = enabled and T{7949, "<left_click> Disable storage"} or T{7950, "<left_click> Enable storage"},
					gamepad_hint = enabled and T{7951, "<ButtonA> Disable storage"} or T{7952, "<ButtonA> Enable storage"},
					action = function(dataset)
						local depot = dataset.object
						if not IsValid(depot) then return end
						depot:ToggleAcceptResource(res_id)
						ObjModified(depot)
					end
				}, list))
				align = align == "top" and "bottom" or "top"
			end
		end	
	end
	return items
end