---@classdef record_level_up_info
local record_level_up_info = {}


record_level_up_info.id = 0--id
record_level_up_info.level = 0--等级
record_level_up_info.reward_type_1 = 0--奖励类型1
record_level_up_info.reward_value_1 = 0--奖励类型值1
record_level_up_info.reward_size_1 = 0--奖励数量1
record_level_up_info.reward_type_2 = 0--奖励类型2
record_level_up_info.reward_value_2 = 0--奖励类型值2
record_level_up_info.reward_size_2 = 0--奖励数量2
record_level_up_info.reward_type_3 = 0--奖励类型3
record_level_up_info.reward_value_3 = 0--奖励类型值3
record_level_up_info.reward_size_3 = 0--奖励数量3
record_level_up_info.reward_type_4 = 0--奖励类型4
record_level_up_info.reward_value_4 = 0--奖励类型值4
record_level_up_info.reward_size_4 = 0--奖励数量4
record_level_up_info.show_level = 0--预览等级
record_level_up_info.spine = 0--spine形象
record_level_up_info.spine_2 = 0--6kw_spine形象
record_level_up_info.spine_other = 0--马甲包
record_level_up_info.des =  ""--描述文字
record_level_up_info.route_id = 0--跳转
record_level_up_info.change1 =  ""--马甲包替换资源
record_level_up_info.count = 0--字段数

local level_up_info = {
   _data = {   
    [1] = {101,30,1,2,20,3,6,1,3,37,10,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [2] = {102,40,1,2,20,3,2004,1,3,14,50,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [3] = {103,50,1,2,20,3,2009,1,8,13030,3,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [4] = {104,60,1,2,120,3,51,3,3,56,100,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [5] = {105,70,1,2,120,3,22,20,3,2,200,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [6] = {106,80,1,2,700,3,2069,20,3,56,200,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [7] = {107,90,1,2,1000,3,6,10,3,2,300,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [8] = {108,100,1,2,1000,3,51,20,3,56,300,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [9] = {109,120,1,2,1000,3,2301,1,3,53,10,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [10] = {110,140,1,2,1000,3,2302,1,3,163,15,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [11] = {111,160,1,2,1000,3,2302,2,3,59,20,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [12] = {112,180,1,2,1000,3,2384,1,3,235,15,0,0,0,1,700130,100000,400050,"",52,"spine",1,},  
    [13] = {113,200,1,2,1000,3,2390,1,3,230,15,0,0,0,1,700130,100000,400050,"",52,"spine",1,},
    }
}

local __index_id = {   
    [101] = 1,  
    [102] = 2,  
    [103] = 3,  
    [104] = 4,  
    [105] = 5,  
    [106] = 6,  
    [107] = 7,  
    [108] = 8,  
    [109] = 9,  
    [110] = 10,  
    [111] = 11,  
    [112] = 12,  
    [113] = 13,
}

local __key_map = { 
    id = 1,
    level = 2,
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
    show_level = 15,
    spine = 16,
    spine_2 = 17,
    spine_other = 18,
    des = 19,
    route_id = 20,
    change1 = 21,
    count = 22,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_level_up_info")

        return t._raw[__key_map[k]]
    end
}


function level_up_info.getLength()
    return #level_up_info._data
end



function level_up_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_level_up_info
function level_up_info.indexOf(index)
    if index == nil or not level_up_info._data[index] then
        return nil
    end
    return setmetatable({_raw = level_up_info._data[index]}, m)
end



---
--@return @class record_level_up_info
function level_up_info.get(id)
    
    return level_up_info.indexOf(__index_id[ id ])
     
end



function level_up_info.set(id, key, value)
    local record = level_up_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function level_up_info.get_index_data()
    return __index_id 
end

return  level_up_info 