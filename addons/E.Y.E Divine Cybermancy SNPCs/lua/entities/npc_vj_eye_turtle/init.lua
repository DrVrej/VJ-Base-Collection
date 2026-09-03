AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/limacue.mdl"
ENT.StartHealth = 10
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.SoundTbl_Idle = {"vj_eye/animals/limacue_idle.wav", "vj_eye/animals/limacue_idle2.wav"}
ENT.SoundTbl_Alert = "vj_eye/animals/limacue_fear.wav"
ENT.SoundTbl_Pain = "vj_eye/animals/limacue_fear.wav"
ENT.SoundTbl_Death = {"vj_eye/animals/limacue_die.wav", "vj_eye/animals/limacue_die2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(12, 12, 18), Vector(-12, -12, 0))
end