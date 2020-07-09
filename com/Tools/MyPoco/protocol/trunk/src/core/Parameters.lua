
local Parameters = {
    ROUND_MAX = 1, -- 战斗回合数上限
    ANGER_MAX = 2, -- 武将怒气上限
    COMBO_MAX = 3, -- 合击值上限
    
    COMBO_PARAM1 = 101, -- 合击人数系数（101-106）
    COMBO_PARAM2 = 102,
    COMBO_PARAM3 = 103,
    COMBO_PARAM4 = 104,
    COMBO_PARAM5 = 105,
    COMBO_PARAM6 = 106,

    BASE_BUFF_PER_LOW = 1001, -- buff百分比修正
    BASE_BUFF_PER_HIGH = 1002,
    BASE_SUCK_LOW = 1003, -- 吸血量修正
    BASE_SUCK_HIGH = 1004,
    BASE_HIT_RECOVER_RATE_LOW = 1005, -- 受击回血概率修正
    BASE_HIT_RECOVER_RATE_HIGH = 1006,
    BASE_HIT_RECOVER_PER_LOW = 1007, -- 受击回血量修正
    BASE_HIT_RECOVER_PER_HIGH = 1008,
    BASE_HIT_BACK_PHY_RATE_LOW = 1009, -- 物理反伤概率修正
    BASE_HIT_BACK_PHY_RATE_HIGH = 1010,
    BASE_HIT_BACK_PHY_VALUE_LOW = 1011, -- 物理反伤量修正
    BASE_HIT_BACK_PHY_VALUE_HIGH = 1012,
    BASE_HIT_BACK_MAG_RATE_LOW = 1013, -- 法术反伤概率修正
    BASE_HIT_BACK_MAG_RATE_HIGH = 1014,
    BASE_HIT_BACK_MAG_VALUE_LOW = 1015, -- 法术反伤量修正
    BASE_HIT_BACK_MAG_VALUE_HIGH = 1016,
    BASE_DEANGER_RATE_LOW = 1017, -- 减怒命中判断
    BASE_DEANGER_RATE_HIGH = 1018,
    BASE_FINAL_DEANGER_RATE_LOW = 1019, -- 最终减怒概率
    BASE_FINAL_DEANGER_RATE_HIGH = 1020,
    BASE_DEBUFF_RATE_LOW = 1021, -- 减益buff命中判断
    BASE_DEBUFF_RATE_HIGH = 1022,
    BASE_FINAL_DEBUFF_RATE_LOW = 1023, -- 最终减益buff命中概率
    BASE_FINAL_DEBUFF_RATE_HIGH = 1024,

    NDEF_LOW = 2001, -- 无视防御修正
    NDEF_HIGH = 2002,
    HIT_LOW = 2003, -- 命中率修正
    HIT_HIGH = 2004,
    CRIT_RATE_LOW = 2005, -- 暴击率修正
    CRIT_RATE_HIGH = 2006,
    CRIT_LOW = 2007, -- 暴击伤害强度修正
    CRIT_HIGH = 2008,
    BLOCK_RATE_LOW = 2009, -- 格挡率修正
    BLOCK_RATE_HIGH = 2010,
    BLOCK_LOW = 2011, -- 格挡免伤强度修正
    BLOCK_HIGH = 2012,
    GROUP_LOW = 2013, -- 抗灭增伤率修正
    GROUP_HIGH = 2014,
    DAMAGEUP_LOW = 2015, -- 增伤率修正下限
    DAMAGEUP_HIGH = 2016, 
    FDAMAGEUP_LOW = 2017, -- 最终增伤率修正
    FDAMAGEUP_HIGH = 2018,
    FIGHTVALUE_LOW = 2019, -- 战力免伤系数修正
    FIGHTVALUE_HIGH = 2020,
    HEAL_CRIT_RATE_LOW = 2021, -- 回复暴击率修正
    HEAL_CRIT_RATE_HIGH = 2022, 
    HEAL_CRIT_LOW = 2023, -- 回复暴击强度修正
    HEAL_CRIT_HIGH = 2024,
    HEALUP_LOW = 2025, -- 治疗量增益修正
    HEALUP_HIGH = 2026,

    COMBO_CRIT_RATE_LOW = 2027, -- 合击暴击率修正
    COMBO_CRIT_RATE_HIGH = 2028,
    COMBO_CRIT_LOW = 2029, -- 合击暴击伤害修正
    COMBO_CRIT_HIGH = 2030,
    COMBO_DAMUP_LOW = 2031, -- 合击增伤修正下限
    COMBO_DAMUP_HIGH = 2032,
    COMBO_FDAMUP_LOW = 2033, -- 合击最终增伤修正
    COMBO_FDAMUP_HIGH = 2034,
    COMBO_FIGHTVALUE_LOW = 2035, -- 合击战力免伤系数修正
    COMBO_FIGHTVALUE_HIGH = 2036,
    COMBO_HEAL_CRIT_RATE_LOW = 2037, -- 合击回复暴击率修正
    COMBO_HEAL_CRIT_RATE_HIGH = 2038, 
    COMBO_HEAL_CRIT_LOW = 2039, -- 合击回复暴击强度修正
    COMBO_HEAL_CRIT_HIGH = 2040,

    KTOM_DAMAGE_LOW = 2041, -- 怪物额外受武将伤害修正
    KTOM_DAMAGE_HIGH = 2042,
    UTOM_DAMAGE_LOW = 2043, -- 怪物额外受合击伤害修正
    UTOM_DAMAGE_HIGH = 2044,
}

local param_info = loadCfg("cfg.battle_parameter_info")
local para_info = {}
for k , v in pairs(Parameters) do
	local info = param_info.get(v)
	local value = info.value_sign > 0 and -info.value or info.value
    Parameters[k] = value
end

-- 根据人数返回合击系数
Parameters.getComboParameter = function ( number )
    return Parameters["COMBO_PARAM"..number]
end

Parameters.getData = function ( pType )
    return para_info[pType]
end

return Parameters
