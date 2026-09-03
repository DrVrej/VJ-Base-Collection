AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "SPAS-12"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "VJ Base"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/bms/w_shotgun.mdl"
SWEP.HoldType = "shotgun"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.9
SWEP.NPC_TimeUntilFire = 0.2
SWEP.NPC_ExtraFireSound = "vj_weapons/bms_shotgun/pump.wav"
SWEP.NPC_FiringDistanceScale = 0.5
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 4
SWEP.Primary.Force = 1
SWEP.Primary.NumberOfShots = 7
SWEP.Primary.ClipSize = 8
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = "vj_weapons/bms_shotgun/close1.wav"
SWEP.Primary.DistantSound = "vj_weapons/bms_shotgun/distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "muzzle"
SWEP.PrimaryEffects_ShellType = "ShotgunShellEject"