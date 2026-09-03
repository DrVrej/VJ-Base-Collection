AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Mosin-Nagant"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Military"

SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/russian/w_mosin_nagant.mdl"
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-7, -91, -182)
SWEP.WorldModel_CustomPositionOrigin = Vector(15, 0.4, -5.4)
SWEP.HoldType = "ar2"

SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CustomSpread = 0.5
SWEP.NPC_ExtraFireSound = "vj_base/weapons/cycle_rifle_bolt.wav"
SWEP.NPC_ReloadSound = "vj_base/weapons/reload_rifle_bolt.wav"

SWEP.Primary.Damage = 20
SWEP.Primary.Force = 1
SWEP.Primary.ClipSize = 5
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = {"vj_weapons/mosin_nagant/fire2a.wav", "vj_weapons/mosin_nagant/fire2b.wav", "vj_weapons/mosin_nagant/fire2c.wav"}
SWEP.Primary.DistantSound = "vj_weapons/mosin_nagant/distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "shell"
SWEP.PrimaryEffects_ShellType = "RifleShellEject"