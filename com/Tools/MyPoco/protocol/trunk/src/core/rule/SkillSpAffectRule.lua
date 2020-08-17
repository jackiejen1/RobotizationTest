--[==================[

    释放技能的特殊效果
    
    通常技能效果是攻击者与受击者1对1计算的
    有些复杂技能效果的计算无法满足这种方式，需要特殊处理

]==================]
local SkillSpAffectRule = {}

-- 检查是否是特殊技能效果
function SkillSpAffectRule.check(attackData)
    local affectType = attackData.affectType
    return SkillSpAffectRule["_calcSkillAffect"..affectType]
end

--[==================[

    9-吸取怒气
    对命中的目标集合扣除怒气（分摊），所扣除怒气添加到攻击者身上
    
]==================]
function SkillSpAffectRule._calcSkillAffect9(attackData)
    local results = {}
	local attacker = attackData.attacker
    local affectValue = attackData.formulaValue1
	-- 找到命中的目标
    local reAngerTargets = {}
    for i , target in ipairs(attackData.victims) do
		-- 判断是否触发，吸怒不判断减怒抗性
		local affectRate = attackData.affectRate
		if attackData.battleField:bingo(affectRate) then
			local victim = target.victim
			local anger = victim.advanceInfo.INITIAL_ANGER
			if anger > 0 then
				table.insert(reAngerTargets, {
					target = target,
					anger = anger,
					reAnger = 0,
				})
			end
        end
	end
	-- 随机去掉多余的人
	local battleField = attackData.battleField
	local targetCnt = #reAngerTargets
	for i = 1, targetCnt - affectValue do
		table.remove(reAngerTargets, battleField:boundedrand(1, targetCnt))
		targetCnt = targetCnt - 1
	end
	-- 均分扣除怒气
	local affectCnt = 0
	while affectCnt < affectValue do
		local isChange = false
		for i, v in ipairs(reAngerTargets) do
			if affectCnt >= affectValue then
				break
			end
			if v.anger > 0 then
				v.anger = v.anger - 1
				v.reAnger = v.reAnger + 1
				isChange = true
				affectCnt = affectCnt + 1
			end
		end
		
		-- 没有能够减怒的
		if not isChange then
			break
		end
	end
	local reAngerCnt = 0		-- 总共减怒的数量
	for i, v in ipairs(reAngerTargets) do
		if v.reAnger > 0 then
			local result = {
				suckAnger = true,
				damage = v.reAnger,
				affectType = 3,
				victim = v.target.victim,
			}
			reAngerCnt = reAngerCnt + v.reAnger
			table.insert(results, result)
		end
	end
	if reAngerCnt > 0 then
		-- 给攻击者加怒
		table.insert(results, {
			suckAnger = true,
			damage = reAngerCnt,
			affectType = 4,
			victim = attacker,
		})
	end
	return results
end

return SkillSpAffectRule