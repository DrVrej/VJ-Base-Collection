AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/buzzer.mdl"
ENT.StartHealth = 30
ENT.HullType = HULL_TINY
ENT.MovementType = VJ_MOVETYPE_AERIAL
ENT.Aerial_FlyingSpeed_Calm = 100
ENT.Aerial_FlyingSpeed_Alerted = 200
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ALIENSWARM"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.3
ENT.NextAnyAttackTime_Melee = 0.6
ENT.MeleeAttackDamage = 15

ENT.HasDeathCorpse = false

ENT.SoundTbl_Breath = {"vj_alienswarm/buzzer/idle01.wav", "vj_alienswarm/buzzer/idle02.wav"}
ENT.SoundTbl_Alert = "vj_alienswarm/buzzer/edited_onfire.wav"
ENT.SoundTbl_BeforeMeleeAttack = {"vj_alienswarm/buzzer/attack01.wav", "vj_alienswarm/buzzer/attack02.wav", "vj_alienswarm/buzzer/attack03.wav"}
ENT.SoundTbl_Pain = "vj_alienswarm/buzzer/pain.wav"
ENT.SoundTbl_Death = {"vj_alienswarm/buzzer/death01.wav", "vj_alienswarm/buzzer/death02.wav"}

ENT.MainSoundPitch = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(10, 10, 10), Vector(-10, -10, -10))
	self:SetSurroundingBounds(Vector(40, 40, 40), Vector(-40, -40, -40))
	
	-- So it doesn't spawn in the ground too much
	timer.Simple(0.05, function()
		if IsValid(self) then
			self:SetPos(self:GetPos() + self:GetUp() * 25)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
--
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then
		local myPos = self:GetPos()
		ParticleEffect("vj_acid_impact1", myPos, defAng)
		ParticleEffect("vj_acid_impact3_gas", myPos, defAng)
	end
end