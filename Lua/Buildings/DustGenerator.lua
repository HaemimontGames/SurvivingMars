DefineClass.DustGenerator =
{
	__parents = { "Building" },
	
	properties =
	{
		{id = "dust_per_sol",	name = T{653, "Dust per Sol"},	editor = "number", default = 6000,		category = "Dust Generator" },
		{id = "dust_range",		name = T{654, "Dust Range"},		editor = "number", default = 70 * guim,	category = "Dust Generator" },
	},
	
	last_dust_throw_time = false,
}

function DustGenerator:GameInit()
	self.last_dust_throw_time = GameTime()
end

local hour_duration = const.HourDuration
local sol_duration = const.DayDuration
local dust_generator_query =
{
	class = "Building",
	area = false,
	arearadius = false,
	exec = function(bld, dust)
		if bld.accumulate_dust then
			bld:AddDust(dust)
		end
	end,
}

local dust_generator_elements_query =
{
	class = "DustGridElement",
	area = false,
	arearadius = false,
	exec = function (obj, dust)
		obj:AddDust(dust)
	end,
}

function DustGenerator:ThrowDust()
	if not self.working then
		return
	end
	
	local time = GameTime() - self.last_dust_throw_time
	if time > hour_duration then
		local dust = MulDivTrunc(self.dust_per_sol, time, sol_duration)
		if dust > 0 then		-- allow dust to accumulate if update time is small and always leads to 0 dust
			dust_generator_query.area = self
			dust_generator_query.arearadius = self.dust_range
			ForEach(dust_generator_query, dust)
			dust_generator_query.area = false
			dust_generator_elements_query.area = self
			dust_generator_elements_query.arearadius = self.dust_range
			ForEach(dust_generator_elements_query, dust)
			dust_generator_elements_query.area = false
			self.last_dust_throw_time = GameTime()
		end
	end
end