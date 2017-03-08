--[[ utility_functions.lua ]]

---------------------------------------------------------------------------
-- Handle messages
---------------------------------------------------------------------------
function BroadcastMessage( sMessage, fDuration )
    local centerMessage = {
        message = sMessage,
        duration = fDuration
    }
    FireGameEvent( "show_center_message", centerMessage )
end

function PickRandomShuffle( reference_list, bucket )
    if ( #reference_list == 0 ) then
        return nil
    end
    
    if ( #bucket == 0 ) then
        -- ran out of options, refill the bucket from the reference
        for k, v in pairs(reference_list) do
            bucket[k] = v
        end
    end

    -- pick a value from the bucket and remove it
    local pick_index = RandomInt( 1, #bucket )
    local result = bucket[ pick_index ]
    table.remove( bucket, pick_index )
    return result
end

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function ShuffledList( orig_list )
	local list = shallowcopy( orig_list )
	local result = {}
	local count = #list
	for i = 1, count do
		local pick = RandomInt( 1, #list )
		result[ #result + 1 ] = list[ pick ]
		table.remove( list, pick )
	end
	return result
end

function TableCount( t )
	local n = 0
	for _ in pairs( t ) do
		n = n + 1
	end
	return n
end

function TableFindKey( table, val )
	if table == nil then
		print( "nil" )
		return nil
	end

	for k, v in pairs( table ) do
		if v == val then
			return k
		end
	end
	return nil
end

function CountdownTimer()
    nCOUNTDOWNTIMER = nCOUNTDOWNTIMER - 1
    local t = nCOUNTDOWNTIMER
    --print( t )
    local minutes = math.floor(t / 60)
    local seconds = t - (minutes * 60)
    local m10 = math.floor(minutes / 10)
    local m01 = minutes - (m10 * 10)
    local s10 = math.floor(seconds / 10)
    local s01 = seconds - (s10 * 10)
    local broadcast_gametimer = 
        {
            timer_minute_10 = m10,
            timer_minute_01 = m01,
            timer_second_10 = s10,
            timer_second_01 = s01,
        }
    CustomGameEventManager:Send_ServerToAllClients( "countdown", broadcast_gametimer )
    if t <= 120 then
        CustomGameEventManager:Send_ServerToAllClients( "time_remaining", broadcast_gametimer )
    end
end

function SetTimer( cmdName, time )
    print( "Set the timer to: " .. time )
    nCOUNTDOWNTIMER = time
end

-- Skeleton king cosmetics
function SkeletonKingWearables(spawnedUnit)

    -- Cape
    Attachments:AttachProp(spawnedUnit, "attach_hitloc", "models/items/wraith_king/regalia_of_the_bonelord_cape.vmdl", 1.0)

    -- Shoulderpiece
    Attachments:AttachProp(spawnedUnit, "attach_hitloc", "models/heroes/wraith_king/wraith_king_shoulder.vmdl", 1.0)

    -- Crown
    Attachments:AttachProp(spawnedUnit, "attach_head", "models/items/wraith_king/kings_spite_head/kings_spite_head.vmdl", 1.0)

    -- Chest
    Attachments:AttachProp(spawnedUnit, "attach_hitloc", "models/heroes/wraith_king/wraith_king_chest.vmdl", 1.0)

    -- Gauntlet
--  Attachments:AttachProp(spawnedUnit, "attach_attack1", "models/heroes/wraith_king/wraith_king_gauntlet.vmdl", 1.0)

    -- Weapon
    Attachments:AttachProp(spawnedUnit, "attach_attack1", "models/items/skeleton_king/the_blood_shard/the_blood_shard.vmdl", 1.0)

    -- Eye particles
    local eye_pfx = ParticleManager:CreateParticle("particles/units/heroes/hero_skeletonking/skeletonking_eyes.vpcf", PATTACH_ABSORIGIN, spawnedUnit)
    ParticleManager:SetParticleControlEnt(eye_pfx, 0, spawnedUnit, PATTACH_POINT_FOLLOW, "attach_eyeL", spawnedUnit:GetAbsOrigin(), true)
    ParticleManager:SetParticleControlEnt(eye_pfx, 1, spawnedUnit, PATTACH_POINT_FOLLOW, "attach_eyeR", spawnedUnit:GetAbsOrigin(), true)
end
