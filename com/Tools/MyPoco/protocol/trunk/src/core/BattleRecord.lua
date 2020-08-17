-- 记录战斗数据，用于结算

local BattleRecord = {}

BattleRecord.TYPE_DAM = 1
BattleRecord.TYPE_RECOVER = 2
BattleRecord.TYPE_TAKE_DAM = 3

function BattleRecord:init()
    self._keyList = {}
    self._infoList = {{},{}}
    self._winInfo = {}
    self._petSkills = {}
end

function BattleRecord:initRecord(atkType,owns,enemys)
	self._keyList = {}
	self._infoList = {{},{}}
	self:setRecord(atkType,1,owns)
	self:setRecord(atkType,2,enemys)
end

function BattleRecord:setRecord(atkType,identity,info)
	-- local robot = info.user and (info.user.robot_type and info.user.robot_type ~= 0 and info.user.robot_type ~= 999)
	-- local isMonster = robot or (atkType == 1 and identity == 2) or (atkType == 10)
	local isMonster = info.monster_team_id and info.monster_team_id > 0 or false
	for i = 1 , #info.units do
		local unit = info.units[i]
    	local key = "knight_"..identity.."_"..unit.id.."_"..unit.pos
    	local uinfo = {}
    	uinfo.type = 1 	-- 武将
    	uinfo.id = unit.id
		uinfo.dam = 0
		uinfo.recover = 0
		uinfo.take_dam = 0
    	uinfo.pos = unit.pos
    	if not isMonster then
	    	local knightInfo = loadCfg("cfg.knight_info").get(unit.id)
	    	if knightInfo.type == 1 then
	    		-- 是主角
	    		if info.user then
	    			uinfo.avartar_id = info.user.dress_id or 0
	    		else
	    			uinfo.avartar_id = 0
	    		end
	    	else
	    		uinfo.avartar_id = unit.skin or 0
	    	end
	    end
    	self._keyList[key] = uinfo
    	local iList = self._infoList[identity]
    	iList[#iList+1] = uinfo
	end
	table.sort(self._infoList[identity],function( a,b )
		return a.pos < b.pos
	end)
	for i , v in ipairs(self._infoList[identity]) do
		v.pos = nil
	end
	if info.combo.tokens then
		for i = 1 , #info.combo.tokens do
			local combo = info.combo.tokens[i]
	    	local key = "unite_"..identity.."_"..combo
	    	local cinfo = {}
	    	cinfo.type = 2	-- 合击
	    	cinfo.id = combo
			cinfo.dam = 0
			cinfo.recover = 0
			cinfo.take_dam = 0
	    	self._keyList[key] = cinfo
	    	local iList = self._infoList[identity]
	    	iList[#iList+1] = cinfo
		end
	end
	if info.pets then
		for i = 1 , #info.pets do
			local pet = info.pets[i]
	    	local key = "pet_"..identity.."_"..pet
	    	local cinfo = {}
	    	cinfo.type = 3	-- 战宠
	    	cinfo.id = pet
			cinfo.dam = 0
			cinfo.recover = 0
			cinfo.take_dam = 0
	    	self._keyList[key] = cinfo
	    	local iList = self._infoList[identity]
	    	iList[#iList+1] = cinfo
	    	local petInfo = loadCfg("cfg.pet_info").get(pet)
	    	if petInfo.passive_skill_1 > 0 then
	    		local skill1 = loadCfg("cfg.passive_skill_info").get(petInfo.passive_skill_1)
	    		self._petSkills[skill1.passive_skill_value] = pet
	    	end
	    	if petInfo.passive_skill_2 > 0 then
		    	local skill2 = loadCfg("cfg.passive_skill_info").get(petInfo.passive_skill_2)
		    	self._petSkills[skill2.passive_skill_value] = pet
			end
			if petInfo.belong_passive_skill_1 > 0 then
				local skill = loadCfg("cfg.passive_skill_info").get(petInfo.belong_passive_skill_1)
	    		self._petSkills[skill.passive_skill_value] = pet
			end
			if petInfo.belong_passive_skill_2 > 0 then
				local skill = loadCfg("cfg.passive_skill_info").get(petInfo.belong_passive_skill_2)
		    	self._petSkills[skill.passive_skill_value] = pet
			end
		end
	end
end

function BattleRecord:addRecord(attacker, type, value)
	local info = self:getInfoByAttacker(attacker)
	if info then
		if type == BattleRecord.TYPE_DAM then
			-- 伤害
			info.dam = info.dam + value
		elseif type == BattleRecord.TYPE_RECOVER then
			-- 治疗量
			info.recover = info.recover + value
		elseif type == BattleRecord.TYPE_TAKE_DAM then
			-- 承受伤害
			info.take_dam = info.take_dam + value
		end
	end
end

function BattleRecord:getInfoByAttacker(attacker)
	if attacker.isPlayer then
    	if attacker.isPet then
    		local petId = self._petSkills[attacker.skillId]
	    	local key = "pet_"..attacker.identity.."_"..petId
	    	if self._keyList[key] then
	    		return self._keyList[key]
	    	else
		    	local info = {}
		    	info.type = 3	-- 战宠
		    	info.id = petId
				info.dam = 0
				info.recover = 0
				info.take_dam = 0
		    	self._keyList[key] = info
		    	local iList = self._infoList[attacker.identity]
				iList[#iList+1] = info
				return info
		    end
		elseif attacker.isSpaceTime then
			-- 时光之力
		elseif attacker.isSummon then
			local key = "knight_"..attacker.identity.."_"..attacker.originInfo.id.."_"..attacker.originInfo.pos
			if self._keyList[key] then
				return self._keyList[key]
			end
		else
	    	local key = "unite_"..attacker.identity.."_"..attacker.id
	    	if self._keyList[key] then
	    		return self._keyList[key]
	    	else
		    	local info = {}
		    	info.type = 2	-- 合击
		    	info.id = attacker.id
				info.dam = 0
				info.recover = 0
				info.take_dam = 0
		    	self._keyList[key] = info
		    	local iList = self._infoList[attacker.identity]
				iList[#iList+1] = info
				return info
		    end
    	end
    else
    	local key = "knight_"..attacker.identity.."_"..attacker.originInfo.id.."_"..attacker.originInfo.pos
    	if self._keyList[key] then
    		return self._keyList[key]
    	else
	    	local info = {}
	    	info.type = 1 	-- 武将
	    	info.id = attacker.originInfo.id
			info.dam = 0
			info.recover = 0
			info.take_dam = 0
	    	if not attacker.isMonster then
		    	local knightInfo = loadCfg("cfg.knight_info").get(attacker.originInfo.id)
		    	if knightInfo.type == 1 then
		    		-- 是主角
		    		info.avartar_id = attacker.user.dress_id or 0
		    	else
		    		info.avartar_id = attacker.baseData.skin or 0
		    	end
		    end
	    	self._keyList[key] = info
	    	local iList = self._infoList[attacker.identity]
			iList[#iList+1] = info
			return info
	    end
    end
end

function BattleRecord:getRecord()
    return self._infoList
end

function BattleRecord:setWinInfo( winner,own_name,enemy_name )
	self._winInfo.is_win = winner == 1
	self._winInfo.own_name = own_name
	self._winInfo.enemy_name = enemy_name
end

function BattleRecord:getWinInfo()
	return self._winInfo
end

function BattleRecord:getAttackerDamage()
    local list = self._infoList[1]
    local damage = 0
    for i , v in ipairs(list) do
    	damage = damage + v.dam
    end
    return damage
end

return BattleRecord
