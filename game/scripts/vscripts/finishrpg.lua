-- Originally used in Tome items from From Angel Arena Reborn, borrowed by darklordabc from Redux
function UpgradeStats(keys)
	local caster = keys.caster
	--local cost = keys.ability:GetCost() 
	local str = keys.ability:GetSpecialValueFor("str")
	local agi = keys.ability:GetSpecialValueFor("agi")
	local int = keys.ability:GetSpecialValueFor("int")

	if not caster or not caster:IsRealHero() then return end

	caster:ModifyStrength(200)
	caster:ModifyAgility(200)
	caster:ModifyIntellect(200)

	caster:SetModelScale(2)


	if not caster.timesUsed then
		caster.timesUsed = 1 
	else
		caster.timesUsed = caster.timesUsed + 1
	end
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_XP, caster, caster.timesUsed, nil)

	
end

function Check(keys)
	local caster = keys.caster
	--local cost = keys.ability:GetCost() 
	local str = keys.ability:GetSpecialValueFor("str")
	local agi = keys.ability:GetSpecialValueFor("agi")
	local int = keys.ability:GetSpecialValueFor("int")

	if not caster or not caster:IsRealHero() then return end

	if not caster:FindModifierByName("modifier_get_xp") then
		caster:Interrupt()
	end
	
end