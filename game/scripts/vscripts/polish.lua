-- Originally used in Tome items from From Angel Arena Reborn, borrowed by darklordabc from Redux
function UpgradeStats(keys)
	local caster = keys.caster
	--local cost = keys.ability:GetCost() 
	local str = keys.ability:GetSpecialValueFor("str")
	local agi = keys.ability:GetSpecialValueFor("agi")
	local int = keys.ability:GetSpecialValueFor("int")

	if not caster or not caster:IsRealHero() then return end

	if str then caster:ModifyStrength(str) end
	if agi then caster:ModifyAgility(agi) end
	if int then caster:ModifyIntellect(int) end

	local extraSize = agi * 0.015

	if caster:GetModelScale() < 4.0 then
		caster:SetModelScale(caster:GetModelScale() + extraSize)
	end

	if not caster.timesUsed then
		caster.timesUsed = 1 
	else
		caster.timesUsed = caster.timesUsed + 1
	end
	SendOverheadEventMessage(nil, OVERHEAD_ALERT_XP, caster, caster.timesUsed, nil)

	
end