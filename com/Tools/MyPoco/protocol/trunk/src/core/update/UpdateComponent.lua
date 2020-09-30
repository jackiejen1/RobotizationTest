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
local SkillSpecialRule = load "core.rule.SkillSpecialRule"

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
	-- 放逐buff
	local exile = attacker:doBuff(BuffRule.TYPE.EXILE)
	
	local identity = attacker.identity
	commands.effect = {}
	-- 被放逐不被动回怒，回合计值
	if not exile then
		-- 默认合击值回复
		if not battleField:isDisableComboRecover() then
			local info = battleData:getComboInfo(identity)
			local value = info.baseInfo.COMBO_RECOVER_ACTION
			value = battleData:updateComboValue(value,identity,true)
			table.insert(commands.effect,{effect_type=6,effect_value=value})
		end
		
		-- 被动怒气回复
		local angerGain = attacker.baseInfo.ANGER_RECOVER
		if angerGain > 0 then
			table.insert(commands.effect,{effect_type=4,effect_value=angerGain})
		end
	end

	-- buff生效
	-- 眩晕判断
	local stun = attacker:doBuff(BuffRule.TYPE.ACT_LIMIT)
	commands.stun = stun

	commands.stun = commands.stun or exile

	-- dot判断
	if not exile then
		local dots = attacker:doBuff(BuffRule.TYPE.DHOT,{})
		commands.buff = dots

		-- buff回合
		local removeList = attacker:doBuffRound(BuffRule.ROUND.BEFORE)
		commands.removeList = removeList
	else
		commands.buff = {}
		local removeList = attacker:doSpBuffRound(BuffRule.ROUND.BEFORE,BuffRule.TYPE.EXILE)
		commands.removeList = removeList
	end
	-- buff移除触发被动
	if commands.removeList then
		battleData:excuteSpRule(SkillSpecialRule.TYPE.BUFF_REMOVE, commands.removeList)
	end

	commands.attacker = attacker

	local isReady = UpdateComponent.updateAttacker(attacker, commands,battleField)

	return isReady, commands
end

-- 这里计算生效
function UpdateComponent.updateAttacker(attacker, commands,battleField)
	for i, buff in ipairs(commands.buff) do
		local buffEffect = buff.buff_effect
		FightResult.updateSkillEffect(commands,buff.attacker,buff.victim, buffEffect,battleField)
	end
	for i, effect in ipairs(commands.effect) do
		FightResult.updateSkillEffect(commands,attacker,attacker, effect,battleField)
	end
	commands.is_dead = attacker.isDead

	if commands.stun or attacker.isDead then
		return false
	end
	if attacker.isGhost then
		return false
	end

	return true

end

-- 攻击后（不仅是武将）更新
function UpdateComponent.updateAfterAttack(attacker, battleData, battleField)
	local commands = {}
	-- 需要移除的buff
	local removeList = {}
	local knights = battleData:getKnights()
	for i, knight in knights:ipairs() do
		local buffList = knight.buffs
		for i = #buffList, 1, -1 do
			local buff = buffList[i]
			local buffCfg = buff.buffCfg
			if buffCfg.buff_type == BuffRule.TYPE.FORCE_MISS then
				-- 疾风buff，如果武将在本次攻击闪避后，会消耗闪避次数，闪避次数为0时，需要自行清除buff
				buff.rule(true)
			end
			if buff.isDone then
				table.insert(removeList, buff)
				table.remove(buffList, i)
				buff:doRemove()
			else
				buff:doClean()
			end
		end
	end

	-- 检查放逐
	-- 如果一方存活的全被放逐，则取消放逐状态
	local exile = false
	for identity = 1 , 2 do
		exile = true
		for i, knight in knights:ipairs(identity) do
			if knight:isReal() then
				exile = exile and knight.exile
			end
		end
		if exile then
			for i, knight in knights:ipairs(identity) do
				local buff = knight:exitExile()
				if buff then
					table.insert(removeList, buff)
				end
			end
		end
	end
	if #removeList > 0 then
		battleData:excuteSpRule(SkillSpecialRule.TYPE.BUFF_REMOVE, removeList)
	end
	commands.removeList = removeList

	return commands
end

return UpdateComponent