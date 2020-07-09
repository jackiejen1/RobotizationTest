--[========================[

	行动组件

	负责检索出当前应该出手的人或者技能是谁

]========================]

local table = table
local sort = table.sort

local math = math
local floor = math.floor

local BattleConst = load "const.BattleConst"

local ActionComponent = {}

function ActionComponent:init(battleData)
	local firstIdentity = battleData:getHighIdentity()
	battleData.firstAttackId = firstIdentity
	self.order = {}
	for i = 1 , 6 do
		self.order[i*2-1] = {identity = firstIdentity, pos = i}
		self.order[i*2] = {identity = 3 - firstIdentity, pos = i}
	end
	self.attackIndex = 0 -- 这里记录的是上一个出手的位置
	self.battleData = battleData
end

function ActionComponent:next()
	-- 新助战要额外出手
	for i = 1 , 12 do
		local info = self.order[i]
		local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
		if knight and knight:isValid() and knight.assisting then
			knight.assisting = false
			return knight
		end
	end

	-- 现在规则改为按站位顺序出手
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
		if knight and knight:isValid() then
			self.attackIndex = i
			return knight
		end
	end
end

function ActionComponent:checkFinish()
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
		if knight and knight:isValid() then
			return false
		end
	end
	self.attackIndex = 0 -- 重置
	return true
end

function ActionComponent:reset()
	self.attackIndex = 0
end


function ActionComponent:getNextKnight()
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
		if knight and knight:isValid() then
			return knight
		end
	end
end

return ActionComponent