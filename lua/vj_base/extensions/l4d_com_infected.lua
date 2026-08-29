/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 65
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodDecal = {"VJ_L4D_Blood"}
ENT.PoseParameterLooking_Names = {pitch = {"body_pitch"}, yaw = {"body_yaw"}, roll = {}}
ENT.HasBloodPool = false

-- Melee attack
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 10
ENT.AnimTbl_MeleeAttack = "vjges_" .. ACT_MELEE_ATTACK2
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackPlayerSpeedTime = 0.5

-- Death / Gibs
ENT.GibOnDeathFilter = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"death_01", "death_02a", "death_02c", "death_03", "death_05", "death_06", "death_07", "death_08", "death_08b", "death_09", "death_10ab", "death_10b", "death_10c", "death_11_01a", "death_11_01b", "death_11_02a", "death_11_02b", "death_11_02c", "death_11_02d", "death_11_03a", "death_11_03b", "death_11_03c"}
ENT.DeathAnimationChance = 2

-- Flinching
ENT.CanFlinch = true
ENT.FlinchChance = 12
ENT.AnimTbl_Flinch = "Shoved_Backward_01" // "vjges_flinch_01"
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = "HeadshotFront"},
	//{HitGroup = {HITGROUP_CHEST, HITGROUP_STOMACH}, Animation = "Shoved_Backward_01"} -- Since there isn't any animation for legs or arms, just use this as general anim
}

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
ENT.HasMeleeAttackPlayerSpeedSounds = false

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/dirt1.wav", "vj_l4d_com/footstep/dirt2.wav", "vj_l4d_com/footstep/dirt3.wav", "vj_l4d_com/footstep/dirt4.wav"}
ENT.SoundTbl_Breath = {"vj_l4d_com/idle_breath/breathing01.wav", "vj_l4d_com/idle_breath/breathing08.wav", "vj_l4d_com/idle_breath/breathing09.wav", "vj_l4d_com/idle_breath/breathing10.wav", "vj_l4d_com/idle_breath/breathing13.wav", "vj_l4d_com/idle_breath/breathing16.wav", "vj_l4d_com/idle_breath/breathing18.wav", "vj_l4d_com/idle_breath/breathing25.wav", "vj_l4d_com/idle_breath/breathing26.wav", "vj_l4d_com/idle_breath/idle_breath_01.wav", "vj_l4d_com/idle_breath/idle_breath_02.wav", "vj_l4d_com/idle_breath/idle_breath_03.wav", "vj_l4d_com/idle_breath/idle_breath_04.wav", "vj_l4d_com/idle_breath/idle_breath_06.wav"}
ENT.SoundTbl_Idle = {"vj_l4d_com/idle/mumbling01.wav", "vj_l4d_com/idle/mumbling02.wav", "vj_l4d_com/idle/mumbling03.wav", "vj_l4d_com/idle/mumbling04.wav", "vj_l4d_com/idle/mumbling05.wav", "vj_l4d_com/idle/mumbling06.wav", "vj_l4d_com/idle/mumbling07.wav", "vj_l4d_com/idle/mumbling08.wav", "vj_l4d_com/idle/moan01.wav", "vj_l4d_com/idle/moan02.wav", "vj_l4d_com/idle/moan03.wav", "vj_l4d_com/idle/moan04.wav", "vj_l4d_com/idle/moan05.wav", "vj_l4d_com/idle/moan06.wav", "vj_l4d_com/idle/moan07.wav", "vj_l4d_com/idle/moan08.wav", "vj_l4d_com/idle/moan09.wav"}
ENT.SoundTbl_CallForHelp = {"vj_l4d_com/alert/howl01.wav", "vj_l4d_com/alert/shout01.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_l4d_com/attack_hit/hit_punch_01.wav", "vj_l4d_com/attack_hit/hit_punch_02.wav", "vj_l4d_com/attack_hit/hit_punch_03.wav", "vj_l4d_com/attack_hit/hit_punch_04.wav", "vj_l4d_com/attack_hit/hit_punch_05.wav", "vj_l4d_com/attack_hit/hit_punch_06.wav", "vj_l4d_com/attack_hit/hit_punch_07.wav", "vj_l4d_com/attack_hit/hit_punch_08.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_l4d_com/attack_miss/claw_miss_1.wav", "vj_l4d_com/attack_miss/claw_miss_2.wav"}

-- Gore sounds
local sdGoreReg = {"vj_l4d_com/gore/melee/melee_arm_break_01.wav", "vj_l4d_com/gore/melee/melee_arm_break_02.wav"}
local sdGoreHead = {"vj_l4d_com/gore/melee/melee_skull_break_01.wav", "vj_l4d_com/gore/melee/melee_skull_break_02.wav"}
local sdGoreHeadDeath = {"vj_l4d_com/gore/headless/headless_1.wav", "vj_l4d_com/gore/headless/headless_2.wav", "vj_l4d_com/gore/headless/headless_3.wav", "vj_l4d_com/gore/headless/headless_4.wav"}

-- Male sounds
local sdMale_CombatIdle = {"vj_l4d_com/idle_combat/alert24.wav", "vj_l4d_com/idle_combat/become_enraged01.wav", "vj_l4d_com/idle_combat/become_enraged02.wav", "vj_l4d_com/idle_combat/become_enraged03.wav", "vj_l4d_com/idle_combat/become_enraged06.wav", "vj_l4d_com/idle_combat/become_enraged07.wav", "vj_l4d_com/idle_combat/become_enraged09.wav", "vj_l4d_com/idle_combat/become_enraged10.wav", "vj_l4d_com/idle_combat/become_enraged11.wav", "vj_l4d_com/idle_combat/become_enraged30.wav", "vj_l4d_com/idle_combat/become_enraged50.wav", "vj_l4d_com/idle_combat/become_enraged51.wav", "vj_l4d_com/idle_combat/become_enraged52.wav", "vj_l4d_com/idle_combat/become_enraged53.wav", "vj_l4d_com/idle_combat/become_enraged54.wav", "vj_l4d_com/idle_combat/become_enraged55.wav", "vj_l4d_com/idle_combat/become_enraged56.wav", "vj_l4d_com/idle_combat/become_enraged57.wav", "vj_l4d_com/idle_combat/become_enraged58.wav", "vj_l4d_com/idle_combat/male/become_enraged40.wav", "vj_l4d_com/idle_combat/male/become_enraged41.wav", "vj_l4d_com/idle_combat/male/become_enraged42.wav", "vj_l4d_com/idle_combat/male/become_enraged43.wav"}
local sdMale_Investigate = {"vj_l4d_com/investigate/become_alert01.wav", "vj_l4d_com/investigate/become_alert04.wav", "vj_l4d_com/investigate/become_alert09.wav", "vj_l4d_com/investigate/become_alert11.wav", "vj_l4d_com/investigate/become_alert12.wav", "vj_l4d_com/investigate/become_alert14.wav", "vj_l4d_com/investigate/become_alert17.wav", "vj_l4d_com/investigate/become_alert18.wav", "vj_l4d_com/investigate/become_alert21.wav", "vj_l4d_com/investigate/become_alert23.wav", "vj_l4d_com/investigate/become_alert25.wav", "vj_l4d_com/investigate/become_alert26.wav", "vj_l4d_com/investigate/become_alert29.wav", "vj_l4d_com/investigate/become_alert38.wav", "vj_l4d_com/investigate/become_alert41.wav", "vj_l4d_com/investigate/become_alert54.wav", "vj_l4d_com/investigate/become_alert55.wav", "vj_l4d_com/investigate/become_alert56.wav", "vj_l4d_com/investigate/become_alert57.wav", "vj_l4d_com/investigate/become_alert58.wav", "vj_l4d_com/investigate/become_alert59.wav", "vj_l4d_com/investigate/male/become_alert60.wav", "vj_l4d_com/investigate/male/become_alert61.wav", "vj_l4d_com/investigate/male/become_alert62.wav", "vj_l4d_com/investigate/male/become_alert63.wav"}
local sdMale_Alert = {"vj_l4d_com/alert/shout02.wav", "vj_l4d_com/alert/shout03.wav", "vj_l4d_com/alert/shout04.wav", "vj_l4d_com/alert/shout06.wav", "vj_l4d_com/alert/shout07.wav", "vj_l4d_com/alert/shout08.wav", "vj_l4d_com/alert/shout09.wav", "vj_l4d_com/alert/recognize01.wav", "vj_l4d_com/alert/recognize02.wav", "vj_l4d_com/alert/recognize03.wav", "vj_l4d_com/alert/recognize04.wav", "vj_l4d_com/alert/recognize05.wav", "vj_l4d_com/alert/recognize06.wav", "vj_l4d_com/alert/recognize07.wav", "vj_l4d_com/alert/recognize08.wav", "vj_l4d_com/alert/alert13.wav", "vj_l4d_com/alert/alert22.wav", "vj_l4d_com/alert/alert23.wav", "vj_l4d_com/alert/alert25.wav", "vj_l4d_com/alert/alert27.wav", "vj_l4d_com/alert/alert36.wav", "vj_l4d_com/alert/alert43.wav", "vj_l4d_com/alert/alert44.wav", "vj_l4d_com/alert/hiss01.wav", "vj_l4d_com/alert/male/alert50.wav", "vj_l4d_com/alert/male/alert51.wav", "vj_l4d_com/alert/male/alert52.wav", "vj_l4d_com/alert/male/alert53.wav", "vj_l4d_com/alert/male/alert54.wav", "vj_l4d_com/alert/male/alert55.wav"}
local sdMale_BeforeMeleeAttack = {"vj_l4d_com/attack_b/male/rage_50.wav", "vj_l4d_com/attack_b/male/rage_51.wav", "vj_l4d_com/attack_b/male/rage_52.wav", "vj_l4d_com/attack_b/male/rage_53.wav", "vj_l4d_com/attack_b/male/rage_54.wav", "vj_l4d_com/attack_b/male/rage_55.wav", "vj_l4d_com/attack_b/male/rage_56.wav", "vj_l4d_com/attack_b/male/rage_57.wav", "vj_l4d_com/attack_b/male/rage_58.wav", "vj_l4d_com/attack_b/male/rage_59.wav", "vj_l4d_com/attack_b/male/rage_60.wav", "vj_l4d_com/attack_b/male/rage_61.wav", "vj_l4d_com/attack_b/male/rage_62.wav", "vj_l4d_com/attack_b/male/rage_64.wav", "vj_l4d_com/attack_b/male/rage_65.wav", "vj_l4d_com/attack_b/male/rage_66.wav", "vj_l4d_com/attack_b/male/rage_67.wav", "vj_l4d_com/attack_b/male/rage_68.wav", "vj_l4d_com/attack_b/male/rage_69.wav", "vj_l4d_com/attack_b/male/rage_70.wav", "vj_l4d_com/attack_b/male/rage_71.wav", "vj_l4d_com/attack_b/male/rage_72.wav", "vj_l4d_com/attack_b/male/rage_73.wav", "vj_l4d_com/attack_b/male/rage_74.wav", "vj_l4d_com/attack_b/male/rage_75.wav", "vj_l4d_com/attack_b/male/rage_76.wav", "vj_l4d_com/attack_b/male/rage_77.wav", "vj_l4d_com/attack_b/male/rage_78.wav", "vj_l4d_com/attack_b/male/rage_79.wav", "vj_l4d_com/attack_b/male/rage_80.wav", "vj_l4d_com/attack_b/male/rage_81.wav", "vj_l4d_com/attack_b/male/rage_82.wav"}
local sdMale_Pain = {"vj_l4d_com/pain/been_shot_01.wav", "vj_l4d_com/pain/been_shot_04.wav", "vj_l4d_com/pain/been_shot_05.wav", "vj_l4d_com/pain/been_shot_06.wav", "vj_l4d_com/pain/been_shot_08.wav", "vj_l4d_com/pain/been_shot_09.wav", "vj_l4d_com/pain/been_shot_13.wav", "vj_l4d_com/pain/been_shot_14.wav", "vj_l4d_com/pain/been_shot_18.wav", "vj_l4d_com/pain/been_shot_22.wav", "vj_l4d_com/pain/been_shot_24.wav", "vj_l4d_com/pain/male/been_shot_30.wav", "vj_l4d_com/pain/male/been_shot_31.wav", "vj_l4d_com/pain/male/been_shot_32.wav", "vj_l4d_com/pain/male/been_shot_33.wav", "vj_l4d_com/pain/male/been_shot_34.wav", "vj_l4d_com/pain/male/been_shot_35.wav", "vj_l4d_com/pain/male/been_shot_36.wav", "vj_l4d_com/pain/male/been_shot_37.wav"}
local sdMale_Death = {"vj_l4d_com/death/death_14.wav", "vj_l4d_com/death/death_17.wav", "vj_l4d_com/death/death_18.wav", "vj_l4d_com/death/death_19.wav", "vj_l4d_com/death/death_22.wav", "vj_l4d_com/death/death_23.wav", "vj_l4d_com/death/death_24.wav", "vj_l4d_com/death/death_25.wav", "vj_l4d_com/death/death_26.wav", "vj_l4d_com/death/death_27.wav", "vj_l4d_com/death/death_28.wav", "vj_l4d_com/death/death_29.wav", "vj_l4d_com/death/death_30.wav", "vj_l4d_com/death/death_32.wav", "vj_l4d_com/death/death_33.wav", "vj_l4d_com/death/death_34.wav", "vj_l4d_com/death/death_35.wav", "vj_l4d_com/death/death_36.wav", "vj_l4d_com/death/death_37.wav", "vj_l4d_com/death/death_38.wav", "vj_l4d_com/death/male/death_40.wav", "vj_l4d_com/death/male/death_41.wav", "vj_l4d_com/death/male/death_42.wav", "vj_l4d_com/death/male/death_43.wav", "vj_l4d_com/death/male/death_44.wav", "vj_l4d_com/death/male/death_45.wav", "vj_l4d_com/death/male/death_46.wav", "vj_l4d_com/death/male/death_47.wav", "vj_l4d_com/death/male/death_48.wav", "vj_l4d_com/death/male/death_49.wav"}

-- Female sounds
local sdFemale_CombatIdle = {"vj_l4d_com/idle_combat/alert24.wav", "vj_l4d_com/idle_combat/become_enraged01.wav", "vj_l4d_com/idle_combat/become_enraged02.wav", "vj_l4d_com/idle_combat/become_enraged03.wav", "vj_l4d_com/idle_combat/become_enraged06.wav", "vj_l4d_com/idle_combat/become_enraged07.wav", "vj_l4d_com/idle_combat/become_enraged09.wav", "vj_l4d_com/idle_combat/become_enraged10.wav", "vj_l4d_com/idle_combat/become_enraged11.wav", "vj_l4d_com/idle_combat/become_enraged30.wav", "vj_l4d_com/idle_combat/become_enraged50.wav", "vj_l4d_com/idle_combat/become_enraged51.wav", "vj_l4d_com/idle_combat/become_enraged52.wav", "vj_l4d_com/idle_combat/become_enraged53.wav", "vj_l4d_com/idle_combat/become_enraged54.wav", "vj_l4d_com/idle_combat/become_enraged55.wav", "vj_l4d_com/idle_combat/become_enraged56.wav", "vj_l4d_com/idle_combat/become_enraged57.wav", "vj_l4d_com/idle_combat/become_enraged58.wav", "vj_l4d_com/idle_combat/female/become_enraged40.wav", "vj_l4d_com/idle_combat/female/become_enraged41.wav", "vj_l4d_com/idle_combat/female/become_enraged42.wav", "vj_l4d_com/idle_combat/female/become_enraged43.wav"}
local sdFemale_Investigate = {"vj_l4d_com/investigate/become_alert01.wav", "vj_l4d_com/investigate/become_alert04.wav", "vj_l4d_com/investigate/become_alert09.wav", "vj_l4d_com/investigate/become_alert11.wav", "vj_l4d_com/investigate/become_alert12.wav", "vj_l4d_com/investigate/become_alert14.wav", "vj_l4d_com/investigate/become_alert17.wav", "vj_l4d_com/investigate/become_alert18.wav", "vj_l4d_com/investigate/become_alert21.wav", "vj_l4d_com/investigate/become_alert23.wav", "vj_l4d_com/investigate/become_alert25.wav", "vj_l4d_com/investigate/become_alert26.wav", "vj_l4d_com/investigate/become_alert29.wav", "vj_l4d_com/investigate/become_alert38.wav", "vj_l4d_com/investigate/become_alert41.wav", "vj_l4d_com/investigate/become_alert54.wav", "vj_l4d_com/investigate/become_alert55.wav", "vj_l4d_com/investigate/become_alert56.wav", "vj_l4d_com/investigate/become_alert57.wav", "vj_l4d_com/investigate/become_alert58.wav", "vj_l4d_com/investigate/become_alert59.wav", "vj_l4d_com/investigate/female/become_alert60.wav", "vj_l4d_com/investigate/female/become_alert61.wav", "vj_l4d_com/investigate/female/become_alert62.wav", "vj_l4d_com/investigate/female/become_alert63.wav"}
local sdFemale_Alert = {"vj_l4d_com/alert/shout02.wav", "vj_l4d_com/alert/shout03.wav", "vj_l4d_com/alert/shout04.wav", "vj_l4d_com/alert/shout06.wav", "vj_l4d_com/alert/shout07.wav", "vj_l4d_com/alert/shout08.wav", "vj_l4d_com/alert/shout09.wav", "vj_l4d_com/alert/recognize01.wav", "vj_l4d_com/alert/recognize02.wav", "vj_l4d_com/alert/recognize03.wav", "vj_l4d_com/alert/recognize04.wav", "vj_l4d_com/alert/recognize05.wav", "vj_l4d_com/alert/recognize06.wav", "vj_l4d_com/alert/recognize07.wav", "vj_l4d_com/alert/recognize08.wav", "vj_l4d_com/alert/alert16.wav", "vj_l4d_com/alert/alert26.wav", "vj_l4d_com/alert/alert37.wav", "vj_l4d_com/alert/alert38.wav", "vj_l4d_com/alert/alert39.wav", "vj_l4d_com/alert/alert40.wav", "vj_l4d_com/alert/alert41.wav", "vj_l4d_com/alert/alert42.wav", "vj_l4d_com/alert/hiss01.wav", "vj_l4d_com/alert/female/alert50.wav", "vj_l4d_com/alert/female/alert51.wav", "vj_l4d_com/alert/female/alert52.wav", "vj_l4d_com/alert/female/alert53.wav", "vj_l4d_com/alert/female/alert54.wav", "vj_l4d_com/alert/female/alert55.wav"}
local sdFemale_BeforeMeleeAttack = {"vj_l4d_com/attack_b/female/rage_50.wav", "vj_l4d_com/attack_b/female/rage_51.wav", "vj_l4d_com/attack_b/female/rage_52.wav", "vj_l4d_com/attack_b/female/rage_53.wav", "vj_l4d_com/attack_b/female/rage_54.wav", "vj_l4d_com/attack_b/female/rage_55.wav", "vj_l4d_com/attack_b/female/rage_56.wav", "vj_l4d_com/attack_b/female/rage_57.wav", "vj_l4d_com/attack_b/female/rage_58.wav", "vj_l4d_com/attack_b/female/rage_59.wav", "vj_l4d_com/attack_b/female/rage_60.wav", "vj_l4d_com/attack_b/female/rage_61.wav", "vj_l4d_com/attack_b/female/rage_62.wav", "vj_l4d_com/attack_b/female/rage_64.wav", "vj_l4d_com/attack_b/female/rage_65.wav", "vj_l4d_com/attack_b/female/rage_66.wav", "vj_l4d_com/attack_b/female/rage_67.wav", "vj_l4d_com/attack_b/female/rage_68.wav", "vj_l4d_com/attack_b/female/rage_69.wav", "vj_l4d_com/attack_b/female/rage_70.wav", "vj_l4d_com/attack_b/female/rage_71.wav", "vj_l4d_com/attack_b/female/rage_72.wav", "vj_l4d_com/attack_b/female/rage_73.wav", "vj_l4d_com/attack_b/female/rage_74.wav", "vj_l4d_com/attack_b/female/rage_75.wav", "vj_l4d_com/attack_b/female/rage_76.wav", "vj_l4d_com/attack_b/female/rage_77.wav", "vj_l4d_com/attack_b/female/rage_78.wav", "vj_l4d_com/attack_b/female/rage_79.wav", "vj_l4d_com/attack_b/female/rage_80.wav", "vj_l4d_com/attack_b/female/rage_81.wav", "vj_l4d_com/attack_b/female/rage_82.wav"}
local sdFemale_Pain = {"vj_l4d_com/pain/been_shot_02.wav", "vj_l4d_com/pain/been_shot_12.wav", "vj_l4d_com/pain/been_shot_19.wav", "vj_l4d_com/pain/been_shot_20.wav", "vj_l4d_com/pain/been_shot_21.wav", "vj_l4d_com/pain/female/been_shot_30.wav", "vj_l4d_com/pain/female/been_shot_31.wav", "vj_l4d_com/pain/female/been_shot_32.wav", "vj_l4d_com/pain/female/been_shot_33.wav", "vj_l4d_com/pain/female/been_shot_34.wav", "vj_l4d_com/pain/female/been_shot_35.wav", "vj_l4d_com/pain/female/been_shot_36.wav", "vj_l4d_com/pain/female/been_shot_37.wav"}
local sdFemale_Death = {"vj_l4d_com/death/death_14.wav", "vj_l4d_com/death/death_17.wav", "vj_l4d_com/death/death_18.wav", "vj_l4d_com/death/death_19.wav", "vj_l4d_com/death/death_22.wav", "vj_l4d_com/death/death_23.wav", "vj_l4d_com/death/death_24.wav", "vj_l4d_com/death/death_25.wav", "vj_l4d_com/death/death_26.wav", "vj_l4d_com/death/death_27.wav", "vj_l4d_com/death/death_28.wav", "vj_l4d_com/death/death_29.wav", "vj_l4d_com/death/death_30.wav", "vj_l4d_com/death/death_32.wav", "vj_l4d_com/death/death_33.wav", "vj_l4d_com/death/death_34.wav", "vj_l4d_com/death/death_35.wav", "vj_l4d_com/death/death_36.wav", "vj_l4d_com/death/death_37.wav", "vj_l4d_com/death/death_38.wav", "vj_l4d_com/death/female/death_40.wav", "vj_l4d_com/death/female/death_41.wav", "vj_l4d_com/death/female/death_42.wav", "vj_l4d_com/death/female/death_43.wav", "vj_l4d_com/death/female/death_44.wav", "vj_l4d_com/death/female/death_45.wav", "vj_l4d_com/death/female/death_46.wav", "vj_l4d_com/death/female/death_47.wav", "vj_l4d_com/death/female/death_48.wav", "vj_l4d_com/death/female/death_49.wav", "vj_l4d_com/death/mp/odd_2.wav", "vj_l4d_com/death/mp/odd_3.wav", "vj_l4d_com/death/mp/odd_4.wav", "vj_l4d_com/death/mp/odd_5.wav", "vj_l4d_com/death/mp/squeal_1.wav", "vj_l4d_com/death/mp/squeal_2.wav", "vj_l4d_com/death/mp/squeal_3.wav", "vj_l4d_com/death/mp/squeal_4.wav"}

-- Custom
ENT.Zombie_Gender = 0 -- 0 = Male | 1 = Female
ENT.Zombie_CanPuke = true -- Can this zombie puke? (Particle)
ENT.Zombie_CanHearPipe = true -- Can it hear the pipe bombs?
ENT.Zombie_NextPipBombT = 0
ENT.Zombie_NextStumbleT = 0
ENT.Zombie_SkipAlertAnim = false

-- Idle Stance System
local IDLE_STATE_NORMAL = 0
local IDLE_STATE_SITTING = 1
local IDLE_STATE_LYING = 2

ENT.Zombie_IdleState = IDLE_STATE_NORMAL
ENT.Zombie_IdleQuickStand = false -- Flagged in cases such as getting up after damaged
ENT.Zombie_IdleStandT = 0
ENT.Zombie_IdleStateChangeT = 0

-- Animations
local animSit = {"Sitting01", "Sitting02", "Sitting03", "Sitting04", "Sitting05", "Sitting06", "Sitting07", "Sitting08", "Sitting09"}
local animUnreachable = {"idle_unabletoreachtarget_01a", "idle_unabletoreachtarget_01b", "idle_unabletoreachtarget_01c", "idle_unabletoreachtarget_01d"}
local animDmgSetEnemy = {"idle_alert_injured_straight_02", "idle_alert_injured_behind_01", "idle_alert_injured_right_02", "idle_alert_injured_left_02"}
local animDeathShotgun = {"death_shotgun_backward_03", "death_shotgun_backward_04", "death_shotgun_backward_05", "death_shotgun_backward_06", "death_shotgun_backward_07", "death_shotgun_backward_08", "death_shotgun_backward_09"}
local animDeathRunning = {"deathrunning_01", "deathrunning_03", "deathrunning_04", "deathrunning_05", "deathrunning_06", "deathrunning_07", "deathrunning_08", "deathrunning_09", "deathrunning_10", "deathrunning_11a", "deathrunning_11b", "deathrunning_11c", "deathrunning_11d", "deathrunning_11e", "deathrunning_11f", "deathrunning_11g"}

ENT.ZombieAnim_IdleSitting = ACT_INVALID
ENT.ZombieAnim_IdleLying = ACT_INVALID
ENT.ZombieAnim_IdleAlert = ACT_INVALID
ENT.ZombieAnim_IdleUnreachable = ACT_INVALID
ENT.ZombieAnim_CallHelp = ACT_INVALID

-- Climbing System
ENT.Zombie_CanClimb = false
ENT.Zombie_IsClimbing = false
ENT.Zombie_NextClimbT = 0

/* TODO:
	- System to support shoving animations
	- Requires model updates:
		- Add "eyes" attachment to all models
		- Rename some activities to use defined activities
		- Simplify event names
*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	if self.Zombie_Gender == 1 then -- Female
		self.SoundTbl_CombatIdle = sdFemale_CombatIdle
		self.SoundTbl_Investigate = sdFemale_Investigate
		self.SoundTbl_Alert = sdFemale_Alert
		self.SoundTbl_BeforeMeleeAttack = sdFemale_BeforeMeleeAttack
		self.SoundTbl_Pain = sdFemale_Pain
		self.SoundTbl_Death = sdFemale_Death
	else -- Male
		self.SoundTbl_CombatIdle = sdMale_CombatIdle
		self.SoundTbl_Investigate = sdMale_Investigate
		self.SoundTbl_Alert = sdMale_Alert
		self.SoundTbl_BeforeMeleeAttack = sdMale_BeforeMeleeAttack
		self.SoundTbl_Pain = sdMale_Pain
		self.SoundTbl_Death = sdMale_Death
	end
	
	local initFunc = self.Zombie_OnInit
	if initFunc then
		initFunc(self)
	end
	
	self.ZombieAnim_IdleSitting = VJ.SequenceToActivity(self, VJ.PICK(animSit)) -- Pick a sitting stance here and never change it again
	self.ZombieAnim_IdleLying = VJ.SequenceToActivity(self, "lying01") -- "lying01" to "lying08"
	self.ZombieAnim_IdleAlert = VJ.SequenceToActivity(self, "idle_alert_01a") -- Covers 7 sequences
	self.ZombieAnim_IdleUnreachable = VJ.SequenceToActivity(self, VJ.PICK(animUnreachable)) -- Pick it here and never change it again
	self.ZombieAnim_CallHelp = VJ.SequenceToActivity(self, "idle_acquire_05")-- "idle_acquire_05", "idle_acquire_06", "idle_acquire_11"
	
	self.Zombie_IdleStateChangeT = CurTime() + math.Rand(2, 80)
	if GetConVar("vj_l4d_alllowclimbing"):GetInt() == 1 then self.Zombie_CanClimb = true end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE then
		if self.Zombie_IdleState == IDLE_STATE_SITTING then -- Sitting idle
			return self.ZombieAnim_IdleSitting
		elseif self.Zombie_IdleState == IDLE_STATE_LYING then -- Sleeping idle
			return self.ZombieAnim_IdleLying
		elseif self:IsOnFire() && !self.Immune_Fire then -- On fire idle
			return ACT_IDLE_ON_FIRE -- "standing_onfire"
		elseif self:GetNPCState() == NPC_STATE_ALERT or self:GetNPCState() == NPC_STATE_COMBAT then -- Alert & Combat idle + Unreachable
			local ene = self:GetEnemy()
			if IsValid(ene) && self:IsUnreachable(ene) then
				return self.ZombieAnim_IdleUnreachable
			else
				return self.ZombieAnim_IdleAlert
			end
		end
	elseif act == ACT_WALK or act == ACT_RUN then
		if self:IsOnFire() && !self.Immune_Fire then -- On fire movement
			return ACT_RUN_ON_FIRE -- "run_onfire", "run_onfire_01"
		elseif self.VJ_L4D_IsMudMen then -- Mud man unique movement
			return ACT_RUN_STEALTH
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print("OnInput: ", key, activator, caller, data)
	if key == "event_emit step" then
		self:PlayFootstepSound()
	elseif key == "event_mattack" then
		self:ExecuteMeleeAttack()
	elseif key == "event_vomit" && self.Zombie_CanPuke then
		ParticleEffectAttach("vj_l4d_vomit", PATTACH_POINT_FOLLOW, self, 9)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
//function ENT:GetSightDirection()
//	return self:GetAttachment(self:LookupAttachment("mouth")).Ang:Forward()
//end
---------------------------------------------------------------------------------------------------------------------------------------------
local math_clamp = math.Clamp
local math_appAngle = math.ApproachAngle
--
function ENT:OnUpdatePoseParamTracking(pitch, yaw, roll)
	local speed = self.PoseParameterLooking_TurningSpeed
	self:SetPoseParameter("lean_pitch", math_clamp(math_appAngle(self:GetPoseParameter("lean_pitch"), -15, 15), pitch, speed))
	self:SetPoseParameter("lean_yaw", math_clamp(math_appAngle(self:GetPoseParameter("lean_yaw"), -15, 15), yaw, speed))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInvestigate(ent)
	self:PlayAnim("vjges_startled_delta_01", false) -- Makes their head look around (Gesture)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if !self.Zombie_SkipAlertAnim && self.Zombie_IdleState == IDLE_STATE_NORMAL && !self:IsMoving() && math.random (1, 3) == 1 then
		self:PlayAnim("idle_alert_straight_05", true, math.Rand(1.5, 3), true) -- "idle_alert_straight_05", "idle_alert_straight_08"
	end
	self.Zombie_SkipAlertAnim = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Allies_CallHelp(dist)
	-- Don't call for help if the enemy is a pipe bomb, this prevents infected with "Zombie_CanHearPipe" disabled from attacking the pipe bomb
	if self:GetEnemy():GetClass() == "obj_vj_l4d_pipebomb" then return false end
	self.BaseClass.Allies_CallHelp(self, dist)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally, isFirst)
	if !isFirst then return end
	-- Play call for help anim only if its standing and is not busy with other activity
	if self.Zombie_IdleState == IDLE_STATE_NORMAL && !self:IsBusy("Activities") then
		self:PlayAnim(self.ZombieAnim_CallHelp, true, math.Rand(1.5, 3), true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnSetEnemyFromDamage(dmginfo, hitgroup)
	if self.Zombie_IdleState == IDLE_STATE_NORMAL && math.random(1, 2) == 1 then
		self:PlayAnim(animDmgSetEnemy, true, math.Rand(1.5, 3), true)
		self.Zombie_SkipAlertAnim = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnResetEnemy()
	self.Zombie_IdleStateChangeT = CurTime() + math.Rand(10, 80)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	self:SetPoseParameter("move_x", 1) -- Kalelou hamar
	
	local curTime = CurTime()
	local selfData = self:GetTable()
	local eneValid = IsValid(selfData.EnemyData.Target)
	
	-- Behavior: Sit / Sleep
	if selfData.Zombie_IdleState == IDLE_STATE_NORMAL then
		if !eneValid && !self:IsMoving() && curTime > selfData.Zombie_IdleStateChangeT then
			local sitTime = math.Rand(10, 30)
			if math.random(1, 3) == 1 then
				if math.random(1, 2) == 1 then
					selfData.Zombie_IdleState = IDLE_STATE_SITTING
					self:PlayAnim("standing_to_sitting03", true, false)
				else
					sitTime = math.Rand(30, 60)
					selfData.Zombie_IdleState = IDLE_STATE_LYING
					self:PlayAnim("standing_to_lying03", true, false)
				end
				self:SetState(VJ_STATE_ONLY_ANIMATION, sitTime)
				selfData.Zombie_IdleQuickStand = false
			end
			selfData.Zombie_IdleStandT = curTime + sitTime
		end
	elseif eneValid or self:IsMoving() or curTime > selfData.Zombie_IdleStandT then
		self:SetState()
		local curSeq = self:GetSequenceName(self:GetSequence())
		local quick = selfData.Zombie_IdleQuickStand or eneValid
		if curSeq == "Standing_to_Sitting03" or curSeq == "Standing_to_Lying03" then -- Do NOT play standing up anim if we were still transitioning to sitting / lying
			self:StopCurrentSchedule()
		else
			if selfData.Zombie_IdleState == IDLE_STATE_SITTING then
				self:PlayAnim(quick and "sitting_to_standing_alert" or "sitting03_to_standing", true, false)
			elseif selfData.Zombie_IdleState == IDLE_STATE_LYING then
				self:PlayAnim(quick and "lying_to_standing_alert" or "lying03_to_standing", true, false)
			end
		end
		selfData.Zombie_IdleState = IDLE_STATE_NORMAL
		selfData.Zombie_IdleQuickStand = false
		selfData.Zombie_IdleStateChangeT = curTime + math.Rand(10, 80)
	end
	
	----////// Experimental Climbing System \\\\\\----
	-- NOTE: This is VERY old and unoptimized, recommended not to use but it's here if you want to play around with it
	if selfData.Zombie_CanClimb && !selfData.Dead && !selfData.Zombie_IsClimbing && curTime > selfData.Zombie_NextClimbT then
		local myPos = self:GetPos()
		local myPosUp = self:GetUp()
		local tru = util.TraceLine({start = myPos, endpos = myPos + myPosUp * 200, filter = self})
		
		//VJ.DEBUG_TempEnt(tru.StartPos, self:GetAngles(), Color(0, 0, 255))
		//VJ.DEBUG_TempEnt(tru.HitPos, self:GetAngles(), Color(0, 255, 0))
		if !IsValid(tru.Entity) then
			local anim = false
			local finalpos = myPos
			local myPosForward = self:GetForward() * 40
			local tr5 = util.TraceLine({start = myPos + myPosUp * 144, endpos = myPos + myPosUp * 144 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 144
			local tr4 = util.TraceLine({start = myPos + myPosUp * 120, endpos = myPos + myPosUp * 120 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 120
			local tr3 = util.TraceLine({start = myPos + myPosUp * 96, endpos = myPos + myPosUp * 96 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 96
			local tr2 = util.TraceLine({start = myPos + myPosUp * 72, endpos = myPos + myPosUp * 72 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 72
			local tr1 = util.TraceLine({start = myPos + myPosUp * 48, endpos = myPos + myPosUp * 48 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 48
			if IsValid(tr5.Entity) then
				local tr5b = util.TraceLine({start = myPos + myPosUp * 160, endpos = myPos + myPosUp * 160 + myPosForward, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end})
				if !IsValid(tr5b.Entity) then
					anim = VJ.PICK({"vjseq_climb144_00_inplace", "vjseq_climb144_00a_inplace", "vjseq_climb144_01_inplace", "vjseq_climb144_03_inplace", "vjseq_climb144_03a_inplace", "vjseq_climb144_04_inplace"})
					finalpos = tr5.HitPos
				end
			elseif IsValid(tr4.Entity) then
				anim = VJ.PICK({"vjseq_climb120_00_inplace", "vjseq_climb120_00a_inplace", "vjseq_climb120_01_inplace", "vjseq_climb120_03_inplace", "vjseq_climb120_03a_inplace", "vjseq_climb120_04_inplace"})
				finalpos = tr4.HitPos
			elseif IsValid(tr3.Entity) then
				anim = VJ.PICK({"vjseq_climb96_00_inplace", "vjseq_climb96_00a_inplace", "vjseq_climb96_03_inplace", "vjseq_climb96_03a_inplace", "vjseq_climb96_04a_inplace", "vjseq_climb96_05_inplace"})
				finalpos = tr3.HitPos
			elseif IsValid(tr2.Entity) then
				anim = VJ.PICK({"vjseq_climb72_03_inplace", "vjseq_climb72_04_inplace", "vjseq_climb72_05_inplace", "vjseq_climb72_06_inplace", "vjseq_climb72_07_inplace"})
				finalpos = tr2.HitPos
			elseif IsValid(tr1.Entity) then
				anim = VJ.PICK({"vjseq_climb48_01_inplace", "vjseq_climb48_02_inplace", "vjseq_climb48_03_inplace", "vjseq_climb48_04_inplace"})
				finalpos = tr1.HitPos
			end
		
			if anim then
				self:SetGroundEntity(NULL)
				selfData.Zombie_IsClimbing = true
				timer.Simple(0.4, function()
					if IsValid(self) then
						self:SetPos(finalpos)
					end
				end)
				self:PlayAnim(anim, true, false, true, 0, {}, function(sched)
					sched.RunCode_OnFinish = function()
						//self:SetGroundEntity(NULL)
						//self:SetPos(finalpos)
						self.Zombie_IsClimbing = false
					end
				end)
			end
			selfData.Zombie_NextClimbT = curTime + 2
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PostDamage" then
		local curTime = CurTime()
		
		self.Zombie_IdleStandT = 0
		self.Zombie_IdleQuickStand = true
		self.Zombie_IdleStateChangeT = curTime + math.Rand(5, 10)
		
		-- Randomly stumble when damaged while running
		if !self.Flinching && !self:IsOnFire() && self:IsMoving() && self:GetActivity() == ACT_RUN && self.Zombie_NextStumbleT < curTime && math.random(1, 16) == 1 then
			if self:IsPlayingGesture(self.AttackAnim) then -- Stop the attack gesture!
				self:RemoveGesture(self.AttackAnim)
			end
			self:PlayAnim("run_stumble_01", true, 2.4)
			self.Zombie_NextStumbleT = curTime + math.Rand(8, 14)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
	if status == "Init" then
		return self:GetSequence() == self:LookupSequence("run_stumble_01") -- If we are stumbling then DO NOT flinch!
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self:IsGibDamage(dmginfo:GetDamageType()) then self.HasDeathAnimation = false return end
	if dmginfo:GetDamageForce():Length() < 600 then return false end
	
	local playDeathAnim = true
	if hitgroup == HITGROUP_HEAD then
		local attachHead = self:GetAttachment(self:LookupAttachment("severed_head"))
		self:CreateGibEntity("prop_ragdoll", "models/cpthazama/l4d1/gibs/limb_male_head01.mdl", {Pos = attachHead.Pos, Ang = self:GetAngles(), Vel = "UseDamageForce"}, function(gib)
			//self.HasDeathSounds = false
			self.SoundTbl_Death = sdGoreHeadDeath
			self:RemoveAllDecals()
			self:Zombie_Gibs("h")
			if self.HasGibOnDeathEffects then
				local bloodSpray = ents.Create("info_particle_system")
				bloodSpray:SetKeyValue("effect_name", "blood_advisor_puncture_withdraw")
				bloodSpray:SetPos(attachHead.Pos)
				bloodSpray:SetAngles(attachHead.Ang)
				bloodSpray:SetParent(self)
				bloodSpray:Fire("SetParentAttachment", "severed_head")
				bloodSpray:Spawn()
				bloodSpray:Activate()
				bloodSpray:Fire("Start")
				bloodSpray:Fire("Kill", nil, 3.5)
			end
		end)
	elseif hitgroup == HITGROUP_LEFTARM then
		self:CreateGibEntity("prop_ragdoll", "models/cpthazama/l4d1/gibs/limb_male_larm01.mdl", {Pos = self:GetAttachment(self:LookupAttachment("severed_larm")).Pos - self:GetRight() * -5, Ang = self:GetAngles(), Vel = "UseDamageForce"}, function(gib)
			self:Zombie_Gibs("la")
		end)
	elseif hitgroup == HITGROUP_RIGHTARM then
		self:CreateGibEntity("prop_ragdoll", "models/cpthazama/l4d1/gibs/limb_male_rarm01.mdl", {Pos = self:GetAttachment(self:LookupAttachment("severed_rarm")).Pos - self:GetRight() * -5, Ang = self:GetAngles(), Vel = "UseDamageForce"}, function(gib)
			self:Zombie_Gibs("ra")
		end)
	elseif hitgroup == HITGROUP_LEFTLEG then
		playDeathAnim = false
		self:CreateGibEntity("prop_ragdoll", "models/cpthazama/l4d1/gibs/limb_male_lleg01.mdl", {Pos = self:GetAttachment(self:LookupAttachment("lfoot")).Pos - self:GetRight() * -5, Ang = self:GetAngles(), Vel = "UseDamageForce"}, function(gib)
			self:Zombie_Gibs("ll")
		end)
	elseif hitgroup == HITGROUP_RIGHTLEG then
		playDeathAnim = false
		self:CreateGibEntity("prop_ragdoll", "models/cpthazama/l4d1/gibs/limb_male_rleg01.mdl", {Pos = self:GetAttachment(self:LookupAttachment("rfoot")).Pos - self:GetRight() * 5, Ang = self:GetAngles(), Vel = "UseDamageForce"}, function(gib)
			self:Zombie_Gibs("rl")
		end)
	else
		return false
	end
	self:PlaySoundSystem("Gib", hitgroup == HITGROUP_HEAD and sdGoreHead or sdGoreReg)
	return true, {AllowCorpse = true, AllowAnim = playDeathAnim, AllowSound = false}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" && self.Zombie_IsClimbing or self.Zombie_IdleState != IDLE_STATE_NORMAL or self:IsOnFire() or self:GetSequence() == self:LookupSequence("run_stumble_01") then
		self.HasDeathAnimation = false
	elseif status == "DeathAnim" then
		if /*dmginfo:GetDamageForce():Length() > 10000 or*/ bit.band(dmginfo:GetDamageType(), DMG_BUCKSHOT) != 0 then -- This is rarely ran...
			self.AnimTbl_Death = animDeathShotgun
			//self.DeathAnimationTime = 0.5
			self.DeathAnimationDecreaseLengthAmount = 0.1
		elseif self:IsMoving() && self:GetActivity() == ACT_RUN then
			self.AnimTbl_Death = animDeathRunning
		end
		ParticleEffectAttach("vj_l4d_froth", PATTACH_POINT_FOLLOW, self, 9)
	end
end