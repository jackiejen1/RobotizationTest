local BattleAttrRe = {
    [1] = "INITIAL_HP",
	[2] = "ATTACK",
	[3] = "PHY_DEFENCE",
	[4] = "MAG_DEFENCE",
	[5] = "DEFENCE",
	[6] = "SHIELD",
	[11] = "HP_PCT",
	[12] = "ATTACK_PCT",
	[13] = "PHY_DEFENCE_PCT",
	[14] = "MAG_DEFENCE_PCT",
	[15] = "DEFENCE_PCT",
	[16] = "ALL_PCT",
	[101] = "ACCURACY_RATE",
	[102] = "DODGE_RATE",
	[103] = "CRIT_RATE",
	[104] = "HARDEN_RATE",
	[105] = "BLOCK_RATE",
	[106] = "PIERCE_RATE",
	[201] = "BLOCK_DAMAGE_ADD",
	[202] = "BLOCK_DAMAGE_DEC",
	[203] = "CRIT_DAMAGE_ADD",
	[204] = "CRIT_DAMAGE_DEC",
	[205] = "PVP_DAMAGE_ADD",
	[206] = "PVP_DAMAGE_DEC",
	[207] = "DAMAGE_ADD",
	[208] = "DAMAGE_DEC",
	[209] = "FIN_DAMAGE_ADD",
	[210] = "FIN_DAMAGE_DEC",
	[211] = "HEAL_ADD",
	[212] = "HEAL_DEC",
	[301] = "WEI_DAMAGE_DEC",
	[302] = "SHU_DAMAGE_DEC",
	[303] = "WU_DAMAGE_DEC",
	[304] = "QUN_DAMAGE_DEC",
	[305] = "WEI_DAMAGE_ADD",
	[306] = "SHU_DAMAGE_ADD",
	[307] = "WU_DAMAGE_ADD",
	[308] = "QUN_DAMAGE_ADD",
	[401] = "INITIAL_ANGER",
	[402] = "ANGER_RECOVER",
	[501] = "IGNORE_DEF_ADD",
	[502] = "IGNORE_DEF_DEC",
	[503] = "DRAIN_LIFE_ADD",
	[504] = "DRAIN_LIFE_DEC",
	[505] = "DRAIN_LIFE_ADD_RATE",
	[506] = "DRAIN_LIFE_DEC_RATE",
	[507] = "DRAIN_LIFE_ADD_PCT",
	[508] = "DRAIN_LIFE_DEC_PCT",
	[509] = "PHY_HITBACK_RATE_ADD",
	[510] = "PHY_HITBACK_RATE_DEC",
	[511] = "PHY_HITBACK_PCT_ADD",
	[512] = "PHY_HITBACK_PCT_DEC",
	[513] = "MAG_HITBACK_RATE_ADD",
	[514] = "MAG_HITBACK_RATE_DEC",
	[515] = "MAG_HITBACK_PCT_ADD",
	[516] = "MAG_HITBACK_PCT_DEC",
	[517] = "REANGER_ACCURATY_ADD",
	[518] = "REANGER_ACCURATY_DEC",
	[519] = "DEBUFF_ACCURATY_ADD",
	[520] = "DEBUFF_ACCURATY_DEC",
	[601] = "INITIAL_COMBO",
	[602] = "MAXIMUM_COMBO",
	[603] = "COMBO_RECOVER_ACTION",
	[604] = "COMBO_RECOVER_SKILL",
	[605] = "COMBO_RECOVER_ROUND",
	[606] = "COMBO_CRIT_RATE",
	[607] = "COMBO_HARDEN_RATE",
	[608] = "COMBO_CRIT_DAMAGE_ADD",
	[609] = "COMBO_CRIT_DAMAGE_DEC",
	[610] = "COMBO_DAMAGE_ADD",
	[611] = "COMBO_DAMAGE_DEC",
	[651] = "COMBO_ATTACK", -- 合击攻击力
	[652] = "COMBO_FINAL_DAMAGE_ADD", -- 合击最终增伤
	[653] = "COMBO_FINAL_DAMAGE_DEC", -- 合击最终减伤
	[701] = "BATTLE_HP", -- 当前血量
	[702] = "BATTLE_ANGER",
	[703] = "BATTLE_COMBO",
	[901] = "BATTLE_KTOM_DAMAGE_ADD", -- 怪物额外受武将伤害
	[902] = "BATTLE_KTOM_DAMAGE_DESC", -- 怪物额外减免武将伤害
	[903] = "BATTLE_UTOM_DAMAGE_ADD", -- 怪物额外受合击伤害
	[904] = "BATTLE_UTOM_DAMAGE_DESC", -- 怪物额外减免合击伤害
	[1001] = "QUALITY_SUPPRESSION", -- 品质减伤压制系数
	[1101] = "INITIAL_ENERGY", -- 必杀技能量
}

return BattleAttrRe