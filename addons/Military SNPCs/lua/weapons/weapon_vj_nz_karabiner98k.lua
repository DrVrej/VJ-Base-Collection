AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Karabiner 98k"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Military"

SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/german/w_karabiner_98k.mdl"
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(0, -91, -189)
SWEP.WorldModel_CustomPositionOrigin = Vector(9, 0.5, -3.9)
SWEP.HoldType = "ar2"

SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CustomSpread = 0.5
SWEP.NPC_ExtraFireSound = "vj_base/weapons/cycle_rifle_bolt.wav"
SWEP.NPC_ReloadSound = "vj_base/weapons/reload_rifle_bolt.wav"

SWEP.Primary.Damage = 20
SWEP.Primary.Force = 1
SWEP.Primary.ClipSize = 5
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "vj_weapons/karabiner_98k/kar98_close1.wav"
SWEP.Primary.DistantSound = "vj_weapons/karabiner_98k/kar98_distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "shell"
SWEP.PrimaryEffects_ShellType = "RifleShellEject"