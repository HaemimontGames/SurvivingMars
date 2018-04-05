-- Add game-specific User Actions for user mode here. See "CommonLua/scripts/core/uaDev.lua"

if FirstLoad then
	RemappableUA = {
		["DE_ToggleScreenshotInterface"] = {
			key = "-Ctrl-PrtScr",
			description = "Write upsampled screenshot",
			action = function()
				CreateRealTimeThread(function()
					hr.InterfaceInScreenshot = 0
					WaitNextFrame(3)
					LockCamera("Screenshot")
					MovieWriteScreenshot(GenerateScreenshotFilename("aa", "AppData/"), 0, 32, false)
					UnlockCamera("Screenshot")
				end)
			end,
		},
		["UpsampledScreenshot"] = {
			key = "-PrtScr",
			description = "Write upsampled screenshot",
			action = function()
				CreateRealTimeThread(function()
					table.change(hr, "print_screen", {
						InterfaceInScreenshot = 1,
					})
					WaitNextFrame(3)
					LockCamera("Screenshot")
					MovieWriteScreenshot(GenerateScreenshotFilename("aa", "AppData/"), 0, 32, false)
					UnlockCamera("Screenshot")
					table.restore(hr, "print_screen")
				end)
			end,
		},
		["RoverControlMode"] = {
			key = "Ctrl",
			mode = "Game",
			description = "Toggles selected rover control mode.",
			action = function()
				if IsValid(SelectedObj) and IsKindOfClasses(SelectedObj, "DroneBase") and not GetXDialog("ResourceItems") then
					SelectedObj:SetControlMode(true)
					return "break"
				end
			end,
		},
		["RoverControlModeStop"] = {
			key = "-Ctrl",
			mode = "Game",
			description = "Toggles selected rover control mode.",
			action = function()
				if IsValid(SelectedObj) and IsKindOfClasses(SelectedObj, "DroneBase") and not GetXDialog("ResourceItems") then
					SelectedObj:SetControlMode(false)
					return "break"
				end
			end,
		},
		["ShowHints"] = {
			key = "F1",
			mode = "Game",
			description = "Show Last Hint",
			action = function(_, controller_id)
				ShowLastHint()
			end,
		},
		
	}
end

function OnMsg.ClassesPostprocess()
	UserActions.AddActions(table.copy(RemappableUA, "deep"))
end
