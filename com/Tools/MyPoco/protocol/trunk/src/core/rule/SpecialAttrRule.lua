--[==================[

	特殊属性效果
	
	定义在"属性类型.txt"文本中一些有在战斗中有特殊效果的属性

]==================]

local SpecialAttrRule = {}

function SpecialAttrRule.initRule(knight)

	local rules = {}

	-- 35-攻击吸血%
	if knight.atkAbsort then
		
		SpecialAttrRule._initAtkAbsort(knight, rules)
	
	-- 36-反弹物理伤害%
	elseif knight.reboundPhyDam then
		
		SpecialAttrRule._initReboundPhyDam(knight, rules)
	
	-- 37-反弹法术伤害%
	elseif knight.reboundMagDam then
		
		SpecialAttrRule._initReboundMagDam(knight, rules)
	
	-- 39-异常状态抗性%
	elseif knight.resistException then
		
		SpecialAttrRule._initResistException(knight, rules)
	
	-- 40-怒气降低抗性%
	elseif knight.resistAngerDown then
		
		SpecialAttrRule._initResistAngerDown(knight, rules)
	
	-- 43-每次行动概率恢复1点怒气%
	elseif knight.recoverAnger then
		
		SpecialAttrRule._initRecoverAnger(knight, rules)
	
	-- 44-攻击无视防御%
	elseif knight.ignoreDef then
		
		SpecialAttrRule._initIgnoreDef(knight, rules)
	
	-- 45-初始合击值
	elseif knight.comboValue then
		
		SpecialAttrRule._initComboValue(knight, rules)
	
	-- 46-合击值上限
	elseif knight.comboValueUpLimit then
		
		SpecialAttrRule._initComboValueUpLimit(knight, rules)
	
	-- 47-合击值回复
	elseif knight.comboValueRecover then
		
		SpecialAttrRule._initComboValueRecover(knight, rules)
	
	-- 48-受到伤害时概率恢复1点怒气
	elseif knight.recoverAngerDam then
		
		SpecialAttrRule._initRecoverAngerDam(knight, rules)
	
	-- 49-基础怒气值
	elseif knight.baseAnger then
		
		SpecialAttrRule._initBaseAnger(knight, rules)
	
	-- 50-每次行动恢复%的生命%
	elseif knight.HPRecover then
		
		SpecialAttrRule._initHPRecover(knight, rules)

	end

	return rules

end

-- 35-攻击吸血%，若造成伤害后战斗没有结束，则计算吸血，吸血值=本次攻击造成的所有伤害之和（技能效果=1的运算值之和，包括溢出值）*攻击吸血%，此属性由养成提供，技能和buff会附加。
function SpecialAttrRule._initAtkAbsort(knight, rules)
	rules.atkAbsort = {
		_atkAbsort = knight:getBaseInfo("atkAbsort"),
		execute = function(self, damage)
			return damage * self._atkAbsort / 1000
		end,
	}
end

-- 36-反弹物理伤害%，若造成伤害后战斗没有结束，则计算反弹伤害，反弹值=本次攻击造成的所有物理伤害之和（技能效果=1的运算值之和，包括溢出值）*受击方物理反弹%，技能和buff会附加。
function SpecialAttrRule._initReboundPhyDam(knight, rules)
	rules.reboundPhyDam = {
		_reboundPhyDam = knight:getBaseInfo("reboundPhyDam"),
		execute = function(self, damage)
			return damage * self._reboundPhyDam / 1000
		end,
	}
end

-- 37-反弹法术伤害%，同36
function SpecialAttrRule._initReboundMagDam(knight, rules)
	rules.reboundMagDam = {
		_reboundMagDam = knight:getBaseInfo("reboundMagDam"),
		execute = function(self, damage)
			return damage * self._reboundMagDam / 1000
		end,
	}
end

-- 39-异常状态抗性%，在受到减益buff增加逻辑时，将增加的概率（skill_info.buff_prob）进行修正，修正概率=配置概率*（1-异常状态抗性%）
function SpecialAttrRule._initResistException(knight, rules)
	rules.resistException = {
		_resistException = knight:getBaseInfo("resistException"),
		execute = function(self, probability)
			return probability * (1000 - self._resistException) / 1000
		end,
	}
end

-- 40-怒气降低抗性%，在受到减怒效果时（skill_info.effect_type=3）时，将概率（effect_prob）进行修正，修正概率=配置概率*（1-怒气降低抗性%）
function SpecialAttrRule._initResistAngerDown(knight, rules)
	rules.resistAngerDown = {
		_resistAngerDown = knight:getBaseInfo("resistAngerDown"),
		execute = function(self, probability)
			return probability * (1000 - self._resistAngerDown) / 1000
		end,
	}
end

-- 43-每次行动概率恢复1点怒气%，每次行动前，%概率恢复自身1点怒气。
function SpecialAttrRule._initRecoverAnger(knight, rules)
	rules.recoverAnger = {
		_recoverAnger = knight:getBaseInfo("recoverAnger"),
		execute = function(self, battleField)
			if battleField:bingo(self._recoverAnger, 1000) == 1 then
				local anger = knight:getBaseInfo("anger")
				anger = anger + 1
				knight:setBaseInfo("anger", anger)
				return true
			end
			return false
		end,
	}
end

-- 44-攻击无视防御%，公式1中体现。
function SpecialAttrRule._initIgnoreDef(knight, rules)
	rules.ignoreDef = knight:getBaseInfo("ignoreDef")
end

-- 45-初始合击值，玩家初始合击值=默认合击值+初始合击值，默认合击值=0（value_info.id=2），表示进入战斗时初始化的合击值，最终值修正=min(初始合击值，合击值上限)
function SpecialAttrRule._initComboValue(knight, rules)
	rules.comboValue = knight:getBaseInfo("comboValue")
end

-- 46-合击值上限，玩家战斗中合击值累积的上限=默认上限+合击值上限，默认上限=80（value_info.id=3）。
function SpecialAttrRule._initComboValueUpLimit(knight, rules)
	rules.comboValueUpLimit = knight:getBaseInfo("comboValueUpLimit")
end

-- 47-合击值回复，表示战斗中任意武将行动时，我方增加的合击值，合击值恢复=默认合击值恢复+合击值恢复，默认值=10（value_info.id=4）。
function SpecialAttrRule._initComboValueRecover(knight, rules)
	rules.comboValueRecover = {
		_comboValueRecover = knight.comboValueRecover,
		execute = function(self, battleField)
			local combo = knight:getBaseInfo("combo")
			combo = combo + self._comboValueRecover + 10
			knight:setBaseInfo("combo", combo)
			return true
		end,
	}
end

-- 48-受到伤害时概率恢复1点怒气，受到任意单位造成伤害时（skill_info.effect_type=1），%概率增加1点怒气。
function SpecialAttrRule._initRecoverAngerDam(knight, rules)
	rules.recoverAngerDam = {
		_recoverAngerDam = knight:getBaseInfo("recoverAngerDam"),
		execute = function(self)
			
		end,
	}
end

-- 49-基础怒气值，进入战斗时的初始化怒气值=武将默认值+基础怒气值，武将默认值=knight_info.anger_base
function SpecialAttrRule._initBaseAnger(knight, rules)
	rules.baseAnger = knight:getBaseInfo("baseAnger")
end

-- 50-每次行动恢复%的生命%，行动前恢复生命值，单独逻辑与HOT分开，值=生命最大值*配置值%
function SpecialAttrRule._initHPRecover(knight, rules)
	rules.HPRecover = {
		_HPRecover = knight:getBaseInfo("HPRecover"),
		execute = function(self, battleField)
			local hp = knight:getBaseInfo("hp")
			local maxHp = knight:getBaseInfo("maxHp")
			hp = hp + maxHp * self._HPRecover / 1000
			knight:setBaseInfo("hp", hp)
			return true
		end,
	}
end


return SpecialAttrRule