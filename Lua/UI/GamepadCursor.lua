if FirstLoad then
	HideGamepadCursorReasons = false
end

function ShowGamepadCursor(reason)
	if reason and HideGamepadCursorReasons then
		HideGamepadCursorReasons[reason] = nil
	end
	
	if GetUIStyleGamepad() and not ChangingMap and GetInGameInterface() and g_GamepadObjects and
	   (not HideGamepadCursorReasons or not next(HideGamepadCursorReasons))
	then
		OpenDialog("GamepadCursorDlg", GetInGameInterface())
	end
end

function HideGamepadCursor(reason)
	if reason then
		HideGamepadCursorReasons = HideGamepadCursorReasons or {}
		HideGamepadCursorReasons[reason] = true
	end
	CloseDialog("GamepadCursorDlg")
end

function IsHybridGamepadCursorHidden()
	return HideGamepadCursorReasons and HideGamepadCursorReasons["HybridNoInput"]
end

function LockHRXboxLeftThumb(reason)
	if not (HideGamepadCursorReasons or empty_table)[reason] then
		hr.XBoxLeftThumbLocked = hr.XBoxLeftThumbLocked + 1
	end
	HideGamepadCursor(reason)
end

function UnlockHRXboxLeftThumb(reason)
	if (HideGamepadCursorReasons or empty_table)[reason] then
		hr.XBoxLeftThumbLocked = hr.XBoxLeftThumbLocked - 1
		assert(hr.XBoxLeftThumbLocked >= 0)
	end
	ShowGamepadCursor(reason)
end

function CalculateGamepadCursorSize(img)
	local GetPosLookAt =
		cameraRTS.IsActive() and cameraRTS.GetPosLookAt or
		cameraMax.IsActive() and cameraMax.GetPosLookAt
	if not GetPosLookAt then return end

	local pos, lookat = GetPosLookAt()
	local dz = abs(pos:z() - lookat:z())
	local d = pos:Dist(lookat)
	local aspect = MulDivRound(dz, 1000, d)	-- aspect is cos function of camera tilt angle
	
	return MulDivRound(img.parent.box:sizex(), aspect*100, 1000*GetUIScale())
end

function GetGamepadCursor()
	return GetDialog("GamepadCursorDlg")
end

function OnMsg.GameEnterEditor()
	HideGamepadCursor("editor")
end

function OnMsg.GameExitEditor()
	ShowGamepadCursor("editor")
end

function UseHybridControls()
	--hybrid scheme is enabled only while gamepad is active
	if not GetUIStyleGamepad() then
		return false
	end
	
	return AccountStorage and AccountStorage.Options and AccountStorage.Options.ControlScheme == "Hybrid"
end

function UseGamepadUI()
	return GetUIStyleGamepad() and not (UseHybridControls() and IsHybridGamepadCursorHidden())
end

function OnMsg.ControlSchemeChanged()
	if not UseHybridControls() then
		ShowGamepadCursor("HybridNoInput")
	end
end
