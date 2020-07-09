---@classdef record_richest_chequer_info
local record_richest_chequer_info = {}


record_richest_chequer_info.board = 0--棋盘编号
record_richest_chequer_info.order = 0--格子顺序
record_richest_chequer_info.value = 0--价值
record_richest_chequer_info.title_type = 0--格子类型
record_richest_chequer_info.event_id = 0--事件id
record_richest_chequer_info.reward_type = 0--奖励类型1
record_richest_chequer_info.reward_value = 0--奖励类型值1
record_richest_chequer_info.reward_size = 0--奖励数量1
record_richest_chequer_info.floor_show = 0--地板展示
record_richest_chequer_info.item_show = 0--道具展示
record_richest_chequer_info.show_effect = 0--特效展示标记

local richest_chequer_info = {
   _data = {   
    [1] = {1,1,1,1,0,3,164,1,201,0,1,},  
    [2] = {1,2,2,1,0,3,165,2,203,0,0,},  
    [3] = {1,3,3,1,0,3,166,3,203,0,0,},  
    [4] = {1,4,4,1,0,3,165,5,203,0,0,},  
    [5] = {1,5,5,2,1,0,0,0,202,0,0,},  
    [6] = {1,6,6,1,0,3,166,10,203,0,0,},  
    [7] = {1,7,7,1,0,3,165,3,203,0,0,},  
    [8] = {1,8,8,1,0,3,166,2,203,0,0,},  
    [9] = {1,9,9,1,0,999,0,6666,201,0,2,},  
    [10] = {1,10,10,1,0,3,165,3,203,0,0,},  
    [11] = {1,11,11,1,0,3,165,1,203,0,0,},  
    [12] = {1,12,12,1,0,3,166,5,203,0,0,},  
    [13] = {1,13,13,2,2,0,0,0,202,0,0,},  
    [14] = {1,14,14,1,0,3,165,10,203,0,0,},  
    [15] = {1,15,15,1,1,999,0,66,203,0,0,},  
    [16] = {1,16,16,1,2,3,166,1,203,0,0,},  
    [17] = {2,1,15,1,0,3,164,1,201,0,1,},  
    [18] = {2,2,8,1,0,3,165,2,203,0,0,},  
    [19] = {2,3,7,1,0,3,166,3,203,0,0,},  
    [20] = {2,4,13,1,0,3,165,5,203,0,0,},  
    [21] = {2,5,5,2,1,0,0,0,202,0,0,},  
    [22] = {2,6,12,1,0,3,166,10,203,0,0,},  
    [23] = {2,7,10,1,0,3,165,3,203,0,0,},  
    [24] = {2,8,3,1,0,3,166,2,203,0,0,},  
    [25] = {2,9,15,1,0,999,0,6666,201,0,2,},  
    [26] = {2,10,11,1,0,3,165,3,203,0,0,},  
    [27] = {2,11,4,1,0,3,165,1,203,0,0,},  
    [28] = {2,12,9,1,0,3,166,5,203,0,0,},  
    [29] = {2,13,6,2,2,0,0,0,202,0,0,},  
    [30] = {2,14,14,1,0,3,165,10,203,0,0,},  
    [31] = {2,15,1,1,1,999,0,66,203,0,0,},  
    [32] = {2,16,2,1,2,3,166,1,203,0,0,},
    }
}

local __index_board_order = {   
    ["1_1"] = 1,  
    ["1_2"] = 2,  
    ["1_3"] = 3,  
    ["1_4"] = 4,  
    ["1_5"] = 5,  
    ["1_6"] = 6,  
    ["1_7"] = 7,  
    ["1_8"] = 8,  
    ["1_9"] = 9,  
    ["1_10"] = 10,  
    ["1_11"] = 11,  
    ["1_12"] = 12,  
    ["1_13"] = 13,  
    ["1_14"] = 14,  
    ["1_15"] = 15,  
    ["1_16"] = 16,  
    ["2_1"] = 17,  
    ["2_2"] = 18,  
    ["2_3"] = 19,  
    ["2_4"] = 20,  
    ["2_5"] = 21,  
    ["2_6"] = 22,  
    ["2_7"] = 23,  
    ["2_8"] = 24,  
    ["2_9"] = 25,  
    ["2_10"] = 26,  
    ["2_11"] = 27,  
    ["2_12"] = 28,  
    ["2_13"] = 29,  
    ["2_14"] = 30,  
    ["2_15"] = 31,  
    ["2_16"] = 32,
}

local __key_map = { 
    board = 1,
    order = 2,
    value = 3,
    title_type = 4,
    event_id = 5,
    reward_type = 6,
    reward_value = 7,
    reward_size = 8,
    floor_show = 9,
    item_show = 10,
    show_effect = 11,
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
        
        assert(__key_map[k], "cannot find " .. k .. " in record_richest_chequer_info")

        return t._raw[__key_map[k]]
    end
}


function richest_chequer_info.getLength()
    return #richest_chequer_info._data
end



function richest_chequer_info.hasKey(k)
  if __key_map[k] == nil then
    return false
  else
    return true
  end
end


---
--@return @class record_richest_chequer_info
function richest_chequer_info.indexOf(index)
    if index == nil or not richest_chequer_info._data[index] then
        return nil
    end
    return setmetatable({_raw = richest_chequer_info._data[index]}, m)
end



---
--@return @class record_richest_chequer_info
function richest_chequer_info.get(board,order)
    
    local k = board .. '_' .. order
    return richest_chequer_info.indexOf(__index_board_order[k])
     
end



function richest_chequer_info.set(board,order, key, value)
    local record = richest_chequer_info.get(board,order)
    if record then
        local keyIndex = __key_map[key]
        if keyIndex then
            record._raw[keyIndex] = value
        end
    end
end




function richest_chequer_info.get_index_data()
    return __index_board_order 
end

return  richest_chequer_info 