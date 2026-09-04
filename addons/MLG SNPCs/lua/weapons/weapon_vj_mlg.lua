AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "MLG TACTICAL GUN"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Sample Text"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.HoldType = "ar2"
SWEP.Slot = 3
SWEP.SlotPos = 3
SWEP.UseHands = true

SWEP.NPC_NextPrimaryFire = 0.15

SWEP.Primary.Damage = 220
SWEP.Primary.Force = 420
SWEP.Primary.ClipSize = 420
SWEP.Primary.PickUpAmmoAmount = 420
SWEP.Primary.Recoil = 5
SWEP.Primary.Cone = 0
SWEP.Primary.Delay = 0.18
SWEP.Primary.TakeAmmo = 0
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "vj_mlg/Sniper Sound.mp3"
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "RifleShellEject"

SWEP.Reload_TimeUntilAmmoIsSet	= 2.45

-- Custom
local MLG_Sounds = {"vj_mlg/come_and_get_it_scream.wav", "vj_mlg/swag_swag.wav", "vj_mlg/get_the_camera.wav", "vj_mlg/oh_baby_a_triple.wav", "vj_mlg/make_em_bounce.wav", "vj_mlg/dont_shake.wav", "vj_mlg/dayum_son.wav", "vj_mlg/mlg kid 1.mp3", "vj_mlg/mlg kid 2.mp3", "vj_mlg/mlg kid 3.mp3", "vj_mlg/Tactical Nuke.mp3"}
local MLG_Particles = {"blood_trail_skeleton", "blood_trail_weed2", "blood_trail_dew", "blood_trail_dew2", "blood_trail_mlg", "blood_trail_weed", "blood_trail_eye", "blood_trail_nifed", "blood_trail_scope", "blood_trail_sample", "blood_trail_doritos", "blood_trail_doritos2", "blood_trail_doge", "blood_trail_doritos3", "blood_trail_dog", "blood_trail_rainbow", "blood_trail_duane", "blood_trail_nifed"}
local MLG_Texts = {
	"GIT FUKN R3KT M8!",
	"OOOOOOOO0 B4BY A TRIPL3!",
	"MUM GIT DA CAMRA! MUMMY MUMMMM!",
	"420 $M00K3 W33D 3V3RYD4Y!"
}
local defAng = Angle(0, 0, 0)
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack_BulletCallback(attacker, tr, dmginfo)
	if SERVER then
		local hitEnt = tr.Entity
		if IsValid(hitEnt) then
			hitEnt:TakeDamage(200, attacker)
			VJ.DamageSpecialEnts(attacker, hitEnt)
			if hitEnt.VJ_ID_Living then
				attacker:EmitSound(VJ.PICK(MLG_Sounds), 90, 100)
				if attacker:IsPlayer() then
					for _, ply in pairs(player.GetAll()) do
						ply:ChatPrint(attacker:Nick() .. ": " .. VJ.PICK(MLG_Texts))
					end
				end
			end
		end
	end
	sound.Play("vj_mlg/mlghit.wav", tr.HitPos, 75)
	ParticleEffect("blood_trail_hitmarker", tr.HitPos, defAng)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
	ParticleEffectAttach(VJ.PICK(MLG_Particles), PATTACH_POINT_FOLLOW, self, self:LookupAttachment(self.PrimaryEffects_MuzzleAttachment))
	self.BaseClass.PrimaryAttackEffects(self, owner)
end