function MirrorSphere:CreateCheatActions()
	return true
end

function MirrorSphereBuilding:UpdateUI()
	if self == SelectedObj then
		Msg("UIPropertyChanged", self)
	end
end

function MirrorSphereBuilding:GetActionProgress()
	local total = self.action and self.action_time or 0
	if total == 0 then
		return 0
	end
	local remainig_time = self.action == "PierceTheShell" and self.work_req:GetActualAmount() or Max(self.action_end_time - GameTime(), 0)
	return remainig_time == 0 and 100 or (100 - MulDivRound(100, remainig_time, total))
end

function MirrorSphereBuilding:ActionPierceTheShell()
	return self:StartAction("PierceTheShell")
end
function MirrorSphereBuilding:ActionCommunicate()
	return self:StartAction("Communicate")
end
function MirrorSphereBuilding:ActionFeedPower()
	return self:StartAction("FeedPower")
end

function MirrorSphereBuilding:GetDisplayName()
	if not self.scanned then return self.DisplayNameBurried end
	if self:GetProgressPct() == 100 then return self.DisplayNameExcavated end
	return self.display_name
end

function MirrorSphereBuilding:GetIPDescription()
	if not self.scanned then
		return T{1201, "An odd-looking rock pile."}
	elseif self:GetProgressPct() == 100 then
		return T{1202, "Mirror sphere excavation site"}
	else
		return self.description
	end
end

function MirrorSphereBuilding:GetActionDescr()
	if self.action == "PierceTheShell" then
		return T{1210, "Attempting to pierce the shell"}
	elseif self.action == "Communicate" then
		return T{1211, "Establishing communication"}
	elseif self.action == "FeedPower" then
		return T{1212, "Feeding Power"}
	end
	return T{1213, "Needs further analysis"}
end

----


function PowerDecoy:ActionTurnToMetal()
	self:StartAction("TurnToMetal")
end
function PowerDecoy:ActionTurnToRareMetals()
	self:StartAction("TurnToPreciousMetal")
end
function PowerDecoy:ActionTurnToPolymer()
	self:StartAction("TurnToPolymer")
end

function PowerDecoy:GetActionText()
	if self.action == "TurnToMetal" then
		return T{1219, "Decomposing into Metals"}
	elseif self.action == "TurnToPreciousMetal" then
		return T{1220, "Decomposing into Rare Metals"}
	elseif self.action == "TurnToPolymer" then
		return T{1221, "Decomposing into Polymers"}
	elseif self.action then
		return T{6781, "Idle"}
	elseif self:IsOccupied() then
		return T{455, "Occupied"}
	else
		return T{456, "Vacant"}
	end
end

function PowerDecoy:GetActionProgress()
	if not self.action then
		return 0
	end
	local remainig_time = Max(self.action_end_time - GameTime(), 0)
	if remainig_time == 0 then
		return 100
	end
	return 100 - MulDivRound(100, remainig_time, self.action_time)
end