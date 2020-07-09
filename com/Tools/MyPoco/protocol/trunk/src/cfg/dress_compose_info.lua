---@classdef record_dress_compose_info
local record_dress_compose_info = {}


record_dress_compose_info.id = 0--图鉴ID
record_dress_compose_info.arrange = 0--排序
record_dress_compose_info.name =  ""--名字
record_dress_compose_info.dress_1 = 0--时装1
record_dress_compose_info.dress_2 = 0--时装2
record_dress_compose_info.dress_3 = 0--时装3
record_dress_compose_info.attribute_type_1 = 0--属性1类型
record_dress_compose_info.attribute_value_1 = 0--属性1值
record_dress_compose_info.attribute_type_2 = 0--属性2类型
record_dress_compose_info.attribute_value_2 = 0--属性2值
record_dress_compose_info.attribute_type_3 = 0--属性3类型
record_dress_compose_info.attribute_value_3 = 0--属性3值
record_dress_compose_info.attribute_type_4 = 0--属性4类型
record_dress_compose_info.attribute_value_4 = 0--属性4值
record_dress_compose_info.game_type = 0--显示包体

local dress_compose_info = {
   _data = {   
    [1] = {1,2,"直捣黄龙",200,300,0,2,8700,206,50,0,0,0,0,0,},  
    [2] = {2,1,"一剑惊雷",100,0,0,1,83000,205,50,0,0,0,0,0,},  
    [3] = {3,3,"征战四方",500,600,0,2,20000,205,100,206,100,0,0,0,},  
    [4] = {4,4,"追魂夺命",400,0,0,5,5000,207,100,208,100,0,0,0,},  
    [5] = {5,6,"大道无形",700,0,0,1,1000000,207,150,208,150,0,0,0,},  
    [6] = {6,7,"真龙在世",800,0,0,2,52630,207,150,208,150,0,0,0,},  
    [7] = {7,8,"盖世英雄",900,0,0,5,13150,207,150,208,150,0,0,0,},  
    [8] = {8,5,"镇魂长歌",1000,0,0,1,30000,5,1000,0,0,0,0,1,},
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
    arrange = 2,
    name = 3,
    dress_1 = 4,
    dress_2 = 5,
    dress_3 = 6,
    attribute_type_1 = 7,
    attribute_value_1 = 8,
    attribute_type_2 = 9,
    attribute_value_2 = 10,
    attribute_type_3 = 11,
    attribute_value_3 = 12,
    attribute_type_4 = 13,
    attribute_value_4 = 14,
    game_type = 15,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_dress_compose_info")

        return t._raw[__key_map[k]]
    end
}


function dress_compose_info.getLength()
    return #dress_compose_info._data
end



function dress_compose_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_dress_compose_info
function dress_compose_info.indexOf(index)
    if index == nil or not dress_compose_info._data[index] then
        return nil
    end
    return setmetatable({_raw = dress_compose_info._data[index]}, m)
end



---
--@return @class record_dress_compose_info
function dress_compose_info.get(id)
    
    return dress_compose_info.indexOf(__index_id[ id ])
     
end



function dress_compose_info.set(id, key, value)
    local record = dress_compose_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function dress_compose_info.get_index_data()
    return __index_id 
end

return  dress_compose_info 