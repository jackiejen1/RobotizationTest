
local table = table
local insert = table.insert

local math = math
local floor = math.floor

local FightResult = {}
local SkillSpecialRule = load "core.rule.SkillSpecialRule"
local BuffRule = load "core.rule.BuffRule"

-- 创建一个伤害结果实例
function FightResult.createFightResult(attacker, attackType, attackId, battleField)

	-- 最后伤害结果
	local fightResult = {
		-- 攻击者
		attacker = attacker,
		-- 1表示是武将出手，2表示是玩家释放技能,3表示变身召唤，4表示宠物技能
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
	}

	fightResult.addAttackInfo = function(self, info)
		self.attackInfos = {}
		for i , value in ipairs(info) do
			local vinfo = {}
			vinfo.victim = value.victim
			vinfo.effect_type = value.affectType
			vinfo.effect_value = value.damage
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
			insert(self.attackInfos,vinfo)
		end

		-- self.addInfos = {}
		-- if info.suckHp and info.suckHp > 0 then
		-- 	insert(self.addInfos,{effect_type=2,effect_value=info.suckHp,add_effects={{add_type=4}}})
		-- end
		-- if info.reDamage and info.reDamage > 0 then
		-- 	insert(self.addInfos,{effect_type=1,effect_value=info.reDamage,add_effects={{add_type=5}}})
		-- end

		self.delBuffs = info.removeList or {}
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
			FightResult.updateSkillEffect(self,self.attacker,self.attacker, info,battleField)
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
        if is_invincible and effectType == 1 then
            effectValue = 0
        end
        -- 判断锁血
		if victim.isLock then
			-- 已锁血，只计算伤害,不会实际扣血
			victim:excuteSpRule(SkillSpecialRule.TYPE.DAMAGE)
			if effectType == 1 then
				battleField:addRecord(attacker,effectValue)
			end
			return
		end
		local value = effectType == 1 and effectValue * -1 or effectValue
		local hpBefore = victim.baseInfo.INITIAL_HP
		local hp = victim.baseInfo.INITIAL_HP + value
		local maxHp = victim.originInfo.INITIAL_HP
		if hp <= 0 then
			victim.isDead = true
			victim.baseInfo.INITIAL_HP = 0

			local knights = battleField:getBattleData():getKnights()
			for i, knight in knights:ipairs(identity) do
				if not knight.isDead then
					knight:excuteSpRule(SkillSpecialRule.TYPE.DYING,victim.identity)
				end
			end
			battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.DYING,victim.identity)
		elseif hp > maxHp then
			-- effect.effect_value = effect.effect_value - hp + maxHp
			victim.baseInfo.INITIAL_HP = maxHp
		else
			victim.baseInfo.INITIAL_HP = hp
		end
		if not victim.isDead then
			local hpAfter = victim.baseInfo.INITIAL_HP
			victim:excuteSpRule(SkillSpecialRule.TYPE.DAMAGE)
		end
		battleField:getBattleData():excuteSpRule(SkillSpecialRule.TYPE.DAMAGE,victim.identity)
		if effectType == 1 then
			local hpAfter = victim.baseInfo.INITIAL_HP
			battleField:addRecord(attacker,hpBefore-hpAfter)
		end
	-- 扣怒气/加怒气
	elseif effectType == 3 or effectType == 4 then
		local value = effectType == 3 and effectValue * -1 or effectValue
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
		for i = #buffList , 1 , -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_increase_type == clearType and buffCfg.not_clear == 0 then
				table.insert(self.delBuffs,#self.delBuffs+1,buff)
				table.remove(buffList,i)
				effected = true
			end
		end
		effect.buffClear = effect
	-- 吸怒气
	elseif effectType == 9 then
		-- 已拆分成 扣怒气/加怒气
	end
end

return FightResult