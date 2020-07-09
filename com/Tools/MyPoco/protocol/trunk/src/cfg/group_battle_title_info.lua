---@classdef record_group_battle_title_info
local record_group_battle_title_info = {}


record_group_battle_title_info.id = 0--id
record_group_battle_title_info.rank = 0--需求排名
record_group_battle_title_info.limit = 0--最低荣誉值
record_group_battle_title_info.title =  ""--对应称号
record_group_battle_title_info.title_res =  ""--对应资源
record_group_battle_title_info.talent = 0--称号天赋
record_group_battle_title_info.quality = 0--品质

local group_battle_title_info = {
   _data = {   
    [1] = {1,0,0,"一介武夫","1",0,1,},  
    [2] = {2,0,500,"初出茅庐","2",180001,2,},  
    [3] = {3,0,2000,"崭露头角","3",180002,3,},  
    [4] = {4,0,5000,"脱颖而出","4",180003,4,},  
    [5] = {5,200,5000,"黄沙百战","5",180004,5,},  
    [6] = {6,100,5000,"一骑当千","6",180005,6,},  
    [7] = {7,10,5000,"声名显赫","7",180006,6,},  
    [8] = {8,1,5000,"国士无双","8",180007,7,},
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
}

local __key_map = { 
    id = 1,
    rank = 2,
    limit = 3,
    title = 4,
    title_res = 5,
    talent = 6,
    quality = 7,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_group_battle_title_info")

        return t._raw[__key_map[k]]
    end
}


function group_battle_title_info.getLength()
    return #group_battle_title_info._data
end



function group_battle_title_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_group_battle_title_info
function group_battle_title_info.indexOf(index)
    if index == nil or not group_battle_title_info._data[index] then
        return nil
    end
    return setmetatable({_raw = group_battle_title_info._data[index]}, m)
end



---
--@return @class record_group_battle_title_info
function group_battle_title_info.get(id)
    
    return group_battle_title_info.indexOf(__index_id[ id ])
     
end



function group_battle_title_info.set(id, key, value)
    local record = group_battle_title_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function group_battle_title_info.get_index_data()
    return __index_id 
end

return  group_battle_title_info 