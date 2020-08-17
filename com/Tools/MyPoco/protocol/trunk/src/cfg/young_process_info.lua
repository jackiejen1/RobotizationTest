---@classdef record_young_process_info
local record_young_process_info = {}


record_young_process_info.id = 0--编号
record_young_process_info.young_id = 0--所属活动ID
record_young_process_info.target_num = 0--节点进度
record_young_process_info.type = 0--节点类型
record_young_process_info.show_activity = 0--节点展示页
record_young_process_info.name =  ""--节点名称
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
    [1] = {1,1,2500000,1,2,"百亿福利",1,"百亿福利",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [2] = {2,1,5000000,1,3,"镇魂外传",2,"镇魂外传",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [3] = {3,1,8000000,1,1,"庆典狂欢",3,"庆典狂欢",999,0,1166,3,194,16,1,37,66,1,3,1616616,0,0,0,},  
    [4] = {4,1,10000000,2,4,"百亿大礼包",0,"百亿大礼包",999,0,16161,9,120,1,1,37,616,3,2353,1,3,6,116,},  
    [5] = {5,2,1000000,1,3,"时空外传",6,"时空外传",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [6] = {6,2,3000000,1,2,"福利放送",7,"福利放送",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [7] = {7,2,5000000,1,1,"夏日商城",8,"夏日商城",999,0,888,3,217,15,1,37,58,1,3,1588888,0,0,0,},  
    [8] = {8,2,8000000,2,4,"夏日大礼包",0,"夏日大礼包",999,0,10888,9,121,1,1,37,588,3,2006,1,3,6,118,},
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
}

local __key_map = { 
    id = 1,
    young_id = 2,
    target_num = 3,
    type = 4,
    show_activity = 5,
    name = 6,
    next_id = 7,
    desc = 8,
    award_type1 = 9,
    award_value1 = 10,
    award_num1 = 11,
    award_type2 = 12,
    award_value2 = 13,
    award_num2 = 14,
    award_type3 = 15,
    award_value3 = 16,
    award_num3 = 17,
    award_type4 = 18,
    award_value4 = 19,
    award_num4 = 20,
    award_type5 = 21,
    award_value5 = 22,
    award_num5 = 23,
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