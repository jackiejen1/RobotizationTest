---@classdef record_mine_city_info
local record_mine_city_info = {}


record_mine_city_info.id = 0--ID
record_mine_city_info.preduce_speed = 0--元宝产出速率
record_mine_city_info.occu_bonus = 0--占领加成
record_mine_city_info.exclusive_bonus = 0--独占加成
record_mine_city_info.attack_spend_type = 0--攻击消耗类型
record_mine_city_info.attack_spend_value = 0--攻击消耗类型值
record_mine_city_info.attack_spend_num = 0--攻击消耗数量
record_mine_city_info.city_fraction = 0--城池积分
record_mine_city_info.station_num = 0--安全容量
record_mine_city_info.unit_over_num = 0--单位超员人数
record_mine_city_info.unit_over_rate = 0--单位超员减益
record_mine_city_info.max_decrease = 0--超员减益上限

local mine_city_info = {
   _data = {   
    [1] = {1,0,0,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,300,150,200,1,35,2,0,50,5,100,600,},  
    [3] = {3,400,150,200,1,35,2,200,50,5,100,600,},  
    [4] = {4,600,150,200,1,35,2,1166,50,5,100,600,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,
}

local __key_map = { 
    id = 1,
    preduce_speed = 2,
    occu_bonus = 3,
    exclusive_bonus = 4,
    attack_spend_type = 5,
    attack_spend_value = 6,
    attack_spend_num = 7,
    city_fraction = 8,
    station_num = 9,
    unit_over_num = 10,
    unit_over_rate = 11,
    max_decrease = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_city_info")

        return t._raw[__key_map[k]]
    end
}


function mine_city_info.getLength()
    return #mine_city_info._data
end



function mine_city_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_city_info
function mine_city_info.indexOf(index)
    if index == nil or not mine_city_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_city_info._data[index]}, m)
end



---
--@return @class record_mine_city_info
function mine_city_info.get(id)
    
    return mine_city_info.indexOf(__index_id[ id ])
     
end



function mine_city_info.set(id, key, value)
    local record = mine_city_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_city_info.get_index_data()
    return __index_id 
end

return  mine_city_info 