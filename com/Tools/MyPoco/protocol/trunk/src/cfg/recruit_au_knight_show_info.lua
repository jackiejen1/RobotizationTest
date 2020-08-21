---@classdef record_recruit_au_knight_show_info
local record_recruit_au_knight_show_info = {}


record_recruit_au_knight_show_info.id = 0--ID
record_recruit_au_knight_show_info.open = 0--活动id
record_recruit_au_knight_show_info.name =  ""--活动名称
record_recruit_au_knight_show_info.knight_id = 0--武将ID
record_recruit_au_knight_show_info.reward_view = 0--奖池预览
record_recruit_au_knight_show_info.cost_gain_1 = 0--购买类型（1次）
record_recruit_au_knight_show_info.cost_gain_10 = 0--购买类型（10次）
record_recruit_au_knight_show_info.recruit_knight_1 = 0--神将卡池
record_recruit_au_knight_show_info.recruit_knight_10 = 0--十连保底
record_recruit_au_knight_show_info.recruit_knight_20 = 0--20连保底
record_recruit_au_knight_show_info.show_type = 0--背景显示类型
record_recruit_au_knight_show_info.show_value = 0--背景显示类型值
record_recruit_au_knight_show_info.show_logo = 0--标题显示类型

local recruit_au_knight_show_info = {
   _data = {   
    [1] = {1,0,"",0,0,0,0,0,0,0,0,0,0,},  
    [2] = {2,0,"",0,0,0,0,0,0,0,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    open = 2,
    name = 3,
    knight_id = 4,
    reward_view = 5,
    cost_gain_1 = 6,
    cost_gain_10 = 7,
    recruit_knight_1 = 8,
    recruit_knight_10 = 9,
    recruit_knight_20 = 10,
    show_type = 11,
    show_value = 12,
    show_logo = 13,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_au_knight_show_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_au_knight_show_info.getLength()
    return #recruit_au_knight_show_info._data
end



function recruit_au_knight_show_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_au_knight_show_info
function recruit_au_knight_show_info.indexOf(index)
    if index == nil or not recruit_au_knight_show_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_au_knight_show_info._data[index]}, m)
end



---
--@return @class record_recruit_au_knight_show_info
function recruit_au_knight_show_info.get(id)
    
    return recruit_au_knight_show_info.indexOf(__index_id[ id ])
     
end



function recruit_au_knight_show_info.set(id, key, value)
    local record = recruit_au_knight_show_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_au_knight_show_info.get_index_data()
    return __index_id 
end

return  recruit_au_knight_show_info 