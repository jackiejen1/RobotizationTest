--[========================[

	战场

	负责控制战场上发生的所有行为

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

local FightComponent = load "core.fight.FightComponent"
local UpdateComponent = load "core.update.UpdateComponent"
local PlayerFactory = load "core.player.PlayerFactory"
local CommandComponent = load "core.command.CommandComponent"
local RoundComponent = load "core.round.RoundComponent"
local BattleConst = load "const.BattleConst"
local SkillSpecialRule = load "core.rule.SkillSpecialRule"

local BattleField = class("BattleField")

BattleField.BATTLE_FIGHTING = 0	-- 战斗中
BattleField.BATTLE_FINISH = 1	-- 战斗完成
BattleField.BATTLE_FAILURE = 2	-- 战斗失败

BattleField.isExtraAction = false
BattleField.disableComboRecover = false
BattleField.forceCommonSkill = false

function BattleField:ctor()

	self:init()

end

--[=================[

	初始化战场的数据

	包括武将数据，合击值，玩家操作等数据
	这里相当于声明，并无实际有效数据。有效数据都是后面通过setXXX方法提供的

]=================]

function BattleField:init()

	-- 战斗数据
	self._battleData = load("core.BattleDataFactory").createBattleData(self)

	-- 用户命令（手动释放的技能)
	self._playerCommands = {}

	-- 出手的次数记录，表示每一次出手的记录
	self._attackCount = 0
	-- 当前波的出手记录
	self._curAttackCount = 0

	-- 回合数
	self._roundCount = 0

	-- 武将行动数（即使因为眩晕等没出手也算）
	self._actionCount = {0, 0}

	-- 事件监听器
	self._listeners = {}

	-- 战斗计算数据集合
	self._commands = {}

	-- 战斗id
	self._battleId = 0

	-- 战斗状态
	self._state = BattleField.BATTLE_FIGHTING

	-- 胜者，默认为0，有值时为1或者2
	self._winner = 0

	-- 自动逻辑
	self._auto = load("core.auto.AutoComponent")
	self._auto:init()

	-- 攻击顺序
	self._action = load("core.action.ActionComponent")

	-- 胜利条件
	self._winCondition = 0

	self._randoms = {} -- 随机序列,范围0~999
	self._randomIndex = 1

	-- 记录的用户操作，用于复盘
	self._videoCommands = {}
	self._isVideo = false

	-- 伤害记录，用于结算
	self._record = load("core.BattleRecord")
	self._record:init()
end

function BattleField:addRecord(attacker, type, value)
    self._record:addRecord(attacker, type, value)
end

function BattleField:getRecord()
	return self._record:getRecord()
end

function BattleField:getWinInfo()
	return self._record:getWinInfo()
end

--[=================[

	重置战场的数据

]=================]

function BattleField:reset()

	-- 重新初始化
	self:init()

end

--[=================[

	注册一个事件监听

	@param listener 监听函数
	@param key 监听函数对应的唯一标识，可以是lua支持的任意类型，建议使用字符串

]=================]

function BattleField:registerEventListener(listener, key)

	self._listeners[key] = listener

end

--[=================[

	注册一个事件监听

	@param key 监听函数对应的唯一标识，可以是lua支持的任意类型，建议使用字符串

]=================]

function BattleField:unregisterEventListener(key)

	self._listeners[key] = nil

end

--[=================[

	概率判断，是否触发

	@param weights 权重池，可以是一个数值，也可以是一组数值。比如{50, 100, 200}
	@param total 范围值，如果没有则取权重值累加

	@return 返回是否触发的权重范围
			比如{50, 120, 200}这样一个权重池，返回触发的索引下标
			如果是单个权重的(weights是number)，触发了返回1，否则返回0

]=================]

function BattleField:bingos(weights, total)

	local randBounded = total or 0

	-- 预判断
	if type(weights) == "number" then
		if weights >= total then
			return 1
		elseif weights <= 0 then
			return 0
		end
	end

	if randBounded == 0 then
		if type(weights) == "number" then
			randBounded = weights
		elseif type(weights) == "table" then
			for i=1, #weights do
				randBounded = randBounded + weights[i]
			end
		end
	end

	local value = self:boundedrand(1,randBounded)
	if type(weights) == "number" then
		return value <= weights and 1 or 0
	else
		local weight = 0
		local index = 0
		repeat
			index = index + 1
			weight = weight + weights[index]
		until value <= weight or index >= #weights

		return value <= weight and index or 0
	end

end

function BattleField:bingo(weight, total)
	total = total or 1000
	local value = self:boundedrand(1,total)
	return value <= weight
end

--[=================[

	返回一个随机值

	@param rangeMin 范围下限
	@param rangeMax 范围上限

	@return 返回随机值

]=================]

function BattleField:boundedrand(rangeMin, rangeMax)

	-- 数据范围是0~999，需要进行转换
	local rNum = self._randoms[self._randomIndex]
	if not rNum then
		self._randomIndex = 1
		rNum = self._randoms[1]
	end
	self._randomIndex = self._randomIndex + 1

	local range = rangeMax - rangeMin + 1
	return math.floor(rNum*range/1000) + rangeMin

	-- -- 这里+1是要修正实际的范围，比如20, 30这样一个范围，实际随机的范围会是0~(30-20=10)，不包含边界，所以是0~9
	-- -- 最后修正的随机值则变成了20~29，但实际应该是20~30，包含边界。所以这里+1
	-- return random.boundedrand(self._random, rangeMax - rangeMin + 1) + rangeMin

end

-- 设置全部数据
-- 随机数种子, 武将，合击
-- 要先设置武将数据，后设置合击数据
function BattleField:setInitData(initData)
	if initData.assistance_id and initData.assistance_id > 0 then
		initData.atk_type = 10
	end
	self._randoms = initData.random_seeds
	local isPvp = initData.atk_type == 2 or initData.atk_type == 3
	self._atkType = initData.atk_type
	self._battleData.isPvp = isPvp
	self._battleData.isRobot = initData.atk_type == 3
	self._battleData:setCondition(initData.win_condition)
	self._winCondition = initData.win_condition
	self._auto:setAuto(2,true)
	self._battleId = initData.battle_id
	self._isAuto = initData.is_auto
	if self._isAuto then
		self._auto:setAuto(1,true)
	end
	for identity = 1 , 2 do
		local info = identity == 1 and initData.own_teams[1] or initData.enemy_teams[1]
		-- local robot = info.user and (info.user.robot_type and info.user.robot_type ~= 0 and info.user.robot_type ~= 999)
		local isMonster = info.monster_team_id and info.monster_team_id > 0 or false
		-- 阵营玩法加成
		local groupMultiple = info.demon_boss_multiple
		for i , v in ipairs(info.units) do
			if groupMultiple then
				local infoName = isMonster and "monster_info" or "knight_info"
				local knight_info = loadCfg("cfg."..infoName)
				local knightCfg = knight_info.get(v.id)
				-- 主角或该阵营武将加成
				if groupMultiple.team == knightCfg.group or knightCfg.type == 1 then
					v.multiple = groupMultiple.multiple
				end
			end
			if info.multiple then
				v.multiple = (v.multiple or 0) + info.multiple
			end
		end
		self._battleData:setMultiple(identity,info.multiple)

		-- local isMonster = robot or (self._atkType == 1 and identity == 2) or (self._atkType == 10)
		
		self:setFightKnights(info.units,identity,isMonster,info.user)
		self:setEnabledCommands(info.combo,identity)
        self._battleData:setFightValue(info.fight_value,identity)
        self._battleData:setAssist(initData.assistance_id)
		self._battleData:setPassiveSkills(identity,info.passive_skills)
		self._battleData:setPets(identity, info.pets)
	end
	self._initData = initData
	self._attackIndex = {1,1}
	self._record:initRecord(self._atkType,self._initData.own_teams[self._attackIndex[1]],self._initData.enemy_teams[self._attackIndex[2]])


	self._action:init(self._battleData)
end

function BattleField:updateNewPlayer(winner)
	local loser = 3 - winner
	local nextIndex = self._attackIndex[loser] + 1
	self._attackIndex[loser] = nextIndex
	local infos = loser == 1 and self._initData.own_teams or self._initData.enemy_teams
	local newData = infos[nextIndex]
	if not newData then
		return false
	end
	self._record:initRecord(self._atkType,self._initData.own_teams[self._attackIndex[1]],self._initData.enemy_teams[self._attackIndex[2]])

	self._battleData:clear(loser)
	local robot = newData.user and (newData.user.robot_type and newData.user.robot_type ~= 0 and newData.user.robot_type ~= 999)
	local isMonster = newData.monster_team_id and newData.monster_team_id > 0 or false
	local groupMultiple = newData.demon_boss_multiple
	for i , v in ipairs(newData.units) do
		if groupMultiple then
			local infoName = isMonster and "monster_info" or "knight_info"
			local knight_info = loadCfg("cfg."..infoName)
			local knightCfg = knight_info.get(v.id)
			-- 主角或该阵营武将加成
			if groupMultiple.team == knightCfg.group or knightCfg.type == 1 then
				v.multiple = groupMultiple.multiple
			end
		end
		if newData.multiple then
			v.multiple = (v.multiple or 0) + newData.multiple
		end
	end
	self._battleData:setMultiple(identity,newData.multiple)

	-- local isMonster = robot or (self._atkType == 1 and loser == 2) or (self._atkType == 10)
	
	self:setFightKnights(newData.units,loser,isMonster,newData.user)
	self:setEnabledCommands(newData.combo,loser)
	self._battleData:setFightValue(newData.fight_value,loser)
	self._battleData:setPassiveSkills(loser,newData.passive_skills)
	self._battleData:setPets(loser, newData.pets)

	-- 清掉胜利方的buff
	local list = self._battleData:getKnightList(winner)
	for i , v in ipairs(list) do
		v:clearBuff()
		v:clearPassiveSkill()
	end
	-- 清除额外行动次数
	self._action:clearExtraAction()
	self._battleData:setRoundFinish(true)
	self._roundCount = 0
	self._curAttackCount = 0
	return true
end

-- 是否强制自动
function BattleField:isAuto( )
	return self._isAuto
end

--[=================[

	设置武将数据
	这里武将的数据是指战斗中会用到的武将数据，包括武将自身的数据和相关表的数据
	@param knights武将数据

]=================]

function BattleField:setFightKnights(knights, identity,isMonster,user)
	local KnightFactory = load "core.knight.KnightFactory"
	-- 创建武将数据
    for i=1, #knights do
		local knight = KnightFactory.createKnight(knights[i], identity,isMonster,user,self)
		self._battleData:setKnightData(knight, identity)
	end

end

--[=================[

	设置玩家可操作的技能数据
	玩家开始战斗的时候可释放的技能（合击）数据
	一定要先初始化武将数据后再初始化合击数据
	
	@param combos 技能数据

]=================]

function BattleField:setEnabledCommands(combos,identity)
	self._battleData:initComboData(combos,identity)
	self._battleData:initComboAddData("COMBO_ATTACK","ATTACK",identity)
	self._battleData:initComboAddData("COMBO_HP","INITIAL_HP",identity)
	self._battleData:initComboAddData("COMBO_FINAL_DAMAGE_ADD","FIN_DAMAGE_ADD",identity)
	self._battleData:initComboAddData("COMBO_BASE_CRIT_RATE","CRIT_RATE",identity)
	self._battleData:initComboAddData("COMBO_BASE_CRIT_DAMAGE_ADD","CRIT_DAMAGE_ADD",identity)
	self._battleData:initComboAddData("COMBO_BASE_DAMAGE_ADD","DAMAGE_ADD",identity)
	self._battleData:initComboAddData("COMBO_BASE_PVP_DAMAGE_ADD","PVP_DAMAGE_ADD",identity)
	self._battleData:initComboAddData2(identity)
end

--[=================[

	设置玩家操作数据
	适用于服务器一次性提交玩家操作数据
	
	@param command 玩家操作数据，数组，格式和客户端提交的玩家操作数据一致

]=================]

-- function BattleField:setPlayerCommands(commands)

-- 	self._playerCommands = {}

-- 	for i=1, #commands do
-- 		local playerCommand = PlayerFactory.createPlayerCommand(commands[i])
-- 		table.insert(self._playerCommands, playerCommand)
-- 	end

-- end

-- 检查是否能释放合击
function BattleField:checkCombo( skillInfo )
	if self._state == BattleField.BATTLE_FINISH or self._curAttackCount == 0 then
		return false
	end
	if skillInfo.id > 0 then
		return self._battleData:isComboSkillReady(skillInfo.id,skillInfo.identity)
	end
	return false
end

--[=================[

	执行战斗
	每调用此方法一次，会执行一次战斗出手

	@param onlyResult 是否只要战斗结果，bool。
		   如果为true，则只返回战斗结果（不包含这一回合的战斗数据）
		   为false则都返回
		   skillInfo 如果有，则为玩家合击技能，如果无，则为武将出手
		   {id,identity}

	@return 1.战斗执行结果，成功、失败或者继续。
			成功指的是战斗顺利跑完了，失败是战斗没跑完，可能是战斗途中遇到错误。
			继续则是此次出手完成，待下一次出手
			2.当前回合执行的数据

]=================]

function BattleField:execute(onlyResult,skillInfo)
	
	if self._state == BattleField.BATTLE_FINISH then
		return self._state
	end
	if self._isAuto then
		skillInfo = nil
	end

	local battleData = self._battleData

	-- 是否战斗结束
	local isGameOver, winner = false, nil

	-- 本次操作的命令集合
	local commands = CommandComponent.create()

	-- 是否有额外行动次数
	local isExtraAction, extraAction = self._action:hasExtraAction()
	if isExtraAction then
		BattleField.isExtraAction = true
		BattleField.disableComboRecover = extraAction.disableComboRecover == true
		BattleField.forceCommonSkill = extraAction.forceCommonSkill == true
	end


	-- 一回合刚开始
	if not BattleField.isExtraAction then
		local roundStart = battleData:getRoundFinish()
		if roundStart then
			-- 回合数加1
			self._roundCount = self._roundCount + 1
			-- 回合开始的处理
			if self._roundCount > 1 then
				local command = RoundComponent.roundStart(battleData)
				commands:addRoundCommand(command)
			end
			
			local knights = battleData:getAllKnightList()
			for i, knight in ipairs(knights) do
				if not knight.isDead then
					knight:excuteSpRule(SkillSpecialRule.TYPE.ROUND_START)
				end
			end
			battleData:excuteSpRule(SkillSpecialRule.TYPE.ROUND_START)
		end
	end
		
	-- 计算行动顺序，获取当前谁出手
	local attacker = nil
	local isReady, command = true, nil

	if not BattleField.isExtraAction then
		-- 此处判断ai逻辑
		-- 不能在第一轮
		if not skillInfo and self._attackCount > 0 then
			-- 如果是录像，按记录播放，不管ai逻辑
			if self._isVideo then
				skillInfo = self._videoCommands[self._attackCount]
			else
				skillInfo = self._auto:checkAuto(battleData)
			end
		end
	end

	-- 玩家放合击，额外回合需要合并，目前在battlelayer resetLayer里跳过额外回合
	-- 玩家出手
	if skillInfo and skillInfo.id > 0 then
		
		if not battleData:isComboSkillReady(skillInfo.id,skillInfo.identity) then
			return BattleField.BATTLE_FAILURE
		end

		-- 增加一下出手次数，每次调用递增
		self._attackCount = self._attackCount + 1
		self._curAttackCount = self._curAttackCount + 1
		
		local playerCommand = PlayerFactory.createPlayerCommand({id = skillInfo.id,identity = skillInfo.identity, attack_count = self._attackCount,battleData = battleData})
		-- 取出玩家出手，替换成attacker
		attacker = playerCommand
		-- 记录下来
		insert(self._playerCommands, playerCommand)
	else
		-- 增加一下出手次数，每次调用递增
		self._attackCount = self._attackCount + 1
		self._curAttackCount = self._curAttackCount + 1

		local passiveSkill = battleData:getNextFastPassive()
		-- 如果有触发技能，则先释放触发技能
		if not passiveSkill then
			passiveSkill = battleData:getNextPassive()
		end

		if passiveSkill then
			-- 有触发技能
			isReady = false
			if passiveSkill.assist then
				commands:addAssist()
			else
				command = FightComponent.fightPassive(passiveSkill, battleData, self)
				if command then
					command:update()
					commands:addFightCommand(command)
				end
			end
		else
			-- 找出当前出手的武将
			attacker = self._action:next()
			-- 额外回合不算队伍的武将行动次数，防止提前触发应龙神兽这类被动
			if not BattleField.isExtraAction then
				self._actionCount[attacker.identity] = self._actionCount[attacker.identity] + 1
			end

			-- 看看当前出手武将有没有“准备”好，因为出手前有一些数据要计算，可能导致武将不能出手，比如被buff弄死了
			isReady, command = UpdateComponent.update(attacker, battleData, self)
			
			-- 记录一下本次操作（可能没有）
			if command then
				-- 记录本次操作
				commands:addUpdateCommand(command)
			end
		end
		
	end

	-- 只有准备好的时候才会出手
	if isReady then
		-- 出手前需要计算的合并的被动
		local earlyPassiveCommands = {}
		if not attacker.isPlayer then
			attacker:excuteSpRule(SkillSpecialRule.TYPE.BEFORE_SKILL)

			local passiveSkill = battleData:getNextFastPassive()
			if passiveSkill then
				local passiveCommand = FightComponent.fightPassive(passiveSkill, battleData, self)
				if passiveCommand then
					earlyPassiveCommands[#earlyPassiveCommands+1] = passiveCommand
				end
			end
		end

		-- 武将出手，产生运算
		local command = FightComponent.fight(attacker, battleData, self)
		-- 有的触发要立即处理
		local passiveSkill = battleData:getNextFastPassive()
		local passiveCommands = {}
		SkillSpecialRule.disable = true
		while passiveSkill do
			isGameOver, winner = battleData:isGameOver(self._roundCount)
			if isGameOver then
				break
			end
			local passiveCommand = FightComponent.fightPassive(passiveSkill, battleData, self)
			if passiveCommand then
				passiveCommands[#passiveCommands+1] = passiveCommand
			end
			
			passiveSkill = battleData:getNextFastPassive()
		end
		SkillSpecialRule.disable = false
		-- 提前的被动结算
		for i, passiveCommand in ipairs(earlyPassiveCommands) do
			passiveCommand:update()
			commands:addFightCommand(passiveCommand,true)
		end
		-- 玩家、武将技能结算
		command:update()
		commands:addFightCommand(command)
		-- 被动结算
		for i , passiveCommand in ipairs(passiveCommands) do
			passiveCommand:update()
			commands:addFightCommand(passiveCommand,true)
		end
	end

	-- 提前
	if attacker and not attacker.isPlayer then
		-- 武将行动结束（即使没出手攻击）
		battleData:excuteSpRule(SkillSpecialRule.TYPE.ACTION)
		battleData:excuteKnightSpRule(SkillSpecialRule.TYPE.ACTION)
	end

	local passiveSkill = battleData:getNextFastPassive()
	while passiveSkill do
		local passiveCommands = {}
		SkillSpecialRule.disable = true
		while passiveSkill do
			isGameOver, winner = battleData:isGameOver(self._roundCount)
			if isGameOver then
				break
			end
			local passiveCommand = FightComponent.fightPassive(passiveSkill, battleData, self)
			if passiveCommand then
				passiveCommands[#passiveCommands+1] = passiveCommand
			end
			
			passiveSkill = battleData:getNextFastPassive()
		end
		
		SkillSpecialRule.disable = false
		
		for i , passiveCommand in ipairs(passiveCommands) do
			passiveCommand:update()
			commands:addFightCommand(passiveCommand,true)
		end
		-- update后可能触发新被动
		passiveSkill = battleData:getNextFastPassive()
	end
	-- 攻击结束
	local command = UpdateComponent.updateAfterAttack(attacker, battleData, self)
	commands:addUpdateAfterAttackCommand(command)

	local lastAttack = self._action:checkFinish()
	-- 判断一下是否战斗结束了
	if lastAttack then
		isGameOver, winner = battleData:isGameOver(self._roundCount + 1)
	else
		isGameOver, winner = battleData:isGameOver(self._roundCount)
	end
	
	battleData:setRoundFinish(lastAttack)

	-- 将操作记录保存下来
	self:_addCommand(commands)

	-- 如果战斗结束了，则直接保存数据，然后返回
	if isGameOver then
		if not self:updateNewPlayer(winner) then
			-- 没有下一波了
			commands:setGameOver(winner)
			self._state = BattleField.BATTLE_FINISH
			self._winner = winner
			local ownTeam = self._initData.own_teams[self._attackIndex[1]] or self._initData.own_teams[self._attackIndex[1]-1]
			local enemyTeam = self._initData.enemy_teams[self._attackIndex[2]] or self._initData.enemy_teams[self._attackIndex[2]-1]
			local ownUser = ownTeam.user
			local enemyUser = enemyTeam.user
			local own_name = ownUser and ownUser.name
			local enemy_name = enemyUser and enemyUser.name
			self._record:setWinInfo(winner,own_name,enemy_name)
		else
			commands:setWaveOver(winner)
			self._action:reset()
			self._state = BattleField.BATTLE_FIGHTING
		end
	else
		self._state = BattleField.BATTLE_FIGHTING
	end
	BattleField.isExtraAction = false
	BattleField.disableComboRecover = false
	BattleField.forceCommonSkill = false

	return self._state, not onlyResult and commands:pack() or nil

end

-- 跳过额外行动次数
function BattleField:executeExtraAction()
	repeat
		local hasExtraAction = self:hasExtraAction()
		if hasExtraAction then
			state = self:execute(true)
		end
		hasExtraAction = self:hasExtraAction()
	until not hasExtraAction or state ~= BattleField.BATTLE_FIGHTING
end

-- 获取玩家操作集合
function BattleField:getPlayerCommands()
	local operations = {}
	for i = 1 , #self._playerCommands do 
		local command = self._playerCommands[i]
		local operation = command:pack()
		insert(operations, operation)
	end
	return operations
end

--[=================[

	执行战斗
	调用此方法，会一次性执行完战斗，返回最后的结果。

	@params operations {identity,id,attack_count} 玩家操作集合

	@return 只返回最后战斗执行的结果（成功或者失败）和胜者（成功状态才有）

]=================]

function BattleField:executeAll(operations)

	self:setVideoInfo(operations)
	local state = BattleField.BATTLE_FIGHTING
	-- 执行到战斗执行完毕为止，然后返回结果
	repeat
		state = self:execute(true)
		-- commands[self._attackCount] = nil
	until state ~= BattleField.BATTLE_FIGHTING

	local result = {}
	result.isWin = self._winner == 1
	result.hps1,result.knights1 = self._battleData:packKnightData(1)
	result.hps2,result.knights2 = self._battleData:packKnightData(2)
	return result

end


function BattleField:autoExecuteAll()
	local state = BattleField.BATTLE_FIGHTING
	-- 执行到战斗执行完毕为止，然后返回结果
	repeat
		state = self:execute(true)
		-- commands[self._attackCount] = nil
	until state ~= BattleField.BATTLE_FIGHTING
end

-- 获取战斗结果，用于发给服务器
function BattleField:getBattleResult()
	local result = {}
    result.is_win = self._winner == 1
    result.battle_id = self._battleId
    result.command = self:getPlayerCommands()
    local hps1,knights1 = self._battleData:packKnightData(1)
    local hps2,knights2 = self._battleData:packKnightData(2)
	result.units1 = knights1
	result.units2 = knights2
	result.round = self._roundCount 
	result.result = self:getExtraResult()
    result.cur_own_wave = self._winner == 1 and self._attackIndex[1] or self._attackIndex[1] - 1
    result.cur_enemy_wave = self._winner == 1 and self._attackIndex[2] - 1 or self._attackIndex[2]
    result.data_version = tostring(loadCfg "cfg.version")
    local record = self._record:getRecord()
    local wInfo = self._record:getWinInfo()
    result.own_name = wInfo.own_name
    result.enemy_name = wInfo.enemy_name
    result.own_teams = record[1]
    result.enemy_teams = record[2]
    result.attack_total_damage = self._record:getAttackerDamage()
    return result
end

function BattleField:getExtraResult()
	if not self._winCondition or self._winCondition == 0 then
		return
	end
	local battle_rating_info = loadCfg "cfg.battle_rating_info"
	local info = battle_rating_info.get(self._winCondition)
	if not info then
		return 0
	end
	local rateType = info.rating_type
	if rateType == 0 then
		return 0
	end
	if rateType == 4 then
		return self._roundCount 
	elseif rateType == 5 then
		local knights = self._battleData:getKnights()
		local count = 0
		for i, knight in knights:ipairs(1) do
			if knight.isDead then
				count = count + 1
			end
		end
		return count
	elseif rateType == 6 then
		local knights = self._battleData:getKnights()
		local chp, thp = 0,0
		for i, knight in knights:ipairs(1) do
			local curHp = knight.advanceInfo.INITIAL_HP
			local totalHp = knight.originInfo.INITIAL_HP
			chp = chp + curHp
			thp = thp + totalHp
		end
		return math.floor(chp*100/thp)
	elseif rateType == 7 then
		if self._winner == 1 then
			local win = false
			local knights = self._battleData:getKnights()
			for i, knight in knights:ipairs(1) do
				if knight.advanceInfo.INITIAL_HP > 0 then
					win = true
					break
				end
			end
			if win then
				return info.rating_value
			else
				return self._roundCount
			end
		else
			return self._roundCount - 1
		end
	elseif rateType == 8 then
		local knights = self._battleData:getKnights()
		local chp, thp = 0,0
		for i, knight in knights:ipairs(2) do
			local curHp = knight.advanceInfo.INITIAL_HP
			local totalHp = knight.originInfo.INITIAL_HP
			chp = chp + curHp
			thp = thp + totalHp
		end
		return math.floor((thp-chp)*100/thp)
	elseif rateType == 9 then
		return self._attackIndex[2] - 1
	elseif rateType == 10 then
		local knights = self._battleData:getKnights()
		local chp, thp = 0,0
		for i, knight in knights:ipairs(2) do
			local curHp = knight.advanceInfo.INITIAL_HP
			local totalHp = knight.originInfo.INITIAL_HP
			chp = chp + curHp
			thp = thp + totalHp
		end
		return math.floor((thp-chp)*100/thp)
	end
	return 0
end

--[=================[

	各种获取数据的方法

]=================]

function BattleField:getAttackCount() return self._attackCount end
function BattleField:getRoundCount() return self._roundCount end
function BattleField:getCommands() return self._commands end
function BattleField:getWinner() return self._winner end
function BattleField:getBattleData() return self._battleData end

function BattleField:setAuto(bool)
	if self._isAuto then
		return
	end
	self._auto:setAuto(1,bool)
end

-- 事件分发。这里使用pairs遍历所有的监听者，所以不要依赖监听的顺序，因为pairs遍历的顺序在不同lua虚拟机下可能是不同的
function BattleField:_dispatchEvent(...)

	for k, listener in pairs(self._listeners) do
		listener(..., self)
	end

end

-- 添加操作记录，用来记录每次一次出手的相关数据
function BattleField:_addCommand(command)

	table.insert(self._commands, command)

end

-- 用protobuf数据初始化
function BattleField:setInitDataBytes(bytes)
	local ProtoBuilder = load "core.proto.ProtoBuilder"
	local data = ProtoBuilder:decodeByMsgName("BattleReport",bytes)
	self:setInitData(data)
end

-- 用protobuf数据一次性执行完战斗，返回最后的检查结果。
function BattleField:checkResultBytes(bytes)
	
	local ProtoBuilder = load "core.proto.ProtoBuilder"
	local data = ProtoBuilder:decodeByMsgName("BattleResult",bytes)

    local re = self:checkResult(data)

	local ProtoBuilder = load "core.proto.ProtoBuilder"
	return ProtoBuilder:encodeByMsgName("CheckResult",re)
end

function BattleField:checkResult(data)
    local commoands = data.command or {}
    local result = self:executeAll(commoands)
    local check = true
    -- 检查结果
    check = check and result.isWin == data.is_win

    -- 检查武将血量
    if rawget(data , "units1") then
        local units = data.units1
        for i = 1 , #units do
            local unit = units[i]
            local id = (unit.identity-1)*10+unit.pos
            check = check and unit.hp - result.hps1[id] == 0
        end
    end
    if rawget(data , "units2") then
        local units = data.units2
        for i = 1 , #units do
            local unit = units[i]
            local id = (unit.identity-1)*10+unit.pos
            check = check and unit.hp - result.hps2[id] == 0
        end
    end
    local resultEx = self:getExtraResult()
    check = check and resultEx == data.result

    local ret = 1
    local version = "0"
    if not check then
    	local dVersion = data.data_version
    	version = tostring(loadCfg "cfg.version")
    	if version ~= dVersion then
    		ret = 1001
    	else
    		ret = 1000
    	end
    end

    local re = {}
    re.battle_id = data.battle_id
	-- re.check = true -- 暂时不验证了
	re.check = check
    re.is_win = result.isWin
    re.units1 = result.knights1
    re.units2 = result.knights2
    re.ret = ret
    re.data_version = version

    return re
end

function BattleField:getBattleResultByte()
	local result = self:getBattleResult()
	local ProtoBuilder = load "core.proto.ProtoBuilder"
	return ProtoBuilder:encodeByMsgName("BattleResult",result)
end

function BattleField:getAutoResultByte()
	self:setAuto(true)
	self:executeAll({})
	return self:getBattleResultByte()
end

function BattleField:getWave()
	return self._attackIndex[2] - 1
end

function BattleField:setVideoInfo(operations)
	local commands = {}
	for i , v in ipairs(operations) do
		commands[v.attack_count - 1] = v
	end
	self._videoCommands = commands
	self._isVideo = true
end

function BattleField:getNextKnight()
	local knight = self._action:getNextKnight()
	if knight then
		return knight.serialId
	end
end

function BattleField:getActionCount(identity)
	return self._actionCount[identity]
end

function BattleField:getAttackIndex(identity)
	return self._attackIndex[identity]
end

function BattleField:addExtraAction(knight)
	self._action:addExtraAction(knight)
end

function BattleField:hasExtraAction()
	return self._action:hasExtraAction()
end

return BattleField