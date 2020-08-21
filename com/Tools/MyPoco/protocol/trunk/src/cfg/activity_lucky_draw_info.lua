---@classdef record_activity_lucky_draw_info
local record_activity_lucky_draw_info = {}


record_activity_lucky_draw_info.id = 0--id
record_activity_lucky_draw_info.activity_type = 0--活动类型
record_activity_lucky_draw_info.lucky_value = 0--每次翻牌消耗幸运
record_activity_lucky_draw_info.lucky_reward = 0--奖池内容
record_activity_lucky_draw_info.big_num = 0--大奖数量
record_activity_lucky_draw_info.small_num = 0--小奖数量
record_activity_lucky_draw_info.pro_1 = 0--第一次概率
record_activity_lucky_draw_info.pro_2 = 0--第二次概率
record_activity_lucky_draw_info.pro_3 = 0--第三次概率
record_activity_lucky_draw_info.pro_4 = 0--第四次概率
record_activity_lucky_draw_info.pro_5 = 0--第五次概率

local activity_lucky_draw_info = {
   _data = {   
    [1] = {90006,9,60,90006,1,5,50,50,100,150,650,},
    }
}

local __index_id = {   
    [90006] = 1,
}

local __key_map = { 
    id = 1,
    activity_type = 2,
    lucky_value = 3,
    lucky_reward = 4,
    big_num = 5,
    small_num = 6,
    pro_1 = 7,
    pro_2 = 8,
    pro_3 = 9,
    pro_4 = 10,
    pro_5 = 11,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_lucky_draw_info")

        return t._raw[__key_map[k]]
    end
}


function activity_lucky_draw_info.getLength()
    return #activity_lucky_draw_info._data
end



function activity_lucky_draw_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_lucky_draw_info
function activity_lucky_draw_info.indexOf(index)
    if index == nil or not activity_lucky_draw_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_lucky_draw_info._data[index]}, m)
end



---
--@return @class record_activity_lucky_draw_info
function activity_lucky_draw_info.get(id)
    
    return activity_lucky_draw_info.indexOf(__index_id[ id ])
     
end



function activity_lucky_draw_info.set(id, key, value)
    local record = activity_lucky_draw_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_lucky_draw_info.get_index_data()
    return __index_id 
end

return  activity_lucky_draw_info 