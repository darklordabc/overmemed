function AmbulanceUpdate( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier_heal_aura = keys.modifier_heal_aura
	local modifier_ms_aura = keys.modifier_ms_aura
	local time = GameRules:GetTimeOfDay()

	-- Remove the old modifier
	caster:RemoveModifierByName(modifier_heal_aura)
	caster:RemoveModifierByName(modifier_ms_aura)

	--for some reason at the start of the game, timeofday does not match the lighting, so reverse
	if caster.toggleused == nil then
		time = 1 - GameRules:GetTimeOfDay()
	end

	--its nighttime
	if time < 0.5 then
		-- Re-apply an updated version of the ms aura
		ability:ApplyDataDrivenModifier(caster, caster, modifier_ms_aura, {})
	else
		-- Re-apply an updated version of the heal aura
		ability:ApplyDataDrivenModifier(caster, caster, modifier_heal_aura, {})
	end
end

function CheckDayNight( keys )
	local caster = keys.caster
	local ability = keys.ability
	local modifier_heal_aura = keys.modifier_heal_aura
	local modifier_ms_aura = keys.modifier_ms_aura
	local time = GameRules:GetTimeOfDay()

	-- Remove the old modifier
	
	caster:RemoveModifierByName(modifier_ms_aura)

	--for some reason at the start of the game, timeofday does not match the lighting, so reverse
	if caster.toggleused == nil then
		time = 1 - GameRules:GetTimeOfDay()
	end

	--its nighttime
	if time < 0.5 then
		if caster:HasModifier(modifier_ms_aura) then
		else 
			caster:RemoveModifierByName(modifier_heal_aura)
			-- Re-apply an updated version of the ms aura
			ability:ApplyDataDrivenModifier(caster, caster, modifier_ms_aura, {})
		end
	else
		if caster:HasModifier(modifier_heal_aura) then
		else 
			caster:RemoveModifierByName(modifier_ms_aura)
			-- Re-apply an updated version of the ms aura
			ability:ApplyDataDrivenModifier(caster, caster, modifier_heal_aura, {})
		end
	end
end