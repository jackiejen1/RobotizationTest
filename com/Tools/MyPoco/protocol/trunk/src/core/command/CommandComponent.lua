--[========================[

	操作命令组件

	负责管理接受到的操作组件并按照一定的格式进行返回

]========================]

local table = table
local insert = table.insert

local CommandComponent = class("CommandComponent")

function CommandComponent.create()

	return CommandComponent.new()

end

function CommandComponent:ctor()

	-- 存放每一次操作命令的table
	-- 这里其实和BattleOneAttack结构一致
	self._commands = {}

end

--[=================[

	添加战场更新的操作

	这里涉及战场状态的更新，比如战斗的胜负等。武将的死亡也在这里

	@param command 操作记录

]=================]

function CommandComponent:addUpdateCommand(command)

	if not command then return end

	local commands = self._commands
	commands.attack_before = commands.attack_before or {}
	commands.attack_before.buff = command.buff or {}

	if commands.attack_before.buff then
		for i , buff in ipairs(commands.attack_before.buff) do
			-- 去掉多余信息
			buff.attacker = nil
		end
	end

	if command.removeList then
		for i = 1 , #command.removeList do
			local buff = command.removeList[i]
			insert(commands.attack_before.buff, {
				buff_serial_id = buff.serialId,
				buff_id = buff.buffCfg.id,
				buff_action = 2,
				knight_serial_id = buff.victim.serialId,
			})
		end
	end
	
	commands.attack_serial_id = command.attacker.serialId
	commands.attack_before.effect = command.effect

	if command.is_dead then
		commands.is_dead = true
	end
end

--[=================[

	添加一次出手的操作

	可能是正常回合出手，也可能是玩家释放的技能
	
	@param command 操作记录 fight的操作记录
	
]=================]

function CommandComponent:addFightCommand(command,isPassive)

	if not command then return end
	
	local attacker 				= command.attacker
	local attackType 			= command.attackType
	local attackId 				= command.attackId
	local attackInfos 			= command.attackInfos
	local attackEffectBefore 	= command.attackEffectBefore
	local attackEffectAfter 	= command.attackEffectAfter
	local addBuffs				= command.addBuffs
	local delBuffs				= command.delBuffs
	-- local addInfos				= command.addInfos
	local knights				= command.knights
	local skillSummons			= command.skillSummons
	local delSkillSummon		= command.delSkillSummon
	local reborns				= command.reborns
	local spEffects				= command.spEffects

	local commands = self._commands

	local tempCommand = {}
	if not isPassive then
		tempCommand = commands
	end

	tempCommand.attack_serial_id = attacker.serialId
	tempCommand.add_serial_id = attacker.addSerialId	-- 附加的序号，如召唤物的序号
	tempCommand.attack_type = attackType
	tempCommand.attack_id = attackId

	if #attackEffectBefore > 0 then
		
		tempCommand.attack_before = tempCommand.attack_before or {}
		tempCommand.attack_before.effect = tempCommand.attack_before.effect or {}

		for i, effect in ipairs(attackEffectBefore) do
			insert(tempCommand.attack_before.effect,effect)
		end

	end

	tempCommand.attack_infos = {}
	
	for i, info in ipairs(attackInfos) do
		
		local attackInfo = {
			victim_serial_id = info.victim.serialId,
		}
		
		local effect = {
			effect_type = info.effect_type,
			effect_value = info.effect_value,
			add_value = info.add_value,
		}
		attackInfo.effect = effect
		effect.add_effects = {}
		-- 暴击
		if info.crit then
			insert(effect.add_effects, {add_type = 1})
		end
		-- 闪避
		if info.miss then
			insert(effect.add_effects, {add_type = 2})
		end
		-- 格挡
		if info.block then
			insert(effect.add_effects, {add_type = 3})
		end
		-- 清buff
		if info.buffClear then
			insert(effect.add_effects, {add_type = 6})
		end
		-- 无敌
		if info.invincible then
			insert(effect.add_effects, {add_type = 7})
		end
		-- 吸怒气
		if info.suckAnger then
			insert(effect.add_effects, {add_type = 8})
		end
		-- 秒杀
		if info.seckill then
			insert(effect.add_effects, {add_type = 9})
		end
		-- 生命链接、诅咒的分摊伤害
		if info.hpLink then
			insert(effect.add_effects, {add_type = 10})
		end

		if info.victim.isDead then
			attackInfo.is_dead = true
		end

		if info.victim.isGhost then
			attackInfo.is_ghost = true
		end
		-- attackInfo.hp = victim:getBaseInfo("hp")
		-- attackInfo.maxHp = victim:getBaseInfo("maxHp")

		insert(tempCommand.attack_infos, attackInfo)

	end

	if #attackEffectAfter > 0 then
		
		tempCommand.attack_after = tempCommand.attack_after or {}
		tempCommand.attack_after.effect = tempCommand.attack_after.effect or {}
		
		for i, effect in ipairs(attackEffectAfter) do
			local effectData = {
				effect_type = effect.effect_type,
				effect_value = effect.effect_value,
				add_effects = effect.add_effects,
			}
			if effect.victim then
				effectData.victim_serial_id = effect.victim.serialId
			end
			insert(tempCommand.attack_after.effect, effectData)
		end

	end
	
	if #addBuffs > 0 then
		
		tempCommand.attack_after = tempCommand.attack_after or {}
		tempCommand.attack_after.buff = {}
		
		for i, buff in ipairs(addBuffs) do
			insert(tempCommand.attack_after.buff, {
				buff_id = buff.buffId,
				buff_serial_id = buff.serialId,
				knight_serial_id = buff.victim.serialId,
				buff_action = 1,
			})
		end

	end

	if #delBuffs > 0 then
		
		tempCommand.attack_after = tempCommand.attack_after or {}
		tempCommand.attack_after.buff = tempCommand.attack_after.buff or {}
		
		for i, buff in ipairs(delBuffs) do
			insert(tempCommand.attack_after.buff, {
				buff_id = buff.buffCfg.id,
				buff_serial_id = buff.serialId,
				knight_serial_id = buff.victim.serialId,
				buff_action = 2,
			})
		end

	end

	if #skillSummons > 0 then
		tempCommand.attack_after = tempCommand.attack_after or {}
		tempCommand.attack_after.skillSummons = tempCommand.attack_after.skillSummons or {}
		for i, skillSummon in ipairs(skillSummons) do
			insert(tempCommand.attack_after.skillSummons, {
				serial_id = skillSummon.serialId,
				summon_id = skillSummon.summonCfg.id,
				owner_serial_id = skillSummon.owner.serialId,
				summon_action = 1,
			})
		end
	end

	if #delSkillSummon > 0 then
		tempCommand.attack_after = tempCommand.attack_after or {}
		tempCommand.attack_after.skillSummons = tempCommand.attack_after.skillSummons or {}
		for i, skillSummon in ipairs(delSkillSummon) do
			insert(tempCommand.attack_after.skillSummons, {
				serial_id = skillSummon.serialId,
				summon_id = skillSummon.summonCfg.id,
				owner_serial_id = skillSummon.owner.serialId,
				summon_action = 2,
			})
		end
	end

	if attacker.isDead then
		tempCommand.is_dead = true
	end

	tempCommand.knights = knights
	tempCommand.reborns = reborns
	tempCommand.spEffects = spEffects
	
	if isPassive then
		if not commands.passive_infos then
			commands.passive_infos = {}
		end
		table.insert(commands.passive_infos,#commands.passive_infos+1,tempCommand)
	end
end

-- 添加回合开始的操作
function CommandComponent:addRoundCommand( command )
	local commands = self._commands
	commands.round_start = {}
	commands.round_start.combo_value = command.comboValue
	commands.round_start.cd_list = command.cdList
end

-- 添加攻击结束更新操作
function CommandComponent:addUpdateAfterAttackCommand(command)
	local commads = self._commands
	local removeList = command.removeList or {}
	commads.attack_after = commads.attack_after or {}
	commads.attack_after.buff = commads.attack_after.buff or {}
	
	for i, buff in ipairs(removeList) do
		insert(commads.attack_after.buff, {
			buff_id = buff.buffCfg.id,
			buff_serial_id = buff.serialId,
			knight_serial_id = buff.victim.serialId,
			buff_action = 2,
		})
	end
end

function CommandComponent:setGameOver(winner)

	local commands = self._commands

	commands.is_game_over = true
	commands.winner = winner
end

function CommandComponent:setWaveOver(winner)
	local commands = self._commands
	
	commands.is_wave_over = true
	commands.winner = winner
end

function CommandComponent:addAssist()
	local commands = self._commands
	
	commands.assist = true
end

function CommandComponent:pack()
	
	return self._commands

end

return CommandComponent