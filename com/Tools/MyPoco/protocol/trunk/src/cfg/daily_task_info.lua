---@classdef record_daily_task_info
local record_daily_task_info = {}


record_daily_task_info.id = 0--编号
record_daily_task_info.name =  ""--任务名称
record_daily_task_info.description =  ""--任务描述
record_daily_task_info.icon =  ""--任务图标
record_daily_task_info.type = 0--任务类型
record_daily_task_info.target = 0--任务目标
record_daily_task_info.num = 0--任务目标数值
record_daily_task_info.function_id = 0--关联功能ID
record_daily_task_info.level = 0--任务开启等级
record_daily_task_info.time = 0--开启时间
record_daily_task_info.sort = 0--排序值
record_daily_task_info.active_degree = 0--活跃度
record_daily_task_info.reward_type_1 = 0--奖励类型1
record_daily_task_info.reward_value_1 = 0--奖励类型值1
record_daily_task_info.reward_size_1 = 0--奖励数量1
record_daily_task_info.reward_type_2 = 0--奖励类型2
record_daily_task_info.reward_value_2 = 0--奖励类型值2
record_daily_task_info.reward_size_2 = 0--奖励数量2
record_daily_task_info.route_id = 0--跳转接口

local daily_task_info = {
   _data = {   
    [1] = {101,"主线挑战","主线副本挑战30次","icon/function/icon_zhuxianfuben.png",1,1022,30,0,1,0,1,20,3,11,100,3,10,5,2,},  
    [2] = {102,"体力充沛","购买体力丹4个","icon/item/12.png",1,1042,4,0,1,0,3,10,3,1,1,3,16,2,100,},  
    [3] = {103,"礼尚往来","好友赠送体力20次","icon/function/icon_haoyou.png",1,1010,20,20007,1,0,3,10,1,3,100000,0,0,0,30,},  
    [4] = {104,"竞技场挑战","竞技场挑战20次","icon/function/icon_jingjichang.png",1,1001,20,10003,1,0,1,20,3,2,100,1,8,2000,10,},  
    [5] = {105,"传记任务","神将列传-传记战斗5次（包含扫荡）","icon/function/icon_mingjiangzhuan.png",1,1023,5,10001,1,0,1,20,3,2036,3,3,21,20,11,},  
    [6] = {106,"将魂商店刷新","将魂商店刷新5次","icon/function/icon_shangcheng.png",1,1072,5,20012,1,0,3,10,1,16,2000,3,30,5,101,},  
    [7] = {107,"无双试炼","无双试炼挑战8次","icon/function/icon_wushuangshilian.png",1,1027,8,10009,1,0,1,20,3,2004,1,1,6,2000,17,},  
    [8] = {108,"封地巡逻","封地派遣武将巡逻1次","icon/function/icon_fengdi.png",1,1090,1,10023,1,0,2,20,3,1,1,3,10,5,18,},  
    [9] = {109,"助人为乐","封地协助好友解决暴动5次","icon/function/icon_pingding.png",1,1003,5,10023,1,0,2,10,3,2,100,0,0,0,18,},  
    [10] = {110,"日常副本","日常副本挑战2次","icon/function/icon_richangfuben.png",1,1025,2,10030,1,0,2,10,1,3,100000,3,9,5,13,},  
    [11] = {111,"元宝消耗","每日消耗800元宝","icon/function/icon_shangcheng.png",1,1089,800,0,1,0,4,10,3,22,5,3,37,10,100,},  
    [12] = {113,"讨伐巨兽","征讨次数消耗10次","icon/function/icon_zhuijipanjun.png",1,1075,10,10024,1,0,1,20,3,27,10,3,14,50,20,},  
    [13] = {114,"秘境寻宝","秘境寻宝挑战20次","icon/function/icon_xunlongduobao.png",1,1005,20,10011,1,0,1,20,3,2009,1,8,13030,3,19,},  
    [14] = {115,"组队战役","神将列传-组队战役挑战3次","icon/function/icon_zhanyi.png",1,1024,3,10032,1,0,1,20,3,32,10,3,27,5,12,},  
    [15] = {116,"过关斩将","过关斩将挑战3次","icon/function/icon_zhuijipanjun.png",1,1093,3,10033,1,0,1,20,3,47,10,3,15,30,162,},  
    [16] = {117,"激斗神将","激斗神将挑战3次","icon/function/icon_hd_jtboss1.png",1,1098,3,10034,1,0,1,20,1,11,2000,0,0,0,171,},  
    [17] = {201,"军团副本","军团副本挑战5次","icon/function/icon_juntuan.png",1,1012,5,10035,1,0,1,20,3,26,200,0,0,0,16,},  
    [18] = {202,"决战定军山","决战定军山挑战3次","icon/function/icon_juezhandingjunshan.png",1,1108,3,10037,1,0,1,20,1,44,10000,0,0,0,223,},  
    [19] = {203,"兵临城下","兵临城下挑战3次","icon/function/icon_juntuan.png",1,1114,3,10047,1,0,1,20,3,187,2,1,3,100000,229,},  
    [20] = {204,"试炼副本","试炼副本挑战5次","icon/function/icon_jingyinfubeng.png",1,1116,5,10052,1,0,1,20,3,202,3000,0,0,0,235,},  
    [21] = {205,"烽火连城","烽火连城挑战10次","icon/function/icon_fenghuoliancheng.png",1,1137,10,10056,1,0,1,20,1,11,5000,3,232,10,244,},  
    [22] = {206,"学宫论战","学宫论战挑战5次","icon/function/icon_xuegonglunzhan",1,1145,5,10062,1,0,1,20,3,243,50,1,48,5000,256,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [110] = 10,  
    [111] = 11,  
    [113] = 12,  
    [114] = 13,  
    [115] = 14,  
    [116] = 15,  
    [117] = 16,  
    [201] = 17,  
    [202] = 18,  
    [203] = 19,  
    [204] = 20,  
    [205] = 21,  
    [206] = 22,
}

local __key_map = { 
    id = 1,
    name = 2,
    description = 3,
    icon = 4,
    type = 5,
    target = 6,
    num = 7,
    function_id = 8,
    level = 9,
    time = 10,
    sort = 11,
    active_degree = 12,
    reward_type_1 = 13,
    reward_value_1 = 14,
    reward_size_1 = 15,
    reward_type_2 = 16,
    reward_value_2 = 17,
    reward_size_2 = 18,
    route_id = 19,
}

local m = { 
    __index = function(t, k) 
        if k == "toObject" then
            return function()  
                local o = {}
                for key, v in pairs (__key_map) do 
                    o[key] = t._raw[v]
                end
                return o
            end 
        end
        
        assert(__key_map[k], "cannot find " .. k .. " in record_daily_task_info")

        return t._raw[__key_map[k]]
    end
}


function daily_task_info.getLength()
    return #daily_task_info._data
end



function daily_task_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_daily_task_info
function daily_task_info.indexOf(index)
    if index == nil or not daily_task_info._data[index] then
        return nil
    end
    return setmetatable({_raw = daily_task_info._data[index]}, m)
end



---
--@return @class record_daily_task_info
function daily_task_info.get(id)
    
    return daily_task_info.indexOf(__index_id[ id ])
     
end



function daily_task_info.set(id, key, value)
    local record = daily_task_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function daily_task_info.get_index_data()
    return __index_id 
end

return  daily_task_info 