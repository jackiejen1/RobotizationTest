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

local Parameters = load "core.Parameters"

local BuffRule = {}

BuffRule.TYPE = {
    ATTR = 1,
    DHOT = 2,
	ACT_LIMIT = 3, -- 人物出手受限, 无法行动, 比如眩晕,石化
	SKILL_CHOOSE = 4, -- 选择技能受限, (比如沉默, 缴械)
	INVINCIBLE = 5, -- 血条被锁定,无敌
	TRANSFORM = 6, -- 变身	
	FORCE_MISS = 7,	-- 强制闪避（无法抵抗DOT）
	RESIST_LIMIT = 8, -- 无法被沉默、眩晕
	RESIST_DEANGER = 9,	-- 无法被减怒
	EXILE = 10,			-- 放逐
	HP_LINK = 11,	-- 友方生命链接
	OP_HP_LINK = 12,	-- 敌方生命诅咒
	RESIST_DEAD = 13,	-- 抵抗死亡
	ATTACH_MAGIC = 14,	-- 攻击附魔
	DAMAGE_DES = 15,	-- 伤害减免
	PASSIVE_SKILL = 16,	-- 附加被动技能
	DOT_DAMAGE_DES = 17, -- DOT伤害变化
	EXTRA_ANGER_COST = 18,	-- 怒气消耗提升
	TAUNT = 19,	-- 嘲讽
	SIPHON_ATTR = 20,	-- 属性吸取
	RESIST_SILENCE = 21, -- 免疫沉默
	RESIST_STUN = 22, -- 免疫眩晕
	SHIELD = 23, -- 护盾
	RESIST_CONTROL = 24, -- 免疫控制类
	DISABLE_RECOVER_ANGER = 25, -- 无法回复怒气
	TARGET_ACCURACY_RATE = 26, -- 目标命中率
}

BuffRule.EFFECT_TYPE = {
	BURNING = 1001,	-- 灼烧
	SILENCE = 1004, -- 沉默
	STUN = 1005,	-- 眩晕
	FROZEN = 1009,	-- 冰冻
	SIPHON_ATTR_DESC = 1023,	-- 属性吸取 被吸取方
	SIPHON_ATTR_ADD = 1024,	-- 属性吸取，吸取方
	BLAST_BURNING = 1033, -- 爆炎
}

BuffRule.ROUND = {
	AFTER = 1, --先行动再减回合
	BEFORE = 2, -- 先减回合再行动
}

-- buff消失条件
BuffRule.DISAPPEAR = {
	AFFECT = 1, --生效X次
	DEAD = 2, -- 发起者死亡
	AFFECT_ROUND = 3, --生效一回合
	SHIELD = 4, --护盾消失时移除
	DAMAGE = 5, -- 受到一定生命百分比伤害
}

-- buff被动触发类型
BuffRule.SKILL_TRIGGER_TYPE = {
	AFFECT = 1,	-- 生效时
	DISAPPEAR = 2,	-- 消失时
}

local insert = table.insert
local BattleAttrRe = load "const.BattleAttrRe"

function BuffRule.initRule(buff, battleField)

    local buffInfo = buff.buffCfg
    
	return BuffRule["_initBuffType"..buffInfo.buff_type](buff, battleField)

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
		return true
    end
end

-- 2 dot,hot类buff
function BuffRule._initBuffType2(buff, battleField)
	local buffInfo = buff.buffCfg
	local attacker = buff.attacker
	local victim = buff.victim
	local attack = attacker.advanceInfo.totalAtk
	local buffType = buffInfo.buff_effect_type
	
	local effectType = 1
	local damage = 0
	if buffType == 1001 then
		-- 灼烧
		damage = math.floor(attack*buffInfo.buff_value_1/1000)
	elseif buffType == 1002 then
		-- 猛毒
		damage = math.min(math.floor(victim.originInfo.INITIAL_HP*buffInfo.buff_value_1/1000),math.floor(attack*buffInfo.buff_value_2/1000))
	elseif buffType == 1003 then
		-- 持续恢复
		effectType = 2
		damage = math.floor(attack*buffInfo.buff_value_1/1000)
	elseif buffType == 1012 then
		--  中毒
		damage = math.floor(attack*buffInfo.buff_value_1/1000)
	elseif buffType == 1029 then
		-- 怒气灼烧
		effectType = 3
		damage = buffInfo.buff_value_1
	elseif buffType == BuffRule.EFFECT_TYPE.BLAST_BURNING then
		-- 爆炎灼烧，按生命百分比X%扣血，有50%概率造成Z倍暴击伤害
		damage = math.min(math.floor(victim.originInfo.INITIAL_HP*buffInfo.buff_value_1/1000),math.floor(attack*buffInfo.buff_value_2/1000))
	end
	-- 导出DOT, HOT伤害数值（如灼烧引爆效果，需要获取灼伤伤害）
	buff.exports.damage = damage

	return function ( data )
		-- 检查victim是否无敌
		local value = damage
		local is_invincible = victim:doBuff(BuffRule.TYPE.INVINCIBLE)
		if is_invincible and effectType == 1 then
			value = 0
		end
		if buffType == BuffRule.EFFECT_TYPE.BLAST_BURNING then
			-- 爆炎灼烧，按生命百分比X%扣血，有50%概率造成Z倍暴击伤害
			if battleField:bingo(500) then
				value = math.floor(value * buffInfo.buff_value_3 / 1000)
				-- 爆炎暴击同时对周围目标单位造成50%的额外伤害
				local knightList = battleField:getBattleData():getNearKnightList(victim)
				for i, knight in ipairs(knightList) do
					local effect = {effect_type = effectType,effect_value = math.floor(value / 2)}
					local battleBuff = {
						buff_id = buffInfo.id,
						buff_serial_id = buff.serialId,
						victim = knight,
						buff_action = 3,
						buff_effect = effect,
						attacker = attacker,
					}
					table.insert(data,#data+1,battleBuff)
				end
			end
		end
		local effect = {effect_type = effectType,effect_value = value}
		if effectType == 1 then
			victim:doBuff(BuffRule.TYPE.DOT_DAMAGE_DES, {
				buffType = buffType,
				effect = effect,
			})
		end
		local battleBuff = {
			buff_id = buffInfo.id,
			buff_serial_id = buff.serialId,
			victim = victim,
			buff_action = 3,
			buff_effect = effect,
			attacker = attacker,
		}
		table.insert(data,#data+1,battleBuff)
		
        return true, data
    end
end

-- 3-行动类buff(比如冰冻)
function BuffRule._initBuffType3(buff)
	return function ( data )
        return true, true
    end
end

-- 4-出手技能选定buff
function BuffRule._initBuffType4(buff)
	return function ( data )
        return true, true
    end
end

-- 5-血条被锁定, 无敌了
function BuffRule._initBuffType5(buff)
	return function ( data )
        return true, true
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
	local energySkillId = knightCfg.energy_skill_id
	local skill_info = loadCfg "cfg.skill_info"
	local commonSkillCfg = skill_info.get(commonSkillId)
	local activeSkillCfg = skill_info.get(activeSkillId)
	local energySkillCfg = skill_info.get(energySkillId)
	return function ( data )
        return true, {
			commonSkillCfg = commonSkillCfg,
			activeSkillCfg = activeSkillCfg,
			energySkillCfg = energySkillCfg,
		}
    end
end

-- 7-疾风，生效期间，必定闪避X次伤害，X到达上限时，清除该buff
-- 敌方武将出手的所有伤害都闪避（包括触发的被动）
-- 可以闪避合击伤害
function BuffRule._initBuffType7(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	local leftTime = buffInfo.buff_value_1
	local isAffect = false
	return function (attackFinish)
		if attackFinish then
			if isAffect then
				leftTime = leftTime - 1
				if leftTime <= 0 then
					-- victim:delBuff(buff.serialId)
					buff.isDone = true
				end
				isAffect = false
			end
		else
			isAffect = true
		end
		return true, true
	end
end

-- 8-无法被眩晕、沉默
function BuffRule._initBuffType8(buff)
	local func = function (data)
		return true, true
	end
	return {[21]=func, [22]=func}
end

-- 9-无法被减怒
function BuffRule._initBuffType9(buff)
	return function (data)
		return true, true
	end
end

-- 10-放逐
-- 改为眩晕加减伤
function BuffRule._initBuffType10(buff)
	local func = function (data)
		return true, true
	end
	return {[3]=BuffRule._initBuffType3(buff),[10] = func,[15]=BuffRule._initBuffType15(buff)}
end

-- 11-生命链接
function BuffRule._initBuffType11(buff, battleField)
	local buffInfo = buff.buffCfg
	local attacker = buff.attacker
	local victim = buff.victim
	local battleData = battleField:getBattleData()
	local identity = victim.identity
	return function (data)
		-- 找到同阵营链接对象
		local knights = battleData:getKnights()
		for i, knight in knights:ipairs(identity) do
			if not knight.isDead then
				-- 找到生命链接的队友
				if knight.serialId ~= victim.serialId then
					local buffs = knight:getBuffs()
					for j, buff in ipairs(buffs) do
						if buff.buffCfg.buff_type == BuffRule.TYPE.HP_LINK then
							insert(data, knight)
							break
						end
					end
				end
			end
		end
		return true, data
	end
end

-- 12-生命诅咒
function BuffRule._initBuffType12(buff, battleField)
	-- 发起诅咒者死亡，清除被诅咒人的相应buff
	local buffInfo = buff.buffCfg
	local attacker = buff.attacker
	local victim = buff.victim
	local opIdentity = 3 - attacker.identity
	return function (data)
		if attacker.serialId == victim.serialId then
			-- 生命诅咒的发起者
			local knights = battleField:getBattleData():getKnights()
			for i, knight in knights:ipairs(opIdentity) do
				if not knight.isDead then
					local buffs = knight:getBuffs()
					for j, buff in ipairs(buffs) do
						-- 找到被生命诅咒的敌方，且发起者是同一人
						if buff.buffCfg.buff_type == BuffRule.TYPE.OP_HP_LINK and buff.attacker.serialId == attacker.serialId then
							insert(data, knight)
							break
						end
					end
				end
			end
			return true, data
		end
		return false
	end
end

-- 13-致死保护
function BuffRule._initBuffType13(buff)
	local victim = buff.victim
	return function (data)
		-- 触发致死保护
		return true, true
	end
end

-- 攻击附魔
function BuffRule._initBuffType14(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	return function (data)
		local buffData = {}
		buffData.buffId = buffInfo.buff_value_1
		buffData.range = buffInfo.buff_value_2
		buffData.buffTime = buffInfo.buff_value_3
		buffData.buffRate = 1000
		data[#data+1] = buffData
		return true,data
	end
end

-- 伤害减免、增伤（根据增减益类型判断，增益buff是减免，减益buff是增伤）
function BuffRule._initBuffType15(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	return function (data)
		local skillCfg = data.skillCfg
		local result = data.result
		if not result then return false end
		if buffInfo.buff_value_2 == 0 or buffInfo.buff_value_2 == skillCfg.skill_type then
			if result.damage and result.damage > 0 then
				local rate = buffInfo.buff_attribute_type == 2 and -1 or 1
				result.damage = math.floor(result.damage * (1000 + buffInfo.buff_value_1 * rate) / 1000)
			end
			return true, data
		end
		return false
	end
end

-- 绑定被动
function BuffRule._initBuffType16(buff, battleField)
	return function (data)
		return true
	end
end

-- DOT伤害变化
function BuffRule._initBuffType17(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	return function (data)
		local buffType = data.buffType
		local effect = data.effect
		if buffType == buffInfo.buff_value_1 then
			local rate = buffInfo.buff_attribute_type == 2 and -1 or 1
			effect.effect_value = math.floor(effect.effect_value * (1000 + buffInfo.buff_value_2 * rate) / 1000)
			return true, data
		end
		return false
	end
end

-- 额外的怒气消耗
function BuffRule._initBuffType18(buff)
	local buffInfo = buff.buffCfg
	return function (data)
		return true, data + buffInfo.buff_value_1
	end
end

-- 19-嘲讽
function BuffRule._initBuffType19(buff)
	local attacker = buff.attacker
	return function (data)
		return true, attacker
	end
end

-- 20-属性吸取
function BuffRule._initBuffType20(buff, battleField)
	local attacker = buff.attacker
	local buffInfo = buff.buffCfg
	local effectType = buffInfo.buff_effect_type
	-- local attrType = buffInfo.buff_value_1
	local victim = buff.victim

	local attackCount = battleField:getAttackCount()
	-- 将当前出手次数导出，方便吸取buff能够关联到同一次出手的吸取debuff
	buff.exports.attackCount = attackCount

	local buffInfo2 = nil
	local victims = {}	-- 本次出手被吸取的敌方单位
	if effectType == BuffRule.EFFECT_TYPE.SIPHON_ATTR_ADD then
		buffInfo2 = loadCfg("cfg.buff_info").get(buffInfo.buff_value_1)
		local knightList = battleField:getBattleData():getKnightList(3 - attacker.identity)
		for i, knight in ipairs(knightList) do
			local buffs = knight:getBuffs()
			for j, vBuff in ipairs(buffs) do
				if vBuff.buffCfg.id == buffInfo.buff_value_1 and vBuff.exports.attackCount == attackCount and
				vBuff.attacker.serialId == attacker.serialId then
					insert(victims, knight)
					break
				end
			end
		end
	elseif effectType == BuffRule.EFFECT_TYPE.SIPHON_ATTR_DESC then
		buffInfo2 = buffInfo
		victims = {victim}
	end
	local attrType = buffInfo2.buff_value_1
	local attrs = {}

	for i, knight in ipairs(victims) do
		-- 攻防百分比换成绝对值
		if attrType == 1 then
			-- 攻击百分比
			insert(attrs, {name = "ATTACK", value = math.floor(knight.originInfo.ATTACK * buffInfo2.buff_value_2 / 1000)})
		elseif attrType == 2 then
			-- 物防百分比
			insert(attrs, {name = "PHY_DEFENCE", value = math.floor(knight.originInfo.PHY_DEFENCE * buffInfo2.buff_value_2 / 1000)})
		elseif attrType == 3 then
			-- 法防百分比
			insert(attrs, {name = "MAG_DEFENCE", value = math.floor(knight.originInfo.MAG_DEFENCE * buffInfo2.buff_value_2 / 1000)})
		elseif attrType == 4 then
			insert(attrs, {name = "PHY_DEFENCE", value = math.floor(knight.originInfo.PHY_DEFENCE * buffInfo2.buff_value_2 / 1000)})
			insert(attrs, {name = "MAG_DEFENCE", value = math.floor(knight.originInfo.MAG_DEFENCE * buffInfo2.buff_value_2 / 1000)})
		else
			local attrName = BattleAttrRe[attrType]
			insert(attrs, {name = attrName, value = buffInfo2.buff_value_2})
		end
	end
	return {[1]= function ()
		for i, attr in ipairs(attrs) do
			local name = attr.name
			local value = victim.advanceInfo[name]
			
			local delta = attr.value
			local rate = buffInfo.buff_attribute_type == 1 and 1 or -1
			-- 吸取方与被吸取方有上限限制
			if effectType == BuffRule.EFFECT_TYPE.SIPHON_ATTR_ADD then
				-- 吸取方有个自身基础值百分比上限
				if name == "ATTACK" or "PHY_DEFENCE" or "MAG_DEFENCE" then
					delta = math.min(delta, attacker.originInfo[name] * buffInfo.buff_value_2)
				end
			elseif effectType == BuffRule.EFFECT_TYPE.SIPHON_ATTR_DESC then
				-- 被吸取方有个下限
				local limit = 0
				if name == "ATTACK" then
					limit = value - math.floor((1000 - Parameters.SIPHON_ATK_HIGH) * victim.originInfo[name] / 1000)
				elseif name == "PHY_DEFENCE" then
					limit = value - math.floor((1000 - Parameters.SIPHON_PHY_DEF_HIGH) * victim.originInfo[name] / 1000)
				elseif name == "MAG_DEFENCE" then
					limit = value - math.floor((1000 - Parameters.SIPHON_MAG_DEF_HIGH) * victim.originInfo[name] / 1000)
				end
				if limit > 0 then
					delta = math.min(limit, delta)
				end
			end
			
			value = value + delta * rate
			victim.advanceInfo[name] = value
		end
		return true
	end}
end

-- 21-免疫沉默
function BuffRule._initBuffType21(buff)
	return function (data)
		return true, true
	end
end

-- 22-免疫眩晕
function BuffRule._initBuffType22(buff)
	return function (data)
		return true, true
	end
end

-- 23-护盾
function BuffRule._initBuffType23(buff)
	local buffInfo = buff.buffCfg
	local victim = buff.victim
	local shield = math.floor(victim.originInfo.INITIAL_HP * buffInfo.buff_value_1 / 1000)
	return function (data)
		local damage = data
		local shieldBefore = shield
		shield = math.max(0, shield - damage)
		if shield == 0 then
			buff.isDone = true
		end
		damage = damage - (shieldBefore - shield)
		return true, damage
	end
end

-- 24-免疫控制类
function BuffRule._initBuffType24(buff)
	return function (data)
		return true, true
	end
end

-- 25-无法回复怒气
function BuffRule._initBuffType25(buff)
	return function (data)
		return true, true
	end
end

-- 26-带有此效果的 最终命中率进行二次判断
function BuffRule._initBuffType26(buff, battleField)
	local buffInfo = buff.buffCfg
	local rate = buffInfo.buff_value_1
	local attacker = buff.attacker
	local attackerId = attacker.serialId
	return function (data)
		data[attackerId] = data[attackerId] or 1000
		data[attackerId] = math.floor(data[attackerId] * rate / 1000)
		return true, data
	end
end

return BuffRule