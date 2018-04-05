DefineClass.HangingGardens = {
	__parents = { "LifeSupportConsumerService" },
}

function HangingGardens:OnDestroyed()
	self:DestroyAttaches("HangingGardensWater")
	LifeSupportConsumerService.OnDestroyed(self)
end