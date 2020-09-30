--[==================[

	被动触发类技能效果

	配置在passive_skill_info表里的数据

]==================]

--[[
	武将的所有被动技能触发时机分类
	1, 回合开始后
	2，自身伤害结算后
	3，有人阵亡时触发
	...
]]

local SkillSpecialRule = {}

local insert = table.insert
local passive_skill_info = loadCfg "cfg.passive_skill_info"
local BuffRule = load "core.rule.BuffRule"
local skill_special_effect_info = loadCfg "cfg.skill_special_effect_info"

SkillSpecialRule.TYPE = {
	ROUND_START = 1, --回合开始时触发
	DAMAGE = 2, -- 受到伤害时触发
	DYING = 3, -- 有（别）人死亡时触发
	SKILL = 4, -- 释放技能时触发
	HIT = 5, --受击时触发（包括被动技能）
	ACTION = 6,	--武将行动（没放出技能也算）
	SELF_DYING = 7, -- 自己死亡时
	ADD_BUFF = 8, -- 添加buff时
	WILL_DAMAGE = 9, -- 即将受到伤害（计算过程中，未进结算）
	BEFORE_SKILL = 10, -- 释放技能前（在出手前结算，仅限合并的被动）
	BUFF_REMOVE = 11, -- buff移除时
	KILL = 12, -- 击杀目标时
	ALL_DEAD = 13, -- 团灭时触发
}

SkillSpecialRule.SP_TYPE =  {
	SKILL_MULTIPLE = 1,	-- 额外技能倍率
	ENCHANT = 2,	-- 附魔
	CONVERT_HITBACK = 1001,	-- 伤害按比例反弹
	CONVERT_RECOVER = 1002,	-- 伤害按比例治疗
	HITBACK_VICTIMS = 1003,	-- 反弹伤害给敌方全体（伤害分摊计算）
}

-- 显示时机
SkillSpecialRule.SHOW_TIME = {
	ATTACK = 1,	-- 攻击时
	HIT = 2,	-- 受击时
}

-- 触发时机映射
SkillSpecialRule.triggerTime = {
	[1001] = 2,
	[1002] = 2,
	[1003] = {1,2},
	[2001] = {1,3},
	[2002] = {1,3},
	[2003] = {1,3},
	[2004] = {1,3},
	[2005] = {1,3},
	[2006] = {1,3},
	[100001] = 4,
	[100002] = 4,
	[100003] = 4,
	[100004] = 4,
	[100005] = 4,
	[100006] = 5,
	[100007] = 4,
	[100008] = 4,
	[100009] = 1,
	[100010] = 4,
	[100011] = 4,
	[100012] = 1,
	[100013] = 1,
	[100014] = 1,
	[100015] = 3,
	[100016] = 3,
	[100017] = 2,
	[100018] = 2,
	[100019] = 6,
	[100020] = 4,
	[100021] = 4,
	[100022] = 7,
	[100023] = 1,
	[100024] = 8,
	[100025] = 6,
	[100026] = 9,
	[100027] = 9,
	[100028] = 9,
	[100029] = 5,
	[100030] = 10,
	[100031] = 11,
	[100032] = 5,
	[100033] = 2,
	[100034] = 12,
	[100035] = 6,
	[100036] = 6,
	[100037] = 4,
	[100038] = 6,
	[100039] = 6,
	[100040] = 13,
}

SkillSpecialRule.disable = false

-- 全局的被动触发次数，用于那些即使重启游戏、多波战斗依旧继续计数的被动
SkillSpecialRule.globalTriggerTimes = {}

function SkillSpecialRule.addRule(rules,battleField,specialInfo,identity,knight)
	local rType = specialInfo.trigger_type
	local rule = {}
	rule.info = specialInfo
	rule.count = 0
	rule.round = 0
	rule.check = SkillSpecialRule.getCheckFunc(rType,battleField,identity,knight)
	rule.identity = identity
	rule.excute = function(self)
		-- if SkillSpecialRule.disable then
		-- 	return false
		-- end
		-- 队伍的被动
		local globalKey = "team_" .. identity .. "_" .. specialInfo.id
		if knight then
			-- 武将的被动
			globalKey = "knight_" .. knight.serialId .. "_" .. specialInfo.id
		end
		if self.info.trigger_maxtime_type == 3 then
			self.count = SkillSpecialRule.globalTriggerTimes[globalKey] or 0
		end
		local round = battleField:getRoundCount()
		if round > self.round and self.info.trigger_maxtime_type == 2 then
			self.count = 0
			self.round = round
		end
		if self.info.trigger_maxtime_type == 0 or self.count < self.info.trigger_maxtime_value then
			if battleField:bingo(self.info.trigger_prob) then
				self.count = self.count + 1
				if self.info.trigger_maxtime_type == 3 then
					SkillSpecialRule.globalTriggerTimes[globalKey] = self.count
				end
				return true
			end
		end
		return false
	end
	rule.reset = function( self )
		self.count = 0
		self.round = 0
	end

	-- 特殊技能效果
	if specialInfo.passive_skill_type == 4 then
		local spEffectInfo = skill_special_effect_info.get(specialInfo.passive_skill_value)
		rule.spEffectInfo = spEffectInfo
		rule.spEffectRule = SkillSpecialRule["_initSpEffectType"..spEffectInfo.special_skill_type]({
			knight = knight,
			identity = identity,
			spEffectInfo = spEffectInfo,
			battleField = battleField,
		})
	end
	local trigger = SkillSpecialRule.triggerTime[rType] or 0
	if type(trigger) == "table" then
		for i , v in ipairs(trigger) do
			if not rules[v] then
				rules[v] = {}
			end
			insert(rules[v],rule)
		end
	else
		if not rules[trigger] then
			rules[trigger] = {}
		end
		insert(rules[trigger],rule)
	end
end

function SkillSpecialRule.initRule(skills,identity,battleField,knight)
	
	local rules = {}
	if skills and #skills > 0 then
		for i = 1 , #skills do
			local skillId = skills[i]
			if skillId > 0 then
				local specialInfo = passive_skill_info.get(skillId)
				SkillSpecialRule.addRule(rules,battleField,specialInfo,identity,knight)
			end
		end
	end

	local skill_info = loadCfg "cfg.skill_info"
	for mode, ruleList in pairs(rules) do
		local orderMap = {}
		for i, rule in ipairs(ruleList) do
			local order = 0
			if rule.info.passive_skill_type == 1 or rule.info.passive_skill_type == 3 then
				local skillInfo = skill_info.get(rule.info.passive_skill_value)
				if skillInfo.skill_type == 7 then
					-- 时空之力技能排最前面
					order = 1
				end
			end
			orderMap[rule.info.id] = order
		end
		table.sort(ruleList, function (a, b)
			local orderA = orderMap[a.info.id] or 0
			local orderB = orderMap[b.info.id] or 0
			if orderA ~= orderB then
				return orderA > orderB
			else
				return a.info.id < b.info.id
			end
		end)
	end
	return rules

end

function SkillSpecialRule.isTrigger(specialInfo, rType)
	local trigger = SkillSpecialRule.triggerTime[specialInfo.trigger_type] or 0
	if type(trigger) == "table" then
		for i , v in ipairs(trigger) do
			if v == rType then
				return true
			end
		end
	else
		if trigger == rType then
			return true
		end
	end
	return false
end

function SkillSpecialRule.getCheckFunc(rType,battleField,identity,knight)
	local battleData = battleField:getBattleData()
	local knights = battleData:getKnights()
	local opIdentity = 3 - identity
	if rType == 1001 then
		--自身血量大于等于X%
		return function(self) 
			return math.floor(knight.baseInfo.INITIAL_HP * 1000 / knight.originInfo.INITIAL_HP) >= self.info.trigger_type_value
		end
	elseif rType == 1002 then
		--自身血量小于等于X%
		return function(self)
			return math.floor(knight.baseInfo.INITIAL_HP * 1000 / knight.originInfo.INITIAL_HP) <= self.info.trigger_type_value
		end
	elseif rType == 1003 then
		--自身血量大于等于X%（包括回合开始）
		return function(self)
			return math.floor(knight.baseInfo.INITIAL_HP * 1000 / knight.originInfo.INITIAL_HP) >= self.info.trigger_type_value
		end
	elseif rType == 2001 then
		--敌方在场人数小于等于X人
		return function(self) 
			local count = knights:getAliveKnightCount(opIdentity)
			return count <= self.info.trigger_type_value
		end
	elseif rType == 2002 then
		--己方死亡人数小于等于X人
		return function(self) 
			local count = knights:getDeathKnightCount(identity)
			return count <= self.info.trigger_type_value
		end
	elseif rType == 2003 then
		-- 己方死亡人数大于等于X人
		return function(self) 
			local count = knights:getDeathKnightCount(identity)
			return count >= self.info.trigger_type_value
		end
	elseif rType == 2004 then
		-- 己方在场人数小于等于敌方
		return function(self) 
			local count1 = knights:getAliveKnightCount(identity)
			local count2 = knights:getAliveKnightCount(opIdentity)
			return count1 <= count2
		end
	elseif rType == 2005 then
		-- 己方在场人数大于等于敌方
		return function(self) 
			local count1 = knights:getAliveKnightCount(identity)
			local count2 = knights:getAliveKnightCount(opIdentity)
			return count1 >= count2
		end
	elseif rType == 2006 then
		-- 己方前排存活时
		return function (self)
			for pos = 1, 3 do
				local knight = knights:getKnightByIdAndPos(identity, pos)
				if knight and not knight.isDead then
					return true
				end
			end
			return false
		end
	elseif rType == 100001 then
		-- 普通攻击时
		return function(self,info) 
			if not info then
				return false
			end
			return info.cfg.skill_type == 1 and info.cfg.skill_affect_type_1 == 1
		end
	elseif rType == 100002 then
		-- 怒气攻击时
		return function(self,info) 
			if not info then
				return false
			end
			return info.cfg.skill_type == 2 and info.cfg.skill_affect_type_1 == 1
		end
	elseif rType == 100003 then
		-- 任意攻击时
		return function(self,info) 
			if not info then
				return false
			end
			return info.cfg.skill_affect_type_1 == 1
		end
	elseif rType == 100004 then
		-- 任意攻击或治疗时
		return function(self,info) 
			if not info then
				return false
			end
			return true
		end
	elseif rType == 100005 then
		-- 攻击暴击时
		return function(self,info) 
			if not info then
				return false
			end
			for i , v in ipairs(info.result) do
				if v.crit then
					return true
				end
			end
			return false
		end
	elseif rType == 100006 then
		-- 受击闪避时
		return function(self,info) 
			if not info then
				return false
			end
			return info.result.miss
		end
	elseif rType == 100007 then
		-- 自身血量小于等于X%时
		return function(self) 
			return math.floor(knight.baseInfo.INITIAL_HP * 1000 / knight.originInfo.INITIAL_HP) <= self.info.trigger_type_value
		end
	elseif rType == 100008 then
		-- 自身血量大于等于X%时
		return function(self) 
			return math.floor(knight.baseInfo.INITIAL_HP * 1000 / knight.originInfo.INITIAL_HP) >= self.info.trigger_type_value
		end
	elseif rType == 100009 then
		-- 第X回合开始时
		return function(self) 
			return battleField:getRoundCount() == self.info.trigger_type_value
		end
	elseif rType == 100010 then
		-- 我方在场人数小于敌方，任意攻击或治疗时
		return function(self,info) 
			if not info then
				return false
			end
			local count1 = knights:getAliveKnightCount(identity)
			local count2 = knights:getAliveKnightCount(opIdentity)
			return count1 <= count2
		end
	elseif rType == 100011 then
		-- 我方在场人数大于敌方，任意攻击时
		return function(self,info) 
			if not info then
				return false
			end
			local count1 = knights:getAliveKnightCount(identity)
			local count2 = knights:getAliveKnightCount(opIdentity)
			return count1 >= count2 and info.cfg.skill_affect_type_1 == 1
		end
	elseif rType == 100012 then
		-- 每回合结束时
		return function(self) 
			return battleField:getRoundCount() > 1
		end
	elseif rType == 100013 then
		-- 奇数回合结束
		return function(self) 
			return battleField:getRoundCount()%2 == 0
		end
	elseif rType == 100014 then
		-- 偶数回合结束
		return function(self) 
			local count = battleField:getRoundCount()
			return count > 1 and count%2 == 1
		end
	elseif rType == 100015 then
		-- 己方武将阵亡时
		return function(self,vIdentity) 
			return vIdentity == identity
		end
	elseif rType == 100016 then
		-- 敌方武将阵亡时
		return function(self,vIdentity) 
			return vIdentity ~= identity
		end
	elseif rType == 100017 then
		-- 我方全体血量在X%以下
		return function(self,vIdentity) 
			if vIdentity == identity then
				local per = battleData:getHpPer(identity)
				return per < self.info.trigger_type_value
			end
			return false
		end
	elseif rType == 100018 then
		-- 敌方全体血量在X%以下
		return function(self,vIdentity) 
			if vIdentity == opIdentity then
				local per = battleData:getHpPer(opIdentity)
				return per < self.info.trigger_type_value
			end
			return false
		end
	elseif rType == 100019 then
		-- 己方第X个武将行动后
		return function (self)
			local actionCount = battleField:getActionCount(identity)
			if actionCount == self.info.trigger_type_value then
				return true
			end
			return false
		end
	elseif rType == 100020 then
		-- 自身怒气大于等于X且任意攻击时
		return function (self)
			return knight.baseInfo.INITIAL_ANGER >= self.info.trigger_type_value
		end
	elseif rType == 100021 then
		-- 自身怒气小于X且任意攻击时
		return function (self)
			return knight.baseInfo.INITIAL_ANGER < self.info.trigger_type_value
		end
	elseif rType == 100022 then
		-- 自身死亡时，检查被动的埋点那里判断
		return function (self)
			return true
		end
	elseif rType == 100023 then
		-- 第X回合结束
		return function(self)
			return battleField:getRoundCount() - 1 == self.info.trigger_type_value
		end
	elseif rType == 100024 then
		-- 己方被控制时
		return function (self, buffs)
			local buff_info = loadCfg "cfg.buff_info"
			for i, buff in ipairs(buffs) do
				local buffCfg = buff_info.get(buff.buffId)
				local victim = buff.victim
				if victim.identity == identity and buffCfg.buff_type == BuffRule.TYPE.ACT_LIMIT then
					return true
				end
			end
			return false
		end
	elseif rType == 100025 then
		-- 每个单位行动时
		return function (self)
			return true
		end
	elseif rType == 100026 then
		-- 即将受到伤害时（结算之前）
		return function (self)
			return true
		end
	elseif rType == 100027 then
		-- 即将受到物理伤害时
		return function (self, data)
			local attackData = data.attackData
			local attacker = attackData.attacker
			if not attacker.isPlayer then
				if attacker.knightCfg.attack_type == 1 then
					return true
				end
			end
			return false
		end
	elseif rType == 100028 then
		-- 即将受到法术伤害时
		return function (self, data)
			local attackData = data.attackData
			local attacker = attackData.attacker
			if not attacker.isPlayer then
				if attacker.knightCfg.attack_type == 2 then
					return true
				end
			end
			return false
		end
	elseif rType == 100029 then
		-- 受到被自己嘲讽单位攻击时
		return function(self,info) 
			if not info then
				return false
			end
			if not info.attacker then
				return false
			end
			local attacker = info.attacker
			if attacker.isPlayer then
				return false
			end
			if battleField:isExtraAction() then
				-- 额外回合不触发
				return false
			end
			if info.isPassive then
				return false
			end
			local result = info.result
			if result.affectType ~= 1 then
				return false
			end
			local tauntKnight = attacker:doBuff(BuffRule.TYPE.TAUNT)
			if tauntKnight then
				if tauntKnight.serialId == knight.serialId then
					return true
				end
			end
			return false
		end
	elseif rType == 100030 then
		-- 即将攻击时
		return function (self)
			return true
		end
	elseif rType == 100031 then
		-- 己方指定buff消失时
		return function (self, buffs)
			for i, buff in ipairs(buffs) do
				local victim = buff.victim
				if victim.identity == identity and buff.buffCfg.id == self.info.trigger_type_value then
					return true
				end
			end
			return false
		end
	elseif rType == 100032 then
		-- 受到技能效果1伤害时触发
		return function (self, info)
			local result = info.result
			if result.affectType == 1 and result.damage > 0 then
				-- 屏蔽分摊伤害
				if not result.hpLink then
					return true
				end
			end
			return false
		end
	elseif rType == 100033 then
		-- 自身受到单次伤害大于等于最大生命值百分比X时
		return function (self, damage)
			local damage = damage or 0
			return damage >= math.floor(knight.originInfo.INITIAL_HP * self.info.trigger_type_value / 1000)
		end
	elseif rType == 100034 then
		-- 指定技能击杀目标时
		return function (self, params)
			local attackId = params.attackId
			local attacker = params.attacker
			-- 也有可能是变身id，不过变身不会造成击杀
			return attackId == self.info.trigger_type_value and attacker.serialId == knight.serialId
		end
	elseif rType == 100035 then
		-- 我方武将行动时（武将）
		return function (self, params)
			return params.identity == identity
		end
	elseif rType == 100036 then
		-- 敌方武将行动时（武将）
		return function (self, params)
			return params.identity == opIdentity
		end
	elseif rType == 100037 then
		-- 释放必杀技时
		return function (self, info)
			if not info then
				return false
			end
			return info.cfg.skill_type == 12
		end
	elseif rType == 100038 then
		-- 前两回合，我方武将行动时，且我方有武将处于控制状态
		return function (self, params)
			if params.identity ~= identity then
				return false
			end
			local round = battleField:getRoundCount()
			if round > 2 then
				return false
			end
			local knightList = battleField:getBattleData():getKnightList(identity)
			for i, knight in ipairs(knightList) do
				local buffs = knight:getBuffs()
				for j, buff in ipairs(buffs) do
					if buff.buffCfg.buff_control_type == 1 then
						return true
					end
				end
			end
			return false
		end
	elseif rType == 100039 then
		-- 自己行动时
		return function (self, params)
			if battleField:isExtraAction() then
				-- 额外回合不触发
				return false
			end
			local attacker = params.attacker
			if not attacker then
				return false
			end
			return knight.serialId == attacker.serialId
		end
	elseif rType == 100040 then
		-- 自己最后一个死亡（死亡后团灭）
		return function (self)
			return true
		end
	else
		return function( self )
			return false
		end
	end
end

-- 基础伤害（治疗）提高X%
function SkillSpecialRule._initSpEffectType1(spEffect)
	local spEffectInfo = spEffect.spEffectInfo
	local multiple = spEffectInfo.special_skill_value_1
	return function (data)
		data = data + multiple
		return data
	end
end

-- 附魔
function SkillSpecialRule._initSpEffectType2(spEffect)
	local spEffectInfo = spEffect.spEffectInfo
	local skill_enchant_info = loadCfg "cfg.skill_enchant_info"
	local enchantInfo = skill_enchant_info.get(spEffectInfo.special_skill_value_1)
	return function (data)
		insert(data, enchantInfo)
		return data
	end
end

-- 伤害按比例反弹
function SkillSpecialRule._initSpEffectType1001(spEffect)
	local spEffectInfo = spEffect.spEffectInfo
	-- 反弹比例
	local value1 = spEffectInfo.special_skill_value_1
	return function (data)
		local hitbackList = data.hitbackList
		local result = data.result
		local hitbackValue = math.floor(result.damage * value1 / 1000)
		local attacker = data.attacker
		insert(hitbackList, {
			affectType = 1,
			damage = hitbackValue,
			victim = attacker,
			attacker = spEffect.knight,
		})
		return data
	end
end

-- 伤害按比例治疗
function SkillSpecialRule._initSpEffectType1002(spEffect)
	local spEffectInfo = spEffect.spEffectInfo
	-- 治疗比例
	local value1 = spEffectInfo.special_skill_value_1
	return function (data)
		local recoverList = data.recoverList
		local result = data.result
		local recoverValue = math.floor(result.damage * value1 / 1000)
		insert(recoverList, {
			affectType = 2,
			damage = recoverValue,
			victim = spEffect.knight,
			attacker = spEffect.knight,
		})
		return data
	end
end

-- 伤害反弹给敌方所有存活单位
function SkillSpecialRule._initSpEffectType1003(spEffect)
	local spEffectInfo = spEffect.spEffectInfo
	-- 反弹比例
	local value1 = spEffectInfo.special_skill_value_1
	local battleField = spEffect.battleField
	local knight = spEffect.knight
	local maxDamage = math.floor(spEffectInfo.special_skill_value_2 * knight.originInfo.INITIAL_HP / 1000)
	local identity = knight.identity
	return function (data)
		local list = data.hitbackList
		local knightList = battleField:getBattleData():getKnightList(3 - identity)
		local knightNum = #knightList
		local result = data.result
		local totalDamage = math.floor(result.damage * value1 / 1000)
		totalDamage = math.min(totalDamage, maxDamage)
		for i, knight in ipairs(knightList) do
			insert(list, {
				victim = knight,
				damage = math.floor(totalDamage / knightNum),
			})
		end
		return data
	end
end

return SkillSpecialRule