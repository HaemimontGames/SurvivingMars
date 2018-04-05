DefineClass.FuelFactory = {
	__parents = { "ResourceProducer", "ElectricityConsumer", "LifeSupportConsumer", "OutsideBuildingWithShifts" },

	properties = {
		--{ template = true, category = "Spaceport", name = T{"Food per colonist"}, id = "food_per_colonist", editor = "number", default = 4*const.ResourceScale,  min = 1, max = 9999999, scale = const.ResourceScale, help = "The amount of food delivered for each arriving colonist.",},
	},
	
	building_update_time = const.HourDuration,

	exploitation_resource = "Fuel",
	stockpile_spots1 =  { "Resourcepile" },
	has_demand_request = false, 
	has_supply_request = true,
	max_x  = 5,
	max_y  = 2,
}

function FuelFactory:Init()
	self.parent = self
	self.max_z = self.max_storage1/(10 * const.ResourceScale)
end