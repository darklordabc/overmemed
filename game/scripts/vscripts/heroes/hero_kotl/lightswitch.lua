function toggleOn(keys)
	local ability = keys.ability
	local caster = keys.caster
	GameRules:SetTimeOfDay(0)
	caster.toggleused = true
end

function toggleOff(keys)
	local ability = keys.ability
	local caster = keys.caster
	GameRules:SetTimeOfDay(0.5)
	caster.toggleused = true
end