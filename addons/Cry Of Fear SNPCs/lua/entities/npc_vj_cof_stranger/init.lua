AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/stranger/stranger.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_stranger_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = false
ENT.FootstepSoundTimerRun = 0.8
ENT.FootstepSoundTimerWalk = 0.8
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 1.45
ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true
ENT.ConstantlyFaceEnemy_Postures = "Standing"
ENT.ConstantlyFaceEnemy_MinDistance = 2500
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 2500
ENT.LimitChaseDistance_Min = 1

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Breath = {"stranger/st_voiceloop.wav"}
ENT.SoundTbl_Death = {"stranger/st_death.wav"}

ENT.FootstepSoundLevel = 75
ENT.BreathSoundLevel = 75
//ENT.RangeAttackSoundLevel = 100

-- Custom
ENT.Stranger_DamageDistance = 2500
ENT.Stranger_NextEnemyDamage = 0

util.AddNetworkString("vj_stranger_dodamage")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_StartDmg()
	net.Start("vj_stranger_dodamage")
	net.WriteEntity(self)
	net.WriteEntity(self:GetEnemy())
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if self.Dead or GetConVarNumber("vj_npc_range") == 0 then self.LimitChaseDistance = false return end
	if self:GetPos():Distance(enemy:GetPos()) > self.Stranger_DamageDistance or !self.EnemyData.Visible then return end
	if CurTime() > self.Stranger_NextEnemyDamage then
		self:StopMoving()
		enemy:TakeDamage(5, self, self)
		if enemy:IsPlayer() then self:Stranger_StartDmg() end
		self.Stranger_NextEnemyDamage = CurTime() + 0.5
	end
end