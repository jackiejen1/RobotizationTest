---@classdef record_gvg_info
local record_gvg_info = {}


record_gvg_info.id = 0--ID
record_gvg_info.end_time_1 = 0--阶段一结束时间
record_gvg_info.end_time_2 = 0--阶段二结束时间
record_gvg_info.people_num = 0--自动报名所需参战人数
record_gvg_info.map_1 = 0--地图1ID
record_gvg_info.map_1_type = 0--地图1模式
record_gvg_info.map_2 = 0--地图2ID
record_gvg_info.map_2_type = 0--地图2模式
record_gvg_info.mvp_reward = 0--最佳奖励
record_gvg_info.mars_reward = 0--战神奖励

local gvg_info = {
   _data = {   
    [1] = {1,2,5,20,9002,1,9002,1,601,602,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    end_time_1 = 2,
    end_time_2 = 3,
    people_num = 4,
    map_1 = 5,
    map_1_type = 6,
    map_2 = 7,
    map_2_type = 8,
    mvp_reward = 9,
    mars_reward = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_gvg_info")

        return t._raw[__key_map[k]]
    end
}


function gvg_info.getLength()
    return #gvg_info._data
end



function gvg_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_gvg_info
function gvg_info.indexOf(index)
    if index == nil or not gvg_info._data[index] then
        return nil
    end
    return setmetatable({_raw = gvg_info._data[index]}, m)
end



---
--@return @class record_gvg_info
function gvg_info.get(id)
    
    return gvg_info.indexOf(__index_id[ id ])
     
end



function gvg_info.set(id, key, value)
    local record = gvg_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function gvg_info.get_index_data()
    return __index_id 
end

return  gvg_info 