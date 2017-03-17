function Allvision( keys )
	local caster = keys.caster
	local pos = caster:GetAbsOrigin()
	local ability = keys.ability
	local duration = keys.time
	local modifier = keys.modifier_vision
	local team = caster:GetTeamNumber()

	local alliedHeroes = FindUnitsInRadius(team, pos, nil, FIND_UNITS_EVERYWHERE, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

	for _,hero in pairs(alliedHeroes) do
		ability:ApplyDataDrivenModifier(caster, hero, modifier, {duration=keys.time})
	end
end