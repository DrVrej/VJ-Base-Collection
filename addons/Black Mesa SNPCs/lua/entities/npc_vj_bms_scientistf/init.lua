AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/humans/scientist_female.mdl"
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
ENT.SoundTbl_Idle = {"vj_bms_scientistfemale/Idle1.wav", "vj_bms_scientistfemale/Idle2.wav", "vj_bms_scientistfemale/Idle3.wav", "vj_bms_scientistfemale/Idle4.wav", "vj_bms_scientistfemale/Idle5.wav", "vj_bms_scientistfemale/Idle6.wav", "vj_bms_scientistfemale/Idle7.wav", "vj_bms_scientistfemale/Idle8.wav", "vj_bms_scientistfemale/Idle9.wav", "vj_bms_scientistfemale/Idle10.wav", "vj_bms_scientistfemale/Idle11.wav", "vj_bms_scientistfemale/Idle12.wav"}
ENT.SoundTbl_Alert = {"vj_bms_scientistfemale/alert1.wav", "vj_bms_scientistfemale/alert2.wav", "vj_bms_scientistfemale/alert3.wav", "vj_bms_scientistfemale/alert4.wav", "vj_bms_scientistfemale/alert5.wav", "vj_bms_scientistfemale/alert6.wav"}
ENT.SoundTbl_CombatIdle = {"vj_bms_scientistfemale/attack1.wav", "vj_bms_scientistfemale/attack2.wav", "vj_bms_scientistfemale/attack3.wav", "vj_bms_scientistfemale/attack4.wav", "vj_bms_scientistfemale/attack5.wav", "vj_bms_scientistfemale/attack6.wav", "vj_bms_scientistfemale/attack7.wav", "vj_bms_scientistfemale/attack8.wav", "vj_bms_scientistfemale/attack9.wav", "vj_bms_scientistfemale/attack10.wav", "vj_bms_scientistfemale/attack11.wav", "vj_bms_scientistfemale/attack12.wav", }
ENT.SoundTbl_GrenadeSight = {"vj_bms_scientistfemale/nade1.wav", "vj_bms_scientistfemale/nade2.wav", "vj_bms_scientistfemale/nade3.wav", "vj_bms_scientistfemale/nade4.wav", "vj_bms_scientistfemale/nade5.wav", "vj_bms_scientistfemale/nade6.wav"}
ENT.SoundTbl_Pain = {"vj_bms_scientistfemale/die1.wav", "vj_bms_scientistfemale/die2.wav", "vj_bms_scientistfemale/die3.wav", "vj_bms_scientistfemale/die4.wav", "vj_bms_scientistfemale/die5.wav", "vj_bms_scientistfemale/die6.wav"}
ENT.SoundTbl_Death = {"vj_bms_scientistfemale/die1.wav", "vj_bms_scientistfemale/die2.wav", "vj_bms_scientistfemale/die3.wav", "vj_bms_scientistfemale/die4.wav", "vj_bms_scientistfemale/die5.wav", "vj_bms_scientistfemale/die6.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_bms_scientistfemale/startfollowing1.wav", "vj_bms_scientistfemale/startfollowing2.wav", "vj_bms_scientistfemale/startfollowing3.wav", "vj_bms_scientistfemale/startfollowing4.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_bms_scientistfemale/stopfollowing1.wav", "vj_bms_scientistfemale/stopfollowing2.wav", "vj_bms_scientistfemale/stopfollowing3.wav", "vj_bms_scientistfemale/stopfollowing4.wav", "vj_bms_scientistfemale/stopfollowing5.wav", "vj_bms_scientistfemale/stopfollowing6.wav"}
ENT.SoundTbl_OnPlayerSight = {"vj_bms_scientistfemale/sawplayer1.wav", "vj_bms_scientistfemale/sawplayer2.wav", "vj_bms_scientistfemale/sawplayer3.wav", "vj_bms_scientistfemale/sawplayer4.wav", "vj_bms_scientistfemale/sawplayer5.wav", "vj_bms_scientistfemale/sawplayer6.wav", }
ENT.SoundTbl_DamageByPlayer = {"vj_bms_scientistfemale/stupidplayer1.wav", "vj_bms_scientistfemale/stupidplayer2.wav", "vj_bms_scientistfemale/stupidplayer3.wav", "vj_bms_scientistfemale/stupidplayer4.wav", "vj_bms_scientistfemale/stupidplayer5.wav", "vj_bms_scientistfemale/stupidplayer6.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	local randFace = math.random(1, 7)
	if randFace == 1 then self:SetBodygroup(3, math.random(0, 1)) self:SetSkin(0) end
	if randFace == 2 then self:SetBodygroup(3, 2) self:SetSkin(1) end
	if randFace == 3 then self:SetBodygroup(3, math.random(3, 4)) self:SetSkin(2) end
	if randFace == 4 then self:SetBodygroup(3, math.random(0, 1)) self:SetSkin(3) end
	if randFace == 5 then self:SetBodygroup(3, math.random(3, 4)) self:SetSkin(4) end
	if randFace == 6 then self:SetBodygroup(3, math.random(3, 4)) self:SetSkin(5) end
	if randFace == 7 then self:SetBodygroup(3, math.random(3, 4)) self:SetSkin(6) end

	if math.random(1, 2) == 1 then
		self:SetBodygroup(4, math.random(1, 5))
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
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/fem_sci/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, 100)+self:GetForward()*math.Rand(-100, 100)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/right_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 7, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-350, -550)+self:GetForward()*math.Rand(-500, 500)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/left_leg.mdl", {Pos=self:LocalToWorld(Vector(0, -7, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(350, 550)+self:GetForward()*math.Rand(-500, 500)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/right_arm.mdl", {Pos=self:LocalToWorld(Vector(0, -3, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/scientists/left_arm.mdl", {Pos=self:LocalToWorld(Vector(0, 2, 2)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if self:GetBodygroup(5) == 1 then
		self:CreateExtraDeathCorpse("prop_physics", "models/humans/props/scientist_syringe.mdl", {Pos=self:LocalToWorld(Vector(0, 12, 0))})
		corpse:SetBodygroup(5, 0)
	end
	
	if self:GetBodygroup(4) == 4 then
		self:CreateExtraDeathCorpse("prop_physics", "models/props_office/pencil.mdl", {Pos=self:GetAttachment(self:LookupAttachment("eyes")).Pos + self:GetRight()*-2.5})
		corpse:SetBodygroup(4, 0)
	end
end