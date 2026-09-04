AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/monk.mdl"
ENT.StartHealth = 420
ENT.SightDistance = 9999999
ENT.SightAngle = 360
ENT.BloodColor = "Purple"
ENT.HasMeleeAttack = false
ENT.HasGrenadeAttack = false
ENT.Weapon_Accuracy = 0
ENT.Weapon_MaxDistance = 9999999
ENT.HasSoundTrack = true

ENT.SoundTbl_FootStep = "vj_mlg/mlghit.wav"
ENT.SoundTbl_Alert = "vj_mlg/Tactical Nuke.mp3"
ENT.SoundTbl_Idle = {"vj_mlg/swag_swag.wav", "vj_mlg/horn sound.mp3"}
ENT.SoundTbl_CombatIdle = {"vj_mlg/get_the_camera.wav", "vj_mlg/oh_baby_a_triple.wav", "vj_mlg/make_em_bounce.wav", "vj_mlg/mlg kid 1.mp3", "vj_mlg/mlg kid 2.mp3", "vj_mlg/mlg kid 3.mp3", "vj_mlg/Tactical Nuke.mp3"}
ENT.SoundTbl_Pain = {"vj_mlg/dont_shake.wav", "vj_mlg/Spanish kids 1.mp3", "vj_mlg/SHOTS FIRED!.mp3"}
ENT.SoundTbl_Death = {"vj_mlg/dayum_son.wav", "vj_mlg/Sad Horn Villon.mp3"}
ENT.SoundTbl_SoundTrack = "vj_mlg/mlg song 2.mp3"

ENT.MainSoundPitch = 100

-- Custom
ENT.SampleText_NextFightMeM8T = 0
local SampleText_Particles = {"mix", "blood_trail_skeleton", "blood_trail_weed2", "blood_trail_dew", "blood_trail_dew2", "blood_trail_mlg", "blood_trail_weed", "blood_trail_eye", "blood_trail_nifed", "blood_trail_scope", "blood_trail_sample", "blood_trail_doritos", "blood_trail_doritos2", "blood_trail_doge", "blood_trail_doritos3", "blood_trail_dog", "blood_trail_rainbow", "blood_trail_duane", "blood_trail_nifed"}
local SampleText_Prints = {
	"Sample Text: GIT FUKN R3KT M8!",
	"Sample Text: U ARE A KILL M8",
	"Sample Text: U ARE A KILL M8",
	"Sample Text: MOM BRING THE CAMERA",
	"Sample Text: I AM FAZE KLAN M8!!!!",
	"Sample Text: SMOKE WEED EVERYDAY!!!",
	"Sample Text: I WILL NO SCOPE U M8'",
	"Sample Text: 420 BLAZEE ITTTT!!!!!!!"
}
local defAng = Angle(0, 0, 0)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if IsValid(self:GetEnemy()) then
		local curTime = CurTime()
		for _, ply in pairs(player.GetAll()) do
			if curTime > self.SampleText_NextFightMeM8T then
				ply:ChatPrint(VJ.PICK(SampleText_Prints))
				self.SampleText_NextFightMeM8T = curTime + math.random(9, 21)
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo, hitgroup)
	local dmgAttacker = dmginfo:GetAttacker()
	if IsValid(dmgAttacker) && (dmgAttacker:IsPlayer() or dmgAttacker:IsNPC()) && IsValid(dmgAttacker:GetActiveWeapon()) && dmgAttacker:GetActiveWeapon():GetClass() == "weapon_vj_mlg" then
		self:SetHealth(0)
	end
	
	if math.random(1, 2) == 1 then -- 420 $M00K3 W33D
		ParticleEffect(VJ.PICK(SampleText_Particles), dmginfo:GetDamagePosition(), defAng)
	end
	
	if math.random(1, 25) == 1 && dmgAttacker:IsPlayer() then
		dmgAttacker:ChatPrint("Sample Text: 0NLY MLG PL4Y3R$ C4N R3K M3 M8!")
	end
end