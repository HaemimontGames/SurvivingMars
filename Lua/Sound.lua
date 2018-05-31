function DomeSoundEnhance()
	CreateMapRealTimeThread(function()
		local enhanced
		while true do
			local enhance = IsValid(l_DomeLastOpened) or InMarkingVolume() or false
			if enhanced ~= enhance then
				enhanced = enhance
				local fade_time = config.SoundDomeFadeTime 
				local max_vol = const.MaxVolume
				local reduct_vol = MulDivRound(max_vol, config.SoundDomeReductedPct, 100)
				if enhance then
					SetGroupVolume("SoundDome", max_vol, fade_time)
					SetGroupVolume("Sound", reduct_vol, fade_time)
				else
					SetGroupVolume("SoundDome", reduct_vol, fade_time)
					SetGroupVolume("Sound", max_vol, fade_time)
				end
			end
			Sleep(333)
		end
	end)
end

OnMsg.NewMapLoaded = DomeSoundEnhance
OnMsg.LoadGame = DomeSoundEnhance