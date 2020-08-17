
local tostring = tostring

local table = table
local remove = table.remove
local sort = table.sort
local insert = table.insert

local math = math
local max = math.max
local min = math.min
local floor = math.floor

local BattleAttr = load "const.BattleAttr"
local BattleAttrRe = load "const.BattleAttrRe"
local FightComponent = load "core.fight.FightComponent"
local KnightTable = load "core.knight.KnightTable"
local Parameters = load "core.Parameters"
local BuffRule = load "core.rule.BuffRule"
local passive_skill_info = loadCfg "cfg.passive_skill_info"
local skill_info = loadCfg "cfg.skill_info"
local skill_mark_info = loadCfg("cfg.skill_mark_info")


local KnightFactory = {}

local createKnightBuff = nil
createKnightBuff = function (buffId, buffSerialId, buffTime, victim, attacker,buffCheck, battleField)
	local buffCfg = loadCfg("cfg.buff_info").get(buffId)

	local buff = {
		-- buffCfg
		buffCfg = buffCfg,
		-- serialId
		serialId = buffSerialId,
		-- buff持续回合数
		buffTime = buffTime,
		-- 当前武将
		victim = victim,
		-- 释放者
		attacker = attacker,
		-- 执行规则
		rule = nil,
		isDone = false,
		buffCheckSkill = buffCheck,
		buffDisappearCheck = 0,
		-- 绑定的被动技能序号
		passive_skill_serial_id = 0,
		-- buff消失参数
		disappearValue1 = 0,
		-- 导出参数，外部访问buff内部参数
		exports = {},
		-- 附属buff效果
		subBuffs = {},
	}
	buff.buffDisappearCheck = buff.buffCfg.buff_disappear_value1
	-- 设定buff消失参数
	if buffCfg.buff_disappear == BuffRule.DISAPPEAR.DAMAGE then
		buff.disappearValue1 = floor(victim.originInfo.INITIAL_HP * buffCfg.buff_disappear_value1 / 1000)
	end
	-- buff绑定被动
	if buffCfg.buff_type == BuffRule.TYPE.PASSIVE_SKILL then
		local passiveSkill = victim:addPassiveSkill(buffCfg.buff_value_1)
		buff.passive_skill_serial_id = passiveSkill.serialId
	end
	-- 绑定附属的buff效果
	if buffCfg.sub_buff_id > 0 then
		local subBuff = createKnightBuff(buffCfg.sub_buff_id, 0, buffTime, victim, attacker,buffCheck, battleField)
		insert(buff.subBuffs, subBuff)
	end

	-- 回合数减一
	buff.doRound = function(self, mode)
		if mode == self.buffCfg.buff_open_type then
			self.buffTime = self.buffTime - 1
			if self.buffTime == 0 then
				self.isDone = true
			end
		end
	end

	buff.doSpRound = function(self, mode,bfType)
		if mode == self.buffCfg.buff_open_type and bfType == self.buffCfg.buff_type then
			self.buffTime = self.buffTime - 1
			if self.buffTime == 0 then
				self.isDone = true
			end
		end
	end
	
	local BuffRule = load "core.rule.BuffRule"
	buff.rule = BuffRule.initRule(buff, battleField)

	-- 执行buff效果
	buff.excute = function ( self , mode , data )
		local affect = false
		local isMainAffect = false	-- 主效果是否生效
		if type(self.rule) == "table" then
			if self.rule[mode] then
				if not self.buffCheckSkill or self.buffCheckSkill:check() then
					local tempAffect, tempData = self.rule[mode](data)
					if tempAffect then
						affect, data = true, tempData
					end
				end
			end
		elseif mode == self.buffCfg.buff_type then
			if not self.buffCheckSkill or self.buffCheckSkill:check() then
				local tempAffect, tempData = self.rule(data)
				if tempAffect then
					affect, data = true, tempData
				end
			end
		end
		isMainAffect = affect
		-- 附属buff效果
		for i, subBuff in ipairs(buff.subBuffs) do
			if type(subBuff.rule) == "table" then
				if subBuff.rule[mode] then
					if not subBuff.buffCheckSkill or subBuff.buffCheckSkill:check() then
						local tempAffect, tempData = subBuff.rule[mode](data)
						if tempAffect then
							affect, data = true, tempData
						end
					end
				end
			elseif mode == subBuff.buffCfg.buff_type then
				if not subBuff.buffCheckSkill or subBuff.buffCheckSkill:check() then
					local tempAffect, tempData = subBuff.rule(data)
					if tempAffect then
						affect, data = true, tempData
					end
				end
			end
		end

		return affect, data, isMainAffect
	end

	buff.checkDisappear = function(self, mode, data)
		if mode == self.buffCfg.buff_disappear then
			if mode == BuffRule.DISAPPEAR.AFFECT then
				-- 生效X次消失
				self.buffDisappearCheck = self.buffDisappearCheck - 1
				if self.buffDisappearCheck <= 0 then
					self.isDone = true
				end
			elseif mode == BuffRule.DISAPPEAR.DEAD then
				-- 发起者死亡
				if self.attacker.serialId == data then
					self.isDone = true
				end
			elseif mode == BuffRule.DISAPPEAR.SHIELD then
				-- 护盾消失
				self.isDone = true
			elseif mode == BuffRule.DISAPPEAR.DAMAGE then
				-- 受到一定的生命百分比伤害后
				self.disappearValue1 = self.disappearValue1 - data
				if self.disappearValue1 <= 0 then
					self.isDone =  true
				end
			end
		elseif mode == BuffRule.DISAPPEAR.AFFECT and self.buffCfg.buff_disappear == BuffRule.DISAPPEAR.AFFECT_ROUND then
			-- 生效后一回合消失，特殊做
			self.buffTime = 1
		end
	end

	return buff

end

-- 创建标记，不会自动消失
-- 可能会影响属性，标记达到上限可能会触发技能
local function createKnightMark(markId, attacker)
	
	local markCfg = skill_mark_info.get(markId)
	local mark = {
		id = markId,
		-- markCfg
		markCfg = markCfg,
		-- 释放者
		attacker = attacker,
		-- 层数
		level = 0,
		-- 最大层数
		maxLevel = markCfg.max_num,
		-- 类型
		mType = markCfg.type,
	}


	-- 执行属性效果
	mark.excute = function ( self )
		if self.level > 0 then
			for i = 1 , 3 do
				local effectType = markCfg["type_"..i]
				if effectType > 0 then
					local attrType = BuffRule.buffAttr[effectType]
					local attrName = BattleAttrRe[attrType]
					local value = self.attacker.advanceInfo[attrName]
					local rate = markCfg.increase_type == 1 and 1 or -1
					value = value + markCfg["value_"..i]*rate*self.level
					self.attacker.advanceInfo[attrName] = value
				end
			end
		end
	end

	mark.addLevel = function ( self ,id, level )
		self.level = self.level + level
		if id > self.id then
			self.id = id
			self.markCfg = skill_mark_info.get(id)
		end
		if self.level >= self.maxLevel then
			self.level = self.maxLevel
			if self.markCfg.skill_info_id > 0 then
				local info = skill_info.get(self.markCfg.skill_info_id)
				self.attacker.battleField:getBattleData():addFastPassive({knight=self.attacker,info=info,isSkill=true})
			end
		end
	end

	mark.delLevel = function ( self,level )
		self.level = max(self.level - level , 0)
	end

	mark.clear = function ( self )
		self.level = 0
	end

	return mark

end

-- 额外的被动技能
local function createPassiveSkill(id, serialId, identity, battleField, knight)
	local SkillSpecialRule = load "core.rule.SkillSpecialRule"
	local passiveSkill = {
		serialId = serialId,
		rules = SkillSpecialRule.initRule({id}, identity, battleField, knight),
	}

	return passiveSkill
end

--[[
	武将的所有被动技能和buff按照触发时机分类
	1，伤害治疗buff， buff_info type = 1
	2, 行动限制buff, buff_info type = 3
	3, 影响技能选定， buff_info type = 4
	4, 影响怒气消耗和回复， buff_info type = 5
	5, 结算前攻击者需要结算的buff和技能
	6, 结算前受击者需要结算的buff和技能
	7，结算时攻击者需要结算的buff和技能
	8，结算时受击者需要结算的buff和技能
	9，结算后受击者需要结算的buff和技能
	10，结算后攻击者需要结算的buff和技能
	11，阵亡时触发的技能 passive_skill_info type = 8
]]

function KnightFactory.createKnight(knightData, identity,isMonster,user,battleField)

	local knight = {
		-- 武将基础数据，外面传进来的
		originInfo = {},
		-- 新的武将基础数据，用于更新基础数据值得，单独保存，默认访问新的武将基础数据，如果没有则找老的数据
		baseInfo = {},
		-- 计算buff和被动后的属性，用于计算
		advanceInfo = {},
		-- 身份标识，1为我方，2为敌方
		identity = identity,
		opIdentity = 3 - identity, -- 对立方身份
		-- 是否死亡
		isDead = false,
		-- 系统id，武将创建时被分配的系统id
		serialId = 0,
		-- 武将表数据
		knightCfg = nil,
		-- 普攻和技能表数据
		commonSkillCfg = nil,
		activeSkillCfg = nil,
		energySkillCfg = nil,
		-- 技能规则
		-- 这里只算被动技能的规则
		spRules = nil,
		-- _seRules = nil,
		-- _spAttrRules = nil,
		-- buff
		buffs = {},
		-- 攻击倍数,千分比
		multiple = 1000,
		--被动技能列表
		skills = {},
		--额外的被动技能
		extraSkills = {},
		-- 技能使用次数
		skillTimes = {},
		-- 技能效果生效次数
		skillAffectTimes = {},
		isPlayer = false,
		willAssist = false, -- 将会助战，暂时不上阵
		assisting = false, -- 助战额外出手的标记
		baseData = knightData,
		user = user,
		isMonster = isMonster,
		isLock = false, -- 锁血标记，被锁血的不会掉血也不会死亡
		isLockEnergy = false, -- 必杀技次数用尽，锁必杀能量
		isGhost = false,	-- 是否是幽灵状态

		marks = {}, -- 标记
		exile = false, -- 放逐
		battleField = battleField,
	}

	local attrInfos = {}
	for i, v in ipairs(knightData.attrs) do
		attrInfos[v.type] = v.value
	end
	for k , v in pairs(BattleAttr) do
		local attr = attrInfos[v]
		if attr then
			knight.originInfo[k] = attr
		else
			knight.originInfo[k] = 0
		end
	end

	knight.originInfo.pos = knightData.pos
	knight.originInfo.id = knightData.id
	knight.originInfo.skill_level1 = knightData.skill_level1 or 0
	knight.originInfo.skill_level2 = knightData.skill_level2 or 0
	knight.skills = knightData.skills or {}

	if knightData.multiple then
		knight.multiple = knightData.multiple + 1000
	end

	knight.getHpRate = function(self)
		local curHp = self.baseInfo.INITIAL_HP
		local totalHp = self.originInfo.BATTLE_HP
		return math.floor(curHp*1000/totalHp)
	end

	knight.getTotalDef = function(self)
		local pDef = self.advanceInfo.PHY_DEFENCE
		local mDef = self.advanceInfo.MAG_DEFENCE
		local pDefPct = self.advanceInfo.PHY_DEFENCE_PCT + self.advanceInfo.DEFENCE_PCT
		local mDefPct = self.advanceInfo.MAG_DEFENCE_PCT + self.advanceInfo.DEFENCE_PCT
		return math.floor((pDef*(1000+pDefPct)+mDef*(1000+mDefPct))/1000)
	end

	knight.getTotalAtk = function(self)
		local atk = self.advanceInfo.ATTACK
		local atkPct = self.advanceInfo.ATTACK_PCT
		return math.floor(atk*(1000+atkPct)/1000)
	end

	-- knight.originInfo.hpRate = knight.getHpRate
	-- knight.originInfo.totalDef = knight.getTotalDef
	-- knight.originInfo.totalAtk = knight.getTotalAtk
	setmetatable(knight.originInfo,{__index = function(tb,key)
			if key == "hpRate" then
				return knight:getHpRate()
			elseif key == "totalDef" then
				return knight:getTotalDef()
			elseif key == "totalAtk" then
				return knight:getTotalAtk()
			end
		end})

	setmetatable(knight.baseInfo,{__index = knight.originInfo})
	setmetatable(knight.advanceInfo,{__index = knight.baseInfo})

	-- knight.getBaseInfo = function(self, name, origin)
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	if not origin then
	-- 		local value = self._newBaseInfo[id]
	-- 		if value ~= nil then
	-- 			return value
	-- 		end
	-- 	end
	-- 	if self._baseInfo[id] then
	-- 		if type(self._baseInfo[id]) == "function" then
	-- 			return self._baseInfo[id](self)
	-- 		else
	-- 			return self._baseInfo[id]
	-- 		end
	-- 	end
	-- 	return 0
	-- end

	-- knight.setBaseInfo = function(self, name, value,origin)
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	if origin then
	-- 		self._baseInfo[id] = value
	-- 	else
	-- 		self._newBaseInfo[id] = value
	-- 	end
	-- end

	-- knight.updateBaseInfo = function(self, name, value)
	-- 	local curValue = self:getBaseInfo(name)
	-- 	local finalValue = curValue + value
	-- 	self:setBaseInfo(name, finalValue)
	-- 	return finalValue
	-- end

	-- knight.setAdvanceInfo = function(self, name, value)
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	self._advanceInfo[id] = value
	-- end

	-- knight.getAdvanceInfo = function(self, name)
	-- 	local id = BattleAttr[name]
	-- 	id = id or name
	-- 	if self._advanceInfo[id] then
	-- 		return self._advanceInfo[id]
	-- 	end
	-- 	return self:getBaseInfo(name)
	-- end

	knight.clearAdvanceInfo = function(self)
		local info = {}
		setmetatable(info,{__index = self.baseInfo})
		self.advanceInfo = info
	end

	knight.baseInfo.INITIAL_HP = knight.baseInfo.BATTLE_HP -- 设置当前血量
	if knight.baseInfo.BATTLE_HP == 0 then
		knight.isDead = true
	end

	-- 表数据相关方法
	local infoName = isMonster and "monster_info" or "knight_info"
	local knight_info = loadCfg("cfg."..infoName)
	local skill_info = loadCfg "cfg.skill_info"
	
    local knightCfg = knight_info.get(knightData.id)
    assert(knightCfg, "Cant find " .. infoName .. " id :"  .. knightData.id)
	
	knightCfg = knightCfg.toObject()
	knight.knightCfg = knightCfg

	local energyRuleList = {}
	local getEnergyRuleList = function (knightCfg)
		local list = {}
		local idx = 1
		while knight_info.hasKey("energy_type_" .. idx) do
			local rtype, value = knightCfg["energy_type_"..idx], knightCfg["energy_value_"..idx]
			if rtype > 0 then
				insert(list, {
					type = rtype,
					value = value,
				})
			end
			idx = idx + 1
		end
		return list
	end

	local commonSkillId = knightCfg.common_id
	local activeSkillId = knightCfg.active_skill_id
	local energySkillId = knightCfg.energy_skill_id
	local passiveSkillId = knightCfg.passive_skill
	local initialEnergy = knightCfg.initial_energy
	energyRuleList = getEnergyRuleList(knightCfg)
	if not isMonster and knightCfg.type == 1 and user then
		-- 是主角
		if knightData.common_skill_id and knightData.common_skill_id > 0 
			and knightData.active_skill_id and knightData.active_skill_id > 0 then
			commonSkillId = knightData.common_skill_id
            activeSkillId = knightData.active_skill_id
		end
		-- 如有变化需要后端传，TODO 紫金时装策划还没做
		if knightData.energy_skill_id then
			energySkillId = knightData.energy_skill_id
		end
		if knightData.cardId and knightData.cardId > 0 then
			-- 化身武将被动技能
			local transformation_card_info = loadCfg "cfg.transformation_card_info"
			local transformCardCfg = transformation_card_info.get(knightData.cardId)
			local dressNum = knightData.dress_num or 0
			local star = transformCardCfg.original_star
			local index = 1
			while transformation_card_info.hasKey("dress_num_"..index) do
				if transformCardCfg["dress_num_"..index] > 0 then
					if dressNum >= transformCardCfg["dress_num_"..index] then
						star = transformCardCfg["skill_star_"..index]
					end
				end
				index = index + 1
			end

			local advanceId = transformCardCfg.advance_id
			local knightCfg = KnightTable.getKnightByAdvIdStar(advanceId, star)
			if knightCfg then
				passiveSkillId = knightCfg.passive_skill
				initialEnergy = knightCfg.initial_energy
				energyRuleList = getEnergyRuleList(knightCfg)
			end
		end
    end
	if isMonster then
		knight.isLock = knightCfg.if_lock == 1
	end
	
	-- knight.commonSkillCfg = skill_info.get(commonSkillId).toObject()
	-- knight.activeSkillCfg = skill_info.get(activeSkillId).toObject()

	knight.commonSkillCfg = skill_info.get(commonSkillId)
	assert(knight.commonSkillCfg, "Could not find skill_info with id: "..tostring(commonSkillId))
	knight.commonSkillCfg = knight.commonSkillCfg.toObject()

	knight.activeSkillCfg = skill_info.get(activeSkillId)
	assert(knight.activeSkillCfg, "Could not find skill_info with id: "..tostring(activeSkillId))
	knight.activeSkillCfg = knight.activeSkillCfg.toObject()

	if energySkillId and energySkillId > 0 then
		knight.energySkillCfg = skill_info.get(energySkillId)
		assert(knight.energySkillCfg, "Could not find skill_info with id: "..tostring(energySkillId))
	end

	if passiveSkillId > 0 then
		knight.skills = clone(knight.skills)
		knight.skills[#knight.skills + 1] = passiveSkillId
	end
	-- 初始必杀能量
	knight.originInfo.INITIAL_ENERGY = initialEnergy

	-- 技能规则初始化，绑定在武将身上
	local SkillSpecialRule = load "core.rule.SkillSpecialRule"
	-- 被动触发类技能效果
	knight.spRules = SkillSpecialRule.initRule(knight.skills,knight.identity,battleField,knight)

	knight.excuteSpRule = function( self, mode , data, spType, spData)
		local spList = {}
		local skills = {}
		if knight.spRules[mode] then
			for i, skill in ipairs(knight.spRules[mode]) do
				insert(skills, skill)
			end
		end
		if knight.extraSkills then
			for i, v in ipairs(knight.extraSkills) do
				if v.rules[mode] then
					insert(skills, v.rules[mode][1])
				end
			end
		end
		if skills then
			for i , skill in ipairs(skills) do
				local passive_skill_type = skill.info.passive_skill_type
				-- spType存在就指定类型4的被动
				if spType and passive_skill_type == 4 or (passive_skill_type ~= 4 and not spType) then
					if skill:check(data) and skill:excute() then
						if passive_skill_type == 3 then
							-- 属性类，目前以buff的形式来实现
							-- 会有个问题，后上场的吃不到这个buff，这个目前不影响，以后再解决
							battleField:getBattleData():addFastPassive({knight=knight,info=skill.info,check=skill})
						elseif passive_skill_type == 1 and skill.info.if_merge == 1 then
							battleField:getBattleData():addFastPassive({knight=knight,info=skill.info})
						elseif passive_skill_type == 1 or passive_skill_type == 2 then
							battleField:getBattleData():addPassive({knight=knight,info=skill.info})
						elseif passive_skill_type == 4 then
							-- 被动特殊效果
							if skill.spEffectInfo.special_skill_type == spType then
								spData = skill.spEffectRule(spData)
								insert(spList, skill.spEffectInfo.id)
							end
						end
					end
				end
			end
		end
		if battleField:getBattleData().assistCheck then
			local knights,assInfo = battleField:getBattleData():assistCheck(knight.identity,mode,data)
			if knights then
				battleField:getBattleData():addPassive({knight=knights,assist=true,info=assInfo})
			end
		end
		return spData, spList
	end

	-- 额外的被动技能
	local passiveSkillSerialId = 1
	knight.addPassiveSkill = function (self, id)
		local passiveSkill = createPassiveSkill(id, passiveSkillSerialId, knight.identity, battleField, knight)
		insert(self.extraSkills, passiveSkill)
		passiveSkillSerialId = passiveSkillSerialId + 1
		return passiveSkill
	end

	knight.removePassiveSkill = function (self, serialId)
		for i, v in ipairs(self.extraSkills) do
			if v.serialId == serialId then
				remove(self.extraSkills, i)
				return
			end
		end
	end

	knight.clearPassiveSkill = function (self)
		self.extraSkills = {}
	end

	-- 必杀技
	local EnergyRule = load "core.rule.EnergyRule"
	knight.energyRules = EnergyRule.initRule(knight, energyRuleList)
	knight.excuteEnergyRule = function (self, mode, data)
		if knight.isLockEnergy then
			return
		end
		if knight.energyRules[mode] then
			for i, rule in ipairs(knight.energyRules[mode]) do
				if rule:check(data) then
					rule:execute()
				end
			end
		end
	end

	knight.addEnergyEffect = function (self, value)
		battleField:getBattleData():addEnergyEffect(self, value)
	end

	knight.getEnergySkillLeftTimes = function (self)
		local leftTimes = 999
		local energySkillCfg = self.energySkillCfg
		if energySkillCfg then
			-- 判断释放次数
			local limit = energySkillCfg.skill_limit
			if limit > 0 then
				local times = self:getSkillTimes(energySkillCfg.id)
				leftTimes = math.max(0, limit - times)
			end
		end
		return leftTimes
	end

	knight.canReleaseEnergySkill = function (self)
		local energySkillCfg = self.energySkillCfg
		-- 判断变身
		local transformData = self:doBuff(BuffRule.TYPE.TRANSFORM, {})
		if next(transformData) then
			energySkillCfg = transformData.energySkillCfg
		end
		if energySkillCfg then
			-- 判断释放次数
			local limit = energySkillCfg.skill_limit
			if limit > 0 then
				local times = self:getSkillTimes(energySkillCfg.id)
				if times >= limit then
					return false
				end
			end
			-- 当前必杀技能量值 >= 消耗
			if energySkillCfg.rage_type == 5 and self.baseInfo.INITIAL_ENERGY >= energySkillCfg.rage_value then
				return true
			end
		end
		return false
	end

	knight.canReleaseActiveSkill = function(self)
		local activeSkillCfg = self.activeSkillCfg
		-- 根据类型选择，这里只考虑技能
		local skillType = activeSkillCfg.skill_type
		-- 判断怒气
		local value = self.baseInfo.INITIAL_ANGER
		local activeValue = activeSkillCfg.rage_value
		-- 可能会有额外消耗
		local extraCost = self:doBuff(BuffRule.TYPE.EXTRA_ANGER_COST, 0)
		if value >= activeValue + extraCost then
			return true
		end
		return false
	end

	-- buff相关
	local buffSerialId = 1

	knight.addBuff = function(self, buffId, buffTime, attacker,buffCheck)
		if buffCheck then
			-- 有检查，认为是被动触发的
			-- 已添加了则不重复加
			for i , v in ipairs(self.buffs) do
				if v.buffCfg.id == buffId then
					return
				end
			end
		end
		local buff = createKnightBuff(buffId, buffSerialId, buffTime, self, attacker,buffCheck,battleField)
		buffSerialId = buffSerialId + 1
		self.buffs[#self.buffs + 1] = buff

		-- 新增buff时，检查放逐状态
		local info = loadCfg("cfg.buff_info").get(buffId)
		self.exile = self:doBuff(BuffRule.TYPE.EXILE)

		return buff.serialId
	end

	knight.clearBuff = function(self)
		local pBuffs = {}
		for i , v in ipairs(self.buffs) do
			if v.buffCheck then
				table.insert(pBuffs,#pBuffs+1,v)
			else
				-- 移除绑定的被动
				if v.passive_skill_serial_id > 0 then
					v.victim:removePassiveSkill(v.passive_skill_serial_id)
				end
			end
		end
		self.buffs = pBuffs
		buffSerialId = 1

		-- 移除buff时，检查放逐状态
		self.exile = self:doBuff(BuffRule.TYPE.EXILE)
	end

	knight.delBuff = function(self, serialId)
		local target = nil
		for i, buff in ipairs(self.buffs) do
			if buff.serialId == serialId then
				target = buff
				remove(self.buffs, i)
				break
			end
		end

		-- 移除buff时，检查放逐状态
		self.exile = self:doBuff(BuffRule.TYPE.EXILE)
		return target
	end

	-- 执行buff效果
	-- mode 生效时机
	-- data 输入的数据
	knight.doBuff = function( self , mode, data )
		local affect = false
		for i = 1, #self.buffs do
			local buff = self.buffs[i]
			affect, ret, isMainAffect = buff:excute(mode,data)
			if affect then
				data = ret
			end
			-- 主buff效果生效，才算消失规则次数
			if isMainAffect then
				buff:checkDisappear(BuffRule.DISAPPEAR.AFFECT)
			end
			
		end
		-- 插入标记的影响
		if mode == BuffRule.TYPE.ATTR and #self.marks > 0 then
			for i , mark in ipairs(self.marks) do
				mark:excute()
			end
		end
		return data
	end

	knight.doBuffRound = function( self , mode )
		local list = {}
		local removeIndex = {}
		for i = 1 , #self.buffs do
			local buff = self.buffs[i]
			buff:doRound(mode)
			if buff.isDone then
				insert(list,buff)
				insert(removeIndex,1,i)
				-- 移除绑定的被动
				if buff.passive_skill_serial_id > 0 then
					buff.victim:removePassiveSkill(buff.passive_skill_serial_id)
				end
			end
		end
		for i = 1 , #removeIndex do
			remove(self.buffs,removeIndex[i])
		end
		-- 移除buff时，检查放逐状态
		self.exile = self:doBuff(BuffRule.TYPE.EXILE)
		return list
	end

	knight.doSpBuffRound = function( self, mode,bfType )
		local list = {}
		local removeIndex = {}
		for i = 1 , #self.buffs do
			local buff = self.buffs[i]
			buff:doSpRound(mode,bfType)
			if buff.isDone then
				insert(list,buff)
				insert(removeIndex,1,i)
				-- 移除绑定的被动
				if buff.passive_skill_serial_id > 0 then
					buff.victim:removePassiveSkill(buff.passive_skill_serial_id)
				end
			end
		end
		for i = 1 , #removeIndex do
			remove(self.buffs,removeIndex[i])
		end
		-- 移除buff时，检查放逐状态
		self.exile = self:doBuff(BuffRule.TYPE.EXILE)
		return list
	end

	knight.checkBuffDisappear = function( self , mode, data)
		for i , buff in ipairs(self.buffs) do
			buff:checkDisappear(mode, data)
		end
	end

	-- 清除某一类型的所有buff
	-- buffType buff类型
	knight.delBuffByType = function (self, buffType)
		for i = #self.buffs, 1, -1 do
			local buff = self.buffs[i]
			if buff.buffCfg.buff_type == buffType then
				remove(self.buffs, i)
			end
		end
		-- 移除buff时，检查放逐状态
		self.exile = self:doBuff(BuffRule.EXILE)
	end

	knight.hasBuffByEffectType = function (self, effectType)
		for i = #self.buffs, 1, -1 do
			local buff = self.buffs[i]
			if buff.buffCfg.buff_effect_type == effectType then
				return true
			end
		end
		return false
	end

	knight.getBuffCntByEffectType = function (self, effectType)
		local cnt = 0
		for i = #self.buffs, 1, -1 do
			local buff = self.buffs[i]
			if buff.buffCfg.buff_effect_type == effectType then
				cnt = cnt + 1
			end
		end
		return cnt
	end

	knight.getBuffs = function (self)
		return self.buffs
	end

	-- 武将变身，变成另一个武将，属性变化
	-- 对应 skill_image_info
	knight.transform = function(self,info)
		-- 技能改变
		local knight_info = loadCfg("cfg.knight_info")
		local skill_info = loadCfg "cfg.skill_info"
		
		self.originInfo.id = info.image_knight_id
		local knightCfg = knight_info.get(info.image_knight_id).toObject()
		self.knightCfg = knightCfg
		self.commonSkillCfg = skill_info.get(knightCfg.common_id).toObject()
		self.activeSkillCfg = skill_info.get(knightCfg.active_skill_id).toObject()
		self.energySkillCfg = nil
		if knightCfg.energy_skill_id > 0 then
			self.energySkillCfg = skill_info.get(knightCfg.energy_skill_id).toObject()
		end

		if info.image_type == 1 then
			-- 变身
			-- 需要先删掉之前的被动
			if knightCfg.passive_skill > 0 then
				self.skills[#self.skills] = knightCfg.passive_skill
			else
				self.skills[#self.skills] = nil
			end
		else
			-- 召唤
			if knightCfg.passive_skill > 0 then
				self.skills = {knightCfg.passive_skill}
			else
				self.skills = {}
			end
			self:clearBuff()
			self:clearPassiveSkill()
		end
		self.spRules = SkillSpecialRule.initRule(self,battleField)

		-- 属性改变
		if info.hp_inherit_type == 1 then
			local hp = math.floor(self.baseInfo.INITIAL_HP*info.hp_inherit_num/1000)
			hp = math.min(hp,self.originInfo.INITIAL_HP)
			self.baseInfo.INITIAL_HP = hp
		else
			local hp = math.floor(self.originInfo.INITIAL_HP*info.hp_inherit_num/1000)
			self.originInfo.INITIAL_HP = hp
			self.baseInfo.INITIAL_HP = hp
		end

		self.baseInfo.ATTACK = math.floor(self.baseInfo.ATTACK*info.attack_inherit_num/1000)
		self.baseInfo.PHY_DEFENCE = math.floor(self.baseInfo.PHY_DEFENCE*info.defence_inherit_num/1000)
		self.baseInfo.MAG_DEFENCE = math.floor(self.baseInfo.MAG_DEFENCE*info.defence_inherit_num/1000)

		if info.other_attributes_inherit_num ~= 1000 then
			for k , v in pairs(BattleAttr) do
				if (v > 100 and v < 600) then
					self.baseInfo[k] = math.floor(self.baseInfo[k]*info.other_attributes_inherit_num/1000)
				end
			end
		end

		for i = 1 , 4 do
			local affectType = info["affect_type_"..i]
			if affectType > 0 then
				local attr = BattleAttrRe[affectType]
				if affectType == 1 then
					self.originInfo[attr] = self.originInfo[attr] + info["affect_value_"..i]
				end
				self.baseInfo[attr] = self.baseInfo[attr] + info["affect_value_"..i]
			end
		end
	end

	knight.isReal = function ( self )
		return not self.isDead and not self.willAssist or self.isGhost
	end

	knight.isValid = function ( self )
		return self:isReal()
	end

	knight.canAction = function (self)
		return not self.isDead and not self.willAssist and not self.isGhost
	end

	knight.exitExile = function (self)
		-- 无其余存活时 需要退出放逐状态
		local dBuff = nil
		for i, buff in ipairs(self.buffs) do
			if buff.buffCfg.buff_type == BuffRule.TYPE.EXILE then
				dBuff = self:delBuff(buff.serialId)
				break
			end
		end

		return dBuff
	end

	knight.addSkillTimes = function (self, skillId, times)
		if not self.skillTimes[skillId] then
			self.skillTimes[skillId] = 0
		end
		times = times or 1
		self.skillTimes[skillId] = self.skillTimes[skillId] + times
	end

	knight.getSkillTimes = function (self, skillId)
		return self.skillTimes[skillId] or 0
	end

	knight.doDead = function (self)
		self.isDead = true
		if self.isMonster and self.knightCfg.if_ghost == 1 then
			self.isGhost = true
		end
	end

	knight.addMark = function ( self,id,num )
		local mark = nil
		local markCfg = skill_mark_info.get(id)
		for i , v in ipairs(self.marks) do
			if v.mType == markCfg.type then
				mark = v
			end
		end
		if mark then
			mark:addLevel(id,num)
		else
			mark = createKnightMark(id,self)
			self.marks[#self.marks+1] = mark
			mark:addLevel(id,num)
		end
	end

	knight.removeMark = function ( self,mType,num )
		local mark = nil
		for i , v in ipairs(self.marks) do
			if v.mType == mType then
				mark = v
			end
		end
		if mark then
			mark:delLevel(num)
		end
	end

	knight.getMarkLevel = function ( self,mType)
		for i , v in ipairs(self.marks) do
			if v.mType == mType then
				return v.level
			end
		end
		return 0
	end

	-- 更新血量，需要考虑护盾
	knight.updateHp = function (self,value)
		if self.isDead then
			return
		end
		if value >= 0 then
			self.baseInfo.INITIAL_HP = min(self.baseInfo.INITIAL_HP + value,self.originInfo.INITIAL_HP)
		else
			local shield = self.baseInfo.SHIELD
			if shield + value < 0 then
				self.baseInfo.SHIELD = 0
				self.baseInfo.INITIAL_HP = max(self.baseInfo.INITIAL_HP + shield + value , 0 )
			else	
				self.baseInfo.SHIELD = self.baseInfo.SHIELD + value
			end
		end
	end

	-- 获取技能作用效果次数
	-- @params skillId 技能id
	-- @params affectIndex 技能作用效果下标
	knight.getSkillAffectTimes = function (self, skillId, affectIndex)
		local key = skillId .. "_" .. affectIndex
		self.skillAffectTimes[key] = self.skillAffectTimes[key] or 0
		return self.skillAffectTimes[key]
	end

	-- 添加技能作用效果次数
	-- @params skillId 技能id
	-- @params affectIndex 技能作用效果下标
	-- @params num 添加的次数
	knight.addSkillAffectTimes = function (self, skillId, affectIndex, num)
		local key = skillId .. "_" .. affectIndex
		self.skillAffectTimes[key] = self.skillAffectTimes[key] or 0
		self.skillAffectTimes[key] = self.skillAffectTimes[key] + num
	end

	return knight

end

return KnightFactory