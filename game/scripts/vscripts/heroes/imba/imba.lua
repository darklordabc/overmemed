--[[ 	LITERALLY DOTA IMBA
		Author: Firetoad
		Date: 07.03.2017	]]

function MemeArrow(keys)
	local caster = keys.caster
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1
	local target = keys.target_points[1]

	-- Parameters
	local caster_loc = caster:GetAbsOrigin()
	local cast_direction = (target - caster_loc):Normalized()
	local arrow_particle = "particles/units/heroes/hero_mirana/mirana_spell_arrow.vpcf"
	local arrow_speed = ability:GetLevelSpecialValueFor("arrow_speed", ability_level)
	local arrow_width = ability:GetLevelSpecialValueFor("arrow_width", ability_level)
	local vision_radius = ability:GetLevelSpecialValueFor("arrow_vision", ability_level)
	local arrow_amount = ability:GetLevelSpecialValueFor("arrow_amount", ability_level)

	-- Play sound
	caster:EmitSound("Hero_Mirana.ArrowCast")

	-- Arrow projectile setup
	local arrow_projectile = {
		Ability				= ability,
		EffectName			= arrow_particle,
		vSpawnOrigin		= caster_loc,
		fDistance			= 5000,
		fStartRadius		= arrow_width,
		fEndRadius			= arrow_width,
		Source				= caster,
		bHasFrontalCone		= false,
		bReplaceExisting	= false,
		iUnitTargetTeam		= DOTA_UNIT_TARGET_TEAM_ENEMY,
	--	iUnitTargetFlags	= ,
		iUnitTargetType		= DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
	--	fExpireTime			= ,
		bDeleteOnHit		= true,
		vVelocity			= cast_direction * arrow_speed,
		bProvidesVision		= true,
		iVisionRadius		= vision_radius,
		iVisionTeamNumber	= caster:GetTeamNumber(),
	}

	-- Determine arrow directions
	local arrow_direction
	local first_angle = -6 * (arrow_amount - 1) / 2
	for i = 1, arrow_amount do
		arrow_direction = (RotatePosition(caster_loc, QAngle(0, first_angle + (i-1) * 6, 0), target) - caster_loc):Normalized()
		print(arrow_direction)
		arrow_projectile.vVelocity = Vector(arrow_direction.x, arrow_direction.y, 0) * arrow_speed
		ProjectileManager:CreateLinearProjectile(arrow_projectile)
	end
end

function MemeArrowHit(keys)
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Parameters
	local caster_loc = caster:GetAbsOrigin()
	local target_loc = target:GetAbsOrigin()
	local arrow_max_stunrange = ability:GetLevelSpecialValueFor("arrow_max_stunrange", ability_level)
	local arrow_min_stun = ability:GetLevelSpecialValueFor("arrow_min_stun", ability_level)
	local arrow_max_stun = ability:GetLevelSpecialValueFor("arrow_max_stun", ability_level)
	local base_damage = ability:GetLevelSpecialValueFor("base_damage", ability_level)
	local arrow_bonus_damage = ability:GetLevelSpecialValueFor("arrow_bonus_damage", ability_level)
	local vision_duration = ability:GetLevelSpecialValueFor("vision_duration", ability_level)
	local vision_radius = ability:GetLevelSpecialValueFor("arrow_vision", ability_level)

	-- Calculate damage
	local distance = (target_loc - caster_loc):Length2D()
	local damage = base_damage + arrow_bonus_damage * distance / 5000
	local stun_time = arrow_min_stun + math.min((arrow_max_stun - arrow_min_stun) * distance / 5000, arrow_max_stun - arrow_min_stun)

	-- Play impact sound
	target:EmitSound("Hero_Mirana.ArrowImpact")

	-- Damage
	ApplyDamage({attacker = caster, victim = target, ability = ability, damage = damage, damage_type = DAMAGE_TYPE_MAGICAL})

	-- Stun
	target:AddNewModifier(caster, ability, "modifier_stunned", {duration = stun_time})
end

function MemeCrit(keys)
	local caster = keys.caster
	local target = keys.unit
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Parameters
	local kill_chance = ability:GetLevelSpecialValueFor("kill_chance", ability_level)

	-- Roll for kill chance
	local rand = math.random
	if rand(100) <= kill_chance then
		ApplyDamage({attacker = caster, victim = target, ability = ability, damage = 999999, damage_type = DAMAGE_TYPE_PURE})
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_CRITICAL, target, 999999, nil)
		target:EmitSound("Hero_PhantomAssassin.CoupDeGrace")

		-- Global effect when killing a real hero
		if target:IsRealHero() then

			-- Play screen blood particle
			local blood_pfx = ParticleManager:CreateParticle("particles/units/heroes/imba/screen_blood_splatter.vpcf", PATTACH_EYES_FOLLOW, target)

			-- Play global sound
			EmitGlobalSound("Overmemed.MiranaMemeCrit")
		end
	end
end