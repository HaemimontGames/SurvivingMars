--[[@@@
@class BaseBuilding
class overview...
--]]
DefineClass.BaseBuilding = {
	flags = { cofComponentSound = true },
	__parents = { "Holder", "SyncObject" },

	working = false,
	ui_working = true,
	ui_working_changed = 0,
	fx_working = "",
	
	suspended = false,		-- thread or while the dust storm is active
	suspend_thread = false,
	frozen = false,
	ion_storms = false,
	destroyed = false,
	orig_state = false,
	bulldozed = false, -- running out of synonyms
	
	exceptional_circumstances = false,
	
	signs = false,
	--working/idle anim controls
	anim_control_thread = false,
	wait_working_anims_to_finish = false, --false for long start/end anims that can blend with eachother, true for short non blending anims
	--hit moment tracking
	track_multiple_hit_moments_in_work_state = false,
	track_multiple_hit_thread = false,

	force_fx_work_target = false,
	ui_interaction_state = true,

	--used by UpdateConsumption to avoid iskindof checks
	is_electricity_consumer = false,
	is_lifesupport_consumer = false,

	play_working_anim_on_this_attach = false, --"attachclassname", will force ChangeWorkingStateAnim to always pick this attach to control.
	refreshing_working_state = false, -- used when applying upgrades to force recalc of important values without affecting the visual state
	
	sign_spot = "Top",
	sign_offset = false,
}

function BaseBuilding:GameInit()
	self:AddToCityLabels()
	
	CreateGameTimeThread(function(self) -- delay until GameInit is completed
		if not IsValid(self) then return end
		self:UpdateWorking()
	end, self)
end

function BaseBuilding:Done()
	SetShapeMarkers(self, false)
end

function BaseBuilding:AddToCityLabels()
	--overwrite me
end

function GetBuildingsParamInNotification(displayed_in_notif)
	local building_counts = {}
	for _, bld in pairs(displayed_in_notif) do
		local name = bld.template_name
		if name and name ~= "" then
			local count = (building_counts[name] or 0) + 1
			building_counts[name] = count
		end
	end
	local keys = table.keys(building_counts)
	table.stable_sort(keys, function(a,b)
		return building_counts[a] > building_counts[b]
	end)
	local rollover_text = {}
	for i = 1, #keys do
		local item = keys[i]
		local count = building_counts[item]
		local name = count > 1 and BuildingTemplates[item].display_name_pl or  BuildingTemplates[item].display_name
		rollover_text[#rollover_text + 1] = T{10365, "<count> <name>", count = count, name = name}
	end
	rollover_text = table.concat(rollover_text, "\n")
	return rollover_text
end

local function NotWorkingBuildingsParamFunc(displayed_in_notif)
	local rollover_text = GetBuildingsParamInNotification(displayed_in_notif) or empty_table
	return {count = #displayed_in_notif, rollover_title = T(5648, "Buildings Not Working"), rollover_text = rollover_text}
end

GlobalVar("g_NotWorkingBuildings", {})
GlobalGameTimeThread("NotWorkingBuildingsNotif", function()
	HandleNewObjsNotif(g_NotWorkingBuildings, "NotWorkingBuildings", nil, NotWorkingBuildingsParamFunc)
end)

function BaseBuilding:ShouldShowNotWorkingNotification()
	return not self.destroyed and self:IsWorkPermitted() and not self:IsWorkPossible()
end

function BaseBuilding:UpdateNotWorkingBuildingsNotification()
	if self:ShouldShowNotWorkingNotification() then
		table.insert_unique(g_NotWorkingBuildings, self)
	else
		table.remove_entry(g_NotWorkingBuildings, self)
	end
end
--[[@@@
Will set the working state of the building with whatever CanWork returns. This means that if GetWorkNotPossibleReason and GetWorkNotPermittedReason are implemented correctly the building will automatically pick the correct state. This function needs to be called on state change.

@function void BaseBuilding@UpdateWorking([bool expected_state])
@param bool expected_state - Optional. The expected state by the caller. If the actual state is different the function will helpfully assert.
--]]
function BaseBuilding:UpdateWorking(expected_state)
	local can_work = self:CanWork()
	assert(expected_state == nil or can_work == expected_state, "CanWork method inconsistency")
	self:SetWorking(can_work)
end

--[[@@@
Working state setter. Will set the new working state of the building directly. Use this only if you are absolutely certain what the new sate will be. For example, a factory lacking input materials cannot work therefore it is safe to call SetWorking(false) (unless some research says otherwise) for it to immidiately update its working state. Generally though, it is safer to call the UpdateWorking(working) method. This function will do work even if the new state is the same as the old one. OnSetWorking will only get called if the new state is different from the old one.

@function void BaseBuilding@SetWorking(bool work)
@param bool work - The new working state.
--]]
function BaseBuilding:SetWorking(work)
	work = not not work
	local old_working = self.working
	self.working = work
	self:UpdateNotWorkingBuildingsNotification()
	--rem/add consumption requests
	if self:DoesHaveConsumption() then
		self:UpdateRequestConnectivity()
	end
	--rem/add upgrade consumption requests
	if self:DoesHaveUpgradeConsumption() then
		self:UpdateUpgradeRequestsConnectivity()
	end
	
	if self.working == old_working then return end
	self:OnSetWorking(work)
end
function BaseBuilding:Setexceptional_circumstances(disabled)
	self.exceptional_circumstances = disabled
	self:UpdateWorking()
	self:UpdateConsumption()
	self:AttachSign(disabled, "SignNotWorking")
end

function BaseBuilding:SetUIInteractionState(bState)
	self.ui_interaction_state = bState
	RebuildInfopanel(self)
end

function BaseBuilding:GetUIInteractionState()
	return self.ui_interaction_state
end

function BaseBuilding:DoesHaveConsumption()
	return false
end

function BaseBuilding:DoesHaveUpgradeConsumption()
	return false
end

function BaseBuilding:SetUIWorking(work)
	work = work or false
	if self.ui_working == work then return end
	self:Gossip("UIWorking", work )
	self.ui_working = work
	self.ui_working_changed = GameTime()
	PlayFX("UIWorking", work and "start" or "end", self)
	self:UpdateWorking()
	self:OnSetUIWorking(work)
	self:AttachSign(not self.ui_working, "SignStopped")
	self:UpdateSignsVisibility()
end

function BaseBuilding:GetBroadcastLabel()
	return self.class
end

function BaseBuilding:BroadcastVerify(other)
	return true
end

function BroadcastAction(building, action, ...)
	local label = building:GetBroadcastLabel()
	local list = building.city and building.city.labels[label] or empty_table
	assert(table.find(list, building), "Object isn't present in its broadcast list!")
	local eval = type(action) == "string"
	for _, obj in ipairs(list) do
		if obj:GetBroadcastLabel() == label and building:BroadcastVerify(obj) and obj:GetUIInteractionState() then
			local func = eval and obj[action] or action
			func(obj, ...)
		end
	end
end

function BaseBuilding:ToggleWorking(broadcast)
	if not self.suspended then
		RebuildInfopanel(self)
		self:SetUIWorking(not self.ui_working)
		if broadcast then
			BroadcastAction(self, "SetUIWorking", self.ui_working)
		end
	end
end

function BaseBuilding:ToggleWorking_Update(button)
	button:SetEnabled(not self.suspended)
	local shortcuts = GetShortcuts("actionOnOff")
	local binding = ""
	if shortcuts and (shortcuts[1] or shortcuts[2]) then
		binding = T(10902, " / <em><ShortcutName('actionOnOff', 'keyboard')></em>")
	end
	if self.suspended then
		button:SetIcon("UI/Icons/IPButtons/turn_off.tga")
		button:SetRolloverHint(T{7611, "<left_click><binding> Deactivate <newline><em>Ctrl + <left_click></em> Deactivate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7612, "<ButtonA> Deactivate <newline><ButtonX> Deactivate all <display_name_pl>"))
	elseif self.ui_working then
		if not self.working then
			button:SetIcon("UI/Icons/IPButtons/turn_warning.tga")
		else
			button:SetIcon("UI/Icons/IPButtons/turn_off.tga")
		end
		button:SetRolloverHint(T{7611, "<left_click><binding> Deactivate <newline><em>Ctrl + <left_click></em> Deactivate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7612, "<ButtonA> Deactivate <newline><ButtonX> Deactivate all <display_name_pl>"))
	else
		button:SetIcon("UI/Icons/IPButtons/turn_on.tga")
		button:SetRolloverHint(T{7613, "<left_click><binding> Activate <newline><em>Ctrl + <left_click></em> Activate all <display_name_pl>", binding = binding})
		button:SetRolloverHintGamepad(T(7614, "<ButtonA> Activate <newline><ButtonX> Activate all <display_name_pl>"))
	end
end

function BaseBuilding:GetUIWorkingStatus()
	if self.suspended then return T(379, "Suspended") end
	if self.ui_working then
		if not self.working then return T(7326, "Not Working") end
		return T(7327, "Turned On")
	end
	return T(7328, "Turned Off")
end
--[[@@@
Returns whether work is possible in terms of game rules for this building.

@function bool BaseBuilding@IsWorkPossible()
@result bool - Whether it is possible for the building to work in its current state according to the game rules.
--]]
function BaseBuilding:IsWorkPossible() -- by 'objective' factors, e.g. electricity supplied, output storage empty, workers present
	return not self:GetWorkNotPossibleReason()
end
--[[@@@
Returns a reason which makes it impossible (in terms of game rules) for the building to work. For example if the building requires workers but has none "NotEnoughWorkers" should be returned. This is an [auto resolve](LuaClasses.md.html#toc1.3) method. This needs to be implemented for building classes that have unique reasons for not working.

@function string/nil BaseBuilding@GetWorkNotPossibleReason()
@result string/nil - The reason because of work is impossible for this building or nil if it is.
--]]
function BaseBuilding:GetWorkNotPossibleReason()
	if not self:HasWorkforce() then
		return "NotEnoughWorkers"
	end
	if #(self.ion_storms or empty_table) > 0 then
		return "IonStorm"
	end
	if self.suspended then
		return self.suspended
	end
	if self.frozen then
		return "Frozen"
	end
end
--[[@@@
Returns whether the building is allowed to work by the user.

@function bool BaseBuilding@IsWorkPermitted()
@result bool - Wether the building is permitted to work by the user.
--]]
function BaseBuilding:IsWorkPermitted() -- by the user, e.g. building not disabled from infopanel, shift active etc.
	return not self:GetWorkNotPermittedReason()
end
--[[@@@
Returns the reason the building is not permitted to work. For example if the user turned it off with the infopanel button this func will return "TurnedOff". This is an [auto resolve](LuaClasses.md.html#toc1.3) method. This needs to be implemented for building classes that have unique reasons for not working.

@function string/nil BaseBuilding@GetWorkNotPermittedReason()
@result string/nil - The reason the building is not permitted to work or nil if it is.
--]]
function BaseBuilding:GetWorkNotPermittedReason()
	if not self.ui_working then
		return "TurnedOff"
	elseif self.exceptional_circumstances then
		return "ExceptionalCircumstancesDisabled"
	end
end

function BaseBuilding:HasWorkforce() --whether the building can currently has enough workers to work.
	return true
end
--[[@@@
Returns nil if the building can work, otherwise it returns a humanly readable non localized string representing the reason it cannot.

@function string/nil BaseBuilding@GetNotWorkingReason()
@result string/nil - Humanly readable string representing the reason a buildig is not working or nil if there is nothing preventing the building from working.
--]]
function BaseBuilding:GetNotWorkingReason()
	return self:GetWorkNotPermittedReason() or self:GetWorkNotPossibleReason()
end

--[[@@@
Returns wether work for this building is both possible and permitted. It uses GetWorkNotPossibleReason and GetWorkNotPermittedReason functions to determine this. Therefore, it is critical, if a new building class has unique reasons for not working, for it to implement these functions.

@function bool BaseBuilding@CanWork()
@result bool - Result.
--]]
function BaseBuilding:CanWork()
	return not self:GetNotWorkingReason()
end

function BaseBuilding:OnSetUIWorking(work)
	self:UpdateConsumption()
end

function BaseBuilding:IsSupplyGridDemandStoppedByGame()
	return self:IsMalfunctioned() or not self:HasWorkforce() or self.suspended or
			self.destroyed or (IsKindOf(self, "Demolishable") and self.demolishing) or self.frozen or 
			(IsKindOf(self, "BuildingDepositExploiterComponent") and not self:HasNearbyDeposits() and not self.city:IsTechResearched("NanoRefinement")) or false
end

function BaseBuilding:UpdateConsumption(update)
	if GameInitThreads[self] then
		self:Notify("UpdateConsumption")
		return
	end
	local is_electricity_consumer = self.is_electricity_consumer
	local is_lifesupport_consumer = self.is_lifesupport_consumer
	
	if is_electricity_consumer or is_lifesupport_consumer then
		--basically user can work
		local demand_stopped_by_user = not self:IsWorkPermitted()
		--this is the other can work, excluding electricity / ls canwork logic
		local demand_stopped_by_game = self:IsSupplyGridDemandStoppedByGame()
		
		if demand_stopped_by_user or demand_stopped_by_game then
			--turn everything off
			if is_electricity_consumer and self.electricity then 
				self.electricity:SetConsumption(0)
			end
			if is_lifesupport_consumer then
				if self.water then
					self.water:SetConsumption(0)
				end
				if self.air then
					self.air:SetConsumption(0)
				end
			end
		else
			--we should consume stuff!
			if is_electricity_consumer and self.electricity then
				--always consume electricity.
				self.electricity:SetConsumption(self.electricity_consumption, update)
			end
			
			if is_lifesupport_consumer then
				local should_consume_ls = true
				if is_electricity_consumer then
					--should not consume lifesupport if el consumer and no el, exception is dome.
					should_consume_ls = self.electricity and self:HasPower()
				end
				
				if should_consume_ls then
					if self.water then
						self.water:SetConsumption(self.water_consumption)
					end
					if self.air then
						self.air:SetConsumption(self.air_consumption)
					end
				else
					if self.water then
						self.water:SetConsumption(0)
					end
					if self.air then
						self.air:SetConsumption(0)
					end
				end
			end
		end
	end
end

function BaseBuilding:SetSuspended(suspended, reason, duration)
	if IsValidThread(self.suspend_thread) and CurrentThread() ~= self.suspend_thread then
		if suspended or (not reason or self.suspended == reason) then --don't kill the thread if we'll leave the bld 4ever suspended
			DeleteThread(self.suspend_thread)
		end
	end
	if not IsValid(self) then return end
	if suspended then
		if not self.suspended then
			self:AttachSign(true, "SignNotWorking")
			PlayFX("Suspended", "start", self)
		end
		self.suspended = reason or "Suspended"
		if duration then
			self.suspend_thread = CreateGameTimeThread(function(self, duration, reason)
				Sleep(duration)
				self:SetSuspended(false, reason)
			end, self, duration, reason)
		end
	elseif self.suspended and (not reason or self.suspended == reason) then
		PlayFX("Suspended", "end", self)
		self:AttachSign(false, "SignNotWorking")
		self.suspended = false
	end
	self:UpdateConsumption()
	self:UpdateWorking()
	RebuildInfopanel(self)
end

function BaseBuilding:RefreshNightLightsState()
end

function BaseBuilding:AttachSign(bAttach, sign)
	assert(IsValid(self))
	if bAttach and self.destroyed then return end --already dead.
	local signs = self.signs
	if bAttach then
		signs = signs or {}
		self.signs = signs
		if not signs[sign] then
			signs[sign] = true
			self:UpdateSignsVisibility()
		end
	elseif signs and signs[sign] then
		signs[sign] = nil
		self:UpdateSignsVisibility()
	end
end

function BaseBuilding:UpdateAttachedSigns()
end

function BaseBuilding:DetachAllSigns()
	self.signs = nil
	self:UpdateSignsVisibility()
end

function BaseBuilding:DoUpdateSignsVisibility()
	local max_priority, new_class = -1
	for sign in pairs(self.signs or empty_table) do
		if type(sign)== "string" then 
			local priority = g_Classes[sign].priority
			if priority > max_priority then
				max_priority = priority
				new_class = sign
			end
		end
	end
	if new_class and self:CountAttaches(new_class) > 0 then
		self:ForEachAttach("BuildingSign", function(attach)
			CObject.SetVisible(attach, g_SignsVisible)
			--also update sign offset
			attach:SetAttachOffset(self.sign_offset or point30)
		end)
		return
	end
	self:DestroyAttaches("BuildingSign")
	if new_class then
		local sign = AttachToObject(self, new_class, self.sign_spot)
		sign:SetScale(const.SignsOverviewCameraScaleDown)
		sign:SetVisible(g_SignsVisible)
		if self.sign_offset then
			sign:SetAttachOffset(self.sign_offset)
		end
	end
end

function BaseBuilding:UpdateSignsVisibility()
	self:Notify("DoUpdateSignsVisibility")
end

function BaseBuilding:UpdateWorkingStateAnim()
	self:ChangeWorkingStateAnim(self.working)
end

function BaseBuilding:PlayWorkingStateFXes(fx_target)
	if self.force_fx_work_target then
		fx_target = self.force_fx_work_target
	elseif not fx_target then
		fx_target = self:GetEntity()
	end
	if type(fx_target) == "table" and self.force_fx_work_target ~= fx_target and not IsKindOf(fx_target, "Object") then
		--unpersistable target, ref it so gc does not kill it and hang the particle
		self.force_fx_work_target = fx_target
	end
	PlayFX("Working", self.fx_working and "start" or "end", self, fx_target ~= self and fx_target or nil)
	--play breakdown sound
	if not self.fx_working and self:IsWorkPermitted() and not self:IsWorkPossible() then
		PlayFX("Breakdown", "start", self)
	end
end

--controls animations
function BaseBuilding:ChangeWorkingStateAnim(working)
	working = working or false
	if self.fx_working == working then
		return
	end
	if IsValidThread(self.anim_control_thread) then
		DeleteThread(self.anim_control_thread)
	end
	self.fx_working = working
	local fxes_played = false
	
	if working then
		--also iterate attaches (for autoattached animated stuffs), assumes one obj with anims.
		local att_arr = self:GetAttaches() or {}
		table.insert(att_arr, 1, self)
		
		local idx = false
		if self.play_working_anim_on_this_attach then
			idx = table.find(att_arr, "class", self.play_working_anim_on_this_attach)
		end
		
		for i = idx or 1, idx or #(att_arr or "") do
			if att_arr[i]:HasEntity() then
				local obj = att_arr[i]
				if obj:HasState("start") then
					self.anim_control_thread = CreateGameTimeThread(function()
						local anim_phase = 0
						local dur = GetAnimDuration(obj:GetEntity(), "start")
						if self.wait_working_anims_to_finish then --wait current to end, start next
							if obj:HasAnim("working") then return end --nothing to do,
							local wait_till_end = GetAnimDuration(obj:GetEntity(), obj:GetAnim(1)) - obj:GetAnimPhase(1)
							wait_till_end = MulDivRound(wait_till_end, 1000, obj:GetAnimSpeedModifier())
							Sleep(wait_till_end)
							if not IsValid(obj) then
								return
							end
						elseif obj:HasAnim("end") then
							local his_dur = Min(GetAnimDuration(obj:GetEntity(), "end"), dur)
							anim_phase = Clamp(his_dur - obj:GetAnimPhase(1), 0, dur)
							dur = dur - anim_phase
						end
						if not self.wait_working_anims_to_finish or not obj:HasAnim("start") then
							obj:SetAnim(1, "start", const.eDontCrossfade)
							obj:SetAnimPhase(1, anim_phase)
							dur = MulDivRound(dur, 1000, obj:GetAnimSpeedModifier())
							Sleep(dur)
						end
						if IsValid(obj) then
							obj:SetAnim(1, "working", const.eDontCrossfade)
							obj:SetAnimPhase(1, 0)
							if self.track_multiple_hit_moments_in_work_state then
								self:TrackMultipleHitMoments(obj, "Working", nil, type(self.track_multiple_hit_moments_in_work_state) == "table" and self.track_multiple_hit_moments_in_work_state or nil, true)
							end
						end
						self:PlayWorkingStateFXes(obj)
					end)
					fxes_played = true
					break
				elseif obj:HasState("working") then
					if not obj:HasAnim("working") then
						obj:SetAnim(1, "working", const.eDontCrossfade)
						obj:SetAnimPhase(1, 0)
					end
					obj:SetAnimSpeed(1, 1000)
					if self.track_multiple_hit_moments_in_work_state then
						self:TrackMultipleHitMoments(obj, "Working", nil, type(self.track_multiple_hit_moments_in_work_state) == "table" and self.track_multiple_hit_moments_in_work_state or nil, true)
					end
					self:PlayWorkingStateFXes(obj)
					fxes_played = true
					break
				end
			end
		end
	else
		if self.track_multiple_hit_moments_in_work_state then
			self:StopTrackingMultipleHitMoments()
		end
		
		local att_arr = self:GetAttaches() or {}
		table.insert(att_arr, 1, self)
		for i = 1, #(att_arr or "") do
			local obj = att_arr[i]
			if obj:HasEntity() then
				if obj:HasState("end") then
					self.anim_control_thread = CreateGameTimeThread(function()
						if not IsValid(obj) then
							return
						end
						local anim_phase = 0
						local dur = GetAnimDuration(obj:GetEntity(), "end")
						if self.wait_working_anims_to_finish then --wait current to end, start next
							local wait_till_end = GetAnimDuration(obj:GetEntity(), obj:GetAnim(1)) - obj:GetAnimPhase(1)
							wait_till_end = MulDivRound(wait_till_end, 1000, obj:GetAnimSpeedModifier())
							Sleep(wait_till_end)
							if not IsValid(obj) then
								return
							end
						elseif obj:HasAnim("start") then
							local his_dur = Min(GetAnimDuration(obj:GetEntity(), "start"), dur)
							anim_phase = Clamp(his_dur - obj:GetAnimPhase(1), 0, dur)
							dur = dur - anim_phase
						end
						if not self.wait_working_anims_to_finish or not obj:HasAnim("end") then
							obj:SetAnim(1, "end", const.eDontCrossfade)
							obj:SetAnimPhase(1, anim_phase)
							dur = MulDivRound(dur, 1000, obj:GetAnimSpeedModifier())
							Sleep(dur)
						end
						if IsValid(obj) then
							obj:SetAnim(1, "idle", const.eDontCrossfade)
							obj:SetAnimPhase(1, 0)
						end
						self:PlayWorkingStateFXes(obj)
					end)
					fxes_played = true
					break
				elseif obj:HasAnim("working") then --is playing anim onb any channel
					obj:SetAnimSpeed(1, 0) --this way we don't blend/snap to idle
					--obj:SetAnim(1, "idle", const.eDontCrossfade) --this way we snap to idle.
					self:PlayWorkingStateFXes(obj)
					fxes_played = true
					break
				end
			end
		end
	end
	
	if not fxes_played then
		self:PlayWorkingStateFXes()
	end
end

function SavegameFixups.DeleteSomeParticles(meta, rev)
	if rev >= 243381 and rev < 243739 then
		local names = {}
		ForEachPresetExtended("FXPreset", function(preset)
			if not IsKindOf(preset, "ActionFXParticles") then return end
			
			if preset.Action == "Working" then
				names[preset.Particles] = true
			end
		end)
		MapForEach("map", "ParSystem", function(p)
			if names[p:GetParticlesName()] then
				DoneObject(p)
			end
		end)
		
		MapForEach("map", "Building", function(b)
			if IsKindOf(b, "OpenPasture") and not b.maintenance_resource_request then
				--very special fix for 0143323
				local connected = #b.command_centers > 0
				if connected then
					b:DisconnectFromCommandCenters()
				end
				b:InitMaintenanceRequests() 
				if connected then
					b:ConnectToCommandCenters()
				end
				b:Repair()
			end
			if not IsKindOfClasses(b, "ArtificialSun", "Passage", "PassageGridElement") and b.ui_working then
				--turn it off and on again
				b:SetUIWorking(false)
				ExecLaterPushObject(b, b.SetUIWorking, 0, 1, true)
			end
		end)
	end
end

--from fvh
local hit_moments = {}
for i = 1, 2 do hit_moments[i] = "hit-moment" .. i end
function OnMsg.GatherFXMoments(list)
	table.iappend(list, hit_moments)
end

function BaseBuilding:StopTrackingMultipleHitMoments()
	if IsValidThread(self.track_multiple_hit_thread) then
		DeleteThread(self.track_multiple_hit_thread)
	end
end

function BaseBuilding:TrackMultipleHitMoments(obj, actionFXClass, max, override_hit_moments, repeat_hit_table, repeat_anim)
	--use max for early termination (for example if you want to track less moments then the anim actually has, or if the anim is looping)
	--use override_hit_moments if you want a different list of hit moment enumaration then the one above.
	--use repeat_hit_table when you want the hit_moment_table to get repeated when i > #hit_moment_table, useful for left/right moments for example.
	--use repeat_anim when you have the animation looped (from code and not exported as looped) and want to process the hit moments as long as it plays
	self:StopTrackingMultipleHitMoments()

	self.track_multiple_hit_thread = CreateGameTimeThread(function(self, obj)
		local anim = obj:GetAnim(1)
		local number_of_hits = obj:GetAnimMomentsCount(anim, "Hit")
		if number_of_hits == 0 then
			return
		end
		local i = 1
		local hit_moment_table = override_hit_moments or hit_moments
		while max == nil or i <= max do
			local phase = obj:GetAnimMoment(obj:GetAnim(1), "Hit", i)
			i = ((i - 1) % number_of_hits) + 1
			if not phase and repeat_anim then
				local dur = obj:GetAnimDuration() - 1
				local to_wait = dur - obj:GetAnimPhase()
				assert(to_wait > 0)
				Sleep(to_wait)
				if not IsValid(obj) or obj:GetAnim(1) ~= anim then
					break
				end
				obj:SetAnimPhase(1, 0)
				i = 1
				phase = obj:GetAnimMoment(obj:GetAnim(1), "Hit", i)
				-- recheck below in case the animation has no hit moments at all
			end
			if not phase then 
				break 
			end
			if phase >= obj:GetAnimPhase() then
				AnimMomentHook.WaitAnimMoment(obj, "Hit") --sleep
				if not IsValid(obj) or obj:GetAnim(1) ~= anim then break end
				PlayFX(actionFXClass, hit_moment_table[repeat_hit_table and ((i-1)%#hit_moment_table+1) or i], self, obj)
			end
			i = i + 1
		end
	end, self, obj)
end

--[[@@@
Building event called when the working state of a building changes. This is an [auto resolve](LuaClasses.md.html#toc1.3) method.

@function void BaseBuilding@OnSetWorking(bool working)
@param bool working - The value of the new state of working ( it is == to self.working, but faster to access ).
--]]
function BaseBuilding:OnSetWorking(working)
	if working then
		self:AttachSign(false, "SignNotWorking")
	end
	if not self.refreshing_working_state then
		self:Notify("UpdateWorkingStateAnim")
	end
	RebuildInfopanel(self)
end

function BaseBuilding:Gossip(gossip, ...)
	if not netAllowGossip then return end
	NetGossip("BaseBuilding", self.class, self.handle, gossip, GameTime(), ...)
end

function BaseBuilding:GossipName()
	return self.class
end