local function press(shortcut)
	terminal.Shortcut(shortcut, "keyboard")
	Sleep(50)
	terminal.Shortcut("-", shortcut, "keyboard")
	Sleep(50)
end

GlobalVar("CrashTestMode", false)
CrashTestThread = false
CrashTestThreadSub = false
	
local function SuspendCrashTest()
	DeleteThread(CrashTestThread)
	DeleteThread(CrashTestThreadSub)
end

function StopCrashTest()
	if CrashTestMode then
		CrashTestMode = false
		print("Crash test stopped.")
	end
	SuspendCrashTest()
end

function StartCrashTest()
	if not CrashTestMode then
		CrashTestMode = true
		print("Crash test started.")
	end
	SuspendCrashTest()
	CrashTestThread = CreateRealTimeThread(function()
		assert = empty_func
		local lims = {cameraRTS.GetZoomLimits()}
		local shortcuts = {"Escape", "B", "M", "P", "H", "Z", "L", "Y"}
		local lightmodels = table.keys2(LightmodelPresets)
		local k = 0
		while CrashTestThread == CurrentThread() do
			local colonists = UICity and #(UICity.labels.Colonist or "") or 0
			local speed = Max(10, 100 + (10 - 100) * colonists / 1000)
			SetTimeFactor(const.DefaultTimeFactor * speed)
			CrashTestThreadSub = CreateRealTimeThread(function()
				press("Escape")
				CloseIngameMainMenu()
				if terminal.desktop.modal_window ~= terminal.desktop then
					terminal.desktop.modal_window:Close()
					Sleep(100)
				end
				k = k + 1
				press(shortcuts[1 + k % #shortcuts])
				Sleep(500)
				press("Escape")
				CloseIngameMainMenu()
				local lightmodel = table.rand(lightmodels)
				SetLightmodelOverrideDelay(1, lightmodel)
				local zoom = lims[1 + k % #lims]
				local follow_obj
				while CrashTestThreadSub == CurrentThread() do
					local target = table.rand{"Deposit", "Building", "Movable"}
					local obj = table.rand(MapGet("map" , target))
					if not follow_obj then
						SelectObj(obj)
						ViewObjectMars(obj, 300, nil, zoom)
					end
					if IsKindOf(obj, "CameraFollowObject") and not obj.camera_follow_disabled and AsyncRand(100) < 50 then
						SelectObj(obj)
						Camera3pFollow(obj)
						follow_obj = obj
					end
					Sleep(300)
					if IsKindOf(obj, "Building") then
						if IsKindOf(obj, "ConstructionSite") then
							if not obj.construction_group or obj.construction_group[1] == obj then
								obj:Complete("quick_build")
							end
						elseif obj.destroyed then
							obj:DestroyedRebuild()
						elseif #(obj:GetSkins() or "") > 0 and AsyncRand(100) < 20 then
							obj:CycleSkin()
						elseif obj.ui_working or not obj:CanDemolish() then
							obj:SetUIWorking(not obj.ui_working)
						elseif not obj.demolishing then
							obj.demolish_return_resources = false
							obj:ToggleDemolish()
						end
					elseif IsKindOf(obj, "BaseRover") then
						local pos = GetRandomPassable():SetTerrainZ()
						obj:Goto(pos)
					end
					local x, y = GetTerrainCursorXY(UIL.GetScreenSize()/2):xy()
					local amp = 50*guim
					local bbox = box(x - amp, y - amp, x + amp, y + amp)
					terrain.InvalidateType(bbox)
					RecreateRenderObjects()	
				end
			end)
			Sleep(3000)
			DeleteThread(CrashTestThreadSub)
		end
	end)
end

function OnMsg.DoneMap()
	StopCrashTest()
end

function OnMsg.AutosaveStart()
	SuspendCrashTest()
end

function OnMsg.AutosaveEnd()
	if CrashTestMode then
		StartCrashTest()
	end
end

function OnMsg.LoadGame()
	if CrashTestMode then
		StartCrashTest()
	end
end