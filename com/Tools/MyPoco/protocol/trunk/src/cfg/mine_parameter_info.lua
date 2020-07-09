---@classdef record_mine_parameter_info
local record_mine_parameter_info = {}


record_mine_parameter_info.id = 0--ID
record_mine_parameter_info.began_time = 0--玩法开启点
record_mine_parameter_info.open_time = 0--赛季开启
record_mine_parameter_info.war_time = 0--全面战争时间
record_mine_parameter_info.end_time = 0--赛季结束时间
record_mine_parameter_info.full_service_time = 0--进入跨服所需天数
record_mine_parameter_info.max_gold = 0--元宝上限
record_mine_parameter_info.war_spend_num = 0--战争攻击次数
record_mine_parameter_info.move_spend = 0--移动消耗
record_mine_parameter_info.max_hp = 0--兵力上限
record_mine_parameter_info.move_hp = 0--出国都所需兵力
record_mine_parameter_info.conversion_rate = 0--兵力转化比例

local mine_parameter_info = {
   _data = {   
    [1] = {1,43200,475200,417600,424800,7,3000,1,10,100,50,1,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    began_time = 2,
    open_time = 3,
    war_time = 4,
    end_time = 5,
    full_service_time = 6,
    max_gold = 7,
    war_spend_num = 8,
    move_spend = 9,
    max_hp = 10,
    move_hp = 11,
    conversion_rate = 12,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_parameter_info")

        return t._raw[__key_map[k]]
    end
}


function mine_parameter_info.getLength()
    return #mine_parameter_info._data
end



function mine_parameter_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_parameter_info
function mine_parameter_info.indexOf(index)
    if index == nil or not mine_parameter_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_parameter_info._data[index]}, m)
end



---
--@return @class record_mine_parameter_info
function mine_parameter_info.get(id)
    
    return mine_parameter_info.indexOf(__index_id[ id ])
     
end



function mine_parameter_info.set(id, key, value)
    local record = mine_parameter_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_parameter_info.get_index_data()
    return __index_id 
end

return  mine_parameter_info 