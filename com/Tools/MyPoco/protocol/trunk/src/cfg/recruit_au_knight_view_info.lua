---@classdef record_recruit_au_knight_view_info
local record_recruit_au_knight_view_info = {}


record_recruit_au_knight_view_info.id = 0--编号
record_recruit_au_knight_view_info.bookmark = 0--所属页签
record_recruit_au_knight_view_info.if_hot = 0--是否热点
record_recruit_au_knight_view_info.type = 0--道具类型
record_recruit_au_knight_view_info.value = 0--道具值
record_recruit_au_knight_view_info.probability = 0--显示概率

local recruit_au_knight_view_info = {
   _data = {   
    [1] = {1,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    bookmark = 2,
    if_hot = 3,
    type = 4,
    value = 5,
    probability = 6,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_au_knight_view_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_au_knight_view_info.getLength()
    return #recruit_au_knight_view_info._data
end



function recruit_au_knight_view_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_au_knight_view_info
function recruit_au_knight_view_info.indexOf(index)
    if index == nil or not recruit_au_knight_view_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_au_knight_view_info._data[index]}, m)
end



---
--@return @class record_recruit_au_knight_view_info
function recruit_au_knight_view_info.get(id)
    
    return recruit_au_knight_view_info.indexOf(__index_id[ id ])
     
end



function recruit_au_knight_view_info.set(id, key, value)
    local record = recruit_au_knight_view_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_au_knight_view_info.get_index_data()
    return __index_id 
end

return  recruit_au_knight_view_info 