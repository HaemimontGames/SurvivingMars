DefineClass.DustGenerator =
{
	__parents = { "Building" },
	
	properties =
	{
		{id = "dust_per_sol",	name = T(653, "Dust per Sol"),	editor = "number", default = 14400,		category = "Dust Generator" },
		{id = "dust_range",		name = T(654, "Dust Range"),		editor = "number", default = 7,	category = "Dust Generator" },
	},
	
	last_dust_throw_time = false,
}

function DustGenerator:GameInit()
	self.last_dust_throw_time = GameTime()
end

local hour_duration = const.HourDuration
local sol_duration = const.DayDuration

function DustGenerator:GetDustRadius()
	return self.dust_range
end

function DustGenerator:ThrowDust()
	if not self.working then
		return
	end
	
	local time = GameTime() - self.last_dust_throw_time
	if time > hour_duration then
		local dust = MulDivTrunc(self.dust_per_sol, time, sol_duration)
		if dust > 0 then		-- allow dust to accumulate if update time is small and always leads to 0 dust
			local dust_func = function(obj, dust, generator)
				if obj == generator then return end
				if obj:IsKindOf("Building") and  obj.accumulate_dust then
					obj:AddDust(dust)
				elseif obj:IsKindOf("DustGridElement") then 
					obj:AddDust(dust)
				end
			end
			MapForEach(self, "hex", self.dust_range, "DustGridElement", "Building", dust_func, dust, self)
			self.last_dust_throw_time = GameTime()
		end
	end
end