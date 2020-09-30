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

function ActionComponent:init(battleData,firstIdentity)
	local firstIdentity = firstIdentity or battleData:getHighIdentity()
	battleData.firstAttackId = firstIdentity
	self.order = {}
	for i = 1 , 6 do
		self.order[i*2-1] = {identity = firstIdentity, pos = i}
		self.order[i*2] = {identity = 3 - firstIdentity, pos = i}
	end
	self.attackIndex = 0 -- 这里记录的是上一个出手的位置
	self.battleData = battleData
	self.extraActions = {}
end

function ActionComponent:next()
	-- 额外行动回合
	local extraAction = self:getExtraAction()
	if extraAction then
		local params = {
			isExtra = true,
			disableComboRecover = extraAction.disableComboRecover == true,
			skillId = extraAction.skillId,
		}
		return extraAction.knight, params
	end
	
	-- 新助战要额外出手
	for i = 1 , 12 do
		local info = self.order[i]
		if info then
			local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
			if knight and knight:isReal() and knight.assisting then
				knight.assisting = false
				return knight
			end
		end
	end

	-- 现在规则改为按站位顺序出手
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		if info then
			local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
			if knight and knight:isReal() then
				self.attackIndex = i
				return knight
			end
		end
	end
end

function ActionComponent:checkFinish()
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		if info then
			local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
			if knight and knight:isReal() then
				return false
			end
		end
	end
	if self:hasExtraAction() then
		return false
	end
	self.attackIndex = 0 -- 重置
	return true
end

function ActionComponent:reset()
	self.attackIndex = 0
	self.extraActions = {}
end


function ActionComponent:getNextKnight()
	for i = self.attackIndex + 1 , 12 do
		local info = self.order[i]
		if info then
			local knight = self.battleData:getKnightByIdAndPos(info.identity,info.pos)
			if knight and knight:isReal() then
				return knight
			end
		end
	end
end

--[========================[

	添加额外出手
	local params = {
		knight,	-- 额外出手的武将
		disableComboRecover, -- 是否禁止合击值恢复
		skillId, -- 额外回合指定的技能
	}

]========================]
function ActionComponent:addExtraAction(params)
	table.insert(self.extraActions, params)
end

function ActionComponent:getExtraAction()
	repeat
		local extraAction = table.remove(self.extraActions, 1)
		if not extraAction then
			return nil
		end
		local knight = extraAction.knight
		if knight:isReal() then
			return extraAction
		end
	until true
end

function ActionComponent:hasExtraAction()
	for i = 1, #self.extraActions do
		local extraAction = self.extraActions[i]
		local knight = extraAction.knight
		if knight:isReal() then
			return true, extraAction
		end
	end
	return false
end

function ActionComponent:clearExtraAction()
	self.extraActions = {}
end

-- 改为轮流出手模式
function ActionComponent:changeTurns(battleData,firstIdentity)
	-- 调整出手顺序
	local firstIdentity = firstIdentity or battleData:getHighIdentity()
	local oppoIdentity = 3 - firstIdentity
	local pos1, pos2 = 1,2
	self.order = {}
	for i = 1 , 6 do
		local knight = self.battleData:getKnightByIdAndPos(firstIdentity,i)
		if knight and knight:isReal() then
			self.order[pos1] = {identity = firstIdentity, pos = i}
			pos1 = pos1 + 2
		end
		local knight = self.battleData:getKnightByIdAndPos(oppoIdentity,i)
		if knight and knight:isReal() then
			self.order[pos2] = {identity = oppoIdentity, pos = i}
			pos2 = pos2 + 2
		end
	end
end

return ActionComponent