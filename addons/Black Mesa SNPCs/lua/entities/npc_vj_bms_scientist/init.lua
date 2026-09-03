AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/humans/scientist.mdl"
ENT.StartHealth = 60
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_BLACK_MESA_PERSONNEL", "CLASS_PLAYER_ALLY"}
ENT.Behavior = VJ_BEHAVIOR_PASSIVE
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.AlliedWithPlayerAllies = true
ENT.BecomeEnemyToPlayer = 2
ENT.DropDeathLoot = false
ENT.HasOnPlayerSight = true
ENT.OnPlayerSightDispositionLevel = 1
ENT.FootstepSoundTimerRun = 0.4
ENT.FootstepSoundTimerWalk = 0.5

ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav", "npc/footsteps/hardboot_generic2.wav", "npc/footsteps/hardboot_generic3.wav", "npc/footsteps/hardboot_generic4.wav", "npc/footsteps/hardboot_generic5.wav", "npc/footsteps/hardboot_generic6.wav", }
ENT.SoundTbl_Idle = {"vj_bms_scientistmale/Idle1.wav", "vj_bms_scientistmale/Idle2.wav", "vj_bms_scientistmale/Idle3.wav", "vj_bms_scientistmale/Idle4.wav", "vj_bms_scientistmale/Idle5.wav", "vj_bms_scientistmale/Idle6.wav", "vj_bms_scientistmale/Idle7.wav", "vj_bms_scientistmale/Idle8.wav", "vj_bms_scientistmale/Idle9.wav", "vj_bms_scientistmale/Idle10.wav", "vj_bms_scientistmale/Idle11.wav", "vj_bms_scientistmale/Idle12.wav"}
ENT.SoundTbl_Alert = {"vj_bms_scientistmale/alert1.wav", "vj_bms_scientistmale/alert2.wav", "vj_bms_scientistmale/alert3.wav", "vj_bms_scientistmale/alert4.wav", "vj_bms_scientistmale/alert5.wav", "vj_bms_scientistmale/alert6.wav"}
ENT.SoundTbl_CombatIdle = {"vj_bms_scientistmale/attack1.wav", "vj_bms_scientistmale/attack2.wav", "vj_bms_scientistmale/attack3.wav", "vj_bms_scientistmale/attack4.wav", "vj_bms_scientistmale/attack5.wav", "vj_bms_scientistmale/attack6.wav", "vj_bms_scientistmale/attack7.wav", "vj_bms_scientistmale/attack8.wav", "vj_bms_scientistmale/attack9.wav", "vj_bms_scientistmale/attack10.wav", "vj_bms_scientistmale/attack11.wav", "vj_bms_scientistmale/attack12.wav", }
ENT.SoundTbl_GrenadeSight = {"vj_bms_scientistmale/nade1.wav", "vj_bms_scientistmale/nade2.wav", "vj_bms_scientistmale/nade3.wav", "vj_bms_scientistmale/nade4.wav", "vj_bms_scientistmale/nade5.wav", "vj_bms_scientistmale/nade6.wav"}
ENT.SoundTbl_Pain = {"vj_bms_scientistmale/die1.wav", "vj_bms_scientistmale/die2.wav", "vj_bms_scientistmale/die3.wav", "vj_bms_scientistmale/die4.wav", "vj_bms_scientistmale/die5.wav", "vj_bms_scientistmale/die6.wav"}
ENT.SoundTbl_Death = {"vj_bms_scientistmale/die1.wav", "vj_bms_scientistmale/die2.wav", "vj_bms_scientistmale/die3.wav", "vj_bms_scientistmale/die4.wav", "vj_bms_scientistmale/die5.wav", "vj_bms_scientistmale/die6.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_bms_scientistmale/startfollowing1.wav", "vj_bms_scientistmale/startfollowing2.wav", "vj_bms_scientistmale/startfollowing3.wav", "vj_bms_scientistmale/startfollowing4.wav", "vj_bms_scientistmale/startfollowing5.wav", "vj_bms_scientistmale/startfollowing6.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_bms_scientistmale/stopfollowing1.wav", "vj_bms_scientistmale/stopfollowing2.wav", "vj_bms_scientistmale/stopfollowing3.wav", "vj_bms_scientistmale/stopfollowing4.wav", "vj_bms_scientistmale/stopfollowing5.wav", "vj_bms_scientistmale/stopfollowing6.wav"}
ENT.SoundTbl_OnPlayerSight = {"vj_bms_scientistmale/sawplayer1.wav", "vj_bms_scientistmale/sawplayer2.wav", "vj_bms_scientistmale/sawplayer3.wav", "vj_bms_scientistmale/sawplayer4.wav", "vj_bms_scientistmale/sawplayer5.wav", "vj_bms_scientistmale/sawplayer6.wav", }
ENT.SoundTbl_DamageByPlayer = {"vj_bms_scientistmale/stupidplayer1.wav", "vj_bms_scientistmale/stupidplayer2.wav", "vj_bms_scientistmale/stupidplayer3.wav", "vj_bms_scientistmale/stupidplayer4.wav", "vj_bms_scientistmale/stupidplayer5.wav", "vj_bms_scientistmale/stupidplayer6.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetSkin(math.random(0, 14))
	if math.random(1, 2) == 1 then
		self:SetBodygroup(2, math.random(1, 5))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorRed)
		effectData:SetScale(120)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 68)), Ang=self:GetAngles()+Angle(0, -90, 0)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 65)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 3, 65)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, 100)+self:GetForward()*math.Rand(-100, 100)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/right_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 7, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-350, -550)+self:GetForward()*math.Rand(-500, 500)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/left_leg.mdl", {Pos=self:LocalToWorld(Vector(0, -7, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(350, 550)+self:GetForward()*math.Rand(-500, 500)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/right_arm.mdl", {Pos=self:LocalToWorld(Vector(0, -3, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/left_arm.mdl", {Pos=self:LocalToWorld(Vector(0, 2, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 31))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 32))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if self:GetBodygroup(3) == 1 then
		self:CreateExtraDeathCorpse("prop_physics", "models/humans/props/scientist_syringe.mdl", {Pos=self:LocalToWorld(Vector(0, 12, 0))})
		corpse:SetBodygroup(3, 0)
	end
	
	if self:GetBodygroup(2) == 4 then
		self:CreateExtraDeathCorpse("prop_physics", "models/props_office/pencil.mdl", {Pos=self:GetAttachment(self:LookupAttachment("eyes")).Pos + self:GetRight()*-2.5})
		corpse:SetBodygroup(2, 0)
	end
end