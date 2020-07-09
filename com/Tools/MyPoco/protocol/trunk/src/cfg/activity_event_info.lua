---@classdef record_activity_event_info
local record_activity_event_info = {}


record_activity_event_info.id = 0--事件编号
record_activity_event_info.type = 0--事件类型
record_activity_event_info.icon = 0--事件图标
record_activity_event_info.name =  ""--事件名称
record_activity_event_info.time = 0--事件持续时间
record_activity_event_info.parameter = 0--参数
record_activity_event_info.title =  ""--说明文字
record_activity_event_info.reward_type_1 = 0--选项1奖励类型
record_activity_event_info.reward_value_1 = 0--选项1奖励值
record_activity_event_info.reward_size_1 = 0--选项1奖励数量
record_activity_event_info.reward_type_2 = 0--选项2奖励类型
record_activity_event_info.reward_value_2 = 0--选项2奖励值
record_activity_event_info.reward_size_2 = 0--选项2奖励数量
record_activity_event_info.reward_type_3 = 0--选项3奖励类型
record_activity_event_info.reward_value_3 = 0--选项3奖励值
record_activity_event_info.reward_size_3 = 0--选项3奖励数量

local activity_event_info = {
   _data = {   
    [1] = {1,1,101,"决胜猜拳",10800,0,"赢了我就能获得元宝，输了的话……本喵喵自然也是要安慰一下的！",999,0,300,999,0,200,999,0,150,},  
    [2] = {2,2,102,"三国问答",10800,1,"赢了我就能获得元宝，输了的话……本喵喵自然也是要安慰一下的！",999,0,300,999,0,200,999,0,150,},
    }
}

local __index_id = {   
    [1] = 1,  
    [2] = 2,
}

local __key_map = { 
    id = 1,
    type = 2,
    icon = 3,
    name = 4,
    time = 5,
    parameter = 6,
    title = 7,
    reward_type_1 = 8,
    reward_value_1 = 9,
    reward_size_1 = 10,
    reward_type_2 = 11,
    reward_value_2 = 12,
    reward_size_2 = 13,
    reward_type_3 = 14,
    reward_value_3 = 15,
    reward_size_3 = 16,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_activity_event_info")

        return t._raw[__key_map[k]]
    end
}


function activity_event_info.getLength()
    return #activity_event_info._data
end



function activity_event_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_activity_event_info
function activity_event_info.indexOf(index)
    if index == nil or not activity_event_info._data[index] then
        return nil
    end
    return setmetatable({_raw = activity_event_info._data[index]}, m)
end



---
--@return @class record_activity_event_info
function activity_event_info.get(id)
    
    return activity_event_info.indexOf(__index_id[ id ])
     
end



function activity_event_info.set(id, key, value)
    local record = activity_event_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function activity_event_info.get_index_data()
    return __index_id 
end

return  activity_event_info 