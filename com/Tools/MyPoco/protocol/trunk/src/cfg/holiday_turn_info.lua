---@classdef record_holiday_turn_info
local record_holiday_turn_info = {}


record_holiday_turn_info.id = 0--编号
record_holiday_turn_info.holiday_id = 0--所属欢庆ID
record_holiday_turn_info.open_time = 0--开始时间
record_holiday_turn_info.end_time = 0--结束时间
record_holiday_turn_info.turn_rank = 0--轮次次序
record_holiday_turn_info.res_type = 0--展示资源类型
record_holiday_turn_info.res_id = 0--展示资源
record_holiday_turn_info.effect_admin = 0--是否播放入场特效
record_holiday_turn_info.res_name =  ""--资源名称
record_holiday_turn_info.res_quality_name =  ""--资源品质名称
record_holiday_turn_info.res_quality = 0--资源品质
record_holiday_turn_info.turn_name =  ""--轮次名称
record_holiday_turn_info.extra_type = 0--关联节日掉落
record_holiday_turn_info.drop_end_time = 0--人人有礼过期时间
record_holiday_turn_info.tab_name_1 =  ""--充值福利页签
record_holiday_turn_info.tab_name_2 =  ""--人人有礼页签
record_holiday_turn_info.tab_name_3 =  ""--活跃任务
record_holiday_turn_info.tab_name_4 =  ""--兑换页签
record_holiday_turn_info.tab_name_5 =  ""--折扣贩售
record_holiday_turn_info.act_tab_1 =  ""--活跃任务页签1
record_holiday_turn_info.act_tab_2 =  ""--活跃任务页签2
record_holiday_turn_info.act_tab_3 =  ""--活跃任务页签3
record_holiday_turn_info.act_tab_4 =  ""--活跃任务页签4
record_holiday_turn_info.item_type_1 = 0--活动道具1类型
record_holiday_turn_info.item_value_1 = 0--活动道具1类型值
record_holiday_turn_info.item_type_2 = 0--活动道具2类型
record_holiday_turn_info.item_value_2 = 0--活动道具2类型值
record_holiday_turn_info.item_type_3 = 0--活动道具3类型
record_holiday_turn_info.item_value_3 = 0--活动道具3类型值
record_holiday_turn_info.item_type_4 = 0--活动道具4类型
record_holiday_turn_info.item_value_4 = 0--活动道具4类型值
record_holiday_turn_info.item_type_5 = 0--活动道具5类型
record_holiday_turn_info.item_value_5 = 0--活动道具5类型值
record_holiday_turn_info.skill_type = 0--预览道具类型
record_holiday_turn_info.skill_value = 0--预览道具类型值

local holiday_turn_info = {
   _data = {   
    [1] = {201,2,1,4,1,4,3060,0,"苍叶绿绮琴","金神兵",7,"苍叶琴心",2,4,"元旦福利","福利掉落","活跃任务","新年兑换","限时折扣","招将返利","组队战役","0","0",3,92,3,91,3,90,3,92,0,0,0,0,},  
    [2] = {9001,1,1,4,1,1,400130,0,"刘备","金将",6,"金将降临",2,10,"充值福利","人人有礼","活跃任务","兑换页签","折扣贩售","活跃任务1","活跃任务2","活跃任务3","活跃任务4",1,3,999,0,1,3,1,3,0,0,4,510030,},  
    [3] = {9002,1,4,8,2,3,40010,0,"火云剑","红神兵",7,"金装降临",2,10,"充值福利","人人有礼","活跃任务","兑换页签","折扣贩售","活跃任务1","活跃任务2","活跃任务3","活跃任务4",1,3,999,0,1,3,1,3,0,0,0,0,},  
    [4] = {9003,1,9,10,3,2,101,0,"屠龙宝刀","金装",7,"宝刀降临",2,10,"充值福利","人人有礼","活跃任务","兑换页签","折扣贩售","活跃任务1","活跃任务2","活跃任务3","活跃任务4",1,3,999,0,1,3,1,3,0,0,0,0,},  
    [5] = {301,3,1,4,1,1,600100,0,"甘宁","金将",7,"金将降世",3,4,"鼠年福利","福利掉落","活跃任务","新年兑换","限时折扣","招将返利","组队战役","0","0",3,109,3,112,3,110,3,111,3,118,4,600100,},  
    [6] = {302,3,4,7,2,4,3010,0,"丈八蛇矛","金神兵",7,"暴怒蛇影",4,7,"新年福利","福利掉落","活跃任务","新年兑换","限时折扣","神兵返利","过关斩将","0","0",3,115,3,114,3,113,0,0,0,0,0,0,},  
    [7] = {401,4,1,4,1,5,4010,0,"神木青鸾","金神兽",7,"青鸾比翼",5,4,"情意福利","福利掉落","活跃任务","情意兑换","限时折扣","神兵返利","组队战役","0","0",3,136,3,135,3,134,0,0,0,0,17,4010,},  
    [8] = {501,5,1,4,1,4,3050,0,"闭月团扇","金神兵",7,"闭月羞花",6,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,139,3,138,3,137,0,0,0,0,0,0,},  
    [9] = {601,6,1,4,1,5,4020,0,"撼地灵犀","金神兽",7,"灵犀神兽",7,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,143,3,142,3,141,0,0,0,0,17,4020,},  
    [10] = {701,7,1,4,1,1,600030,0,"诸葛亮","金将",7,"金将降世",8,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,160,3,159,3,158,0,0,0,0,4,600030,},  
    [11] = {801,8,1,4,1,5,4030,0,"狱火穷奇","金神兽",7,"游园踏青",9,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,169,3,168,3,167,0,0,0,0,17,4030,},  
    [12] = {901,9,1,4,1,4,3030,0,"青釭剑","金神兵",7,"青芒霜寒",10,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,172,3,171,3,170,0,0,0,0,0,0,},  
    [13] = {1001,10,1,4,1,1,600070,0,"吕布","金将",7,"劳动快乐",11,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,182,3,181,3,180,0,0,0,0,4,600070,},  
    [14] = {1101,11,1,4,1,5,4040,0,"九天应龙","金神兽",7,"狂风怒意",12,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,185,3,184,3,183,0,0,0,0,17,4040,},  
    [15] = {1201,12,1,4,1,4,3040,0,"七星宝刀","金神兵",7,"七星耀世",13,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,198,3,197,3,196,0,0,0,0,0,0,},  
    [16] = {1301,13,1,4,1,1,700040,0,"吕玲绮","紫金将",8,"紫金流火",14,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,208,3,207,3,206,0,0,0,0,4,700040,},  
    [17] = {1401,14,1,4,1,5,4060,0,"碧水麒麟","紫金神兽",8,"紫金流火",15,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,229,3,228,3,227,0,0,0,0,17,4060,},  
    [18] = {1501,15,1,4,1,4,4010,0,"倚天剑","紫金神兵",8,"倚天出鞘",16,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,242,3,241,3,240,0,0,0,0,0,0,},  
    [19] = {1601,16,1,4,1,1,700050,0,"战神张辽","紫金将",8,"幻紫耀世",17,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,247,3,246,3,245,0,0,0,0,0,0,},  
    [20] = {1701,17,1,4,1,5,4057,0,"苍鸣雷君","紫金神兽",8,"雷霆耀世",18,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,252,3,251,3,250,0,0,0,0,0,0,},  
    [21] = {1801,18,1,4,1,4,4020,0,"太公护符","紫金神兵",8,"神符佑世",19,4,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","招将返利","组队战役","0","0",3,257,3,256,3,255,0,0,0,0,0,0,},  
    [22] = {1802,18,4,7,2,6,801000,0,"龙焰掠世","紫金战法",8,"战意凌然",20,7,"超值福利","福利掉落","活跃任务","福利兑换","限时折扣","神兵返利","组队战役","0","0",3,260,3,259,3,258,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [201] = 1,  
    [301] = 5,  
    [302] = 6,  
    [401] = 7,  
    [501] = 8,  
    [601] = 9,  
    [701] = 10,  
    [801] = 11,  
    [901] = 12,  
    [1001] = 13,  
    [1101] = 14,  
    [1201] = 15,  
    [1301] = 16,  
    [1401] = 17,  
    [1501] = 18,  
    [1601] = 19,  
    [1701] = 20,  
    [1801] = 21,  
    [1802] = 22,  
    [9001] = 2,  
    [9002] = 3,  
    [9003] = 4,
}

local __key_map = { 
    id = 1,
    holiday_id = 2,
    open_time = 3,
    end_time = 4,
    turn_rank = 5,
    res_type = 6,
    res_id = 7,
    effect_admin = 8,
    res_name = 9,
    res_quality_name = 10,
    res_quality = 11,
    turn_name = 12,
    extra_type = 13,
    drop_end_time = 14,
    tab_name_1 = 15,
    tab_name_2 = 16,
    tab_name_3 = 17,
    tab_name_4 = 18,
    tab_name_5 = 19,
    act_tab_1 = 20,
    act_tab_2 = 21,
    act_tab_3 = 22,
    act_tab_4 = 23,
    item_type_1 = 24,
    item_value_1 = 25,
    item_type_2 = 26,
    item_value_2 = 27,
    item_type_3 = 28,
    item_value_3 = 29,
    item_type_4 = 30,
    item_value_4 = 31,
    item_type_5 = 32,
    item_value_5 = 33,
    skill_type = 34,
    skill_value = 35,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_holiday_turn_info")

        return t._raw[__key_map[k]]
    end
}


function holiday_turn_info.getLength()
    return #holiday_turn_info._data
end



function holiday_turn_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_holiday_turn_info
function holiday_turn_info.indexOf(index)
    if index == nil or not holiday_turn_info._data[index] then
        return nil
    end
    return setmetatable({_raw = holiday_turn_info._data[index]}, m)
end



---
--@return @class record_holiday_turn_info
function holiday_turn_info.get(id)
    
    return holiday_turn_info.indexOf(__index_id[ id ])
     
end



function holiday_turn_info.set(id, key, value)
    local record = holiday_turn_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function holiday_turn_info.get_index_data()
    return __index_id 
end

return  holiday_turn_info 