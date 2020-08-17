--[==================[

	技能特殊效果
	在取名字上区分使用special这个单词，和SkillSpecialRule保持区别

	配置在skill_info表中special_effect_type_1

]==================]

local tostring = tostring

local SkillExtraRule = {}

function SkillExtraRule.initRule(knight)

	local rules = {}

	-- 一个武将分有普攻，技能，所以要分别处理
	local commonSkillCfg = knight:getCommonSkillCfg()
	local activeSkillCfg = knight:getActiveSkillCfg()

	-- 被动类触发效果可能会修改技能，所以这里要选择实际使用的技能
	local spRules = knight:getSpRules()

	-- 普攻，如果有特殊规则则使用特殊规则的普攻
	commonSkillCfg = spRules.commonSkill or commonSkillCfg
	
	-- 技能，如果有特殊规则，则使用特殊规则的技能
	activeSkillCfg = spRules.activeSkill or activeSkillCfg

	SkillExtraRule._initSpecialRule(commonSkillCfg)
	SkillExtraRule._initSpecialRule(activeSkillCfg)

	return rules

end

function SkillExtraRule._initSpecialRule(skillCfg)

	local effectType = skillCfg.special_effect_type_1

	if effectType == 0 then return end

	local initFunction = SkillExtraRule["_initSkillEffectType"..tostring(effectType)]
	assert(initFunction, "Invalid skill_info.special_effect_type_1: "..tostring(effectType))

	initFunction(skillCfg)

end

-- 初始化每个技能特殊效果

-- 1-若本次伤害造成击杀，则再行动一次value=0。
function SkillExtraRule._initSkillEffectType1(knight, rules, skillCfg)
	rules.killAttackAgain = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self, isKilled)
			
		end
	}
end

-- 2-若本次伤害造成击杀，本次战斗的属性value1增加value2，无法被清除。---value1=属性id,value2=值。
function SkillExtraRule._initSkillEffectType2(knight, rules, skillCfg)
	rules.killAttrUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 3-若敌人速度低于自己，则有概率造成眩晕1回合，敌人速度越慢，概率越高。---眩晕概率=速度差值*value1%，最大值=value2%，都是千分比。目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType3(knight, rules, skillCfg)
	rules.speedStun = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 4-若目标速度小于自己，则减少value1点怒气。目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType4(knight, rules, skillCfg)
	rules.speedAngerDown = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 5-若目标怒气为value1，则此伤害最终值提升value2%。---总伤害*value2，千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType5(knight, rules, skillCfg)
	rules.angerDamUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 6-若对方合击值大于等于value1，则减少对方value2点合击值。---value1千分比，目标为敌方阵容。
function SkillExtraRule._initSkillEffectType6(knight, rules, skillCfg)
	rules.comboValueDown = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 7-若目标处于任意buff_increase_type=value1的状态，则伤害最终值提升value2%。---总伤害*value2，千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType7(knight, rules, skillCfg)
	rules.buffIncreaseDamUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 8-若目标生命大于等于value1%，则减少目标value2点怒气。---value1千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType8(knight, rules, skillCfg)
	rules.hpAngerDown = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 9-若造成击杀，则恢复value1点合击值。
function SkillExtraRule._initSkillEffectType9(knight, rules, skillCfg)
	rules.killComboUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 10-若目标处于buff_effect_type=value1状态，则击退其value2%行动条。---value2千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType10(knight, rules, skillCfg)
	rules.buffComboDown = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 11-若目标处于buff_effect_type=value1状态，则本次伤害最终值增加value2%。---value2千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType11(knight, rules, skillCfg)
	rules.buffEffectDamUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

-- 12-若目标生命大于value1，则伤害最终值增加value2%。---都是千分比，目标为效果1的命中集合。
function SkillExtraRule._initSkillEffectType12(knight, rules, skillCfg)
	rules.hpDamUp = {
		_value1 = skillCfg.special_effect_value_1,
		_value2 = skillCfg.special_effect_value_2,
		execute = function(self)
			
		end
	}
end

return SkillExtraRule