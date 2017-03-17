modifier_robbie_sneak = class({})

function modifier_robbie_sneak:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_UNIT_MOVED,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ABILITY_EXECUTED,
	}
 
	return funcs
end

function modifier_robbie_sneak:OnCreated()
	if IsClient() then return end
	
	local ability = self:GetAbility()
	local delay = ability:GetLevelSpecialValueFor("sneak_delay", ability:GetLevel() - 1)
	
	self:StartIntervalThink(delay)
end

function modifier_robbie_sneak:OnUnitMoved(event)
	if IsClient() then return end
	local parent = self:GetParent()

	--OnUnitMoved actually responds to ALL units. Return immediately if not the modifier's parent.
	if event.unit then
		if event.unit:GetEntityIndex() ~= parent:GetEntityIndex() then
			return
		end
	else
		return
	end
	
	local ability = self:GetAbility()
	local delay = ability:GetLevelSpecialValueFor("sneak_delay", ability:GetLevel() - 1)
	
	self:StartIntervalThink(delay)
end

function modifier_robbie_sneak:OnAttack(event)
	if IsClient() then return end
	local parent = self:GetParent()
	
	--actually responds to ALL units. Return immediately if not the modifier's parent.
	if event.attacker then
		if event.attacker:GetEntityIndex() ~= parent:GetEntityIndex() then
			return
		end
	else
		return
	end
	
	local ability = self:GetAbility()
	local delay = ability:GetLevelSpecialValueFor("sneak_delay", ability:GetLevel() - 1)
	
	self:StartIntervalThink(delay)
end


function modifier_robbie_sneak:OnAbilityExecuted(event)
	if IsClient() then return end
	local parent = self:GetParent()

	--actually responds to ALL units. Return immediately if not the modifier's parent.
	if event.unit then
		if event.unit:GetEntityIndex() ~= parent:GetEntityIndex() then
			return
		end
	else
		return
	end
	
	local ability = self:GetAbility()
	local delay = ability:GetLevelSpecialValueFor("sneak_delay", ability:GetLevel() - 1)
	
	self:StartIntervalThink(delay)
end


function modifier_robbie_sneak:OnIntervalThink()
	if IsClient() then return end
	
	local parent = self:GetParent()
	local ability = self:GetAbility()
	parent:AddNewModifier(self:GetCaster(), ability, "modifier_robbie_sneak_active", {})
end

function modifier_robbie_sneak:IsHidden()
	return true
end

function modifier_robbie_sneak:IsDebuff()
	return false
end

function modifier_robbie_sneak:IsPurgable()
	return false
end