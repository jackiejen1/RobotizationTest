---@classdef record_flamecity_event_info
local record_flamecity_event_info = {}


record_flamecity_event_info.id = 0--id
record_flamecity_event_info.block_id = 0--格子
record_flamecity_event_info.map_id = 0--地图
record_flamecity_event_info.type = 0--事件类型
record_flamecity_event_info.value = 0--事件类型值
record_flamecity_event_info.description =  ""--事件描述
record_flamecity_event_info.notice_id = 0--走马灯信息

local flamecity_event_info = {
   _data = {   
    [1] = {1001,13,101,1,29,"占领后解锁小宝箱",2109,},  
    [2] = {1002,14,101,3,1001,"占领后城池降低耐久值30%",2110,},  
    [3] = {1003,14,101,2,13,"解锁箭塔",2111,},  
    [4] = {1004,14,101,5,0,"该章节支线通关+1",2112,},  
    [5] = {1005,8,101,4,0,"该章节主线通关",2113,},  
    [6] = {1006,8,101,1,12,"占领后解锁大宝箱",2114,},  
    [7] = {1007,14,101,1,28,"占领后解锁大宝箱",2114,},
    }
}

local __index_id = {   
    [1001] = 1,  
    [1002] = 2,  
    [1003] = 3,  
    [1004] = 4,  
    [1005] = 5,  
    [1006] = 6,  
    [1007] = 7,
}

local __key_map = { 
    id = 1,
    block_id = 2,
    map_id = 3,
    type = 4,
    value = 5,
    description = 6,
    notice_id = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_flamecity_event_info")

        return t._raw[__key_map[k]]
    end
}


function flamecity_event_info.getLength()
    return #flamecity_event_info._data
end



function flamecity_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_flamecity_event_info
function flamecity_event_info.indexOf(index)
    if index == nil or not flamecity_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = flamecity_event_info._data[index]}, m)
end



---
--@return @class record_flamecity_event_info
function flamecity_event_info.get(id)
    
    return flamecity_event_info.indexOf(__index_id[ id ])
     
end



function flamecity_event_info.set(id, key, value)
    local record = flamecity_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function flamecity_event_info.get_index_data()
    return __index_id 
end

return  flamecity_event_info 