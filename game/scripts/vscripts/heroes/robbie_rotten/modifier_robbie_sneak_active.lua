modifier_robbie_sneak_active = class({})

function modifier_robbie_sneak_active:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_UNIT_MOVED,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ABILITY_EXECUTED,
		MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
	}
 
	return funcs
end

function modifier_robbie_sneak_active:CheckState()
	local state = {
		[MODIFIER_STATE_INVISIBLE] = true,
	}
 
	return state
end

function modifier_robbie_sneak_active:OnCreated()
	if IsClient() then return end
	local parent = self:GetParent()
	
	EmitSoundOn("Hero_Treant.NaturesGuise.On", parent)
	local p = ParticleManager:CreateParticle("particles/generic_hero_status/status_invisibility_start.vpc", PATTACH_ABSORIGIN, parent)
	ParticleManager:ReleaseParticleIndex(p)
end

function modifier_robbie_sneak_active:OnUnitMoved(event)
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
	
	self:Destroy()
end

function modifier_robbie_sneak_active:OnAttack(event)
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
	
	self:Destroy()
end


function modifier_robbie_sneak_active:OnAbilityExecuted(event)
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
	
	self:Destroy()
end

function modifier_robbie_sneak_active:GetModifierInvisibilityLevel()
	return 1.0
end

function modifier_robbie_sneak_active:IsHidden()
	return false
end

function modifier_robbie_sneak_active:IsDebuff()
	return false
end

function modifier_robbie_sneak_active:IsPurgable()
	return true
end