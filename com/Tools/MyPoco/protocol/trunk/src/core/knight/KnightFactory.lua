
local tostring = tostring

local table = table
local remove = table.remove
local sort = table.sort
local insert = table.insert

local math = math
local min = math.min
local floor = math.floor

local BattleAttr = load "const.BattleAttr"
local BattleAttrRe = load "const.BattleAttrRe"
local FightComponent = load "core.fight.FightComponent"

local KnightFactory = {}

local function createKnightBuff(buffId, buffSerialId, buffTime, victim, attacker,buffCheck)
	
	local buff = {
		-- buffCfg
		buffCfg = loadCfg("cfg.buff_info").get(buffId),
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
	}

	-- 回合数减一
	buff.doRound = function(self, mode)
		if mode == self.buffCfg.buff_open_type then
			self.buffTime = self.buffTime - 1
			if self.buffTime == 0 then
				self.isDone = true
			end
		end
	end
	
	local BuffRule = load "core.rule.BuffRule"
	buff.rule = BuffRule.initRule(buff)

	-- 执行buff效果
	buff.excute = function ( self , mode , data )
		if mode == self.buffCfg.buff_type then
			if self.buffCheckSkill and not self.buffCheckSkill:check() then
				return data
			end
			return self.rule(data)
		end
		return data
	end

	return buff

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
		isPlayer = false,
		willAssist = false, -- 将会助战，暂时不上阵
		assisting = false, -- 助战额外出手的标记
		baseData = knightData,
		user = user,
		isMonster = isMonster,
		isLock = false, -- 锁血标记，被锁血的不会掉血也不会死亡
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

	local commonSkillId = knightCfg.common_id
	local activeSkillId = knightCfg.active_skill_id
	if not isMonster and knightCfg.type == 1 and user then
		-- 是主角
		if knightData.common_skill_id and knightData.common_skill_id > 0 
			and knightData.active_skill_id and knightData.active_skill_id > 0 then
			commonSkillId = knightData.common_skill_id
            activeSkillId = knightData.active_skill_id
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

	if knightCfg.passive_skill > 0 then
		knight.skills = clone(knight.skills)
		knight.skills[#knight.skills + 1] = knightCfg.passive_skill
	end

	-- 技能规则初始化，绑定在武将身上
	local SkillSpecialRule = load "core.rule.SkillSpecialRule"
	-- 被动触发类技能效果
	knight.spRules = SkillSpecialRule.initRule(knight.skills,knight.identity,battleField,knight)

	knight.excuteSpRule = function( self, mode , data )
		if knight.spRules[mode] then
			for i , skill in ipairs(knight.spRules[mode]) do
				if skill:check(data) and skill:excute() then
					if skill.info.passive_skill_type == 3 then
						-- 属性类，目前以buff的形式来实现
						-- 会有个问题，后上场的吃不到这个buff，这个目前不影响，以后再解决
						battleField:getBattleData():addFastPassive({knight=knight,info=skill.info,check=skill})
					elseif skill.info.passive_skill_type == 1 and skill.info.if_merge == 1 then
						battleField:getBattleData():addFastPassive({knight=knight,info=skill.info})
					else
						battleField:getBattleData():addPassive({knight=knight,info=skill.info})
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
	end

	knight.canReleaseActiveSkill = function(self)
		local activeSkillCfg = self.activeSkillCfg
		-- 根据类型选择，这里只考虑技能
		local skillType = activeSkillCfg.skill_type
		-- 判断怒气
		local value = self.baseInfo.INITIAL_ANGER
		local activeValue = activeSkillCfg.rage_value
		-- 可能会有额外消耗
		if value - activeValue >= 0 then
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
		local buff = createKnightBuff(buffId, buffSerialId, buffTime, self, attacker,buffCheck)
		buffSerialId = buffSerialId + 1
		self.buffs[#self.buffs + 1] = buff
		return buff.serialId
	end

	knight.clearBuff = function(self)
		local pBuffs = {}
		for i , v in ipairs(self.buffs) do
			if v.buffCheck then
				table.insert(pBuffs,#pBuffs+1,v)
			end
		end
		self.buffs = pBuffs
		buffSerialId = 1
	end

	knight.delBuff = function(self, serialId)
		for i, buff in ipairs(self.buffs) do
			if buff.serialId == serialId then
				remove(self.buffs, i)
				break
			end
		end
	end

	-- 执行buff效果
	-- mode 生效时机
	-- data 输入的数据
	knight.doBuff = function( self , mode, data )
		for i = 1 , #self.buffs do
			local buff = self.buffs[i]
			data = buff:excute(mode,data)
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
			end
		end
		for i = 1 , #removeIndex do
			remove(self.buffs,removeIndex[i])
		end
		return list
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

	knight.isValid = function ( self )
		return not self.isDead and not self.willAssist
	end

	return knight

end

return KnightFactory