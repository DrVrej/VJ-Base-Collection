AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "M1 Garand"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Military"

SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/american/w_m1_garand.mdl"
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-7.3, 0, -180)
SWEP.WorldModel_CustomPositionOrigin = Vector(-0.4, 0.6, 0)
SWEP.HoldType = "ar2"

SWEP.NPC_NextPrimaryFire = 1.35
SWEP.NPC_CustomSpread = 0.5
SWEP.NPC_ReloadSound = "vj_base/weapons/reload_rifle_bolt.wav"

SWEP.Primary.Damage = 20
SWEP.Primary.Force = 1
SWEP.Primary.ClipSize = 8
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "vj_weapons/m1garand/m1garand_close1.wav"
SWEP.Primary.DistantSound = "vj_weapons/m1garand/m1garand_distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "shell"
SWEP.PrimaryEffects_ShellType = "RifleShellEject"