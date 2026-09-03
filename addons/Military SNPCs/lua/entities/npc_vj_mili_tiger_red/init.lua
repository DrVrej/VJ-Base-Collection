AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_GERMAN/tigerbody.mdl"
ENT.StartHealth = 500
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_GERMAN"}

ENT.SoundTbl_Idle = {"vj_military/german/objectiveclear1.wav", "vj_military/german/objectiveclear2.wav", "vj_military/german/objectiveclear3.wav", "vj_military/german/objectiveclear4.wav", "vj_military/german/objectiveclear5.wav", "vj_military/german/spreadout1.wav", "vj_military/german/spreadout2.wav", "vj_military/german/sticktogether1.wav", "vj_military/german/sticktogether2.wav", "vj_military/german/statusreport1.wav", "vj_military/german/statusreport2.wav", "vj_military/german/raid_decoy1.wav", "vj_military/german/raid_decoy2.wav", "vj_military/german/raid_decoy3.wav", "vj_military/german/raid_decoy4.wav", "vj_military/german/raid_decoy5.wav"}
ENT.SoundTbl_CombatIdle = {"vj_military/german/ontheway1.wav", "vj_military/german/ontheway2.wav", "vj_military/german/ontheway3.wav", "vj_military/german/ontheway4.wav", "vj_military/german/go1.wav", "vj_military/german/go2.wav", "vj_military/german/go3.wav", "vj_military/german/go4.wav", "vj_military/german/moving1.wav", "vj_military/german/moving2.wav", "vj_military/german/moving3.wav", "vj_military/german/moving4.wav", "vj_military/german/moving5.wav"}
ENT.SoundTbl_ReceiveOrder = {"vj_military/german/affirmative1.wav", "vj_military/german/affirmative2.wav", "vj_military/german/affirmative3.wav", "vj_military/german/affirmative4.wav"}
ENT.SoundTbl_Alert = {"vj_military/german/alert1.wav", "vj_military/german/alert2.wav", "vj_military/german/alert3.wav", "vj_military/german/alert4.wav", "vj_military/german/alert5.wav"}
ENT.SoundTbl_CallForHelp = {"vj_military/german/needbackup1.wav", "vj_military/german/needbackup2.wav", "vj_military/german/needbackup3.wav", "vj_military/german/needbackup4.wav", "vj_military/german/requestreinforcements1.wav", "vj_military/german/requestreinforcements2.wav", "vj_military/german/requestreinforcements3.wav", "vj_military/german/requestreinforcements4.wav"}

-- Tank Base
ENT.Tank_GunnerENT = "npc_vj_mili_tiger_redg"
ENT.Tank_AngleOffset = -90
ENT.Tank_DriveAwayDistance = 600
ENT.Tank_CollisionBoundSize = 140
ENT.Tank_CollisionBoundUp = 120
ENT.Tank_DeathDriverCorpse = {"models/VJ_WAFFEN/german_soldier1.mdl", "models/VJ_WAFFEN/german_soldier2.mdl", "models/VJ_WAFFEN/german_soldier3.mdl", "models/VJ_WAFFEN/german_soldier4.mdl", "models/VJ_WAFFEN/german_soldier5.mdl", "models/VJ_WAFFEN/german_soldier6.mdl"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_GunnerSpawnPosition()
	return self:GetPos() + self:GetUp()*92 + self:GetRight()*-52
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_UpdateIdleParticles()
	local effectData = EffectData()
	effectData:SetScale(1)
	effectData:SetEntity(self)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 20 + self:GetRight() * -195 + self:GetUp() * 100)
	util.Effect("VJ_VehicleExhaust", effectData, true, true)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * -20 + self:GetRight() * -195 + self:GetUp() * 100)
	util.Effect("VJ_VehicleExhaust", effectData, true, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_UpdateMoveParticles()
	local effectData = EffectData()
	effectData:SetScale(1)
	effectData:SetEntity(self)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 65 + self:GetRight() * -130)
	util.Effect("VJ_VehicleMove", effectData, true, true)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * -65 + self:GetRight() * -13)
	util.Effect("VJ_VehicleMove", effectData, true, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNearDeathSparkPositions()
	local randPos = math.random(1, 7)
	if randPos == 1 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*90 +self:GetUp()*60 +self:GetRight()*-100)
	elseif randPos == 2 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*-50 +self:GetUp()*100 +self:GetRight()*40)
	elseif randPos == 3 then self.Spark1:SetLocalPos(self:GetPos()+self:GetUp()*100 +self:GetRight()*-190 +self:GetForward()*-20)
	elseif randPos == 4 then self.Spark1:SetLocalPos(self:GetPos()+self:GetUp()*100 +self:GetRight()*-140)
	elseif randPos == 5 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*30 +self:GetUp()*70 +self:GetRight()*70)
	elseif randPos == 6 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*80 +self:GetUp()*90 +self:GetRight()*-30)
	elseif randPos == 7 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*-100 +self:GetUp()*70 +self:GetRight()*-80)
	end
end