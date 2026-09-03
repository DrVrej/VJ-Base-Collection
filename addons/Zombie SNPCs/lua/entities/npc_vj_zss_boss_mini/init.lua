include("entities/npc_vj_zss_slow/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/gal_boss_mini.mdl"
ENT.StartHealth = 500

local sdFootScuff = {"npc/zombie/foot_slide1.wav", "npc/zombie/foot_slide2.wav", "npc/zombie/foot_slide3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "scuff" then
		self:PlayFootstepSound(sdFootScuff)
	elseif key == "melee" then
		self.MeleeAttackDamage = 55
		self:ExecuteMeleeAttack()
	elseif key == "melee_heavy" then
		self.MeleeAttackDamage = 65
		self:ExecuteMeleeAttack()
	end
end