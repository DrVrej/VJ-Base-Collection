AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_GERMAN/tigerturret.mdl"
ENT.StartHealth = 0
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_GERMAN"}

-- Tank Base
ENT.Tank_AngleOffset = -90
ENT.Tank_AngleDiffuseFiringLimit = 2.5
ENT.Tank_Shell_SpawnPos = Vector(0, -200, 18)
ENT.Tank_Shell_MuzzleFlashPos = Vector(0, -250, 12)
ENT.Tank_Shell_ParticlePos = Vector(0, -260, 18)