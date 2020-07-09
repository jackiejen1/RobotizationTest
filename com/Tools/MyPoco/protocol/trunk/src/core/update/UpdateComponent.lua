--[========================[

	战场更新组件

	负责更新战场的状态，比如每个武将的生死，战斗是否结束等

]========================]

local math = math
local floor = math.floor
local min = math.min
local max = math.max

local table = table
local insert = table.insert
local sort = table.sort

local tostring = tostring
local tonumber = tonumber

local SpecialAttrRule = load "core.rule.SpecialAttrRule"
local SkillSpecialRule = load "core.rule.SkillSpecialRule"
local BuffRule = load "core.rule.BuffRule"
local FightResult = load "core.fight.FightResult"

local UpdateComponent = {}

--[=================[

	战场更新
	负责执行战场更新操作

	@param attacker 下一回合的出手对象，只能是武将技能
	@param battleData 战场数据的源数据
	@param battleField 战场实例

	@return isReady 此次攻击者（传入的attacker）是否准备好了，指的其实主要是死没死
	@return command 操作记录，如果没有就不传

]=================]

function UpdateComponent.update(attacker, battleData, battleField)
	local commands = {}

	-- 特殊属性效果和被动触发技能
	local spRules = attacker.spRules

	-- 默认合击值回复
	local identity = attacker.identity
	local info = battleData:getComboInfo(identity)
	local value = info.baseInfo.COMBO_RECOVER_ACTION
	value = battleData:updateComboValue(value,identity,true)
	commands.effect = {}
	table.insert(commands.effect,{effect_type=6,effect_value=value})

	-- 被动怒气回复
	local angerGain = attacker.baseInfo.ANGER_RECOVER
	if angerGain > 0 then
		table.insert(commands.effect,{effect_type=4,effect_value=angerGain})
	end

	-- buff生效
	-- dot判断
	local dots = attacker:doBuff(BuffRule.TYPE.DHOT,{})
	commands.buff = dots
	-- 眩晕判断
	local stun = attacker:doBuff(BuffRule.TYPE.ACT_LIMIT)
	commands.stun = stun

	-- buff回合
	local removeList = attacker:doBuffRound(BuffRule.ROUND.BEFORE)
	commands.removeList = removeList

	commands.attacker = attacker

	local isReady = UpdateComponent.updateAttacker(attacker, commands,battleField)

	return isReady, commands
end

-- 这里计算生效
function UpdateComponent.updateAttacker(attacker, commands,battleField)
	for i, buff in ipairs(commands.buff) do
		local buffEffect = buff.buff_effect
		FightResult.updateSkillEffect(commands,buff.attacker,attacker, buffEffect,battleField)
	end
	for i, effect in ipairs(commands.effect) do
		FightResult.updateSkillEffect(commands,attacker,attacker, effect,battleField)
	end
	commands.is_dead = attacker.isDead

	if commands.stun or attacker.isDead then
		return false
	end

	return true

end

return UpdateComponent