--[[@@@
@class SkinChangeable
class overview...
--]]

DefineClass.SkinChangeable =
{
}

function SkinChangeable:GetSkins()
	return false
end

function SkinChangeable:CycleSkin()
	local skins = self:GetSkins()
	if not skins or #skins <= 1 then return end

	-- process the units inside building before changing entity ( changing entity will destroy attaches. Units attached to any attach would be deleted )
	if self:IsKindOf("Holder") then
		local units = self.units or empty_table -- units in holder
		for i = 1, #units do
			local unit = units[i]
			unit.visit_restart = true
			if unit:IsValidPos() then
				unit:Detach()
				unit:DetachFromMap()
				unit:SetOutside(false)
				unit:InterruptPath()
				Wakeup(unit.command_thread)
			end
		end
	end
	local skin_idx = self:GetNextSkinIdx(skins)
	local skin = skins[skin_idx]
	self:ChangeSkin(skin)
end

function SkinChangeable:GetNextSkinIdx(skins)
	local skin_idx = (table.find(skins, self:GetEntity()) or 0) + 1
	if skin_idx > #skins then
		skin_idx = 1
	end
	return skin_idx
end

function SkinChangeable:ChangeSkin(skin)
	self:ChangeEntity(skin)
	self:OnSkinChanged(skin)
end

function SkinChangeable:OnSkinChanged(skin)
end