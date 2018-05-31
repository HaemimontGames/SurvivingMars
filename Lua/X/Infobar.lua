if FirstLoad then
	g_InfobarContextObj = false
end

DefineClass.Infobar = {
	__parents = { "XDialog" },
	PadHeight = 30,
}

function Infobar:Open(...)
	XDialog.Open(self, ...)
	
	self.idPad:SetMaxHeight(self.PadHeight)
	self.idPad:SetMinHeight(self.PadHeight)
	self:RecalculateMargins()
	
	local dlg = GetXDialog("OnScreenHintDlg")
	if dlg then
		CreateGameTimeThread(dlg.RecalculateMargins, dlg)
	end
	
	--create context object & begin update thread
	if not g_InfobarContextObj then
		g_InfobarContextObj = InfobarObj:new()
	end
	self:CreateThread("UpdateThread", self.UpdateThreadFunc, self)
	
	--set contexts to each text field
	self.obj = PlaceObject("InfobarObj")
	for i,elem in ipairs(self.idPad) do
		elem:SetContext(g_InfobarContextObj)
	end
end

function Infobar:Close(...)
	XDialog.Close(self, ...)
	
	local dlg = GetXDialog("OnScreenHintDlg")
	if dlg then
		CreateGameTimeThread(dlg.RecalculateMargins, dlg)
	end
end

function Infobar:UpdateThreadFunc()
	--triggers UI update every 1 second
	while self.window_state ~= "destroying" do
		ObjModified(g_InfobarContextObj)
		Sleep(1000)
	end
end

function Infobar:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	self:SetMargins(GetSafeMargins())
end

function UpdateInfobarVisibility()
	local igi = GetInGameInterface()
	if not igi then
		return
	end
	
	local visible = AccountStorage.Options.InfobarEnabled
	if visible then
		OpenXDialog("Infobar", igi)
	else
		CloseXDialog("Infobar")
	end
	
	local dlg = GetXDialog("OnScreenHintDlg")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function OnMsg.CityStart(igi)
	CreateGameTimeThread(UpdateInfobarVisibility)
end

function OnMsg.SafeAreaMarginsChanged()
	local infobar = GetXDialog("Infobar")
	if infobar then
		infobar:RecalculateMargins()
	end
end

--UI text getters

DefineClass.InfobarObj = {
	__parents = { "PropertyObject" },
}

function InfobarObj:FmtFunding(n, colorized)
	--formatting funding in the infobar happens in a specific manner:
	--0,1,2...,999, 1k,2k,3k,...,999k, 1M,2M,3M,...,999M, 1B,2B,3B,...
	local abs_n = abs(n)
	if abs_n >= 1000000000 then --billion (B)
		return T{9775, "<n>B", n = T{tostring(n / 1000000000)}}
	elseif abs_n >= 1000000 then --million (M)
		return T{9776, "<n>M", n = T{tostring(n / 1000000)}}
	elseif abs_n >= 1000 then --thousand (k)
		return T{9777, "<n>k", n = T{tostring(n / 1000)}}
	else -- 0-999
		return T{9778, "<n>", n = T{tostring(n)}}
	end
end

function InfobarObj:FmtRes(n, colorized)
	--formatting resource in the infobar happens in a specific manner:
	--0,1,2...,999, 1k,1.9k,2k,...,999k, 1M,1.9M,2M,...,999M, 1B,1.9B,2B,...
	local tnum
	local abs_n = abs(n)
	if abs_n >= 1000000000 then --billion (B)
		local div = 1000000000
		local value = n / div
		local rem = (n % div) / (div / 10)
		if rem > 0 then
			tnum = T{9807, --[[Infobar number formatting (billion)]] "<n>.<rem>B", n = T{tostring(value)}, rem = T{tostring(rem)}}
		else
			tnum = T{9775, --[[Infobar number formatting (billion)]] "<n>B", n = T{tostring(value)}}
		end
	elseif abs_n >= 1000000 then --million (M)
		local div = 1000000
		local value, rem = n / div, (n % div) / (div / 10)
		if rem > 0 then
			tnum = T{9808, --[[Infobar number formatting (million)]] "<n>.<rem>M", n = T{tostring(value)}, rem = T{tostring(rem)}}
		else
			tnum = T{9776, --[[Infobar number formatting (million)]] "<n>M", n = T{tostring(value)}}
		end
	elseif abs_n >= 1000 then --thousand (k)
		local div = 1000
		local value, rem = n / div, (n % div) / (div / 10)
		if rem > 0 then
			tnum = T{9809, --[[Infobar number formatting (thousand)]] "<n>.<rem>k", n = T{tostring(value)}, rem = T{tostring(rem)}}
		else
			tnum = T{9777, --[[Infobar number formatting (thousand)]] "<n>k", n = T{tostring(value)}}
		end
	else -- 0-999
		tnum = T{9778, --[[Infobar number formatting]] "<n>", n = T{tostring(n)}}
	end
	
	if colorized then
		if n >= 0 then
			return T{9779, "<green><tnum></green>", tnum = tnum}
		elseif n < 0 then
			return T{9780, "<red><tnum></red>", tnum = tnum}
		end
	else
		return tnum
	end
end

function InfobarObj:GetFundingText()
	local funding = ResourceOverviewObj:GetFunding()
	
	return T{9781, "$<funding>",
		funding = self:FmtFunding(funding),
	}
end

function InfobarObj:GetFundingRollover()
	return ResourceOverviewObj:GetFundingRollover()
end

function InfobarObj:GetResearchText()
	local estimate = ResourceOverviewObj:GetEstimatedRP()
	local progress = ResourceOverviewObj:GetResearchProgress()
	
	return T{9782, "<estimate><icon_Research> <progress><image UI/Icons/res_theoretical_research.tga 1300>",
		estimate = self:FmtRes(estimate),
		progress = progress,
	}
end

function InfobarObj:GetResearchRollover()
	return ResourceOverviewObj:GetResearchRollover()
end

function InfobarObj:GetGridResourcesText()
	local power = ResourceOverviewObj:GetPowerNumber() / const.ResourceScale
	local air = ResourceOverviewObj:GetAirNumber() / const.ResourceScale
	local water = ResourceOverviewObj:GetWaterNumber() / const.ResourceScale
	
	return T{9783, "<power><icon_Power> <air><icon_Air> <water><icon_Water>",
		power = self:FmtRes(power, "colorized"),
		air = self:FmtRes(air, "colorized"),
		water = self:FmtRes(water, "colorized"),
	}
end

function InfobarObj:GetGridResourcesRollover()
	return ResourceOverviewObj:GetGridRollover()
end

function InfobarObj:GetBasicResourcesText()
	local metals = ResourceOverviewObj:GetAvailableMetals() / const.ResourceScale
	local concrete = ResourceOverviewObj:GetAvailableConcrete() / const.ResourceScale
	local food = ResourceOverviewObj:GetAvailableFood() / const.ResourceScale
	local precious_metals = ResourceOverviewObj:GetAvailablePreciousMetals() / const.ResourceScale
	
	return T{9784, "<metals><icon_Metals> <concrete><icon_Concrete> <food><icon_Food> <precious_metals><icon_PreciousMetals>",
		metals = self:FmtRes(metals),
		concrete = self:FmtRes(concrete),
		food = self:FmtRes(food),
		precious_metals = self:FmtRes(precious_metals),
	}
end

function InfobarObj:GetBasicResourcesRollover()
	return ResourceOverviewObj:GetBasicResourcesRollover()
end

function InfobarObj:GetAdvancedResourcesText()
	local polymers = ResourceOverviewObj:GetAvailablePolymers() / const.ResourceScale
	local electronics = ResourceOverviewObj:GetAvailableElectronics() / const.ResourceScale
	local machine_parts = ResourceOverviewObj:GetAvailableMachineParts() / const.ResourceScale
	local fuel = ResourceOverviewObj:GetAvailableFuel() / const.ResourceScale
	
	return T{9785, "<polymers><icon_Polymers> <electronics><icon_Electronics> <machine_parts><icon_MachineParts> <fuel><icon_Fuel>",
		polymers = self:FmtRes(polymers),
		electronics = self:FmtRes(electronics),
		machine_parts = self:FmtRes(machine_parts),
		fuel = self:FmtRes(fuel),
	}
end

function InfobarObj:GetAdvancedResourcesRollover()
	return ResourceOverviewObj:GetAdvancedResourcesRollover()
end

function InfobarObj:GetColonistsText()
	local free_home = ResourceOverviewObj:GetFreeLivingSpace()
	local homeless = ResourceOverviewObj:GetHomelessColonists()
	local free_work = ResourceOverviewObj:GetFreeWorkplaces()
	local unemployed = ResourceOverviewObj:GetUnemployedColonists()
	
	return T{9786, "<free_home><icon_Home> <homeless><icon_Homeless> <free_work><icon_Work> <unemployed><icon_Unemployed>",
		free_home = self:FmtRes(free_home),
		homeless = self:FmtRes(homeless),
		free_work = self:FmtRes(free_work),
		unemployed = self:FmtRes(unemployed),
	}
end

function InfobarObj:GetColonistCount()
	return ResourceOverviewObj:GetColonistCount()
end

function InfobarObj:GetColonistsRollover()
	return ResourceOverviewObj:GetColonistsRollover()
end
