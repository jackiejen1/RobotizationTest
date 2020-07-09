---@classdef record_knight_book_competition_info
local record_knight_book_competition_info = {}


record_knight_book_competition_info.id = 0--ID
record_knight_book_competition_info.activity_id = 0--活动ID
record_knight_book_competition_info.target = 0--目标类型
record_knight_book_competition_info.num = 0--目标类型值
record_knight_book_competition_info.reward_type_1 = 0--奖励1类型
record_knight_book_competition_info.reward_value_1 = 0--奖励1类型值
record_knight_book_competition_info.reward_size_1 = 0--奖励1数量
record_knight_book_competition_info.reward_type_2 = 0--奖励2类型
record_knight_book_competition_info.reward_value_2 = 0--奖励2类型值
record_knight_book_competition_info.reward_size_2 = 0--奖励2数量
record_knight_book_competition_info.reward_type_3 = 0--奖励3类型
record_knight_book_competition_info.reward_value_3 = 0--奖励3类型值
record_knight_book_competition_info.reward_size_3 = 0--奖励3数量
record_knight_book_competition_info.reward_type_4 = 0--奖励4类型
record_knight_book_competition_info.reward_value_4 = 0--奖励4类型值
record_knight_book_competition_info.reward_size_4 = 0--奖励4数量
record_knight_book_competition_info.route_id = 0--跳转接口

local knight_book_competition_info = {
   _data = {   
    [1] = {1,100000,8,100,2,400140,15,3,2,50,0,0,0,0,0,0,34,},  
    [2] = {2,100000,8,200,2,400140,15,3,2,50,0,0,0,0,0,0,34,},  
    [3] = {3,100000,8,300,2,400140,15,3,2,100,0,0,0,0,0,0,34,},  
    [4] = {4,100000,8,400,2,400150,15,3,2,100,0,0,0,0,0,0,34,},  
    [5] = {5,100000,8,500,2,400150,15,3,2,100,0,0,0,0,0,0,34,},  
    [6] = {6,100000,8,600,2,400150,15,3,2,100,0,0,0,0,0,0,34,},  
    [7] = {7,100000,8,700,3,21,30,3,37,10,3,2,150,0,0,0,34,},  
    [8] = {8,100000,8,800,3,21,50,3,37,20,3,2,150,0,0,0,34,},  
    [9] = {9,100001,8,100,2,400140,30,3,2,50,0,0,0,0,0,0,34,},  
    [10] = {10,100001,8,200,2,400140,50,3,2,100,0,0,0,0,0,0,34,},  
    [11] = {11,100001,8,300,2,400150,30,3,2,150,0,0,0,0,0,0,34,},  
    [12] = {12,100001,8,400,2,400150,50,3,2,200,0,0,0,0,0,0,34,},  
    [13] = {13,100001,8,500,3,21,50,3,2,250,0,0,0,0,0,0,34,},  
    [14] = {14,100001,8,600,3,21,80,3,2,300,0,0,0,0,0,0,34,},  
    [15] = {15,100001,8,700,3,22,30,3,37,30,3,2,300,0,0,0,34,},  
    [16] = {16,100001,8,800,3,22,50,3,37,50,3,2,300,0,0,0,34,},
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
    [12] = 12,  
    [13] = 13,  
    [14] = 14,  
    [15] = 15,  
    [16] = 16,
}

local __key_map = { 
    id = 1,
    activity_id = 2,
    target = 3,
    num = 4,
    reward_type_1 = 5,
    reward_value_1 = 6,
    reward_size_1 = 7,
    reward_type_2 = 8,
    reward_value_2 = 9,
    reward_size_2 = 10,
    reward_type_3 = 11,
    reward_value_3 = 12,
    reward_size_3 = 13,
    reward_type_4 = 14,
    reward_value_4 = 15,
    reward_size_4 = 16,
    route_id = 17,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_knight_book_competition_info")

        return t._raw[__key_map[k]]
    end
}


function knight_book_competition_info.getLength()
    return #knight_book_competition_info._data
end



function knight_book_competition_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_knight_book_competition_info
function knight_book_competition_info.indexOf(index)
    if index == nil or not knight_book_competition_info._data[index] then
        return nil
    end
    return setmetatable({_raw = knight_book_competition_info._data[index]}, m)
end



---
--@return @class record_knight_book_competition_info
function knight_book_competition_info.get(id)
    
    return knight_book_competition_info.indexOf(__index_id[ id ])
     
end



function knight_book_competition_info.set(id, key, value)
    local record = knight_book_competition_info.get(id)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function knight_book_competition_info.get_index_data()
    return __index_id 
end

return  knight_book_competition_info 