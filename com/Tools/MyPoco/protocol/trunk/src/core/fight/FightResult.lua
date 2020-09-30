
local table = table
local insert = table.insert

local math = math
local floor = math.floor

local FightResult = {}
local SkillSpecialRule = load "core.rule.SkillSpecialRule"
local EnergyRule = load "core.rule.EnergyRule"
local BuffRule = load "core.rule.BuffRule"
local BattleRecord = load "core.BattleRecord"
local Parameters = load "core.Parameters"

-- 创建一个伤害结果实例
function FightResult.createFightResult(attacker, attackType, attackId, battleField, isPassive)

	-- 最后伤害结果
	local fightResult = {
		-- 攻击者
		attacker = attacker,
		-- 1表示是武将出手，2表示是玩家释放技能,3表示变身召唤，4表示宠物技能, 5表示时空之力技能， 6是技能召唤物技能
		attackType = attackType,
		-- attackid表示所属的“技能”id，如果是1类型的，就是技能id，如果是2类型的，就是玩家释放技能的id
		attackId = attackId,
		-- 攻击信息
		attackInfos = {},
		-- 攻击者的数据变化
		attackEffectBefore = {},
		attackEffectAfter = {},
		-- 添加的buff
		addBuffs = {},
		-- 删除的buff
		delBuffs = {},
		-- -- 附加信息
		-- addInfos = {},
		-- 生成武将,用于变身召唤
		knights = {},
		-- 技能召唤
		skillSummons = {},
		-- 移除的召唤物
		delSkillSummon = {},
		-- 复活武将
		reborns = {},
		-- 特殊被动效果
		spEffects = {},
		-- 场景
		addScenes = {},
	}

	fightResult.addAttackInfo = function(self, info)
		self.attackInfos = {}
		for i , value in ipairs(info) do
			local vinfo = {}
			vinfo.victim = value.victim
			vinfo.effect_type = value.affectType
			vinfo.effect_value = value.damage
			vinfo.add_value = value.addDamage
			vinfo.attacker = value.attacker	-- 伤害统计的attacker
			-- local add_effects = {}
			-- if value.crit then
				-- 	insert(add_effects,{add_type=1})
				-- end
				-- if value.miss then
					-- 	insert(add_effects,{add_type=2})
					-- end
					-- if value.block then
						-- 	insert(add_effects,{add_type=3})
						-- end
						-- effect.add_effects = add_effects
			vinfo.crit = value.crit
			vinfo.miss = value.miss
			vinfo.block = value.block
			vinfo.invincible = value.invincible
			vinfo.suckAnger = value.suckAnger
			vinfo.seckill = value.seckill
			vinfo.hpLink = value.hpLink
			vinfo.behead = value.behead
			vinfo.detonate = value.detonate
			insert(self.attackInfos,vinfo)
		end

		-- self.addInfos = {}
		-- if info.suckHp and info.suckHp > 0 then
		-- 	insert(self.addInfos,{effect_type=2,effect_value=info.suckHp,add_effects={{add_type=4}}})
		-- end
		-- if info.reDamage and info.reDamage > 0 then
		-- 	insert(self.addInfos,{effect_type=1,effect_value=info.reDamage,add_effects={{add_type=5}}})
		-- end

		self.delBuffs = {}
		self.delSkillSummon = info.delSkillSummon or {}
	end

	fightResult.addAttackEffect = function(self, effect, before)
		local target = before and self.attackEffectBefore or self.attackEffectAfter
		insert(target, effect)
	end

	-- 获取当前战斗后的总伤害（分伤害类型）
	fightResult.getTotalDamage = function(self, damageType, needDamageType)
		local totalDamage = 0
		if not needDamageType or damageType == needDamageType then
			for victim, infos in self.attackInfos do
				totalDamage = totalDamage + infos.totalDamage
			end
		end
		return totalDamage
	end

	fightResult.update = function(self)
		-- 根据技能效果应用数据
		local attackInfos = self.attackInfos
		for i, info in ipairs(attackInfos) do
			FightResult.updateSkillEffect(self,self.attacker,info.victim, info,battleField)
		end
		local effectBefore = self.attackEffectBefore
		for i, info in ipairs(effectBefore) do
			FightResult.updateSkillEffect(self,self.attacker,self.attacker, info,battleField)
		end
		local effectAfter = self.attackEffectAfter
		for i, info in ipairs(effectAfter) do
			local attacker = info.attacker or self.attacker
			local victim = info.victim or self.attacker
			FightResult.updateSkillEffect(self,attacker,victim,info,battleField)
		end
		-- 添加buff回合计数（原先在FightComponent计算，直接移除了失效的buff，导致此处结算时无法获取到需要的buff）
		if not self.attacker.isPlayer then
			local removeList = {}
			if not isPassive then
				removeList = self.attacker:doBuffRound(BuffRule.ROUND.AFTER)
			end
			for i, buff in ipairs(removeList) do
				self:delBuff(buff)
			end
		end

		-- local addInfos = self.addInfos
		-- for i, info in ipairs(addInfos) do
		-- 	updateSkillEffect(self.attacker, info)
		-- end
		-- 添加buff
		local buff_info = loadCfg "cfg.buff_info"
		for i, buff in ipairs(self.addBuffs) do
			local buffCfg = buff_info.get(buff.buffId)
			local victim = buff.victim
			-- 判断是否是变身buff
			if buffCfg.buff_type == BuffRule.TYPE.TRANSFORM then
				-- 直接清除旧的变身buff
				victim:delBuffByType(BuffRule.TYPE.TRANSFORM)
			end
			local serialId = victim:addBuff(buff.buffId, buff.buffTime, buff.attacker,buff.buffCheck)
			buff.serialId = serialId
		end
		if #self.addBuffs > 0 then
			battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.ADD_BUFF, self.addBuffs)
		end
		if #self.delBuffs > 0 then
			battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.BUFF_REMOVE, self.delBuffs)
		end

		if self.attackType == 2 then
			-- 如果是玩家合击，合击技要进入cd
			local battleData = battleField:getBattleData()
			local cd = battleData:useComboSkill(self.attacker.id,self.attacker.identity)
		end
	end

	fightResult.addBuff = function(self, buffInfo)
		insert(self.addBuffs, buffInfo)
	end

	fightResult.delBuff = function(self, buffInfo)
		insert(self.delBuffs, buffInfo)
	end

	-- 处理变身
	fightResult.transform = function(self, skillInfo)
		-- 改变原武将属性
		attacker:transform(skillInfo)
		self.knights[1] = {
			knight_id = attacker.originInfo.id,
			max_hp = attacker.originInfo.INITIAL_HP,
			knight_hp = attacker.baseInfo.INITIAL_HP,
			pos = attacker.originInfo.pos,
			identity = attacker.identity,
			anger = attacker.baseInfo.INITIAL_ANGER,
			baseData = attacker.baseData,
		}
	end

	-- 处理召唤
	fightResult.callFriends = function(self, skillInfo, posList)
		if #posList <= 0 then
			return
		end
		
		for i = 1 , #posList do
			local pos = posList[i]
			local knight = clone(attacker)
			knight:transform(skillInfo)
			knight.originInfo.pos = pos
			local identity = knight.identity
			battleField._battleData:setKnightData(knight, identity)

			self.knights[i] = {
				knight_id = knight.originInfo.id,
				max_hp = knight.originInfo.INITIAL_HP,
				knight_hp = knight.baseInfo.INITIAL_HP,
				pos = knight.originInfo.pos,
				identity = knight.identity,
				anger = knight.baseInfo.INITIAL_ANGER,
			}
		end
	end

	fightResult.addSpEffectList = function (self, knight, spCfgIds)
		for i, id in ipairs(spCfgIds) do
			insert(self.spEffects, {
				knight_serial_id = knight.serialId,
				sp_effect_id = id,
			})
		end
	end

	return fightResult

end


-- 根据伤害类型更新武将数据
function FightResult.updateSkillEffect(self,attacker,victim,effect,battleField)
	local effectType = effect.effect_type
    local effectValue = effect.effect_value
	-- 扣血/加血
    if effectType == 1 or effectType == 2 then
        -- 先判断无敌
        local is_invincible = victim:doBuff(BuffRule.TYPE.INVINCIBLE)
		if is_invincible and effectType == 1 and not effect.seckill then
			effect.effect_value = 0
            effectValue = 0
		end
		if not is_invincible and effectType == 1 and not effect.seckill then
			-- 护盾buff，吸收伤害算统计里
			effect.effect_value = victim:doBuff(BuffRule.TYPE.SHIELD, effect.effect_value)
			local delta = effectValue - effect.effect_value
			if delta > 0 then
				-- 出现了诅咒分摊伤害，计算来源要算在诅咒释放者身上
				local recordAttacker = attacker
				if effect.attacker then
					recordAttacker = effect.attacker
				end
				battleField:addRecord(recordAttacker, BattleRecord.TYPE_DAM, delta)
				battleField:addRecord(victim, BattleRecord.TYPE_TAKE_DAM, delta)
				effect.add_effects = effect.add_effects or {}
				table.insert(effect.add_effects, {add_type = 13, add_value = delta})
			end
			effectValue = effect.effect_value
		end
		victim:checkBuffDisappear(BuffRule.DISAPPEAR.DAMAGE, effectValue)
        -- 判断锁血
		if victim.isLock or victim.isGhost then
			-- 已锁血，只计算伤害,不会实际扣血
			if not victim.isDead then
				victim:excuteSpRule(SkillSpecialRule.TYPE.DAMAGE)
			end
			if effectType == 1 then
				-- 出现了诅咒分摊伤害，计算来源要算在诅咒释放者身上
				local recordAttacker = attacker
				if effect.attacker then
					recordAttacker = effect.attacker
				end
				battleField:addRecord(recordAttacker, BattleRecord.TYPE_DAM, effectValue)
				battleField:addRecord(victim, BattleRecord.TYPE_TAKE_DAM, effectValue)
			elseif effectType == 2 then
				battleField:addRecord(attacker, BattleRecord.TYPE_RECOVER, effectValue)
			end
			return
		end

		local hpBefore = victim.baseInfo.INITIAL_HP
		local shieldBefore = victim.baseInfo.SHIELD
		-- 秒杀（使受击者一定死亡，无视无敌、傀儡术）
		if effect.seckill then
			-- 这里直接血量置0，防止秒杀公式计算出的伤害因为中间发生血量增长、护盾增加等原因没有杀死。
			victim.baseInfo.INITIAL_HP = 0
		else
			local value = effectType == 1 and effectValue * -1 or effectValue
			-- local hp = victim.baseInfo.INITIAL_HP + value
			-- local maxHp = victim.originInfo.INITIAL_HP
			victim:updateHp(value)
			-- 傀儡术，抵抗死亡
			if victim.baseInfo.INITIAL_HP <= 0 then
				if victim:doBuff(BuffRule.TYPE.RESIST_DEAD, false) then
					victim.baseInfo.INITIAL_HP = 1
					local shield = victim.baseInfo.SHIELD
					effectValue = (hpBefore - 1) + (shieldBefore - shield)
					effect.effect_value = effectValue
				end
			end
		end
		if victim.baseInfo.INITIAL_HP <= 0 then
			-- victim.isDead = true
			victim:doDead()
			-- victim.baseInfo.INITIAL_HP = 0

			if hpBefore > 0 then
				local knights = battleField:getBattleData():getAllKnightList()
				for i, knight in ipairs(knights) do
					if not knight.isDead then
						knight:excuteSpRule(SkillSpecialRule.TYPE.DYING,victim.identity)
						knight:checkBuffDisappear(BuffRule.DISAPPEAR.DEAD, victim.serialId)
					elseif knight.serialId == victim.serialId then
						knight:excuteSpRule(SkillSpecialRule.TYPE.SELF_DYING)
					end
				end
				battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.DYING,victim.identity)
				if not attacker.isPlayer then
					attacker:excuteSpRule(SkillSpecialRule.TYPE.KILL, {attackId = self.attackId, attacker = attacker})
				end
			end
		-- elseif hp > maxHp then
		-- 	-- effect.effect_value = effect.effect_value - hp + maxHp
		-- 	victim.baseInfo.INITIAL_HP = maxHp
		-- else
		-- 	victim.baseInfo.INITIAL_HP = hp
		end
		if not victim.isDead then
			local hpAfter = victim.baseInfo.INITIAL_HP
			victim:excuteSpRule(SkillSpecialRule.TYPE.DAMAGE, effectValue)

			if victim.baseInfo.SHIELD <= 0 then
				victim:checkBuffDisappear(BuffRule.DISAPPEAR.SHIELD)
			end
		end
		battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.DAMAGE,victim.identity)
		if effectType == 1 then
			local hpAfter = victim.baseInfo.INITIAL_HP
			-- 出现了诅咒分摊伤害，计算来源要算在诅咒释放者身上
			local recordAttacker = attacker
			if effect.attacker then
				recordAttacker = effect.attacker
			end
			battleField:addRecord(recordAttacker, BattleRecord.TYPE_DAM, hpBefore-hpAfter)
			battleField:addRecord(victim, BattleRecord.TYPE_TAKE_DAM, hpBefore-hpAfter)
		elseif effectType == 2 then
			local hpAfter = victim.baseInfo.INITIAL_HP
			battleField:addRecord(attacker, BattleRecord.TYPE_RECOVER, hpAfter - hpBefore)
		end
	-- 扣怒气/加怒气
	elseif effectType == 3 or effectType == 4 then
		local value = effectType == 3 and effectValue * -1 or effectValue
		if value > 0 then
			-- 无法回复怒气
			if victim:doBuff(BuffRule.TYPE.DISABLE_RECOVER_ANGER) then
				effect.effect_value = 0
				return
			end
		end
		local anger = victim.baseInfo.INITIAL_ANGER + value
		if anger < 0 then
			victim.baseInfo.INITIAL_ANGER = 0
		else
			victim.baseInfo.INITIAL_ANGER = anger
		end
	-- 扣合击值/加合击值
	elseif effectType == 5 or effectType == 6 then
		local value = effectType == 5 and effectValue * -1 or effectValue
		local battleData = battleField:getBattleData()
		battleData:updateComboValue(value,victim.identity)
	-- 消除减益buff/消除增益buff
	elseif effectType == 7 or effectType == 8 then
		local buffList = victim.buffs
		local clearType = effectType == 7 and 2 or 1
		local effected = false
		local hasLimit = effectValue > 0
		local leftNum = effectValue
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_increase_type == clearType and buffCfg.not_clear == 0 then
				-- table.insert(self.delBuffs,#self.delBuffs+1,buff)
				-- table.remove(buffList,i)
				buff.isDone = true
				effected = true
				if hasLimit then
					leftNum = leftNum - 1
					if leftNum == 0 then
						break
					end
				end
			end
		end
		effect.buffClear = effected
	-- 吸怒气
	elseif effectType == 9 then
		-- 已拆分成 扣怒气/加怒气
	elseif effectType == 10 then
		-- 破冰
		-- 伤害已经拆分，这里只清除敌方冰冻buff
		local buffList = victim.buffs
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_effect_type == BuffRule.EFFECT_TYPE.FROZEN then
				buff.isDone = true
			end
		end
	elseif effectType == 11 then
		-- 灼烧回合数+X
		local buffList = victim.buffs
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_effect_type == BuffRule.EFFECT_TYPE.BURNING then
				buff:addBuffTime(effectValue)
			end
		end
	-- 减必杀能量/加必杀能量
	elseif effectType == 12 or effectType == 13 then
		local value = effectType == 12 and effectValue * -1 or effectValue
		local energy = victim.baseInfo.INITIAL_ENERGY + value
		if energy < 0 then
			energy = 0
		end
		if energy > Parameters.KILLING_VALUE_MAX then
			energy = Parameters.KILLING_VALUE_MAX
		end
		victim.baseInfo.INITIAL_ENERGY = energy
		-- 召唤无血条战斗单位
	elseif effectType == 14 then
		local num = effect.add_value or 0
		if num > 0 then
			local summonId = effectValue
			if summonId > 0 then
				for i = 1, num do
					local skillSummon = battleField:getBattleData():addSkillSummon(summonId, attacker)
					if skillSummon then
						insert(self.skillSummons, skillSummon)
					end
				end
			end
		end
	-- 加护盾
	elseif effectType == 15 then
		victim.baseInfo.SHIELD = victim.baseInfo.SHIELD + effectValue
	-- 加标记/减标记
	elseif effectType == 16 or effectType == 17 then
		if effectType == 16 then
			local markInfo = loadCfg("cfg.skill_mark_info").get(effectValue)
			local preLevel = victim:getMarkLevel(markInfo.type)
			-- TODO 添加印记后可能层数因为释放技能而降低，现在直接把当前效果转一下
			victim:addMark(effectValue,effect.add_value)
			local curLevel = victim:getMarkLevel(markInfo.type)
			local delta = curLevel - preLevel

			if delta > 0 then
				effect.add_value = delta
			else
				effectType = 17
				effectValue = markInfo.type
				effect.effect_type = effectType
				effect.effect_value = effectValue
				effect.add_value = -delta
			end
		else
			victim:removeMark(effectValue,effect.add_value)
		end
	-- 复活
	elseif effectType == 18 then
		if not victim.isDead then
			return
		end
		-- 判断复活的位置上是否有召唤出来的武将
		local knight = battleField:getBattleData():getKnightData(victim.serialId)
		if not knight.isDead then
			return
		end
		-- 记录复活的武将，用于一个特殊的技能作用范围 131, 132
		battleField:getBattleData():addRebornKnight(victim)

		victim.isDead = false
		-- 按最大生命百分比恢复生命
		victim.baseInfo.INITIAL_HP = floor(victim.originInfo.INITIAL_HP * effectValue / 1000)
		-- 清空buff
		victim:clearBuff()
		-- 清空额外的被动
		victim:clearPassiveSkill()
		-- 清空buff附加的属性
		victim:clearAdvanceInfo()
		insert(self.reborns, {
			serial_id = victim.serialId,
			knight_hp = victim.baseInfo.INITIAL_HP,
		})
	-- 19-清除护盾
	elseif effectType == 19 then
		victim.baseInfo.SHIELD = 0
	-- 20-获得额外行动回合
	elseif effectType == 20 then
		local disableComboRecover = effectValue == 1
		local skillId = effect.add_value
		battleField:addExtraAction({knight = victim, disableComboRecover = disableComboRecover, skillId = skillId})
	-- 21-灼烧引爆，提前结算目标的灼烧效果，伤害值=灼烧单次伤害*回合数
	elseif effectType == 21 then
		local buffList = victim.buffs
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_effect_type == BuffRule.EFFECT_TYPE.BURNING then
				buff.isDone = true
			end
		end
	-- 22-灼烧传染 将目标身上的灼烧复制一份附加给周围单位
	elseif effectType == 22 then
		-- 目标身上的灼烧buff
		local dots = {}
		local buffs = victim:getBuffs()
		for i, buff in ipairs(buffs) do
			if buff.buffCfg.buff_type == BuffRule.TYPE.DHOT and buff.buffCfg.buff_effect_type == BuffRule.EFFECT_TYPE.BURNING then
				insert(dots, buff)
			end
		end
		if not next(dots) then return end
		
		-- 周围单位
		local victimTargets = {}
		local knights = battleField:getBattleData():getKnights()
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
			local target = knights:getKnightByIdAndPos(victim.identity, list[i])
			if target and target:isValid() then
				insert(victimTargets, target)
			end
		end
		for i, dot in ipairs(dots) do
			for j, knight in ipairs(victimTargets) do
				local buff = {
					buffId = dot.buffCfg.id,
					buffTime = dot.buffTime,
					victim = knight,
					attacker = attacker,
					buffCheck = dot.buffCheckSkill,
				}
				self:addBuff(buff)
			end
		end
	-- 23-改变战场环境
	elseif effectType == 23 then
		local sceneId = effectValue
		local duration = effect.add_value or 0
		if sceneId > 0 and duration > 0 then
			local serialId = battleField:getBattleData():addScene(sceneId, duration, attacker)
			insert(self.addScenes, {
				serialId = serialId,
				sceneId = sceneId,
				attacker = attacker,
			})
		end
	-- 空伤害、空治疗（受击纯表现用，没有逻辑）
	elseif effectType == 24 or effectType == 25 then

	-- 请求重启战斗。如果本次出手后发起者一方全部阵亡，就触发重启
	elseif effectType == 26 then
		battleField:addRestartInfo(attacker.identity, attacker.serialId, effectValue)
	-- 清除控制效果
	elseif effectType == 27 then
		local buffList = victim.buffs
		local effected = false
		local hasLimit = effectValue > 0
		local leftNum = effectValue
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			-- 无视不可清除逻辑
			if buffCfg.buff_control_type == 1 then
				buff.isDone = true
				effected = true
				if hasLimit then
					leftNum = leftNum - 1
					if leftNum == 0 then
						break
					end
				end
			end
		end
		effect.buffClear = effected
	end
end

return FightResult