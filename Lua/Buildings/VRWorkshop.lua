DefineClass.VRWorkshop = {
	__parents = { "Workshop" },
}

function VRWorkshop:OnDestroyed()
	Workplace.OnDestroyed(self)
	self:DestroyAttaches("VRWorkshopHologram")
end