DefineClass.BombardMissile = {
	__parents = { "FXRocket", "BaseMeteorLarge" },
	entity = "DefenceTurretRocket",
	speed = 150*guim, -- travel speed
	range = 35*guim, -- destruction radius
	deposit_type = false,
	explode_decal_name = "DecRocketSplatter",
	explode_decal_fade = const.DayDuration,
}

function BombardMissile:Init()
	self:SetScale(500)
	self:SetColorModifier(RGB(255, 255, 255))
end

function BombardMissile:Done()
	Msg(self)
end

function BombardMissile:Fall()
end

function BombardMissile:SpawnPrefab()
end

function BombardMissile:SpawnDeposit()
end

function BombardMissile:Predict()
end

function BombardMissile:ExplodeInAir()
	Msg(self, true)
end

local function GenerateDir(dir, angle)
	local min, max = 45 * 60, 90 * 60
	dir = dir or point(UICity:Random(-4096, 4096), UICity:Random(-4096, 4096))
	angle = angle and Clamp(angle + UICity:Random(-10 * 60, 10 * 60), min, max) or UICity:Random(min, max)
	local s, c = sin(angle), cos(angle)
	if c == 0 then
		dir = point(0, 0, 4096)
	else
		dir = dir:SetZ(MulDivRound(dir:Len2D(), s, c))
	end
	
	return dir, angle
end

GlobalVar("g_IncomingMissiles", {}, weak_keys_meta)
local travel_dist = 1000*guim

function WaitBombard(obj, radius, count, delay_min, delay_max)
	local pos = IsValid(obj) and obj:GetPos() or IsPoint(obj) and obj or GetRandomPassable()
	if not pos then
		assert(false, "Failed to find bombard pos!")
		return false
	end
	PlayFX("Bombard", "start")
	radius = radius or 0
	delay_min = delay_min or 0
	delay_max = delay_max or 0
	count = count or 1
	local spawned = {}
	local hits = 0
	local dir, angle = GenerateDir()
	AddOnScreenNotification("Bombardment", nil, {}, {pos})
	local max_travel_time = 0
	while count > 0 do
		count = count - 1
		local dest_pos = GetRandomPassableAround(pos, radius) or GetRandomPassable()
		if not dest_pos then
			break
		end
		dest_pos = dest_pos:SetZ(terrain.GetHeight(dest_pos))
		local spawn_dir = GenerateDir(dir, angle)
		local spawn_pos = dest_pos + SetLen(dir, travel_dist)
		local missile = PlaceObject("BombardMissile", {start = spawn_pos, dest = dest_pos})
		missile:SetPos(spawn_pos)
		local dome, dome_pt, dome_normal = missile:HitsDome()
		if dome_pt then
			dest_pos = dome_pt
			missile.dest = dome_pt
		end
		local travel_time = missile:GetTimeToImpact()
		missile:SetPos(dest_pos, travel_time)
		local dir = dest_pos - spawn_pos
		local norm_dir = point(dir:y(), -dir:x(), 0)
		missile:SetAxis(norm_dir)
		missile:SetAngle(-90*60 + atan(dir:z(), dir:Len2D()))
		spawned[missile] = true
		g_IncomingMissiles[missile] = true
		CreateGameTimeThread(function()
			Msg("IncomingMissile", missile)
			PlayFX("Move", "start", missile, nil, nil, dir)
			local interrupted, intercepted = WaitMsg(missile, travel_time)
			PlayFX("Move", "end", missile, nil, nil, dir)
			if intercepted then
				PlayFX("AirExplosion", "start", missile)
			elseif dome_pt then
				PlayFX("DomeExplosion", "start", missile)
				missile:CrackDome(dome, dome_pt, dome_normal)
			elseif not interrupted then
				PlayFX("GroundExplosion", "start", missile)
				missile:Explode()
			end
			g_IncomingMissiles[missile] = nil
			if IsValid(missile) then
				DoneObject(missile)
			end
			Msg("BombardMissileHit")
			if not interrupted and not dome_pt then
				ForEach{
					class = missile.explode_decal_name,
					area = dest_pos,
					arearadius = 20*guim,
					action = "delete",
				}
				local explode_decal = PlaceObject(missile.explode_decal_name)
				explode_decal:SetPos(dest_pos)
				explode_decal:SetAngle(AsyncRand(360*60))
				explode_decal:SetScale(50 + AsyncRand(50))
				local fade_time = missile.explode_decal_fade	
				for opacity = 100, 0, -5 do
					Sleep(fade_time / 20)
					if not IsValid(explode_decal) then return end
					explode_decal:SetOpacity(opacity)
				end
				DoneObject(explode_decal)
			end
		end)
		Sleep(UICity:Random(delay_min, delay_max))
	end
	while true do
		local rockets = 0
		for missile in pairs(spawned) do
			if IsValid(missile) then
				rockets = rockets + 1
			end
		end
		if rockets == 0 then
			break
		end
		WaitMsg("BombardMissileHit", 10000)
	end
	PlayFX("Bombard", "end")
	RemoveOnScreenNotification("Bombardment")
end

function StartBombard(obj, radius, count, delay_min, delay_max)
	CreateGameTimeThread(function()
		WaitBombard(obj, radius, count, delay_min, delay_max)
		Msg("BombardEnd", obj)
	end)
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "BombardMissile"
end
function OnMsg.GatherFXActions(list)
	list[#list + 1] = "AirExplosion"
	list[#list + 1] = "DomeExplosion"
	list[#list + 1] = "GroundExplosion"
end


if Platform.developer then

function TestBombard(...)
	StartBombard(GetTerrainCursor(), ...)
end

end