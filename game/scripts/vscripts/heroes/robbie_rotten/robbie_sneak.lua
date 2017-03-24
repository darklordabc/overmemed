robbie_sneak = class({})
LinkLuaModifier( "modifier_robbie_sneak", "heroes/robbie_rotten/modifier_robbie_sneak.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_robbie_sneak_active", "heroes/robbie_rotten/modifier_robbie_sneak_active.lua", LUA_MODIFIER_MOTION_NONE )

function robbie_sneak:GetIntrinsicModifierName()
	return "modifier_robbie_sneak"
end