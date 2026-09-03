AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/watro/watro.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_watro_h")
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackAnimationFaceEnemy = false
ENT.MeleeAttackDistance = 120
ENT.MeleeAttackDamageDistance = 180
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 1.4
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_watro_d")
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 0.8

ENT.SoundTbl_MeleeAttack = {"watro/watro_hit.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"watro/watro_swing.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	//self:DrawShadow(false)
	self:SetPos(self:GetPos() + self:GetUp()*30)
	self:SetCollisionBounds(Vector(30, 30, 100), Vector(-30, -30, -50))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		self:DrawShadow(false)
	end
end