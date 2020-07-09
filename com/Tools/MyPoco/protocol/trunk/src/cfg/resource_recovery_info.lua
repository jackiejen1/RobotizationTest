---@classdef record_resource_recovery_info
local record_resource_recovery_info = {}


record_resource_recovery_info.id = 0--ID
record_resource_recovery_info.name =  ""--功能名字
record_resource_recovery_info.function_id = 0--功能id
record_resource_recovery_info.type = 0--资源返还类型
record_resource_recovery_info.normal_cost = 0--普通返还消耗数量
record_resource_recovery_info.buy_cost = 0--购买返还消耗数量

local resource_recovery_info = {
   _data = {   
    [1] = {1,"竞技场",10003,1,30000,30,},  
    [2] = {2,"列传战役",10032,2,50000,50,},  
    [3] = {4,"日常副本-武将经验",10030,4,30000,30,},  
    [4] = {5,"日常副本-银币副本",10030,5,30000,30,},  
    [5] = {6,"日常副本-合击精华",10030,6,30000,30,},  
    [6] = {7,"日常副本-神器强化",10030,7,30000,30,},  
    [7] = {8,"日常副本-宝物经验",10030,8,30000,30,},  
    [8] = {9,"无双试炼",10009,9,100000,100,},  
    [9] = {10,"活动-领体力",20015,10,50000,50,},  
    [10] = {11,"神兽秘境",20092,11,50000,50,},  
    [11] = {12,"本服神兽",10036,12,50000,50,},  
    [12] = {13,"决战定军山",10037,13,50000,50,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [4] = 3,  
    [5] = 4,  
    [6] = 5,  
    [7] = 6,  
    [8] = 7,  
    [9] = 8,  
    [10] = 9,  
    [11] = 10,  
    [12] = 11,  
    [13] = 12,
}

local __key_map = { 
    id = 1,
    name = 2,
    function_id = 3,
    type = 4,
    normal_cost = 5,
    buy_cost = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_resource_recovery_info")

        return t._raw[__key_map[k]]
    end
}


function resource_recovery_info.getLength()
    return #resource_recovery_info._data
end



function resource_recovery_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_resource_recovery_info
function resource_recovery_info.indexOf(index)
    if index == nil or not resource_recovery_info._data[index] then
        return nil
    end
    return setmetatable({_raw = resource_recovery_info._data[index]}, m)
end



---
--@return @class record_resource_recovery_info
function resource_recovery_info.get(id)
    
    return resource_recovery_info.indexOf(__index_id[ id ])
     
end



function resource_recovery_info.set(id, key, value)
    local record = resource_recovery_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function resource_recovery_info.get_index_data()
    return __index_id 
end

return  resource_recovery_info 