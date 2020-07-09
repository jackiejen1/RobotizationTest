---@classdef record_city_process_model_info
local record_city_process_model_info = {}


record_city_process_model_info.id = 0--巡逻方式
record_city_process_model_info.type = 0--巡逻类型
record_city_process_model_info.name =  ""--巡逻类型
record_city_process_model_info.time_type = 0--时长序号
record_city_process_model_info.time_duration = 0--巡逻时长（秒）
record_city_process_model_info.time_interval = 0--收益间隔（秒）
record_city_process_model_info.knight_reward_multiple = 0--专属奖励倍数
record_city_process_model_info.cost_type_1 = 0--消耗1类型
record_city_process_model_info.cost_value_1 = 0--消耗1类型值
record_city_process_model_info.cost_size_1 = 0--消耗1数量
record_city_process_model_info.cost_type_2 = 0--消耗2类型
record_city_process_model_info.cost_value_2 = 0--消耗2类型值
record_city_process_model_info.cost_size_2 = 0--消耗2数量

local city_process_model_info = {
   _data = {   
    [1] = {1,1,"普通",1,14400,1800,1,1,4,5,0,0,0,},  
    [2] = {2,1,"普通",2,28800,1800,2,1,4,10,0,0,0,},  
    [3] = {3,1,"普通",3,43200,1800,3,1,4,15,0,0,0,},  
    [4] = {4,2,"中级",1,14400,1200,1,999,0,30,0,0,0,},  
    [5] = {5,2,"中级",2,28800,1200,2,999,0,60,0,0,0,},  
    [6] = {6,2,"中级",3,43200,1200,3,999,0,90,0,0,0,},  
    [7] = {7,3,"高级",1,14400,600,1,999,0,60,0,0,0,},  
    [8] = {8,3,"高级",2,28800,600,2,999,0,120,0,0,0,},  
    [9] = {9,3,"高级",3,43200,600,3,999,0,180,0,0,0,},
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
}

local __key_map = { 
    id = 1,
    type = 2,
    name = 3,
    time_type = 4,
    time_duration = 5,
    time_interval = 6,
    knight_reward_multiple = 7,
    cost_type_1 = 8,
    cost_value_1 = 9,
    cost_size_1 = 10,
    cost_type_2 = 11,
    cost_value_2 = 12,
    cost_size_2 = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_city_process_model_info")

        return t._raw[__key_map[k]]
    end
}


function city_process_model_info.getLength()
    return #city_process_model_info._data
end



function city_process_model_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_city_process_model_info
function city_process_model_info.indexOf(index)
    if index == nil or not city_process_model_info._data[index] then
        return nil
    end
    return setmetatable({_raw = city_process_model_info._data[index]}, m)
end



---
--@return @class record_city_process_model_info
function city_process_model_info.get(id)
    
    return city_process_model_info.indexOf(__index_id[ id ])
     
end



function city_process_model_info.set(id, key, value)
    local record = city_process_model_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function city_process_model_info.get_index_data()
    return __index_id 
end

return  city_process_model_info 