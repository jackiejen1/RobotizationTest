-- 必杀技
local EnergyRule = {}

local insert = table.insert

EnergyRule.TYPE = {
    SKILL = 1,  -- 武将释放技能
    HIT = 2,    -- 受击
}

EnergyRule.triggerTime = {
    [1] = 1,
    [2] = 2,
    [3] = 1,
}

function EnergyRule.addRule(rules, rtype, value, knight)
    local rule = {}
    rule.check = EnergyRule.getCheckFunc(rtype, knight)
    rule.execute = function ()
        -- 回复必杀值
        knight:addEnergyEffect(value)
    end

    local trigger = EnergyRule.triggerTime[rtype] or 0
	if type(trigger) == "table" then
		for i , v in ipairs(trigger) do
			if not rules[v] then
				rules[v] = {}
			end
			insert(rules[v],rule)
		end
	else
		if not rules[trigger] then
			rules[trigger] = {}
		end
		insert(rules[trigger],rule)
	end
    
    return rules
end

function EnergyRule.initRule(knight, ruleList)
    local rules = {}
    local infoName = knight.isMonster and "monster_info" or "knight_info"
    local knight_info = loadCfg("cfg."..infoName)
    local knightCfg = knight_info.get(knight.baseData.id)
    for i, v in ipairs(ruleList) do
        EnergyRule.addRule(rules, v.type, v.value, knight)
    end
    return rules
end

function EnergyRule.getCheckFunc(rtype, knight)
    if rtype == 1 then
        -- 武将出手时自身回复
        return function (self, attacker)
            return knight.serialId == attacker.serialId
        end
    elseif rtype == 2 then
        -- 武将受击时自身回复
        return function (self, victim)
            return true
        end
    elseif rtype == 3 then
        -- 友方武将行动时回复
        return function (self, attacker)
            if attacker.identity == knight.identity then
                return attacker.serialId ~= knight.serialId
            end
            return false
        end
    end
end

return EnergyRule