---@classdef record_mine_rank_info
local record_mine_rank_info = {}


record_mine_rank_info.id = 0--id
record_mine_rank_info.order = 0--排序
record_mine_rank_info.name =  ""--档位名称
record_mine_rank_info.type = 0--城池类型
record_mine_rank_info.if_event = 0--是否丰产
record_mine_rank_info.dorp_id = 0--排名奖励

local mine_rank_info = {
   _data = {   
    [1] = {1,1,"州城(丰产)",4,1,601,},  
    [2] = {2,2,"州城",4,2,602,},  
    [3] = {3,3,"郡城(丰产)",3,1,603,},  
    [4] = {4,4,"郡城",3,2,604,},  
    [5] = {5,5,"县城(丰产)",2,1,605,},  
    [6] = {6,6,"县城",2,2,606,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,  
    [6] = 6,
}

local __key_map = { 
    id = 1,
    order = 2,
    name = 3,
    type = 4,
    if_event = 5,
    dorp_id = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_rank_info")

        return t._raw[__key_map[k]]
    end
}


function mine_rank_info.getLength()
    return #mine_rank_info._data
end



function mine_rank_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_rank_info
function mine_rank_info.indexOf(index)
    if index == nil or not mine_rank_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_rank_info._data[index]}, m)
end



---
--@return @class record_mine_rank_info
function mine_rank_info.get(id)
    
    return mine_rank_info.indexOf(__index_id[ id ])
     
end



function mine_rank_info.set(id, key, value)
    local record = mine_rank_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_rank_info.get_index_data()
    return __index_id 
end

return  mine_rank_info 