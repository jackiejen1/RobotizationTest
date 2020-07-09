---@classdef record_mine_desc_info
local record_mine_desc_info = {}


record_mine_desc_info.id = 0--id
record_mine_desc_info.name =  ""--名称
record_mine_desc_info.icon =  ""--图标
record_mine_desc_info.simple_desc =  ""--简短描述
record_mine_desc_info.stage_desc =  ""--赛季描述

local mine_desc_info = {
   _data = {   
    [1] = {1,"赛季开启","1","赛季开启,战火初燃","战火初燃,赛季开启",},  
    [2] = {2,"赛区激战","2","军令消耗减半","军令减半,畅快激战",},  
    [3] = {3,"赛季休整","1","结算发奖,止戈休战","结算发奖,止戈休战",},  
    [4] = {4,"丰产据点","1","据点产出元宝","据点产出元宝",},  
    [5] = {5,"丰产城池","2","军令消耗减半","军令消耗减半",},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,  
    [3] = 3,  
    [4] = 4,  
    [5] = 5,
}

local __key_map = { 
    id = 1,
    name = 2,
    icon = 3,
    simple_desc = 4,
    stage_desc = 5,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_mine_desc_info")

        return t._raw[__key_map[k]]
    end
}


function mine_desc_info.getLength()
    return #mine_desc_info._data
end



function mine_desc_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_mine_desc_info
function mine_desc_info.indexOf(index)
    if index == nil or not mine_desc_info._data[index] then
        return nil
    end
    return setmetatable({_raw = mine_desc_info._data[index]}, m)
end



---
--@return @class record_mine_desc_info
function mine_desc_info.get(id)
    
    return mine_desc_info.indexOf(__index_id[ id ])
     
end



function mine_desc_info.set(id, key, value)
    local record = mine_desc_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function mine_desc_info.get_index_data()
    return __index_id 
end

return  mine_desc_info 