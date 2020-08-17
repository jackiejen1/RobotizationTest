
require "init"

local field = require("core.BattleField").new()

-- 初始化战场
function initBattle( byte )
	field:setInitDataBytes(byte)
end

-- 单步执行，正常用不到
function executeBattle( )
	return field:execute()
end

-- 直接执行完，正常用不到
function fastExecuteBattle( )
	local state = 0
	while state == 0 do
		state = field:execute()
	end
end

-- 获取战斗结果
function getBattleResult( )
	return field:getBattleResultByte()
end

-- 检查结果
function checkBattleResult( byte )
	local data = field:checkResultBytes(byte)
	local len = type(data) == "string" and string.len(data) or 0
	return data,len
end

-- 重置战斗
function resetBattle( )
	field:reset()
end

-- 自动战斗
function autoBattleResult( )
	fastExecuteBattle()
	local data = getBattleResult()
	local len = type(data) == "string" and string.len(data) or 0
	return data,len
end

-- 获取log
function getLog( )
	return G_battleLog
end

----------------------------------

function initBattleTable( data )
	field:setInitData(data)
end

function getBattleResultTable( )
	return field:getBattleResult()
end

function checkBattleResultTable( data )
	local data = field:checkResult(data)
	return data
end
