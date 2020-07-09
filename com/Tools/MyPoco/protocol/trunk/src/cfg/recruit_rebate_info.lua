---@classdef record_recruit_rebate_info
local record_recruit_rebate_info = {}


record_recruit_rebate_info.id = 0--id
record_recruit_rebate_info.num = 0--次数
record_recruit_rebate_info.reward_type_1 = 0--奖励类型1
record_recruit_rebate_info.reward_value_1 = 0--奖励类型值1
record_recruit_rebate_info.reward_size_1 = 0--奖励数量1
record_recruit_rebate_info.reward_type_2 = 0--奖励类型2
record_recruit_rebate_info.reward_value_2 = 0--奖励类型值2
record_recruit_rebate_info.reward_size_2 = 0--奖励数量2
record_recruit_rebate_info.reward_type_3 = 0--奖励类型3
record_recruit_rebate_info.reward_value_3 = 0--奖励类型值3
record_recruit_rebate_info.reward_size_3 = 0--奖励数量3
record_recruit_rebate_info.reward_type_4 = 0--奖励类型4
record_recruit_rebate_info.reward_value_4 = 0--奖励类型值4
record_recruit_rebate_info.reward_size_4 = 0--奖励数量4
record_recruit_rebate_info.show_num = 0--预览次数
record_recruit_rebate_info.spine = 0--spine形象
record_recruit_rebate_info.des =  ""--描述文字
record_recruit_rebate_info.icon = 0--展示icon
record_recruit_rebate_info.route_id = 0--跳转

local recruit_rebate_info = {
   _data = {   
    [1] = {1,5,3,14,50,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},  
    [2] = {2,10,3,14,50,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},  
    [3] = {3,20,3,2068,1,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},  
    [4] = {4,30,3,2010,2,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},  
    [5] = {5,40,3,15,100,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},  
    [6] = {6,50,3,2056,1,0,0,0,0,0,0,0,0,0,0,400050,"",1,3,},
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
    num = 2,
    reward_type_1 = 3,
    reward_value_1 = 4,
    reward_size_1 = 5,
    reward_type_2 = 6,
    reward_value_2 = 7,
    reward_size_2 = 8,
    reward_type_3 = 9,
    reward_value_3 = 10,
    reward_size_3 = 11,
    reward_type_4 = 12,
    reward_value_4 = 13,
    reward_size_4 = 14,
    show_num = 15,
    spine = 16,
    des = 17,
    icon = 18,
    route_id = 19,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_recruit_rebate_info")

        return t._raw[__key_map[k]]
    end
}


function recruit_rebate_info.getLength()
    return #recruit_rebate_info._data
end



function recruit_rebate_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_recruit_rebate_info
function recruit_rebate_info.indexOf(index)
    if index == nil or not recruit_rebate_info._data[index] then
        return nil
    end
    return setmetatable({_raw = recruit_rebate_info._data[index]}, m)
end



---
--@return @class record_recruit_rebate_info
function recruit_rebate_info.get(id)
    
    return recruit_rebate_info.indexOf(__index_id[ id ])
     
end



function recruit_rebate_info.set(id, key, value)
    local record = recruit_rebate_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function recruit_rebate_info.get_index_data()
    return __index_id 
end

return  recruit_rebate_info 