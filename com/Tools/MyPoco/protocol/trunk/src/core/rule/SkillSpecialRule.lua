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

SkillSpecialRule.TYPE = {
	ROUND_START = 1, --回合开始时触发
	DAMAGE = 2, -- 受到伤害时触发
	DYING = 3, -- 有人死亡时触发
	SKILL = 4, -- 释放技能时触发
	HIT = 5, --受击时触发
}

-- 触发时机映射
SkillSpecialRule.triggerTime = {
	[1001] = 2,
	[1002] = 2,
	[2001] = {1,3},
	[2002] = {1,3},
	[2003] = {1,3},
	[2004] = {1,3},
	[2005] = {1,3},
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
}

SkillSpecialRule.disable = false

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
		local round = battleField:getRoundCount()
		if round > self.round and self.info.trigger_maxtime_type == 2 then
			self.count = 0
			self.round = round
		end
		if self.info.trigger_maxtime_type == 0 or self.count < self.info.trigger_maxtime_value then
			if battleField:bingo(self.info.trigger_prob) then
				self.count = self.count + 1
				return true
			end
		end
		return false
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

	return rules

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
	else
		return function( self )
			return false
		end
	end
end

return SkillSpecialRule