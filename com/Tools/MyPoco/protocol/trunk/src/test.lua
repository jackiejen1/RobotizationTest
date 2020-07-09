
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
	state = field:execute()
end
local resultData = field:getBattleResult()
local t6 = os.clock()

field = BattleField.new()
field:setInitData(testData)
local state = 0
while state == 0 do
	state = field:execute()
end
local resultData = field:getBattleResult()

local t7 = os.clock()

print(t1,t2,t3,t4,t5,t6,t7)
print(t7-t6,t6-t5,t5-t4,t4-t3,t3-t2,t2-t1)