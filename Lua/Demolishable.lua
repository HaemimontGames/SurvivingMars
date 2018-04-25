--[[@@@
@class Demolishable
class overview...
--]]

DefineClass.Demolishable = {
	__parents = { "Object" },

	properties = {
		{ template = true, category = "Demolish", name = T{934, "Can demolish?"}, id = "can_demolish", editor = "bool", default = true, help = "Specify if the building can be destroyed by demolishing." },
		{ template = true, category = "Demolish", name = T{175, "Use demolished state?"}, id = "use_demolished_state", editor = "bool", default = false, object_update = true, help = "If true, the destroyed target will transofrm into ruins, instead of disappearing after destruction." },
	},

	demolishing = false,
	demolishing_countdown = false,
	demolishing_thread = false,
	time_required_for_demolish = const.DemolishCountdownMax,
}

function Demolishable:Done()
	if SelectedObj == self then
		SelectObj(false)
	end
end

function Demolishable:ShouldShowDemolishButton()
	return self:CanDemolish()
end

function Demolishable:CanDemolish()
	return self.can_demolish
end

function Demolishable:ToggleDemolish()
	local old_val = self.demolishing
	self.demolishing = (not self.demolishing) and self:CanDemolish()
	if self.demolishing == old_val then
		return
	end
	if self.demolishing then
		self:OnSetDemolishing(true)
		self.demolishing_countdown = self.time_required_for_demolish
		self.demolishing_thread = CreateGameTimeThread(self.DoDemolish, self)
	else
		if IsValidThread(self.demolishing_thread) then
			DeleteThread(self.demolishing_thread)
			self.demolishing_thread = false
			PlayFX("Demolish", "canceled", self)
			self:DestroyAttaches("RotatyThing")
		end
		self:OnSetDemolishing(false)
	end
	if SelectedObj == self then
		ObjModified(self)
	end
end

function Demolishable:GetUIRefundRes()
	local refund = self:GetRefundResources()
	if not refund or #refund == 0 then return "" end
	local refund_texts = {}
	for i = 1, #refund do
		refund_texts[i] = T{4039, "<resource(amount, res)>", amount = refund[i].amount, res = refund[i].resource}
	end
	return table.concat(refund_texts, " ")
end

function Demolishable:ToggleDemolish_Update(button)
	button:SetIcon(self.demolishing and "UI/Icons/IPButtons/cancel.tga" or "UI/Icons/IPButtons/salvage_1.tga")
	button:SetEnabled(self:CanDemolish())
	if self:IsKindOf("ConstructionSite") then
		button:SetRolloverHint(T{7573, "<left_click> Cancel construction"})
		button:SetRolloverHintGamepad(T{7574, "<ButtonY> Cancel construction"})
		return
	end
	button:SetRolloverHint(not self.demolishing and T{7575, "<left_click> Salvage"} or T{7576, "<left_click> Cancel Salvage"})
	button:SetRolloverHintGamepad(not self.demolishing and T{7577, "<ButtonY> Salvage"} or T{7578, "<ButtonY> Cancel Salvage"})
end

function Demolishable:DoDemolish()
	if self.demolishing_countdown > 0 then
		if self:HasSpot("Top") then
			self:Attach(PlaceObject("RotatyThing"), self:GetSpotBeginIndex("Top"))
		end
		PlayFX("Demolish", "start", self)

		local fx_sleep = 1000
		local fx_cooldown = fx_sleep
		while IsValid(self) and self.demolishing_countdown > 0 do
			local start_time = RealTime()
			Sleep(fx_sleep)
			if GetTimeFactor() > 0 and not IsPaused() then
				local dt = Min(fx_sleep, RealTime() - start_time)
				fx_cooldown = fx_cooldown - dt
				if fx_cooldown < 0 then
					fx_cooldown = fx_cooldown + fx_sleep
					if SelectedObj == self then
						PlayFX("DemolishingCountdown", "start")
					end
				end
				self.demolishing_countdown = self.demolishing_countdown - dt
				if SelectedObj == self then
					ObjModified(self)
				end
			end
		end

		PlayFX("Demolish", "end", self)
	end
	
	if not self.demolishing then
		return
	end
	self.demolishing = nil
	
	if IsValid(self) then
		if self.use_demolished_state then
			PlayFXAroundBuilding(self, "Demolish")
		else
			PlayFXAroundBuilding(self, "Remove")
		end
		self:OnDemolish()
		if not self.use_demolished_state then
			DoneObject(self)
		else
			self:DestroyAttaches("RotatyThing")
		end
	end

	Msg("Demolished", self)
end

function Demolishable:IsDemolishing()
	return IsValidThread(self.demolishing_thread)
end

function Demolishable:OnSetDemolishing(is_demolishing)
end

function Demolishable:OnDemolish()
end

function Demolishable:GetRefundResources()
end

----

DefineClass.RotatyThing = {
	__parents = { "SpawnFXObject" },
	class_flags = { cfConstructible = false },
	entity = "DemolishLight",	
	speed = 360*60, --min per sec
	update_thread = false,
}

function RotatyThing:Init()
	self.update_thread = CreateGameTimeThread(function()
		self:SetAngle(0)
		local a = 0
		while IsValid(self) do
			--rot by 90 deg
			local t = 90 * 60 * 1000 / self.speed
			a = (a + 90 * 60) % (360 * 60)
			self:SetAngle(a, t)
			Sleep(t)
		end
	end)
end

function RotatyThing:Done()
	DeleteThread(self.update_thread)
end

