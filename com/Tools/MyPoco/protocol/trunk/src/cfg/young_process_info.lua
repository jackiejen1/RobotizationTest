---@classdef record_young_process_info
local record_young_process_info = {}


record_young_process_info.id = 0--编号
record_young_process_info.young_id = 0--所属活动ID
record_young_process_info.target_num = 0--节点进度
record_young_process_info.type = 0--节点类型
record_young_process_info.show_activity = 0--节点展示页
record_young_process_info.name =  ""--节点名称
record_young_process_info.icon =  ""--主界面图标
record_young_process_info.image =  ""--弹窗底板角色
record_young_process_info.title =  ""--标题美术字
record_young_process_info.activity_des =  ""--活动说明
record_young_process_info.icon_name_1 =  ""--图标名称1
record_young_process_info.icon_name_2 =  ""--图标名称2
record_young_process_info.next_id = 0--下一个节点
record_young_process_info.desc =  ""--节点说明
record_young_process_info.award_type1 = 0--奖励类型1
record_young_process_info.award_value1 = 0--奖励类型值1
record_young_process_info.award_num1 = 0--奖励数量1
record_young_process_info.award_type2 = 0--奖励类型2
record_young_process_info.award_value2 = 0--奖励类型值2
record_young_process_info.award_num2 = 0--奖励数量2
record_young_process_info.award_type3 = 0--奖励类型3
record_young_process_info.award_value3 = 0--奖励类型值3
record_young_process_info.award_num3 = 0--奖励数量3
record_young_process_info.award_type4 = 0--奖励类型4
record_young_process_info.award_value4 = 0--奖励类型值4
record_young_process_info.award_num4 = 0--奖励数量4
record_young_process_info.award_type5 = 0--奖励类型5
record_young_process_info.award_value5 = 0--奖励类型值5
record_young_process_info.award_num5 = 0--奖励数量5

local young_process_info = {
   _data = {   
    [1] = {1,1,2500000,1,2,"百亿福利","0","0","0","0","0","0",1,"百亿福利",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [2] = {2,1,5000000,1,3,"镇魂外传","0","0","0","0","0","0",2,"镇魂外传",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [3] = {3,1,8000000,1,1,"庆典狂欢","0","0","0","0","0","0",3,"庆典狂欢",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [4] = {4,1,10000000,2,4,"百亿大礼包","0","0","0","0","0","0",0,"百亿大礼包",999,0,16161,9,120,1,1,37,616,3,2353,1,3,6,116,},  
    [5] = {5,2,1000000,1,3,"时空外传","0","0","0","0","0","0",6,"时空外传",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [6] = {6,2,3000000,1,2,"福利放送","0","0","0","0","0","0",7,"福利放送",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [7] = {7,2,5000000,1,1,"夏日商城","0","0","0","0","0","0",8,"夏日商城",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [8] = {8,2,8000000,2,4,"夏日大礼包","0","0","0","0","0","0",0,"夏日大礼包",999,0,10888,9,121,1,1,37,588,3,2006,1,3,6,118,},  
    [9] = {9,3,1000000,1,3,"太公秘闻","icon_taigongmiwen","jzy_tc_shikong","jzy_bt_taigongmiwen","10月2日开启时空外传活动副本，获得珍稀灵宝","0","0",6,"太公秘闻",999,0,888,3,248,15,1,37,58,1,3,1588888,0,0,0,},  
    [10] = {10,3,3000000,1,2,"封神福利","icon_fuli","jzy_tc_fuli","jzy_bt_fengshenfuli","10月10日开启红包雨和元宝福袋，大量福利等你拿","元宝福袋","红包雨",7,"封神福利",999,0,888,3,248,15,1,37,58,1,3,1588888,0,0,0,},  
    [11] = {11,3,5000000,1,1,"太公商城","icon_taigongshangdian","jzy_tc_shangcheng","jzy_bt_taigongsc","（10月10日正式开启）","0","0",8,"太公商城",999,0,888,3,248,15,1,37,58,1,3,1588888,0,0,0,},  
    [12] = {12,3,8000000,2,4,"封神大礼包","icon_fengshendalibao","jzy_tc_dalibao","jzy_bt_fengshenlibao","太公降世，豪礼相伴","0","0",0,"封神大礼包",999,0,10888,9,122,1,11,1100,1,1,37,588,3,6,118,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,  
    [7] = 7,  
    [8] = 8,  
    [9] = 9,  
    [10] = 10,  
    [11] = 11,  
    [12] = 12,
}

local __key_map = { 
    id = 1,
    young_id = 2,
    target_num = 3,
    type = 4,
    show_activity = 5,
    name = 6,
    icon = 7,
    image = 8,
    title = 9,
    activity_des = 10,
    icon_name_1 = 11,
    icon_name_2 = 12,
    next_id = 13,
    desc = 14,
    award_type1 = 15,
    award_value1 = 16,
    award_num1 = 17,
    award_type2 = 18,
    award_value2 = 19,
    award_num2 = 20,
    award_type3 = 21,
    award_value3 = 22,
    award_num3 = 23,
    award_type4 = 24,
    award_value4 = 25,
    award_num4 = 26,
    award_type5 = 27,
    award_value5 = 28,
    award_num5 = 29,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_young_process_info")

        return t._raw[__key_map[k]]
    end
}


function young_process_info.getLength()
    return #young_process_info._data
end



function young_process_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_young_process_info
function young_process_info.indexOf(index)
    if index == nil or not young_process_info._data[index] then
        return nil
    end
    return setmetatable({_raw = young_process_info._data[index]}, m)
end



---
--@return @class record_young_process_info
function young_process_info.get(id)
    
    return young_process_info.indexOf(__index_id[ id ])
     
end



function young_process_info.set(id, key, value)
    local record = young_process_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function young_process_info.get_index_data()
    return __index_id 
end

return  young_process_info 