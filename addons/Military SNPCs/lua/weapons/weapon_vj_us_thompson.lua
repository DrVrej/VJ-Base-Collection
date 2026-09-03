AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Thompson"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Military"

SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/american/w_m1928a1.mdl"
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-9.5, 0, -180)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.25, 0.6, -0.3)
SWEP.HoldType = "ar2"

SWEP.NPC_NextPrimaryFire = 0.1

SWEP.Primary.Damage = 5
SWEP.Primary.Force = 5
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = "vj_weapons/thompson/thompson_close1.wav"
SWEP.Primary.DistantSound = "vj_weapons/thompson/thompson_distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "shell"
SWEP.PrimaryEffects_ShellType = "RifleShellEject"