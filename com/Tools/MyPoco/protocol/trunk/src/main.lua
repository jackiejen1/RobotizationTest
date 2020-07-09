
-- print("run test")

-- require("battle")

-- local ProtoBuilder = require("core.proto.ProtoBuilder")
-- local testData = require("testData")
-- local testByte = ProtoBuilder:encodeByMsgName("BattleReport",testData)

-- initBattle(testByte)
-- fastExecuteBattle()
-- local resultData = getBattleResult()
-- local checkByte,len = checkBattleResult(resultData)
-- print("checklen",len)
-- local checkData = ProtoBuilder:decodeByMsgName("CheckResult",checkByte)
-- dump(checkData,nil,10)

-- -- 战斗重置
-- resetBattle()


print("run test")
local t1 = os.clock()

-- require("battle")
require "init"

local testData = require("testData")
local t2 = os.clock()
local BattleField = require("core.BattleField")
local t3 = os.clock()
local field = BattleField.new()

local t4 = os.clock()
field:setInitData(testData)
local t5 = os.clock()
local state = 0
while state == 0 do
	state = field:execute(true)
end
local resultData = field:getBattleResult()
local t6 = os.clock()

field = BattleField.new()
field:setInitData(testData)
local state = 0
while state == 0 do
	state = field:execute(true)
end
local resultData = field:getBattleResult()

local t7 = os.clock()

print(t1,t2,t3,t4,t5,t6,t7)
print(t7-t6,t6-t5,t5-t4,t4-t3,t3-t2,t2-t1)

-- print("run test")

-- local a = {num = 1}
-- local b = {}
-- setmetatable(b,{__index = function(tb,key)
-- 	if key == "num" then
-- 		return 1
-- 	end
-- end})
-- local c = {}
-- setmetatable(c,{__index = a})
-- local d = function()
-- 	return a.num
-- end

-- local t1 = os.clock()
-- local t = 0
-- for i = 1 , 2000000 do 
-- 	local num = a.num
-- end

-- local t2 = os.clock()

-- for i = 1 , 2000000 do 
-- 	local num = b.num
-- end

-- local t3 = os.clock()

-- for i = 1 , 2000000 do 
-- 	local num = c.num
-- end

-- local t4 = os.clock()

-- for i = 1 , 2000000 do 
-- 	local num = d()
-- end

-- local t5 = os.clock()

-- print(t1,t2,t3,t4,t5)
-- print(t2-t1,t3-t2,t4-t3,t5-t4)

-- local t1 = os.clock()

-- local str = ""
-- for i = 1 , 3000 do 
-- 	str = str .. "k" .. i
-- end

-- local t2 = os.clock()
-- local str = ""
-- for i = 1 , 3000 do 
-- 	str = string.format("%s%s%s",str,"k",i)
-- end

-- local t3 = os.clock()

-- local t = {}
-- for i = 1 , 3000 do
-- 	t[i] = "k" .. i
-- end
-- local str = table.concat(t,"")

-- local t4 = os.clock()

-- print(t1,t2,t3,t4)
-- print(t2-t1,t3-t2,t4-t3)
