--[========================[

	战斗组件

	负责计算战斗，包括产生的伤害，buff等等

]========================]

local math = math
local floor = math.floor
local min = math.min
local max = math.max

local table = table
local insert = table.insert
local sort = table.sort
local remove = table.remove

local FightResult = load "core.fight.FightResult"
local BuffRule = load "core.rule.BuffRule"
local SkillSpAffectRule = load "core.rule.SkillSpAffectRule"
local SkillSpecialRule = load "core.rule.SkillSpecialRule"
local EnergyRule = load "core.rule.EnergyRule"
local Parameters = load "core.Parameters"
local BattleAttr = load "const.BattleAttr"
local BattleConst = load "const.BattleConst"
local skill_info = loadCfg "cfg.skill_info"
local buff_info = loadCfg "cfg.buff_info"
local knight_info = loadCfg "cfg.knight_info"
local skill_image_info = loadCfg "cfg.skill_image_info"

local PlayerFactory = load "core.player.PlayerFactory"

local FightComponent = {}

function FightComponent.fight(attacker, battleData, battleField)

	-- 开始打斗
	local fightResult = FightComponent._knightFight(attacker, battleData, battleField)

	return fightResult

end

function FightComponent.fightPassive(passiveSkill, battleData, battleField)
	local knight = passiveSkill.knight
	local info = passiveSkill.info
	if passiveSkill.isSkill or info.passive_skill_type == 1 then
		-- 可能是武将技能或者合击
		-- isSkill 代表直接就是技能
		local skillInfo = info
		local skillId = info.id
		if not passiveSkill.isSkill then
			skillInfo = skill_info.get(info.passive_skill_value)
			skillId = info.passive_skill_value
		end
		if skillInfo.skill_type == 3 then
			-- 合击
			local identity = knight.identity
			local playerCommand = PlayerFactory.createPlayerCommand({id = info.passive_skill_value,identity = identity, attack_count = 0,battleData = battleData})
			return FightComponent._knightFight(playerCommand, battleData, battleField,skillId)
		elseif skillInfo.skill_type == 6 then
			-- 神兽
			local identity = passiveSkill.identity
			local playerCommand = PlayerFactory.createPlayerCommand({skillId = info.passive_skill_value,identity = identity, attack_count = 0,battleData = battleData,isPet=true})
			local result = FightComponent._knightFight(playerCommand, battleData, battleField,skillId)
			-- 神兽攻击判断是否有额外被动
			battleField:getBattleData():checkPetExtraSkill(identity, info.id)
			return result
		elseif skillInfo.skill_type == 7 then
			-- 时光之力
			local identity = passiveSkill.identity
			local playerCommand = PlayerFactory.createPlayerCommand({skillId = info.passive_skill_value,identity = identity, attack_count = 0,battleData = battleData, isSpaceTime = true})
			return FightComponent._knightFight(playerCommand, battleData, battleField,skillId)
		-- 召唤物技能
		elseif skillInfo.skill_type == 13 then
			local skillSummon = passiveSkill.skillSummon
			local knight = skillSummon:getAttacker()
			skillSummon:doSkillRelease()
			return FightComponent._knightFight(knight, battleData, battleField,skillId)
		elseif skillInfo.skill_type == 14 then
			-- 神兽的附属被动技能
			local identity = passiveSkill.identity
			local playerCommand = PlayerFactory.createPlayerCommand({skillId = info.passive_skill_value,identity = identity, attack_count = 0,battleData = battleData,isPet=true})
			return FightComponent._knightFight(playerCommand, battleData, battleField,skillId)
		end
		return FightComponent._knightFight(knight, battleData, battleField,skillId)
	elseif info.passive_skill_type == 2 then
		-- 变身召唤
		local attackType = 3
		local skillId = info.passive_skill_value
		local fightResult = FightResult.createFightResult(knight, attackType, skillId, battleField, true)
		local skillInfo = skill_image_info.get(skillId)
		if skillInfo.image_type == 1 then
			-- 变身
			fightResult:transform(skillInfo)
		elseif skillInfo.image_type == 2 then
			-- 召唤
			-- 将创建若干个实体，放在指定位置上
			local posList = {}
			local num = skillInfo.image_value
			-- 默认都放在释放者一方
			local identity = knight.identity
			for i = 1 , 6 do
				local knight = battleData:getKnightByIdAndPos(identity,i)
				if not knight or not knight:isValid() then
					posList[#posList + 1] = i
					num = num - 1
					if num <= 0 then
						break
					end
				end
			end
			fightResult:callFriends(skillInfo,posList)
		end
		return fightResult
	elseif info.passive_skill_type == 3 then
		-- 触发属性类buff
		local check = passiveSkill.check
		local skillInfo = skill_info.get(info.passive_skill_value)
		return FightComponent._knightFight(knight, battleData, battleField,info.passive_skill_value,check)
	end
end

-- 武将进攻，这里attacker是当前进攻的武将
function FightComponent._knightFight(attacker, battleData, battleField,skillId,buffCheck)

	-- 武将的技能选择
	local skillCfg = nil
	local attackType = 1
	if not attacker.isPlayer then
		skillCfg = FightComponent._chooseSkill(attacker,battleData,skillId)
	else
		skillCfg = attacker.skillCfg
		attackType = 2
		if skillCfg.skill_type == 6 then
			-- 宠物技能
			attackType = 4
		elseif skillCfg.skill_type == 7 then
			attackType = 5
		-- 技能召唤物技能
		elseif skillCfg.skill_type == 13 then
			attackType = 6
		end
	end
	local isPassive = false
	if skillId then
		-- 如果有传入技能id，则认为是触发的被动技能
		isPassive = true
	end
	
	-- 开始计算伤害或者别的结果，根据技能效果来定
	-- 这里可能有三重的效果

	-- 最后伤害结果
	local fightResult = FightResult.createFightResult(attacker, attackType, skillCfg.id, battleField, isPassive)

	-- 首先更新技能怒气值
	FightComponent._updateSkillEnergy(attacker, skillCfg, fightResult, battleField)

	if not attacker.isPlayer then
		-- 必杀技
		if skillCfg.skill_type == 12 then
			local times = attacker:getEnergySkillLeftTimes()
			if times <= 0 then
				-- 本次必杀释放完，次数用尽
				attacker.isLockEnergy = true
			end
		end
	end
	
	local isPlayer = attacker.isPlayer
	if not isPlayer then
		-- 先处理攻击者的buff和被动技能
		attacker:clearAdvanceInfo()
		attacker:doBuff(BuffRule.TYPE.ATTR)
	end

	-- 攻击目标，用于后续的目标判断
	local targets = {}
	local results = {}
	-- 记录第一段的攻击
	local firstResults = {}

	-- 多重效果
	-- 附魔
	local enchantList, enchantSpList = {}, {}
	local enchantEffectMap = {}	-- 实际命中的附魔技能效果
	if not isPlayer then
		enchantList, enchantSpList = attacker:excuteSpRule( SkillSpecialRule.TYPE.SKILL, {cfg=skillCfg,result={}}, 
			SkillSpecialRule.SP_TYPE.ENCHANT, {})
	end
	
	local i = 1
	local attackIndex = 1
	local enchantIndex = 0
	local temp_skill_info = skill_info
	local tempSkillCfg = skillCfg
	while temp_skill_info.hasKey("skill_affect_type_"..i) do
		if tempSkillCfg["skill_affect_type_"..i] > 0 then
			local attackData = {}
			attackData.range = tempSkillCfg["skill_range_"..i]
			attackData.affectType = tempSkillCfg["skill_affect_type_"..i]
			attackData.affectRate = tempSkillCfg["skill_affect_prob_"..i]
			attackData.formula = tempSkillCfg["formula_"..i]
			attackData.formulaValue1 = tempSkillCfg["formula_"..i.."_value_1"]
			attackData.formulaValue2 = tempSkillCfg["formula_"..i.."_value_2"]
			attackData.formulaValueStep1 = i == 1 and tempSkillCfg["formula_"..i.."_value_1_step"] or 0
			attackData.formulaValueStep2 = i == 1 and tempSkillCfg["formula_"..i.."_value_2_step"] or 0
			attackData.attacker = attacker
			attackData.battleData = battleData
			attackData.battleField = battleField
			attackData.skillCfg = skillCfg
			attackData.fightResult = fightResult
			attackData.targets = targets
			attackData.attackIndex = attackIndex
			attackData.affectIndex = i
			attackData.results = results
			attackData.firstResults = firstResults

			-- 找到攻击目标
			attackData.victims = FightComponent._getVictimTargets(attackData)

			if #attackData.victims > 0 then
				-- 有攻击目标才进行下一步
				insert(targets,attackData.victims)

				-- 计算当前这个技能的结果
				-- 判断是否是需要特殊计算的技能
				local calcSpAffect = SkillSpAffectRule.check(attackData)
				local result
				if calcSpAffect then
					result = calcSpAffect(attackData)
				else
					result = FightComponent._calcFight(attackData)
				end
				for _ , v in ipairs(result) do
					insert(results,v)
					if attackIndex == 1 then
						insert(firstResults,v)
					end
				end
				if next(result) and enchantIndex > 0 then
					enchantEffectMap[enchantIndex] = true
				end
			end
			attackIndex = attackIndex + 1
		end
		i = i + 1
		-- 判断是否后续接上附魔
		if not temp_skill_info.hasKey("skill_affect_type_"..i) then
			enchantIndex = enchantIndex + 1
			if enchantList[enchantIndex] then
				i = 1
				temp_skill_info = loadCfg "cfg.skill_enchant_info"
				tempSkillCfg = enchantList[i]
			end
		end
	end

	local i = 1
	local enchantIndex = 0
	local temp_skill_info = skill_info
	local tempSkillCfg = skillCfg
	while temp_skill_info.hasKey("buff_"..i) do
		if tempSkillCfg["buff_"..i] > 0 then
			-- 计算buff
			local buffData = {}
			buffData.buffId = tempSkillCfg["buff_"..i]
			buffData.range = tempSkillCfg["buff_target_"..i]
			buffData.buffRate = tempSkillCfg["buff_prop_"..i]
			buffData.formula = tempSkillCfg["buff_prop_formula_"..i]
			buffData.buffTime = tempSkillCfg["buff_time_"..i]
			buffData.attacker = attacker
			buffData.battleData = battleData
			buffData.battleField = battleField
			buffData.fightResult = fightResult
			buffData.targets = targets
			buffData.buffCheck = buffCheck

			buffData.victims = FightComponent._getVictimTargets(buffData)
			-- 记录攻击目标
			insert(targets,buffData.victims)
			
			FightComponent._addBuff(buffData)
			if next(buffData.victims) and enchantIndex > 0 then
				enchantEffectMap[enchantIndex] = true
			end
		end
		i = i + 1
		-- 判断是否后续接上附魔
		if not temp_skill_info.hasKey("skill_affect_type_"..i) then
			enchantIndex = enchantIndex + 1
			if enchantList[enchantIndex] then
				i = 1
				temp_skill_info = loadCfg "cfg.skill_enchant_info"
				tempSkillCfg = enchantList[i]
			end
		end
	end
	-- 找到触发且生效的附魔被动
	local list = {}
	for k, v in pairs(enchantEffectMap) do
		insert(list, enchantSpList[k])
	end
	fightResult:addSpEffectList(attacker, list)

	if not isPassive and not attacker.isPlayer then
		-- 判断可能触发的buff效果
		local buffs = attacker:doBuff(BuffRule.TYPE.ATTACH_MAGIC, {})
		for i , buff in ipairs(buffs) do
			local buffData = {}
			buffData.buffId = buff.buffId
			buffData.range = buff.range
			buffData.buffRate = buff.buffRate
			buffData.formula = 0
			buffData.buffTime = buff.buffTime
			buffData.attacker = attacker
			buffData.battleData = battleData
			buffData.battleField = battleField
			buffData.fightResult = fightResult
			buffData.targets = targets
			buffData.buffCheck = buffCheck

			buffData.victims = FightComponent._getVictimTargets(buffData)
			FightComponent._addBuff(buffData)
		end
	end

	-- 判断可触发的被动
	FightComponent.calcPassiveSkill(attacker,fightResult,skillCfg,firstResults,battleField,isPassive)

	if not isPassive then
		-- 必杀技能量
		if not attacker.isPlayer then
			if not battleField:isExtraAction() then
				battleField:getBattleData():excuteEnergyRule(EnergyRule.TYPE.SKILL, attacker)
			end
		end
	end

	if not attacker.isPlayer then
		-- 结算吸血和反伤
		-- 只对第一段攻击计算吸血和反伤
		FightComponent.calcAddInfo(attacker,skillCfg,fightResult,firstResults,battleField)
		
		-- -- buff回合计算
		-- local removeList = {}
		-- if not isPassive then
		-- 	removeList = attacker:doBuffRound(BuffRule.ROUND.AFTER)
		-- end
		-- results.removeList = removeList
	end
	if attackType == 6 then
		-- 召唤物攻击，判断是否技能次数用尽，准备移除
		local removeList = battleField:getBattleData():checkSkillSummonFinish()
		results.delSkillSummon = removeList
	end
	-- --记录一下受到的攻击
	-- local doList = {}
	-- for i , v in ipairs(results) do
	-- 	local victim = v.victim
	-- 	if doList[victim] then
	-- 		insert(doList[victim],v)
	-- 	else
	-- 		doList[victim] = {v}
	-- 	end
	-- end
	-- -- 触发技能和buff
	-- for k , v in pairs(doList) do
	-- 	k:doBuff(BuffRule.TYPE.DEFENDER_AFTER,v)
	-- 	k:excuteSpRule(SkillSpecialRule.TYPE.DEFENDER_AFTER,v)
	-- end
	
	-- 结算必杀能量
	local energyEffect = battleField:getBattleData():getEnergyEffect()
	for i, v in ipairs(energyEffect) do
		insert(results, {
			victim = v.victim,
			affectType = v.effect_type,
			damage = v.effect_value,
		})
	end
	-- 根据结果，更新数据
	fightResult:addAttackInfo(results)

	-- 伤害结算需要延后，会影响到触发技能的目标选取
	-- fightResult:update()

	return fightResult

end

-- 计算反伤和吸血
function FightComponent.calcAddInfo(attacker,skillCfg,fightResult,firstResults,battleField)
	local suckHp = 0
	local reDamage = 0
	local attackerInfo = attacker.advanceInfo
	local extraData = FightComponent._getExtraStats(skillCfg)
	for i , v in ipairs(firstResults) do
		if v.affectType == 1 then
			local range = FightComponent._range
			local victim = v.victim
			local victimInfo = victim.advanceInfo
			-- 计算吸血
			local suckPer = attackerInfo.DRAIN_LIFE_ADD - victimInfo.DRAIN_LIFE_DEC
			suckPer = suckPer + extraData[BattleAttr["DRAIN_LIFE_ADD"]]
			suckPer = range(Parameters.BASE_SUCK_LOW,Parameters.BASE_SUCK_HIGH,suckPer)
			suckHp = suckHp + floor( v.damage * suckPer / 1000 )
			-- 计算反伤
			-- 区分物理和法术
			local knightCfg = attacker.knightCfg
			local atkType = knightCfg.attack_type
			if atkType == 1 then
				-- 物理
				-- 判断是否命中
				local rate = victimInfo.PHY_HITBACK_RATE_ADD - attackerInfo.PHY_HITBACK_RATE_DEC
				rate = range(Parameters.BASE_HIT_BACK_PHY_RATE_LOW,Parameters.BASE_HIT_BACK_PHY_RATE_HIGH,rate)
				local hit = battleField:bingo(rate)
				if hit then
					local rePer = victimInfo.PHY_HITBACK_PCT_ADD - attackerInfo.PHY_HITBACK_PCT_DEC
					rePer = range(Parameters.BASE_HIT_BACK_PHY_VALUE_LOW,Parameters.BASE_HIT_BACK_PHY_VALUE_HIGH,rePer)
					reDamage = reDamage + floor( v.damage * rePer / 1000 )
				end
			else
				-- 法术
				-- 判断是否命中
				local rate = victimInfo.MAG_HITBACK_RATE_ADD - attackerInfo.MAG_HITBACK_RATE_DEC
				rate = range(Parameters.BASE_HIT_BACK_MAG_RATE_LOW,Parameters.BASE_HIT_BACK_MAG_RATE_HIGH,rate)
				local hit = battleField:bingo(rate)
				if hit then
					local rePer = victimInfo.MAG_HITBACK_PCT_ADD - attackerInfo.MAG_HITBACK_PCT_DEC
					rePer = range(Parameters.BASE_HIT_BACK_MAG_VALUE_LOW,Parameters.BASE_HIT_BACK_MAG_VALUE_HIGH,rePer)
					reDamage = reDamage + floor( v.damage * rePer / 1000 )
				end
			end
		end
	end
	
	if suckHp > 0 then
		fightResult:addAttackEffect({effect_type = 2, effect_value = suckHp,add_effects={{add_type=4}}}, false)
	end
	if reDamage > 0 then
		fightResult:addAttackEffect({effect_type = 1, effect_value = reDamage,add_effects={{add_type=5}}}, false)
	end
end

function FightComponent.calcPassiveSkill( attacker,fightResult,skillCfg,firstResults,battleField, isPassive)
	-- 计算被动技能触发

	if not isPassive then
		-- 攻击方触发
		if attacker.excuteSpRule then
			attacker:excuteSpRule(SkillSpecialRule.TYPE.SKILL,{cfg=skillCfg,result=firstResults})
		end
		battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.SKILL,{cfg=skillCfg, result=firstResults})
	end

	-- 受击方触发
	for i , result in ipairs(firstResults) do
		result.victim:excuteSpRule(SkillSpecialRule.TYPE.HIT,{cfg=skillCfg,result=result,attacker = attacker,isPassive = isPassive})
		if not isPassive then
			result.victim:excuteEnergyRule(EnergyRule.TYPE.HIT)
		end
	end
end

-- 选择技能
function FightComponent._chooseSkill(attacker,battleData,skillId)

	-- 武将使用的技能可能和buff有关
	local skillCfg = nil

	if skillId then
		-- 已经指定了技能
		skillCfg = loadCfg("cfg.skill_info").get(skillId)
	else
		-- 是否被封技
		local unableSkill = attacker:doBuff(BuffRule.TYPE.SKILL_CHOOSE,false)
		-- 是否变身，用变身的技能
		local transformData = attacker:doBuff(BuffRule.TYPE.TRANSFORM, {})

		local battleField = battleData:getBattleField()
		if not next(transformData) and battleField:getExtraActionSkillId() > 0 then
			skillCfg = loadCfg("cfg.skill_info").get(battleField:getExtraActionSkillId())
		elseif attacker:canReleaseEnergySkill() then	-- 必杀技，不受封技影响
			skillCfg = transformData.energySkillCfg or attacker.energySkillCfg
		else
			-- 如果怒气满了，释放技能
			if unableSkill then
				skillCfg = transformData.commonSkillCfg or attacker.commonSkillCfg
			else
				if attacker:canReleaseActiveSkill() then	-- 主动技能
					skillCfg = transformData.activeSkillCfg or attacker.activeSkillCfg
				else
					skillCfg = transformData.commonSkillCfg or attacker.commonSkillCfg
				end
			end
		end
	end

	-- 可能会触发特殊逻辑，释放另一技能
	local originSkillId = skillCfg.id
	local lastCfg = nil
	while skillCfg ~= lastCfg do
		lastCfg = skillCfg
		if skillCfg.sp_type == 1 then
			-- 武将生命高于xx%
			local rate = attacker.originInfo.hpRate
			if rate >= skillCfg.sp_type_value then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 2 then
			-- 武将生命低于xx%
			local rate = attacker.originInfo.hpRate
			if rate <= skillCfg.sp_type_value then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 3 then
			-- 我方生存武将中存在xx武将
			local knightList = battleData:getKnightList(attacker.identity)
			for i = 1 , #knightList do
				local knight = knightList[i]
				if knight.serialId ~= attacker.serialId then
					local info = knight_info.get(knight.originInfo.id)
					if info.advance_id == skillCfg.sp_type_value then
						skillCfg = skill_info.get(skillCfg.new_skill_id)
						break
					end
				end
			end
		elseif skillCfg.sp_type == 4 then
			-- 我方在场人数小于等于敌方
			local ownKnightList = battleData:getKnightList(attacker.identity)
			local ememyKnightList = battleData:getKnightList(3 - attacker.identity)
			if #ownKnightList <= #ememyKnightList then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 5 then
			-- 作用范围1目标人数小于X时
			local attackData = {
				range = skillCfg["skill_range_1"],
				attacker = attacker,
				battleData = battleData,
				battleField = battleData:getBattleField(),
				targets = {},
			}
			local victims = FightComponent._getVictimTargets(attackData)
			if #victims < skillCfg.sp_type_value then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 6 then
			-- 第一次释放该技能
			if attacker:getSkillTimes(originSkillId) == 0 then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 7 then
			-- 判断标记id=2数量>X时
			if attacker:getMarkLevel(2) > skillCfg.sp_type_value then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 8 then
			-- 我方在场人数大于等于敌方
			local ownKnightList = battleData:getKnightList(attacker.identity)
			local ememyKnightList = battleData:getKnightList(3 - attacker.identity)
			if #ownKnightList >= #ememyKnightList then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		elseif skillCfg.sp_type == 9 then
			-- 作用范围1的目标有灼伤buff
			local attackData = {
				range = skillCfg["skill_range_1"],
				attacker = attacker,
				battleData = battleData,
				battleField = battleData:getBattleField(),
				targets = {},
			}
			local targets = FightComponent._getVictimTargets(attackData)
			for i, target in ipairs(targets) do
				if target.victim:hasBuffByEffectType(BuffRule.EFFECT_TYPE.BURNING) then
					skillCfg = skill_info.get(skillCfg.new_skill_id)
					break
				end
			end
		elseif skillCfg.sp_type == 10 then
			-- 概率触发
			if battleData:getBattleField():bingo(skillCfg.sp_type_value) then
				skillCfg = skill_info.get(skillCfg.new_skill_id)
			end
		end
	end
	-- 增加技能次数
	attacker:addSkillTimes(originSkillId)

	return skillCfg

end

-- 更新技能的能量槽，就是怒气值或者合击值更新
function FightComponent._updateSkillEnergy(attacker, skillCfg, fightResult, battleField)

	if skillCfg.rage_type == 1 then
		-- 回复怒气
		fightResult:addAttackEffect({effect_type = 4, effect_value = skillCfg.rage_value}, true)
	elseif skillCfg.rage_type == 2 then
		-- 消耗怒气
		local cost = skillCfg.rage_value
		-- 判断额外怒气消耗
		local extraCost = attacker:doBuff(BuffRule.TYPE.EXTRA_ANGER_COST, 0)
		cost = cost + extraCost
		fightResult:addAttackEffect({effect_type = 3, effect_value = cost}, true)
	elseif skillCfg.rage_type == 3 then
		-- 消耗合击值
		fightResult:addAttackEffect({effect_type = 5, effect_value = skillCfg.rage_value}, true)
	elseif skillCfg.rage_type == 5 then
		-- 必杀技
		local isLockEnergy = false
		if not attacker.isPlayer then
			-- 必杀技
			if skillCfg.skill_type == 12 then
				local times = attacker:getEnergySkillLeftTimes()
				if times <= 0 then
					-- 本次必杀释放完，次数用尽
					isLockEnergy = true
					attacker.isLockEnergy = true
				end
			end
		end
		-- 消耗杀意值
		fightResult:addAttackEffect({effect_type = 12, effect_value = skillCfg.rage_value, isLockEnergy = isLockEnergy}, true)
	elseif skillCfg.rage_type == 6 then
		-- 回复杀意值
		fightResult:addAttackEffect({effect_type = 13, effect_value = skillCfg.rage_value}, true)
	end
end

-- 获取目标
--[============[
	技能效果类型，分为以下这些

]============]

function FightComponent._getVictimTargets(attackData)

	local victimTargets = {}
	local createVictimTarget = FightComponent._createVictimTarget
	local copyTarget = FightComponent._copyTarget
	local getRandomNTargets = FightComponent._getRandomNTargets

	-- 默认是对方是目标群，个别目标类型是我方
	local attacker = attackData.attacker
	local targetIdentity = attacker.opIdentity
	local selfIdentity = attacker.identity
	local knights = attackData.battleData:getKnights()
	local battleField = attackData.battleField

	-- 最优先的阵位标识
	local pos = attacker.originInfo.pos
	local frontPos = (pos - 1) % 3 + 1
	local behindPos = frontPos + 3

	-- 之前攻击的选取数据
	local lastTargets = attackData.targets

	-- 这里是对位的单体
	-- 规则是这样，人物站位分前后排，前后排上，同一列的人这里看作是阵位相同的
	-- 攻击优先级是 前排同阵位 > 前排最近阵位 > 后排同阵位 > 后排最近阵位
	local getDefaultTarget = function ( )
		local queue = {frontPos, frontPos - 1, min(frontPos + 1,3), frontPos - 2 , min(frontPos + 2,3) , behindPos, behindPos - 1, behindPos + 1, behindPos - 2 , behindPos + 2}
		local index = 1
		local victim = nil
		repeat
			victim = knights:getKnightByIdAndPos(targetIdentity, queue[index])
			index = index + 1
		until (victim and victim:isValid() or index > #queue)
		return victim
	end

	-- 判断攻击方是否被嘲讽
	if not attacker.isPlayer and attackData.affectType == 1 then
		local tauntKnight = attacker:doBuff(BuffRule.TYPE.TAUNT)
		if tauntKnight then
			insert(victimTargets, createVictimTarget(tauntKnight))
			return victimTargets
		end
	end

	local range = attackData.range
	if range == 1 then
		-- 1-敌方对位单体
		local victim = getDefaultTarget()
		if victim then
			insert(victimTargets, createVictimTarget(victim))
		end
	elseif range == 2 then
		-- 2-敌方对位后排
		local queue = {behindPos, max(behindPos - 1,4), behindPos + 1, max(behindPos - 2,4) , behindPos + 2 , frontPos, frontPos - 1, frontPos + 1, frontPos - 2 , frontPos + 2}
		local index = 1
		local victim = nil
		repeat
			victim = knights:getKnightByIdAndPos(targetIdentity, queue[index])
			index = index + 1
		until (victim and victim:isValid()) or (index > #queue)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
		end
	elseif range == 3 then
		-- 3-敌方随机一人
		victimTargets = getRandomNTargets(attackData,targetIdentity,1)
	elseif range == 4 then
		-- 4-敌方默认列
		local victim = getDefaultTarget()
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			if pos <= 3 then
				-- 如果是前排的，则可能会伤害到后排
				victim = knights:getKnightByIdAndPos(targetIdentity, pos + 3)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 5 then
		-- 5-敌方随机二人
		victimTargets = getRandomNTargets(attackData,targetIdentity,2)
	elseif range == 6 then
		-- 6-敌方随机一列
		-- 优先找2人存活的列
		local lines = {}
		for i = 1 , 3 do
			local count = 0
			for j = 1 , 2 do
				local victim = knights:getKnightByIdAndPos(targetIdentity, (j-1)*3+i)
				if victim and victim:isValid() then
					count = count + 1
				end
			end
			if count == 2 then
				lines[#lines+1] = i
			end
		end
		if #lines > 0 then
			local chooseIndex = FightComponent._random(1, #lines,battleField)
			local victim = knights:getKnightByIdAndPos(targetIdentity, lines[chooseIndex])
			insert(victimTargets, createVictimTarget(victim))
			victim = knights:getKnightByIdAndPos(targetIdentity, lines[chooseIndex] + 3)
			insert(victimTargets, createVictimTarget(victim))
		else
			-- 先找前排的
			local targets = {}
			for index = 1 , 3 do 
				local victim = knights:getKnightByIdAndPos(targetIdentity, index)
				if victim and victim:isValid() then
					insert(targets, victim)
				end
			end
			if #targets == 0 then
				for index = 4 , 6 do 
					local victim = knights:getKnightByIdAndPos(targetIdentity, index)
					if victim and victim:isValid() then
						insert(targets, victim)
					end
				end
			end
			local chooseIndex = FightComponent._random(1, #targets,battleField)
			insert(victimTargets, createVictimTarget(targets[chooseIndex]))
		end
	elseif range == 7 then
		-- 7-敌方前排
		for index = 1 , 3 do 
			local victim = knights:getKnightByIdAndPos(targetIdentity, index)
			if victim and victim:isValid() then
				insert(victimTargets, createVictimTarget(victim))
			end
		end
		if #victimTargets == 0 then
			for index = 4 , 6 do 
				local victim = knights:getKnightByIdAndPos(targetIdentity, index)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 8 then
		-- 8-敌方后排
		for index = 4 , 6 do 
			local victim = knights:getKnightByIdAndPos(targetIdentity, index)
			if victim and victim:isValid() then
				insert(victimTargets, createVictimTarget(victim))
			end
		end
		if #victimTargets == 0 then
			for index = 1 , 3 do 
				local victim = knights:getKnightByIdAndPos(targetIdentity, index)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 9 then
		-- 9-敌方随机三人
		victimTargets = getRandomNTargets(attackData,targetIdentity,3)
	elseif range == 10 then
		-- 10-默认目标及相邻单位
		local victim = getDefaultTarget()
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			-- 检查前后方及左右
			local list = {pos-3,pos+3}
			if pos ~= 4 then
				list[#list+1] = pos-1
			end
			if pos ~= 3 then
				list[#list+1] = pos+1
			end
			for i = 1 , #list do
				local target = knights:getKnightByIdAndPos(targetIdentity, list[i])
				if target and target:isValid() then
					insert(victimTargets, createVictimTarget(target))
				end
			end
		end
	elseif range == 11 then
		-- 11-敌方随机4人
		victimTargets = getRandomNTargets(attackData,targetIdentity,4)
	elseif range == 12 then
		-- 12-随机2列
		-- 优先找2人存活的列
		-- 用排除法，先找没人的列
		local lines = {}
		for i = 1 , 3 do
			local count = 0
			for j = 1 , 2 do
				local victim = knights:getKnightByIdAndPos(targetIdentity, (j-1)*3+i)
				if victim and victim:isValid() then
					count = count + 1
				end
			end
			if count == 0 then
				lines[#lines+1] = i
			end
		end
		if #lines == 0 then
			-- 先找前排
			for index = 1 , 3 do 
				local victim = knights:getKnightByIdAndPos(targetIdentity, index)
				if not victim or not victim:isValid() then
					lines[#lines+1] = index
				end
			end
			if #lines == 0 then
				for index = 4 , 6 do 
					local victim = knights:getKnightByIdAndPos(targetIdentity, index)
					if not victim or not victim:isValid() then
						lines[#lines+1] = index - 3
					end
				end
			end
			if #lines == 0 then
				lines = {1,2,3}
			end
		end
		local chooseIndex = FightComponent._random(1, #lines,battleField)
		for index = 1 , 3 do 
			if index ~= lines[chooseIndex] then
				local victim = knights:getKnightByIdAndPos(targetIdentity, index)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
				victim = knights:getKnightByIdAndPos(targetIdentity, index + 3)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 13 then
		-- 敌方全体
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		for i = 1 , #knightList do
			insert(victimTargets, createVictimTarget(knightList[i]))
		end
	elseif range == 14 then
		-- 敌方生命百分比最少一人
		local knight = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"hpRate",false)
		insert(victimTargets, createVictimTarget(knight))
	elseif range == 15 then
		-- 敌方生命百分比最少2人
		local knights = FightComponent._getRandomMaxTargets2(attackData,targetIdentity,"hpRate",false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 16 then
		-- 敌方生命百分比最高一人
		local knight = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"hpRate",true)
		if knight then
			insert(victimTargets, createVictimTarget(knight))
		end
	elseif range == 17 then
		-- 敌方生命百分比最高一人所在列
		local knight = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"hpRate",true)
		if knight then
			insert(victimTargets, createVictimTarget(knight))
			local pos = knight.originInfo.pos
			local apos = pos < 4 and pos + 3 or pos - 3
			local aknight = knights:getKnightByIdAndPos(targetIdentity, apos)
			if aknight and aknight:isValid() then
				insert(victimTargets, createVictimTarget(aknight))
			end
		end
	elseif range == 18 then
		-- 敌方生命百分比最高一人及周围
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"hpRate",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			-- 检查前后方及左右
			local list = {}
			if pos ~= 4 then
				list[#list+1] = pos-1
			end
			list[#list+1] = pos+3
			if pos ~= 3 then
				list[#list+1] = pos+1
			end
			list[#list+1] = pos-3
			for i = 1 , #list do
				local target = knights:getKnightByIdAndPos(targetIdentity, list[i])
				if target and target:isValid() then
					insert(victimTargets, createVictimTarget(target))
				end
			end
		end
	elseif range == 19 then
		-- 敌方怒气最高单体
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"INITIAL_ANGER",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
		end
	elseif range == 20 then
		-- 敌方怒气最高单体所在列
		local knight = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"INITIAL_ANGER",true)
		if knight then
			insert(victimTargets, createVictimTarget(knight))
			local pos = knight.originInfo.pos
			local apos = pos < 4 and pos + 3 or pos - 3
			local aknight = knights:getKnightByIdAndPos(targetIdentity, apos)
			if aknight and aknight:isValid() then
				insert(victimTargets, createVictimTarget(aknight))
			end
		end
	elseif range == 21 then
		-- 敌方怒气最高单位及周围
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"INITIAL_ANGER",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			-- 检查前后方及左右
			local list = {}
			if pos ~= 4 then
				list[#list+1] = pos-1
			end
			list[#list+1] = pos+3
			if pos ~= 3 then
				list[#list+1] = pos+1
			end
			list[#list+1] = pos-3
			for i = 1 , #list do
				local target = knights:getKnightByIdAndPos(targetIdentity, list[i])
				if target and target:isValid() then
					insert(victimTargets, createVictimTarget(target))
				end
			end
		end
	elseif range == 22 then
		-- 敌方怒气最高4人
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		local count = #knightList
		if count == 6 then
			--武将伤害技能效果找怒气最少的2人
			local victims = FightComponent._getRandomMaxTargets2(attackData,targetIdentity,"INITIAL_ANGER",false)
			for i = 1 , 6 do
				if i ~= victims[1].originInfo.pos and i ~= victims[2].originInfo.pos then
					local victim = knights:getKnightByIdAndPos(targetIdentity, i)
					if victim and victim:isValid() then
						insert(victimTargets, createVictimTarget(victim))
					end
				end
			end
		elseif count == 5 then
			local lvictim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"INITIAL_ANGER",false)
			for i = 1 , 6 do
				if i ~= lvictim.originInfo.pos then
					local victim = knights:getKnightByIdAndPos(targetIdentity, i)
					if victim and victim:isValid() then
						insert(victimTargets, createVictimTarget(victim))
					end
				end
			end
		else
			for i = 1 , 6 do
				local victim = knights:getKnightByIdAndPos(targetIdentity, i)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 23 then
		-- 防御力最高武将
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalDef",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
		end
	elseif range == 24 then
		-- 防御力最高武将所在列
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalDef",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			local apos = pos < 4 and pos + 3 or pos - 3
			local aknight = knights:getKnightByIdAndPos(targetIdentity, apos)
			if aknight and aknight:isValid() then
				insert(victimTargets, createVictimTarget(aknight))
			end
		end
	elseif range == 25 then
		-- 防御力最高武将及周围
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalDef",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			-- 检查前后方及左右
			local list = {}
			if pos ~= 4 then
				list[#list+1] = pos-1
			end
			list[#list+1] = pos+3
			if pos ~= 3 then
				list[#list+1] = pos+1
			end
			list[#list+1] = pos-3
			for i = 1 , #list do
				local target = knights:getKnightByIdAndPos(targetIdentity, list[i])
				if target and target:isValid() then
					insert(victimTargets, createVictimTarget(target))
				end
			end
		end
	elseif range == 26 then
		-- 攻击力最高武将
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalAtk",true)
		insert(victimTargets, createVictimTarget(victim))
	elseif range == 27 then
		-- 攻击力最高武将所在列
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalAtk",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			local apos = pos < 4 and pos + 3 or pos - 3
			local aknight = knights:getKnightByIdAndPos(targetIdentity, apos)
			if aknight and aknight:isValid() then
				insert(victimTargets, createVictimTarget(aknight))
			end
		end
	elseif range == 28 then
		-- 攻击力最高武将及周围
		local victim = FightComponent._getRandomMaxTargets(attackData,targetIdentity,"totalAtk",true)
		if victim then
			insert(victimTargets, createVictimTarget(victim))
			local pos = victim.originInfo.pos
			-- 检查前后方及左右
			local list = {}
			if pos ~= 4 then
				list[#list+1] = pos-1
			end
			list[#list+1] = pos+3
			if pos ~= 3 then
				list[#list+1] = pos+1
			end
			list[#list+1] = pos-3
			for i = 1 , #list do
				local target = knights:getKnightByIdAndPos(targetIdentity, list[i])
				if target and target:isValid() then
					insert(victimTargets, createVictimTarget(target))
				end
			end
		end
	elseif range == 29 then
		-- 敌方生命百分比最高三人
		local victims = FightComponent._getMaxTargetsN(attackData,targetIdentity,"hpRate",true,3)
		for i = 1 , #victims do
			insert(victimTargets, createVictimTarget(victims[i]))
		end
	elseif range == 30 then
		-- 敌方处于灼烧状态的单位
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		for i = 1, #knightList do
			local knight = knightList[i]
			if knight:hasBuffByEffectType(BuffRule.EFFECT_TYPE.BURNING) then
				insert(victimTargets, createVictimTarget(knight))
			end
		end
	elseif range == 31 then
		-- 敌方最小阵位
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		local knight = knightList[1]
		if knight then
			insert(victimTargets, createVictimTarget(knight))
		end
	elseif range == 32 then
		-- 敌方处于标记id=1状态下标记最多的单位
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		local maxLevel = -1
		local indexList = {}
		for i = 1 , #knightList do
			local knight = knightList[i]
			local level = knight:getMarkLevel(1)
			if level > maxLevel then
				maxLevel = level
				indexList = {i}
			elseif level == maxLevel then
				insert(indexList, i)
			end
		end
		if next(indexList) then
			local winner = FightComponent._random(1, #indexList, battleField)
			insert(victimTargets, createVictimTarget(knightList[indexList[winner]])) 
		end
	elseif range == 33 then
		-- 敌方处于标记id=1状态下标记最多的2个单位
		local knightList = attackData.battleData:getKnightList(targetIdentity)
		if #knightList <= 2 then
			for i = 1 , #knightList do
				local knight = knightList[i]
				insert(victimTargets, createVictimTarget(knight)) 
			end
		else
			local indexList = {}
			for i = 1 , #knightList do
				indexList[i] = i
			end
			indexList = FightComponent._getRandomN(indexList, #indexList, battleField)
			for i = 1 , 2 do
				for j = #knightList - 1 , i , -1 do
					if knightList[indexList[j+1]]:getMarkLevel(1) > knightList[indexList[j]]:getMarkLevel(1) then
						local temp = indexList[j+1]
						indexList[j+1] = indexList[j]
						indexList[j] = temp
					end
				end
			end
			insert(victimTargets, createVictimTarget(knightList[indexList[1]])) 
			insert(victimTargets, createVictimTarget(knightList[indexList[2]])) 
		end
	elseif range == 34 then
		-- 敌方生命最高2人
		local victims = FightComponent._getMaxTargetsN(attackData,targetIdentity,"INITIAL_HP",true,2)
		for i = 1 , #victims do
			insert(victimTargets, createVictimTarget(victims[i]))
		end
	elseif range == 101 then
		-- 自身
		local victim = attacker
		if victim.isPlayer then
			victim = FightComponent._getRandomKnight(attackData,selfIdentity)
		end
		insert(victimTargets, createVictimTarget(victim))
	elseif range == 102 then
		-- 自身所在列
		local victim = attacker
		if victim.isPlayer then
			victim = FightComponent._getRandomKnight(attackData,selfIdentity)
		end
		insert(victimTargets, createVictimTarget(victim))
		local pos = victim.originInfo.pos
		local apos = pos < 4 and pos + 3 or pos - 3
		local aknight = knights:getKnightByIdAndPos(selfIdentity, apos)
		if aknight and aknight:isValid() then
			insert(victimTargets, createVictimTarget(aknight))
		end
	elseif range == 103 then
		-- 自身所在排
		local victim = attacker
		if victim.isPlayer then
			victim = FightComponent._getRandomKnight(attackData,selfIdentity)
		end
		local row = victim.originInfo.pos > 3 and 3 or 0
		for i = 1 , 3 do 
			local knight = knights:getKnightByIdAndPos(selfIdentity, i + row)
			if knight and knight:isValid() then
				insert(victimTargets, createVictimTarget(knight))
			end
		end
	elseif range == 104 then
		-- 自身及周围
		local victim = attacker
		if victim.isPlayer then
			victim = FightComponent._getRandomKnight(attackData,selfIdentity)
		end
		insert(victimTargets, createVictimTarget(victim))
		local pos = victim.originInfo.pos
		-- 检查前后方及左右
		local list = {}
		if pos ~= 4 then
			list[#list+1] = pos-1
		end
		list[#list+1] = pos+3
		if pos ~= 3 then
			list[#list+1] = pos+1
		end
		list[#list+1] = pos-3
		for i = 1 , #list do
			local target = knights:getKnightByIdAndPos(selfIdentity, list[i])
			if target and target:isValid() then
				insert(victimTargets, createVictimTarget(target))
			end
		end
	elseif range == 105 then
		-- 我方随机1人
		victimTargets = getRandomNTargets(attackData,selfIdentity,1)
	elseif range == 106 then
		-- 我方随机2人
		victimTargets = getRandomNTargets(attackData,selfIdentity,2)
	elseif range == 107 then
		-- 我方前排
		for index = 1 , 3 do 
			local victim = knights:getKnightByIdAndPos(selfIdentity, index)
			if victim and victim:isValid() then
				insert(victimTargets, createVictimTarget(victim))
			end
		end
		if #victimTargets == 0 then
			for index = 4 , 6 do 
				local victim = knights:getKnightByIdAndPos(selfIdentity, index)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 108 then
		-- 我方后排
		for index = 4 , 6 do 
			local victim = knights:getKnightByIdAndPos(selfIdentity, index)
			if victim and victim:isValid() then
				insert(victimTargets, createVictimTarget(victim))
			end
		end
		if #victimTargets == 0 then
			for index = 1 , 3 do 
				local victim = knights:getKnightByIdAndPos(selfIdentity, index)
				if victim and victim:isValid() then
					insert(victimTargets, createVictimTarget(victim))
				end
			end
		end
	elseif range == 109 then
		-- 我方全体
		local knightList = attackData.battleData:getKnightList(selfIdentity)
		for i = 1 , #knightList do
			insert(victimTargets, createVictimTarget(knightList[i]))
		end
	elseif range == 110 then
		-- 我方生命百分比最少单位
		local knight = FightComponent._getRandomMaxTargets(attackData,selfIdentity,"hpRate",false)
		insert(victimTargets, createVictimTarget(knight))
	elseif range == 111 then
		-- 我方生命百分比最少2人
		local knights = FightComponent._getRandomMaxTargets2(attackData,selfIdentity,"hpRate",false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 112 then
		-- 我方生命百分比低于40%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",400,false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 113 then
		-- 我方生命百分比低于50%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",500,false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 114 then
		-- 我方生命百分比低于60%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",600,false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 115 then
		-- 我方生命百分比低于80%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",800,false)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 116 then
		-- 我方生命百分比高于30%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",300,true)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 117 then
		-- 我方生命百分比高于50%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",500,true)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 118 then
		-- 我方生命百分比高于70%的单位
		local knights = FightComponent._getSpKnights(attackData,selfIdentity,"hpRate",700,true)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 119 then
		-- 我方魏国武将
		local knights = FightComponent._getGroup(attackData,selfIdentity,1)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 120 then
		-- 我方蜀国武将
		local knights = FightComponent._getGroup(attackData,selfIdentity,2)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 121 then
		-- 我方吴国武将
		local knights = FightComponent._getGroup(attackData,selfIdentity,3)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 122 then
		-- 我方群国武将
		local knights = FightComponent._getGroup(attackData,selfIdentity,4)
		for i = 1 , #knights do
			insert(victimTargets, createVictimTarget(knights[i]))
		end
	elseif range == 123 then
		-- 我方生命百分比最少三人
		local victims = FightComponent._getMaxTargetsN(attackData,selfIdentity,"hpRate",false,3)
		for i = 1 , #victims do
			insert(victimTargets, createVictimTarget(victims[i]))
		end
	elseif range == 124 then
		-- 我方拥有5层标记id=2的单位
		local knightList = attackData.battleData:getKnightList(selfIdentity)
		for i = 1 , #knightList do
			local knight = knightList[i]
			if knight:getMarkLevel(2) >= 5 then
				insert(victimTargets, createVictimTarget(knight))
			end
		end
	elseif range == 125 then
		-- 自身及随机我方其他1人
		victimTargets = FightComponent._getRandomNTargetsWithoutSelf(attackData, selfIdentity, 1)
		insert(victimTargets, createVictimTarget(attacker))
	elseif range == 126 then
		-- 自身及随机我方其他2人
		victimTargets = FightComponent._getRandomNTargetsWithoutSelf(attackData, selfIdentity, 2)
		insert(victimTargets, createVictimTarget(attacker))
	elseif range == 127 then
		-- 自身及随机我方其他3人
		victimTargets = FightComponent._getRandomNTargetsWithoutSelf(attackData, selfIdentity, 3)
		insert(victimTargets, createVictimTarget(attacker))
	elseif range == 128 then
		-- 我方已死亡的全体单位
		local knightList = attackData.battleData:getKnightList(selfIdentity, true)
		for i = 1, #knightList do
			local knight = knightList[i]
			if knight.isDead then
				insert(victimTargets, createVictimTarget(knight))
			end
		end
	elseif range == 129 then
		-- 随机1个己方阵亡武将
		local knightList = attackData.battleData:getKnightList(selfIdentity, true)
		local deadList = {}
		for i = 1, #knightList do
			local knight = knightList[i]
			if knight.isDead then
				insert(deadList, knight)
			end
		end
		if #deadList > 0 then
			local chooseIndex = FightComponent._random(1, #deadList,battleField)
			insert(victimTargets, createVictimTarget(deadList[chooseIndex]))
		end
	elseif range == 130 then
		-- 随机2个己方阵亡武将
		local knightList = attackData.battleData:getKnightList(selfIdentity, true)
		local deadList = {}
		for i = 1, #knightList do
			local knight = knightList[i]
			if knight.isDead then
				insert(deadList, knight)
			end
		end
		while #deadList > 2 do
			local loser = FightComponent._random(1, #deadList,battleField)
			remove(deadList,loser)
		end
		for i = 1, #deadList do
			insert(victimTargets, createVictimTarget(deadList[i]))
		end
	elseif range == 131 then
		-- 131-本次行动复活的1个友方单位
		local rebornKnights = attackData.battleData:getRebornKnights()
		for i = 1, #rebornKnights do
			local knight = rebornKnights[i]
			if not knight.isDead and knight.identity == selfIdentity then
				insert(victimTargets, createVictimTarget(knight))
				break
			end
		end
	elseif range == 132 then
		-- 132-本次行动复活的2个友方单位
		local leftNum = 2
		local rebornKnights = attackData.battleData:getRebornKnights()
		for i = 1, #rebornKnights do
			local knight = rebornKnights[i]
			if not knight.isDead and knight.identity == selfIdentity then
				insert(victimTargets, createVictimTarget(knight))
				leftNum = leftNum - 1
				if leftNum == 0 then
					break
				end
			end
		end
	elseif range == 133 then
		-- 133-我方攻击力最高单位
		local victim = FightComponent._getRandomMaxTargets(attackData,selfIdentity,"ATTACK",true)
		insert(victimTargets, createVictimTarget(victim))
	elseif range == 134 then
		-- 134-我方被控制的人
		local ControlBuffWeight = load("core.ControlBuffWeight")
		local totalWeight = 0
		local min, max = 0, 0
		local pool = {}
		local kngihtsList = attackData.battleData:getKnightList(selfIdentity)
		for i, knight in ipairs(kngihtsList) do
			local buffs = knight:getBuffs()
			for i, buff in ipairs(buffs) do
				if buff.buffCfg.buff_control_type == 1 then
					local weight = ControlBuffWeight.getWeight(buff.buffCfg)
					min = totalWeight
					totalWeight = totalWeight + weight
					max = totalWeight
					insert(pool, {min = min, max= max, knight = knight})
				end
			end
		end
		-- 按权重随机
		local randNum = battleField:boundedrand(1, totalWeight)
		-- 在区间列表里找命中的 (min, max]
		for i, v in ipairs(pool) do
			if v.min < randNum and randNum <= v.max then
				insert(victimTargets, createVictimTarget(v.knight))
				break
			end
		end
	elseif range == 201 then
		-- 201-继承伤害1的范围
		local lastRange = lastTargets[1]
		if lastRange then
			for i , v in ipairs(lastRange) do
				insert(victimTargets,copyTarget(v))
			end
		end
	elseif range == 202 then
		-- 202-继承伤害2的范围
		local lastRange = lastTargets[2]
		if lastRange then
			for i , v in ipairs(lastRange) do
				insert(victimTargets,copyTarget(v))
			end
		end
	elseif range == 203 then
		-- 203-继承上一伤害的范围
		local lastRange = lastTargets[#lastTargets]
		if lastRange then
			for i , v in ipairs(lastRange) do
				insert(victimTargets,copyTarget(v))
			end
		end
	elseif range == 204 then
		-- 204-继承第一组范围中生命百分比最少一个
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victim = FightComponent._getRandomMaxTargetsGroup(knights,"hpRate",false,battleField)
		local target = ktor[victim]
		insert(victimTargets,copyTarget(target))
	elseif range == 205 then
		-- 205-继承第一组范围中生命百分比最多一个
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victim = FightComponent._getRandomMaxTargetsGroup(knights,"hpRate",true,battleField)
		local target = ktor[victim]
		insert(victimTargets,copyTarget(target))
	elseif range == 206 then
		-- 206-继承第一组范围中生命百分比低于30%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",300,false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 207 then
		-- 207-继承第一组范围中生命百分比低于40%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",400,false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 208 then
		-- 208-继承第一组范围中生命百分比低于50%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",500,false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 209 then
		-- 209-继承第一组范围中生命百分比低于60%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",600,false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 210 then
		-- 210-继承第一组范围中生命百分比低于80%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",800,false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 211 then
		-- 211-继承第一组范围中生命百分比高于30%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",300,true)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 212 then
		-- 212-继承第一组范围中生命百分比高于50%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",500,true)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 213 then
		-- 213-继承第一组范围中生命百分比高于70%的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"hpRate",700,true)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 214 then
		-- 214-继承第一组范围中怒气大于等于3的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"INITIAL_ANGER",3,true)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 215 then
		-- 215-继承第一组范围中魏国武将单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpGroup(knights,1)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 216 then
		-- 216-继承第一组范围中蜀国武将单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpGroup(knights,2)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 217 then
		-- 217-继承第一组范围中吴国武将单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpGroup(knights,3)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 218 then
		-- 218-继承第一组范围中群国武将单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpGroup(knights,4)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 219 then
		-- 219-继承第一组效果范围中怒气小于4的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"INITIAL_ANGER", 3, false)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 220 then
		-- 220-继承第一组效果范围中怒气大于3的单位
		local lastRange = lastTargets[1]
		local knights,ktor = FightComponent._getRangeKnights(lastRange)
		local victims = FightComponent._getSpKnightsGroup(knights,"INITIAL_ANGER", 4, true)
		for i = 1 , #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 221 then
		-- 221-继承第一组效果范围中攻击力大于等于自身的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local selfAtk = attacker.advanceInfo.ATTACK
		local victims = FightComponent._getSpKnightsGroup(knights, "ATTACK", selfAtk, true)
		for i = 1, #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 222 then
		-- 222-继承第一组效果范围中攻击力小于自身的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local selfAtk = attacker.advanceInfo.ATTACK
		local victims = FightComponent._getSpKnightsGroup(knights, "ATTACK", selfAtk - 1, false)
		for i = 1, #victims do
			insert(victimTargets,copyTarget(ktor[victims[i]]))
		end
	elseif range == 223 then
		-- 223-继承第一组效果范围中处于灼烧状态的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange) 
		local victims = FightComponent._getSpBuffKnights(knights, BuffRule.EFFECT_TYPE.BURNING)
		for i = 1, #victims do
			insert(victimTargets, copyTarget(ktor[victims[i]]))
		end
	elseif range == 224 then
		-- 224-继承第一组效果范围中敌方处于标记id=1状态下的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange) 
		for i = 1, #knights do
			if knights[i]:getMarkLevel(1) > 0 then
				insert(victimTargets, copyTarget(ktor[knights[i]]))
			end
		end
	elseif range == 225 then
		-- 225-继承第一组效果范围中处于减益buff状态下的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange) 
		-- local victims = FightComponent._getSpBuffKnights(knights, BuffRule.EFFECT_TYPE.BURNING)
		local victims = {}
		for i = 1, #knights do
			local knight = knights[i]
			for j = 1, #knight.buffs do
				local buff = knight.buffs[j]
				if buff.buffCfg.buff_increase_type == 2 then
					insert(victims, knight)
					break
				end
			end
		end
		for i = 1, #victims do
			insert(victimTargets, copyTarget(ktor[victims[i]]))
		end
	elseif range == 226 then
		-- 226-继承第一组效果范围中生命百分比高于自己的敌方单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local hpRate = attacker.baseInfo.hpRate
		local victims = FightComponent._getSpKnightsGroup(knights, "hpRate", hpRate + 1, true)
		for i = 1, #victims do
			local victim = victims[i]
			if victim.identity == targetIdentity then
				insert(victimTargets,copyTarget(ktor[victim]))
			end
		end
	elseif range == 227 then
		-- 227-继承第一组效果范围中生命百分比低于自己的敌方单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local hpRate = attacker.baseInfo.hpRate
		local victims = FightComponent._getSpKnightsGroup(knights, "hpRate", hpRate - 1, false)
		for i = 1, #victims do
			local victim = victims[i]
			if victim.identity == targetIdentity then
				insert(victimTargets,copyTarget(ktor[victim]))
			end
		end
	elseif range == 228 then
		-- 228-继承第一组效果范围中生命百分比高于自己的友方单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local hpRate = attacker.baseInfo.hpRate
		local victims = FightComponent._getSpKnightsGroup(knights, "hpRate", hpRate + 1, true)
		for i = 1, #victims do
			local victim = victims[i]
			if victim.identity == selfIdentity then
				insert(victimTargets,copyTarget(ktor[victim]))
			end
		end
	elseif range == 229 then
		-- 229-继承第一组效果范围中生命百分比低于自己的友方单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		local hpRate = attacker.baseInfo.hpRate
		local victims = FightComponent._getSpKnightsGroup(knights, "hpRate", hpRate - 1, false)
		for i = 1, #victims do
			local victim = victims[i]
			if victim.identity == selfIdentity then
				insert(victimTargets,copyTarget(ktor[victim]))
			end
		end
	elseif range == 230 then
		-- 230-继承第一组效果范围中处于爆炎buff状态下的单位
		local lastRange = lastTargets[1]
		local knights, ktor = FightComponent._getRangeKnights(lastRange)
		for i = 1, #knights do
			local knight = knights[i]
			if knight:hasBuffByEffectType(BuffRule.EFFECT_TYPE.BLAST_BURNING) then
				insert(victimTargets, copyTarget(ktor[knight]))
			end
		end
	end
	-- assert(#victimTargets > 0, string.format("Invalid or Unsupport range %s", range))

	return victimTargets

end

-- list随机出n个元素
function FightComponent._getRandomN(list, n, battleField)
	local cloneList = {}
	local newList = {}
	for i, v in ipairs(list) do
		insert(cloneList, v)
	end
	local len = #cloneList
	for i = len, max(len-n+1, 1), -1 do
		local index = FightComponent._random(1, i, battleField)
		local tmp = cloneList[index]
		insert(newList, tmp)
		cloneList[i], cloneList[index] = cloneList[index], cloneList[i]
	end

	return newList
end

function FightComponent._getRangeKnights(range)
	local knights = {}
	local ktor = {}
	if range then
		for i = 1 , #range do
			knights[i] = range[i].victim
			ktor[knights[i]] = range[i]
		end
	end
	return knights,ktor
end

function FightComponent._getRandomKnight(attackData,identity)
	local knightList = attackData.battleData:getKnightList(identity)
	local chooseIndex = FightComponent._random(1, #knightList,attackData.battleField)
	return knightList[chooseIndex]
end
function FightComponent._getRandomNTargets(attackData,identity,num)
	local createVictimTarget = FightComponent._createVictimTarget
	local knightList = attackData.battleData:getKnightList(identity)
	local victimTargets = {}
	for i = 1 , #knightList do
		insert(victimTargets, createVictimTarget(knightList[i]))
	end
	while #victimTargets > num do
		local loser = FightComponent._random(1, #victimTargets,attackData.battleField)
		remove(victimTargets,loser)
	end
	return victimTargets
end

function FightComponent._getRandomNTargetsWithoutSelf(attackData, identity, num)
	local createVictimTarget = FightComponent._createVictimTarget
	local knightList = attackData.battleData:getKnightList(identity)
	local victimTargets = {}
	local attacker = attackData.attacker
	for i = 1 , #knightList do
		local knight = knightList[i]
		-- 非自身单位
		if knight.serialId ~= attacker.serialId then
			insert(victimTargets, createVictimTarget(knightList[i]))
		end
	end
	while #victimTargets > num do
		local loser = FightComponent._random(1, #victimTargets,attackData.battleField)
		remove(victimTargets,loser)
	end
	return victimTargets
end

function FightComponent._getRandomMaxTargets(attackData,identity,attrName,high)
	local knightList = attackData.battleData:getKnightList(identity)
	return FightComponent._getRandomMaxTargetsGroup(knightList,attrName,high,attackData.battleField)
end

function FightComponent._getRandomMaxTargets2(attackData,identity,attrName,high)
	local rate1 = 1000
	local rate2 = 1000
	local list1 = {}
	local list2 = {}
	local list = {}
	local knightList = attackData.battleData:getKnightList(identity)
	for i = 1 , #knightList do
		local knight = knightList[i]
		local knightRate = knight.advanceInfo[attrName]
		if knightRate < rate1 then
			rate2 = rate1
			list2 = list1
			rate1 = knightRate
			list1 = {}
			list1[#list1+1] = knight
		elseif knightRate == rate1 then
			list1[#list1+1] = knight
		elseif knightRate < rate2 then
			rate2 = knightRate
			list2 = {}
			list2[#list2+1] = knight
		elseif knightRate == rate2 then
			list2[#list2+1] = knight
		end
	end
	for i = 1 , #list1 do
		insert(list, list1[i])
	end
	if #list >= 2 then
		while #list > 2 do
			local loser = FightComponent._random(1, #list,attackData.battleField)
			remove(list,loser)
		end
	else
		local chooseIndex = FightComponent._random(1, #list2,attackData.battleField)
		insert(list, list2[chooseIndex])
	end
	return list
end

function FightComponent._getMaxTargetsN(attackData,identity,attrName,high,num)
	local knightList = attackData.battleData:getKnightList(identity)
	local list = {}
	for i = 1 , #knightList do
		list[i] = i
	end
	table.sort(list,function ( a,b )
		local ka = knightList[a]
		local kb = knightList[b]
		local knightRatea = ka.advanceInfo[attrName]
		local knightRateb = kb.advanceInfo[attrName]
		if knightRatea ~= knightRateb then
			if high then
				return knightRatea > knightRateb
			else
				return knightRatea < knightRateb
			end
		end
		return a < b 
	end)

	local kList = {}
	for i = 1 , num do
		insert(kList, knightList[list[i]])
	end 
	return kList
end

function FightComponent._getRandomMaxTargetsGroup(knights,attrName,high,battleField)
	local rate = -1
	local list = {}
	for i = 1 , #knights do
		local knight = knights[i]
		local knightRate = knight.advanceInfo[attrName]
		if rate < 0 or ( high and knightRate > rate ) or ( not high and knightRate < rate) then
			rate = knightRate
			list = {}
			list[#list+1] = knight
		elseif knightRate == rate then
			list[#list+1] = knight
		end
	end
	local chooseIndex = FightComponent._random(1, #list,battleField)
	return list[chooseIndex]
end

-- 找出某一方中某一属性满足要求的武将
function FightComponent._getSpKnights( attackData,identity,attrName,rate,high )
	local knightList = attackData.battleData:getKnightList(identity)
	return FightComponent._getSpKnightsGroup(knightList,attrName,rate,high)
end
-- 找出knights中某一属性满足要求的武将
function FightComponent._getSpKnightsGroup( knights,attrName,rate,high )
	local res = {}
	for i = 1 , #knights do
		local knight = knights[i]
		local knightRate = knight.advanceInfo[attrName]
		if high and knightRate >= rate or (not high and knightRate <= rate) then
			res[#res+1] = knight
		end
	end
	return res
end
-- 找出某一方中指定阵营的武将
function FightComponent._getGroup( attackData,identity,group)
	local knightList = attackData.battleData:getKnightList(identity)
	return FightComponent._getSpGroup(knightList,group)
end
-- 从knights中找出指定阵营的武将
function FightComponent._getSpGroup( knights,group)
	local res = {}
	for i = 1 , #knights do
		local knight = knights[i]
		if knight.knightCfg.group == group then
			res[#res+1] = knight
		end
	end
	return res
end

-- 找出knights中，拥有某种类型buff的武将
function FightComponent._getSpBuffKnights(knights, buffEffectType)
	local list = {}
	for i = 1, #knights do
		local knight = knights[i]
		if knight:hasBuffByEffectType(buffEffectType) then
			table.insert(list, knight)
		end
	end
	return list
end

function FightComponent._createVictimTarget(victim)

	if not victim then
		return nil
	end

	local target = {
		victim = victim,
		miss = false, -- 闪避
		crit = false, -- 暴击
		block = false, -- 格挡
		inherit = false, -- 是否是继承的目标
	}

	return target

end

function FightComponent._copyTarget( victimTarget )
	if victimTarget then
		local target = FightComponent._createVictimTarget(victimTarget.victim)
		target.miss = victimTarget.miss
		target.crit = victimTarget.crit
		target.block = victimTarget.block
		target.inherit = true
		return target
	end
end

-- 数据在这里处理后再通过公式计算
-- attackData.range = skillCfg["skill_range_"..i]
-- attackData.affectType = skillCfg["skill_affect_type_"..i]
-- attackData.affectRate = skillCfg["skill_affect_prob_"..i]
-- attackData.formula = skillCfg["formula_"..i]
-- attackData.formulaValue1 = skillCfg["formula_"..i.."_value_1"]
-- attackData.formulaValue2 = skillCfg["formula_"..i.."_value_2"]
-- attackData.attacker = attacker
-- attackData.battleData = battleData
-- attackData.battleField = battleField
-- attackData.skillCfg = skillCfg
-- attackData.fightResult = fightResult
-- attackData.targets = targets
function FightComponent._calcFight( attackData )

	local results = {}
	local attacker = attackData.attacker
	local affectType = attackData.affectType
	local attackerInfo = attacker.advanceInfo
	local range = FightComponent._range

	local firstMultiple = 0
	if not attacker.isPlayer then
		-- 首个技能作用效果，伤害、治疗倍率计算
		if attackData.affectType == 1 or attackData.affectType == 2 then
			firstMultiple = FightComponent._excuteSpEffect({
				knight = attacker,
				fightResult = attackData.fightResult,
				rType = SkillSpecialRule.TYPE.SKILL, 
				rValue = {cfg=attackData.skillCfg,result={}}, 
				spType = SkillSpecialRule.SP_TYPE.SKILL_MULTIPLE, 
				spData = 0,
			})
		end
	end
	-- 遍历每个目标
	for i , target in ipairs(attackData.victims) do
		-- 判断是否触发
		local affectRate = attackData.affectRate
		-- 减怒处理
		if affectType == 3 then
			-- 减怒抵抗
			if target.victim:doBuff(BuffRule.TYPE.RESIST_DEANGER) then
				affectRate = 0
			else
				local victimInfo = target.victim.advanceInfo
				local change = attackerInfo.REANGER_ACCURATY_ADD - victimInfo.REANGER_ACCURATY_DEC
				change = range(Parameters.BASE_DEANGER_RATE_LOW,Parameters.BASE_DEANGER_RATE_HIGH, change)
				affectRate = affectRate * (1 + change * 0.001)
				affectRate = range(Parameters.BASE_FINAL_DEANGER_RATE_LOW,Parameters.BASE_FINAL_DEANGER_RATE_HIGH, affectRate)
			end
		elseif affectType == 10 then
			-- 破冰处理
			-- TODO 后面版本优化破冰，不在客户端拆效果
			local victim = target.victim
			if victim:getBuffCntByEffectType(BuffRule.EFFECT_TYPE.FROZEN) == 0 then
				-- 没中冰冻buff，不命中
				affectRate = 0
			end
		end
		-- 检查技能效果次数
		local isLimit = FightComponent._checkAffectLimit(attackData)
		if isLimit then
			affectRate = 0
		end
		if attackData.battleField:bingo(affectRate) then
			-- 处理受击者的buff和被动技能
			local victim = target.victim
			victim:clearAdvanceInfo()
			victim:doBuff(BuffRule.TYPE.ATTR)

			local result
			if affectType == 1 then
				-- 秒杀公式无视疾风
				if attackData.formula ~= 12 then
					-- 是否是强制闪避
					local forceMiss = victim:doBuff(BuffRule.TYPE.FORCE_MISS, false)
					if forceMiss then
						target.miss = true
						result = {
							miss = true,
							damage = 0,
						}
					end
				end
			end
			if not result then
				-- 计算用的数据
				local attackInfo = {}
				attackInfo.attacker = attacker
				attackInfo.target = target
				attackInfo.skillCfg = attackData.skillCfg
				attackInfo.formulaValue1 = attackData.formulaValue1
				attackInfo.formulaValue2 = attackData.formulaValue2
				attackInfo.formulaValueStep1 = attackData.formulaValueStep1
				attackInfo.formulaValueStep2 = attackData.formulaValueStep2
				attackInfo.battleData = attackData.battleData
				attackInfo.battleField = attackData.battleField
				attackInfo.firstResults = attackData.firstResults
				attackInfo.victims = attackData.victims
				attackInfo.affectIndex = attackData.affectIndex
				--计算公式
				local formulaFunc = FightComponent["_fightFormula"..tostring(attackData.formula)]
				-- 计算当前这个技能的结果
				result = formulaFunc(attackInfo)
				-- 计算伤害减免类Buff
				if affectType == 1 then
					victim:doBuff(BuffRule.TYPE.DAMAGE_DES, {
						skillCfg = attackInfo.skillCfg,
						result = result,
					})
				end
				if not attacker.isPlayer and attackData.attackIndex == 1 then
					if result then
						-- 首个技能作用效果，伤害、治疗倍率计算
						if affectType == 1 or affectType == 2 then
							result.damage = floor(result.damage * (1000 + firstMultiple) / 1000)
						end
					end
				end
			end
			FightComponent._afterFormula(attackData, target, results, result)
			-- if result then
			-- 	result.victim = victim
			-- 	result.affectType = attackData.affectType
			-- 	insert(results,result)
			-- end
		end
	end
	return results
end

function FightComponent._afterFormula(attackData, target, results, result)
	local attacker = attackData.attacker
	local victim = target.victim
	local skillCfg = attackData.skillCfg
	local affectType = attackData.affectType
	local affectIndex = attackData.affectIndex
	-- TODO 后面版本优化破冰，不在客户端拆效果
	if not result then return end
	if skillCfg["affect_limit_"..affectIndex] > 0 then
		if not target.miss then
			attacker:addSkillAffectTimes(skillCfg.id, affectIndex, 1)
		end
	end
	if affectType == 1 then
		if result.damage > 0 and not result.seckill then
			-- 无敌
			local isInvincible = victim:doBuff(BuffRule.TYPE.INVINCIBLE, false)
			if isInvincible then
				result.damage = 0
			end
			
			-- 伤害按比例转成反弹
			local hitbackInfo = {
				attacker = attackData.attacker,
				hitbackList = {},
				result = result,
			}

			hitbackInfo = FightComponent._excuteSpEffect({
				knight = victim,
				fightResult = attackData.fightResult,
				rType = SkillSpecialRule.TYPE.WILL_DAMAGE, 
				rValue = {attackData = attackData}, 
				spType = SkillSpecialRule.SP_TYPE.CONVERT_HITBACK, 
				spData = hitbackInfo,
			})
			if not attackData.attacker.isPlayer then
				-- 反弹效果加到结果里
				for i, v in ipairs(hitbackInfo.hitbackList) do
					attackData.fightResult:addAttackEffect({effect_type = 1, effect_value = v.damage, attacker = victim, add_effects={{add_type=5}}}, false)
				end
			end
			-- 伤害按比例转成治疗
			local recoverInfo = {
				attacker = attackData.attacker,
				recoverList = {},
				result = result,
			}
			recoverInfo = FightComponent._excuteSpEffect({
				knight = victim,
				fightResult = attackData.fightResult,
				rType = SkillSpecialRule.TYPE.WILL_DAMAGE, 
				rValue = {attackData = attackData}, 
				spType = SkillSpecialRule.SP_TYPE.CONVERT_RECOVER, 
				spData = recoverInfo,
			})
			-- 治疗效果加到结果里
			for i, v in ipairs(recoverInfo.recoverList) do
				attackData.fightResult:addAttackEffect({effect_type = 2, effect_value = v.damage, attacker = victim, victim = victim}, false)
			end
			-- 伤害反弹，反弹伤害分摊给敌方全体
			local hitbackInfo = {
				attacker = attackData.attacker,
				hitbackList = {},
				result = result,
			}
			hitbackInfo = FightComponent._excuteSpEffect({
				knight = victim,
				fightResult = attackData.fightResult,
				rType = SkillSpecialRule.TYPE.WILL_DAMAGE, 
				rValue = {attackData = attackData}, 
				spType = SkillSpecialRule.SP_TYPE.HITBACK_VICTIMS, 
				spData = hitbackInfo,
			})
			-- 反弹效果加到结果里
			for i, v in ipairs(hitbackInfo.hitbackList) do
				attackData.fightResult:addAttackEffect({effect_type = 1, effect_value = v.damage, attacker = victim, victim = v.victim, add_effects={{add_type=5}}}, false)
			end

			-- 计算伤害分摊，不分摊秒杀
			-- 生命诅咒
			local list = victim:doBuff(BuffRule.TYPE.OP_HP_LINK, {})
			if next(list) then
				-- buff生效，list为被诅咒的敌方单位集合
				local damage = floor(result.damage / (#list + 1))
				for i, v in ipairs(list) do
					insert(results, {
						affectType = 1,
						damage = damage,
						victim = v,
						hpLink = true,
						attacker = victim,	-- 分摊的伤害算在诅咒释放者身上
					})
				end
				result.damage = damage
			end
			-- 生命链接
			local list = victim:doBuff(BuffRule.TYPE.HP_LINK, {})
			if next(list) then
				-- buff生效，list为所有分摊伤害的友方单位
				local damage = floor(result.damage / (#list + 1))
				for i, victim in ipairs(list) do
					insert(results, {
						affectType = 1,
						damage = damage,
						victim = victim,
						hpLink = true,
					})
				end
				result.damage = damage
			end
		end
	elseif affectType == 10 then
		local cnt = victim:getBuffCntByEffectType(BuffRule.EFFECT_TYPE.FROZEN)
		result.victim = victim
		result.affectType = 1
		insert(results, result)
		-- 将破冰效果也加进来，为了后面清除冰冻buff
		insert(results, {
			affectType = attackData.affectType,
			victim = victim,
		})
		return
	elseif affectType == 14 then
		-- 如果本技能已生效了召唤效果，不再召唤
		local curResults = attackData.results or {}
		for i, v in ipairs(curResults) do
			if v.affectType == 14 then
				return
			end
		end
	end
	if result then
		result.victim = victim
		result.affectType = attackData.affectType
		insert(results, result)
	end
end

-- 计算技能的额外附加属性值
function FightComponent._getExtraStats(skillCfg)
	local extraData = {}
	setmetatable(extraData,{__index = function ( tb,key )
		local value = rawget(tb,key)
		if value then
			return value
		end
		return 0
	end})
	-- modify by Relvin @19.07.01 数量由2改成4
	for idx = 1, 4 do
		extraData[skillCfg["extra_stats_type_" .. idx]] = skillCfg["extra_stats_value_" ..idx]
	end
	return extraData
end

-- 各个公式

-- 默认公式，什么都不做
function FightComponent._fightFormula0(attackInfo)
	return {damage = 0}
end

-- 公式1---武将伤害技能效果
function FightComponent._fightFormula1(attackInfo)

	-- 伤害=（max[（攻方攻击-（守方对应防御*（1-无视防御%）)）,攻方攻击*0.05+10]*公式系数1%+公式系数2）*闪避判断（0,1）*暴击判断（1.5+暴击伤害强度%,1）
	--	*格挡判断（0.7+格挡免伤强度%,1）*（1+攻方增伤系数%）*（1+攻方最终增伤系数%）*战力免伤保护系数
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local isRobot = battleData.isRobot
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	local extraData = FightComponent._getExtraStats(skillCfg)
	local skillLevel = attacker.originInfo["skill_level"..skillCfg.skill_type] or 0
	local attackerInfo = attacker.advanceInfo
	local victimInfo = victim.advanceInfo

	-- 是否命中
	local hit = true
	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		hit = false
	else
		-- 判断是否命中
		-- 命中率=1+攻击方养成命中率-防守方最终闪避率+技能命中率，修正区间
		local rate = 1000 + attackerInfo.ACCURACY_RATE - victimInfo.DODGE_RATE
		-- 新增一个命中修正buff，buff持有人对buff施法者的命中降低
		if not attacker.isPlayer then
			local targetRates = attacker:doBuff(BuffRule.TYPE.TARGET_ACCURACY_RATE, {})
			rate = rate - (targetRates[victim.serialId] or 0)
		end

		rate = range(Parameters.HIT_LOW,Parameters.HIT_HIGH,rate)
		rate = rate + extraData[BattleAttr["ACCURACY_RATE"]]
		hit = battleField:bingo(rate)
	end

	-- 闪避了
	if not hit then
		-- 保存最后的结果
		local result = {
			miss = true,
			damage = 0,
		}

		-- 加上miss标记
		target.miss = true
		return result
	end

	-- 这里攻方攻击取决于这个将是用的哪种伤害，在knight_info表里的attack_type，1表示物理攻击，2表示魔法攻击
	local knightCfg = attacker.knightCfg
	local defCfg = victim.knightCfg
	local atk = attackerInfo.ATTACK
	local atkType = knightCfg.attack_type
	local atk_add = attackerInfo.ATTACK_PCT
	atk_add = range(Parameters.BASE_BUFF_PER_LOW,Parameters.BASE_BUFF_PER_HIGH,atk_add)
	atk_add = atk_add + extraData[BattleAttr["ATTACK_PCT"]]
	atk = floor(atk*(1000 + atk_add) / 1000)
	local def = 0
	local def_add = 0
	
	if knightCfg.attack_type == 1 then
		def = victimInfo.PHY_DEFENCE
		def_add = victimInfo.PHY_DEFENCE_PCT + victimInfo.DEFENCE_PCT
	else
		def = victimInfo.MAG_DEFENCE
		def_add = victimInfo.MAG_DEFENCE_PCT + victimInfo.DEFENCE_PCT
	end
	def_add = range(Parameters.BASE_BUFF_PER_LOW,Parameters.BASE_BUFF_PER_HIGH,def_add)
	def = floor(def*(1000 + def_add ) / 1000)
	-- 无视防御值，千分比
	local pierce = attackerInfo.IGNORE_DEF_ADD - victimInfo.IGNORE_DEF_DEC
	pierce = range(Parameters.NDEF_LOW,Parameters.NDEF_HIGH,pierce)
	pierce = pierce + extraData[BattleAttr["IGNORE_DEF_ADD"]]
	
	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=（攻方暴击率-防守方抗暴率+攻击方技能附带额外暴击率）
		local rate = attackerInfo.CRIT_RATE - victimInfo.HARDEN_RATE
		rate = range(Parameters.CRIT_RATE_LOW,Parameters.CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["CRIT_RATE"]]
		crit = battleField:bingo(rate)
	end

	-- 格挡判断
	local block = false
	if inherit and target.block then
		-- 之前就格挡了，这里也要格挡
		block = true
	else
		-- 格挡率=（防守方格挡率-攻击方破击率+攻击方技能附带额外破击率）
		local rate = victimInfo.BLOCK_RATE - attackerInfo.PIERCE_RATE
		rate = range(Parameters.BLOCK_RATE_LOW,Parameters.BLOCK_RATE_HIGH,rate)
		rate = rate - extraData[BattleAttr["PIERCE_RATE"]]
		block = battleField:bingo(rate)
	end

	-- 这里比例数值都是按照千分比来计算，所以相应运算的其他单位也会跟着调整

	-- 攻击计算 先按1000倍来算
	-- 攻方攻击-（守方对应防御*（1-无视防御%）
	local atkValue = atk * 1000 - def * ( 1000 - pierce)
	local multi = 1000 -- 计算倍数
	-- max[攻击值,攻方攻击*0.05+10]
	atkValue = max( atkValue , atk * 50 + 10000)
	-- 攻击值*公式系数1%+公式系数2 再乘1000倍
	atkValue = atkValue * (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) + (attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel) * 1000
	multi = multi * 1000
	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（攻方暴击强度-防守方暴击减免+攻击方技能附带额外暴击伤害）
		local critValue = attackerInfo.CRIT_DAMAGE_ADD - victimInfo.CRIT_DAMAGE_DEC
		critValue = range(Parameters.CRIT_LOW,Parameters.CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["CRIT_DAMAGE_ADD"]]
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end
	
	-- 如果格挡了
	if block then
		-- 计算格挡强度 格挡强度=攻方格挡减免-防守方格挡强度
		local blockValue = attackerInfo.BLOCK_DAMAGE_DEC - victimInfo.BLOCK_DAMAGE_ADD
		blockValue = range(Parameters.BLOCK_LOW,Parameters.BLOCK_HIGH,blockValue)
		-- 格挡计算 再乘1000倍
		-- 攻击值*（0.7+格挡免伤强度%）
		atkValue = atkValue * ( 700 + blockValue )
		multi = multi * 1000
	end
	
	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	-- 计算增伤系数
	-- 抗灭增伤
	local mie = 0
	-- 主角不算抗灭
	if defCfg.group > 0 and knightCfg.group > 0 and defCfg.group <= 4 and knightCfg.group <= 4 then
		-- TODO 时空将 抗灭
		local mieList = {"WEI_DAMAGE_","SHU_DAMAGE_","WU_DAMAGE_","QUN_DAMAGE_"}
		mie = attackerInfo[mieList[defCfg.group].."ADD"] - victimInfo[mieList[knightCfg.group].."DEC"]
		mie = range(Parameters.GROUP_LOW,Parameters.GROUP_HIGH,mie)
	end
	-- 增伤率
	local damage_add = attackerInfo.DAMAGE_ADD - victimInfo.DAMAGE_DEC
	if isPvp and not isRobot then
		-- 计算pvp属性
		damage_add = damage_add + attackerInfo.PVP_DAMAGE_ADD - victimInfo.PVP_DAMAGE_DEC
	end
	damage_add = damage_add + mie 
	damage_add = range(Parameters.DAMAGEUP_LOW,Parameters.DAMAGEUP_HIGH,damage_add)
	damage_add = damage_add + extraData[BattleAttr["DAMAGE_ADD"]]
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + damage_add )
	multi = multi * 1000
	
	--计算最终增伤系数
	local fDamage_add = attackerInfo.FIN_DAMAGE_ADD - victimInfo.FIN_DAMAGE_DEC
	fDamage_add = range(Parameters.FDAMAGEUP_LOW,Parameters.FDAMAGEUP_HIGH,fDamage_add)
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + fDamage_add )
	multi = multi * 1000
	
	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1
	
	if isPvp and not isRobot then
		-- 战力免伤保护计算
		-- 战力免伤保护系数=1+2.5*(0.95*攻击方战斗力总和-防守方战斗力总和)/防守方战斗力总和
		local attackFightValue = battleData:getFightValue(attackIdentity)
		local victimFightValue = battleData:getFightValue(victimIdentity)
		local fightPro = 1000 + floor((Parameters.FIGHTVALUE_PROTECT_VALUE1 * ( Parameters.FIGHTVALUE_PROTECT_VALUE2 * attackFightValue - victimFightValue * 1000 )/1000) / victimFightValue)
		fightPro = range(Parameters.FIGHTVALUE_LOW,Parameters.FIGHTVALUE_HIGH,fightPro)
		-- 加到伤害上
		atkValue = atkValue * fightPro
		multi = multi * 1000
	end

	-- 再乘以增伤系数
	atkValue = atkValue * attacker.multiple
	multi = multi * 1000

	-- 怪物特性增伤
	local ktom = victimInfo.BATTLE_KTOM_DAMAGE_ADD - victimInfo.BATTLE_KTOM_DAMAGE_DESC
	ktom = range(Parameters.KTOM_DAMAGE_LOW,Parameters.KTOM_DAMAGE_HIGH,ktom)
	atkValue = atkValue * ( 1000 + ktom )
	multi = multi * 1000

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1
	-- 守方品质压制
	local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
	atkValue = atkValue * (1000 - qualityDamDesc)
	multi = multi * 1000
	
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))

	
	-- 保存最后的结果
	local result = {
		miss = false,
		damage = atkValue,
		crit = crit,
		block = block,
	}

	return result
end

-- 公式2---武将恢复技能效果
function FightComponent._fightFormula2(attackInfo)

	-- 恢复技能恢复值=（释放方对应攻击*公式系数1%+公式系数2）*暴击判断（1.5+暴击伤害增加%,1）*(1+治愈量增益系数%)*randbettween(0.95.1.05)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local isRobot = battleData.isRobot
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	local attackerInfo = attacker.advanceInfo
	local victimInfo = victim.advanceInfo
	local skillLevel = attackerInfo["skill_level"..skillCfg.skill_type] or 0
	local extraData = FightComponent._getExtraStats(skillCfg)

	local atk = attackerInfo.ATTACK
	local atk_add = attackerInfo.ATTACK_PCT
	atk_add = range(Parameters.BASE_BUFF_PER_LOW,Parameters.BASE_BUFF_PER_HIGH,atk_add)
	atk_add = atk_add + extraData[BattleAttr["ATTACK_PCT"]]
	atk = floor(atk*(1000 + atk_add) / 1000)
	
	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=（攻方暴击率+攻击方技能附带额外暴击率）/2
		local rate = attackerInfo.CRIT_RATE / 2
		rate = range(Parameters.HEAL_CRIT_RATE_LOW,Parameters.HEAL_CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["CRIT_RATE"]]/2
		crit = battleField:bingo(rate)
	end
	
	local atkValue = atk * (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) + (attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel) * 1000
	local multi = 1000
	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（攻方暴击强度-防守方暴击减免+攻击方技能附带额外暴击伤害）
		local critValue = attackerInfo.CRIT_DAMAGE_ADD / 2
		critValue = range(Parameters.HEAL_CRIT_LOW,Parameters.HEAL_CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["CRIT_DAMAGE_ADD"]]/2
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end

	local heal_add = attackerInfo.HEAL_ADD - victimInfo.HEAL_DEC
	heal_add = range(Parameters.HEALUP_LOW,Parameters.HEALUP_HIGH,heal_add)
	atkValue = atkValue * ( 1000 + heal_add )
	multi = multi * 1000

	atkValue = atkValue * 1.2
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))

	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = crit,
	}

	return result
end

-- 公式3---合击技能伤害效果
function FightComponent._fightFormula3(attackInfo)

	-- 合击伤害=（基础合击伤害*合击技能系数1%+合击技能系数2）*暴击判断（1.5+合击暴击伤害强度%,1）*（1+攻方合击增伤系数%）*（1+攻方最终增伤系数%）*战力免伤保护系数
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local victimInfo = victim.baseInfo
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local isRobot = battleData.isRobot
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	-- 取出双方的合击数据
	local attackData = battleData:getComboInfo(attackIdentity)
	local victimData = battleData:getComboInfo(victimIdentity)
	local skillLevel = attackData:getSkillLevel(attacker.id)

	local extraData = FightComponent._getExtraStats(skillCfg)
	local attackerInfo = attackData.baseInfo
	local victimerInfo = victimData.baseInfo
	local atk = attackerInfo.COMBO_ATTACK

	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=（攻方暴击率-防守方抗暴率+(攻击方集体暴击率-防守方初始抗暴率)*0.5+攻击方技能附带额外暴击率）
		local rate = attackerInfo.COMBO_CRIT_RATE - victimerInfo.COMBO_HARDEN_RATE
		rate = rate + floor((attackerInfo.COMBO_BASE_CRIT_RATE - victimInfo.HARDEN_RATE)*0.5)
		rate = range(Parameters.COMBO_CRIT_RATE_LOW,Parameters.COMBO_CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["COMBO_CRIT_RATE"]]
		crit = battleField:bingo(rate)
	end

	-- 这里比例数值都是按照千分比来计算，所以相应运算的其他单位也会跟着调整

	-- 攻击计算 先按1000倍来算
	local atkValue = atk * (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) + (attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel) * 1000
	local multi = 1000 -- 计算倍数

	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（攻方暴击强度-防守方暴击减免+(攻击方集体暴击强度-防守方初始抗暴强度)*0.5+攻击方技能附带额外暴击伤害）
		local critValue = attackerInfo.COMBO_CRIT_DAMAGE_ADD - victimerInfo.COMBO_CRIT_DAMAGE_DEC
		critValue = critValue + floor((attackerInfo.COMBO_BASE_CRIT_DAMAGE_ADD - victimInfo.CRIT_DAMAGE_DEC)*0.5)
		critValue = range(Parameters.COMBO_CRIT_LOW,Parameters.COMBO_CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["COMBO_CRIT_DAMAGE_ADD"]]
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1
	
	-- 计算增伤系数
	local damage_add = attackerInfo.COMBO_DAMAGE_ADD - victimerInfo.COMBO_DAMAGE_DEC
	local damage_add_add = attackerInfo.COMBO_BASE_DAMAGE_ADD - victimInfo.DAMAGE_DEC
	if isPvp and not isRobot then
		damage_add_add = damage_add_add + attackerInfo.COMBO_BASE_PVP_DAMAGE_ADD - victimInfo.PVP_DAMAGE_DEC
	end
	damage_add = damage_add + floor(damage_add_add * 0.75)
	damage_add = range(Parameters.COMBO_DAMUP_LOW,Parameters.COMBO_DAMUP_HIGH,damage_add)
	damage_add = damage_add + extraData[BattleAttr["COMBO_DAMAGE_ADD"]]
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + damage_add )
	multi = multi * 1000

	--计算最终增伤系数
	local fDamage_add = attackerInfo.COMBO_FINAL_DAMAGE_ADD - victimInfo.FIN_DAMAGE_DEC
	fDamage_add = range(Parameters.COMBO_FDAMUP_LOW,Parameters.COMBO_FDAMUP_HIGH,fDamage_add)
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + fDamage_add )
	multi = multi * 1000

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	if isPvp and not isRobot then
		-- 战力免伤保护计算
		-- 战力免伤保护系数=1+2.5*(0.95*攻击方战斗力总和-防守方战斗力总和)/防守方战斗力总和
		local attackFightValue = battleData:getFightValue(attackIdentity)
		local victimFightValue = battleData:getFightValue(victimIdentity)
		local fightPro = 1000 + floor((Parameters.FIGHTVALUE_PROTECT_VALUE1 * ( Parameters.FIGHTVALUE_PROTECT_VALUE2 * attackFightValue - victimFightValue * 1000 )/1000) / victimFightValue)
		fightPro = range(Parameters.COMBO_FIGHTVALUE_LOW,Parameters.COMBO_FIGHTVALUE_HIGH,fightPro)
		-- 加到伤害上
		atkValue = atkValue * fightPro
		multi = multi * 1000
	end

	-- 再乘以增伤系数
	atkValue = atkValue * attacker.multiple
	multi = multi * 1000
	
	-- 怪物特性增伤
	local ktom = victim.advanceInfo.BATTLE_UTOM_DAMAGE_ADD - victim.advanceInfo.BATTLE_UTOM_DAMAGE_DESC
	ktom = range(Parameters.UTOM_DAMAGE_LOW,Parameters.UTOM_DAMAGE_HIGH,ktom)
	atkValue = atkValue * ( 1000 + ktom )
	multi = multi * 1000

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	-- 守方品质压制
	local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
	atkValue = atkValue * (1000 - qualityDamDesc)
	multi = multi * 1000

	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))
	
	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = crit,
	}

	return result

end

-- 公式4---合击技能回复
function FightComponent._fightFormula4(attackInfo)
	-- 恢复技能恢复值=（基础合击恢复*公式系数1%+公式系数2）*暴击判断（1.5+暴击伤害增加%,1）*randbettween(0.95.1.05)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	-- 取出双方的合击数据
	local attackData = battleData:getComboInfo(attackIdentity)
	local victimData = battleData:getComboInfo(victimIdentity)
	local skillLevel = attackData:getSkillLevel(attacker.id)
	local attackerInfo = attackData.baseInfo
	local atk = attackerInfo.COMBO_ATTACK
	local extraData = FightComponent._getExtraStats(skillCfg)

	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=（攻方暴击率 + 攻击方集体暴击率*0.25）/2
		local rate = (attackerInfo.COMBO_CRIT_RATE + floor(attackerInfo.COMBO_BASE_CRIT_RATE * 0.25)) / 2
		rate = range(Parameters.COMBO_HEAL_CRIT_RATE_LOW,Parameters.COMBO_HEAL_CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["COMBO_CRIT_RATE"]]/2
		crit = battleField:bingo(rate)
	end

	local atkValue = atk * (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) + (attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel) * 1000
	local multi = 1000

	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（攻方暴击强度 + 攻击方集体暴击强度*0.25）/2
		local critValue = (attackerInfo.COMBO_CRIT_DAMAGE_ADD + floor(attackerInfo.COMBO_BASE_CRIT_DAMAGE_ADD * 0.25)) / 2
		critValue = range(Parameters.COMBO_HEAL_CRIT_LOW,Parameters.COMBO_HEAL_CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["COMBO_CRIT_DAMAGE_ADD"]]/2
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end

	atkValue = atkValue * 1.2
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))

	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = crit,
	}

	return result
end

-- 公式5---特殊技能效果
function FightComponent._fightFormula5(attackInfo)
	-- 输出值=配置值

	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData
	local inherit = target.inherit -- 是否继承

	-- 是否命中
	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		return
	end

	local skillLevel = 0
	local attacker = attackInfo.attacker
	if attacker.isPlayer then
		local battleData = attackInfo.battleData
		local attackIdentity = attacker.identity
		local attackData = battleData:getComboInfo(attackIdentity)
		skillLevel = attackData:getSkillLevel(attacker.id)
	else
		local skillCfg = attackInfo.skillCfg
		skillLevel = attacker.advanceInfo["skill_level"..skillCfg.skill_type] or 0
	end
	local result = {
		damage = attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel,
		addDamage = attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel,
	}
	return result
end

-- -- 公式6---百分比属性效果
-- function FightComponent._fightFormula6(attackInfo)
-- 	-- 输出值=配置值/1000
-- 	return attackInfo.formulaValue1
-- end

-- -- 公式7---hot/dot效果计算
-- function FightComponent._fightFormula7(attackInfo)
-- 	-- buff系数*释放方对应攻击
-- end

-- 公式8---按攻击目标总生命进行百分比伤害/回复
-- 输出值 = min(配置值% * 攻击目标最大生命值, 攻击方攻击力*formula_1_value2)
-- 攻击方攻击力: 武将释放=武将进战斗的面板攻击力；合击释放=攻击方平均攻击力
-- 配置值 = formula_1_value_1 + 等级 * formula_1_value_1_step
function FightComponent._fightFormula8(attackInfo)
	-- 输出值=配置值%*攻击目标生命最大值
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	local skillLevel = 0
	local atkValue = 0
	if attacker.isPlayer then
		local attackData = battleData:getComboInfo(attackIdentity)
		skillLevel = attackData:getSkillLevel(attacker.id)
		atkValue = attackData.baseInfo.COMBO_ATTACK
	else
		skillLevel = attacker.advanceInfo["skill_level"..skillCfg.skill_type] or 0
		atkValue = attacker.advanceInfo.ATTACK
	end

	-- 是否命中
	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		-- 保存最后的结果
		local result = {
			miss = true,
			damage = 0,
		}

		-- 加上miss标记
		target.miss = true
		return result
	end
	-- 生命百分比伤害
	local multi = 1
	local atkValue2 = (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) * victim.originInfo.INITIAL_HP
	atkValue = min(atkValue2, atkValue * attackInfo.formulaValue2)
	multi = multi * 1000

	-- 守方品质压制
	local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
	atkValue = atkValue * (1000 - qualityDamDesc)
	multi = multi * 1000
	atkValue = floor(atkValue / multi)

	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = false,
	}

	return result
end

-- 公式9---按攻击方总生命进行百分比伤害/回复
function FightComponent._fightFormula9(attackInfo)
	-- 输出值=配置值%*攻击方生命最大值
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	local skillLevel = 0
	local totalHp = 0
	if attacker.isPlayer then
		local attackData = battleData:getComboInfo(attackIdentity)
		skillLevel = attackData:getSkillLevel(attacker.id)
		totalHp = attackData.baseInfo.COMBO_HP
	else
		skillLevel = attacker.advanceInfo["skill_level"..skillCfg.skill_type] or 0
		totalHp = attacker.originInfo.INITIAL_HP
	end
	
	-- 是否命中
	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		-- 保存最后的结果
		local result = {
			miss = true,
			damage = 0,
		}

		-- 加上miss标记
		target.miss = true
		return result
	end

	local multi = 1000
	local atkValue = totalHp*( attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel)

	-- 守方品质压制
	local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
	atkValue = atkValue * (1000 - qualityDamDesc)
	multi = multi * 1000

	atkValue = floor(atkValue / multi)
	
	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = false,
	}

	return result
end

-- 公式10---战宠技能伤害效果
function FightComponent._fightFormula10(attackInfo)
	-- 战宠伤害 = (基础战宠伤害*战宠技能系数1%+战宠技能系数2)*暴击判断(1.5+战宠暴击伤害强度%,1)*(1+攻方战宠增伤系数%)*战力增伤保护系数*玩法加成系数
	-- 最终战宠伤害 = int(战宠伤害*rand(0.95,1.05))
	-- 战宠技能必命中
	-- 战宠技能不可被格挡
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local victimInfo = victim.baseInfo
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local isRobot = battleData.isRobot
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity

	local attackData = battleData:getComboInfo(attackIdentity)
	local victimData = battleData:getComboInfo(victimIdentity)
	local extraData = FightComponent._getExtraStats(skillCfg)
	local attackerInfo = attackData.baseInfo
	local victimerInfo = victimData.baseInfo
	local atk = attackerInfo.COMBO_ATTACK
	
	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=((攻方初始暴击率-防守方初始抗暴率)*0.5+攻击方技能附带额外暴击率)
		local rate = floor((attackerInfo.COMBO_BASE_CRIT_RATE - victimInfo.HARDEN_RATE)*0.5)
		rate = range(Parameters.COMBO_CRIT_RATE_LOW,Parameters.COMBO_CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["COMBO_CRIT_RATE"]]
		crit = battleField:bingo(rate)
	end

	-- 这里比例数值都是按照千分比来计算，所以相应运算的其他单位也会跟着调整

	-- 攻击计算 先按1000倍来算
	local atkValue = atk * attackInfo.formulaValue1 + attackInfo.formulaValue2 * 1000
	local multi = 1000 -- 计算倍数

	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（(攻击方集体暴击强度-防守方初始抗暴强度)*0.5+攻击方技能附带额外暴击伤害）
		local critValue = floor((attackerInfo.COMBO_BASE_CRIT_DAMAGE_ADD - victimInfo.CRIT_DAMAGE_DEC)*0.5)
		critValue = range(Parameters.COMBO_CRIT_LOW,Parameters.COMBO_CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["COMBO_CRIT_DAMAGE_ADD"]]
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1
	
	-- 计算增伤系数
	local damage_add = 0
	local damage_add_add = attackerInfo.COMBO_BASE_DAMAGE_ADD - victimInfo.DAMAGE_DEC
	if isPvp and not isRobot then
		damage_add_add = damage_add_add + attackerInfo.COMBO_BASE_PVP_DAMAGE_ADD - victimInfo.PVP_DAMAGE_DEC
	end
	damage_add = damage_add + floor(damage_add_add * 0.75)
	damage_add = range(Parameters.COMBO_DAMUP_LOW,Parameters.COMBO_DAMUP_HIGH,damage_add)
	damage_add = damage_add + extraData[BattleAttr["COMBO_DAMAGE_ADD"]]
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + damage_add )
	multi = multi * 1000

	--计算最终增伤系数
	local fDamage_add = attackerInfo.COMBO_FINAL_DAMAGE_ADD - victimInfo.FIN_DAMAGE_DEC
	fDamage_add = range(Parameters.COMBO_FDAMUP_LOW,Parameters.COMBO_FDAMUP_HIGH,fDamage_add)
	-- 加到伤害上
	atkValue = atkValue * ( 1000 + fDamage_add )
	multi = multi * 1000

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	if isPvp and not isRobot then
		-- 战力免伤保护计算
		-- 战力免伤保护系数=1+2.5*(0.95*攻击方战斗力总和-防守方战斗力总和)/防守方战斗力总和
		local attackFightValue = battleData:getFightValue(attackIdentity)
		local victimFightValue = battleData:getFightValue(victimIdentity)
		local fightPro = 1000 + floor((Parameters.FIGHTVALUE_PROTECT_VALUE1 * ( Parameters.FIGHTVALUE_PROTECT_VALUE2 * attackFightValue - victimFightValue * 1000 )/1000) / victimFightValue)
		fightPro = range(Parameters.COMBO_FIGHTVALUE_LOW,Parameters.COMBO_FIGHTVALUE_HIGH,fightPro)
		-- 加到伤害上
		atkValue = atkValue * fightPro
		multi = multi * 1000
	end

	-- 再乘以增伤系数
	atkValue = atkValue * attacker.multiple
	multi = multi * 1000
	
	-- -- 怪物特性增伤
	-- local ktom = victim.advanceInfo.BATTLE_UTOM_DAMAGE_ADD - victim.advanceInfo.BATTLE_UTOM_DAMAGE_DESC
	-- ktom = range(Parameters.UTOM_DAMAGE_LOW,Parameters.UTOM_DAMAGE_HIGH,ktom)
	-- atkValue = atkValue * ( 1000 + ktom )
	-- multi = multi * 1000

	-- 为了防止数值过大,取整
	atkValue = floor( atkValue / multi )
	multi = 1

	-- 守方品质压制
	local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
	atkValue = atkValue * (1000 - qualityDamDesc)
	multi = multi * 1000

	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))
	
	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = crit,
	}

	return result

end

-- 公式11---战宠技能回复效果
function FightComponent._fightFormula11(attackInfo)
	-- 恢复技能恢复值=（基础合击恢复*公式系数1%+公式系数2）*暴击判断（1.5+暴击伤害增加%,1）*randbettween(0.95.1.05)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData

	local range = FightComponent._range

	local victim = target.victim
	local inherit = target.inherit -- 是否继承
	local isPvp = battleData.isPvp
	local attackIdentity = attacker.identity
	local victimIdentity = victim.identity
	-- 取出双方的合击数据
	local attackData = battleData:getComboInfo(attackIdentity)
	local victimData = battleData:getComboInfo(victimIdentity)
	local skillLevel = attackData:getSkillLevel(attacker.id)
	local attackerInfo = attackData.baseInfo
	local atk = attackerInfo.COMBO_ATTACK
	local extraData = FightComponent._getExtraStats(skillCfg)

	-- 暴击判断
	local crit = false
	if inherit and target.crit then
		-- 之前就暴击了，这里也要暴击
		crit = true
	else
		-- 暴击率=（攻击方集体暴击率*0.25）/2
		local rate = (floor(attackerInfo.COMBO_BASE_CRIT_RATE * 0.25)) / 2
		rate = range(Parameters.COMBO_HEAL_CRIT_RATE_LOW,Parameters.COMBO_HEAL_CRIT_RATE_HIGH,rate)
		rate = rate + extraData[BattleAttr["COMBO_CRIT_RATE"]]/2
		crit = battleField:bingo(rate)
	end

	local atkValue = atk * attackInfo.formulaValue1 + attackInfo.formulaValue2 * 1000
	local multi = 1000

	-- 如果暴击了
	if crit then
		-- 计算暴击强度 暴击伤害强度=（攻击方集体暴击强度*0.25）/2
		local critValue = (floor(attackerInfo.COMBO_BASE_CRIT_DAMAGE_ADD * 0.25)) / 2
		critValue = range(Parameters.COMBO_HEAL_CRIT_LOW,Parameters.COMBO_HEAL_CRIT_HIGH,critValue)
		critValue = critValue + extraData[BattleAttr["COMBO_CRIT_DAMAGE_ADD"]]/2
		-- 暴击计算 再乘1000倍
		-- 攻击值*（1.5+暴击伤害强度%）
		atkValue = atkValue * ( 1500 + critValue )
		multi = multi * 1000
	end

	atkValue = atkValue * 1.2
	-- 最终伤害=int(伤害*randbettween(0.95.1.05))
	atkValue = floor( atkValue * battleField:boundedrand(95, 105) / ( 100 * multi ))

	-- 保存最后的结果
	local result = {
		damage = atkValue,
		crit = crit,
	}

	return result
end

-- 公式12 -- 秒杀公式
function FightComponent._fightFormula12(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData
	local inherit = target.inherit -- 是否继承

	local range = FightComponent._range

	local victim = target.victim
	-- 只对玩家生效
	if victim.isMonster then
		return
	end
	-- 无视闪避
	-- if inherit and target.miss then
	-- 	-- 之前就miss了，此处也要miss
	-- 	return
	-- end
	local hp = victim.originInfo.INITIAL_HP
	local shield = victim.baseInfo.SHIELD
	local hpRate = victim.baseInfo.hpRate
	if hpRate <= attackInfo.formulaValue1 then
		local result = {
			damage = hp + shield,
			seckill = true,
		}
		return result
	end
end

-- 公式13 -- 增加护盾
function FightComponent._fightFormula13(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleField = attackInfo.battleField
	local battleData = attackInfo.battleData
	local range = FightComponent._range

	local attackerInfo = attacker.advanceInfo
	local atk = attackerInfo.ATTACK
	local skillLevel = attacker.originInfo["skill_level"..skillCfg.skill_type] or 0
	local atk_add = attackerInfo.ATTACK_PCT
	atk_add = range(Parameters.BASE_BUFF_PER_LOW,Parameters.BASE_BUFF_PER_HIGH,atk_add)
	atk = floor(atk*(1000 + atk_add) / 1000)
	local atkValue = atk * (attackInfo.formulaValue1 + attackInfo.formulaValueStep1 * skillLevel) + (attackInfo.formulaValue2 + attackInfo.formulaValueStep2 * skillLevel) * 1000
	atkValue = floor(atkValue/1000)
	local result = {
		damage = atkValue,
	}
	return result
end

-- 公式14 -- 按攻击目标已损失生命百分比进行百分比伤害/恢复
function FightComponent._fightFormula14(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local skillCfg = attackInfo.skillCfg
	local battleData = attackInfo.battleData
	local inherit = target.inherit -- 是否继承
	
	local victim = target.victim
	-- 只对玩家生效
	if victim.isMonster then
		return
	end
	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		return
	end
	local damage = floor(attackInfo.formulaValue1 * (victim.originInfo.INITIAL_HP - victim.baseInfo.INITIAL_HP) / 1000)
	local result = {
		damage = damage
	}
	return result
end

-- 公式15 -- 根据第一个技能作用效果（伤害/回血）进行百分比计算
function FightComponent._fightFormula15(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local victim = target.victim
	local firstResults = attackInfo.firstResults or {}
	local inherit = target.inherit -- 是否继承

	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		return
	end

	for i, result in ipairs(firstResults) do
		if result.victim.serialId == victim.serialId then
			if result.affectType == 1 or result.affectType == 2 then
				return {damage = floor(result.damage * attackInfo.formulaValue1 / 1000)}
			end
		end
	end
end

-- 公式16 -- 生命每降低X%，额外技能效果1的伤害或治疗数值Y%
function FightComponent._fightFormula16(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local victim = target.victim
	local firstResults = attackInfo.firstResults or {}
	local inherit = target.inherit -- 是否继承

	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		return
	end

	for i, result in ipairs(firstResults) do
		if result.victim.serialId == victim.serialId then
			if result.affectType == 1 or result.affectType == 2 then
				local hpRate = attacker.baseInfo.hpRate
				local multiple = math.floor((1000 - hpRate) / attackInfo.formulaValue1) * attackInfo.formulaValue2
				return {damage = floor(result.damage * multiple / 1000)}
			end
		end
	end
end

-- 公式17 --结算目标身上所有灼烧的伤害
function FightComponent._fightFormula17(attackInfo)
	local target = attackInfo.target
	local victim = target.victim
	local inherit = target.inherit -- 是否继承

	if inherit and target.miss then
		return
	end
	local buffs = victim:getBuffs()
	local totalDamage = 0
	for i, buff in ipairs(buffs) do
		if buff.buffCfg.buff_effect_type == BuffRule.EFFECT_TYPE.BURNING then
			local damage = buff.exports.damage or 0
			local buffTime = buff.buffTime
			totalDamage = totalDamage + damage * buffTime
		end
	end
	if totalDamage > 0 then
		return {damage = totalDamage, detonate = true}
	end
end

-- 公式18-斩杀 --斩杀目标，对生命低于X%的目标有效果。斩杀伤害不超过自身最大生命值的Y%
function FightComponent._fightFormula18(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local victim = target.victim
	local inherit = target.inherit -- 是否继承

	if inherit and target.miss then
		return
	end
	local hpRate = victim.baseInfo.hpRate
	if hpRate >= attackInfo.formulaValue1 then
		return
	end
	local leftHp = victim.baseInfo.INITIAL_HP
	local maxDamage = floor(attacker.originInfo.INITIAL_HP * Parameters.SECKILL_SELF_HP_LIMIT / 1000)
	if leftHp < maxDamage then
		return {damage = leftHp, seckill = true, behead = true}
	else
		return {damage = maxDamage, behead = true}
	end
end

-- 公式19-实际命中目标越小于X时，伤害越高。每减少1个，额外造成X%技能效果1的数值
function FightComponent._fightFormula19(attackInfo)
	local attacker = attackInfo.attacker
	local target = attackInfo.target
	local victim = target.victim
	local firstResults = attackInfo.firstResults or {}
	local inherit = target.inherit -- 是否继承
	local victims = attackInfo.victims or {}

	if inherit and target.miss then
		-- 之前就miss了，此处也要miss
		return
	end

	local delta = attackInfo.formulaValue1 - #victims
	if delta <= 0 then
		return
	end

	for i, result in ipairs(firstResults) do
		if result.victim.serialId == victim.serialId then
			if result.affectType == 1 or result.affectType == 2 then
				return {damage = floor(result.damage * delta * attackInfo.formulaValue2 / 1000)}
			end
		end
	end
end

-- 添加buff效果
function FightComponent._addBuff(attackData)
	local attacker = attackData.attacker
	-- 遍历每个目标
	for i , target in ipairs(attackData.victims) do
		local inherit = target.inherit
		if not (inherit and target.miss) then
			-- 判断是否触发
			if FightComponent._checkBuffBingo(attackData, target) then
				-- 处理受击者的buff和被动技能
				local victim = target.victim
				local buff = {
					buffId = attackData.buffId,
					buffTime = attackData.buffTime,
					victim = victim,
					attacker = attackData.attacker,
					buffCheck = attackData.buffCheck,
				}
				local isAdd = true
				local buffInfo = buff_info.get(attackData.buffId)
				local buffEffectType = buffInfo.buff_effect_type
				if buffEffectType == BuffRule.EFFECT_TYPE.SILENCE then
					if victim:doBuff(BuffRule.TYPE.RESIST_SILENCE) then
						isAdd = false
					end
				elseif buffEffectType == BuffRule.EFFECT_TYPE.STUN then
					if victim:doBuff(BuffRule.TYPE.RESIST_STUN) then
						isAdd = false
					end
				end
				
				if isAdd then
					attackData.fightResult:addBuff(buff)
				end
			end
		end
	end
end

-- 检查buff是否命中
function FightComponent._checkBuffBingo(attackData, target)
	local buffInfo = buff_info.get(attackData.buffId)
	-- 如果怪物免疫控制，不命中
	local victim = target.victim
	if victim.isMonster then
		if victim.knightCfg.if_immune_control == 1 and buffInfo.buff_control_type == 1 then
			return false
		end
	end
	-- 判断是否有免疫控制buff
	if buffInfo.buff_control_type == 1 then
		if victim:doBuff(BuffRule.TYPE.RESIST_CONTROL) then
			return false
		end
	end

	local rate = attackData.buffRate
	if attackData.formula == 1 then
		rate = floor (rate / #attackData.victims)
	end
	local attackerInfo = attackData.attacker.advanceInfo
	local victimInfo = target.victim.advanceInfo
	if buffInfo.buff_increase_type == 2 then
		local range = FightComponent._range
		local value = attackerInfo.DEBUFF_ACCURATY_ADD - victimInfo.DEBUFF_ACCURATY_DEC
		value = range(Parameters.BASE_DEBUFF_RATE_LOW,Parameters.BASE_DEBUFF_RATE_HIGH, value)
		rate = rate * (1 + value * 0.001)
		rate = range(Parameters.BASE_FINAL_DEBUFF_RATE_LOW,Parameters.BASE_FINAL_DEBUFF_RATE_HIGH, rate)
	end

	if buffInfo.buff_control_type == 1 then
		-- 守方品质压制，减少控制类buff命中率
		local attacker = attackData.attacker
		local victim = target.victim
		local qualityDamDesc = FightComponent._calcQualityDamDesc(attacker, victim)
		rate = rate * (1 - qualityDamDesc / 1000)
	end

	return attackData.battleField:bingo(rate)
end

-- 计算品质压制减伤
function FightComponent._calcQualityDamDesc(attacker, victim)
	-- 判断守方品质是否比攻击方高
	local attackerQuality, victimQuality = 0, 0
	if attacker.isPlayer then
		attackerQuality = attacker.skillCfg.skill_quality
	else
		local knightCfg = attacker.knightCfg
		attackerQuality = knightCfg.quality
	end
	victimQuality = victim.knightCfg.quality
	-- 从品质8开始，有品质压制
	local damageDesc = 0
	local attrNames = {"QUALITY_SUPPRESSION"}
	if victimQuality > attackerQuality then
		local attrName = attrNames[victimQuality - 7]
		if attrName then
			damageDesc = victim.advanceInfo[attrName]
			damageDesc = FightComponent._range(Parameters.QUALITY_DAMAGE_DESC_LOW, Parameters.QUALITY_DAMAGE_DESC_HIGH, damageDesc)
		end
	end
	return damageDesc
end

function FightComponent._excuteSpEffect(params)
	local knight = params.knight
	local fightResult = params.fightResult
	local rType, rValue = params.rType, params.rValue
	local spType, spData = params.spType, params.spData
	local data, list = knight:excuteSpRule(rType, rValue, spType, spData)
	fightResult:addSpEffectList(knight, list)
	return data
end

-- 检查技能效果次数（目前按技能作用的人头数限制）
function FightComponent._checkAffectLimit(attackData)
	local affectIndex = attackData.affectIndex
	local attacker = attackData.attacker
	local skillCfg = attackData.skillCfg
	if skillCfg["affect_limit_"..affectIndex] == 0 then
		return false
	end
	if not attacker.isPlayer then
		-- 目前只针对武将
		local times = attacker:getSkillAffectTimes(skillCfg.id, affectIndex)
		local limit = skillCfg["affect_limit_"..affectIndex]
		local leftTimes = limit - times
		return leftTimes <= 0
		-- if leftTimes > 0 then
		-- 	while #attackData.victims > leftTimes do
		-- 		local loser = FightComponent._random(1, #attackData.vicimts, attackData.battleField)
		-- 		remove(attackData.victims, loser)
		-- 	end
		-- else
		-- 	attackData.victims = {}
		-- end
		-- attacker:addSkillAffectTimes(skillCfg.id, affectIndex, #attackData.victims)
	end
	return false
end

-- 随机数
function FightComponent._random(min, max, battleField)

	return battleField:boundedrand(min, max)

end

-- 范围取值
function FightComponent._range(down, up, value)
	if down then
		value = max(down,value)
	end
	if up then
		value = min(up, value)
	end
	return value
end

return FightComponent