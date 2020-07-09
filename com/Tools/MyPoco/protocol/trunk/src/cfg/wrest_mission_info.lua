---@classdef record_wrest_mission_info
local record_wrest_mission_info = {}


record_wrest_mission_info.id = 0--编号
record_wrest_mission_info.name =  ""--任务名称
record_wrest_mission_info.target = 0--任务目标
record_wrest_mission_info.num = 0--任务目标值
record_wrest_mission_info.sort = 0--排序值
record_wrest_mission_info.description =  ""--任务描述
record_wrest_mission_info.drop_id = 0--任务奖励

local wrest_mission_info = {
   _data = {   
    [1] = {1,"战斗达人·一",1099,5,1,"主动挑战他人5次",500001,},  
    [2] = {2,"战斗达人·二",1099,10,2,"主动挑战他人10次",500002,},  
    [3] = {3,"战斗达人·三",1099,15,3,"主动挑战他人15次",500003,},  
    [4] = {4,"战斗达人·四",1099,25,4,"主动挑战他人25次",500004,},  
    [5] = {5,"战斗达人·五",1099,35,5,"主动挑战他人35次",500005,},  
    [6] = {6,"战斗达人·六",1099,45,6,"主动挑战他人45次",500006,},  
    [7] = {7,"战斗达人·七",1099,60,7,"主动挑战他人60次",500007,},  
    [8] = {8,"战斗达人·八",1099,80,8,"主动挑战他人80次",500008,},  
    [9] = {9,"战斗达人·九",1099,100,9,"主动挑战他人100次",500009,},  
    [10] = {10,"战斗达人·十",1099,120,10,"主动挑战他人120次",500010,},
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
}

local __key_map = { 
    id = 1,
    name = 2,
    target = 3,
    num = 4,
    sort = 5,
    description = 6,
    drop_id = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wrest_mission_info")

        return t._raw[__key_map[k]]
    end
}


function wrest_mission_info.getLength()
    return #wrest_mission_info._data
end



function wrest_mission_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wrest_mission_info
function wrest_mission_info.indexOf(index)
    if index == nil or not wrest_mission_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wrest_mission_info._data[index]}, m)
end



---
--@return @class record_wrest_mission_info
function wrest_mission_info.get(id)
    
    return wrest_mission_info.indexOf(__index_id[ id ])
     
end



function wrest_mission_info.set(id, key, value)
    local record = wrest_mission_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wrest_mission_info.get_index_data()
    return __index_id 
end

return  wrest_mission_info 