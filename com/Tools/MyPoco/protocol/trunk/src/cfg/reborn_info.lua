---@classdef record_reborn_info
local record_reborn_info = {}


record_reborn_info.id = 0--ID
record_reborn_info.name =  ""--系统名称
record_reborn_info.type = 0--系统类型
record_reborn_info.reborn_type = 0--回收类型
record_reborn_info.open_level = 0--开启等级
record_reborn_info.cost_type = 0--消耗类型
record_reborn_info.cost_value = 0--消耗类型值
record_reborn_info.cost_size = 0--消耗数量
record_reborn_info.route_id = 0--跳转路径
record_reborn_info.pic =  ""--美术图

local reborn_info = {
   _data = {   
    [1] = {1,"武将重生",1,1,10,999,0,30,4,"0",},  
    [2] = {2,"兵符重生",2,1,10,999,0,30,5,"0",},  
    [3] = {3,"装备重生",3,1,10,999,0,30,6,"0",},  
    [4] = {4,"宝物重生",4,1,10,0,0,0,7,"0",},  
    [5] = {5,"时装重生",5,1,10,999,0,30,8,"0",},  
    [6] = {6,"装备分解",3,2,10,0,0,0,9,"0",},  
    [7] = {7,"神兵重生",6,1,10,999,0,30,169,"0",},  
    [8] = {8,"神兵分解",6,2,10,0,0,0,170,"0",},  
    [9] = {9,"神兽重生",8,1,10,999,0,30,169,"0",},  
    [10] = {10,"神兽分解",8,2,10,0,0,0,170,"0",},  
    [11] = {11,"神兽装备重生",7,1,10,999,0,30,169,"0",},
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
    [11] = 11,
}

local __key_map = { 
    id = 1,
    name = 2,
    type = 3,
    reborn_type = 4,
    open_level = 5,
    cost_type = 6,
    cost_value = 7,
    cost_size = 8,
    route_id = 9,
    pic = 10,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_reborn_info")

        return t._raw[__key_map[k]]
    end
}


function reborn_info.getLength()
    return #reborn_info._data
end



function reborn_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_reborn_info
function reborn_info.indexOf(index)
    if index == nil or not reborn_info._data[index] then
        return nil
    end
    return setmetatable({_raw = reborn_info._data[index]}, m)
end



---
--@return @class record_reborn_info
function reborn_info.get(id)
    
    return reborn_info.indexOf(__index_id[ id ])
     
end



function reborn_info.set(id, key, value)
    local record = reborn_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function reborn_info.get_index_data()
    return __index_id 
end

return  reborn_info 