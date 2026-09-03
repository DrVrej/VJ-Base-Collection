/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 75
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackPlayerSpeedTime = 3
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 2

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
ENT.GibOnDeathFilter = false

ENT.CanFlinch = true
ENT.FlinchChance = 1
ENT.FlinchCooldown = false
ENT.AnimTbl_Flinch = ACT_STEP_FORE
/* -- Gesture flinching looks very odd due to their animations, disabled for now
ENT.FlinchHitGroupMap = {
	{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head_1", "vjges_flinch_head_2", "vjges_flinch_head_3"}},
	{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest_1", "vjges_flinch_chest_2", "vjges_flinch_chest_3"}},
	{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_leftarm_1", "vjges_flinch_leftarm_2", "vjges_flinch_leftarm_3"}},
	{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_rightarm_1", "vjges_flinch_rightarm_2", "vjges_flinch_rightarm_3"}},
}
*/

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
//ENT.SoundTbl_MeleeAttackExtra = {"vj_nmrih/claw_strike1.wav", "vj_nmrih/claw_strike2.wav", "vj_nmrih/claw_strike3.wav"} -- Original game uses this but it sounds very bad
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav", "npc/zombie/claw_miss2.wav"}

local sdCrawling = {"vj_nmrih/zombie_scuff1.wav", "vj_nmrih/zombie_scuff2.wav", "vj_nmrih/zombie_scuff3.wav", "vj_nmrih/zombie_scuff4.wav", "vj_nmrih/zombie_scuff5.wav", "vj_nmrih/zombie_scuff6.wav", "vj_nmrih/zombie_scuff7.wav", "vj_nmrih/zombie_scuff8.wav", "vj_nmrih/zombie_scuff9.wav", "vj_nmrih/zombie_scuff10.wav", "vj_nmrih/zombie_scuff11.wav", "vj_nmrih/zombie_scuff12.wav"}
local sdHeadshot = {"vj_nmrih/zombie_head_explode_01.wav", "vj_nmrih/zombie_head_explode_02.wav", "vj_nmrih/zombie_head_explode_03.wav", "vj_nmrih/zombie_head_explode_04.wav", "vj_nmrih/zombie_head_explode_05.wav", "vj_nmrih/zombie_head_explode_06.wav"}
local sdHeadshotDrain = {"vj_nmrih/zombie_neck_drain_01.wav", "vj_nmrih/zombie_neck_drain_02.wav", "vj_nmrih/zombie_neck_drain_03.wav"}

-- Male Shambler
local sdMaleS_Idle = {"vj_nmrih/male_shambler/idle1.wav", "vj_nmrih/male_shambler/idle2.wav", "vj_nmrih/male_shambler/idle3.wav", "vj_nmrih/male_shambler/idle4.wav", "vj_nmrih/male_shambler/idle5.wav", "vj_nmrih/male_shambler/idle6.wav", "vj_nmrih/male_shambler/idle7.wav", "vj_nmrih/male_shambler/idle8.wav", "vj_nmrih/male_shambler/idle9.wav", "vj_nmrih/male_shambler/idle10.wav", "vj_nmrih/male_shambler/idle11.wav", "vj_nmrih/male_shambler/idle12.wav", "vj_nmrih/male_shambler/idle13.wav", "vj_nmrih/male_shambler/idle14.wav", "vj_nmrih/male_shambler/idle15.wav"}
local sdMaleS_CombatIdle = {"vj_nmrih/male_shambler/pursuit_sham_m_01.wav", "vj_nmrih/male_shambler/pursuit_sham_m_02.wav", "vj_nmrih/male_shambler/pursuit_sham_m_03.wav", "vj_nmrih/male_shambler/pursuit_sham_m_04.wav", "vj_nmrih/male_shambler/pursuit_sham_m_05.wav", "vj_nmrih/male_shambler/pursuit_sham_m_06.wav", "vj_nmrih/male_shambler/pursuit_sham_m_07.wav", "vj_nmrih/male_shambler/pursuit_sham_m_08.wav", "vj_nmrih/male_shambler/pursuit_sham_m_09.wav", "vj_nmrih/male_shambler/pursuit_sham_m_10.wav", "vj_nmrih/male_shambler/pursuit_sham_m_11.wav", "vj_nmrih/male_shambler/pursuit_sham_m_12.wav", "vj_nmrih/male_shambler/pursuit_sham_m_13.wav", "vj_nmrih/male_shambler/pursuit_sham_m_14.wav", "vj_nmrih/male_shambler/pursuit_sham_m_15.wav", "vj_nmrih/male_shambler/pursuit_sham_m_16.wav", "vj_nmrih/male_shambler/pursuit_sham_m_17.wav", "vj_nmrih/male_shambler/pursuit_sham_m_18.wav"}
local sdMaleS_Alert = {"vj_nmrih/male_shambler/alert1.wav", "vj_nmrih/male_shambler/alert2.wav", "vj_nmrih/male_shambler/alert3.wav", "vj_nmrih/male_shambler/alert4.wav", "vj_nmrih/male_shambler/alert5.wav", "vj_nmrih/male_shambler/alert_sham_m_01.wav", "vj_nmrih/male_shambler/alert_sham_m_02.wav", "vj_nmrih/male_shambler/alert_sham_m_03.wav", "vj_nmrih/male_shambler/alert_sham_m_04.wav", "vj_nmrih/male_shambler/alert_sham_m_05.wav", "vj_nmrih/male_shambler/alert_sham_m_06.wav", "vj_nmrih/male_shambler/alert_sham_m_07.wav", "vj_nmrih/male_shambler/alert_sham_m_08.wav", "vj_nmrih/male_shambler/alert_sham_m_09.wav", "vj_nmrih/male_shambler/alert_sham_m_10.wav", "vj_nmrih/male_shambler/alert_sham_m_11.wav", "vj_nmrih/male_shambler/alert_sham_m_12.wav", "vj_nmrih/male_shambler/alert_sham_m_13.wav", "vj_nmrih/male_shambler/alert_sham_m_14.wav", "vj_nmrih/male_shambler/alert_sham_m_15.wav", "vj_nmrih/male_shambler/alert_sham_m_16.wav", "vj_nmrih/male_shambler/alert_sham_m_17.wav", "vj_nmrih/male_shambler/alert_sham_m_18.wav", "vj_nmrih/male_shambler/alert_sham_m_19.wav", "vj_nmrih/male_shambler/alert_sham_m_20.wav", "vj_nmrih/male_shambler/alert_sham_m_21.wav"}
local sdMaleS_Attack = {"vj_nmrih/male_shambler/attack_sham_m_01.wav", "vj_nmrih/male_shambler/attack_sham_m_02.wav", "vj_nmrih/male_shambler/attack_sham_m_03.wav", "vj_nmrih/male_shambler/attack_sham_m_04.wav", "vj_nmrih/male_shambler/attack_sham_m_05.wav", "vj_nmrih/male_shambler/attack_sham_m_06.wav", "vj_nmrih/male_shambler/attack_sham_m_07.wav", "vj_nmrih/male_shambler/attack_sham_m_08.wav", "vj_nmrih/male_shambler/attack_sham_m_09.wav", "vj_nmrih/male_shambler/attack_sham_m_10.wav", "vj_nmrih/male_shambler/attack_sham_m_11.wav", "vj_nmrih/male_shambler/attack_sham_m_12.wav", "vj_nmrih/male_shambler/attack_sham_m_13.wav", "vj_nmrih/male_shambler/attack_sham_m_14.wav", "vj_nmrih/male_shambler/attack_sham_m_15.wav", "vj_nmrih/male_shambler/attack_sham_m_16.wav", "vj_nmrih/male_shambler/attack_sham_m_17.wav", "vj_nmrih/male_shambler/attack_sham_m_18.wav", "vj_nmrih/male_shambler/attack_sham_m_19.wav", "vj_nmrih/male_shambler/attack_sham_m_20.wav", "vj_nmrih/male_shambler/attack_sham_m_21.wav", "vj_nmrih/male_shambler/attack_sham_m_22.wav"}
local sdMaleS_Pain = {"vj_nmrih/male_shambler/zomb1_attack1.wav", "vj_nmrih/male_shambler/zomb1_attack2.wav", "vj_nmrih/male_shambler/zomb1_attack3.wav", "vj_nmrih/male_shambler/zomb1_attack4.wav", "vj_nmrih/male_shambler/zomb1_attack5.wav", "vj_nmrih/male_shambler/zomb1_attack6.wav", "vj_nmrih/male_shambler/zomb1_attack7.wav", "vj_nmrih/male_shambler/zomb1_attack8.wav", "vj_nmrih/male_shambler/zomb1_attack9.wav", "vj_nmrih/male_shambler/zomb1_attack10.wav", "vj_nmrih/male_shambler/zomb1_attack11.wav"}
local sdMaleS_Death = {}

-- Male Runner
local sdMaleR_Idle = {"vj_nmrih/runner/zomb_runner_male1-idle-01.wav", "vj_nmrih/runner/zomb_runner_male1-idle-02.wav", "vj_nmrih/runner/zomb_runner_male1-idle-03.wav", "vj_nmrih/runner/zomb_runner_male1-idle-04.wav", "vj_nmrih/runner/zomb_runner_male1-idle-05.wav", "vj_nmrih/runner/zomb_runner_male1-idle-06.wav", "vj_nmrih/runner/zomb_runner_male1-idle-07.wav", "vj_nmrih/runner/zomb_runner_male1-idle-08.wav", "vj_nmrih/runner/zomb_runner_male1-idle-09.wav", "vj_nmrih/runner/zomb_runner_male1-idle-10.wav"}
local sdMaleR_CombatIdle = {"vj_nmrih/runner/zomb_runner_male1-pursuit-01.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-02.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-03.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-04.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-05.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-06.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-07.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-08.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-09.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-10.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-11.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-12.wav", "vj_nmrih/runner/zomb_runner_male1-pursuit-13.wav"}
local sdMaleR_Alert = {"vj_nmrih/runner/zomb_runner_male1-alert-01.wav", "vj_nmrih/runner/zomb_runner_male1-alert-02.wav", "vj_nmrih/runner/zomb_runner_male1-alert-03.wav", "vj_nmrih/runner/zomb_runner_male1-alert-04.wav", "vj_nmrih/runner/zomb_runner_male1-alert-05.wav", "vj_nmrih/runner/zomb_runner_male1-alert-06.wav", "vj_nmrih/runner/zomb_runner_male1-alert-07.wav", "vj_nmrih/runner/zomb_runner_male1-alert-08.wav", "vj_nmrih/runner/zomb_runner_male1-alert-09.wav", "vj_nmrih/runner/zomb_runner_male1-alert-10.wav", "vj_nmrih/runner/zomb_runner_male1-alert-11.wav", "vj_nmrih/runner/zomb_runner_male1-alert-12.wav", "vj_nmrih/runner/zomb_runner_male1-alert-13.wav", "vj_nmrih/runner/zomb_runner_male1-alert-14.wav", "vj_nmrih/runner/zomb_runner_male1-alert-15.wav"}
local sdMaleR_Attack = {"vj_nmrih/runner/zomb_runner_male1-attack01.wav", "vj_nmrih/runner/zomb_runner_male1-attack02.wav", "vj_nmrih/runner/zomb_runner_male1-attack03.wav", "vj_nmrih/runner/zomb_runner_male1-attack04.wav", "vj_nmrih/runner/zomb_runner_male1-attack05.wav", "vj_nmrih/runner/zomb_runner_male1-attack06.wav", "vj_nmrih/runner/zomb_runner_male1-attack07.wav", "vj_nmrih/runner/zomb_runner_male1-attack08.wav", "vj_nmrih/runner/zomb_runner_male1-attack09.wav", "vj_nmrih/runner/zomb_runner_male1-attack10.wav", "vj_nmrih/runner/zomb_runner_male1-attack11.wav", "vj_nmrih/runner/zomb_runner_male1-attack12.wav", "vj_nmrih/runner/zomb_runner_male1-attack13.wav", "vj_nmrih/runner/zomb_runner_male1-attack14.wav", "vj_nmrih/runner/zomb_runner_male1-attack15.wav", "vj_nmrih/runner/zomb_runner_male1-attack16.wav", "vj_nmrih/runner/zomb_runner_male1-attack17.wav", "vj_nmrih/runner/zomb_runner_male1-attack18.wav", "vj_nmrih/runner/zomb_runner_male1-attack19.wav", "vj_nmrih/runner/zomb_runner_male1-attack20.wav"}
local sdMaleR_Pain = {"vj_nmrih/runner/zomb_runner_male1-pain01.wav", "vj_nmrih/runner/zomb_runner_male1-pain02.wav", "vj_nmrih/runner/zomb_runner_male1-pain03.wav", "vj_nmrih/runner/zomb_runner_male1-pain04.wav", "vj_nmrih/runner/zomb_runner_male1-pain05.wav", "vj_nmrih/runner/zomb_runner_male1-pain06.wav", "vj_nmrih/runner/zomb_runner_male1-pain07.wav", "vj_nmrih/runner/zomb_runner_male1-pain08.wav", "vj_nmrih/runner/zomb_runner_male1-pain09.wav", "vj_nmrih/runner/zomb_runner_male1-pain10.wav", "vj_nmrih/runner/zomb_runner_male1-pain11.wav", "vj_nmrih/runner/zomb_runner_male1-pain12.wav", "vj_nmrih/runner/zomb_runner_male1-pain13.wav", "vj_nmrih/runner/zomb_runner_male1-pain14.wav", "vj_nmrih/runner/zomb_runner_male1-pain15.wav", "vj_nmrih/runner/zomb_runner_male1-pain16.wav", "vj_nmrih/runner/zomb_runner_male1-pain17.wav", "vj_nmrih/runner/zomb_runner_male1-pain18.wav"}
local sdMaleR_Death = {"vj_nmrih/runner/zomb_runner_male1-death-01.wav", "vj_nmrih/runner/zomb_runner_male1-death-02.wav", "vj_nmrih/runner/zomb_runner_male1-death-03.wav", "vj_nmrih/runner/zomb_runner_male1-death-04.wav", "vj_nmrih/runner/zomb_runner_male1-death-05.wav", "vj_nmrih/runner/zomb_runner_male1-death-06.wav", "vj_nmrih/runner/zomb_runner_male1-death-07.wav", "vj_nmrih/runner/zomb_runner_male1-death-08.wav", "vj_nmrih/runner/zomb_runner_male1-death-09.wav", "vj_nmrih/runner/zomb_runner_male1-death-10.wav", "vj_nmrih/runner/zomb_runner_male1-death-11.wav", "vj_nmrih/runner/zomb_runner_male1-death-12.wav", "vj_nmrih/runner/zomb_runner_male1-death-13.wav", "vj_nmrih/runner/zomb_runner_male1-death-14.wav", "vj_nmrih/runner/zomb_runner_male1-death-15.wav", "vj_nmrih/runner/zomb_runner_male1-death-16.wav", "vj_nmrih/runner/zomb_runner_male1-death-17.wav", "vj_nmrih/runner/zomb_runner_male1-death-18.wav", "vj_nmrih/runner/zomb_runner_male1-death-19.wav", "vj_nmrih/runner/zomb_runner_male1-death-20.wav"}

-- Female
local sdFemale_Idle = {"vj_nmrih/female/femzom_idle01.wav", "vj_nmrih/female/femzom_idle02.wav", "vj_nmrih/female/femzom_idle03.wav", "vj_nmrih/female/femzom_idle04.wav", "vj_nmrih/female/femzom_idle05.wav", "vj_nmrih/female/femzom_idle06.wav", "vj_nmrih/female/femzom_idle07.wav", "vj_nmrih/female/femzom_idle08.wav", "vj_nmrih/female/femzom_idle09.wav", "vj_nmrih/female/femzom_idle10.wav", "vj_nmrih/female/femzom_idle11.wav"}
local sdFemale_Alert = {"vj_nmrih/female/femzom_sighted01.wav", "vj_nmrih/female/femzom_sighted02.wav", "vj_nmrih/female/femzom_sighted03.wav", "vj_nmrih/female/femzom_sighted04.wav", "vj_nmrih/female/femzom_sighted05.wav", "vj_nmrih/female/femzom_sighted06.wav", "vj_nmrih/female/femzom_sighted07.wav", "vj_nmrih/female/femzom_sighted08.wav", "vj_nmrih/female/femzom_sighted09.wav", "vj_nmrih/female/femzom_sighted10.wav", "vj_nmrih/female/femzom_sighted11.wav"}
local sdFemale_Attack = {"vj_nmrih/female/femzom_attack01.wav", "vj_nmrih/female/femzom_attack02.wav", "vj_nmrih/female/femzom_attack03.wav", "vj_nmrih/female/femzom_attack04.wav", "vj_nmrih/female/femzom_attack05.wav", "vj_nmrih/female/femzom_attack06.wav", "vj_nmrih/female/femzom_attack07.wav"}
local sdFemale_Pain = {"vj_nmrih/female/femzom_pain01.wav", "vj_nmrih/female/femzom_pain02.wav", "vj_nmrih/female/femzom_pain03.wav", "vj_nmrih/female/femzom_pain04.wav", "vj_nmrih/female/femzom_pain05.wav", "vj_nmrih/female/femzom_pain06.wav", "vj_nmrih/female/femzom_pain07.wav"}
local sdFemale_Death = {"vj_nmrih/female/femzom_pain01.wav", "vj_nmrih/female/femzom_pain02.wav", "vj_nmrih/female/femzom_pain03.wav", "vj_nmrih/female/femzom_pain04.wav", "vj_nmrih/female/femzom_pain05.wav", "vj_nmrih/female/femzom_pain06.wav", "vj_nmrih/female/femzom_pain07.wav"}

-- Kid
local sdKid_Idle = {"vj_nmrih/kid/z_child-idle01.wav", "vj_nmrih/kid/z_child-idle02.wav", "vj_nmrih/kid/z_child-idle03.wav", "vj_nmrih/kid/z_child-idle04.wav", "vj_nmrih/kid/z_child-idle05.wav", "vj_nmrih/kid/z_child-idle06.wav", "vj_nmrih/kid/z_child-idle07.wav", "vj_nmrih/kid/z_child-idle08.wav", "vj_nmrih/kid/z_child-idle09.wav", "vj_nmrih/kid/z_child-idle10.wav", "vj_nmrih/kid/z_child-idle11.wav", "vj_nmrih/kid/z_child-idle12.wav"}
local sdKid_CombatIdle = {"vj_nmrih/kid/z_child-pursuit01.wav", "vj_nmrih/kid/z_child-pursuit02.wav", "vj_nmrih/kid/z_child-pursuit03.wav", "vj_nmrih/kid/z_child-pursuit04.wav", "vj_nmrih/kid/z_child-pursuit05.wav", "vj_nmrih/kid/z_child-pursuit06.wav", "vj_nmrih/kid/z_child-pursuit07.wav", "vj_nmrih/kid/z_child-pursuit08.wav", "vj_nmrih/kid/z_child-pursuit09.wav", "vj_nmrih/kid/z_child-pursuit10.wav", "vj_nmrih/kid/z_child-pursuit11.wav", "vj_nmrih/kid/z_child-pursuit12.wav", "vj_nmrih/kid/z_child-pursuit13.wav", "vj_nmrih/kid/z_child-pursuit14.wav", "vj_nmrih/kid/z_child-pursuit15.wav"}
local sdKid_Alert = {"vj_nmrih/kid/z_child-alert01.wav", "vj_nmrih/kid/z_child-alert02.wav", "vj_nmrih/kid/z_child-alert03.wav", "vj_nmrih/kid/z_child-alert04.wav", "vj_nmrih/kid/z_child-alert05.wav", "vj_nmrih/kid/z_child-alert06.wav", "vj_nmrih/kid/z_child-alert07.wav", "vj_nmrih/kid/z_child-alert08.wav", "vj_nmrih/kid/z_child-alert09.wav", "vj_nmrih/kid/z_child-alert10.wav", "vj_nmrih/kid/z_child-alert11.wav", "vj_nmrih/kid/z_child-alert12.wav", "vj_nmrih/kid/z_child-alert13.wav", "vj_nmrih/kid/z_child-alert14.wav", "vj_nmrih/kid/z_child-alert15.wav", "vj_nmrih/kid/z_child-alert16.wav"}
local sdKid_Attack = {"vj_nmrih/kid/z_child-attack01.wav", "vj_nmrih/kid/z_child-attack02.wav", "vj_nmrih/kid/z_child-attack03.wav", "vj_nmrih/kid/z_child-attack04.wav", "vj_nmrih/kid/z_child-attack05.wav", "vj_nmrih/kid/z_child-attack06.wav", "vj_nmrih/kid/z_child-attack07.wav", "vj_nmrih/kid/z_child-attack08.wav", "vj_nmrih/kid/z_child-attack09.wav", "vj_nmrih/kid/z_child-attack10.wav", "vj_nmrih/kid/z_child-attack11.wav", "vj_nmrih/kid/z_child-attack12.wav", "vj_nmrih/kid/z_child-attack13.wav", "vj_nmrih/kid/z_child-attack14.wav", "vj_nmrih/kid/z_child-attack15.wav", "vj_nmrih/kid/z_child-attack16.wav", "vj_nmrih/kid/z_child-attack17.wav"}
local sdKid_Pain = {"vj_nmrih/kid/z_child-pain01.wav", "vj_nmrih/kid/z_child-pain02.wav", "vj_nmrih/kid/z_child-pain03.wav", "vj_nmrih/kid/z_child-pain04.wav", "vj_nmrih/kid/z_child-pain05.wav", "vj_nmrih/kid/z_child-pain06.wav", "vj_nmrih/kid/z_child-pain07.wav", "vj_nmrih/kid/z_child-pain08.wav", "vj_nmrih/kid/z_child-pain09.wav", "vj_nmrih/kid/z_child-pain10.wav", "vj_nmrih/kid/z_child-pain11.wav", "vj_nmrih/kid/z_child-pain12.wav", "vj_nmrih/kid/z_child-pain13.wav", "vj_nmrih/kid/z_child-pain14.wav", "vj_nmrih/kid/z_child-pain15.wav", "vj_nmrih/kid/z_child-pain16.wav", "vj_nmrih/kid/z_child-pain17.wav", "vj_nmrih/kid/z_child-pain18.wav", "vj_nmrih/kid/z_child-pain19.wav", "vj_nmrih/kid/z_child-pain20.wav", "vj_nmrih/kid/z_child-pain21.wav", "vj_nmrih/kid/z_child-pain22.wav", "vj_nmrih/kid/z_child-pain23.wav"}
local sdKid_Death = {"vj_nmrih/kid/z_child-death01.wav", "vj_nmrih/kid/z_child-death02.wav", "vj_nmrih/kid/z_child-death03.wav", "vj_nmrih/kid/z_child-death04.wav", "vj_nmrih/kid/z_child-death05.wav", "vj_nmrih/kid/z_child-death06.wav", "vj_nmrih/kid/z_child-death07.wav", "vj_nmrih/kid/z_child-death08.wav", "vj_nmrih/kid/z_child-death09.wav", "vj_nmrih/kid/z_child-death10.wav", "vj_nmrih/kid/z_child-death11.wav", "vj_nmrih/kid/z_child-death12.wav", "vj_nmrih/kid/z_child-death13.wav", "vj_nmrih/kid/z_child-death14.wav", "vj_nmrih/kid/z_child-death15.wav", "vj_nmrih/kid/z_child-death16.wav"}

local shamblerACTs = {ACT_WALK, ACT_HL2MP_WALK_ZOMBIE_01, ACT_HL2MP_WALK_ZOMBIE_02, ACT_HL2MP_WALK_ZOMBIE_03, ACT_HL2MP_WALK_ZOMBIE_04, ACT_HL2MP_WALK_ZOMBIE_05, ACT_HL2MP_WALK_ZOMBIE_06, ACT_HL2MP_WALK_ZOMBIE, ACT_HL2MP_WALK_CROUCH_ZOMBIE_01, ACT_HL2MP_WALK_CROUCH_ZOMBIE_02}

-- Custom
ENT.Zombie_Type = 0 -- 0 = Shambler | 1 = Runner | 2 = Unique
ENT.Zombie_Gender = 0 -- 0 = Male | 1 = Female | 2 = Kid
ENT.Zombie_MoveAnim = ACT_WALK
ENT.Zombie_IsCrawling = false
ENT.Zombie_LegHP = 30
ENT.Zombie_GibNumber = -1 -- "-1" = Do NOT gib!
ENT.Zombie_CanRunOnFire = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:NMRIH_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	-- Setup sounds
	if self.Zombie_Gender == 1 then -- Female
		self.SoundTbl_Idle = sdFemale_Idle
		self.SoundTbl_Alert = sdFemale_Alert
		self.SoundTbl_BeforeMeleeAttack = sdFemale_Attack
		self.SoundTbl_Pain = sdFemale_Pain
		self.SoundTbl_Death = sdFemale_Death
	elseif self.Zombie_Gender == 2 then -- Kid
		self.SoundTbl_Idle = sdKid_Idle
		self.SoundTbl_CombatIdle = sdKid_CombatIdle
		self.SoundTbl_Alert = sdKid_Alert
		self.SoundTbl_BeforeMeleeAttack = sdKid_Attack
		self.SoundTbl_Pain = sdKid_Pain
		self.SoundTbl_Death = sdKid_Death
	else -- Male
		if self.Zombie_Type == 1 then -- Male runner
			self.SoundTbl_Idle = sdMaleR_Idle
			self.SoundTbl_CombatIdle = sdMaleR_CombatIdle
			self.SoundTbl_Alert = sdMaleR_Alert
			self.SoundTbl_BeforeMeleeAttack = sdMaleR_Attack
			self.SoundTbl_Pain = sdMaleR_Pain
			self.SoundTbl_Death = sdMaleR_Death
		else -- Male Shambler
			self.SoundTbl_Idle = sdMaleS_Idle
			self.SoundTbl_CombatIdle = sdMaleS_CombatIdle
			self.SoundTbl_Alert = sdMaleS_Alert
			self.SoundTbl_BeforeMeleeAttack = sdMaleS_Attack
			self.SoundTbl_Pain = sdMaleS_Pain
			self.SoundTbl_Death = sdMaleS_Death
		end
	end
	
	-- Setup animations
	if self.Zombie_Type == 1 then -- Runner
		self.Zombie_MoveAnim = ACT_RUN
	else -- Shambler
		self.Zombie_MoveAnim = VJ.PICK(shamblerACTs)
		self.Zombie_CanRunOnFire = math.random(1, 10) == 1
	end
	
	self:NMRIH_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if self.Zombie_IsCrawling == true then
		if act == ACT_IDLE then
			return ACT_CROUCHIDLE
		elseif act == ACT_WALK or act == ACT_RUN then
			return ACT_WALK_CROUCH
		end
	elseif act == ACT_WALK or act == ACT_RUN then
		return self.Zombie_MoveAnim
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print("OnInput: ", key, activator, caller, data)
	if key == "melee" then
		self.MeleeAttackDamage = 15
		self:ExecuteMeleeAttack()
	elseif key == "melee_double" then
		self.MeleeAttackDamage = 20
		self:ExecuteMeleeAttack()
	elseif key == "crawl_melee" then
		self.MeleeAttackDamage = 12
		self:ExecuteMeleeAttack()
	elseif key == "step" then
		self:PlayFootstepSound()
	elseif key == "crawl_step" then
		self:PlayFootstepSound(sdCrawling)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
	-- Headshots do 2.5x more damage!
	if status == "PreDamage" && hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(2.5)
	elseif status == "PostDamage" && self.Zombie_Gender != 2 then
		-- Make shamblers have a chance to run if on fire
		if self.Zombie_CanRunOnFire && self:IsOnFire() then
			self.Zombie_MoveAnim = ACT_RUN
		end
		
		-- Handle crawling code
		if hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
			self.Zombie_LegHP = self.Zombie_LegHP - dmginfo:GetDamage()
			if self.Zombie_LegHP <= 0 then
				self.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK_SWING
				self.Zombie_IsCrawling = true
				self.CanFlinch = false
				self:SetCollisionBounds(Vector(25, 25, 20), -Vector(25, 25, 0))
				self:SetSurroundingBounds(Vector(60, 60, 30), -Vector(60, 60, 0))
				local newEyeOffset = self:GetUp() * 15
				self:SetViewOffset(newEyeOffset)
				self:SetSaveValue("m_vDefaultEyeOffset", newEyeOffset)
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
	if status == "Init" then
		-- Shoving system
		local dmgType = dmginfo:GetDamageType()
		if dmginfo:GetDamageCustom() == VJ.DMG_FORCE_FLINCH or ((dmgType == DMG_CLUB or dmgType == DMG_SLASH) && dmginfo:GetDamageForce():Length() > 800 && dmginfo:GetDamage() > 10) then
			local attacker = dmginfo:GetAttacker()
			if !IsValid(attacker) then
				attacker = dmginfo:GetInflictor()
			end
			if IsValid(attacker) && attacker:IsPlayer() then
				self.AnimTbl_Flinch = ACT_STEP_FORE
				if self.Zombie_Gender != 2 then -- Child zombies only have forward animation
					local playerAim = attacker:GetAimVector()
					local dotForward = playerAim:Dot(self:GetForward())
					local dotRight = playerAim:Dot(self:GetRight())
					if dotForward > 0.5 then
						self.AnimTbl_Flinch = ACT_STEP_BACK
					elseif dotForward < -0.5 then
						self.AnimTbl_Flinch = ACT_STEP_FORE
					elseif dotRight > 0.5 then
						self.AnimTbl_Flinch = ACT_STEP_LEFT
					elseif dotRight < -0.5 then
						self.AnimTbl_Flinch = ACT_STEP_RIGHT
					end
				end
				return
			end
			return true -- Disallow flinching
		end
		
		-- Non-melee attacks
		self.AnimTbl_Flinch = ACT_STEP_FORE
		return math.random(1, 16) != 1
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self.Zombie_GibNumber != -1 && hitgroup == HITGROUP_HEAD && (dmginfo:GetDamageForce():Length() > 800 or dmginfo:GetDamage() > 75) then
		local attachData = self:GetAttachment(self:LookupAttachment("headshot_squirt"))
		
		self.HasDeathSounds = false -- No death sounds when head is blown off!
		if self:GetModel() == "models/vj_nmrih/national_guard.mdl" then self:SetBodygroup(1, 1) end -- No helmet for national guard
		self:SetBodygroup(self.Zombie_GibNumber.a, self.Zombie_GibNumber.b)
		
		-- Main drainage particles are in "OnCreateDeathCorpse"
		if self.HasGibOnDeathEffects then
			for _ = 1, 3 do
				ParticleEffect("blood_impact_red_01", attachData.Pos, attachData.Ang)
			end
		end
		
		-- Create the gibs
		self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small1.mdl", {Pos=attachData.Pos + self:GetUp() * 5})
		if self.Zombie_Gender != 2 then -- Kids create less gibs
			self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small2.mdl", {Pos=attachData.Pos + self:GetUp() * 5 + self:GetRight() * 5})
			self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/gib_small3.mdl", {Pos=attachData.Pos + self:GetUp() * 5 + self:GetRight() * -5})
		end
		
		self:PlaySoundSystem("Gib", sdHeadshot)
		return true, {AllowCorpse = true, AllowSound = false}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if self.GibbedOnDeath && self.HasGibOnDeathEffects then
		local attach = corpse:LookupAttachment("headshot_squirt")
		VJ.EmitSound(corpse, sdHeadshotDrain, 60, math.random(80, 100))
		ParticleEffectAttach("vj_nmrih_blood_drain", PATTACH_POINT_FOLLOW, corpse, attach)
		//ParticleEffectAttach("vj_nmrih_blood_drain_big", PATTACH_POINT_FOLLOW, corpse, attach)
		ParticleEffectAttach("vj_nmrih_blood_drain_short", PATTACH_POINT_FOLLOW, corpse, attach)
		ParticleEffectAttach("vj_nmrih_blood_trails", PATTACH_POINT_FOLLOW, corpse, attach)
	end
end