AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/boomer.mdl"
ENT.StartHealth = 350
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ALIENSWARM"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2}
ENT.MeleeAttackAnimationDecreaseLengthAmount = 0.2
ENT.MeleeAttackDistance = 100
ENT.MeleeAttackDamageDistance = 120
ENT.TimeUntilMeleeAttackDamage = false

ENT.DisableFootStepSoundTimer = true
ENT.GibOnDeathFilter = false
ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_FootStep = {"vj_alienswarm/boomer/footstep01.wav", "vj_alienswarm/boomer/footstep02.wav", "vj_alienswarm/boomer/footstep03.wav", "vj_alienswarm/boomer/footstep04.wav"}
ENT.SoundTbl_Idle = {"vj_alienswarm/boomer/inflate.wav", "vj_alienswarm/boomer/roar02.wav"}
ENT.SoundTbl_Alert = {"vj_alienswarm/boomer/roar01.wav", "vj_alienswarm/boomer/alert01.wav"}
ENT.SoundTbl_Pain = "vj_alienswarm/boomer/land02.wav"
ENT.SoundTbl_Death = {"vj_alienswarm/boomer/boomer_bomb01.wav", "vj_alienswarm/boomer/boomer_bomb02.wav", "vj_alienswarm/boomer/boomer_bomb03.wav", "vj_alienswarm/boomer/boomer_bomb04.wav"}

local sdWhoosh = {"vj_alienswarm/boomer/attack01.wav", "vj_alienswarm/boomer/attack02.wav"}

-- Custom
ENT.Boomer_ControllerGallop = false
ENT.Boomer_AnimGallop = ACT_RUN
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(35, 35, 120), Vector(-35, -35, 0))
	self:SetStepHeight(60)

	local sackLight = ents.Create("light_dynamic")
	sackLight:SetKeyValue("_light", "147 112 219 200")
	sackLight:SetKeyValue("brightness", "0")
	sackLight:SetKeyValue("distance", "250")
	sackLight:SetKeyValue("style", "0")
	sackLight:SetPos(self:GetPos())
	sackLight:SetParent(self)
	sackLight:Fire("SetParentAttachment", "attach_explosion")
	sackLight:Spawn()
	sackLight:Activate()
	sackLight:Fire("TurnOn")
	self:DeleteOnRemove(sackLight)
	
	self.Boomer_AnimGallop = VJ.SequenceToActivity(self, "gallop")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "ASW_Boomer.FootstepWalk" or key == "ASW_Boomer.FootstepRun" then
		self:PlayFootstepSound()
	elseif key == "ASW_Boomer.MeleeWhoosh" then
		VJ.EmitSound(self, sdWhoosh, 70)
	elseif key == "ASW_Boomer.Hit" then
		if self:GetActivity() == ACT_MELEE_ATTACK1 then -- Stomp
			self.MeleeAttackDamage = 85
			self.HasMeleeAttackKnockBack = false
			self.SoundTbl_MeleeAttackMiss = "vj_alienswarm/boomer/land02.wav"
		else -- Shove
			self.MeleeAttackDamage = 65
			self.HasMeleeAttackKnockBack = true
			self.SoundTbl_MeleeAttackMiss = false
		end
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * 100 + self:GetUp() * 250
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Toggle between running and galloping")
	
	function controlEnt:OnKeyBindPressed(key)
		local npc = self.VJCE_NPC
		-- Toggle between running and galloping
		if key == IN_JUMP then
			if !npc.Boomer_ControllerGallop then
				npc.Boomer_ControllerGallop = true
				self.VJCE_Player:ChatPrint("Changed to galloping!")
			else
				npc.Boomer_ControllerGallop = false
				self.VJCE_Player:ChatPrint("Changed to regular running!")
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_RUN && ((!self.VJ_IsBeingControlled && self.EnemyData.Distance < 800 && (self:GetNPCState() == NPC_STATE_ALERT or self:GetNPCState() == NPC_STATE_COMBAT)) or (self.VJ_IsBeingControlled && self.Boomer_ControllerGallop)) then
		return self.Boomer_AnimGallop
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
local defAng = Angle(0, 0, 0)
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	local myPos = self:GetPos()
	local myPosCenter = myPos + self:OBBCenter()
	util.BlastDamage(self, self, myPosCenter, 300, 60)
	util.ScreenShake(myPos, 100, 200, 1, 2500)
	
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(myPosCenter)
		effectData:SetColor(colorYellow)
		effectData:SetScale(150)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(1.5)
		util.Effect("StriderBlood", effectData)
		util.Effect("StriderBlood", effectData)
		ParticleEffect("vj_acid_impact3", myPosCenter, defAng)
	end
	
	local myPosLegs = myPos + self:GetUp() * 95
	self:CreateGibEntity("prop_ragdoll", "models/aliens/boomer/boomerlega.mdl", {Pos=myPosLegs, Ang=self:GetAngles() + Angle(0, 200, 0), Vel=self:GetForward()*-math.Rand(450, 550)}) -- Back Leg
	self:CreateGibEntity("prop_ragdoll", "models/aliens/boomer/boomerlegb.mdl", {Pos=myPosLegs + self:GetRight()*-10, Ang=self:GetAngles() + Angle(0, 30, 0), Vel=self:GetRight()*-math.Rand(450, 550)}) -- Right Leg
	self:CreateGibEntity("prop_ragdoll", "models/aliens/boomer/boomerlegc.mdl", {Pos=myPosLegs + self:GetRight()*15, Ang=self:GetAngles() + Angle(0, -30, 0), Vel=self:GetRight()*math.Rand(450, 550)}) -- Left Leg
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	return true
end