DefineClass.AutoRemoveObj = {
	__parents = { "CObject" },
}

GlobalGameTimeThread("AutoRemoveObjs", function()
	Sleep(const.HourDuration)
	while true do
		local sleep = const.HourDuration
		if NightLightsState then
			Sleep(10000) sleep = sleep - 10000
			local sizex, sizey = terrain.GetMapSize()
			local border = mapdata.PassBorder or 0
			local obj = MapFindNearest(point(border + AsyncRand(sizex - 2 * border), border + AsyncRand(sizey - 2 * border)), "map", "AutoRemoveObj")
			Sleep(10000) sleep = sleep - 10000
			if IsValid(obj) then
				SuspendPassEdits("AutoRemoveObjs")
				MapDelete( obj, 200*guim, "AutoRemoveObj", "rand", 50, AsyncRand())
				if IsValid(obj) then obj:delete() end
				ResumePassEdits("AutoRemoveObjs")
			end
		end
		Sleep(sleep)
	end
end)