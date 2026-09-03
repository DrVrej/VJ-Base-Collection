AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_zombies/slow1.mdl", "models/vj_zombies/slow2.mdl", "models/vj_zombies/slow3.mdl", "models/vj_zombies/slow4.mdl", "models/vj_zombies/slow5.mdl", "models/vj_zombies/slow6.mdl", "models/vj_zombies/slow7.mdl", "models/vj_zombies/slow8.mdl", "models/vj_zombies/slow9.mdl", "models/vj_zombies/slow10.mdl", "models/vj_zombies/slow11.mdl", "models/vj_zombies/slow12.mdl"}
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attacka", "vjseq_attackb", "vjseq_attackc", "vjseq_attackd", "vjseq_attacke", "vjseq_attackf"}
ENT.MeleeAttackDistance = 32
ENT.MeleeAttackDamageDistance = 65
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackBleedEnemy = true
ENT.DisableFootStepSoundTimer = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = "vjges_flinch_head"},
	{HitGroup = HITGROUP_CHEST, Animation = "vjges_flinch_chest"},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_flinch_leftArm"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_flinch_rightArm"},
	{HitGroup = HITGROUP_LEFTLEG, Animation = ACT_FLINCH_LEFTLEG},
	{HitGroup = HITGROUP_RIGHTLEG, Animation = ACT_FLINCH_RIGHTLEG}
}

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_zombies/slow/idle1.wav", "vj_zombies/slow/idle2.wav", "vj_zombies/slow/idle3.wav", "vj_zombies/slow/idle4.wav", "vj_zombies/slow/idle5.wav", "vj_zombies/slow/idle6.wav"}
ENT.SoundTbl_Alert = {"vj_zombies/slow/alert1.wav", "vj_zombies/slow/alert2.wav", "vj_zombies/slow/alert3.wav", "vj_zombies/slow/alert4.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_zombies/slow/attack1.wav", "vj_zombies/slow/attack2.wav", "vj_zombies/slow/attack3.wav", "vj_zombies/slow/attack4.wav", "vj_zombies/slow/attack5.wav", "vj_zombies/slow/attack6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_Pain = {"vj_zombies/slow/pain1.wav", "vj_zombies/slow/pain2.wav", "vj_zombies/slow/pain3.wav", "vj_zombies/slow/pain4.wav", "vj_zombies/slow/pain5.wav", "vj_zombies/slow/pain6.wav", "vj_zombies/slow/pain7.wav", "vj_zombies/slow/pain8.wav"}
ENT.SoundTbl_Death = {"vj_zombies/slow/die1.wav", "vj_zombies/slow/die2.wav", "vj_zombies/slow/die3.wav", "vj_zombies/slow/die4.wav", "vj_zombies/slow/die5.wav", "vj_zombies/slow/die6.wav"}

local sdFootScuff = {"npc/zombie/foot_slide1.wav", "npc/zombie/foot_slide2.wav", "npc/zombie/foot_slide3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
-- "vjseq_attacka", "vjseq_attackb", "vjseq_attackc", "vjseq_attackd", "vjseq_attacke", "vjseq_attackf"   |   Unused (Faster): "vjseq_swatrightmid", "vjseq_swatleftmid"
-- "vjseq_attacke", "vjseq_attackf"   |   Unused (Faster): "vjseq_swatleftlow", "vjseq_swatrightlow"
--
function ENT:OnInput(key, activator, caller, data)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "scuff" then
		self:PlayFootstepSound(sdFootScuff)
	elseif key == "melee" then
		self.MeleeAttackDamage = 20
		self:ExecuteMeleeAttack()
	elseif key == "melee_heavy" then
		self.MeleeAttackDamage = 30
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if self:IsOnFire() then
		if act == ACT_IDLE then
			return ACT_IDLE_ON_FIRE
		elseif act == ACT_RUN or act == ACT_WALK then
			return ACT_WALK_ON_FIRE
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end