GlobalVar("SelectionArrowsOwners", {})

DefineClass.SelectionArrow =
{
	__parents = { "Object", "ComponentAttach", "UIAttach" },
	flags = { efShadow = false, efSunShadow = false, gofRealTimeAnim = true, gofSpecialOrientMode = true },
	orient_mode = "facing_vertical",
	entity = "Arrow",
}


DefineClass.ArrowThirsty =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowThirsty",
}

DefineClass.ArrowFreezing =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowFreezing",
}

DefineClass.ArrowSuffocating =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowSuffocating",
}

DefineClass.ArrowHungry =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowHungry",
}

DefineClass.ArrowInsane =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowInsane",
}

DefineClass.ArrowEarthsick =
{
	__parents = { "SelectionArrow" },
	entity = "ArrowEarthsick",
}

---------------------------------------------------------------------------------
function SelectionArrowClearAll()
	for obj, arrow in pairs(SelectionArrowsOwners) do
		SelectionArrowRemove(obj)
		if obj:IsKindOf("Colonist") then
			UpdateAttachedSign(obj, "force")
		end
	end
	SelectionArrowsOwners = {}
end

function SelectionArrowAdd(obj)
	if type(obj) ~= "table" then
		return
	end
	if not IsValid(obj) then
		for i=1, #obj do
			if IsValid(obj[i]) then
				obj[i]:OnSelected()
			else 
				SelectionArrowAdd(obj[i])
			end
		end
		return
	end
	if not obj:CanAttach() then
		return
	end
	local arrow_class = "SelectionArrow"
	local is_colonist = obj:IsKindOf("Colonist")
	if is_colonist then
		if config.TestUnitArrows then
			arrow_class = table.rand( ClassDescendantsList("UnitSign") )
		else
			arrow_class = obj:GetSelectionArrow() or "SelectionArrow"
		end
	end

	if HasSelectionArrow(obj) and SelectionArrowsOwners[obj].class==arrow_class then
		return
	else
		local arrow = SelectionArrowsOwners[obj]
		if arrow then 
			DoneObject(arrow)
			SelectionArrowsOwners[obj] = false
		end	
	end
	local arrow = PlaceObject(arrow_class)
	local attach_to = obj
	local err = attach_to:Attach(arrow)
	if attach_to:IsKindOf("Unit") then
		obj:StartAlwaysRender("SelectionArrow")
	else
		attach_to:SetGameFlags(const.gofAlwaysRenderable)
	end
	arrow:SetAnimPhase(1, arrow:Random(Min(10000, arrow:GetAnimDuration())))
	assert(not err, "Selection arrow attach failed")
	SelectionArrowsOwners[attach_to] = arrow
end

function SelectionArrowRemove(obj)
	local arrow = SelectionArrowsOwners[obj]
	if IsValid(arrow) then
		SelectionArrowsOwners[obj] = nil
		if IsValid(obj) then
			if obj:IsKindOf("Unit") then
				obj:StopAlwaysRender("SelectionArrow")
			else
				obj:ClearGameFlags(const.gofAlwaysRenderable)
			end
			if obj:IsKindOf("Colonist") then
				UpdateAttachedSign(obj)
			end
		end
		DoneObject(arrow)
		return true
	end
end

function SelectionArrowUpdate(obj)
	if SelectionArrowsOwners[obj] then
		SelectionArrowRemove(obj)
		SelectionArrowAdd(obj)
	end
end

function HasSelectionArrow(obj)
	return not not SelectionArrowsOwners[obj]
end

function SelectionArrowMove(obj, to)
	local arrow = SelectionArrowsOwners[obj]
	if arrow and IsValid(to) then
		SelectionArrowsOwners[obj] = nil
		SelectionArrowsOwners[to] = arrow
		local err = to:Attach(arrow)
		if IsValid(obj) then
			if obj:IsKindOf("Unit") then
				obj:StopAlwaysRender("SelectionArrow")
			else
				obj:ClearGameFlags(const.gofAlwaysRenderable)
			end
		end
		assert(not err, "Selection arrow attach failed")
	end
end

function OnMsg.SelectionAdded(obj)
	if obj and obj:HasMember("OnSelected") then
		obj:OnSelected()
	end
end

function OnMsg.SelectionRemoved(obj)
	SelectionArrowClearAll()
	if IsValid(obj) and obj:IsKindOf("Colonist") then
		UpdateAttachedSign(obj,"force")
	end
end