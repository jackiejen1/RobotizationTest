--[==================[

	buff效果

	配置在buff_info表里的数据

]==================]

--[[
    武将的buff触发时机分类
    1，影响战斗属性的buff
    2, dot,hot类buff
	3, 行动类buff(比如冰冻)
    4, 出手技能选定buff
]]

local BuffRule = {}

BuffRule.TYPE = {
    ATTR = 1,
    DHOT = 2,
	ACT_LIMIT = 3, -- 人物出手受限, 无法行动, 比如眩晕,石化
	SKILL_CHOOSE = 4, -- 选择技能受限, (比如沉默, 缴械)
	INVINCIBLE = 5, -- 血条被锁定,无敌
	TRANSFORM = 6, -- 变身	
}

BuffRule.ROUND = {
	AFTER = 1, --先行动再减回合
	BEFORE = 2, -- 先减回合再行动
}

local insert = table.insert
local BattleAttrRe = load "const.BattleAttrRe"

function BuffRule.initRule(buff)

    local buffInfo = buff.buffCfg
    
	return BuffRule["_initBuffType"..buffInfo.buff_type](buff)

end

-- buff属性映射
BuffRule.buffAttr = {
	[1] = 12,
	[2] = 13,
	[3] = 14,
	[4] = 15,
	[5] = 16,
	[6] = 101,
	[7] = 102,
	[8] = 103,
	[9] = 104,
	[10] = 105,
	[11] = 106,
	[12] = 201,
	[13] = 202,
	[14] = 203,
	[15] = 204,
	[16] = 205,
	[17] = 206,
	[18] = 207,
	[19] = 208,
	[20] = 209,
	[21] = 210,
	[22] = 211,
	[23] = 212,
}

-- 1-影响战斗属性的buff
function BuffRule._initBuffType1(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	local effectType = buffInfo.buff_effect_type
	local attrType = BuffRule.buffAttr[effectType]
	return function ( )
		local attrName = BattleAttrRe[attrType]
		local value = victim.advanceInfo[attrName]
		local rate = buffInfo.buff_attribute_type == 1 and 1 or -1
		value = value + buffInfo.buff_value_1*rate
		victim.advanceInfo[attrName] = value
    end
end

-- 2 dot,hot类buff
function BuffRule._initBuffType2(buff)
	local buffInfo = buff.buffCfg
	local attacker = buff.attacker
	local victim = buff.victim
	local attack = attacker.advanceInfo.totalAtk
	local buffType = buffInfo.buff_effect_type
	return function ( data )
		local value = 0
        local effectType = 1
        -- 检查victim是否无敌
        local is_invincible = victim:doBuff(BuffRule.TYPE.INVINCIBLE)
		if buffType == 1001 then
            -- 灼烧
            if is_invincible then
                value = 0
            else
                value = math.floor(attack*buffInfo.buff_value_1/1000)
            end
		elseif buffType == 1002 then
            -- 中毒
            if is_invincible then
                value = 0
            else
			    value = math.min(math.floor(victim.originInfo.INITIAL_HP*buffInfo.buff_value_1/1000),math.floor(attack*buffInfo.buff_value_2/1000))
            end
        elseif buffType == 1003 then
			-- 持续恢复
			effectType = 2
			value = math.floor(attack*buffInfo.buff_value_1/1000)
		end
		local effect = {effect_type = effectType,effect_value = value}
		local battleBuff = {
			buff_id = buffInfo.id,
			buff_serial_id = buff.serialId,
			knight_serial_id = victim.serialId,
			buff_action = 3,
			buff_effect = effect,
			attacker = attacker,
		}
		table.insert(data,#data+1,battleBuff)
        return data
    end
end

-- 3-行动类buff(比如冰冻)
function BuffRule._initBuffType3(buff)
	return function ( data )
        return true
    end
end

-- 4-出手技能选定buff
function BuffRule._initBuffType4(buff)
	return function ( data )
        return true
    end
end

-- 5-血条被锁定, 无敌了
function BuffRule._initBuffType5(buff)
	return function ( data )
        return true
    end
end

-- 6-变身
function BuffRule._initBuffType6(buff)
	local buffInfo = buff.buffCfg
	local attacker = buff.attacker
	local victim = buff.victim
	-- 计算变身后的技能
	local knight_info = loadCfg "cfg.knight_info"
	local knightId = buffInfo.buff_value_1
	local knightCfg = knight_info.get(knightId)
	local commonSkillId = knightCfg.common_id
	local activeSkillId = knightCfg.active_skill_id
	local skill_info = loadCfg "cfg.skill_info"
	local commonSkillCfg = skill_info.get(commonSkillId)
	local activeSkillCfg = skill_info.get(activeSkillId)
	return function ( data )
        return {
			commonSkillCfg = commonSkillCfg,
			activeSkillCfg = activeSkillCfg,
		}
    end
end


return BuffRule