-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionUpgrades",
	PlaceObj('XTemplateForEach', {
		'array', function (parent, context) return nil, 1, 3 end,
		'map', function (parent, context, array, i) return i end,
		'condition', function (parent, context, item, i) return UICity:IsUpgradeUnlocked(context:GetUpgradeID(i)) end,
		'item_in_context', "i",
		'run_after', function (child, context, item, i, n)
local obj = ResolvePropObj(context)
local id = obj:GetUpgradeID(item)
local display_name = obj:GetUpgradeDisplayName(item)
local description = obj:GetUpgradeDescription(item)

UISetupUpgradeButtonRollover(child, obj, i)
child:SetTitle(T{11444, "Upgrade: <name>", name = display_name})
end,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelActiveSection",
			'OnContextUpdate', function (self, context, ...)
local on
local icon = context:GetUpgradeIcon(context.i)
if icon and icon:sub(-6, -1) == "01.tga" then
	icon = icon:sub(1, -7)
else
	icon = "UI/Icons/Upgrades/amplify_"
end
local id = context:GetUpgradeID(self.context.i)
if context:HasUpgrade(id) then
	if context:IsUpgradeOn(id) then
		self:SetIcon(icon .. "02.tga")
		on = true
	else
		self:SetIcon(icon .. "03.tga")
	end
elseif context:IsUpgradeBeingConstructed(id) then
	self:SetIcon(icon .. "04.tga")
else
	self:SetIcon(icon .. "01.tga")
end
self.idActive:SetVisible(on)
end,
			'TitleHAlign', "left",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnActivate(self, context, gamepad)",
				'parent', function (parent, context) return parent.parent end,
				'func', function (self, context, gamepad)
self:ProcessUpgrade(context, not gamepad and IsMassUIModifierPressed())
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnAltActivate(self, context, gamepad)",
				'parent', function (parent, context) return parent.parent end,
				'func', function (self, context, gamepad)
if not gamepad then return end
self:ProcessUpgrade(context, true)
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "ProcessUpgrade(self, context, broadcast)",
				'parent', function (parent, context) return parent.parent end,
				'func', function (self, context, broadcast)
local obj = ResolvePropObj(context)
local id = obj:GetUpgradeID(context.i)
if broadcast then
	local enable, construct
	if obj:HasUpgrade(id) then
		enable = not obj.upgrade_on_off_state[id]
	else
		construct = not obj:IsUpgradeBeingConstructed(id)
	end
	BroadcastAction(obj, function(bld)
		if not bld:GetUpgradeTier(id) then --upgrade id not present for this bld
			return
		elseif bld:HasUpgrade(id) then
			if enable ~= nil and bld.upgrade_on_off_state[id] ~= enable then
				bld:ToggleUpgradeOnOff(id)
			end
		else
			if construct ~= nil and construct ~= bld:IsUpgradeBeingConstructed(id) then
				bld:ConstructUpgrade(id)
			end
		end
		ObjModified(bld)
	end)
else
	if obj:HasUpgrade(id) then
		obj:ToggleUpgradeOnOff(id)
	else
		obj:ConstructUpgrade(id)
	end
end

RebuildInfopanel(obj)
ObjModified(obj)
end,
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Id', "idUpgradeProgress",
				'Dock', "bottom",
				'FoldWhenHidden', true,
				'ContextUpdateOnOpen', true,
				'OnContextUpdate', function (self, context, ...)
local i = self.context.i
local id = context:GetUpgradeID(i)
if context:HasUpgrade(id) then
	self:SetVisible(false)
	return
end
local visible = context:IsUpgradeBeingConstructed(id)
self:SetVisible(visible)

if visible then
	local obj = ResolvePropObj(context)
	self:SetText(T{11445, --[[Infopanel upgrade under construction cost]] "Upgrade cost<right><cost>", cost = obj:UpgradeCosts(i)})
end
end,
			}),
			}),
		}),
})

