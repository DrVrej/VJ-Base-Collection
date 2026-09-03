AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "MP5"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "VJ Base"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_weapons/bms/w_mp5.mdl"
SWEP.HoldType = "ar2"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1
SWEP.NPC_TimeUntilFireExtraTimers = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6}
SWEP.NPC_ReloadSound = "vj_weapons/bms_mp5/reload.wav"
SWEP.NPC_HasSecondaryFire = true
SWEP.NPC_SecondaryFireSound = "vj_weapons/bms_mp5/double.wav"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 5
SWEP.Primary.Force = 5
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = "vj_weapons/bms_mp5/close1.wav"
SWEP.Primary.DistantSound = "vj_weapons/bms_mp5/distant1.wav"
SWEP.PrimaryEffects_MuzzleAttachment = "muzzle"
SWEP.PrimaryEffects_ShellAttachment = "ejectbrass"
SWEP.PrimaryEffects_ShellType = "ShellEject"