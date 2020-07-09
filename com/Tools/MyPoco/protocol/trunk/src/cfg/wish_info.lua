---@classdef record_wish_info
local record_wish_info = {}


record_wish_info.id = 0--ID
record_wish_info.server_time = 0--开服天数
record_wish_info.level_down = 0--等级下限
record_wish_info.level_up = 0--等级上限
record_wish_info.fixed_award_type = 0--固定奖励类型
record_wish_info.fixed_award_value = 0--固定奖励类型值
record_wish_info.fixed_award_size = 0--固定奖励数量
record_wish_info.award_1_type = 0--奖励1类型
record_wish_info.award_1_value = 0--奖励1类型值
record_wish_info.award_1_size = 0--奖励1数量
record_wish_info.award_2_type = 0--奖励2类型
record_wish_info.award_2_value = 0--奖励2类型值
record_wish_info.award_2_size = 0--奖励2数量
record_wish_info.award_3_type = 0--奖励3类型
record_wish_info.award_3_value = 0--奖励3类型值
record_wish_info.award_3_size = 0--奖励3数量
record_wish_info.award_4_type = 0--奖励4类型
record_wish_info.award_4_value = 0--奖励4类型值
record_wish_info.award_4_size = 0--奖励4数量
record_wish_info.award_5_type = 0--奖励5类型
record_wish_info.award_5_value = 0--奖励5类型值
record_wish_info.award_5_size = 0--奖励5数量
record_wish_info.award_6_type = 0--奖励6类型
record_wish_info.award_6_value = 0--奖励6类型值
record_wish_info.award_6_size = 0--奖励6数量

local wish_info = {
   _data = {   
    [1] = {1,1,1,999,1,37,50,3,10,20,3,15,25,3,17,100,3,26,100,3,56,100,0,0,0,},
    }
}

local __index_id = {   
    [1] = 1,
}

local __key_map = { 
    id = 1,
    server_time = 2,
    level_down = 3,
    level_up = 4,
    fixed_award_type = 5,
    fixed_award_value = 6,
    fixed_award_size = 7,
    award_1_type = 8,
    award_1_value = 9,
    award_1_size = 10,
    award_2_type = 11,
    award_2_value = 12,
    award_2_size = 13,
    award_3_type = 14,
    award_3_value = 15,
    award_3_size = 16,
    award_4_type = 17,
    award_4_value = 18,
    award_4_size = 19,
    award_5_type = 20,
    award_5_value = 21,
    award_5_size = 22,
    award_6_type = 23,
    award_6_value = 24,
    award_6_size = 25,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_wish_info")

        return t._raw[__key_map[k]]
    end
}


function wish_info.getLength()
    return #wish_info._data
end



function wish_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_wish_info
function wish_info.indexOf(index)
    if index == nil or not wish_info._data[index] then
        return nil
    end
    return setmetatable({_raw = wish_info._data[index]}, m)
end



---
--@return @class record_wish_info
function wish_info.get(id)
    
    return wish_info.indexOf(__index_id[ id ])
     
end



function wish_info.set(id, key, value)
    local record = wish_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function wish_info.get_index_data()
    return __index_id 
end

return  wish_info 