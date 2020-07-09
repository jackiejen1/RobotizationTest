---@classdef record_mine_event_info
local record_mine_event_info = {}


record_mine_event_info.id = 0--ID
record_mine_event_info.name =  ""--事件名称
record_mine_event_info.desc = 0--事件描述
record_mine_event_info.refresh_time = 0--刷新时间
record_mine_event_info.attack_spend_rate = 0--攻击次数消耗加成
record_mine_event_info.hp_spend_rate = 0--兵力消耗加成
record_mine_event_info.cap_preduce_speed = 0--丰产速率
record_mine_event_info.city_fraction_rate = 0--烽火积分加成
record_mine_event_info.preduce_speed_rate1 = 0--烽火加成
record_mine_event_info.random_city1 = 0--随机城池类型
record_mine_event_info.random_num1 = 0--随机数量1
record_mine_event_info.random_city2 = 0--随机城池2
record_mine_event_info.random_num2 = 0--随机数量2
record_mine_event_info.random_city3 = 0--随机城池3
record_mine_event_info.random_num3 = 0--随机数量3

local mine_event_info = {
   _data = {   
    [1] = {1,"普通丰产城池",5,43200,500,0,0,2000,2000,2,2,3,1,4,1,},  
    [2] = {2,"丰产据点",4,43200,500,0,300,0,0,1,4,0,0,0,0,},  
    [3] = {3,"高级丰产城池",5,43200,500,0,0,2000,3000,0,1,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,
}

local __key_map = { 
    id = 1,
    name = 2,
    desc = 3,
    refresh_time = 4,
    attack_spend_rate = 5,
    hp_spend_rate = 6,
    cap_preduce_speed = 7,
    city_fraction_rate = 8,
    preduce_speed_rate1 = 9,
    random_city1 = 10,
    random_num1 = 11,
    random_city2 = 12,
    random_num2 = 13,
    random_city3 = 14,
    random_num3 = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_event_info")

        return t._raw[__key_map[k]]
    end
}


function mine_event_info.getLength()
    return #mine_event_info._data
end



function mine_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_event_info
function mine_event_info.indexOf(index)
    if index == nil or not mine_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_event_info._data[index]}, m)
end



---
--@return @class record_mine_event_info
function mine_event_info.get(id)
    
    return mine_event_info.indexOf(__index_id[ id ])
     
end



function mine_event_info.set(id, key, value)
    local record = mine_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_event_info.get_index_data()
    return __index_id 
end

return  mine_event_info 