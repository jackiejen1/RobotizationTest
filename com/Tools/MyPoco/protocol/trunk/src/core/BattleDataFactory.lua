
local math = math
local floor = math.floor

local table = table
local sort = table.sort
local insert = table.insert

local BattleAttr = load "const.BattleAttr"
local Parameters = load("core.Parameters")

local BattleDataFactory = {}

local function createKnights()

	local knights = {
		-- 武将的原始数据，之所以用0来存储，是避免用nil，数组用nil作为占存储会有问题
		-- 这里以10为分界线，1~10位为我方使用，目前上阵的人员为编号1~6，敌方使用11-20，目前上阵的人员编号为11~16
		_raw ={
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	-- 我方，共10位，1~6是目前的阵位，后面是扩展用的
			0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	-- 敌方，共10位，同上
		},
		-- 总战力值
		_totalPower = {0,0},
	}

	knights.ipairs = function(self, identity)
		local knightIndex = 0
		local max = knightIndex + 20
		-- 这里迭代用的控制变量不是从1开始，是从0开始，所以是0和10
		if identity then
			knightIndex = identity == 1 and 0 or 10
			max = knightIndex + 10
		end
		local iter = function(t, i)
			local nextOne = nil
			repeat
				i = i + 1
				nextOne = t._raw[i]
			until nextOne ~= 0
			if not nextOne or i > max then
				return nil, nil
			end
			return i, nextOne
		end
		return iter, self, knightIndex
	end

	knights.getKnightByIdAndPos = function(self, identity, pos)
		local serialId = (identity - 1) * 10 + pos
		return self:getKnightData(serialId)
	end

	knights.setKnightData = function(self, knight, identity)
		
		-- 生成武将的流水id，用来标识战场上唯一的武将，敌我双方是一套体系
		local serialId = (identity - 1) * 10 + knight.originInfo.pos
		knight.serialId = serialId

		self._raw[serialId] = knight
	end

	knights.getKnightData = function(self, serialId)
		local knight = self._raw[serialId]
		return knight ~= 0 and knight or nil
	end

	-- 初始化相关
	knights.getKnightCount = function(self, identity )
		local count = 0
		for i, knight in knights:ipairs(identity) do
			count = count + 1
		end
		return count
	end

	knights.getAliveKnightCount = function(self, identity )
		local count = 0
		for i, knight in knights:ipairs(identity) do
			if not knight.isDead then
				count = count + 1
			end
		end
		return count
	end

	knights.getDeathKnightCount = function(self, identity )
		local count = 0
		for i, knight in knights:ipairs(identity) do
			if knight.isDead then
				count = count + 1
			end
		end
		return count
	end

	knights.clear = function(self,identity)
		for i = 1 , 10 do
			self._raw[(identity-1)*10+i] = 0
		end
	end

	return knights

end

-- 这里实际上是兵符id
local function createComboSkill(id,level)
	
	local skillId = loadCfg("cfg.unite_token_info").get(id).skill_id
	local skillCfg = loadCfg("cfg.skill_info").get(skillId)

	local comboSkill = {
		-- 合击技能数据
		_skillCfg = skillCfg,
		-- 当前冷却剩余回合数，默认为0
		_curCDTime = 0,
		-- 技能等级
		level = level or 0,
	}

	-- 是否准备好了，即冷却回合数为0；次数限制没到，或者没有次数限制
	comboSkill.isReady = function(self)
		return not self:isCooling()
	end

	comboSkill.isCooling = function(self)
		return self._curCDTime > 0
	end

	comboSkill.getCD = function(self)
		return self._curCDTime
	end
	-- 冷却
	comboSkill.calmdown = function(self)
		self._curCDTime = self._skillCfg.extra_cost_value
		return self._curCDTime
	end
	-- 回复
	comboSkill.recover = function(self)
		if self._curCDTime > 0 then
			self._curCDTime = self._curCDTime - 1
			return true
		end
		return false
	end

	comboSkill.getSkillCfg = function(self)
		return self._skillCfg
	end

	return comboSkill

end

local function createComboData(data, inheritData)
	data = data or {}
	local comboData = {
		attrs = {},
		skills = {},
		skillIndex = {},
		skillCount = {}, -- 技能释放次数，用于ai判断
	}
	comboData.baseInfo = comboData.attrs
	comboData.advanceInfo = comboData.attrs

	local attrInfos = {}
	local attrs = data.attrs or {}
	for i, v in ipairs(attrs) do
		attrInfos[v.type] = v.value
	end

	if inheritData then
		attrs = inheritData.attrs
		attrInfos[BattleAttr.INITIAL_COMBO] = attrs.INITIAL_COMBO
	end

	for k , v in pairs(BattleAttr) do
		local attr = attrInfos[v]
		if attr then
			comboData.attrs[k] = attr
		else
			comboData.attrs[k] = 0
		end
	end

	local level = data.level or {}
	if data.tokens then
		for i = 1 , #data.tokens do
			local id = data.tokens[i]
			comboData.skills[id] = comboData.skills[id] or createComboSkill(id,level[i])
			comboData.skillIndex[i] = id
			comboData.skillCount[id] = 0
		end
	end


	-- comboData.getBaseInfo = function(self, name, origin)
	-- 	if name == "totalAtk" then
	-- 		return self:getBaseInfo("COMBO_ATTACK")
	-- 	end
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	if self.attrs[id] then
	-- 		return self.attrs[id]
	-- 	end
	-- 	return 0
	-- end

	-- comboData.setBaseInfo = function(self, name, value)
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	self.attrs[id] = value
	-- end
	
	-- comboData.updateBaseInfo = function(self, name, value)
	-- 	local curValue = self:getBaseInfo(name)
	-- 	local finalValue = curValue + value
	-- 	self:setBaseInfo(name, finalValue)
	-- 	return finalValue
	-- end

	-- comboData.getAdvanceInfo = function(self, name)
	-- 	return self:getBaseInfo(name)
	-- end

	-- 可能会超过上限，返回实际增加的值
	comboData.updateComboValue = function(self, value, check)
		local curValue = self.baseInfo.INITIAL_COMBO
		local maxValue = self.baseInfo.MAXIMUM_COMBO
		value = math.max(value, -curValue )
		value = math.min(value,maxValue - curValue)
		if not check then
			self.baseInfo.INITIAL_COMBO = curValue + value
		end
		return value
	end

	comboData.hasSkill = function(self, id)
		return self.skills[id] ~= nil
	end

	comboData.getSkillLevel = function(self, id)
		if not self.skills[id] then
			return 0
		end
		return self.skills[id].level
	end

	comboData.updateSkills = function(self, attackCount)
		local list = {}
		for skillId, skillInfo in pairs(self.skills) do
			if skillInfo:isCooling() then
				if skillInfo:recover() then
					insert(list,{id=skillId,cd_time=skillInfo:getCD()})
				end
			end
		end
		return list
	end
	
	comboData.useSkill = function(self, skillId)
		local skillInfo = self.skills[skillId]
		if not skillInfo then
			return
		end
		local cdTime = skillInfo:calmdown()
		-- 合击值单独扣
		-- self:updateComboValue(-skillInfo:getSkillCfg().rage_value)

		self.skillCount[skillId] = self.skillCount[skillId] + 1
		return cdTime
	end

	comboData.isSkillReady = function(self, id)
		local skillInfo = self.skills[id]
		if not skillInfo or not skillInfo:isReady() then
			return false
		end
		local skillCfg = skillInfo:getSkillCfg()
		if self.baseInfo.INITIAL_COMBO >= skillCfg.rage_value then
			return true
		end
		return false
	end

	comboData.getAvailableSkills = function( self )
		local idvs = {}
		for i = 1 , #self.skillIndex do
			local skillId = self.skillIndex[i]
			if self:isSkillReady(skillId) then
				idvs[#idvs+1] = {id = skillId,count = self.skillCount[skillId]}
			end
		end
		return idvs
	end
	
	return comboData
end

-- 触发技能序列
-- 有触发技能时会先播放触发技能
local function createPassiveData()
	local passiveData = {
		-- priNum = 3, -- 优先级个数，写死
		-- priList = {1,2,3}, -- 类型对应优先级,写死
		list = {}, -- 技能列表
	}

	-- for i = 1 , passiveData.priNum do
	-- 	passiveData.list[i] = {}
	-- end

	passiveData.push = function(self,skillData)
		-- local pri = self.priList[skillData.info.trigger_type]
		-- local list = self.list[pri]
		local list = self.list
		list[#list+1] = skillData
	end

	passiveData.pop = function(self)
		-- for i = 1 , self.priNum do
		-- 	if #self.list[i] > 0 then
		-- 		return table.remove(self.list[i],1)
		-- 	end
		-- end
		if #self.list > 0 then
			return table.remove(self.list,1)
		end
	end

	passiveData.clear = function(self)
		-- for i = 1 , self.priNum do
		-- 	self.list[i] = {}
		-- end
		self.list = {}
	end

	return passiveData
end

function BattleDataFactory.createBattleData(battleField)
	
	local knights = createKnights()

	-- 战斗数据
	local battleData = {
		-- 武将数据
		_knights = knights,
		-- 是否有前置技能，这里是缓存总的武将是否有前置技能的，默认是有的
		_hasFrontSkill = true,

		-- 双方的合击数据
		_comboData = {},
		-- 双方的战力,可能会影响伤害计算
		_fightValue = {},
		-- 是否pvp
		isPvp = false,
		-- 是否机器人，机器人不算战力
		isRobot = false,
		-- 先出手的一方
		firstAttackId = 0,
		-- 回合结束标记
		_roundFinish = true,
		-- 胜利条件
		_conditionCheck = nil,
		-- 增伤系数
		multiples = {1000,1000},
		-- 双方的被动触发技能
		passiveSkills = {},
		-- 双方的被动触发技能
		spRules = {},
		-- 触发技能序列
		_passiveData = createPassiveData(),
		-- 立即触发技能序列
		_fastPassiveData = createPassiveData(),
		_battleField = battleField,
	}

	-- 武将相关接口
	battleData.getKnights = function(self)
		return self._knights
	end

	battleData.setKnightData = function(self, knight, identity)
		self._knights:setKnightData(knight, identity)
	end

	battleData.getKnightData = function(self, serialId)
		return self._knights:getKnightData(serialId)
	end

	battleData.getKnightList = function(self, identity, includeAll)
		local list = {}
		for i, knight in self._knights:ipairs(identity) do
			if knight:isValid() or includeAll then
				insert(list, knight)
			end
		end
		return list
	end

	battleData.getKnightByIdAndPos = function(self,identity,pos)
		return self._knights:getKnightByIdAndPos(identity,pos)
	end

	-- 合击相关接口
	battleData.initComboData = function ( self, combos,identity )
		self._comboData[identity] = createComboData(combos, self._comboData[identity])
	end

	battleData.getComboInfo = function(self,identity)
		return self._comboData[identity]
	end

	battleData.updateComboValue = function(self, value,identity,check)
		return self._comboData[identity]:updateComboValue(value,check)
	end

	battleData.hasComboSkill = function(self, skillId,identity)
		return self._comboData[identity]:hasSkill(skillId)
	end

	battleData.updateComboSkills = function(self, roundCount)
		local list1 = self._comboData[1]:updateSkills(roundCount)
		local list2 = self._comboData[2]:updateSkills(roundCount)
		local data = {list1,list2}
		return data
	end
	
	battleData.useComboSkill = function(self, skillId,identity)
		return self._comboData[identity]:useSkill(skillId)
	end

	battleData.isComboSkillReady = function(self, skillId,identity)
		return self._comboData[identity]:isSkillReady(skillId)
	end

	battleData.getComboLevel = function(self,skillId,identity)
		return self._comboData[identity]:getSkillLevel(skillId)
	end
	-- 根据上阵武将攻击力计算出合击基础伤害值，等等
	battleData.initComboAddData = function(self, comboName, attrName,identity )
		local count = 0
		local totalAttack = 0
		for i, knight in self._knights:ipairs(identity) do
			count = count + 1
			totalAttack = totalAttack + knight.originInfo[attrName]
		end
		local comboPar = load("core.Parameters").getComboParameter(count)
		local finalValue = math.floor(totalAttack*1000/comboPar)
		self._comboData[identity].baseInfo[comboName] = finalValue
	end

	battleData.initComboAddData2 = function(self, identity )
		local data = self._comboData[identity]
		data.baseInfo.totalAtk = data.baseInfo.COMBO_ATTACK
	end

	battleData.getTotalAttack = function( self , identity )
		local totalAttack  = 0
		for i, knight in self._knights:ipairs(identity) do
			totalAttack = totalAttack + knight.originInfo.ATTACK
		end
		return totalAttack
	end

	battleData.setFightValue = function ( self, fightValue,identity )
		self._fightValue[identity] = fightValue
	end
	battleData.getFightValue = function ( self, identity )
		return self._fightValue[identity]
	end
	
	-- 设置胜利条件
	battleData.setCondition = function( self, id )
		if not id then
			return 
		end
		local battle_rating_info = loadCfg "cfg.battle_rating_info"
        local info = battle_rating_info.get(id)
        if not info then
            return
        end
		local rateType = info.rating_type
		local rateValue = info.rating_value
		if rateType == 4 then
			-- 回合数小于等于x回合
			self._conditionCheck = function( attackRound )
				return attackRound <= rateValue
			end
		elseif rateType == 5 then
			-- 我方死亡人数小于等于x人
			self._conditionCheck = function( attackRound )
				local knights = self._knights
				local count = 0
				for i, knight in knights:ipairs(1) do
					if knight.isDead then
						count = count + 1
					end
				end
				return count <= rateValue
			end
		elseif rateType == 6 then
			-- 我方剩余血量大于等于x%
			self._conditionCheck = function( attackRound )
				local per = self:getHpPer(1)
				return per >= rateValue*10
			end
		elseif rateType == 7 then
			-- 我方坚持x回合
			self._conditionCheck = function( attackRound )
				return attackRound <= rateValue,true
			end
		elseif rateType == 8 then
			-- 5回合内消耗怪物血量x%
			-- 固定100%，先简单处理
			self._conditionCheck = function( attackRound )
				return attackRound <= 5
			end
		elseif rateType == 9 then
			-- 击败所有波次怪物
			self._conditionCheck = function( attackRound )
				return true
			end
		elseif rateType == 10 then
			-- 5回合内获胜
			self._conditionCheck = function( attackRound )
				return attackRound <= rateValue
			end
		end
	end

	battleData.getHpPer = function(self,identity)
		local knights = self._knights
		local chp, thp = 0,0
		for i, knight in knights:ipairs(identity) do
			local curHp = knight.baseInfo.INITIAL_HP
			local totalHp = knight.originInfo.INITIAL_HP
			chp = chp + curHp
			thp = thp + totalHp
		end
		return math.floor(chp*1000/thp)
	end

	battleData.setMultiple = function(self,identity,mult)
		if not mult then
			return
		end
		self.multiples[identity] = mult + 1000
	end

	battleData.isGameOver = function(self, attackRound)
		
		local knights = self._knights
		local isAttackerAllDead, isDefenderAllDead = true, true
		for i, knight in knights:ipairs(1) do
			isAttackerAllDead = isAttackerAllDead and not knight:isValid()
		end
		for i, knight in knights:ipairs(2) do
			isDefenderAllDead = isDefenderAllDead and not knight:isValid()
		end
		local isGameOver = isAttackerAllDead or isDefenderAllDead
		if isGameOver then
			return isGameOver, isAttackerAllDead and 2 or 1
		end

		local maxRound = Parameters.ROUND_MAX
		if attackRound > maxRound then
			return true, 2
		end

		if self._conditionCheck then
			local check,reverse = self._conditionCheck(attackRound)
			if not check then
				local winner = reverse and 1 or 2
				return true, winner
			end
		end
		
		return isGameOver, isAttackerAllDead and 2 or 1
	end

	-- 判断先手方
	battleData.getHighIdentity = function(self) 
		if self.isPvp then
			local power1 = self:getFightValue(1)
			local power2 = self:getFightValue(2)
			return power1 >= power2 and 1 or 2
		else
			return 1
		end
	end

	battleData.setRoundFinish = function (self, finish )
		self._roundFinish = finish
	end

	battleData.getRoundFinish = function (self )
		return self._roundFinish
	end

	-- 获取全体武将血量数据，用于结果比对
	battleData.packKnightData = function ( self,identity )
		local result = {}
		local fullResult = {}
		for i, knight in knights:ipairs(identity) do
			result[i] = knight.baseInfo.INITIAL_HP
			local fullR = {}
			fullR.identity = knight.identity
			fullR.pos = knight.serialId%10
			fullR.hp = result[i]
			insert(fullResult,fullR)
		end
		return result,fullResult
	end

	battleData.clear = function (self,identity)
		self._knights:clear(identity)
		self._passiveData:clear()
		self._fastPassiveData:clear()
	end

	battleData.setPassiveSkills = function (self,identity,skills)

		self.passiveSkills[identity] = skills

		-- 技能规则初始化
		local SkillSpecialRule = load "core.rule.SkillSpecialRule"
		-- 被动触发类技能效果
		battleData.spRules[identity] = SkillSpecialRule.initRule(skills,identity,self._battleField)

	end

	battleData.excuteSpRule = function( self, mode , data )
		for identity = 1 , 2 do
			if battleData.spRules[identity] and battleData.spRules[identity][mode] then
				for i , skill in ipairs(battleData.spRules[identity][mode]) do
					if skill:check(data) and skill:excute() then
						if skill.info.passive_skill_type == 3 then
							-- 属性类，目前以buff的形式来实现
							-- 会有个问题，后上场的吃不到这个buff，这个目前不影响，以后再解决
							battleField:getBattleData():addFastPassive({identity=identity,info=skill.info,check=skill})
						elseif skill.info.passive_skill_type == 1 and skill.info.if_merge == 1 then
							battleField:getBattleData():addFastPassive({identity=identity,info=skill.info})
						else
							battleField:getBattleData():addPassive({identity=identity,info=skill.info})
						end
					end
				end
			end
		end
	end

	battleData.getPassiveSkills = function (self,identity)
		return self.passiveSkills[identity]
	end

	battleData.addPassive = function (self,skillData)
		self._passiveData:push(skillData)
	end

	battleData.getNextPassive = function (self)
		return self._passiveData:pop()
	end

	battleData.addFastPassive = function (self,skillData)
		self._fastPassiveData:push(skillData)
	end

	battleData.getNextFastPassive = function (self)
		return self._fastPassiveData:pop()
	end

	battleData.setAssist = function( self,id )
		if not id then
			return
		end

		local assInfo = loadCfg("cfg.battle_assistance_info").get(id)
		if not assInfo then
			return
		end

		local knights = {}
		for i = 1 , 3 do
			local knight = self:getKnightByIdAndPos(assInfo.npc_type,assInfo["npc_position_"..i])
			if knight then
				knight.willAssist = true
			end
			knights[#knights+1] = knight
		end

		self.assistCheck = function(self, identity, trigger_type,trigger_value )
			if assInfo.wave == self._battleField:getWave()+1 and assInfo.npc_type == identity then
				local SkillSpecialRule = load "core.rule.SkillSpecialRule"
				local checkFunc = SkillSpecialRule.getCheckFunc(assInfo.trigger_type,self._battleField,identity)
				if checkFunc({info=assInfo},trigger_value) then
					local assist = false
					for i = 1 , #knights do
						local knight = knights[i]
						if knight.willAssist then
							knights[i].willAssist = false
							if assInfo.if_attack_immediately == 1 then
								knights[i].assisting = true
							end
							assist = true
						end
					end
					if assist then
						return knights,assInfo
					end
				end
			end
		end
	end

	return battleData

end

return BattleDataFactory